forward
global type w_seleccion_fechas from window
end type
type cb_1 from commandbutton within w_seleccion_fechas
end type
type cb_3 from commandbutton within w_seleccion_fechas
end type
type ddlb_1 from dropdownlistbox within w_seleccion_fechas
end type
type ddlb_2 from dropdownlistbox within w_seleccion_fechas
end type
type st_1 from statictext within w_seleccion_fechas
end type
type st_2 from statictext within w_seleccion_fechas
end type
end forward

global type w_seleccion_fechas from window
integer x = 1038
integer y = 588
integer width = 1102
integer height = 664
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_1 cb_1
cb_3 cb_3
ddlb_1 ddlb_1
ddlb_2 ddlb_2
st_1 st_1
st_2 st_2
end type
global w_seleccion_fechas w_seleccion_fechas

event open;string sql,fech
datetime fecha

setpointer (HourGlass!)
this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title 	= gs_app_name
SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE")  
INTO 		:fecha  
FROM 		"FACTURA_OFERTA"  ;
if gs_tipo_contrato = 'O' then
	this.title = 'Estado Movil ( Promesa ).'
	sql = 'SELECT DISTINCT "RES_MORA_FACT"."MES"  '+& 
			' FROM "RES_MORA_FACT"  '+& 
			' WHERE "RES_MORA_FACT"."BASE" = '+"'"+'O' +"'"+& 
			' GROUP BY "RES_MORA_FACT"."MES"   '		 
else
	this.title = 'Estado Movil ( Liberadores ).'
	sql = 'SELECT DISTINCT "RES_MORA_FACT"."MES"  '+& 
			' FROM "RES_MORA_FACT"  '+& 
			' WHERE "RES_MORA_FACT"."BASE" = '+"'"+'L' +"'"+& 
			' GROUP BY "RES_MORA_FACT"."MES"   '		 
end if
fech 		= string(fecha,gs_formato_fecha)
ddlb_1.SelectItem(f_ddlb_all_2(ddlb_1,sql,fech))
fech 		= string(fecha,gs_formato_fecha)
ddlb_2.SelectItem(f_ddlb_all_2(ddlb_2,sql,fech))
end event

on w_seleccion_fechas.create
this.cb_1=create cb_1
this.cb_3=create cb_3
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.st_2=create st_2
this.Control[]={this.cb_1,&
this.cb_3,&
this.ddlb_1,&
this.ddlb_2,&
this.st_1,&
this.st_2}
end on

on w_seleccion_fechas.destroy
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.st_2)
end on

type cb_1 from commandbutton within w_seleccion_fechas
integer x = 704
integer y = 356
integer width = 306
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_seleccion_fechas)
end event

type cb_3 from commandbutton within w_seleccion_fechas
event clicked pbm_bnclicked
integer x = 704
integer y = 140
integer width = 306
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

event clicked;gd_fecha_1 = date(ddlb_1.text)
gd_fecha_2 = date(ddlb_2.text)
if gs_tipo_contrato = 'O' then
	if gd_fecha_1 > gd_fecha_2 then
		messagebox('Error','La fecha inicial debe ser menor  o igual a la fecha de termino.',stopsign!)
		ddlb_1.setfocus()
	else
		open(w_indicadores)
	end if
else
	if gd_fecha_1 > gd_fecha_2 then
		messagebox('Error','La fecha inicial debe ser menor  o igual a la fecha de termino.',stopsign!)
		ddlb_1.setfocus()
	else
		open(w_indicadores_lib)
	end if	
end if
end event

type ddlb_1 from dropdownlistbox within w_seleccion_fechas
integer x = 114
integer y = 148
integer width = 480
integer height = 508
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

type ddlb_2 from dropdownlistbox within w_seleccion_fechas
integer x = 114
integer y = 372
integer width = 480
integer height = 508
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_seleccion_fechas
integer x = 123
integer y = 80
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha Inicio"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_seleccion_fechas
integer x = 114
integer y = 308
integer width = 480
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha Termino"
alignment alignment = center!
boolean focusrectangle = false
end type

