forward
global type w_principal_etiqueta from window
end type
end forward

global type w_principal_etiqueta from window
integer x = 713
integer y = 424
integer width = 2295
integer height = 1420
boolean titlebar = true
string title = "Creación de Etiquetas"
string menuname = "mn_principal_etiqueta"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 79741120
end type
global w_principal_etiqueta w_principal_etiqueta

on w_principal_etiqueta.create
if this.MenuName = "mn_principal_etiqueta" then this.MenuID = create mn_principal_etiqueta
end on

on w_principal_etiqueta.destroy
if IsValid(MenuID) then destroy(MenuID)
end on

