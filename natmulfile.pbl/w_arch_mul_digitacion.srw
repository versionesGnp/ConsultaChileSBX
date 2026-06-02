//objectcomments Autor: César Vilela R.~r~nFunción: consulta de contratos MultiProducto listos para Revisión
forward
global type w_arch_mul_digitacion from w_gen_document_doc
end type
end forward

global type w_arch_mul_digitacion from w_gen_document_doc
integer width = 4325
integer height = 1900
string title = "Contratos MultiProducto para Digitación"
boolean ib_fulllist = true
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbdelete = false
boolean ib_cbprint = false
boolean ib_cbsave = false
boolean ib_cbadd = false
boolean ib_cbshare = false
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_mul_digitacion w_arch_mul_digitacion

type variables
String	is_doc, is_dir
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_readyforadd ()
public function integer wf_open ()
public function integer wf_config ()
end prototypes

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_list.Reset( )
dw_1.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.SetFocus( )

String ls_DB

ls_DB = is_DB
If ls_DB = '' Then ls_DB = ' '
dw_1.Object.DB[ 1] = ls_DB
dw_1.SetColumn( 'c_codigo_cto' ) 

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
LongLong	ln_rut
String	ls_cto, ls_db, ls_nil


dw_1.AcceptText( )

ls_cto = f_Trim( dw_1.Object.c_codigo_cto[ 1] )
ln_rut = f_Zero( dw_1.Object.rut[ 1] )
ls_DB = f_Trim( dw_1.Object.DB[ 1] )

If ls_cto = '' And ln_rut = 0 Then
	ls_cto = 'M' 
End If

If ls_cto = '' And ln_rut = 0 Then
	blEclipse.Messagebox( Title, 'Debe ingresar el Contrato (B-S-Nº) o el RUT del Cliente.', Exclamation! )
	Return 0
End If

If ls_cto = '' Then SetNull( ls_cto )
If ln_rut = 0 Then SetNull( ln_rut )
If ls_DB = '' Then SetNull( ls_DB )

f_GenProcesando( 'Generando Consulta, Espere...' )

dw_list.SetRedraw( False )

Int		li_par
Long		li_num
String	ls_bas, ls_ser


SetNull( li_par )
SetNull( li_num )
SetNull( ls_bas )
SetNull( ls_ser )

dw_list.Retrieve( ls_cto, ls_bas, ls_ser, li_num, ln_rut, li_par, 'LIS', ls_DB )

dw_list.SetRedraw( True )
dw_list.SetFocus( )
f_GenProcesando( '' )

Return 1
end function

public function integer wf_config ();

dw_list.SetObjectColor( 'barra', 'o')
dw_list.SetObjectColor( 'NombreMP', 'st')
dw_list.SetObjectColor( 'v_nombre_par', 'Alegria6')
dw_list.SetObjectColor( 'p_det', 'b')
dw_list.SetObjectColor( 'p_hijo', 'ba')

Return 1
end function

on w_arch_mul_digitacion.create
call super::create
end on

on w_arch_mul_digitacion.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_digitacion
integer width = 4210
integer height = 652
string dataobject = "d_arch_mul_digitacion"
end type

event dw_1::buttonclicked;call super::buttonclicked;String	ls_cod

Choose Case dwo.Name	
	Case 'cb_prv' 
		ls_cod = f_GenBuscar( '', 'c_codigo_prv', 'PRV', This )
		If ls_cod = '' Then Return
		
	Case 'cb_consultar'
		wf_Open( )
				
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

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_digitacion
integer width = 3497
string dataobject = "d_gen_menu_toolbar_xls"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_digitacion
boolean visible = true
integer x = 169
integer y = 628
integer width = 4064
integer height = 1072
string dataobject = "d_arch_mul_digitacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_search = true
boolean ib_detselect = true
end type

event dw_list::buttonclicked;call super::buttonclicked;
SelectRow( 0 , False )
If row > 0 Then This.ScrollToRow( row )

Choose Case dwo.Name
		
	Case 'cb_det', 'p_det'
		Long		ll_nro, ll_rut, ll_par
		String	ls_bar, ls_bas, ls_ser, ls_DB
		
		This.ScrollToRow( row )
		
		ls_bar = f_Trim( This.Object.Barra[ row] )
		ll_par = f_Zero( This.Object.Cod_Parque[ row] )
		ls_bas = f_Trim( This.Object.Base[ row] )
		ls_ser = f_Trim( This.Object.Serie[ row] )
		ll_nro = f_Zero( This.Object.Numero[ row] )
		ll_rut = f_Zero( This.Object.Rut[ row] )
		ls_DB  = UpperTrim( This.Object.DB[ row] )
		
		If ll_rut = 0 Then
			SetNull(  ll_rut )
		End If
		
		OpenSheetWithParm( w_arch_mul_digitacion_info, This, gw_frame, 1, Original! )
		w_arch_mul_digitacion_info.wf_OpenDoc( ls_bar, ll_rut, ll_par, ls_DB )
End Choose
end event

event dw_list::doubleclicked;call super::doubleclicked;
If Not row > 0 Then Return

This.ScrollToRow( row )
This.Event ButtonClicked( row, 1, This.Object.cb_det )

end event

event dw_list::clicked;call super::clicked;
If row > 0 Then This.ScrollToRow( row )

end event

