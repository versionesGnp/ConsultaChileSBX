forward
global type w_estadistica_falle from window
end type
type rb_estadistica_capacidades_tierra_no from radiobutton within w_estadistica_falle
end type
type rb_estadistica_capacidades_tierra from radiobutton within w_estadistica_falle
end type
type rb_estadistica_contratos from radiobutton within w_estadistica_falle
end type
type st_1 from statictext within w_estadistica_falle
end type
type ddlb_1 from dropdownlistbox within w_estadistica_falle
end type
type rb_fallecidos from radiobutton within w_estadistica_falle
end type
type cb_2 from commandbutton within w_estadistica_falle
end type
type cb_1 from commandbutton within w_estadistica_falle
end type
type rb_fallecidos_2 from radiobutton within w_estadistica_falle
end type
type rb_mora from radiobutton within w_estadistica_falle
end type
type gb_1 from groupbox within w_estadistica_falle
end type
end forward

global type w_estadistica_falle from window
integer x = 1074
integer y = 484
integer width = 1769
integer height = 952
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_estadistica_capacidades_tierra_no rb_estadistica_capacidades_tierra_no
rb_estadistica_capacidades_tierra rb_estadistica_capacidades_tierra
rb_estadistica_contratos rb_estadistica_contratos
st_1 st_1
ddlb_1 ddlb_1
rb_fallecidos rb_fallecidos
cb_2 cb_2
cb_1 cb_1
rb_fallecidos_2 rb_fallecidos_2
rb_mora rb_mora
gb_1 gb_1
end type
global w_estadistica_falle w_estadistica_falle

type variables
date fecha
end variables

on w_estadistica_falle.create
this.rb_estadistica_capacidades_tierra_no=create rb_estadistica_capacidades_tierra_no
this.rb_estadistica_capacidades_tierra=create rb_estadistica_capacidades_tierra
this.rb_estadistica_contratos=create rb_estadistica_contratos
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.rb_fallecidos=create rb_fallecidos
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_fallecidos_2=create rb_fallecidos_2
this.rb_mora=create rb_mora
this.gb_1=create gb_1
this.Control[]={this.rb_estadistica_capacidades_tierra_no,&
this.rb_estadistica_capacidades_tierra,&
this.rb_estadistica_contratos,&
this.st_1,&
this.ddlb_1,&
this.rb_fallecidos,&
this.cb_2,&
this.cb_1,&
this.rb_fallecidos_2,&
this.rb_mora,&
this.gb_1}
end on

on w_estadistica_falle.destroy
destroy(this.rb_estadistica_capacidades_tierra_no)
destroy(this.rb_estadistica_capacidades_tierra)
destroy(this.rb_estadistica_contratos)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.rb_fallecidos)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_fallecidos_2)
destroy(this.rb_mora)
destroy(this.gb_1)
end on

event open;string c_fecha,sql,fech
double valor_uf
this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title	= gs_app_name
fecha 		= date(Message.StringParm)
//em_fecha_cierre.TEXT = string(fecha,gs_formato_fecha)
sql 			= 'SELECT DISTINCT substr("FALLECIDOS"."FEC_SEP",8,10 )  '+&
				  'FROM "FALLECIDOS"  '+&
				  'GROUP BY "FALLECIDOS"."FEC_SEP" '
fech 			= mid(string(fecha,gs_formato_fecha),len(string(fecha,gs_formato_fecha))-1)		
ddlb_1.SelectItem(f_ddlb_all_mes(ddlb_1,sql,fech))
end event

type rb_estadistica_capacidades_tierra_no from radiobutton within w_estadistica_falle
boolean visible = false
integer x = 279
integer y = 1016
integer width = 1326
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Estadistica Capacidades Tierra NO Asignadas"
end type

type rb_estadistica_capacidades_tierra from radiobutton within w_estadistica_falle
boolean visible = false
integer x = 274
integer y = 916
integer width = 1221
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Estadistica Capacidades Tierra Asignadas"
end type

type rb_estadistica_contratos from radiobutton within w_estadistica_falle
integer x = 261
integer y = 524
integer width = 1179
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estadistica Contratos"
end type

type st_1 from statictext within w_estadistica_falle
integer x = 585
integer y = 36
integer width = 457
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
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_estadistica_falle
integer x = 581
integer y = 104
integer width = 471
integer height = 564
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

type rb_fallecidos from radiobutton within w_estadistica_falle
integer x = 261
integer y = 308
integer width = 750
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fallecidos por año"
boolean checked = true
end type

type cb_2 from commandbutton within w_estadistica_falle
integer x = 1394
integer y = 712
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

event clicked;close(w_estadistica_falle)
end event

type cb_1 from commandbutton within w_estadistica_falle
integer x = 50
integer y = 712
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
setpointer (HourGlass!)
param = trim(ddlb_1.text)
if rb_fallecidos.checked = true then
	OpenWithParm(w_estadistica_fallecidos,param)	
elseif rb_fallecidos_2.checked = true then
	Open(w_estadistica_fallecidos_total)	
elseif rb_estadistica_contratos.checked = true then
	Open(w_estadistica_de_contratos)
elseif rb_estadistica_capacidades_tierra.checked = true then
	Open(w_estadistica_de_contratos_capac)
elseif rb_estadistica_capacidades_tierra_no.checked = true then
	Open(w_estadistica_de_contratos_capac_no)
end if



end event

type rb_fallecidos_2 from radiobutton within w_estadistica_falle
integer x = 261
integer y = 416
integer width = 997
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Resumen Historico de Fallecidos "
end type

type rb_mora from radiobutton within w_estadistica_falle
boolean visible = false
integer x = 389
integer y = 416
integer width = 800
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Mora Anual"
end type

type gb_1 from groupbox within w_estadistica_falle
integer x = 50
integer y = 216
integer width = 1646
integer height = 448
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

