forward
global type boleta from nonvisualobject
end type
end forward

global type boleta from nonvisualobject autoinstantiate
end type

type prototypes

end prototypes

type variables


String	sDB, sFechaPago, sCupon, sErrText
LongLong	lCupon, FolioBE
DateTime	dFechaPago
Boolean	bRollBack = True, bMessageBox = False
String	sCode, sMessage, sStatus, Title
String	sPDF, sXML, sPDFFileName, sDownloadPath

end variables

forward prototypes
public function boolean generar (string asdb, string asfechapago, string ascupon)
public function boolean generar (string asdb, datetime adfechapago, longlong alcupon)
public function boolean generar ()
public function string geturl (string asurl)
public function string downloadpdf ()
public function long printpdf ()
public function long printpdf (string spath, string sfile)
public function long printpdf (string spath, string sfile, string soperation)
public function string downloadpdf (string spath, string sfile)
public function string geturl (string asdb, long alcupon, long alfoliobe, string asurl)
public function integer navigate (webbrowser wb, string defaulturl)
public function integer navigate (webbrowser wb, string spath, string sfile)
public function integer opennavigate (string asdb, long alcupon, long alfoliobe, string spath, string sfile)
end prototypes

public function boolean generar (string asdb, string asfechapago, string ascupon);
// Generar( asDB, asFechaPago, asCupon )

This.sDB = asDB
This.sFechapago = asFechaPago
This.sCupon = asCupon
This.sErrText = ''
This.sCode = '' 
This.sStatus = '' 
This.sMessage = ''

String	lsYMD
If f_Zero( This.lCupon ) = 0 Then
	This.lCupon = Long( Long( This.sCupon ) )
	lsYMD = Right( asFechaPago, 4 ) + '/' + Mid(asFechaPago, 4, 2 ) + '/' + Left(asFechaPago, 2)
	This.dFechapago = DateTime( Date( lsYMD ) )
End If

If This.Title = '' Then 
	This.Title = 'Generación de Boletas'
End If

Declare usp_gen Procedure For 
	usp_CajRecepcionBoleta( asParam1 => :sDB, asParam2 => :sFechaPago, asParam3 => :sCupon )
Using SqlCa ;

Execute usp_gen;

This.sErrText = SqlCa.SqlErrText 

If SqlCa.SqlCode = -1 Then
	This.sCode = '-2' 
	This.sStatus = 'ERR' 
	This.sMessage = 'No se pudo ejecutar Procedure usp_CajRecepcionBoleta' + Char(13)+ This.sErrText
	
	If bRollBack Then 
		RollBack Using SqlCa ;
	End If
	If bMessageBox Then 
		blEclipse.MessageBox( Title, This.sErrText, StopSign! )
	End If
	Return False
End If


Fetch usp_gen Into :sCode, :sStatus, :sMessage ;
	
If SqlCa.SqlCode = -1 Then
	This.sErrText = SqlCa.SqlErrText 
	This.sCode = '-2' 
	This.sStatus = 'ERR' 
	This.sMessage = 'No se pudo ejecutar Fetch de Status' + Char(13)+ This.sErrText
	
	If bRollBack Then 
		RollBack Using SqlCa ;
	End If
	Close usp_gen;
	If bMessageBox Then 
		blEclipse.MessageBox( Title, This.sErrText, StopSign! )
	End If
	Return False
End If
	
If This.sStatus = 'ERR' Or This.sStatus = 'ERC' Then
	If bRollBack Then 
		RollBack Using SqlCa ;
	End If
	Close usp_gen;
	If bMessageBox Then 
		blEclipse.MessageBox( Title, This.sMessage, StopSign! )
	End If
	Return False
End If

If This.sStatus = 'MTY' Then
	This.sMessage = 'No se encontró boleta pendiente de generar para el Cupón ' + This.sCupon
	If bRollBack Then 
		RollBack Using SqlCa ;
	End If
	Close usp_gen;
	If bMessageBox Then 
		blEclipse.MessageBox( Title, This.sMessage, Exclamation! )
	End If
	Return False
End If

Close usp_gen;
Commit Using SqlCa ;

This.FolioBE = LongLong( sCode )

