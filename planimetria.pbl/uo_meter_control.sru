forward
global type uo_meter_control from olecustomcontrol
end type
end forward

global type uo_meter_control from olecustomcontrol
int Width=1989
int Height=133
int TabOrder=1
long BackColor=16777215
boolean Border=false
string BinaryKey="uo_meter_control.udo"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
end type
global uo_meter_control uo_meter_control

forward prototypes
public subroutine uo_inserta_valores (long medida, long minimo, long maximo)
end prototypes

public subroutine uo_inserta_valores (long medida, long minimo, long maximo);//this.maximun= '5'
end subroutine

