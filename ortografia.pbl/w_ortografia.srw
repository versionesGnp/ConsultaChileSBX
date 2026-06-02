//objectcomments jlreinoso: ventana principal para el ejemplo
forward
global type w_ortografia from window
end type
type cb_3 from commandbutton within w_ortografia
end type
type shl_1 from statichyperlink within w_ortografia
end type
type gb_1 from groupbox within w_ortografia
end type
type mle_texto from multilineedit within w_ortografia
end type
end forward

global type w_ortografia from window
integer width = 2002
integer height = 1212
boolean titlebar = true
string title = "Clases (CORRIGE ORTOGRAFIA)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
shl_1 shl_1
gb_1 gb_1
mle_texto mle_texto
end type
global w_ortografia w_ortografia

type prototypes

end prototypes

on w_ortografia.create
this.cb_3=create cb_3
this.shl_1=create shl_1
this.gb_1=create gb_1
this.mle_texto=create mle_texto
this.Control[]={this.cb_3,&
this.shl_1,&
this.gb_1,&
this.mle_texto}
end on

on w_ortografia.destroy
destroy(this.cb_3)
destroy(this.shl_1)
destroy(this.gb_1)
destroy(this.mle_texto)
end on

event open;mle_texto.SetFocus()
end event

type cb_3 from commandbutton within w_ortografia
integer x = 594
integer y = 636
integer width = 667
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Corregir"
end type

event clicked;STRING ls_texto, ls_nuevo_texto
ls_texto = mle_texto.text
if ls_texto = "" or isnull(ls_texto) then
	messagebox("AVISO","Debe ingresar palabras")
	mle_texto.setfocus()
	return
else
	ls_nuevo_texto=f_ortografia(mle_texto.text)
	 mle_texto.text=ls_nuevo_texto 
end if


end event

type shl_1 from statichyperlink within w_ortografia
integer x = 265
integer y = 868
integer width = 1435
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "jorgeluisreinoso@hotmail.com"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;mailSession mSes
mailReturnCode mRet
mailMessage mMsg
mSes = create mailSession
mRet = mSes.mailLogon(mailNewSession!)
IF mRet <> mailReturnSuccess! THEN
    RETURN
END IF
mMsg.Recipient[1].name = 'jorgeluisreinoso@hotmail.com'
mMsg.Subject = "Clases (CALENDARIO Y FECHAS)"
mMsg.NoteText = "mensaje satisfactorio"
mSes.mailSend(mMsg)
IF mRet <> mailReturnSuccess! THEN
   RETURN
END IF
mSes.mailLogoff()
DESTROY mSes
end event

type gb_1 from groupbox within w_ortografia
integer x = 146
integer y = 84
integer width = 1650
integer height = 944
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
string text = "Corrige las faltas ortográficas"
borderstyle borderstyle = stylelowered!
end type

type mle_texto from multilineedit within w_ortografia
integer x = 201
integer y = 200
integer width = 1495
integer height = 376
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

