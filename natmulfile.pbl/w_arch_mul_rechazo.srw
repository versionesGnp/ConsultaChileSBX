forward
global type w_arch_mul_rechazo from wa_response
end type
end forward

global type w_arch_mul_rechazo from wa_response
integer width = 3488
integer height = 2152
string title = "Rechazo de Contrato MultiProducto"
windowanimationstyle closeanimation = noanimation!
boolean ib_posy = true
end type
global w_arch_mul_rechazo w_arch_mul_rechazo

type variables

MP MP
end variables

forward prototypes
public function integer wf_open ()
public function boolean wf_savedocument ()
end prototypes

public function integer wf_open ();
Int		li_nil, li_cmp
String	ls_db, ls_nil, ls_cto, ls_bas, ls_ser
Long		ln_rut, ln_nro

dw_1.AcceptText( )

li_cmp = f_Zero( dw_1.Object.CodigoMP[ 1] )
ls_cto = f_Trim( dw_1.Object.Barra[ 1] )
ls_bas = f_Trim( dw_1.Object.Base[ 1] )
ls_ser = f_Trim( dw_1.Object.Serie[ 1] )
ln_nro = f_Zero( dw_1.Object.Numero[ 1] )
//ln_rut = f_Zero( dw_1.Object.rut[ 1] )
ls_DB = UpperTrim( dw_1.Object.DB[ 1] )

SetNull( li_nil ) ; SetNull( ls_nil ) ;

If li_cmp = 0 Then
	dw_1.Setfocus( 'CodigoMP' )
	blEclipse.Messagebox( Title, 'Debe Seleccionar MultiProducto para continuar.', Exclamation! )
	Return 0
End If

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

Long		rows
String	ls_ref

ls_ref = ls_nil
rows = dw_1.Retrieve( ls_bas, ls_ser, ln_nro, ls_ref, 'CAB', ls_DB )

dw_list.SetRedraw( False )
rows = dw_list.Retrieve( ls_bas, ls_ser, ln_nro, ls_ref, 'DET', ls_DB )
dw_list.SetRedraw( True )
dw_list.SetFocus( )

Return 1
end function

public function boolean wf_savedocument ();
Integer	li_par, li_nil, li_CMP, row
Long		ll_nro, ll_rut
String	ls_bar, ls_bas, ls_ser, &
			ls_col, ls_msg


dw_1.Accepttext( )

SetNull( li_nil )
row = 1

ls_bar = UpperTrim( dw_1.Object.Barra[ row] )
ls_bas = UpperTrim( dw_1.Object.Base[ row] )
ls_ser = UpperTrim( dw_1.Object.Serie[ row] )
ll_nro = f_Zero( dw_1.Object.Numero[ row] )
li_par = f_Zero( dw_1.Object.Cod_Parque[ row] )
ll_rut = MP.Rut
li_CMP = f_Zero( dw_1.Object.CodigoMP[ row] )

If ls_msg = '' And ls_bar = '' Then
	ls_col = 'Barra'
	ls_msg = 'Debe seleccionar nuevo Contrato a Revisión.'
End If

If ls_msg = '' And li_par = 0 Then
	ls_col = 'Cod_Parque'
	ls_msg = 'Debe seleccionar Parque.'
End If

If ls_msg = '' And li_CMP = 0 Then
	ls_col = 'CodigoMP'
	ls_msg = 'Debe seleccionar MultiProducto.'
End If

If ls_msg = '' And ll_rut = 0 Then
	ls_col = 'Rut'
	ls_msg = 'Debe ingresar el RUT del cliente.'
End If

String	ls_cod_age, ls_cod_sup, ls_cod_jef

