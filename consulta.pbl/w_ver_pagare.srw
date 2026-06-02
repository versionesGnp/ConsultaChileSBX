forward
global type w_ver_pagare from window
end type
type dw_pagare from datawindow within w_ver_pagare
end type
type cb_1 from commandbutton within w_ver_pagare
end type
end forward

global type w_ver_pagare from window
integer x = 1358
integer y = 1172
integer width = 1865
integer height = 1028
boolean titlebar = true
string title = "Ver Pagaré"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_pagare dw_pagare
cb_1 cb_1
end type
global w_ver_pagare w_ver_pagare

type variables
integer fila,cont,elimina=0,suma=0,total=0
end variables

on w_ver_pagare.create
this.dw_pagare=create dw_pagare
this.cb_1=create cb_1
this.Control[]={this.dw_pagare,&
this.cb_1}
end on

on w_ver_pagare.destroy
destroy(this.dw_pagare)
destroy(this.cb_1)
end on

event open;string	s_numero,serie
long 		numero
dw_pagare.settransobject(sqlca)
if dw_pagare.retrieve(gs_serie,gi_numero) = 0 then
	messagebox('No existen Datos','No Existe Pagaré Asociado.',stopsign!)
	close(w_ver_pagare)
end if

end event

type dw_pagare from datawindow within w_ver_pagare
integer x = 32
integer y = 28
integer width = 1778
integer height = 700
integer taborder = 10
string dataobject = "dw_ver_pagare"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_pagare.SelectRow(0, false)
dw_pagare.SelectRow(getrow(), TRUE)
end event

type cb_1 from commandbutton within w_ver_pagare
integer x = 1499
integer y = 776
integer width = 302
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//integer ret
//
//IF dw_pagare.ModifiedCount( ) > 0 or dw_pagare.DeletedCount( ) > 0 THEN
//	ret = messagebox('Cambios','¿ Desea guardar los cambios ?',Exclamation!, OKCancel!, 2)
//	if ret = 1 then
//		cb_2.TriggerEvent(clicked!)
//	end if	
//end if
close(w_ver_pagare)
end event

