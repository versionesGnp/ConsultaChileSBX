//objectcomments /* Autor: César Vilela */ ~r~nConfiguración de envíos de correo
forward
global type w_mant_cfg_correos from w_gen_document_doc
end type
end forward

global type w_mant_cfg_correos from w_gen_document_doc
integer width = 4590
integer height = 1900
string title = "Configuración de Envíos de Correo"
boolean ib_fulllist = true
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
global w_mant_cfg_correos w_mant_cfg_correos

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
public function integer wf_opendoc (string as_doc, string as_parm, w_gen_document_doc aw_doc)
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
Integer	li_nil, li_cor, li_con


dw_1.SetFocus( )
dw_1.AcceptText( )

If Not wf_LostChanges( ) Then Return -1

Integer	li_ret

dw_list.SetRedraw( False )

SetNull( li_nil )
li_con = li_nil
li_cor = li_nil
li_ret = dw_list.Retrieve( li_con, li_cor, 'CAB' )
dw_list.SetRedraw( True )

Commit Using SqlCa ;

ib_msg = True
ib_PermiteMod = True

Return li_ret

end function

public function boolean wf_savedocument ();
Integer	li_etd
Long		i, ll_gru
String	ls_tem, ls_atv, ls_nom, &
			ls_msg, ls_col


dw_1.AcceptText( )
dw_list.AcceptText( )

li_etd = dw_1.Object.CodEntProduccion[ 1]
ls_tem = dw_1.Object.Temporada[ 1]

If ls_tem = '' Then
	dw_1.SetFocus( 'Temporada' )
	blEclipse.MessageBox( Title, 'Debe seleccionar la Temporada para poder continuar.', Exclamation! )
	Return False	
End If

For i = 1 To dw_list.RowCount( )
	ll_gru = f_Zero( dw_list.Object.Cen_Pago[ i] )
	ls_nom = f_Trim( dw_list.Object.NombreCenPago[ i] )
	ls_atv = f_Trim( dw_list.Object.c_activo[ i] ) 
	
	If Not ls_atv = '1' Then ls_atv = '0' 
	
	If ls_atv = '0' And ls_nom = '' Then 
		dw_list.Object.NombreCenPago[ i] = '* Eliminado *'
	End If
	
	If ls_atv = '0' Then Continue
	If ll_gru <= 0 And ls_nom = '' Then Continue
	
	If ls_msg = '' And ll_gru <= 0 Then
		ls_msg = 'Debe ingresar Código del Centro de Pago'
		ls_col = 'Cen_Pago'
	End If
	
	If ls_msg = '' And ls_nom = '' Then
		ls_msg = 'Debe ingresar Nombre del Centro de Pago'
		ls_col = 'NombreCenPago'
	End If
	
	If Not ls_msg = '' Then
		dw_list.SetFocus( i, ls_col )
		blEclipse.MessageBox( Title, ls_msg, Exclamation! )
		Return False
	End If
	
	dw_list.Object.CodEntProduccion[ i] = li_etd
	dw_list.Object.Temporada[ i] = ls_tem

Next

dw_list.AcceptText( )

Do While True
	i = dw_list.Find( 'c_activo = "0"' )
	If i > 0 Then
		dw_list.DeleteRow( i )
	Else
		Exit
	End If
Loop

dwItemStatus l_status
DateTime	ld_hoy
String	ls_usu, ls_wks

li_etd = gi_EntProd
ls_usu = gs_usuario
ls_wks = f_GetPcName( )
ld_hoy = f_ServerDate( )
/*
For i = 1 To dw_list.RowCount( )
	ll_gru = f_Zero( dw_list.Object.Cen_Pago[ i] )
	ls_nom = f_Trim( dw_list.Object.NombreCenPago[ i] )
	ls_atv = f_Trim( dw_list.Object.c_activo[ i] ) 
	
	l_status = dw_list.GetItemStatus( i, 0, Primary!)
	Choose Case l_status 
		Case NewModified!
			dw_list.Object.CodEntProduccion[ i] = li_etd
			dw_list.Object.c_codigo_wks[ i] = ls_wks
			dw_list.Object.c_codigo_usu[ i] = ls_usu 
			dw_list.Object.d_creacion[ i] = ld_hoy
			If Not ls_atv = '0' Then
				dw_list.Object.c_activo[ i] = '1'
			End If
			
		Case DataModified!
			dw_list.Object.c_codmod_wks[ i] = ls_wks
			dw_list.Object.c_usumod[ i] = ls_usu
			dw_list.Object.d_modifi[ i] = ld_hoy
	End Choose
	dw_list.AcceptText( )
Next
*/
If Not dw_list.Update( ) = 1 Then
	RollBack Using SqlCa ;
	dw_list.SetTransObject( SqlCa )
	blEclipse.MessageBox( Title, 'No se pudo guardar información de Centros de Pago para Bonos.', Exclamation! )
	Return False