ls_cod_age = UpperTrim( dw_1.Object.Cod_Age[ row] )
ls_cod_sup = UpperTrim( dw_1.Object.Cod_Sup[ row] )
ls_cod_jef = UpperTrim( dw_1.Object.Cod_Jef[ row] )
/*
If ls_msg = '' And ls_cod_age = '' Then
	ls_col = 'Cod_Age'
	ls_msg = 'Debe ingresar Código de Agente.'
End If

If ls_msg = '' And ls_cod_sup = '' Then
	ls_col = 'Cod_Sup'
	ls_msg = 'Debe ingresar Código de Supervisor.'
End If

If ls_msg = '' And ls_cod_jef = '' Then
	ls_col = 'Cod_Jef'
	ls_msg = 'Debe ingresar Código de Jefe de Venta.'
End If
*/
If gs_usuario = '' Then gs_usuario = gs_user
If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If


Integer	rows, li_rechazos, li_TipoRechazo

Rows = dw_list.RowCount( )
ls_msg = ''

If Rows <= 0 Then
	ls_msg = 'Debe existir al menos un Motivo de Rechazos listados para poder continuar.'
End If

If Rows > 0 Then
	li_rechazos = f_Zero( dw_list.Object.nRechazos[ Rows] )	
	li_TipoRechazo = f_Zero( dw_list.Object.ult_TipoRechazo[ Rows] )		
End If

If li_rechazos <= 0 Then
	ls_msg = 'Debe existir al menos un Motivo de Rechazos selecionado para poder continuar.'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_list.SetFocus( )
	Return False
End If



Integer	li_ret, li_estado
String	ls_gen, ls_edo, ls_Glosa

SetNull( ls_Glosa )
SetNull( li_estado )

SetMicrohelp( 'Guardando Rechazo del Contrato ' + ls_Bar )
uo_DataStore	lds_gen
f_CreateDS( lds_gen, 'd_arch_mul_rechazo_save', SqlCa )

li_ret = lds_gen.Retrieve( li_par, ls_bas, ls_ser, ll_nro, ll_rut, &
									li_Estado, ls_glosa, li_TipoRechazo, gs_usuario, &
									li_CMP, ls_cod_age, ls_cod_sup, ls_cod_jef )

