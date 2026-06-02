forward
global type w_logon_corpbanca from window
end type
type st_3 from statictext within w_logon_corpbanca
end type
type sle_clave from singlelineedit within w_logon_corpbanca
end type
type sle_usuario from singlelineedit within w_logon_corpbanca
end type
type st_2 from statictext within w_logon_corpbanca
end type
type st_1 from statictext within w_logon_corpbanca
end type
type cb_cancelar from commandbutton within w_logon_corpbanca
end type
type cb_aceptar from commandbutton within w_logon_corpbanca
end type
type p_1 from picture within w_logon_corpbanca
end type
end forward

global type w_logon_corpbanca from window
integer x = 425
integer y = 416
integer width = 1847
integer height = 608
boolean titlebar = true
string title = "Ingreso a CorpBanca"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_3 st_3
sle_clave sle_clave
sle_usuario sle_usuario
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
p_1 p_1
end type
global w_logon_corpbanca w_logon_corpbanca

on w_logon_corpbanca.create
this.st_3=create st_3
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.p_1=create p_1
this.Control[]={this.st_3,&
this.sle_clave,&
this.sle_usuario,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.p_1}
end on

on w_logon_corpbanca.destroy
destroy(this.st_3)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;gf_centrar(w_logon_corpbanca)



end event

type st_3 from statictext within w_logon_corpbanca
integer x = 498
integer y = 76
integer width = 1280
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_logon_corpbanca
integer x = 869
integer y = 356
integer width = 471
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_logon_corpbanca
integer x = 869
integer y = 216
integer width = 475
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_logon_corpbanca
integer x = 640
integer y = 356
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Clave:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_logon_corpbanca
integer x = 581
integer y = 216
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_logon_corpbanca
integer x = 1417
integer y = 356
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;


Close(w_logon_corpbanca)
end event

type cb_aceptar from commandbutton within w_logon_corpbanca
integer x = 1417
integer y = 216
integer width = 361
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string is_acceso, is_clave, is_usuario

is_usuario	= Upper(sle_usuario.text)
gs_user		= is_usuario
SELECT	"ENCARGADOS"."PASSWORD",   
			"ENCARGADOS"."ACCESO",
			"ENCARGADOS"."DEPTO"
INTO 		:is_clave,   
			:is_acceso,
			:gs_depto
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario
USING		sqlca;    
if sqlca.sqlcode=0 then
	if gs_depto='T' or gs_depto='I' then
		Close(w_logon_corpbanca)
		open(w_ing_corpbanca)
	else
		MessageBox("Advertencia", "Ud. No tiene Acceso")
		sle_clave.text 	= ""
		sle_clave.SetFocus( )
	end if
else
	MessageBox("Advertencia", "Usuario Inexistente")
	sle_clave.text 		= ""
	sle_clave.SetFocus( )
end if

//IF is_clave = Upper(sle_clave.text) THEN //is_usuario = "CBANCA" AND 
//	
//ELSE
//	MessageBox("Ingreso al Sistema", "El usuario no se encuentra o su clave es incorrecta.")
//	sle_clave.text = ""
//	sle_clave.SetFocus( )
//END IF
end event

type p_1 from picture within w_logon_corpbanca
integer x = 32
integer y = 32
integer width = 407
integer height = 436
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

