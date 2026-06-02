forward
global type w_cambia_area from window
end type
type cb_2 from commandbutton within w_cambia_area
end type
type cb_1 from commandbutton within w_cambia_area
end type
type dw_1 from datawindow within w_cambia_area
end type
end forward

global type w_cambia_area from window
integer x = 1074
integer y = 484
integer width = 1115
integer height = 1208
boolean titlebar = true
string title = "Cambio de Area"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_cambia_area w_cambia_area

on w_cambia_area.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_cambia_area.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar(w_cambia_area)
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type cb_2 from commandbutton within w_cambia_area
integer x = 713
integer y = 76
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;integer Net

long Distance = 3.457

Net = MessageBox("Actualizar", '¿ Desea actualizar datos ?', Exclamation!, OKCancel!, 2)
IF Net = 1 THEN 
	dw_1.update()
	commit;
ELSE

END IF
end event

type cb_1 from commandbutton within w_cambia_area
integer x = 713
integer y = 216
integer width = 347
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambia_area)
end event

type dw_1 from datawindow within w_cambia_area
integer x = 96
integer y = 76
integer width = 558
integer height = 968
integer taborder = 10
string dataobject = "dw_cambia_area"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

