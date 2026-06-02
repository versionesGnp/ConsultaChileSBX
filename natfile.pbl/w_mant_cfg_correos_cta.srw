//objectcomments /* Autor: César Vilela */ ~r~nConfiguración de cuentas de correo
forward
global type w_mant_cfg_correos_cta from w_gen_document_doc
end type
end forward

global type w_mant_cfg_correos_cta from w_gen_document_doc
integer width = 4046
integer height = 1900
string title = "Cuentas de Correo Electrónico"
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbdelete = false
boolean ib_cbprint = false
boolean ib_cbadd = false
boolean ib_cbshare = false
integer ii_buttonhomepos = 2200
boolean ib_permitemod = true
boolean ib_new = true
event postopen ( )
end type
global w_mant_cfg_correos_cta w_mant_cfg_correos_cta

type variables

Boolean	ib_msg = False
Integer	ii_cpa, ii_cpp
end variables

forward prototypes
public function integer wf_new ()
public function integer wf_open ()
public function boolean wf_savedocument ()
public function integer wf_config ()
public function long wf_print ()
public subroutine wf_add ()
end prototypes

public function integer wf_new ();
Integer	li_sem
String	ls_tem, ls_etd


If Not wf_LostChanges( ) Then Return -1

ib_saved = True
ib_new = True
ib_PermiteMod = True


dw_list.Reset( )
dw_list.SetTransObject( SqlCa )

dw_1.SetRedraw( False )
dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.AcceptText( )
dw_1.SetRedraw( True )

dw_1.SetFocus( )

wf_Open( )

Return 1
end function

public function integer wf_open ();
Integer	li_etd, li_msg
String	ls_msg, ls_col


dw_1.SetFocus( )
dw_1.AcceptText( )

If Not wf_LostChanges( ) Then Return -1

li_etd = gi_EntProd

Integer	li_ret, li_nil

SetNull( li_nil )
li_ret = dw_list.Retrieve( li_nil, li_nil, 'COR' )

Commit Using SqlCa ;

ib_msg = True
ib_PermiteMod = True

Return li_ret

end function

public function boolean wf_savedocument ();
Integer	li_etd, li_atv
Long		i, li_cod
String	ls_tem, ls_nom, &
			ls_msg, ls_col


dw_1.AcceptText( )
dw_list.AcceptText( )


For i = 1 To dw_list.RowCount( )
	li_cod = f_Zero( dw_list.Object.Codigo[ i] )
	ls_nom = f_Trim( dw_list.Object.Nombre[ i] )
	li_atv = f_Zero( dw_list.Object.Activo[ i] ) 
	
	If Not li_atv = 1 Then li_atv = 0 
	
	If li_atv = 0 And ls_nom = '' Then 
		dw_list.Object.Nombre[ i] = '* Eliminado *'
	End If
	
	If li_atv = 0 Then Continue
	If li_cod <= 0 And ls_nom = '' Then Continue
	
	If ls_msg = '' And li_cod <= 0 Then
		ls_msg = 'Debe ingresar Código de Cuenta de correo.'
		ls_col = 'Codigo'
	End If
	
	If ls_msg = '' And ls_nom = '' Then
		ls_msg = 'Debe ingresar Nombre del Usuario de la Cuenta.'
		ls_col = 'Nombre'
	End If
	
	If Not ls_msg = '' Then
		dw_list.SetFocus( i, ls_col )
		blEclipse.MessageBox( Title, ls_msg, Exclamation! )
		Return False
	End If
	
Next

dw_list.AcceptText( )

If Not dw_list.Update( ) = 1 Then
	RollBack Using SqlCa ;
	dw_list.SetTransObject( SqlCa )
	blEclipse.MessageBox( Title, 'No se pudo guardar información de Cuentas de Correo Electrónico.', Exclamation! )
	Return False
End If

Commit Using SqlCa ;

