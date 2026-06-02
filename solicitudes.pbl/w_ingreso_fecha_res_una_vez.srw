forward
global type w_ingreso_fecha_res_una_vez from window
end type
type p_fecha from picture within w_ingreso_fecha_res_una_vez
end type
type em_fecha from editmask within w_ingreso_fecha_res_una_vez
end type
type st_1 from statictext within w_ingreso_fecha_res_una_vez
end type
type cb_grabar from commandbutton within w_ingreso_fecha_res_una_vez
end type
type gb_1 from groupbox within w_ingreso_fecha_res_una_vez
end type
end forward

global type w_ingreso_fecha_res_una_vez from window
integer width = 1074
integer height = 664
boolean titlebar = true
string title = "Fecha Resciliación"
windowtype windowtype = response!
long backcolor = 67108864
p_fecha p_fecha
em_fecha em_fecha
st_1 st_1
cb_grabar cb_grabar
gb_1 gb_1
end type
global w_ingreso_fecha_res_una_vez w_ingreso_fecha_res_una_vez

type variables
Date	idt_fecha_hoy
end variables

on w_ingreso_fecha_res_una_vez.create
this.p_fecha=create p_fecha
this.em_fecha=create em_fecha
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.gb_1=create gb_1
this.Control[]={this.p_fecha,&
this.em_fecha,&
this.st_1,&
this.cb_grabar,&
this.gb_1}
end on

on w_ingreso_fecha_res_una_vez.destroy
destroy(this.p_fecha)
destroy(this.em_fecha)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_fecha_res_una_vez)
idt_fecha_hoy	= date(gdt_fec_sistema)
em_fecha.text	= string(idt_fecha_hoy,"dd/mm/yyyy")
end event

type p_fecha from picture within w_ingreso_fecha_res_una_vez
integer x = 754
integer y = 168
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;//em_fecha_ini.text	= string(idt_fecha_hoy)
if f_valida_fecha(em_fecha.text)=-1 then 
	em_fecha.text = string(idt_fecha_hoy,'dd/mm/yyyy') //gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,em_fecha.text)
IF not isnull(Message.StringParm) THEN
	em_fecha.text	= trim(Message.StringParm)
	em_fecha.triggerevent(modified!)
END IF
end event

type em_fecha from editmask within w_ingreso_fecha_res_una_vez
integer x = 389
integer y = 168
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_ingreso_fecha_res_una_vez
integer x = 160
integer y = 184
integer width = 210
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_ingreso_fecha_res_una_vez
integer x = 55
integer y = 412
integer width = 448
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;time	lt_hora  = time("00:00:00")
gdt_fecha_res	= datetime(date(em_fecha.text),lt_hora)
close(w_ingreso_fecha_res_una_vez)
end event

type gb_1 from groupbox within w_ingreso_fecha_res_una_vez
integer x = 55
integer y = 40
integer width = 914
integer height = 336
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Fecha de Resciliación"
borderstyle borderstyle = stylelowered!
end type

