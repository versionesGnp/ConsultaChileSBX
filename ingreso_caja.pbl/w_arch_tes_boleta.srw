//objectcomments Autor: César Vilela R.~r~nFunción: Obtener_boleta x Cupón
forward
global type w_arch_tes_boleta from w_gen_document_doc
end type
type wb_1 from webbrowser within w_arch_tes_boleta
end type
end forward

global type w_arch_tes_boleta from w_gen_document_doc
integer width = 4325
integer height = 1900
string title = "Consulta Boleta Electrónica"
boolean ib_fulllist = true
boolean ib_ind = true
boolean ib_permitemod = true
boolean ib_new = true
wb_1 wb_1
end type
global w_arch_tes_boleta w_arch_tes_boleta

type variables
String	isFile, isPath
end variables

forward prototypes
public function integer wf_new ()
public subroutine wf_add ()
public function boolean wf_readyforadd ()
public function integer wf_config ()
public function integer opennavigate (string asdb, long alcupon, long alfoliobe, string spath, string sfile)
public function integer sendmail ()
end prototypes

public function integer wf_new ();
DataWindowChild	ldwc_x
DateTime	ld_doc
String	ls_ser, ls_caj


ib_new = True
ib_saved = True

is_emp = gs_emp
ld_doc = DateTime( Today( ) )

dw_1.Reset( )
dw_list.Reset( )
dw_1.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.SetFocus( )


dw_1.AcceptText( )


Return 1
end function

public subroutine wf_add ();
Return 
end subroutine

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( ) */

Boolean	lb_ready

lb_ready = ( dw_1.GetColumnName( ) = 'c_codigo_caj' ) //Or dw_1.GetColumnName( ) = 'c_codigo_fac' )

If lb_ready Then
	wf_Open( )
End If

Return lb_ready

end function

public function integer wf_config ();

Return 1
end function

public function integer opennavigate (string asdb, long alcupon, long alfoliobe, string spath, string sfile);
dw_1.Reset( )
dw_1.InsertRow( 1 )
dw_1.Object.Nro_Cupon[ 1] = alCupon
dw_1.Object.FolioBE[ 1] = alFolioBE
dw_1.Object.DB[ 1] = asDB
dw_1.AcceptText( )

f_GenProcesando( 'Preliminar' )

String	lsDefaultURL

isPath = sPath ; isFile = sFile
lsDefaultURL = sPath + sFile
This.wb_1.SetRedraw( False )

Long llRut, llNum
String	lsBas, lsSer, lsEmail


Choose Case UpperTrim( asDB )
	Case 'PRADO'
		
		Select Distinct rut, base, serie, contrato
		Into	:llRut, :lsBas, :lsSer, :llNum
		From ingreso  
		Where nro_cupon = :alCupon 
		And folio = :alFolioBE ;

		Select email 
		Into :lsEmail
		From	cliente 
		Where rut = :llRut ;
		
		lsEmail = f_Trim(lsEmail)
		If lsEmail = '' Then
			Select correo_electronico 
			Into :lsEmail
			From	cliente_rezago 
			Where rut = :llRut ;		
		End If

		lsEmail = f_Trim(lsEmail)
		
	Case 'FORESTA'
		
		Select Distinct rut, base, serie, contrato
		Into	:llRut, :lsBas, :lsSer, :llNum
		From foresta.ingreso  
		Where nro_cupon = :alCupon 
		And folio = :alFolioBE ;

		Select email 
		Into :lsEmail
		From	cliente 
		Where rut = :llRut ;
		
		lsEmail = f_Trim(lsEmail)
		If lsEmail = '' Then
			Select correo_electronico 
			Into :lsEmail
			From	cliente_rezago 
			Where rut = :llRut ;		
		End If

		lsEmail = f_Trim(lsEmail)
		
End Choose

dw_1.Object.Rut[ 1] = llRut
dw_1.Object.Barra[ 1] = lsBas + lsSer + f_Trim( llNum )
dw_1.Object.EMail[ 1] = lsEmail



