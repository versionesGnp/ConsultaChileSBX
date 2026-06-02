forward
global type w_nulos_con_fallecidos from window
end type
type dw_1 from datawindow within w_nulos_con_fallecidos
end type
type cb_2 from commandbutton within w_nulos_con_fallecidos
end type
type cb_1 from commandbutton within w_nulos_con_fallecidos
end type
end forward

global type w_nulos_con_fallecidos from window
integer x = 73
integer y = 236
integer width = 3022
integer height = 1948
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_nulos_con_fallecidos w_nulos_con_fallecidos

on w_nulos_con_fallecidos.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_nulos_con_fallecidos.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_1.settransobject(sqlca)
if dw_1.retrieve()>0 then
	dw_1.object.titulo.text = gs_empresa
	gf_centrar(w_nulos_con_fallecidos)
else
	messagebox('No hay Datos','NO Existen Registros')
	close(w_nulos_con_fallecidos)
end if
end event

type dw_1 from datawindow within w_nulos_con_fallecidos
integer x = 59
integer y = 48
integer width = 2894
integer height = 1608
integer taborder = 1
string dataobject = "dw_nulos_con_fallecidos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_nulos_con_fallecidos
integer x = 2647
integer y = 1704
integer width = 306
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_nulos_con_fallecidos)
end event

type cb_1 from commandbutton within w_nulos_con_fallecidos
integer x = 59
integer y = 1704
integer width = 306
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;integer Net

Net = MessageBox("Imprimir" , "Desea imprimir ", Exclamation!, OKCancel!, 2)
IF Net = 1 THEN 
   IF PrintSetup( ) <> -1 THEN
//	   dw_a_info_total.Print()
		dw_1.object.datawindow.print.Preview = true
	   dw_1.Print()
		dw_1.object.datawindow.print.Preview = false
   END IF

END IF
end event

