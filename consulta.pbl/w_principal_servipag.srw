forward
global type w_principal_servipag from window
end type
end forward

global type w_principal_servipag from window
integer x = 1102
integer y = 704
integer width = 3095
integer height = 2036
boolean titlebar = true
string title = "Consultas - Inmobiliaria"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
end type
global w_principal_servipag w_principal_servipag

on w_principal_servipag.create
end on

on w_principal_servipag.destroy
end on

event open;String	ls_opcion_dig,ls_depto,ls_cod_aux
gf_centrar(w_principal_servipag)


end event

event close;halt close
end event

