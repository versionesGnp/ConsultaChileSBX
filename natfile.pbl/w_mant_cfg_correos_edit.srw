forward
global type w_mant_cfg_correos_edit from wa_response
end type
end forward

global type w_mant_cfg_correos_edit from wa_response
integer width = 3954
integer height = 1732
string title = "Configuración de Concepto y Cuentas de Correo"
end type
global w_mant_cfg_correos_edit w_mant_cfg_correos_edit

type variables

Integer	ii_cod
end variables

forward prototypes
public function integer wf_sendmail ()
public function integer wf_savedocument ()
end prototypes

public function integer wf_sendmail ();
Int		li_etd, li_cod
String	ls_app, ls_sub, ls_body, ls_wks, ls_Files, ls_msg, ls_col, &
			ls_exe, ls_arg1, ls_arg2, ls_arg3, ls_arg4


dw_1.AcceptText( )
li_etd = gi_EntProd

li_cod = f_Zero( dw_1.Object.Codigo[ 1] )

ls_app = f_Trim( ls_app )
ls_sub = f_Trim( dw_1.Object.Asunto[ 1] )
ls_body = f_Trim( dw_1.Object.Contenido[ 1] )

If li_cod = 0 And ls_msg = '' Then
	ls_msg = 'Debe guardar el Concepto antes de realizar la prueba.'
	ls_col = 'Descripcion'
End If

If ls_sub = '' And ls_msg = '' Then
	ls_msg = 'Debe ingresar el Asunto del Concepto.'
	ls_col = 'Asunto'
End If

If dw_list.RowCount() <= 0 And ls_msg = '' Then
	ls_msg = 'Debe agregar cuentas al Concepto y guardar la configuración.'
	ls_col = 'Descripcion'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg )
	dw_1.SetFocus( ls_col )
	Return -1
End If

SetPointer( HourGlass! )

Integer	i
String	ls_add[ ], ls_DB 

For i = 1 To dw_list.RowCount( )
	ls_add[ i] = dw_list.Object.Correo[ i]
Next


SendMail	SMail

ls_DB = 'PRADO'
gw_frame.SetMicrohelp( 'Envíando Correo...')
SMail.GetReady( ls_DB )
SMail.Send( ls_sub, ls_add[], ls_body, 0 )

ls_wks = f_GetPCName( ) 
Insert Into GenSendMail
( CodConcepto, CodUser, Wks, dSend, Subject, Body, Files )
Values
( :li_cod, :gs_usuario, :ls_wks, SysDate, :ls_sub, :ls_body, :ls_Files)
Using SqlCa ;

Commit Using SqlCa ;

SetPointer( Arrow! )
gw_frame.SetMicrohelp( 'Listo' )

Return 1
end function

public function integer wf_savedocument ();
Integer	li_etd, li_cod, li_cor, li_act, i
String	ls_des, ls_asu, ls_con, ls_col, ls_msg

dw_1.Accepttext( )

li_cod = f_Zero( dw_1.Object.Codigo[ 1] )
ls_des = f_Trim( dw_1.Object.Descripcion[ 1] )
ls_asu = f_Trim( dw_1.Object.Asunto[ 1] )
ls_con = f_Trim( dw_1.Object.Contenido[ 1] )

If ls_des = '' And ls_msg = '' Then
	ls_msg = 'Debe ingresar la Descripción del Concepto.'
	ls_col = 'Descripcion'
End If

If ls_asu = '' And ls_msg = '' Then
	ls_msg = 'Debe ingresar el Asunto del Concepto.'
	ls_col = 'Asunto'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg )
	dw_1.SetFocus( ls_col )
	Return -1
End If

SetPointer( HourGlass! )
dw_1.Object.Contenido[ 1] = ls_con 
dw_1.Object.Usuario_Registro[ 1] = gs_usuario 
dw_1.Object.Fecha_Registro[ 1] = DateTime( Today(), Now() ) 

If li_cod = 0 Then
	Select Max( Codigo )
	Into :li_cod
	From UTAppCorreoConcepto ;
	li_cod = f_Zero( li_cod ) + 1
	dw_1.Object.Codigo[ 1] = li_cod
End If

dw_1.AcceptText( )
If Not dw_1.Update( True ) = 1 Then
	SetPointer( Arrow! )
	RollBack Using SqlCa ;
	blEclipse.Messagebox( Title, 'No se pudo guardar la Configuración de Concepto.', Exclamation! )
	Return -1
End If

Delete UTAppCorreoConceptoRelacion
Where  CodConcepto = :li_cod 
Using	 SqlCa ;
If SqlCa.SqlCode = -1 Then
	SetPointer( Arrow! )
	ls_msg = 'No se pudo guardar la Configuración de Concepto (Relación_1).' + Char(13) + Char(13) + SqlCa.SqlErrtext;
	RollBack Using SqlCa ;
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	Return -1
End If