If li_ret > 0 Then
	ls_gen = f_Trim( lds_gen.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_gen.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_gen.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_gen.is_ErrText
End If
	
If ls_edo = 'ERR' Or ls_edo = 'ERC' Then
//	dw_1.Object.Estado[ i] = ls_edo
//	dw_1.Object.MensajeResultado[ i] = ls_msg
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If


uo_DataStore	lds_det

f_CreateDS( lds_det, 'd_arch_mul_rechazo_save_det', SqlCa )
SetMicrohelp( 'Guardando Motivos de Rechazo del Contrato ' + ls_Bar )

DateTime	ld_Crea
Integer	i, li_gru, li_rch, li_item
String	ls_Estado, ls_ref, ls_obs, ls_chk


dw_list.AcceptText( )

ls_gen = '' ; ls_edo = '' ; ls_msg = '' ;
SetNull( li_gru )
SetNull( ls_ref )

For i = 1 To dw_list.RowCount( )
	ls_chk		= UpperTrim( dw_list.Object.c_check[ i] )
	
	If Not ls_chk = '1' Then Continue
	li_rch		= f_Zero( dw_list.Object.codigo_rechazo[ i] )
	ls_obs		= UpperTrim( dw_list.Object.observacion[ i] )
	ls_Estado	= UpperTrim( dw_list.Object.estado[ i] )
	li_item		= li_item + 1
	li_ret		= lds_det.Retrieve( ls_bas, ls_ser, ll_nro, li_gru, li_rch, ls_ref, ls_obs, ls_Estado, ld_Crea, li_item )
	
	If li_ret > 0 Then
		ls_gen = f_Trim( lds_det.Object.CodigoGenerado[ 1] )
		ls_edo = f_Trim( lds_det.Object.Estado[ 1] )
		ls_msg = f_Trim( lds_det.Object.MensajeResultado[ 1] )
	Else
		ls_gen = '-2'
		ls_edo = 'ERR'
		ls_msg = lds_det.is_ErrText
		If ls_msg = '' Then ls_msg = 'Se ha producido un error indeterminado en la transacción, es posible que existe un problema de la definición del objeto DS y el Procedure.' 
	End If
		
	If f_In (ls_edo, {'ERR', 'ERC', 'IER'}) Then
		RollBack Using SqlCa ;
		blEclipse.MessageBox( Title, ls_msg, StopSign! )
		Return False
	End If
Next

If Not ls_gen = '' Then
	Commit Using SqlCa ;
End If

SetMicrohelp( 'Listo' )
dw_1.AcceptText( )
ib_saved = True

blEclipse.Messagebox( Title, 'Contrato ha sido Rechazado Correctamente.', Information! )
Return True
end function

on w_arch_mul_rechazo.create
call super::create
end on

on w_arch_mul_rechazo.destroy
call super::destroy
end on

event open;call super::open;

MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
dw_1.Object.CodigoMP[ 1] = MP.Codigomp
dw_1.Object.Barra[ 1] = MP.Barra
dw_1.Object.Base[ 1] = MP.Base
dw_1.Object.Serie[ 1] = MP.Serie
dw_1.Object.Numero[ 1] = MP.Numero
//dw_1.Object.RUT[ 1] = MP.RUT
//dw_1.Object.DV[ 1] = MP.DV
dw_1.Object.DB[ 1] = MP.Db
dw_1.Accepttext( )

dw_1.ColEnabled( False )

//dw_list.Object.DataWindow.ReadOnly = True
dw_list.SetObjectcolor( 'Estado', 'f_Trim( Estado ) = "P"', {'ba', 'o'} )
wf_Open( )
end event

type dw_list from wa_response`dw_list within w_arch_mul_rechazo
event check ( )
integer x = 110
integer y = 500
integer width = 3287
integer height = 1372
string dataobject = "d_arch_mul_rechazo_Det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 100
end type

event dw_list::check();
Long		row
String	ls_chk
		
This.AcceptText( )

row = This.GetRow( )
ls_chk = f_Trim( This.Object.c_check[ row] )
If ls_chk = '1' Then
	This.Object.Estado[ row] = 'P'
	This.SetFocus( 'Observacion' )
End If

If Not ls_chk = '1' Then
	This.Object.Estado[ row] = ''
	This.Object.Observacion[ row] = ''
End If

end event

event dw_list::itemchanged;call super::itemchanged;

Choose Case dwo.Name
	Case 'observacion'
		data = f_Trim( data )
		If Not data = '' Then
			This.Object.c_check[ row] = '1'
			This.Object.Estado[ row] = 'P'
		End If
	
	Case 'c_check'
		PostEvent( 'check' )
End Choose
end event

event dw_list::editchanged;call super::editchanged;

Choose Case dwo.Name
	Case 'observacion'
		data = f_Trim( data )
		If Not data = '' Then
			This.Object.c_check[ row] = '1'
			This.Object.Estado[ row] = 'P'
		End If
	
End Choose
end event

event dw_list::itemfocuschanged;call super::itemfocuschanged;

If ib_ind Then
	Object.r_ind.x = Long( dwo.x ) - 4
	Object.r_ind.y = Long( dwo.y ) - 4
	Object.r_ind.width = Long( dwo.width ) + 8
	Object.r_ind.Height = Long( dwo.Height ) + 8
End If
end event

type dw_1 from wa_response`dw_1 within w_arch_mul_rechazo
integer width = 4018
integer height = 1916
string dataobject = "d_arch_mul_rechazo"
boolean ib_ind = false
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_open'
		wf_Open( )
		
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;

dw_list.Reset( )
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_rechazo
integer x = 3049
integer y = 1944
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_rechazo
integer x = 2665
integer y = 1944
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;
Boolean	lb_saved


lb_saved = wf_SaveDocument( )
If Not lb_saved Then
	Return
End If

CloseWithReturn( Parent, 'OK' )



end event

