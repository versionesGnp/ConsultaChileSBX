//objectcomments Autor: César Vilela R.~r~nFunción: consulta y edición de la lista de precios MultiProducto
forward
global type w_arch_mul_rangonumero from w_gen_document_doc
end type
end forward

global type w_arch_mul_rangonumero from w_gen_document_doc
integer width = 5751
integer height = 1900
string title = "Rango de Contratos"
boolean ib_fulllist = true
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_mul_rangonumero w_arch_mul_rangonumero

type variables

end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_readyforadd ()
public function integer wf_open ()
public function integer wf_config ()
public subroutine wf_add ()
public function boolean wf_savedocument ()
end prototypes

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_list.Reset( )
dw_1.SetTransObject( SqlCa )


dw_1.InsertRow(0)
If Not is_DB = '' Then dw_1.Object.DB[ 1] = is_DB
dw_1.SetFocus( )


Return 1


end function

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( ) */

Boolean	lb_ready

lb_ready = ( dw_1.GetColumnName( ) = 'db' )

If lb_ready Then
	wf_Open( )
End If

Return lb_ready

end function

public function integer wf_open ();
Int		li_nil
String	ls_db, ls_nil


dw_1.AcceptText( )

ls_DB = UpperTrim( dw_1.Object.DB[ 1] )
SetNull( li_nil ) ; SetNull( ls_nil ) ;

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

f_GenProcesando( 'Generando Consulta, Espere...' )

dw_list.SetRedraw( False )

dw_list.Retrieve( ls_DB )

dw_list.SetRedraw( True )
dw_list.SetFocus( )
f_GenProcesando( '' )

Return 1
end function

public function integer wf_config ();
dw_list.SetObjectColor( {'Base', 'nomTipoContrato'}, 'o')

Return 1
end function

public subroutine wf_add ();
Boolean	lb_gencod
Integer	li_gru, li_cod
Long		row
String	ls_DB

dw_1.AcceptText( )

ls_DB = UpperTrim( dw_1.Object.DB[ 1] )
li_gru = 1
SetNull( li_cod )

If dw_list.RowCount( ) <= 0 Then 
	wf_Open( )
End If

lb_gencod = True

row = dw_list.InsertRow( 0 )
dw_list.Object.DB[ row] = ls_DB
dw_list.Object.usuCreacion[ row] = gs_usuario
dw_list.Object.fCreacion[ row] = TodayDT( )
dw_list.AcceptText( )
 

dw_list.SetFocus( row, 'Base' )



end subroutine

public function boolean wf_savedocument ();
LongLong	ll_ini, ll_fin, i
String	ls_DB, ls_bas, ls_ser, ls_nom, &
			ls_col, ls_gen, ls_edo, ls_msg
			
dw_1.AcceptText( )
dw_list.AcceptText( )

ls_DB = dw_1.Object.DB[ 1]
dwItemStatus l_status
DateTime	ld_hoy

ld_hoy = TodayDT( )

For i = 1 To dw_list.RowCount( )
	ls_bas = UpperTrim( dw_list.Object.Base[ i] )
	ls_nom = UpperTrim( dw_list.Object.nomTipoContrato[ i] )
	If ls_bas = '' And ls_nom = '' Then Continue
	
	ls_ser = UpperTrim( dw_list.Object.Serie[ i] )
	ll_ini = f_Zero( dw_list.Object.NumeroIni[ i] ) 
	ll_fin = f_Zero( dw_list.Object.NumeroFin[ i] ) 

	If ls_msg = '' And ls_ser = '' Then
		ls_msg = 'Debe ingresar la serie del Contrato.'
		ls_col = 'Serie'
	End If
	
	If ls_msg = '' And ll_ini <= 0 Then
		ls_msg = 'Número Inicial de Contrato debe ser mayor a cero.'
		ls_col = 'NumeroIni'
	End If
	
	If ls_msg = '' And ( ll_fin <= 0 Or ll_fin <= ll_ini ) Then
		ls_msg = 'Número Final de Contrato debe ser mayor a cero y Mayor al Número inicial.'
		ls_col = 'NumeroFin'
	End If
	
	If Not ls_msg = '' Then
		blEclipse.MessageBox( Title, ls_msg, Exclamation! )
		dw_list.SetFocus( i, ls_col )
		Return False
	End If

	l_status = dw_list.GetItemStatus( i, 0, Primary!)
	Choose Case l_status 
		Case NewModified!
			
		Case DataModified!
			dw_list.Object.usuModificacion[ i] = gs_usuario
			dw_list.Object.fModificacion[ i] = ld_hoy
	End Choose
