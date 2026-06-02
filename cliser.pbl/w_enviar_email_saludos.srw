forward
global type w_enviar_email_saludos from window
end type
type cb_enviar from commandbutton within w_enviar_email_saludos
end type
type st_1 from statictext within w_enviar_email_saludos
end type
type cb_cerrar from commandbutton within w_enviar_email_saludos
end type
type dw_lista from datawindow within w_enviar_email_saludos
end type
end forward

global type w_enviar_email_saludos from window
integer width = 2821
integer height = 1180
boolean titlebar = true
string title = "Envio Email Saludos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_enviar cb_enviar
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_enviar_email_saludos w_enviar_email_saludos

event open;Long 		ll_tot_reg,ll_indi,ll_rut,ll_new
String	ls_ap_pat,ls_ap_mat,ls_nombre,ls_email
gf_centrar(w_enviar_email_saludos)
dw_lista.settransobject(sqlca)
if isvalid(w_lista_encargado_cliser) then
	ll_tot_reg	= w_lista_encargado_cliser.dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_rut		= w_lista_encargado_cliser.dw_lista.getitemnumber(ll_indi,'num_rut')
			ls_ap_pat	= w_lista_encargado_cliser.dw_lista.getitemstring(ll_indi,'nom_patern')
			ls_ap_mat	= w_lista_encargado_cliser.dw_lista.getitemstring(ll_indi,'nom_matern')
			ls_nombre	= w_lista_encargado_cliser.dw_lista.getitemstring(ll_indi,'nom_nombre')
			SELECT	"ENCARGADOS"."EMAIL"  
			INTO 		:ls_email  
			FROM 		"ENCARGADOS"  
			WHERE  ( "ENCARGADOS"."RUT" = :ll_rut ) AND  
					 ( "ENCARGADOS"."ESTADO" = 'A' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_email) and trim(ls_email)<>'' then
					ll_new	= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,'rut',ll_rut)
					dw_lista.setitem(ll_new,'nombre',ls_nombre)
					dw_lista.setitem(ll_new,'ap_pat',ls_ap_pat)
					dw_lista.setitem(ll_new,'ap_mat',ls_ap_mat)
					dw_lista.setitem(ll_new,'email',trim(ls_email))
				end if
			end if
		next
	end if
end if
if dw_lista.rowcount()=0 then
	messagebox("Advertencia","No Registra Empleado con Email en Tabla Encargado")
	close(w_enviar_email_saludos)
end if
end event

on w_enviar_email_saludos.create
this.cb_enviar=create cb_enviar
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_enviar,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_enviar_email_saludos.destroy
destroy(this.cb_enviar)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

type cb_enviar from commandbutton within w_enviar_email_saludos
integer x = 41
integer y = 956
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enviar"
end type

event clicked;String	ls_asunto,ls_texto,ls_email
Long		ll_tot_reg,ll_indi
ll_tot_reg					= dw_lista.rowcount()
ls_asunto					= 'Saludos de Cumpleaños'
ls_texto						= 'Deseando que tu día este lleno de regalos de amor y felicidad ,Feliz Cumpleaños!!!'
mailsession mses
mailreturncode mret
mailmessage mmsg
mses							= create mailsession
mret							= mses.maillogon(mailnewsession!)
if mret <> mailReturnSuccess! then
	return
end if
for ll_indi=1 to ll_tot_reg
	ls_email	= dw_lista.getitemstring(ll_indi,'email')
	mmsg.recipient[ll_indi].name	= ls_email
next
mmsg.subject				= ls_asunto
mmsg.notetext				= ls_texto
mses.mailsend(mmsg)
if mret <> mailreturnsuccess! then
	return
end if
mses.maillogoff()
destroy mses
end event

type st_1 from statictext within w_enviar_email_saludos
integer x = 50
integer y = 28
integer width = 795
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Empleados"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_enviar_email_saludos
integer x = 2437
integer y = 956
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_enviar_email_saludos)
end event

type dw_lista from datawindow within w_enviar_email_saludos
integer x = 41
integer y = 108
integer width = 2725
integer height = 804
integer taborder = 10
string dataobject = "dwe_empleado_email_saludos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

