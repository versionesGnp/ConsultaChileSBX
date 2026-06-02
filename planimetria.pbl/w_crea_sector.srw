forward
global type w_crea_sector from Window
end type
type dw_a_crea_sector from datawindow within w_crea_sector
end type
end forward

global type w_crea_sector from Window
int X=1335
int Y=685
int Width=3187
int Height=1965
boolean TitleBar=true
string Title="Untitled"
long BackColor=67108864
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_a_crea_sector dw_a_crea_sector
end type
global w_crea_sector w_crea_sector

on w_crea_sector.create
this.dw_a_crea_sector=create dw_a_crea_sector
this.Control[]={ this.dw_a_crea_sector}
end on

on w_crea_sector.destroy
destroy(this.dw_a_crea_sector)
end on

type dw_a_crea_sector from datawindow within w_crea_sector
int X=151
int Y=385
int Width=2885
int Height=401
int TabOrder=1
string DataObject="a_crea_sector"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

