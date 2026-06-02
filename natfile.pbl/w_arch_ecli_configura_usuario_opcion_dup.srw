//objectcomments Autor: César Viela~r~nFunción: Duplicar opciones de un usuario a otro ( copia )~r~nRecomendación: No Modificar - Nivel Experto
forward
global type w_arch_ecli_configura_usuario_opcion_dup from wa_response
end type
end forward

global type w_arch_ecli_configura_usuario_opcion_dup from wa_response
integer width = 2011
integer height = 1312
string title = "Copiar opciones"
end type
global w_arch_ecli_configura_usuario_opcion_dup w_arch_ecli_configura_usuario_opcion_dup

on w_arch_ecli_configura_usuario_opcion_dup.create
call super::create
end on

on w_arch_ecli_configura_usuario_opcion_dup.destroy
call super::destroy
end on

event open;call super::open;DataWindowChild	ldwc_x

dw_1.InsertRow(0)

dw_1.GetChild( 'c_codori_usu', ldwc_x )
ldwc_x.SetTransObject( SqlCa )
ldwc_x.Retrieve( )

ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'c_codigo_usu', '' )
ldwc_x.SetItem( 1, 'v_nombre_usu', '- Seleccione Usuario Origen -' )

dw_1.GetChild( 'c_coddes_usu', ldwc_x )
ldwc_x.SetTransObject( SqlCa )
ldwc_x.Retrieve( )

ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'c_codigo_usu', '' )
ldwc_x.SetItem( 1, 'v_nombre_usu', '- Seleccione Usuario Destino -' )
ldwc_x.SetFilter( 'c_codigo_usu = ""' )
ldwc_x.Filter( )

dw_1.Object.c_codori_usu[ 1] = ''

dw_1.AcceptText( )
end event

type dw_list from wa_response`dw_list within w_arch_ecli_configura_usuario_opcion_dup
boolean visible = false
integer x = 37
integer y = 444
integer width = 178
integer height = 108
integer taborder = 0
boolean enabled = false
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_1 from wa_response`dw_1 within w_arch_ecli_configura_usuario_opcion_dup
integer width = 2089
integer height = 1072
string dataobject = "d_arch_ecli_configura_usuario_opcion_dup"
end type

event dw_1::itemchanged;call super::itemchanged;DataWindowChild	ldwc_x
String	ls_tma


Choose Case dwo.Name
	Case 'c_codori_usu'
		
		Select	c_codigo_tma
		Into		:ls_tma
		From		genlogin
		Where		c_codigo_usu = :data ;
		
		This.Object.c_codigo_tma[ row] = ls_tma
		This.Object.c_coddes_usu[ row] = ''
		This.GetChild( 'c_coddes_usu', ldwc_x )
		ldwc_x.SetFilter( 'Not c_codigo_usu = "' + data + '"' )
		ldwc_x.Filter( )
		ldwc_x.Sort( )
		
	Case 'c_coddes_usu'
		
		
End Choose
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_ecli_configura_usuario_opcion_dup
integer x = 1362
integer y = 1104
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_ecli_configura_usuario_opcion_dup
integer x = 983
integer y = 1104
boolean enabled = true
end type

event cb_aceptar::clicked;String	ls_ori, ls_des, ls_add, ls_tma, &
			ls_usp, ls_sql, ls_exe


dw_1.AcceptText( )

ls_ori = Upper( f_Trim( dw_1.Object.c_codori_usu[ 1] ) )
ls_des = Upper( f_Trim( dw_1.Object.c_coddes_usu[ 1] ) )
ls_add = Upper( f_Trim( dw_1.Object.c_add[ 1] ) )
ls_tma = Upper( f_Trim( dw_1.Object.c_tma[ 1] ) )

If ls_ori = '' Or ls_des = '' Then 
	MessageBox( Title, 'Debe de seleccionar el Usuario Origen y el Usuario Destino de las opciones a Copiar', Exclamation! )
	dw_1.SetFocus( )
	Return
End If

If f_IsOracle( ) Then
	ls_usp = 'usp_gen_opciones_x_usu_copiar'
	ls_sql = 'Execute ' + ls_usp + '( '
	ls_sql = ls_sql +	"as_emp => '" + gs_emp + "', " + &
							"as_ori => '" + ls_ori + "', " + &
							"as_des => '" + ls_des + "', " + &
							"as_add => '" + ls_add + "', " + &
							"as_tma => '" + ls_tma + "'  ) " 
Else
	ls_usp = 'usp_gen_opciones_x_usu_duplicar'
	ls_sql = 'Execute ' + ls_usp + ' '
	ls_sql = ls_sql +	'@as_emp = "' + gs_emp + '", ' + &
							'@as_ori = "' + ls_ori + '", ' + &
							'@as_des = "' + ls_des + '", ' + &
							'@as_add = "' + ls_add + '", ' + &
							'@as_tma = "' + ls_tma + '" ' 
End If
ls_exe = ls_sql 
	
SetPointer( HourGlass! )
Execute Immediate :ls_exe Using SqlCa ;
		
If f_SqlError (SqlCa, 'Error al ejecutar el "Execute ' + ls_usp + '".') = - 1 Then
	RollBack Using SqlCa ;
	SetPointer( Arrow! )
	Return 
End If

Commit Using SqlCa ;
CloseWithReturn( Parent, 'OK' )
end event