Next
	
If dw_list.Update( True ) = 1 Then
	Commit Using SqlCa ;
	blEclipse.MessageBox( Title, 'Lista de Rango de Contratos ha sido Guardada correctamente.' )
Else
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, 'No se puedo guardar Lista de Rango de Contratos.', StopSign! )
	Return False
End If

ib_saved = True
Return True

end function

on w_arch_mul_rangonumero.create
call super::create
end on

on w_arch_mul_rangonumero.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_rangonumero
integer width = 5061
integer height = 652
string title = ""
string dataobject = "d_arch_mul_rangonumero"
end type

event dw_1::buttonclicked;call super::buttonclicked;String	ls_cod

Choose Case dwo.Name	
	Case 'cb_consultar'
		wf_Open( )
				
	Case 'cb_add'
		wf_Add( )			
		
End Choose

end event

event dw_1::itemchanged;call super::itemchanged;
String	ls_emp, ls_cod, ls_nom


ib_saved = True
ls_emp = gs_emp

dw_list.Reset( )

Choose Case dwo.Name
		
	Case 'c_codigo_prv'
		
		data = f_Trim( data )
		If data = '' Then Return
		/*
		ls_cod = f_GenFormatPrv( ls_emp, data )
		ls_nom = f_GetGenerica( ls_cod, 'PRV' )
		If Not data = '' And ls_nom = '' Then
			data = f_GenBuscar( '@' + data, 'c_codigo_prv', 'PRV', This )
		Else
			data = ls_cod
		End If
		*/
		SetText( data )
		AcceptText( )
		
		If data = '' Then Return 1
		
		Return 2	
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod


If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codigo_prv' 
		ls_cod = f_GenBuscar( '', GetColumnName( ), 'PRV', This )
		
		
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_rangonumero
integer width = 5061
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_rangonumero
boolean visible = true
integer x = 169
integer y = 628
integer width = 4777
integer height = 1072
string dataobject = "d_arch_mul_rangonumero_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_filter = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_maxwidth = 4780
end type

event dw_list::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_del'

		This.AcceptText( )
		ScrollToRow( row )
		
		If Not blEclipse.Messagebox( Parent.Title, '¿Confirma que desea eliminar este Tipo de Contrato en la Configuracón de Rangos?', Question!, YesNo! ) = 1 Then
			Return
		End If
		
		This.DeleteRow(0)
		
		If This.Rowcount( ) = 0 Then
			dw_1.SetFocus( )
		End If
		ib_saved = False
End Choose
end event

event dw_list::itemchanged;call super::itemchanged;
LongLong	ll_ini, ll_fin

ib_saved = False

Choose Case dwo.Name
	Case 'base'
		
		String	ls_des, ls_cod, ls_nil, ls_fnd
		
		ls_cod = UpperTrim( data )
		This.Object.nomTipoContrato[ row] = ''
		
		If ls_cod = '' Then
			Return
		End If
		
		ls_fnd = 'Base = "' + ls_cod + '" And Not GetRow() = ' + String( row )
		If dw_list.Find( ls_fnd ) > 0 Then
			blEclipse.Messagebox( Parent.Title, 'Base de Tipo de Contrato ya está ingresado en el listado.', Exclamation! )
			This.Object.Base[ row] = ls_nil
			Return 1
		End If
		
		SetNull( ls_nil )
		Select	Descripcion
		Into		:ls_des
		From		tipo_contrato tco
		Where		tco.codigo = :ls_cod ;
		
		ls_des = f_WordCap( f_Trim( ls_des ) )
		
		If ls_des = '' Then
			blEclipse.Messagebox( Parent.Title, 'Base de Tipo de Contrato no encontrado.', Exclamation! )
			This.Object.Base[ row] = ls_nil
			Return 1
		End If
		
		This.Object.nomTipoContrato[ row] = ls_des
		
		AcceptText( )
		
	Case 'numeroini'
		SetNull( ll_fin )
		This.Object.NumeroFin[ row] = ( ll_fin )
		
	Case 'numerofin'
		ll_ini = f_Zero( This.Object.NumeroIni[ row] )
		ll_fin = LongLong( data )
		
		If ll_fin <= ll_ini Then
			SetNull( ll_fin )
			blEclipse.Messagebox( Parent.Title, 'Número Final no puede ser menor o igual al Número de contrato inicial.', Exclamation! )
			This.Object.NumeroFin[ row] = ll_fin
			Return 1
		End If
		
End Choose
end event

event dw_list::error;call super::error;
Return 
end event

event dw_list::itemerror;call super::itemerror;
Return 1
end event