Return True

end function

public function boolean generar (string asdb, datetime adfechapago, longlong alcupon);
// Generar( asDB, asFechaPago, asCupon )
Boolean	lbRet

This.sDB = asDB
This.sFechapago = String( adFechaPago, 'yyyymmdd' )
This.sCupon = String( alCupon )
This.lCupon = alCupon 
This.dFechapago = adFechaPago

lbRet = Generar( This.sDB, This.sFechapago, This.sCupon )

Return lbRet


end function

public function boolean generar ();
// Generar( )
Boolean	lbRet

This.sFechapago = String( This.dFechaPago, 'yyyymmdd' )
This.sCupon = String( This.lCupon )

lbRet = Generar( This.sDB, This.sFechaPago, This.sCupon )

Return lbRet


end function

public function string geturl (string asurl);
String lsRet

asURL = UpperTrim( asURL )

Choose Case UpperTrim( This.sDB )
	Case 'PRADO'
		Select urlPDF, urlXML 
		Into	:sPDF, :sXML
		From  prado.log_web_pagos_be
		Where folio = :lCupon
		And	Folio_BE = :FolioBE;
		
		If asURL = 'XML' Then
			lsRet = sXML
		Else
			lsRet = sPDF
		End If
		
		lsRet = f_Trim( lsRet )
		
		
	Case 'FORESTA'
		Select urlPDF, urlXML 
		Into	:sPDF, :sXML
		From  foresta.log_web_pagos_be
		Where folio = :lCupon
		And	Folio_BE = :FolioBE;
		
		If asURL = 'XML' Then
			lsRet = sXML
		Else
			lsRet = sPDF
		End If
		
		lsRet = f_Trim( lsRet )
		
	Case Else
		sPDF = ''
		sXML = ''
		lsRet = 'ERR'
		Return lsRet
End Choose


If lsRet = '' Then
	lsRet = 'ERR'
End If

Return lsRet
end function

public function string downloadpdf ();Long ll_FileNum, ll_rtn, ll_loop, ll_len
Dec{0} ldc_Count, ldc_Length
Blob lb_temp
String ls_url, ls_response, ls_Length

HttpClient lhc_Client

lhc_Client = Create HttpClient

lhc_Client.ClearRequestHeaders()
//ls_URL = "https://ereceipt-cl-s01-uat.sovos.com/Facturacion/PDFServlet?docId=nbNQKpsdXF9HkypLun2PknwE45a3hLDD"
ls_URL = This.sPDF


// Use HEAD method to get the file size
ll_rtn = lhc_Client.SendRequest( "HEAD", ls_url )
ls_response = lhc_Client.GetResponseHeaders()
ls_Length = lhc_Client.GetResponseHeader( "Content-Length" )

ldc_Length = Dec ( ls_Length )
String	ls_nil

SetNull( ls_nil )
If ldc_Length <= 0 Then
	MessageBox( This.Title, "File length is zero.", Exclamation! )
	Return ls_nil
End If
ll_len = Long ( ldc_Length / 10000 )


// Not to read data automatically after sending request (default is true)
lhc_Client.autoreaddata = false
ll_rtn = lhc_Client.SendRequest( "GET", ls_url )

//Receive 16KB data every time
ll_loop = 1024 * 16

//Write data to the file, because the blob variable is not suitable for large data
If This.sPDFFileName = '' Then
	This.sPDFFileName = 'C' + String(This.lCupon) + '_B' + String( This.FolioBE ) + '.PDF'
End If

If Not This.sDownloadPath = '' Then
	If Not Right(This.sDownloadPath, 1) = '\' Then
		This.sDownloadPath = This.sDownloadPath + '\' 
	End If
End If



String	ls_PDF

ls_PDF = This.sDownloadPath + This.sPDFFileName
ll_FileNum = FileOpen( ls_PDF, StreamMode!, Write!, LockWrite!, Replace! )
Do While ( ll_rtn = 1 )
	lb_temp = Blob ( "" )
	ll_rtn = lhc_Client.ReadData( lb_temp, ll_loop)
	FileWrite(ll_FileNum, lb_temp)
	ldc_Count  += Len ( lb_temp )
	yield()
