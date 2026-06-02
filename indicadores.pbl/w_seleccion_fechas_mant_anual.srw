forward
global type w_seleccion_fechas_mant_anual from window
end type
type dw_1 from datawindow within w_seleccion_fechas_mant_anual
end type
type st_3 from statictext within w_seleccion_fechas_mant_anual
end type
type ddlb_3 from dropdownlistbox within w_seleccion_fechas_mant_anual
end type
type cb_1 from commandbutton within w_seleccion_fechas_mant_anual
end type
type cb_3 from commandbutton within w_seleccion_fechas_mant_anual
end type
type ddlb_1 from dropdownlistbox within w_seleccion_fechas_mant_anual
end type
type st_1 from statictext within w_seleccion_fechas_mant_anual
end type
end forward

global type w_seleccion_fechas_mant_anual from window
integer x = 1038
integer y = 588
integer width = 983
integer height = 544
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
st_3 st_3
ddlb_3 ddlb_3
cb_1 cb_1
cb_3 cb_3
ddlb_1 ddlb_1
st_1 st_1
end type
global w_seleccion_fechas_mant_anual w_seleccion_fechas_mant_anual

forward prototypes
public function integer wf_mes_numero (string mes)
end prototypes

public function integer wf_mes_numero (string mes);CHOOSE CASE mes
	CASE 'Enero'
		return 1
	CASE 'Febrero'
		return 2
	CASE 'Marzo'
		return 3
	CASE 'Abril'
		return 4
	CASE 'Mayo'
		return 5
	CASE 'Junio'
		return 6
	CASE 'Julio'
		return 7
	CASE 'Agosto'
		return 8
	CASE 'Septiembre'
		return 9
	CASE 'Octubre'
		return 10
	CASE 'Noviembre'
		return 11
	CASE 'Diciembre'
		return 12
END CHOOSE

end function

event open;string sql,fech
integer fecha

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
SELECT max("HISTORICO_MANT"."AÑO")  
INTO :fecha  
FROM "HISTORICO_MANT"  ;
sql = 'SELECT DISTINCT "HISTORICO_MANT"."AÑO" FROM "HISTORICO_MANT"'

ddlb_1.SelectItem(f_ddlb_all_año(ddlb_1,sql,fecha))
//ddlb_2.SelectItem(wf_numero_mes(),0)
ddlb_3.SelectItem(1)
this.title = 'Mora de Mantención Anual'
end event

on w_seleccion_fechas_mant_anual.create
this.dw_1=create dw_1
this.st_3=create st_3
this.ddlb_3=create ddlb_3
this.cb_1=create cb_1
this.cb_3=create cb_3
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.Control[]={this.dw_1,&
this.st_3,&
this.ddlb_3,&
this.cb_1,&
this.cb_3,&
this.ddlb_1,&
this.st_1}
end on

on w_seleccion_fechas_mant_anual.destroy
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.ddlb_3)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.ddlb_1)
destroy(this.st_1)
end on

type dw_1 from datawindow within w_seleccion_fechas_mant_anual
integer x = 206
integer y = 728
integer width = 494
integer height = 360
string dataobject = "dw_verifica_mora"
boolean livescroll = true
end type

type st_3 from statictext within w_seleccion_fechas_mant_anual
integer x = 37
integer y = 212
integer width = 480
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within w_seleccion_fechas_mant_anual
integer x = 37
integer y = 276
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
string item[] = {"Promesa","Contrato ISA."}
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_seleccion_fechas_mant_anual
integer x = 626
integer y = 264
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

event clicked;close(w_seleccion_fechas_mant_anual)
end event

type cb_3 from commandbutton within w_seleccion_fechas_mant_anual
event clicked pbm_bnclicked
integer x = 626
integer y = 96
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

event clicked;string sql
setpointer (HourGlass!)
gstr_param.fecha_1 = ddlb_1.text
gstr_param.tipo    = ddlb_3.text
open(w_mora_mantencion_anual)
end event

type ddlb_1 from dropdownlistbox within w_seleccion_fechas_mant_anual
integer x = 37
integer y = 108
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

type st_1 from statictext within w_seleccion_fechas_mant_anual
integer x = 46
integer y = 40
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Año"
alignment alignment = center!
boolean focusrectangle = false
end type

