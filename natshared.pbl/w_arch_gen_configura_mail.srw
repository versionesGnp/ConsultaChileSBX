forward
global type w_arch_gen_configura_mail from w_gen_document_doc
end type
end forward

global type w_arch_gen_configura_mail from w_gen_document_doc
integer height = 2476
string title = "Configuración - Servicio Correos"
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbexcel = false
boolean ib_cbdelete = false
boolean ib_ind = true
end type
global w_arch_gen_configura_mail w_arch_gen_configura_mail

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public function integer wf_sendmail ()
end prototypes

public function integer wf_new ();
String	ls_adm

ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )


If f_Zero( dw_1.Retrieve( ) ) <=0 Then
	dw_1.InsertRow(0)
	dw_1.Object.DB[ 1] = gs_Empresa
	dw_1.Object.sUser[ 1] = gs_usuario
	dw_1.Object.dcreacion[ 1] = Today( )
Else
	dw_1.Object.susermod[ 1] = gs_usuario
	dw_1.Object.dmodificacion[ 1] = Today( )
End If

dw_1.SetFocus( )

Return 1
end function

public function boolean wf_savedocument ();
String	ls_DB, ls_des1, ls_host, ls_port, ls_user, ls_pass, ls_from, ls_name, ls_add1


dw_1.AcceptText( )

ls_DB = f_Trim( dw_1.Object.DB[ 1] ) 
If ls_DB = '' Then
	blEclipse.MessageBox( Title, 'Debe seleccionar DB.', Exclamation! )
	dw_1.SetFocus( 'DB' )
	Return False
End If

ls_host = f_Trim( dw_1.Object.smhost[ 1] ) 
If ls_host = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Host Name.', Exclamation! )
	dw_1.SetFocus( 'smhost' )
	Return False
End If

ls_port = f_Trim( dw_1.Object.SMPort[ 1] ) 
If ls_port = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar el SMTP Port.', Exclamation! )
	dw_1.SetFocus( 'SMPort' )
	Return False
End If

ls_user = f_Trim( dw_1.Object.SMUser[ 1] ) 
If ls_user = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar la cuenta User Name.', Exclamation! )
	dw_1.SetFocus( 'SMUser' )
	Return False
End If

ls_pass = f_Trim( dw_1.Object.SMPassword[ 1] ) 
If ls_pass = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar password asociado al User Name.', Exclamation! )
	dw_1.SetFocus( 'SMPassword' )
	Return False
End If

ls_from = f_Trim( dw_1.Object.SMFromAddress[ 1] ) 
If ls_from = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Cuenta de Correo Origen.', Exclamation! )
	dw_1.SetFocus( 'SMFromAddress' )
	Return False
End If

ls_name = f_Trim( dw_1.Object.SMFromName[ 1] ) 
If ls_name = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Nombre (Etiqueta) para la Cuenta de Correo Origen.', Exclamation! )
	dw_1.SetFocus( 'SMFromName' )
	Return False
End If

/*
ls_add1 = f_Trim( dw_1.Object.SMToAddress1[ 1] ) 
If ls_add1 = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar correo de Destinatario 1.', Exclamation! )
	dw_1.SetFocus( 'SMToAddress1' )
	Return False
End If
*/

f_GenProcesando( Title + '~r~nGuardando Información' )

If Not dw_1.Update( True ) = 1 Then
	RollBack Using SqlCa ;
	f_GenProcesando( '' )
	dw_1.SetTransObject( SqlCa )
	Return False
End If

Commit Using SqlCa;

ib_saved = True
ib_new = False


f_GenProcesando( '' )
blEclipse.MessageBox( Title, 'Información ha sido guardada correctamente.' )

gw_frame.SetMicroHelp( 'Listo' )

Return True

 
end function

public function integer wf_sendmail ();
Integer	li_prio
String	ls_DB, ls_des1, ls_host, ls_port, ls_user, ls_pass, ls_from, ls_name, ls_add1


dw_1.AcceptText( )

ls_DB = f_Trim( dw_1.Object.DB[ 1] ) 
If ls_DB = '' Then
	blEclipse.MessageBox( Title, 'Debe seleccionar DB.', Exclamation! )
	dw_1.SetFocus( 'DB' )
	Return -1
End If

ls_host = f_Trim( dw_1.Object.smhost[ 1] ) 
If ls_host = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Host Name.', Exclamation! )
	dw_1.SetFocus( 'smHost' )
	Return -1
End If

ls_port = f_Trim( dw_1.Object.SMPort[ 1] ) 
If ls_port = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar el SMTP Port.', Exclamation! )
	dw_1.SetFocus( 'SMPort' )
	Return -1
End If

ls_user = f_Trim( dw_1.Object.SMUser[ 1] ) 
If ls_user = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar la cuenta User Name.', Exclamation! )
	dw_1.SetFocus( 'SMUser' )
	Return -1
End If

ls_pass = f_Trim( dw_1.Object.SMPassword[ 1] ) 
If ls_pass = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar password asociado al User Name.', Exclamation! )
	dw_1.SetFocus( 'SMPassword' )
	Return -1
End If

