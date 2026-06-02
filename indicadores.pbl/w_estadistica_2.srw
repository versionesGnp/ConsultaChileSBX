forward
global type w_estadistica_2 from window
end type
type rb_mora from radiobutton within w_estadistica_2
end type
type st_1 from statictext within w_estadistica_2
end type
type ddlb_1 from dropdownlistbox within w_estadistica_2
end type
type rb_facturacion_anual from radiobutton within w_estadistica_2
end type
type cb_2 from commandbutton within w_estadistica_2
end type
type cb_1 from commandbutton within w_estadistica_2
end type
type gb_1 from groupbox within w_estadistica_2
end type
end forward

global type w_estadistica_2 from window
integer x = 1074
integer y = 484
integer width = 946
integer height = 536
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_mora rb_mora
st_1 st_1
ddlb_1 ddlb_1
rb_facturacion_anual rb_facturacion_anual
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_estadistica_2 w_estadistica_2

type variables
date fecha
end variables

on w_estadistica_2.create
this.rb_mora=create rb_mora
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.rb_facturacion_anual=create rb_facturacion_anual
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_mora,&
this.st_1,&
this.ddlb_1,&
this.rb_facturacion_anual,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_estadistica_2.destroy
destroy(this.rb_mora)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.rb_facturacion_anual)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string c_fecha,sql,fech
double valor_uf
setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
fecha = date(Message.StringParm)
//em_fecha_cierre.TEXT = string(fecha,gs_formato_fecha)
sql = 'SELECT DISTINCT substr("FACTURA_OFERTA"."FECHA_CIERRE",8,10 )  '+& 
		' FROM "FACTURA_OFERTA"  '+& 
		' GROUP BY "FACTURA_OFERTA"."FECHA_CIERRE"   '
fech = mid(string(fecha,gs_formato_fecha),len(string(fecha,gs_formato_fecha))-1)		
ddlb_1.SelectItem(f_ddlb_all_2(ddlb_1,sql,fech))
end event

type rb_mora from radiobutton within w_estadistica_2
integer x = 123
integer y = 596
integer width = 553
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Mora Anual"
end type

type st_1 from statictext within w_estadistica_2
integer x = 69
integer y = 36
integer width = 443
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean enabled = false
string text = "Seleccionar Año"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_estadistica_2
integer x = 59
integer y = 100
integer width = 443
integer height = 336
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_facturacion_anual from radiobutton within w_estadistica_2
integer x = 123
integer y = 532
integer width = 553
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Facturación Anual"
boolean checked = true
end type

type cb_2 from commandbutton within w_estadistica_2
integer x = 562
integer y = 276
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica)
end event

type cb_1 from commandbutton within w_estadistica_2
integer x = 562
integer y = 92
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string param

param = trim(ddlb_1.text)
if rb_facturacion_anual.checked = true then
	OpenWithParm(w_estadisticas_fact,param)	
elseif rb_mora.checked = true then
	OpenWithParm(w_estadistica_mora,param)	
//elseif rb_dv.checked = true then
//	OpenWithParm(w_resumen_dv_anual,param)	
end if
end event

type gb_1 from groupbox within w_estadistica_2
integer x = 82
integer y = 468
integer width = 635
integer height = 228
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
end type

