//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Buscador de información por nombre (aplica otros argumentos) retorna c_codigo~r~n    Recomendación: Nivel Experto - Tener cuidado~r~n*/
forward
global type w_mant_gen_buscar_x_nombre from wa_response
end type
end forward

global type w_mant_gen_buscar_x_nombre from wa_response
integer width = 3017
integer height = 1624
string title = "Buscar en Catálogo"
end type
global w_mant_gen_buscar_x_nombre w_mant_gen_buscar_x_nombre

type variables

Boolean	ib_emp = False
Int		ii_limit = 0
String	is_tabla, is_filter

end variables

forward prototypes
public subroutine wf_buscar ()
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

//CVILELA 26-Ago-2021
If ib_emp Then
	dw_list.Retrieve( gs_emp, ls_texto )
Else
	dw_list.Retrieve( ls_texto, gs_emp )
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

on w_mant_gen_buscar_x_nombre.create
call super::create
end on

on w_mant_gen_buscar_x_nombre.destroy
call super::destroy
end on

event open;call super::open;// Autor: César Vilela R.
// Ventana invocada con un valor, y el val lo recibe is_tabla
// CVILELA: 17/01/2017 - Soporta Filtros "SetFilter" antes de mostrar los datos
Boolean	lb_stringparm = True


is_tabla = Message.StringParm

If is_tabla = '' Then
	istr_parm = Message.PowerObjectParm
	is_tabla = istr_parm.s_cad[ 1]
	is_filter = istr_parm.s_cad[ 3]
	lb_stringparm = False
End If

dw_1.InsertRow( 0 )

Choose Case is_tabla

	Case 'OTR' //23/Sep/2021
		This.Title = 'Búsqueda de Otros Tipos de Cobro'
		dw_list.dataobject = 'd_mant_caj_cta_cont_otros_basica'
		ib_emp = True
		
	Case 'CLI' //25/Ago/2021
		This.Title = 'Búsqueda de Clientes'
		dw_list.dataobject = 'd_mant_gen_cliente_basica'
		ib_emp = True
		ii_limit = 3
		
   Case 'GIR'
		This.Title = 'Búsqueda de Giros/Actividad Económica'
		dw_list.dataobject = 'd_mant_gen_giro_basica'		
		
   Case 'PRX'
		This.Title = 'Búsqueda de Productos de Comercio'
		dw_list.dataobject = 'd_mant_cex_producto_basica'		
   Case 'CXP'
		This.Title = 'Búsqueda de Cotizaciones por Proveedor'
		dw_list.dataobject = 'd_arch_com_cotizacionxprov'		
	Case 'CTA'
		This.Title = 'Búsqueda de Cuentas Contables'
		dw_list.dataobject = 'd_mant_con_cuenta_basica'
		ib_emp = True
	Case 'EMP'
		This.Title = 'Búsqueda de Empresas'
		dw_list.dataobject = 'd_mant_gen_empresa_basica'
	Case 'CLIPRV',  'PRV', 'CLI'
		This.Title = 'Búsqueda de Clientes/Proveedores'
		dw_list.dataobject = 'd_mant_com_proveedor_basica'
		
End Choose


dw_list.SetTransObject (SqlCa)

If ProfileString( gs_ini, gs_usuario, 'Buscar', '0' ) = '0' Then
	dw_1.Object.cbx_1[ 1] = '0'
End If

If Not lb_stringparm Then	
	If Not istr_parm.s_cad[ 3] = '' Then
		dw_list.SetFilter( istr_parm.s_cad[ 3] )
		dw_list.Filter( )
	End If
	
	dw_1.Object.v_Texto[ 1] = istr_parm.s_cad[ 2]
	If Not istr_parm.s_cad[ 2] = '' Or istr_parm.s_cad[ 4] = 'RET' Then
		wf_Buscar( )
	Else
		dw_1.SetFocus( )
	End If
End If

f_SetDWColor( dw_list )
dw_list.TriggerEvent( Constructor! )
/*dw_list.Object.DataWindow.Header.Color = f_Gen_Color( 'tb' )
dw_list.Object.DataWindow.Header.Height = 76
dw_list.Object.DataWindow.Detail.Height = 76

This.BackColor = f_Gen_Color( 'm' )
*/



end event

type dw_list from wa_response`dw_list within w_mant_gen_buscar_x_nombre
integer x = 146
integer y = 340
integer width = 2752
integer height = 976
integer taborder = 30
boolean border = false
end type

event dw_list::doubleclicked;
cb_aceptar.TriggerEvent(Clicked!)

end event

event dw_list::getfocus;cb_aceptar.Default = True
end event

event dw_list::constructor;call super::constructor;f_SetDWPositionY( This, ii_posdetY )
end event

type dw_1 from wa_response`dw_1 within w_mant_gen_buscar_x_nombre
integer width = 3040
integer height = 1360
string dataobject = "d_mant_gen_buscar_x_nombre"
end type

event dw_1::getfocus;call super::getfocus;
cb_aceptar.Default = False
end event

event dw_1::itemchanged;call super::itemchanged;Choose Case dwo.Name
		
	Case 'cbx_1' 
		If data = '1' Then
			SetProfileString( gs_ini, gs_usuario, 'Buscar', '1' )
		Else
			SetProfileString( gs_ini, gs_usuario, 'Buscar', '0' )
		End If
		
	Case 'v_texto'
		wf_Buscar( )
		
End Choose
end event

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_buscar'
		wf_Buscar( )
		
End Choose
		
end event

type cb_cancelar from wa_response`cb_cancelar within w_mant_gen_buscar_x_nombre
integer x = 2510
integer y = 1412
integer taborder = 50
end type

type cb_aceptar from wa_response`cb_aceptar within w_mant_gen_buscar_x_nombre
integer x = 2144
integer y = 1412
integer taborder = 40
boolean enabled = true
end type

event cb_aceptar::clicked;String ls_code


If dw_list.RowCount() <= 0 Then
	gw_frame.SetMicroHelp( 'No existen registros para seleccionar.' )
	Return
End If

ls_code = dw_list.Object.c_codigo[ dw_list.GetRow( ) ]

CloseWithReturn( Parent, ls_code )
end event