ls_from = f_Trim( dw_1.Object.SMFromAddress[ 1] ) 
If ls_from = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Cuenta de Correo Origen.', Exclamation! )
	dw_1.SetFocus( 'SMFromAddress' )
	Return -1
End If

ls_name = f_Trim( dw_1.Object.SMFromName[ 1] ) 
If ls_name = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar Nombre (Etiqueta) para la Cuenta de Correo Origen.', Exclamation! )
	dw_1.SetFocus( 'SMFromName' )
	Return -1
End If

ls_add1 = f_Trim( dw_1.Object.SMToAddress1[ 1] ) 
If ls_add1 = '' Then
	blEclipse.MessageBox( Title, 'Debe ingresar correo de Destinatario 1.', Exclamation! )
	dw_1.SetFocus( 'SMToAddress1' )
	Return -1
End If

If Not f_GenValidaFormatoemail( ls_add1 )  Then
	blEclipse.MessageBox( Title, 'Correo de Destinatario no cumple la regla de validación.', Exclamation! )
	dw_1.SetFocus( 'SMToAddress1' )
	Return -1
End If

li_prio = f_Zero( dw_1.Object.Priority[ 1] ) 
f_GenProcesando( Title + '~r~Preparando Envío' )

/* wf_sendMail( ) 
    <add key="SMHost" value="smtp-legacy.office365.com" />
    <add key="SMPort" value="587" />
    <add key="SMUser" value="notifica_interfaces@nuestrosparques.cl" />
    <add key="SMPassword" value="Emerix2023.." />
    <add key="SMFromAddress" value="notifica_interfaces@nuestrosparques.cl" />
    <add key="SMFromName" value="Cajas Externas FTP (Test)" />
    <add key="SMToAddress1" value="interfaces_emerix@nuestrosparques.cl" />
    <add key="SMToName1" value="Cajas Externas FTP" />

*/

Integer li_rc
String ls_linkedResources, ls_contentID,ls_HTML
SMTPClient lnv_SmtpClient

lnv_SmtpClient = CREATE SMTPClient

//Sets the email-sender information     
lnv_SmtpClient.Host = ls_host
lnv_SmtpClient.Port = Long( ls_port )
lnv_SmtpClient.Username = ls_user
lnv_SmtpClient.password = ls_pass
//lnv_SmtpClient.EnableTLS = True
//lnv_SmtpClient.SetProxy("192.168.168.10",8004)
lnv_SmtpClient.LogFile("NaturalMail.log")

//Sets the email message
lnv_SmtpClient.Message.SetSender(ls_from, ls_name)
lnv_SmtpClient.Message.AddRecipient(ls_add1)
//lnv_SmtpClient.Message.AddCc("cvilela@nuestrosparques.cl" )
//lnv_SmtpClient.Message.AddAttachment("c:\image\test01.png")
lnv_SmtpClient.Message.Subject = Title + ' - Prueba'
lnv_SmtpClient.Message.Priority = li_prio //1 = Low, 2 = High
lnv_SmtpClient.Message.Encoding = "UTF-8"

//Sets the HTML content to be sent
//ls_linkedResources = "c:\\image\\example.jpg"
ls_HTML =  &
"<html><body>" + "~r~n" + &
"<p>This is the inline " + "~r~n" + &
"<b>HTML</b>" + Title + "</p><br />" + "~r~n" + &
"</body></html>"
lnv_SmtpClient.Message.TextBody = "Esta es una Prueba de Envío de Correos por " + gs_sys
//lnv_SmtpClient.Message.HTMLBody = ls_HTML

//Sends the email
li_rc = lnv_SmtpClient.Send()

f_GenProcesando( '' )
If li_rc = 1 Then
	blEclipse.Messagebox( Title, 'Prueba de Envío de correo ha sido exitoso.')
Else
	blEclipse.Messagebox( Title, 'Error en Prueba de Envío de correo. Return ' + String(li_rc) + '.', StopSign!)
End If

Destroy lnv_SmtpClient

Return li_rc

end function

on w_arch_gen_configura_mail.create
call super::create
end on

on w_arch_gen_configura_mail.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_configura_mail
integer width = 3877
integer height = 2136
string title = ""
string dataobject = "d_arch_gen_configura_mail"
end type

event dw_1::buttonclicked;call super::buttonclicked;
String	ls_ver
Choose Case dwo.Name

	Case 'cb_ver'
		ls_ver = LowerTrim( This.Object.smPassword.Edit.Password )
		If ls_ver = 'yes' Then
			This.Object.smPassword.Edit.Password = 'no'			
		Else
			This.Object.smPassword.Edit.Password = 'yes'
		End If
		This.SetFocus( 'smPassword' )
		 
	Case 'cb_send'
		wf_SendMail( )
		
		
	Case 'cb_pdf'
		f_DWToPDF( This )
End Choose
end event

event dw_1::editchanged;call super::editchanged;
ib_saved = False
end event

event dw_1::itemchanged;call super::itemchanged;

Choose Case dwo.Name
	Case 'smtoaddress1'
		ib_saved = ib_saved
		
	Case Else
		ib_saved = False
End Choose

end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_configura_mail
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_configura_mail
integer x = 0
integer y = 1972
integer width = 283
integer height = 132
boolean enabled = false
end type

