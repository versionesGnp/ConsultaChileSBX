//objectcomments /* Autor: César Vilela~r~n    Función: BL Class Visual - Crea el sistema de menú en Eclipse~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type uo_gen_menu from nonvisualobject
end type
end forward

global type uo_gen_menu from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine of_out (string as_opc)
public subroutine of_con (string as_opc)
public subroutine of_gen (string as_opc)
public subroutine of_cfg (string as_opc)
public subroutine of_eye (string as_opc)
public subroutine of_exec (string as_opc)
public function integer of_qaccess (string as_opt, boolean ab_on)
public subroutine of_com (string as_opc)
public subroutine of_ban (string as_opc)
public subroutine of_afi (string as_opc)
public subroutine of_fin (string as_opc)
public subroutine of_aep (string as_opc)
public subroutine of_rhu (string as_opc)
public subroutine of_cex (string as_opc)
public subroutine of_gnp (string as_opc)
public subroutine of_tes (string as_opc)
public subroutine of_sap (string as_opc)
end prototypes

public subroutine of_out (string as_opc);
end subroutine

public subroutine of_con (string as_opc);
end subroutine

public subroutine of_gen (string as_opc);

If f_Gen( as_opc ) Then
	Return
End If


end subroutine

public subroutine of_cfg (string as_opc);String	ls_doc


Choose Case as_opc
	/* Configuración */
	Case '99115'
		OpenSheetWithParm( w_arch_ecli_configura_empresa, ls_doc, gw_frame, 1, Original! )
		
	Case '99116'
		
	Case '99117'
		OpenSheetWithParm( w_arch_ecli_configura_wks, ls_doc, gw_frame, 1, Original! )
		
	Case '99120'
		OpenSheetWithParm( w_arch_ecli_configura_usuario, ls_doc, gw_frame, 1, Original! )
		
	Case '99125'
		OpenSheetWithParm( w_arch_ecli_configura_usuario_opcion, ls_doc, gw_frame, 1, Original! )
		
	Case '99127'
		OpenSheetWithParm( w_arch_ecli_configura_usuario_empresa, ls_doc, gw_frame, 1, Original! )
		
	Case '99129'
		OpenSheet( w_arch_ecli_usuario_x_dep, gw_frame, 1, Original! )
		
	Case '99130'
		OpenSheet( w_arch_gen_configura_mail, gw_frame, 1, Original! )
		
	Case '99140'
		OpenSheet( w_mant_cfg_correos, gw_frame, 1, Original! )
		
	Case '99143'
		OpenSheet( w_mant_cfg_correos_cta, gw_frame, 1, Original! )
		
	Case '99135'
		OpenSheetWithParm( w_arch_ecli_configura_iva, ls_doc, gw_frame, 1, Original! )
		
	Case '99160'
		OpenSheetWithParm( w_arch_ecli_configura, ls_doc, gw_frame, 1, Original! )
		
End Choose

Return
end subroutine

public subroutine of_eye (string as_opc);
end subroutine

public subroutine of_exec (string as_opc);/* Executar Módulos */
//of_Exec( as_opc )
String	ls_nom

If f_IsOracle( ) Then
	Select	v_nombre_opc
	Into		:ls_nom
	From		genopcion
	Where		c_codigo_opc = :as_opc ;
End If
gw_frame.SetMicroHelp( 'Abriendo ' + ls_nom )
		
Choose Case Left( as_opc, 2 )
	Case '01'
		of_Out( as_opc )
		
	Case '02'
		of_AEP( as_opc )
		
	Case '03'
		of_Eye( as_opc )
		
	Case '05'
		of_Cex( as_opc )
		
	Case '06'
		of_Com( as_opc )
		
	Case '07'
		of_Ban( as_opc )
		
	Case '08'
		of_Afi( as_opc )
		
	Case '09'
		of_Con( as_opc )

	Case '10'
		of_Rhu( as_opc )
		
	Case '15'
		of_GNP( as_opc )
		
	Case '16', '18'
		of_Tes( as_opc )
		
	Case '19'
		of_Sap( as_opc )
		
	Case '90'
		of_Gen( as_opc )
		
	Case '99'
		of_Cfg( as_opc )
		
End Choose

//gw_frame.SetMicroHelp( 'Listo' )

Return
end subroutine

public function integer of_qaccess (string as_opt, boolean ab_on);Integer	li_opc, li_cnt
String	ls_txt, ls_on


If f_IsOracle( ) Then
	Select	v_nombre_opc
	Into		:ls_txt
	From		genopcion 
	Where		c_codigo_opc = :as_opt ;
Else
	Select	v_nombre_opc
	Into		:ls_txt
	From		genopcion With ( NoLock )
	Where		c_codigo_opc = :as_opt ;
End If

ls_txt = f_Trim( ls_txt )

If ab_on Then
	ls_txt = 'Crear Acceso Rápido ' + as_opt + ' ' + ls_txt
	ls_on = '1'
Else
	ls_txt = 'Quitar Acceso Rápido ' + as_opt + ' ' + ls_txt
	ls_on = '0'
End If


li_opc = f_GenMenuPopup( 'A.R.', &
								{ ls_txt } )


Choose Case li_opc
	Case 1
		
		Select	Count(*)
		Into		:li_cnt
		From		genloginopc
		Where		c_codigo_opc = :as_opt
		And		c_codigo_usu = :gs_usuario ;
		
		If f_SqlError( SqlCa, 'No se pudo consultar las opciones del usuario (Acceso Rápido).' ) = -1 Then
			RollBack Using SqlCa ;
			Return -1
		End If
		
		li_cnt = f_Zero( li_cnt )
		
		If li_cnt > 0 Then		
			Update	genloginopc 
			Set		c_favorito_opc = :ls_on
			Where		c_codigo_opc = :as_opt
			And		c_codigo_usu = :gs_usuario ;
		Else
			Insert Into genloginopc
				( c_codigo_opc, c_codigo_usu, c_favorito_opc )
			Values
				( :as_opt, :gs_usuario, :ls_on ) ;
		End If
		
		If f_SqlError( SqlCa, 'No se pudo actualizar las opciones del usuario (Acceso Rápido).' ) = -1 Then
			RollBack Using SqlCa ;
			Return -1
		End If
		
		Commit Using SqlCa ;
	Case Else
		

End Choose


Return 1
end function

public subroutine of_com (string as_opc);

Return

end subroutine

public subroutine of_ban (string as_opc);
Return
end subroutine

public subroutine of_afi (string as_opc);
Return
end subroutine

public subroutine of_fin (string as_opc);
end subroutine

public subroutine of_aep (string as_opc);
Return

end subroutine

public subroutine of_rhu (string as_opc);
end subroutine

public subroutine of_cex (string as_opc);

Return

end subroutine

public subroutine of_gnp (string as_opc);/* Llamado a Proyecto GNP
	f_GNP( as_opc ) */

f_GNP( as_opc ) 


Return

end subroutine

public subroutine of_tes (string as_opc);/* Llamado a Proyecto GNP
	f_Tes( as_opc ) */

f_Tes( as_opc ) 


Return

end subroutine

public subroutine of_sap (string as_opc);/* Llamado a Proyecto GNP
	f_Sap( as_opc ) */

f_Sap( as_opc ) 


Return

end subroutine

on uo_gen_menu.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_gen_menu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

