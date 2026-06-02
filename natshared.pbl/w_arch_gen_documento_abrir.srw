//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Diálogo - Popups, contiene clases visuales y s_parm; vinculado a documentos, busqueda por fechas y números, ver: uo_dw_list~r~n    Recomendación: Consultar Experto - Afecta TODO el sistema~r~n*/
forward
global type w_arch_gen_documento_abrir from wa_response
end type
type cb_nuevo from uo_cbother within w_arch_gen_documento_abrir
end type
type cb_xls from uo_cbother within w_arch_gen_documento_abrir
end type
end forward

global type w_arch_gen_documento_abrir from wa_response
integer width = 3886
integer height = 1680
string title = "Abrir Documento"
boolean ib_posy = true
event ue_winopendoc ( )
cb_nuevo cb_nuevo
cb_xls cb_xls
end type
global w_arch_gen_documento_abrir w_arch_gen_documento_abrir

type variables
String	is_doc
Boolean	ib_inherited = False, ib_ultimodoc = False, ib_retxemp = False
String	is_emp, is_tbl, is_ult // 16/ene/2018
end variables

forward prototypes
public subroutine wf_activo ()
public subroutine wf_buscar ()
public subroutine wf_pornumero ()
public subroutine wf_pornumero (string as_numdoc)
public subroutine wf_ultimo ()
public function integer wf_inasignadw ()
public function integer wf_inclose ()
public subroutine wf_buscar (string as_doc, boolean ab_xdoc)
end prototypes

event ue_winopendoc();
If gb_winopendoc And ib_retxemp Then
	wf_Buscar( gs_winnumdoc, True )
End If

If gb_winopendoc And Not ib_retxemp Then
	If gs_winnumdoc = '' Then 
		wf_PorNumero( )
	Else
		wf_PorNumero( gs_winnumdoc )
	End If
End If


end event

public subroutine wf_activo ();

Return

end subroutine

public subroutine wf_buscar ();DateTime	ld_ini, ld_fin
String	ls_null, ls_all


SetNull( ls_null )

dw_1.AcceptText( )

ld_ini = dw_1.Object.d_ini[ 1]
ld_fin = dw_1.Object.d_fin[ 1]
ls_all = f_Trim( dw_1.Object.c_all[ 1] )

If ls_all = '1' Then
	ld_ini = DateTime( Date( '01/01/1980' ) )
	ld_fin = DateTime( Date( '31/12/2049' ) )
End If

f_GenProcesando( 'Buscando documentos...' )

dw_list.SetRedraw( False )
dw_list.Retrieve( ld_ini, ld_fin, '', is_emp )
dw_list.SetRedraw( True )

f_GenProcesando( '' )

dw_list.SetFocus( )




end subroutine

public subroutine wf_pornumero ();DateTime	ld_null
String	ls_numdoc



OpenWithParm( w_arch_gen_documento_ingresar_numero, '' )

ls_numdoc = f_Trim( Message.StringParm )

If ls_numdoc = '' Then Return

If Len( ls_numdoc ) <= 2 Then
	MessageBox( Title, 'Para buscar por número de documento se recomienda por lo menos ' + & 
							'ingresar 3 caracteres consecutivos', Exclamation! )
End If

ls_numdoc = '%' + ls_numdoc + '%'

SetNull( ld_null )

f_GenProcesando( 'Buscando documentos...' )

dw_list.SetRedraw( False )
dw_list.Retrieve( ld_null, ld_null, ls_numdoc, is_emp ) 
dw_list.SetRedraw( True )

f_GenProcesando( '' )
dw_list.SetFocus( )	





end subroutine

public subroutine wf_pornumero (string as_numdoc);DateTime	ld_null
String	ls_numdoc

ls_numdoc = '%' + as_numdoc + '%'

SetNull( ld_null )
dw_list.Retrieve( ld_null, ld_null, ls_numdoc, is_emp ) 
dw_list.SetFocus( )	





end subroutine

public subroutine wf_ultimo ();DateTime	ld_null
String	ls_doc, ls_emp, ls_tem, ls_max