For i = 1 To dw_list.RowCount( )
	
	li_cor = dw_list.Object.CodCorreo[ i]
	li_act = dw_list.Object.RelActivo[ i]
	
	Insert Into UTAppCorreoConceptoRelacion
		( CodConcepto, CodCorreo, Activo )
	Values
		( :li_cod, :li_cor, :li_act )
	Using SqlCa ;
	If SqlCa.SqlCode = -1 Then
		SetPointer( Arrow! )
		ls_msg = 'No se pudo guardar la Configuración de Concepto (Relación_2).' + Char(13) + Char(13) + SqlCa.SqlErrtext;
		RollBack Using SqlCa ;
		blEclipse.Messagebox( Title, ls_msg, Exclamation! )
		Return -1
	End If

Next

Commit Using SqlCa ;
SetPointer( Arrow! )

Return 1


end function

on w_mant_cfg_correos_edit.create
call super::create
end on

on w_mant_cfg_correos_edit.destroy
call super::destroy
end on

event open;call super::open;
Integer	li_nil

ii_cod = Message.Doubleparm

ii_cod = f_Zero( ii_cod )
SetNull( li_nil )


dw_list.SetObjectColor( 'Nombre', 'o' )

If ii_cod > 0 Then
	dw_1.Retrieve( ii_cod, li_nil, 'CAB' )
	dw_list.Retrieve( ii_cod, li_nil, 'DET' )
Else
	dw_1.InsertRow( 0 )
End If
end event

type dw_list from wa_response`dw_list within w_mant_cfg_correos_edit
integer x = 1993
integer y = 236
integer width = 1861
integer height = 1204
string dataobject = "d_mant_cfg_correos_edit_det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_filter = false
integer ii_detheight = 155
end type

event dw_list::buttonclicked;call super::buttonclicked;

Choose Case dwo.Name
	Case 'cb_add'
		Int	li_cod
		Uo_DataStore lds_1
		
		li_cod = dw_1.Object.Codigo[ 1]
		Destroy lds_1
		f_CreateDS( lds_1, 'd_mant_cfg_correos_buscar_x_nombre_det', SqlCa )
	
		String	ls_msg
		Message.Stringparm = ''
		OpenWithParm( w_mant_cfg_correos_buscar_x_nombre, li_cod )
		ls_msg = f_Trim( Message.Stringparm )
		
		If Not ls_msg = 'OK' Then Return
		
		lds_1 = Message.PowerObjectParm
		
		If Not IsValid( lds_1 ) Then Return
		
		lds_1.Filter( 'c_check = "1"')
		
		Int i, j
		String	ls_fnd
		
		For i = 1 To lds_1.RowCount( )
			
			ls_fnd = 'CodCorreo = ' + String( lds_1.Object.Codigo[ i] )
			If dw_list.Find( ls_fnd ) > 0 Then Continue
			
			j = dw_list.InsertRow(0)
			dw_list.Object.CodCorreo[ j] = lds_1.Object.Codigo[ i]
			dw_list.Object.Nombre[ j] = lds_1.Object.Nombre[ i]
			dw_list.Object.Correo[ j] = lds_1.Object.Correo[ i]
			dw_list.Object.CorreoActivo[ j] = lds_1.Object.Activo[ i]
			dw_list.Object.RelActivo[ j] = 1
			dw_list.AcceptText( )
		Next
		
		cb_aceptar.Enabled = True
		
	Case 'cb_del'
		dw_list.DeleteRow( row )
		cb_aceptar.Enabled = True
End Choose
end event

type dw_1 from wa_response`dw_1 within w_mant_cfg_correos_edit
integer width = 3963
integer height = 1496
string dataobject = "d_mant_cfg_correos_edit"
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_test'
		gw_frame.SetMicrohelp( 'Preparando envío...')
		If wf_SaveDocument( ) = 1 Then
			wf_SendMail( )
		End If
		gw_frame.SetMicrohelp( 'Listo')
		
End Choose
end event

type cb_cancelar from wa_response`cb_cancelar within w_mant_cfg_correos_edit
integer x = 3429
integer y = 1528
end type

type cb_aceptar from wa_response`cb_aceptar within w_mant_cfg_correos_edit
integer x = 3049
integer y = 1528
end type

event cb_aceptar::clicked;call super::clicked;
Integer li_cod


If Not wf_SaveDocument( ) = 1 Then
	blEclipse.Messagebox( Title, 'No se pudo guardar correctamente la información.', Exclamation! )
	Return -1
Else
	blEclipse.Messagebox( Title, 'Información Guardada Correctamente.', Information! )
End If

li_cod = f_Zero( dw_1.Object.Codigo[ 1] )
CloseWithReturn( Parent, String( li_cod ) )


end event

