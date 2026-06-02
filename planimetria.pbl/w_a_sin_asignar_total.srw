forward
global type w_a_sin_asignar_total from window
end type
type cb_3 from commandbutton within w_a_sin_asignar_total
end type
type cb_2 from commandbutton within w_a_sin_asignar_total
end type
type cb_1 from commandbutton within w_a_sin_asignar_total
end type
type st_1 from statictext within w_a_sin_asignar_total
end type
type dw_a_a_oferta_sin_asignar_total from datawindow within w_a_sin_asignar_total
end type
type cb_5 from commandbutton within w_a_sin_asignar_total
end type
end forward

global type w_a_sin_asignar_total from window
integer x = 759
integer y = 720
integer width = 3040
integer height = 2272
boolean titlebar = true
string title = "Planimetria Zona A1"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
dw_a_a_oferta_sin_asignar_total dw_a_a_oferta_sin_asignar_total
cb_5 cb_5
end type
global w_a_sin_asignar_total w_a_sin_asignar_total

on w_a_sin_asignar_total.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_a_a_oferta_sin_asignar_total=create dw_a_a_oferta_sin_asignar_total
this.cb_5=create cb_5
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.dw_a_a_oferta_sin_asignar_total,&
this.cb_5}
end on

on w_a_sin_asignar_total.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_a_a_oferta_sin_asignar_total)
destroy(this.cb_5)
end on

event open;
gf_centrar(w_a_sin_asignar_total)

dw_a_a_oferta_sin_asignar_total.SetTransObject(SQLCA)
dw_a_a_oferta_sin_asignar_total.Retrieve()

end event

type cb_3 from commandbutton within w_a_sin_asignar_total
integer x = 649
integer y = 2024
integer width = 274
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;
string nulo
Setnull (nulo)
dw_a_a_oferta_sin_asignar_total.setfilter(nulo)
dw_a_a_oferta_sin_asignar_total.filter()
end event

type cb_2 from commandbutton within w_a_sin_asignar_total
integer x = 59
integer y = 2024
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprime"
end type

event clicked;integer Net
if dw_a_a_oferta_sin_asignar_total.rowcount() > 0 then
	Net = MessageBox("Imprimir" , "Desea imprimir ", Exclamation!, OKCancel!, 2)
	IF Net = 1 THEN 
		IF PrintSetup( ) <> -1 THEN
			dw_a_a_oferta_sin_asignar_total.object.datawindow.print.Preview = true
			dw_a_a_oferta_sin_asignar_total.Print()
			dw_a_a_oferta_sin_asignar_total.object.datawindow.print.Preview = false
		END IF
	end if
end if
end event

type cb_1 from commandbutton within w_a_sin_asignar_total
integer x = 370
integer y = 2024
integer width = 274
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;
string nulo
setnull (nulo)
dw_a_a_oferta_sin_asignar_total.SETSORT(NULO)
dw_a_a_oferta_sin_asignar_total.SORT()
end event

type st_1 from statictext within w_a_sin_asignar_total
integer x = 59
integer y = 52
integer width = 1216
integer height = 108
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Promesas sin Asignar"
boolean focusrectangle = false
end type

type dw_a_a_oferta_sin_asignar_total from datawindow within w_a_sin_asignar_total
integer x = 59
integer y = 176
integer width = 2898
integer height = 1804
string dataobject = "a_a_oferta_sin_asignar_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_a_sin_asignar_total
integer x = 2683
integer y = 2024
integer width = 274
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_a_sin_asignar_total)
end event

