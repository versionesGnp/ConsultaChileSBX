forward
global type w_mora_pagare_parque_estadisticas from window
end type
type rb_otros from radiobutton within w_mora_pagare_parque_estadisticas
end type
type rb_foresta from radiobutton within w_mora_pagare_parque_estadisticas
end type
type rb_prado from radiobutton within w_mora_pagare_parque_estadisticas
end type
type cb_2 from commandbutton within w_mora_pagare_parque_estadisticas
end type
type cb_1 from commandbutton within w_mora_pagare_parque_estadisticas
end type
type gb_1 from groupbox within w_mora_pagare_parque_estadisticas
end type
end forward

global type w_mora_pagare_parque_estadisticas from window
integer x = 832
integer y = 360
integer width = 1225
integer height = 740
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_otros rb_otros
rb_foresta rb_foresta
rb_prado rb_prado
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_mora_pagare_parque_estadisticas w_mora_pagare_parque_estadisticas

type variables
date fecha
string año
end variables

on w_mora_pagare_parque_estadisticas.create
this.rb_otros=create rb_otros
this.rb_foresta=create rb_foresta
this.rb_prado=create rb_prado
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_otros,&
this.rb_foresta,&
this.rb_prado,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_mora_pagare_parque_estadisticas.destroy
destroy(this.rb_otros)
destroy(this.rb_foresta)
destroy(this.rb_prado)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;this.x 						= ( gl_width - this.width)/2
this.y 						= ( gl_height - this.height)/2

if gs_empresa = 'El Prado' then
	rb_prado.checked 		= true
	rb_foresta.enabled 	= false
	rb_prado.enabled 		= true
elseif gs_empresa = 'La Foresta' then
	rb_foresta.checked 	= true
	rb_foresta.enabled 	= true
	rb_prado.enabled 		= false
end if
select distinct sysdate into :gdt_tiempo_servidor from agentes;
año 							= Message.StringParm
this.title 					= gs_app_name
end event

type rb_otros from radiobutton within w_mora_pagare_parque_estadisticas
integer x = 224
integer y = 320
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Pagaré otros parque"
end type

type rb_foresta from radiobutton within w_mora_pagare_parque_estadisticas
integer x = 224
integer y = 220
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Pagaré La Foresta"
end type

type rb_prado from radiobutton within w_mora_pagare_parque_estadisticas
integer x = 224
integer y = 120
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Pagaré Prado"
boolean checked = true
end type

type cb_2 from commandbutton within w_mora_pagare_parque_estadisticas
integer x = 855
integer y = 500
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_pagare_parque_estadisticas)
end event

type cb_1 from commandbutton within w_mora_pagare_parque_estadisticas
integer x = 50
integer y = 500
integer width = 302
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string fecha1
if rb_prado.checked then
	gs_parque 	= 'P'
elseif rb_foresta.checked then
	gs_parque 	= 'F'	
elseif rb_otros.checked then
	gs_parque 	= 'O'
end if
fecha1 			= string(fecha,gs_formato_fecha)
OpenWithParm(w_mora_pagare_estadistica,año)
close(w_mora_pagare_parque_estadisticas)
end event

type gb_1 from groupbox within w_mora_pagare_parque_estadisticas
integer x = 46
integer y = 28
integer width = 1111
integer height = 424
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "Estadistica de Mora Pagarés"
end type