Loop

FileClose(ll_FileNum)
If IsValid ( lhc_Client ) Then Destroy ( lhc_Client )
	
Return ls_PDF
end function

public function long printpdf ();
Long ll_return
String ls_operation = "open" //open/print
String ls_null // Inicializa una variable nula para los parámetros no usados


SetNull( ls_null )

If This.sPDFFileName = '' Then
	This.sPDFFileName = 'C' + String(This.lCupon) + '_B' + String( This.FolioBE ) + '.PDF'
End If

If Not This.sDownloadPath = '' Then
	If Not Right(This.sDownloadPath, 1) = '\' Then
		This.sDownloadPath = This.sDownloadPath + '\' 
	End If
End If


String	ls_PDF

ls_PDF = This.sDownloadPath + This.sPDFFileName

// Verifica que el archivo exista antes de intentar imprimir
If FileExists(ls_PDF) Then
	ll_return = ShellExecute(Handle(Parent), ls_operation, ls_PDF, ls_null, ls_null, 0)
	
	IF ll_return <= 32 Then // Manejo de errores
		blEclipse.MessageBox( This.Title, 'No se pudo imprimir el archivo PDF. Error: ' + String(ll_return), StopSign!)
	End If
Else
	blEclipse.MessageBox( This.Title,"Error: El archivo " + ls_PDF + " no existe.", StopSign!)
End If

Return	ll_return
end function

public function long printpdf (string spath, string sfile);
Long ll_return
String ls_operation = "open" //open/print
String ls_null // Inicializa una variable nula para los parámetros no usados


SetNull( ls_null )

sPath = f_Trim( sPath )
sFile = f_Trim( sFile )

If sPath = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el carpeta/ruta de ubicación del archivo PDF.', Exclamation!)
	Return -1
End If

If sFile = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el nombre del archivo PDF.', Exclamation!)
	Return -1
End If

This.sDownloadPath = sPath
This.sPDFFileName = sFile

If Not This.sDownloadPath = '' Then
	If Not Right(This.sDownloadPath, 1) = '\' Then
		This.sDownloadPath = This.sDownloadPath + '\' 
	End If
End If

ll_return = This.PrintPDF()

Return	ll_return
end function

public function long printpdf (string spath, string sfile, string soperation);
Long ll_return
String ls_null // Inicializa una variable nula para los parámetros no usados


SetNull( ls_null )

sPath = f_Trim( sPath )
sFile = f_Trim( sFile )

If sPath = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el carpeta/ruta de ubicación del archivo PDF.', Exclamation!)
	Return -1
End If

If sFile = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el nombre del archivo PDF.', Exclamation!)
	Return -1
End If

sOperation = LowerTrim( sOperation )

If sOperation = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar la operaciòn open/print.', Exclamation!)
	Return -1
End If


String ls_operation 


This.sDownloadPath = sPath
This.sPDFFileName = sFile
ls_operation = sOperation

If Not This.sDownloadPath = '' Then
	If Not Right(This.sDownloadPath, 1) = '\' Then
		This.sDownloadPath = This.sDownloadPath + '\' 
	End If
End If

String	ls_PDF

ls_PDF = This.sDownloadPath + This.sPDFFileName

// Verifica que el archivo exista antes de intentar imprimir
If FileExists(ls_PDF) Then
	ll_return = ShellExecute(Handle(Parent), ls_operation, ls_PDF, ls_null, ls_null, 0)
	
	IF ll_return <= 32 Then // Manejo de errores
		blEclipse.MessageBox( This.Title, 'No se pudo imprimir el archivo PDF. Error: ' + String(ll_return), StopSign!)
	End If
Else
	blEclipse.MessageBox( This.Title,"Error: El archivo " + ls_PDF + " no existe.", StopSign!)
End If

Return	ll_return

end function

public function string downloadpdf (string spath, string sfile);
String sRet


sPath = f_Trim( sPath )
sFile = f_Trim( sFile )

If sPath = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el carpeta/ruta de ubicación del archivo PDF.', Exclamation!)
	Return sRet
End If

If sFile = '' Then
	blEclipse.MessageBox( This.Title, 'Debe especificar el nombre del archivo PDF.', Exclamation!)
	Return sRet
