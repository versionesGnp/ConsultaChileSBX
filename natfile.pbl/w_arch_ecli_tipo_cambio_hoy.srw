//objectcomments /* Autor: César Vilela ~r~n    Función: Mostrar TC del día~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_tipo_cambio_hoy from wa_response
end type
end forward

global type w_arch_ecli_tipo_cambio_hoy from wa_response
integer width = 2674
integer height = 1352
string title = "Tipo de Cambio - Hoy"
boolean controlmenu = false
end type
global w_arch_ecli_tipo_cambio_hoy w_arch_ecli_tipo_cambio_hoy

on w_arch_ecli_tipo_cambio_hoy.create
call super::create
end on

on w_arch_ecli_tipo_cambio_hoy.destroy
call super::destroy
end on

event open;call super::open;DateTime	ld_null
Integer	li_rc
String	ls_xml, ls_error, ls_dia, ls_usp, ls_sql
 

f_GenProcesando( 'Obteniendo Tipo de Cambio vía WEB Service' )
ls_xml = f_GenDgieWS( )

f_GenProcesando( 'XML Parse' )
li_rc = XMLParseString( ls_xml ) //, ValNever!, ls_error, True, True, True )

f_GenProcesando( 'Guardando XML...' )

SetNull( ld_null )
dw_list.Retrieve( 0, gs_usuario, ld_null, ls_xml )
/*
ls_usp = 'usp_gen_bltipocambio_x_xml'
ls_sql = 'Execute ' + ls_usp 
ls_sql = ls_sql + " @an_cod = 0, @as_usu = '" + gs_usuario + "', @ad_dia = Null, " + &
			"@as_xml = N'" + ls_xml + "'" 

f_GenProcesando( 'Guardando XML...' )
Execute Immediate :ls_sql Using SqlCa ;

If f_SqlError (SqlCa, 'Error al ejecutar el "Execute ' + ls_usp + '".') = - 1 Then
	RollBack Using SqlCa ;
	f_GenProcesando( '' )
	SetPointer( Arrow! )
End If
*/
f_GenProcesando( '' )

Commit Using SqlCa;

dw_1.InsertRow(0)

end event

type dw_list from wa_response`dw_list within w_arch_ecli_tipo_cambio_hoy
integer x = 119
integer y = 184
integer width = 2414
integer height = 888
integer taborder = 0
string dataobject = "d_arch_ecli_tipo_cambio_hoy_det"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_1 from wa_response`dw_1 within w_arch_ecli_tipo_cambio_hoy
integer width = 2894
integer height = 1108
string dataobject = "d_arch_ecli_tipo_cambio_hoy"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_ecli_tipo_cambio_hoy
integer x = 2181
integer y = 1140
end type

event cb_cancelar::clicked;s_parm	lstr_parm


lstr_parm.s_cad[ 1] = ''
lstr_parm.n_num[ 1] = 0

CloseWithReturn( Parent, lstr_parm )
end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_ecli_tipo_cambio_hoy
integer x = 1801
integer y = 1140
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;DateTime	ld_tc
Decimal	ldc_tc
Long		ll_row
String	ls_ser, ls_usd
s_parm	lstr_parm


If dw_list.RowCount( ) <= 0 Then Return

dw_list.AcceptText( )

ll_row = dw_list.GetRow( )
ls_ser = dw_list.Object.c_serie_mda[ ll_row]
ldc_tc = dw_list.Object.n_tipcam_mda[ ll_row]
ld_tc = dw_list.Object.d_tipcam_mda[ ll_row]
ls_usd = dw_list.Object.c_dolar_mda[ ll_row]

If Not ls_usd = '1' Then
	MessageBox( Title, 'Debe seleccionar el Tipo de Cambio respecto al Dólar', Exclamation! )
	Return
End If

lstr_parm.s_cad[ 1] = ls_ser
lstr_parm.n_num[ 1] = ldc_tc
lstr_parm.d_fecha[ 1] = ld_tc

CloseWithReturn( Parent, lstr_parm )
end event