End If

Commit Using SqlCa ;

ib_saved = True
wf_Open( )
blEclipse.MessageBox( Title, 'Información de Centros de Pago para Bonos ha sido guardada correctamente', Information! )

Return True

end function

public function integer wf_config ();

dw_list.SetObjectColor( 'Descripcion', 'o')

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


wf_OpenDoc( '', '', This )

Return

end subroutine

public function integer wf_opendoc (string as_doc, string as_parm, w_gen_document_doc aw_doc);
/* wf_OpenDoc( '', '', Parent )*/

Long	row
Int 		li_cod, li_nil
String	ls_ok

If as_doc = '' Then
	li_cod = 0
Else
	row = dw_list.GetRow( )
	If row <= 0 Then Return 0
	li_cod = dw_list.Object.Codigo[ row]
End If

OpenWithParm( w_mant_cfg_Correos_Edit, li_cod )
ls_ok = f_Trim( Message.StringParm )

If ls_ok = '' Then 
	Return 0
End If

uo_DataStore lds_1

SetNull( li_nil )
If li_cod = 0 Then
	li_cod = Integer( ls_ok )
End If

f_CreateDS( lds_1, dw_list.DataObject, SqlCa )
lds_1.Retrieve( li_cod, li_nil, 'CAB' )

If Not lds_1.RowCount( ) > 0 Then Return -1

If as_doc = '' Then
	row = dw_list.InsertRow(0)
End If

lds_1.ColumnsCopy( 1, {'Codigo', 'Descripcion', 'Asunto', 'Contenido', 'Activo', 'Usuario_Registro','Fecha_Registro', 'Correos'}, dw_list, row )
dw_list.AcceptText( )

dw_list.ScrollToRow( row )

Return li_cod
end function

on w_mant_cfg_correos.create
call super::create
end on

on w_mant_cfg_correos.destroy
call super::destroy
end on

event resize;call super::resize;
dw_1.Height = NewHeight - dw_menu.Y - 150
dw_list.height = newheight - (dw_list.y ) - 220

end event

type dw_1 from w_gen_document_doc`dw_1 within w_mant_cfg_correos
event key pbm_dwnkey
integer width = 4462
integer height = 1504
string title = ""
string dataobject = "d_mant_cfg_correos"
end type

event dw_1::key;
If Not KeyDown(KeyF3!) Then
	Return
End If

Choose Case GetColumnName( )
	Case 'cod_emp' 
		This.Event ButtonClicked( 1, 1, This.Object.cb_tra )
				
	Case 'cb_con'
		wf_Add( )				
		Return
		
End Choose

end event

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

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
Integer li_nil, li_dia


dw_list.Reset( )

data = f_Trim( data )

SetNull( li_nil )

Choose Case dwo.Name

	Case 'temporada'
		dw_1.GetChild( 'semana', ldwc_x )
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( gi_entprod, data )
		ldwc_x.InsertRow( 1 )
		ldwc_x.SetITem( 1, 'Semana', li_nil )
		ldwc_x.SetITem( 1, 'v_nombre_sem', ' - Seleccionar -' )
		
	Case 'dia'
		
		This.GetChild( 'Hoja', ldwc_x )
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Reset( )
		
		If data = '' Then Return
		li_dia = Integer( data )
		
		If li_dia < 0 Or li_dia > 7 Then
			blEclipse.MessageBox( Parent.Title, 'Día Incorrecto.', Exclamation! )
			This.Object.dia[ row] = li_nil
			Return 1
		End If
		
		String	ls_tem
		Integer	li_sem
		
		ls_tem = f_Trim( This.Object.Temporada[ row] )
		li_sem = f_Zero( This.Object.Semana[ row] )
		ldwc_x.Retrieve( gi_entprod, ls_tem, li_sem, li_dia )
		
	Case 'apuntador'
		If data = '' Then Return
		
		If f_GetGenerica( data, 'APU' ) = '' Then
			blEclipse.MessageBox( Parent.Title, 'Código de Apuntador No Existe.', Exclamation! )
			This.Object.apuntador[ row] = li_nil
			Return 1
		End If
		
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

type dw_menu from w_gen_document_doc`dw_menu within w_mant_cfg_correos
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