End If

This.sDownloadPath = sPath
This.sPDFFileName = sFile

If Not This.sDownloadPath = '' Then
	If Not Right(This.sDownloadPath, 1) = '\' Then
		This.sDownloadPath = This.sDownloadPath + '\' 
	End If
End If

sRet = This.DownloadPDF()

Return	sRet
end function

public function string geturl (string asdb, long alcupon, long alfoliobe, string asurl);
String lsRet

asURL = UpperTrim( asURL )

Choose Case UpperTrim( asDB )
	Case 'PRADO'
		Select urlPDF, urlXML 
		Into	:sPDF, :sXML
		From  prado.log_web_pagos_be
		Where folio = :alCupon
		And	Folio_BE = :alFolioBE;
		
		If asURL = 'XML' Then
			lsRet = sXML
		Else
			lsRet = sPDF
		End If
		
		lsRet = f_Trim( lsRet )
		
		
	Case 'FORESTA'
		Select urlPDF, urlXML 
		Into	:sPDF, :sXML
		From  foresta.log_web_pagos_be
		Where folio = :alCupon
		And	Folio_BE = :alFolioBE;
		
		If asURL = 'XML' Then
			lsRet = sXML
		Else
			lsRet = sPDF
		End If
		
		lsRet = f_Trim( lsRet )
		
	Case Else
		sPDF = ''
		sXML = ''
		lsRet = 'ERR'
		Return lsRet
End Choose


If lsRet = '' Then
	lsRet = 'ERR'
End If

Return lsRet
end function

public function integer navigate (webbrowser wb, string defaulturl);

Integer	i
String	lsFile, lsChar

For i = 1 To Len( DefaultURL )
	
	lsChar = Mid( DefaultURL, i, 1 )
	If lsChar = '\' Then lsChar = '/'
	lsFile = lsFile + lsChar
Next


wb.DefaultURL = 'file:///' + lsFile
wb.Navigate( wb.DefaultURL )

Integer liRet

liRet = wb.Print()

Return liRet
end function

public function integer navigate (webbrowser wb, string spath, string sfile);

Integer	i
String	lsDefaultURL

Integer liRet

lsDefaultURL = sPath + sFile
liRet = This.Navigate( wb, lsDefaultURL )

Return liRet
end function

public function integer opennavigate (string asdb, long alcupon, long alfoliobe, string spath, string sfile);
// OpenNavigate( asDB, alCupon, alFolioBE, sPath, sFile )


If isValid( w_arch_tes_boleta ) Then 
	Close( w_arch_tes_boleta )
End If

OpenSheet( w_arch_tes_boleta, gw_frame, 1, Original! )
w_arch_tes_boleta.OpenNavigate( asDB, alCupon, alFolioBE, sPath, sFile )
Return 1


w_arch_tes_boleta.dw_1.Object.Nro_Cupon[ 1] = alCupon
w_arch_tes_boleta.dw_1.Object.FolioBE[ 1] = alFolioBE
w_arch_tes_boleta.dw_1.Object.DB[ 1] = asDB
w_arch_tes_boleta.dw_1.AcceptText( )
f_Delay( 2 )

REturn 1

String	lsDefaultURL

lsDefaultURL = sPath + sFile
w_arch_tes_boleta.wb_1.SetRedraw( False )
//liRet = This.Navigate( w_arch_tes_boleta.wb_1, lsDefaultURL )


Integer	i
String	lsFile, lsChar

For i = 1 To Len( lsDefaultURL )
	
	lsChar = Mid( lsDefaultURL, i, 1 )
	If lsChar = '\' Then lsChar = '/'
	lsFile = lsFile + lsChar
Next


w_arch_tes_boleta.wb_1.DefaultURL = 'file:///' + lsFile
w_arch_tes_boleta.wb_1.Navigate( w_arch_tes_boleta.wb_1.DefaultURL )

Integer liRet

liRet = w_arch_tes_boleta.wb_1.Print()



w_arch_tes_boleta.wb_1.SetRedraw( True )

Return liRet
end function

on boleta.create
call super::create
TriggerEvent( this, "constructor" )
end on

on boleta.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

