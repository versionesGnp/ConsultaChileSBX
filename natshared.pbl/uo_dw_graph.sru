//objectcomments /* Autor: César Vilela~r~n    Función: BLClass Generación de gráficos charts~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type uo_dw_graph from datawindow
end type
end forward

global type uo_dw_graph from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global uo_dw_graph uo_dw_graph

event constructor;SetTransObject( SqlCa )
end event

event retrievestart;f_SetMHStatus( 1, 'Espere por favor...' )
end event

event retrieveend;f_SetMHStatus( 1, 'Listo' )
end event

on uo_dw_graph.create
end on

on uo_dw_graph.destroy
end on

