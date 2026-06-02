//objectcomments /* Autor: Cesar Vilela ~r~n    Recomendación: Nivel Experto - Tener cuidado~r~n*/
forward
global type w_mant_cfg_correos_buscar_x_nombre from w_mant_gen_buscar_x_nombre
end type
end forward

global type w_mant_cfg_correos_buscar_x_nombre from w_mant_gen_buscar_x_nombre
end type
global w_mant_cfg_correos_buscar_x_nombre w_mant_cfg_correos_buscar_x_nombre

forward prototypes
public subroutine wf_buscar ()
public subroutine wf_setdataobject (string as_tabla)
end prototypes

public subroutine wf_buscar ();Long ll_car, i, ll_row
String	ls_texto, ls_cbx, ls_filter, ls_txt


dw_1.AcceptText( )

ls_txt = f_Trim( dw_1.Object.v_texto[ 1] )
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

If ls_txt = '' Then
	dw_list.Filter( '' )
Else
	dw_list.Filter( '(Nombre Like "' + ls_texto + '") Or (Correo Like "' + ls_texto + '")' )
End If

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

on w_mant_cfg_correos_buscar_x_nombre.create
call super::create
end on

on w_mant_cfg_correos_buscar_x_nombre.destroy
call super::destroy
end on

event open;
Int	li_cod, li_nil

li_cod = f_Zero( Message.Doubleparm )

This.BackColor = f_Gen_Color( 'm' )
dw_1.InsertRow(0)

SetNull( li_nil )
dw_list.Retrieve( li_cod, li_nil, 'BUS' )
end event

type dw_list from w_mant_gen_buscar_x_nombre`dw_list within w_mant_cfg_correos_buscar_x_nombre
string dataobject = "d_mant_cfg_correos_buscar_x_nombre_det"
end type

type dw_1 from w_mant_gen_buscar_x_nombre`dw_1 within w_mant_cfg_correos_buscar_x_nombre
end type

type cb_cancelar from w_mant_gen_buscar_x_nombre`cb_cancelar within w_mant_cfg_correos_buscar_x_nombre
end type

type cb_aceptar from w_mant_gen_buscar_x_nombre`cb_aceptar within w_mant_cfg_correos_buscar_x_nombre
end type

event cb_aceptar::clicked;
String ls_code


If dw_list.RowCount() <= 0 Then
	gw_frame.SetMicroHelp( 'No existen registros para seleccionar.' )
	Return
End If

Destroy istr_parm.ds_dat[ 1]
f_CreateDS( istr_parm.ds_dat[ 1], dw_list.DataObject, SqlCa )


istr_parm.ds_dat[ 1].Reset( )
dw_list.RowsCopy( istr_parm.ds_dat[ 1] )

CloseWithReturn( Parent, istr_parm.ds_dat[ 1] )
Message.Stringparm = 'OK'

end event

