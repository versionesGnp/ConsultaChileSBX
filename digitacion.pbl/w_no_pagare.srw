forward
global type w_no_pagare from window
end type
type sle_serie from singlelineedit within w_no_pagare
end type
type cb_cancelar from commandbutton within w_no_pagare
end type
type st_3 from statictext within w_no_pagare
end type
type sle_numero from singlelineedit within w_no_pagare
end type
type st_2 from statictext within w_no_pagare
end type
type st_1 from statictext within w_no_pagare
end type
type cb_aceptar from commandbutton within w_no_pagare
end type
type p_1 from picture within w_no_pagare
end type
end forward

global type w_no_pagare from window
integer x = 1074
integer y = 484
integer width = 1769
integer height = 592
boolean titlebar = true
string title = "Ingreso de Pagaré"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
sle_serie sle_serie
cb_cancelar cb_cancelar
st_3 st_3
sle_numero sle_numero
st_2 st_2
st_1 st_1
cb_aceptar cb_aceptar
p_1 p_1
end type
global w_no_pagare w_no_pagare

on w_no_pagare.create
this.sle_serie=create sle_serie
this.cb_cancelar=create cb_cancelar
this.st_3=create st_3
this.sle_numero=create sle_numero
this.st_2=create st_2
this.st_1=create st_1
this.cb_aceptar=create cb_aceptar
this.p_1=create p_1
this.Control[]={this.sle_serie,&
this.cb_cancelar,&
this.st_3,&
this.sle_numero,&
this.st_2,&
this.st_1,&
this.cb_aceptar,&
this.p_1}
end on

on w_no_pagare.destroy
destroy(this.sle_serie)
destroy(this.cb_cancelar)
destroy(this.st_3)
destroy(this.sle_numero)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;
gf_centrar(w_no_pagare)


end event

type sle_serie from singlelineedit within w_no_pagare
integer x = 878
integer y = 228
integer width = 233
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
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_no_pagare
integer x = 1362
integer y = 340
integer width = 329
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
Close(w_no_pagare)
end event

type st_3 from statictext within w_no_pagare
integer x = 475
integer y = 64
integer width = 1056
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Ingreso de Pagaré"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_no_pagare
integer x = 878
integer y = 352
integer width = 425
integer height = 92
integer taborder = 20
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

type st_2 from statictext within w_no_pagare
integer x = 471
integer y = 364
integer width = 384
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nº Pagaré"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_no_pagare
integer x = 690
integer y = 236
integer width = 165
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_no_pagare
integer x = 1362
integer y = 216
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string 	is_serie, is_serie2
Double	ll_numero

is_serie 		= sle_serie.Text
ll_numero 	= Double(sle_numero.text)

SELECT "CADENA"."SERIE" 
 INTO :is_serie2
 FROM "CADENA"  
WHERE ( "CADENA"."SERIE" = :is_serie ) AND  
		( "CADENA"."NUMERO" = :ll_numero ) AND  
		( "CADENA"."CODIGO" = 'P' );    

IF is_serie <> is_serie2 THEN
	gi_numero = ll_numero
	gs_serie = is_serie
	gs_base = "P"
	
	Close(w_no_pagare)
	Open(w_ingresar_pagare)
ELSE
	MessageBox("Ingresar Pagaré", "Serie o número del Pagaré ya existe !")
	gi_numero = ll_numero
	gs_serie = is_serie
	gs_base = "P"
	
	Close(w_no_pagare)
	Open(w_ingresar_pagare)

END IF
end event

type p_1 from picture within w_no_pagare
integer x = 41
integer y = 36
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

