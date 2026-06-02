//objectcomments /* Autor: César Vilela~r~n    Función: BLClass Visual Cancel - Cancela acción en popup. Vea ancestras~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type uo_cbcancelar from commandbutton
end type
end forward

global type uo_cbcancelar from commandbutton
integer width = 347
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancelar"
boolean cancel = true
boolean flatstyle = true
end type
global uo_cbcancelar uo_cbcancelar

event clicked;Close( Parent )
end event

on uo_cbcancelar.create
end on

on uo_cbcancelar.destroy
end on