Choose Case is_doc
	Case 'MAN'
		
		ls_doc = f_Trim(  ls_doc )

		
End Choose


SetNull( ld_null )
dw_list.Retrieve( ld_null, ld_null, ls_doc, is_emp ) 
dw_list.SetFocus( )	





end subroutine

public function integer wf_inasignadw ();
/* CVILELA: Función que debe ser programada en lo heredado */

/*

// Usar Case con variable instancia is_doc 
// Si se desea activar botón último, asignar True a variable instancia ib_ultimodoc
// usar mayúsculas en el case
// asignar objeto DW al control DW dw_list
// Ejemplo:


	Choose Case is_doc
		Case 'MAN'
			dw_list.DataObject = 'd_arch_eye_manifiesto_abrir'
			
		Case 'PAL'
			dw_list.DataObject = 'd_arch_eye_palet_abrir'
			
		Case 'ENT' 
			dw_list.DataObject = 'd_arch_inv_entrada_abrir'	
			
	End Choose

	dw_1.Object.cb_ultimo.Visible = ib_ultimodoc
*/

Return 1
end function

public function integer wf_inclose ();/* wf_InClose( ) 

// Se debe programar en el objeto heredado
// Usar la variable instancia is_doc
// hacer el Case e indicar la tabla que es referenciada, y la llave por la que se accede
// Usar varible Structure s_parm llamarla lstr_parm 
// Ejemplo de como sería el código:

Long		ll_row
String	ls_opc
s_parm	lstr_parm


If dw_list.RowCount ( ) <= 0  Then 
	MessageBox( Title, 'No existen documentos para continuar.', Exclamation! )
	Return
End If

ll_row = dw_list.GetRow( )

Choose Case is_doc	

	Case 'PLS' /* Plan de Siembra */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_pls[ ll_row]
	
   Case 'PLV' /* Plan de Venta */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_plv[ ll_row]
	
End Choose

CloseWithReturn( This, lstr_parm )

*/
Return 1
end function

public subroutine wf_buscar (string as_doc, boolean ab_xdoc);
Boolean	lb_exacta = False
DateTime	ld_ini, ld_fin
String	ls_null, ls_all


SetNull( ls_null )

dw_1.AcceptText( )

ld_ini = dw_1.Object.d_ini[ 1]
ld_fin = dw_1.Object.d_fin[ 1]
ls_all = f_Trim( dw_1.Object.c_all[ 1] )

If ls_all = '1' Then
	ld_ini = DateTime( Date( '01/01/1980' ) )
	ld_fin = DateTime( Date( '31/12/2049' ) )
End If

If ab_xDoc And Not as_doc = '' Then
	lb_exacta = True
End If

If ab_xDoc And as_doc = '' Then
	OpenWithParm( w_arch_gen_documento_ingresar_numero, '' )
	
	as_doc = f_Trim( Message.StringParm )
	
	If as_doc = '' Then Return
	
	If Len( as_doc ) <= 2 Then
		MessageBox( Title, 'Para buscar por número de documento se recomienda por lo menos ' + & 
								'ingresar 3 caracteres consecutivos', Exclamation! )
	End If
	
End If

If ab_xDoc Then
	If Not lb_exacta Then as_doc = '%' + as_doc + '%'
	SetNull( ld_ini )
	SetNull( ld_fin  )
End If

f_GenProcesando( 'Buscando documentos...' )

dw_list.SetRedraw( False )
dw_list.Retrieve( is_emp, as_doc, ld_ini, ld_fin )
dw_list.SetRedraw( True )

f_GenProcesando( '' )

dw_list.SetFocus( )

end subroutine

on w_arch_gen_documento_abrir.create
int iCurrent
call super::create
this.cb_nuevo=create cb_nuevo
this.cb_xls=create cb_xls
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_nuevo
this.Control[iCurrent+2]=this.cb_xls
end on

on w_arch_gen_documento_abrir.destroy
call super::destroy
destroy(this.cb_nuevo)
destroy(this.cb_xls)
end on

