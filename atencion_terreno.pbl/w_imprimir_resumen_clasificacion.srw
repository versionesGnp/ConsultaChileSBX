forward
global type w_imprimir_resumen_clasificacion from window
end type
type cb_cerrar from commandbutton within w_imprimir_resumen_clasificacion
end type
type cb_print from commandbutton within w_imprimir_resumen_clasificacion
end type
type dw_print from datawindow within w_imprimir_resumen_clasificacion
end type
end forward

global type w_imprimir_resumen_clasificacion from window
integer width = 2752
integer height = 2068
boolean titlebar = true
string title = "Resumen Evaluación de Riesgo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_print cb_print
dw_print dw_print
end type
global w_imprimir_resumen_clasificacion w_imprimir_resumen_clasificacion

on w_imprimir_resumen_clasificacion.create
this.cb_cerrar=create cb_cerrar
this.cb_print=create cb_print
this.dw_print=create dw_print
this.Control[]={this.cb_cerrar,&
this.cb_print,&
this.dw_print}
end on

on w_imprimir_resumen_clasificacion.destroy
destroy(this.cb_cerrar)
destroy(this.cb_print)
destroy(this.dw_print)
end on

event open;date	ld_fec_ini,ld_fec_fin

gf_centrar(w_imprimir_resumen_clasificacion)
dw_print.settransobject(sqlca)
if isvalid(w_buscar_clasificacion_de_riesgo) then
	ld_fec_ini				= date(w_buscar_clasificacion_de_riesgo.em_fec_ini.text)
	ld_fec_fin				= date(w_buscar_clasificacion_de_riesgo.em_fec_fin.text)
	if dw_print.retrieve(ld_fec_ini,ld_fec_fin)=0 then 
		close(w_buscar_clasificacion_de_riesgo)
	end if
else
	close(w_buscar_clasificacion_de_riesgo)
end if
end event

type cb_cerrar from commandbutton within w_imprimir_resumen_clasificacion
integer x = 2322
integer y = 1812
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_resumen_clasificacion)
end event

type cb_print from commandbutton within w_imprimir_resumen_clasificacion
integer x = 37
integer y = 1812
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_print.rowcount()>0 then
	f_Print( dw_print )
//	f_printdlg(dw_print,gstr_print,w_imprimir_resumen_clasificacion)
end if
end event

type dw_print from datawindow within w_imprimir_resumen_clasificacion
integer x = 37
integer y = 32
integer width = 2629
integer height = 1728
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_general_clasific_resumen_parque"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

