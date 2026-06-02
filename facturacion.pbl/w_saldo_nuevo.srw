forward
global type w_saldo_nuevo from window
end type
type rb_resciliadas from radiobutton within w_saldo_nuevo
end type
type rb_libro from radiobutton within w_saldo_nuevo
end type
type rb_consulta from radiobutton within w_saldo_nuevo
end type
type rb_mora from radiobutton within w_saldo_nuevo
end type
type rb_resumen from radiobutton within w_saldo_nuevo
end type
type rb_saldo_nueva from radiobutton within w_saldo_nuevo
end type
type rb_facturado from radiobutton within w_saldo_nuevo
end type
type cb_3 from commandbutton within w_saldo_nuevo
end type
type st_1 from statictext within w_saldo_nuevo
end type
type cb_2 from commandbutton within w_saldo_nuevo
end type
type p_1 from picture within w_saldo_nuevo
end type
type em_fecha_cierre from editmask within w_saldo_nuevo
end type
type gb_2 from groupbox within w_saldo_nuevo
end type
type gb_1 from groupbox within w_saldo_nuevo
end type
end forward

global type w_saldo_nuevo from window
integer x = 832
integer y = 360
integer width = 1303
integer height = 1340
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
rb_resciliadas rb_resciliadas
rb_libro rb_libro
rb_consulta rb_consulta
rb_mora rb_mora
rb_resumen rb_resumen
rb_saldo_nueva rb_saldo_nueva
rb_facturado rb_facturado
cb_3 cb_3
st_1 st_1
cb_2 cb_2
p_1 p_1
em_fecha_cierre em_fecha_cierre
gb_2 gb_2
gb_1 gb_1
end type
global w_saldo_nuevo w_saldo_nuevo

on w_saldo_nuevo.create
this.rb_resciliadas=create rb_resciliadas
this.rb_libro=create rb_libro
this.rb_consulta=create rb_consulta
this.rb_mora=create rb_mora
this.rb_resumen=create rb_resumen
this.rb_saldo_nueva=create rb_saldo_nueva
this.rb_facturado=create rb_facturado
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.rb_resciliadas,&
this.rb_libro,&
this.rb_consulta,&
this.rb_mora,&
this.rb_resumen,&
this.rb_saldo_nueva,&
this.rb_facturado,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.p_1,&
this.em_fecha_cierre,&
this.gb_2,&
this.gb_1}
end on

on w_saldo_nuevo.destroy
destroy(this.rb_resciliadas)
destroy(this.rb_libro)
destroy(this.rb_consulta)
destroy(this.rb_mora)
destroy(this.rb_resumen)
destroy(this.rb_saldo_nueva)
destroy(this.rb_facturado)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.p_1)
destroy(this.em_fecha_cierre)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
select distinct sysdate into :gdt_tiempo_servidor from agentes;
em_fecha_cierre.text = string(date(gdt_tiempo_servidor),gs_formato_fecha)
this.title = gs_app_name
end event

type rb_resciliadas from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 848
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Ofertas Resciliadas."
end type

type rb_libro from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 756
integer width = 613
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Libro de Venta."
end type

type rb_consulta from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 944
integer width = 613
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Consulta."
end type

type rb_mora from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 572
integer width = 658
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Ofertas en Mora"
end type

type rb_resumen from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 664
integer width = 613
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Resumen Total."
end type

type rb_saldo_nueva from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 480
integer width = 658
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Saldos y Nuevas."
end type

type rb_facturado from radiobutton within w_saldo_nuevo
integer x = 302
integer y = 388
integer width = 480
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Facturado."
boolean checked = true
end type

type cb_3 from commandbutton within w_saldo_nuevo
integer x = 64
integer y = 1116
integer width = 311
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if rb_facturado.checked = true then
	OpenWithParm(w_resumen_total,em_fecha_cierre.text)
elseif rb_saldo_nueva.checked = true then
	OpenWithParm(w_resumen_saldo,em_fecha_cierre.text)
elseif rb_resumen.checked = true then
	OpenWithParm(w_resumen_total_total,em_fecha_cierre.text)
elseif rb_mora.checked = true then
	OpenWithParm(w_mora,em_fecha_cierre.text)
elseif rb_consulta.checked = true then
	OpenWithParm(w_consulta_ofertas,em_fecha_cierre.text)
elseif rb_libro.checked = true then
	OpenWithParm(w_libro_venta_oferta,em_fecha_cierre.text)
elseif rb_resciliadas.checked = true then
	OpenWithParm(w_imprime_saldo_resciliadas,em_fecha_cierre.text)
end if
end event

type st_1 from statictext within w_saldo_nuevo
integer x = 123
integer y = 144
integer width = 535
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de Cierre :"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_saldo_nuevo
integer x = 914
integer y = 1116
integer width = 311
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cierrar"
end type

event clicked;close(w_saldo_nuevo)
end event

type p_1 from picture within w_saldo_nuevo
event clicked pbm_bnclicked
integer x = 1038
integer y = 136
integer width = 82
integer height = 88
string picturename = "c:boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha_cierre.text)=-1 then 
	em_fecha_cierre.text=string(today(),gs_formato_fecha)
	em_fecha_cierre.setfocus()
	return
end if	
if em_fecha_cierre.text<>'00/00/0000' then
	ls_fecha = em_fecha_cierre.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha_cierre.text = Message.StringParm
end if	
end event

type em_fecha_cierre from editmask within w_saldo_nuevo
event modified pbm_enmodified
integer x = 667
integer y = 132
integer width = 361
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type gb_2 from groupbox within w_saldo_nuevo
integer x = 64
integer y = 324
integer width = 1161
integer height = 744
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Informes de Ofertas"
end type

type gb_1 from groupbox within w_saldo_nuevo
integer x = 64
integer y = 32
integer width = 1161
integer height = 272
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
end type

