forward
global type w_mora_pagare_estadistica from window
end type
type cb_3 from commandbutton within w_mora_pagare_estadistica
end type
type dw_1 from datawindow within w_mora_pagare_estadistica
end type
type cb_2 from commandbutton within w_mora_pagare_estadistica
end type
type cb_1 from commandbutton within w_mora_pagare_estadistica
end type
end forward

global type w_mora_pagare_estadistica from window
integer x = 23
integer y = 452
integer width = 3246
integer height = 2228
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_mora_pagare_estadistica w_mora_pagare_estadistica

type variables
string param
end variables

event open;date fecha
string titulo,fecha1,fecha2
setpointer (HourGlass!)
this.title	= gs_app_name
this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
param 		= Message.StringParm
fecha1 		= '01/01/'+param
fecha2 		= '31/12/'+param
dw_1.settransobject(sqlca)
if dw_1.retrieve(date(fecha1),date(fecha2),gi_parque_select) > 0 then
	dw_1.object.titulo.text = "Pagarés en Mora ( Año "+ Message.StringParm+' )'
	if gi_parque_select = 1 then
		dw_1.object.titulo1.text = 'El Prado'
	elseif gi_parque_select = 102 then
		dw_1.object.titulo1.text = 'El Manantial'
	elseif gi_parque_select = 11 then
		dw_1.object.titulo1.text = 'La Foresta'
	elseif gi_parque_select = 801 then
		dw_1.object.titulo1.text = 'Concepción'
	end if
else
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_mora_pagare_estadistica)
end if
end event

on w_mora_pagare_estadistica.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_pagare_estadistica.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_mora_pagare_estadistica
integer x = 41
integer y = 1980
integer width = 375
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gráfico"
end type

event clicked;OpenWithParm(w_grafico_estadistico_mora_pagare,param)
end event

type dw_1 from datawindow within w_mora_pagare_estadistica
integer x = 41
integer y = 28
integer width = 3141
integer height = 1912
string dataobject = "dw_mora_pagare_estadistica1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_pagare_estadistica
integer x = 2418
integer y = 1980
integer width = 375
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_mora_pagare_estadistica
integer x = 2798
integer y = 1980
integer width = 375
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_pagare_estadistica)
end event

