forward
global type uo_datawindow from datawindow
end type
end forward

global type uo_datawindow from datawindow
int Width=494
int Height=361
int TabOrder=1
boolean Border=false
boolean HScrollBar=true
boolean VScrollBar=true
end type
global uo_datawindow uo_datawindow

type variables
string MenuHabilitado,sql_original
end variables

event constructor;sql_original = this.GetSqlSelect()

end event

event rbuttondown;m_menu Menu

Menu = Create m_menu
Menu.m_popup.m_buscar.Visible = (Mid(MenuHabilitado, 1, 1) = "0")
Menu.m_popup.m_ordenar.Visible = (Mid(MenuHabilitado, 2, 1) = "0")
Menu.m_popup.m_condicionar.Visible = (Mid(MenuHabilitado, 3, 1) = "0")
Menu.m_popup.m_resetear.Visible = (Mid(MenuHabilitado, 4, 1) = "0")
Menu.m_popup.m_agrupar.Visible = (Mid(MenuHabilitado, 5, 1) = "0")
Menu.m_popup.m_exportar.Visible = (Mid(MenuHabilitado, 6, 1) = "0")
Menu.m_popup.m_importar.Visible = (Mid(MenuHabilitado, 7, 1) = "0")
Menu.dw_paso = This
Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY())
end event

