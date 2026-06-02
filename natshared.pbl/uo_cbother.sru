//objectcomments /* Autor: César Vilela~r~n    Función: BLClass Reemplaza botón PB para funciones en ventanas Popup~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type uo_cbother from commandbutton
end type
end forward

global type uo_cbother from commandbutton
integer width = 347
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Other"
boolean flatstyle = true
end type
global uo_cbother uo_cbother

on uo_cbother.create
end on

on uo_cbother.destroy
end on