ib_saved = True
wf_Open( )
blEclipse.MessageBox( Title, 'Información de Cuentas de Correo Electrónico ha sido guardada correctamente.', Information! )

Return True

end function

public function integer wf_config ();
Return 1
end function

public function long wf_print ();
Return 1
end function

public subroutine wf_add ();
Long	ll_row, ll_cod


If Not ib_permitemod Then Return

If dw_list.Rowcount( ) <= 0 Then
	If Not wf_Open( ) >= 0 Then Return
End If

dw_list.AcceptText( )
ll_row = dw_list.InsertRow( 0 )

dw_list.AcceptText( )
dw_list.SetFocus( ll_row, 'Nombre' )
dw_list.Object.Codigo[ ll_row] = dw_list.Object.NewCod[ ll_row]
Return

end subroutine

on w_mant_cfg_correos_cta.create
call super::create
end on

on w_mant_cfg_correos_cta.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_mant_cfg_correos_cta
event key pbm_dwnkey
integer width = 3543
integer height = 1468
string title = ""
string dataobject = "d_mant_cfg_correos_cta"
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_con'
		ib_msg = True
		wf_Open( )				
		Return
			
	Case 'cb_add'
		ib_msg = False
		wf_Add( )			

End Choose
end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

type dw_menu from w_gen_document_doc`dw_menu within w_mant_cfg_correos_cta
integer width = 4558
integer taborder = 30
string dataobject = "d_gen_menu_toolbar_doc_find"
end type

event dw_menu::constructor;call super::constructor;
Event ReorderButtons( ii_ButtonHomePos, {'cb_save', 'cb_xls' })
end event

event dw_menu::itemchanged;call super::itemchanged;
String	ls_find


data = UpperTrim( data )
If data = '' Then Return

ls_find = '(UpperTrim( Nombre ) Like "%' + data + '%") Or (UpperTrim( Correo ) Like "%' + data + '%") Or (String( Codigo ) = "' + data + '")'
dw_list.Find( ls_find, True )
end event

event dw_menu::clicked;call super::clicked;/*
Choose Case dwo.Name 
	Case 'cb_filteroff'
		This.Object.v_buscar[ row] = ''
		
End Choose*/
end event

type dw_list from w_gen_document_doc`dw_list within w_mant_cfg_correos_cta
event key pbm_dwnkey
event postenter ( long row )
event rowmove ( )
boolean visible = true
integer x = 174
integer y = 500
integer width = 3387
integer height = 1024
integer taborder = 20
string dataobject = "d_mant_cfg_correos_cta_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
boolean ib_ind = true
integer ii_detheight = 100
integer ii_headheight = 100
end type

event dw_list::key;
Long		row
String	ls_cod, ls_fil, &
			ls_tem
uo_datastore lds_1


row = GetRow( )

If key = KeyEnter! Then
	If GetColumnName() = 'nombrecenpago' Then
		If row < RowCount( ) Then
			If f_Zero( This.Object.Cen_Pago[ row] ) = 0 Then
				SetColumn( 'Cen_Pago' )
			Else
				SetColumn( 'Cen_Pago' )
			End If
		Else
			wf_Add( )
			SetColumn( 'Cen_Pago' )
		End If
	Else
		Send(Handle(this),256,9,Long(0,0))
		If row < RowCount( ) Then
			PostEvent( 'rowMove' )
		End If
	End If
	Return
End If


If Not KeyDown(KeyF3!) Then
	Return
End If

Choose Case GetColumnName( )
	Case 'cen_pago' 
		f_CreateDS( lds_1, 'd_mant_nom_centropago_basica', SqlCa )
		lds_1.Retrieve( gi_entprod, '' )
		
		ls_cod = f_GenBuscarDS( lds_1, {ls_cod, 'CPA', ls_fil, '' }, False , 'cen_pago' , This )
		
		If ls_cod = '' Then Return
		
		If lds_1.RowCount( ) <= 0 Then Return
		
		This.Event ItemChanged( GetRow( ), This.Object.cen_pago, ls_cod )
		