event open;call super::open;DateTime	ld_ini, ld_fin
String	ls_ori, ls_c1, ls_c2


is_doc = Message.StringParm
is_emp = gs_emp

dw_1.InsertRow( 1)

If f_Trim( Message.StringParm ) = 'NEW' Then 
	wf_Buscar( )
	cb_nuevo.SetFocus( ) 
End If

ld_ini = DateTime( Today( ) )
ld_fin = DateTime( Today( ) )

If Not ib_inherited Then
	Choose Case is_doc
		Case 'MAN'
			dw_list.DataObject = 'd_arch_eye_manifiesto_abrir'
			ib_ultimodoc = True
			
		Case 'PAL'
			dw_list.DataObject = 'd_arch_eye_palet_abrir'
			
		Case 'ENT' 
			dw_list.DataObject = 'd_arch_inv_entrada_abrir'	
			
		Case 'SAL' 
			dw_list.DataObject = 'd_arch_inv_salida_abrir'	
			
		Case 'PEX' 
			dw_list.DataObject = 'd_arch_cex_pedimento_abrir'	
			
		Case 'DEX' 
			dw_list.DataObject = 'd_arch_cex_descarga_abrir'
			
		Case 'POL' 
			dw_list.DataObject = 'd_arch_con_poliza_abrir'	
	
		Case 'PSI' 
			dw_list.DataObject = 'd_arch_con_poliza_ini_abrir'	
			
		Case 'DIB' 
			dw_list.DataObject = 'd_arch_out_dispersion_abrir'	
			
			/* Generacion de Nomina Administrativa */	
		Case 'NAM' 
			dw_list.DataObject = 'd_arch_out_asistencia_abrir'	
			
		/* Generacion de Nomina de Campo */
		Case 'NAL' 
			dw_list.DataObject = 'd_arch_out_nomlabor_abrir'	
			
		/* Generacion de Liquidaciones de Nomina ( Outsorcing ) */
		Case 'OLQ' 
			dw_list.DataObject = 'd_arch_cfdi_generarliq_abrir'	
			
		Case 'AYB' 
			dw_list.DataObject = 'd_arch_eye_acarreo_abrir'	
			
		Case 'PRT' 
			dw_list.DataObject = 'd_arch_out_prestamo_abrir'	
	
		Case 'CAC' 
			dw_list.DataObject = 'd_arch_eye_calcampo_abrir'	
	
		Case 'CAE' 
			dw_list.DataObject = 'd_arch_eye_calempaque_abrir'	
	
		Case 'CAR' 
			dw_list.DataObject = 'd_arch_eye_calcampo_complemento_abrir'	
	
		Case 'CEC' 
			dw_list.DataObject = 'd_arch_eye_calempaque_complemento_abrir'	
			
		Case 'PED' 
			dw_list.DataObject = 'd_arch_com_pedido_abrir'	
			
		Case 'ORD' 
			dw_list.DataObject = 'd_arch_com_orden_abrir'	
			
		Case 'POLFAC' 
			dw_list.DataObject = 'd_arch_con_poliza_detdigital_fac_abrir'	
			
		Case 'POLCHE' 
			dw_list.DataObject = 'd_arch_con_poliza_detdigital_che_abrir'	
			
		Case 'LAB' 
			dw_list.DataObject = 'd_arch_out_labor_abrir'	
			
		Case 'FAC' 
			dw_list.DataObject = 'd_arch_cxp_factura_proveedor_abrir'	
			
		Case 'CHE' 
			dw_list.DataObject = 'd_arch_ban_cheque_abrir'	
			
		Case 'AFX' 
			dw_list.DataObject = 'd_arch_afi_movimiento_abrir'	
			
		Case 'AFC' 
			dw_list.DataObject = 'd_arch_afi_renta_abrir'	
			
		Case 'AFS' 
			dw_list.DataObject = 'd_arch_afi_poliza_abrir'	
			
		Case 'AFM' 
			dw_list.DataObject = 'd_arch_afi_mantenimiento_abrir'	
			
		Case 'BMV' 
			dw_list.DataObject = 'd_arch_ban_deposito_retiro_abrir'	
			
		Case 'VAC' 
			dw_list.DataObject = 'd_arch_out_vacaciones_abrir'	
			
		Case 'AGUI' 
			dw_list.DataObject = 'd_arch_out_aguinaldo_abrir'	
			
		Case 'LIQ' 
			dw_list.DataObject = 'd_arch_out_liquidaciones_abrir'	
			
		Case 'COM' 
			dw_list.DataObject = 'd_arch_com_cotizacion_comparativo_abrir'	
			
		Case 'CTP' 
			dw_list.DataObject = 'd_arch_com_cotizacion_proveedor_abrir'	
			
		Case 'PLV'
			dw_list.DataObject = 'd_arch_com_planventa_abrir'
		
		Case 'MPC'
			dw_list.DataObject = 'd_arch_eye_materialespallet_abrir'
		
		Case 'PLS' 
			dw_list.DataObject = 'd_arch_com_plansiembra_abrir'	
							
	End Choose