Integer	i
String	lsFile, lsChar

For i = 1 To Len( lsDefaultURL )
	
	lsChar = Mid( lsDefaultURL, i, 1 )
	If lsChar = '\' Then lsChar = '/'
	lsFile = lsFile + lsChar
Next


This.wb_1.DefaultURL = 'file:///' + lsFile
This.wb_1.Navigate( w_arch_tes_boleta.wb_1.DefaultURL )
This.wb_1.SetRedraw( True )


dw_1.ColEnabled( {'rut', 'barra', 'nro_cupon', 'folioBE', 'DB'}, False )

Integer liRet



Return liRet

end function

public function integer sendmail ();
String	lsDB, lsEmail

lsDB		= f_Trim( dw_1.Object.DB[ 1] )
lsEmail	= f_Trim( dw_1.Object.EMail[ 1] )

If lsDB = '' Then
	blEclipse.Messagebox( Title, 'Debe seleccionar la DB para poder enviar correo electrónico.', Exclamation! )
	Return 0
End If

lsEmail = 'cvilela@nuestrosparques.cl'
If lsEmail = '' Then
	blEclipse.Messagebox( Title, 'Cliente no tiene asignado un correo electrónico.', Exclamation! )
	Return 0
End If


SendMail SendMail
String	lsBody

lsBody = 'Estimado Cliente.' + Char(13) + Char(13) + &
			'Reciba nuestro cordial saludo, el correo es envíado en cumplimiento y conforme a las disposiciones legales actuales sobre comprobantes digitales.'+ Char(13) + Char(13) + &
			'Nuestros Parques'+ Char(13) + Char(13) +  Char(13) + Char(13) + &
			'(Correo generado automáticamente)'
			
String	lsAttachment

lsAttachment = isPath + isFile

sendMail.sAttachment = lsAttachment
sendMail.GetReady( lsDB )
sendMail.Send( 'Envío Boleta Electrónica', {lsEmail, 'cesarvilela@hotmail.com'}, lsbody, 0 )

Return 1

end function

on w_arch_tes_boleta.create
int iCurrent
call super::create
this.wb_1=create wb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.wb_1
end on

on w_arch_tes_boleta.destroy
call super::destroy
destroy(this.wb_1)
end on

event resize;call super::resize;

wb_1.Resize( dw_list.Width, dw_list.height )
end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_tes_boleta
integer width = 4210
integer height = 652
string dataobject = "d_arch_tes_boleta"
end type

event dw_1::buttonclicked;call super::buttonclicked;String	ls_cod

Choose Case dwo.Name	
	Case 'cb_cli' 
		ls_cod = f_GenBuscar( '', 'c_codigo_prv', 'CLI', This )
		If ls_cod = '' Then Return
		This.Event ItemChanged( 1, Object.c_codigo_prv, ls_cod )
		//wf_RUTMask( )
	
	Case 'cb_send'
		SendMail( )
		
	Case 'cb_consultar'
		wf_Open( )
				
	Case 'cb_1'
		String	ls_db = 'PRADO'
		String	ls_cup = '1573790491'
		String	ls_pag = '03/10/2025'

Boleta	boleta
boleta.Title	= This.Title
boleta.sDB		= ls_DB
boleta.sCupon	= ls_cup
boleta.sFechaPago = ls_pag
boleta.FolioBE = 6173
boleta.lcupon = Long(ls_cup )
String	lsURL, ls_PDFFIle
//		Commit Using SqlCa ;
lsURL = boleta.GetURL( 'PDF' )
String	ls_XRL
ls_XRL = boleta.GetURL( ls_DB, boleta.lcupon, boleta.foliobe, 'PDF' )

ls_PDFFIle = boleta.DownloadPDF( 'C:\\mod_cp\\consulta\\', boleta.sCupon + '.pdf' )
//boleta.PrintPDF( )
//boleta.PrintPDF( 'C:\\mod_cp\\consulta\\', boleta.sCupon + '.pdf', 'print' )
//boleta.PrintPDF( 'C:\\mod_cp\\consulta\\', boleta.sCupon + '.pdf', 'open' )