End Choose
end event

event dw_list::rowmove();
SetRedraw( False )
ScrollToRow( GetRow()-1 )
SetRedraw( True )

end event

event dw_list::editchanged;call super::editchanged;
ib_saved = False

end event

event dw_list::itemerror;call super::itemerror;
Return 1
end event

event dw_list::clicked;call super::clicked;

If row <= 0 Then Return

SetRow( row )
ScrollToRow( row )

end event

event dw_list::itemchanged;call super::itemchanged;
Int		li_nil, li_cod
Long		ll_fnd
String	ls_fnd


ib_saved = False

SetNull( li_nil )

Choose Case dwo.Name
		
	Case 'codigo'
		This.Object.Nombre[ row] = ''
		
		If data = '' Then Return
		
		ls_fnd = 'Codigo = ' + data 
		ls_fnd = ls_fnd + ' And Not GetRow( ) = ' + f_Trim( row )
		ll_fnd = dw_list.Find( ls_fnd )
		If ll_fnd > 0 Then 
			SelectRow( ll_fnd, True ) 
			blEclipse.MessageBox( Parent.Title, 'Código de Cuenta de Correo se encuentra registrado en la Fila ' + String( ll_fnd) + '.', Exclamation! )
			SelectRow( 0, False ) 
			This.Object.Codigo[ row] = li_nil
			Return 1
		End If
		
	Case 'nombre'
		data = UpperTrim( data )
		If data = '' Then Return
		
		ls_fnd = 'UpperTrim(Nombre) = "' + data + '"'
		ls_fnd = ls_fnd + ' And Not GetRow( ) = ' + f_Trim( row )
		ll_fnd = dw_list.Find( ls_fnd )
		If ll_fnd > 0 Then 
			li_cod = This.Object.Codigo[ ll_fnd]
			SelectRow( ll_fnd, True ) 
			blEclipse.MessageBox( Parent.Title, 'Nombre del Usuario de la Cuenta está registrado (Código ' + String( li_cod ) + ')', Exclamation! )
			SelectRow( 0, False ) 
			This.Object.Nombre[ row] = ''
			Return 1
		End If
				
	Case 'correo'
		data = UpperTrim( data )
		If data = '' Then Return
		
		ls_fnd = 'UpperTrim(Correo) = "' + data + '"'
		ls_fnd = ls_fnd + ' And Not GetRow( ) = ' + f_Trim( row )
		ll_fnd = dw_list.Find( ls_fnd )
		If ll_fnd > 0 Then 
			li_cod = This.Object.Codigo[ ll_fnd]
			SelectRow( ll_fnd, True ) 
			blEclipse.MessageBox( Parent.Title, 'Cuenta de Correo registrada (Código ' + String( li_cod ) + ')', Exclamation! )
			SelectRow( 0, False ) 
			This.Object.Correo[ row] = ''
			Return 1
		End If
				
End Choose
			
This.AcceptText( )


end event

event dw_list::itemfocuschanged;call super::itemfocuschanged;
If ib_ind Then
	Object.r_ind.x = Long( dwo.x ) + 4
	Object.r_ind.y = 4 //Long( dwo.y ) - 4
	Object.r_ind.width = Long( dwo.width ) -4 //+ 8
	Object.r_ind.Height = ii_detHeight - 8 //Long( dwo.Height ) + 8
End If
end event

event dw_list::buttonclicked;call super::buttonclicked;

If row <= 0 Then Return

SetRow( row )
ScrollToRow( row )

Choose Case dwo.Name
	Case 'cb_del'
		If f_Trim( This.Object.c_activo[ row] ) = '0' Then
			This.Object.c_activo[ row] = '1'
		Else
			This.Object.c_activo[ row] = '0'
		End If
		ib_saved = False
			
End Choose
end event