End If

If ib_inherited Then
	wf_InAsignaDW( )
End If

dw_1.Object.cb_ultimo.Visible = ib_ultimodoc

dw_1.Object.d_ini[ 1] = ld_ini 
dw_1.Object.d_fin[ 1] = ld_fin 
dw_1.AcceptText( )

dw_list.TriggerEvent( Constructor! )

wf_Activo( )

PostEvent( 'ue_winopendoc' )
end event

event closequery;call super::closequery;gb_winopen = False
gb_winopendoc = False
end event

type dw_list from wa_response`dw_list within w_arch_gen_documento_abrir
integer x = 133
integer y = 340
integer width = 3593
integer height = 1052
string dataobject = "d_arch_cex_pedimento_abrir"
boolean border = false
end type

event dw_list::retrieveend;call super::retrieveend;If rowcount > 0  Then cb_aceptar.Enabled = True
end event

event dw_list::doubleclicked;cb_aceptar.TriggerEvent( Clicked! )
end event

event dw_list::getfocus;cb_aceptar.Default = True
end event

type dw_1 from wa_response`dw_1 within w_arch_gen_documento_abrir
integer width = 3941
integer height = 1420
string dataobject = "d_arch_gen_documento_abrir"
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_buscar'
		If ib_retxemp Then
			wf_Buscar( '', False )
		Else
			wf_Buscar( )
		End If
		
	Case 'cb_pornumero'
		If ib_retxemp Then
			wf_Buscar( '', True )
		Else
			wf_PorNumero( )
		End If
		
	Case 'cb_ultimo'
		If ib_retxemp Then
			wf_Buscar( is_ult, True )
		Else
			wf_Ultimo( )
		End If
End Choose
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_documento_abrir
integer x = 3374
integer y = 1464
integer taborder = 90
end type

event cb_cancelar::clicked;s_parm	lstr_parm


CloseWithReturn( Parent, lstr_parm )
end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_documento_abrir
integer x = 2985
integer y = 1464
integer taborder = 50
end type

event cb_aceptar::clicked;Long		ll_row
String	ls_opc
s_parm	lstr_parm


/* CVILELA: 15/May/2017 - Deberá usarse para ventanas que hereden */
If ib_inherited Then
	wf_InClose( )
	Return
End If

If dw_list.RowCount ( ) <= 0  Then 
	MessageBox( Title, 'No existen documentos para continuar.', Exclamation! )
	Return
End If

ll_row = dw_list.GetRow( )

/*If dw_list.Object.c_activo[ ll_row] = '0' Then
	MessageBox( Title, 'El registro se encuentra eliminado/cancelado.' )
	dw_list.SetFocus( )
			
	lstr_parm.s_cad[1] = ''
	lstr_parm.s_cad[2] = dw_list.Object.c_codigo[ ll_row]
	Return
End If
*/


