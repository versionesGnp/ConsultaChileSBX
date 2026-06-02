forward
global type w_ingresa_pagare from window
end type
type ddlb_estado from dropdownlistbox within w_ingresa_pagare
end type
type st_1 from statictext within w_ingresa_pagare
end type
type ddlb_serie_p from dropdownlistbox within w_ingresa_pagare
end type
type st_6 from statictext within w_ingresa_pagare
end type
type st_5 from statictext within w_ingresa_pagare
end type
type st_4 from statictext within w_ingresa_pagare
end type
type st_3 from statictext within w_ingresa_pagare
end type
type sle_numero_p from singlelineedit within w_ingresa_pagare
end type
type st_numero from statictext within w_ingresa_pagare
end type
type st_serie from statictext within w_ingresa_pagare
end type
type cb_2 from commandbutton within w_ingresa_pagare
end type
type cb_1 from commandbutton within w_ingresa_pagare
end type
type gb_1 from groupbox within w_ingresa_pagare
end type
type gb_2 from groupbox within w_ingresa_pagare
end type
end forward

global type w_ingresa_pagare from window
integer x = 1454
integer y = 1060
integer width = 1335
integer height = 1236
boolean titlebar = true
string title = "Pagaré"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
ddlb_estado ddlb_estado
st_1 st_1
ddlb_serie_p ddlb_serie_p
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
sle_numero_p sle_numero_p
st_numero st_numero
st_serie st_serie
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_ingresa_pagare w_ingresa_pagare

on w_ingresa_pagare.create
this.ddlb_estado=create ddlb_estado
this.st_1=create st_1
this.ddlb_serie_p=create ddlb_serie_p
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.sle_numero_p=create sle_numero_p
this.st_numero=create st_numero
this.st_serie=create st_serie
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.ddlb_estado,&
this.st_1,&
this.ddlb_serie_p,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.sle_numero_p,&
this.st_numero,&
this.st_serie,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.gb_2}
end on

on w_ingresa_pagare.destroy
destroy(this.ddlb_estado)
destroy(this.st_1)
destroy(this.ddlb_serie_p)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_numero_p)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string s_numero,serie
integer i
Double	numero
s_numero 		= Message.StringParm
st_serie.text 	= mid(s_numero,1,1)
st_numero.text = mid(s_numero,2)

numero 			= Double(st_numero.text)
SELECT	count("OFERTA_V"."SERIE")  
INTO 		:i  
FROM 		"OFERTA_V"  
WHERE  ( "OFERTA_V"."SERIE" = :serie ) AND  
       ( "OFERTA_V"."NRO_OFERTA" = :numero )   ;
if sqlca.sqlcode = -1 then
	messagebox('Error',sqlca.SQLErrText,stopsign!)
	close(w_ingresa_pagare)
elseif sqlca.sqlcode = 100 then
		messagebox('No Existe','No Existe la Oferta Serie :'+mid(s_numero,1,1)+'N° :'+mid(s_numero,2),stopsign!)
	close(w_ingresa_pagare)
end if
end event

type ddlb_estado from dropdownlistbox within w_ingresa_pagare
integer x = 530
integer y = 792
integer width = 649
integer height = 308
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"V - Vigente","C - Cancelado","N - Nulo"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_ingresa_pagare
integer x = 87
integer y = 796
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo :"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_serie_p from dropdownlistbox within w_ingresa_pagare
integer x = 530
integer y = 528
integer width = 649
integer height = 308
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"P - Pie","C - Crédito"}
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_ingresa_pagare
integer x = 87
integer y = 664
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Nº Pagaré :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ingresa_pagare
integer x = 87
integer y = 532
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Serie Pagaré :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ingresa_pagare
integer x = 87
integer y = 236
integer width = 393
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Número :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingresa_pagare
integer x = 87
integer y = 124
integer width = 393
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Serie :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_numero_p from singlelineedit within w_ingresa_pagare
integer x = 530
integer y = 660
integer width = 649
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;if not isnumber(this.text) then
	messagebox('Error','Este campo solo acepta caracteres numericos.',stopsign!)
	this.text=''
	this.setfocus()
	return
end if	
end event

type st_numero from statictext within w_ingresa_pagare
integer x = 530
integer y = 228
integer width = 649
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_ingresa_pagare
integer x = 530
integer y = 116
integer width = 389
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_ingresa_pagare
integer x = 32
integer y = 1000
integer width = 302
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string	estado,estado_p,cont,serie,serie_p,ls_serie_pag,ls_serie
Double	numero,numero_p,ll_nro_pag,ll_contrato
setnull(cont)

ls_serie_pag	= trim(ddlb_serie_p.text)
ll_nro_pag		= Double(trim(sle_numero_p.text))
ll_contrato		= Double(trim(st_numero.text))
ls_serie			= trim(st_serie.text)

SELECT	"PAGARE_V"."SERIE",
			"PAGARE_V"."ESTADO" 
INTO 		:cont,
			:estado_p 
FROM 		"PAGARE_V"  
WHERE  ( "PAGARE_V"."SERIE_P" = :ls_serie_pag ) AND  
       ( "PAGARE_V"."NUMERO_P" = :ll_nro_pag )  ;

if not isnull(cont) then 
	messagebox('Error','Este pagaré ya esta ingresado y corresponde a '+estado_p+'.',information!)
	return
end if
estado 	= mid(ddlb_estado.text,1,1)
if isnull(estado) or ddlb_estado.text='' then
	messagebox('Error','Debe seleccionar el tipo de pagare.',information!)
	ddlb_estado.setfocus()
	return
end if
serie_p 	= mid(ddlb_serie_p.text,1,1)
if isnull(serie_p) or ddlb_serie_p.text='' then
	messagebox('Error','Debe seleccionar Serie de pagare.',information!)
	ddlb_serie_p.setfocus()
	return
end if
numero 		= Double(st_numero.text)
numero_p 	= Double(sle_numero_p.text)
serie 		= trim(st_serie.text)
INSERT INTO	"PAGARE_V"  
       	 ( "SERIE","NUMERO","SERIE_P","NUMERO_P","ESTADO" )  
VALUES 	 ( :serie ,:numero ,:serie_p ,:numero_p ,:estado )  ;
if sqlca.sqlcode <> 0 then
	  UPDATE		"PAGARE_V"  
     SET 		"SERIE_P" = :ls_serie_pag,   
         		"NUMERO_P" = :ll_nro_pag,   
         		"ESTADO" = :estado  
     WHERE	 ( "PAGARE_V"."SERIE" = :ls_serie ) AND  
             ( "PAGARE_V"."NUMERO" = :ll_contrato ) AND  
             ( "PAGARE_V"."SERIE_P" = :ls_serie_pag ) AND  
             ( "PAGARE_V"."NUMERO_P" = :ll_nro_pag )   ;
	if sqlca.sqlcode <> 0 then
		messagebox('Error',sqlca.SQLErrText,stopsign!)
		ROLLBACK ;
		return
	else
		commit;
		messagebox("Grabar Pagaré","Grabación Exitosa")
	end if			
else
	commit;
	messagebox("Grabar Pagaré","Grabación Exitosa")
end if	
end event

type cb_1 from commandbutton within w_ingresa_pagare
integer x = 974
integer y = 1000
integer width = 302
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresa_pagare)
end event

type gb_1 from groupbox within w_ingresa_pagare
integer x = 32
integer y = 408
integer width = 1243
integer height = 552
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "Pagaré"
end type

type gb_2 from groupbox within w_ingresa_pagare
integer x = 32
integer y = 24
integer width = 1243
integer height = 352
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "Contrato"
end type

