forward
global type sendmail from nonvisualobject
end type
end forward

global type sendmail from nonvisualobject autoinstantiate
end type

type variables

Boolean  bReady = False, bShow = True
Integer	iprio
String	sDB, sdes1, shost, sport, suser, spass, sfrom, sname, sadd1
String	sLog = 'NaturalMail.log', sEncoding = "UTF-8", sTitle = 'Módulo Correo Electrónico'

String	sAttachment
end variables

forward prototypes
public function boolean getready (string asdb)
public function integer send (string assubject, string asadd[], string asbody, integer aipriority)
end prototypes

public function boolean getready (string asdb);
sDB = asDB

Select
  smhost,
  smport,
  smuser,
  smpassword,
  smfromaddress,
  smfromname
into
  :shost,
  :sport,
  :suser,
  :spass,
  :sfrom,
  :sname
From utappconfigura 
where db = :sDB;

This.bReady = (Sqlca.Sqlcode = 0)

Return This.bReady


end function

public function integer send (string assubject, string asadd[], string asbody, integer aipriority);/* Send(asSub, asAdd[], asBody, aiPriority )*/
Integer	li_prio
String	ls_DB, ls_des1, ls_host, ls_port, ls_user, ls_pass, ls_from, ls_name, ls_add1


If Not This.bReady Then
	blEclipse.Messagebox( sTitle, 'Debe preparar el módulo antes de continuar.', Exclamation! )
	Return -1
End If

li_prio = aiPriority

ls_DB = This.sDB
ls_host = This.sHost
ls_port = This.sPort
ls_user = This.sUser
ls_pass = This.sPass
ls_from = This.sFrom
ls_name = This.sName


If This.bShow Then 
	f_GenProcesando( This.sTitle + '~r~Preparando Envío' )
End If

Integer	i, li_rc
String	ls_linkedResources, ls_contentID,ls_HTML
SMTPClient lnv_SmtpClient

lnv_SmtpClient = CREATE SMTPClient

//Sets the email-sender information     
lnv_SmtpClient.Host = ls_host
lnv_SmtpClient.Port = Long( ls_port )
lnv_SmtpClient.Username = ls_user
lnv_SmtpClient.password = ls_pass
//lnv_SmtpClient.EnableTLS = True
//lnv_SmtpClient.SetProxy("192.168.168.10",8004)
lnv_SmtpClient.LogFile( This.sLog )

//Sets the email message
lnv_SmtpClient.Message.SetSender(ls_from, ls_name)
For i = 1 To UpperBound( asAdd )
	ls_add1 = asAdd[ i]
	lnv_SmtpClient.Message.AddRecipient(ls_add1)
Next

lnv_SmtpClient.Message.Subject = asSubject
lnv_SmtpClient.Message.Priority = li_prio //1 = Low, 2 = High
lnv_SmtpClient.Message.Encoding = sEncoding
lnv_SmtpClient.Message.TextBody = asBody

Int	li_att
If Not This.sAttachment = '' Then
	li_att = lnv_SmtpClient.Message.AddAttachment( This.sAttachment )
End If

//Sends the email
li_rc = lnv_SmtpClient.Send()

f_GenProcesando( '' )

Destroy lnv_SmtpClient

Return li_rc

end function

on sendmail.create
call super::create
TriggerEvent( this, "constructor" )
end on

on sendmail.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