Choose Case is_doc	
	Case 'APL'
		lstr_parm.s_cad[2] = dw_list.Object.c_codigo[ ll_row]
	Case 'HOJ'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
	Case 'PSI', 'POLGEN','POLCOS', 'POLESP'
		lstr_parm.s_cad[ 1] = ''
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
	Case 'PRN', 'OCA'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'BMV'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_cba[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_secuencia_bmv[ ll_row]
		
	Case 'CHE'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_cba[ ll_row]		
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_bch[ ll_row]
		
	Case 'CXP'
		lstr_parm.s_cad[ 1] = ''
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_prv[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_fac[ ll_row]
	Case 'CNB'
		lstr_parm.s_cad[ 1] = ''
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_cnb[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_cba[ ll_row]
		
	Case 'FAB' // Poliza Cheque
		lstr_parm.s_cad[ 1] = ''
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_pol[ ll_row]
		//lstr_parm.s_cad[ 4] = dw_list.Object.c_codigo_prv[ ll_row]
		//lstr_parm.s_cad[ 5] = dw_list.Object.c_codigo_fac[ ll_row]
		
	Case 'FAC'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_prv[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_fac[ ll_row]
		
	Case 'ENT', 'SAL'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_inv[ ll_row]
		ls_opc = 'Opción "Documentos de Entradas".'
		If is_doc = 'SAL' Then ls_opc ='Opción "Documentos de Salidas".'
		lstr_parm.s_cad[ 3] = ''
		
	Case 'CTR', 'POL'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'DIB'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'NAM'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'POLFAC'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_fac[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_prv[ ll_row]
		
	Case 'POLCHE'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_cba[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_bch[ ll_row]
		
	Case 'MAN'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_man[ ll_row]
		
	Case 'PAL'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'AYB'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'PRT'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'CAC'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'CAE'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'CAR'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'CEC'
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'PED' /* Pedido de Compra */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'ORD' /* Orden de Compra */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_ord[ ll_row]
		
	Case 'LAB' /* Labor de Nómina */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo[ ll_row]
		
	Case 'AFX' /* Activo Fijo - Movimiento */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_afx[ ll_row]
		
	Case 'AFC' /* Activo Fijo - Contrato */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_afc[ ll_row]
		
	Case 'AFS' /* Activo Fijo - Póliza de Seguro */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_afs[ ll_row]
		
	Case 'AFM' /* Activo Fijo - Reparación y Mantención */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_afm[ ll_row]
		
	Case 'VAC' /* Vacaciones */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_vac[ ll_row]
		
	Case 'AGUI' /* Aguinaldo */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_agi[ ll_row]
		
	Case 'LIQ' /* Liquidaciones */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_liq[ ll_row]
		
	Case 'COM' /* Comparativo de Cotizaciones del Proveedor */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_com[ ll_row]
		
	Case 'CTP' /* Cotizaciones del Proveedor */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_ctp[ ll_row]
		lstr_parm.s_cad[ 3] = dw_list.Object.c_codigo_prv[ ll_row]
		
	Case 'PLS' /* Plan de Siembra */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_pls[ ll_row]
	
   Case 'PLV' /* Plan de Venta */
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_plv[ ll_row]
	
	Case 'MPC' /* Materiales por Pallet*/
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo_mpc[ ll_row]
		
	Case Else
		lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_tem[ ll_row]
		lstr_parm.s_cad[ 2] = dw_list.Object.c_codigo[ ll_row]
End Choose

CloseWithReturn( Parent, lstr_parm )

end event

type cb_nuevo from uo_cbother within w_arch_gen_documento_abrir
integer x = 526
integer y = 1460
integer taborder = 70
boolean bringtotop = true
string text = "&Nuevo"
end type

event clicked;s_parm	lstr_parm


lstr_parm.s_cad[ 1] = 'NEW'
lstr_parm.s_cad[ 2] = 'NEW'
lstr_parm.s_cad[ 3] = ''

CloseWithReturn( Parent, lstr_parm )

end event

type cb_xls from uo_cbother within w_arch_gen_documento_abrir
integer x = 133
integer y = 1460
integer taborder = 20
boolean bringtotop = true
string text = "&Excel"
end type

event clicked;call super::clicked;f_DwToExcel( dw_list )
end event