ls_find =	'( UpperTrim( Descripcion ) Like "%' + data + '%") Or ' + &
				'( UpperTrim( Asunto ) Like "%' + data + '%") Or ' + &
				'( UpperTrim( Contenido ) Like "%' + data + '%") Or ' + &
				'( UpperTrim( Correos ) Like "%' + data + '%") '
dw_list.Filter( ls_Find )

end event

event dw_menu::clicked;
Choose Case dwo.Name 
	Case 'cb_filteroff'
		This.Object.v_buscar[ row] = ''
      dw_list.Filter( '' )
		dw_list.Sort()
		
	Case Else
		wf_Menu( dwo.Name )
End Choose
end event

type dw_list from w_gen_document_doc`dw_list within w_mant_cfg_correos
event key pbm_dwnkey
event postenter ( long row )
event rowmove ( )
boolean visible = true
integer x = 174
integer y = 488
integer width = 2702
integer height = 788
integer taborder = 20
string dataobject = "d_mant_cfg_correos_det"
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
Int		li_nil
Long		ll_fnd
String	ls_fnd


ib_saved = False

SetNull( li_nil )

Choose Case dwo.Name
		
	Case 'cen_pago'
		This.Object.NombreCenPago[ row] = ''
		
		If data = '' Then Return
		
		ls_fnd = 'Cen_Pago = ' + data 
		ls_fnd = ls_fnd + ' And Not GetRow( ) = ' + f_Trim( row )
		ll_fnd = dw_list.Find( ls_fnd )
		If ll_fnd > 0 Then 
			SelectRow( ll_fnd, True ) 
			blEclipse.MessageBox( Parent.Title, 'Código de Centro de Pago se encuentra registrado en la Fila ' + String( ll_fnd) + '.', Exclamation! )
			SelectRow( 0, False ) 
			This.Object.Cen_Pago[ row] = li_nil
			Return 1
		End If
		
		Integer	li_etd, li_cpa
		String	ls_nom 
		
		li_etd = dw_1.Object.CodEntProduccion[ 1]
		li_cpa = Integer( data )
		
		Select Nombre 
		Into   :ls_nom
		From   CatCentrosPago
		Where  CodEntProduccion = :li_etd
		And    Cen_pago = :li_cpa 
		Using	 SqlCa ;
		
		This.Object.NombreCenPago[ row] = UpperTrim( ls_nom )
		
	Case 'nombrecenpago'
		data = UpperTrim( data )
		If data = '' Then Return
		
		ls_fnd = 'UpperTrim(NombreCenPago) = "' + data + '"'
		ls_fnd = ls_fnd + ' And Not GetRow( ) = ' + f_Trim( row )
		ll_fnd = dw_list.Find( ls_fnd )
		If ll_fnd > 0 Then 
			SelectRow( ll_fnd, True ) 
			blEclipse.MessageBox( Parent.Title, 'Nombre de Centro de Pago se encuentra registrado en la Fila ' + String( ll_fnd) + '.', Exclamation! )
			SelectRow( 0, False ) 
			This.Object.NombreCenPago[ row] = ''
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
			
	Case 'cb_edi'
		wf_OpenDoc( String(Object.Codigo[ row]), '', Parent )
End Choose
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;

If CurrentRow > 0 Then
	dw_1.Object.Contenido[ 1] = This.Object.Contenido[ CurrentRow]
Else
	dw_1.Object.Contenido[ 1] = ''
End If

end event

event dw_list::doubleclicked;call super::doubleclicked;

If row <= 0 Then Return

Int li_cod

li_cod = dw_list.Object.Codigo[ row]

wf_OpenDoc( String(li_cod), '', Parent )
end event

