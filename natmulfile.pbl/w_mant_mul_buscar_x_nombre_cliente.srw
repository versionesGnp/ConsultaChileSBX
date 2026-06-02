//objectcomments /* Autor: Cesar Vilela ~r~n    Recomendación: Nivel Experto - Tener cuidado~r~n*/
forward
global type w_mant_mul_buscar_x_nombre_cliente from w_mant_gen_buscar_x_nombre
end type
end forward

global type w_mant_mul_buscar_x_nombre_cliente from w_mant_gen_buscar_x_nombre
string title = "Buscar"
end type
global w_mant_mul_buscar_x_nombre_cliente w_mant_mul_buscar_x_nombre_cliente

type variables



cliente cliente
end variables

forward prototypes
public subroutine wf_buscar ()
public subroutine wf_setdataobject (string as_tabla)
end prototypes

public subroutine wf_buscar ();Long ll_car, i, ll_row
String	ls_texto, ls_cbx, ls_filter, ls_txt


dw_1.AcceptText( )

ls_txt = UpperTrim( dw_1.Object.v_texto[ 1] )
ls_cbx = f_Trim( dw_1.Object.cbx_1[ 1] )

dw_1.SetColumn( 'v_texto' )
dw_1.SetFocus( )

If ii_limit > 0 And Len( ls_txt ) < ii_limit Then 	
	blEclipse.MessageBox( Title, 'Debe al menos ingresar ' + String( ii_limit ) + ' caracteres para poder continuar.', Exclamation! )
	Return
End If

ls_texto = ls_txt + '%'
ll_car = Len(ls_texto) - 1

If Not ls_cbx = '1' Then ls_texto = '%' + ls_texto
/*
If ls_txt = '' Then
	dw_list.Filter( '' )
Else
	dw_list.Filter( '(Nombre Like "' + ls_texto + '") Or (Correo Like "' + ls_texto + '")' )
End If
*/
Long		ll_nil
String	ls_nil

SetNull( ll_nil )
dw_list.Retrieve( ll_nil, ls_texto, 'BUSCAR', Cliente.DB )

ll_row = dw_list.RowCount( )
If ll_row = 0 Then
	gw_frame.SetMicroHelp( 'No se encontrarón registros coincidentes.' )
	If Len( ls_txt ) > 0 Then
		dw_1.SelectText ( 1, Len( ls_txt ) )
	End If
Else
	dw_list.SetFocus( )
End If


	


end subroutine

public subroutine wf_setdataobject (string as_tabla);
Return
end subroutine

on w_mant_mul_buscar_x_nombre_cliente.create
call super::create
end on

on w_mant_mul_buscar_x_nombre_cliente.destroy
call super::destroy
end on

event open;
Int	li_cod, li_nil
String	ls_nil


cliente = Message.PowerObjectParm
Message.Stringparm = ''

is_tabla = cliente.tabla

If LowerTrim( cliente.DataObject ) = '' Then 
	cliente.DataObject = 'd_arch_mul_cliente_basica'
End If

dw_list.DataObject = cliente.DataObject
dw_list.TriggerEvent( Constructor! )

This.BackColor = f_Gen_Color( 'm' )
dw_1.InsertRow(0)

SetNull( li_nil )
//dw_list.Retrieve( cliente.DB )
end event

type dw_list from w_mant_gen_buscar_x_nombre`dw_list within w_mant_mul_buscar_x_nombre_cliente
string dataobject = "d_arch_mul_cliente_basica"
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
end type

event dw_list::getfocus;//
end event

type dw_1 from w_mant_gen_buscar_x_nombre`dw_1 within w_mant_mul_buscar_x_nombre_cliente
end type

type cb_cancelar from w_mant_gen_buscar_x_nombre`cb_cancelar within w_mant_mul_buscar_x_nombre_cliente
end type

type cb_aceptar from w_mant_gen_buscar_x_nombre`cb_aceptar within w_mant_mul_buscar_x_nombre_cliente
boolean default = false
end type

event cb_aceptar::clicked;
String ls_code


If dw_list.RowCount() <= 0 Then
	gw_frame.SetMicroHelp( 'No existen registros para seleccionar.' )
	Return
End If

/*
Destroy istr_parm.ds_dat[ 1]
f_CreateDS( istr_parm.ds_dat[ 1], dw_list.DataObject, SqlCa )


istr_parm.ds_dat[ 1].Reset( )
dw_list.RowsCopy( istr_parm.ds_dat[ 1] )

CloseWithReturn( Parent, istr_parm.ds_dat[ 1] )
*/
Long	row

row = dw_list.GetRow()
Cliente.Rut = dw_list.Object.Rut[ row]
Cliente.DV = dw_list.Object.DV[ row]
Cliente.a_Paterno = dw_list.Object.a_Paterno[ row]
Cliente.a_Materno = dw_list.Object.a_Materno[ row]
Cliente.Nombre = dw_list.Object.Nombre[ row]

CloseWithReturn( Parent, Cliente )
Message.Stringparm = 'OK'


end event

