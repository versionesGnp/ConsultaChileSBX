forward
global type w_arch_gen_notificar from wa_response
end type
end forward

global type w_arch_gen_notificar from wa_response
integer width = 1966
integer height = 1224
string title = "Notificaciones"
boolean controlmenu = false
boolean ib_posy = true
boolean ib_fadeeffect = true
end type
global w_arch_gen_notificar w_arch_gen_notificar

forward prototypes
public function integer wf_sendmail ()
end prototypes

public function integer wf_sendmail ();
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
lnv_SmtpClient.Host = "smtp-legacy.office365.com"
lnv_SmtpClient.Port = 587
lnv_SmtpClient.Username = "notifica_interfaces@nuestrosparques.cl"
lnv_SmtpClient.password = "Emerix2023.."
//lnv_SmtpClient.EnableTLS = True
//lnv_SmtpClient.SetProxy("192.168.168.10",8004)
lnv_SmtpClient.LogFile("NaturalMail.log")

//Sets the email message
lnv_SmtpClient.Message.SetSender("notifica_interfaces@nuestrosparques.cl","Cesar")
lnv_SmtpClient.Message.AddRecipient("cesarvilela@hotmail.com")
//lnv_SmtpClient.Message.AddRecipient("cesarvilelarequena@gmail.com")
//lnv_SmtpClient.Message.AddCc("cvilela@nuestrosparques.cl" )
//lnv_SmtpClient.Message.AddAttachment("c:\image\test01.png")
lnv_SmtpClient.Message.Subject = f_Trim( dw_1.Object.v_nombre_not[ 1] )
lnv_SmtpClient.Message.Priority = 2 //High
lnv_SmtpClient.Message.Encoding = "UTF-8"

//Sets the HTML content to be sent
//ls_linkedResources = "c:\\image\\example.jpg"
ls_HTML =  &
"<html><body>" + "~r~n" + &
"<p>This is the inline " + "~r~n" + &
"<b>HTML</b>" + f_Trim( dw_1.Object.v_texto_not[ 1] ) + "</p><br />" + "~r~n" + &
"</body></html>"
lnv_SmtpClient.Message.TextBody = f_Trim( dw_1.Object.v_texto_not[ 1] )
//lnv_SmtpClient.Message.HTMLBody = ls_HTML

//Sends the email
li_rc = lnv_SmtpClient.Send()

IF li_rc = 1 THEN
                Messagebox('SMTPClient','Mail sent successfully')
ELSE
                Messagebox('SMTPClient' ,'Email sending failed. Return ' + String(li_rc) + '.', StopSign!)
END IF

DESTROY lnv_SmtpClient

Return li_rc

end function

on w_arch_gen_notificar.create
call super::create
end on

on w_arch_gen_notificar.destroy
call super::destroy
end on

event open;call super::open;
Title = 'Enviar Notificación' 

dw_1.InsertRow(0)
dw_1.SetObjectColor( 'c_codigo_usu', 'o' )
dw_1.SetObjectColor( 'v_nombre_not', 'ba' )

dw_1.Object.c_usucrea[ 1] = gs_usuario
dw_1.Object.d_creacion[ 1] = TodayDT( ) 

dw_1.Colenabled( {'c_usucrea', 'd_creacion'}, False )

end event

type dw_list from wa_response`dw_list within w_arch_gen_notificar
boolean visible = false
integer y = 1092
integer width = 654
integer height = 144
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
end type

type dw_1 from wa_response`dw_1 within w_arch_gen_notificar
integer width = 2030
integer height = 988
string dataobject = "d_arch_gen_notificar"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_notificar
integer x = 1431
integer y = 1024
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_notificar
integer x = 1051
integer y = 1024
end type

event cb_aceptar::clicked;call super::clicked;
String ls_msg, ls_col


dw_1.AcceptText( )
If f_Trim( dw_1.Object.c_codigo_usu[ 1] ) = '' Then
	ls_msg = 'Debe seleccionar Destinatario'
	ls_col = 'c_codigo_usu'
End If

If f_Trim( dw_1.Object.v_nombre_not[ 1] ) = '' Then
	ls_msg = 'Debe ingresar Asunto'
	ls_col = 'v_nombre_not'
End If

If f_Trim( dw_1.Object.v_texto_not[ 1] ) = '' Then
	ls_msg = 'Debe ingresar cuerpo de Notificación'
	ls_col = 'v_texto_not'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return
End If

dw_1.Object.d_creacion[ 1] = DateTime( Today( ), Now() )
dw_1.Object.c_activo[ 1] = '1'
dw_1.AcceptText( )
dw_1.Update( )

Commit Using SqlCa ;

String	ls_SM

ls_SM = f_Trim( dw_1.Object.c_SendMail[ 1] )
If ls_SM = '1' Then
	wf_SendMail( )
End If


CloseWithReturn( Parent, 'OK' )
end event