boleta.Navigate( wb_1, 'C:\\mod_cp\\consulta\\', boleta.sCupon + '.pdf' )
/*
wb_1.DefaultURL = 'file:///C:/mod_cp/consulta/1573790491.pdf'
wb_1.Navigate( wb_1.DefaultURL )
wb_1.Print()
*/
End Choose

end event

event dw_1::itemchanged;call super::itemchanged;

ib_saved = True

dw_list.Reset( )

Choose Case dwo.Name
		
	Case 'c_fec'
		f_colEnabledA( This, {'c_codigo_cto', 'c_codigo_cup' }, ( data = '0' ))
		f_colEnabledA( This, {'d_ini', 'd_fin' }, ( data = '1' ))
		
		If data = '0' Then 
			This.SetColumn( 'c_codigo_cto' )
			Return
		End If
		This.SetColumn( 'd_ini' )
		This.Object.c_codigo_cto[ row] = ''
		This.Object.c_codigo_caj[ row] = ''
		This.Object.c_codigo_cup[ row] = ''
		
	Case 'c_codigo_tdo'
		
	Case 'd_ini'
		DateTime	ld_ini
		
		ld_ini = DateTime( data )
		This.Object.d_Fin[ row] = ld_ini
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod



If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codigo_prv' 
		ls_cod = f_GenBuscar( '', GetColumnName( ), 'CLI', This )
		
		
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

event dw_1::error;call super::error;
Return 
end event

event dw_1::dberror;call super::dberror;
Return 3
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_tes_boleta
integer width = 3497
string dataobject = "d_gen_menu_toolbar_xls"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_tes_boleta
integer x = 160
integer y = 636
integer width = 4064
integer height = 1028
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_detselect = true
end type

event dw_list::itemchanged;call super::itemchanged;ib_saved = False
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;SelectRow( 0 , False )
end event

event dw_list::clicked;call super::clicked;
If row <= 0 Then Return
ScrollToRow( row )

s_parm	lstr_parm

Choose Case dwo.Name
	Case 'cb_det'
		lstr_parm.s_cad[ 1] = This.Object.tipo_cob_pago[ row]
		lstr_parm.s_cad[ 2] = String( LongLong( This.Object.folio_pago[ row] ) )
		lstr_parm.s_cad[ 3] = This.Object.DB[ row]
		
		//OpenWithParm( w_arch_caj_docingreso_consulta, lstr_parm )
		
	/*Case 'cb_cup'
		If IsValid( w_arch_caj_contratoCuponera ) Then Close( w_arch_caj_contratoCuponera )
		OpenSheet( w_arch_caj_contratoCuponera, gw_frame, 1, Original! )
		
		String	ls_bas, ls_ser, ls_cto
		LongLong	ll_num, ll_cup
		
		ls_bas = dw_list.Object.Base[ row]
		ls_ser = dw_list.Object.Serie[ row]
		ll_num = dw_list.Object.Numero[ row]
		ll_cup = dw_list.Object.CuponSiguiente[ row]
		
		ls_cto = ls_bas + ls_ser + f_Trim( String( ll_num ) )
		
		w_arch_caj_contratoCuponera.dw_1.Object.c_codigo_cto[ 1] = ls_cto
		w_arch_caj_contratoCuponera.wf_Open( )
		w_arch_caj_contratoCuponera.dw_list.Find( 'nro_cupon = ' + String( ll_cup ), True )*/
End Choose
end event

type wb_1 from webbrowser within w_arch_tes_boleta
integer x = 160
integer y = 636
integer width = 2290
integer height = 1044
boolean bringtotop = true
boolean border = false
end type

event navigationcompleted;
If Not IsSuccess Then Return

Integer	liRet

f_Delay(1)
liRet = This.Print()

f_GenProcesando( '' )

end event

