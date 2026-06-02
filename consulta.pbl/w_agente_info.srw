forward
global type w_agente_info from window
end type
type cb_hist_sup from commandbutton within w_agente_info
end type
type cb_4 from commandbutton within w_agente_info
end type
type cb_2 from commandbutton within w_agente_info
end type
type cb_sup from commandbutton within w_agente_info
end type
type dw_lista_clasif_hist from datawindow within w_agente_info
end type
type cb_3 from commandbutton within w_agente_info
end type
type cb_agente from commandbutton within w_agente_info
end type
type dw_datos_agente_sup from datawindow within w_agente_info
end type
type cb_1 from commandbutton within w_agente_info
end type
end forward

global type w_agente_info from window
integer x = 370
integer y = 212
integer width = 2981
integer height = 1872
boolean titlebar = true
string title = "Pago de Comisión"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_hist_sup cb_hist_sup
cb_4 cb_4
cb_2 cb_2
cb_sup cb_sup
dw_lista_clasif_hist dw_lista_clasif_hist
cb_3 cb_3
cb_agente cb_agente
dw_datos_agente_sup dw_datos_agente_sup
cb_1 cb_1
end type
global w_agente_info w_agente_info

type variables
string is_age, is_sup
String is_codigo, is_estado, is_rut, is_fecha, is_nombre
String is_codigo1, is_estado1, is_rut1, is_fecha1, is_nombre1
datawindow dw_paso
end variables

on w_agente_info.create
this.cb_hist_sup=create cb_hist_sup
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_sup=create cb_sup
this.dw_lista_clasif_hist=create dw_lista_clasif_hist
this.cb_3=create cb_3
this.cb_agente=create cb_agente
this.dw_datos_agente_sup=create dw_datos_agente_sup
this.cb_1=create cb_1
this.Control[]={this.cb_hist_sup,&
this.cb_4,&
this.cb_2,&
this.cb_sup,&
this.dw_lista_clasif_hist,&
this.cb_3,&
this.cb_agente,&
this.dw_datos_agente_sup,&
this.cb_1}
end on

on w_agente_info.destroy
destroy(this.cb_hist_sup)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_sup)
destroy(this.dw_lista_clasif_hist)
destroy(this.cb_3)
destroy(this.cb_agente)
destroy(this.dw_datos_agente_sup)
destroy(this.cb_1)
end on

event open;gf_centrar(w_agente_info)
is_age   												= substr(1,1,Message.StringParm)
is_sup												= substr(1,2,Message.StringParm)
dw_datos_agente_sup.settransobject(sqlca)
dw_datos_agente_sup.retrieve(is_age,is_sup)
dw_lista_clasif_hist.dataobject 					= 'dw_lista_res_comi'
dw_lista_clasif_hist.settransobject(sqlca)
dw_lista_clasif_hist.retrieve(is_age)
is_codigo												= dw_datos_agente_sup.GetitemString(1,'agentes_cod_age')
is_estado											= dw_datos_agente_sup.getitemstring(1,'agentes_estado')
is_rut													= string(dw_datos_agente_sup.getitemNumber(1,'agentes_rut'))
is_nombre											= dw_datos_agente_sup.getitemstring(1,'c_nombre_completo')
is_fecha												= string(date(dw_datos_agente_sup.getitemdatetime(1,'agentes_fecha_ini')))

is_codigo1											= dw_datos_agente_sup.getitemstring(1,'supervisor_cod_sup')
is_estado1											= dw_datos_agente_sup.getitemstring(1,'supervisor_estado')
is_rut1												= string(dw_datos_agente_sup.getitemnumber(1,'supervisor_rut'))
is_nombre1											= dw_datos_agente_sup.getitemstring(1,'c_nomb_sup')
is_fecha1											= string(date(dw_datos_agente_sup.getitemdatetime(1,'supervisor_fecha_ing')))

dw_lista_clasif_hist.object.c_codigo.text		= is_codigo
dw_lista_clasif_hist.object.c_estado.text		= is_estado
dw_lista_clasif_hist.object.c_rut.text			= is_rut
dw_lista_clasif_hist.object.c_nombre.text	= is_nombre
dw_lista_clasif_hist.object.c_fecha_ini.text	= is_fecha

gs_ventana											= 'w_agente_info'
f_valida_objeto()
end event

type cb_hist_sup from commandbutton within w_agente_info
event clicked pbm_bnclicked
integer x = 1335
integer y = 1648
integer width = 389
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Hist.Clasif.S&up"
end type

event clicked;dw_lista_clasif_hist.dataobject 					= 'dw_lista_clasif_hist_sup'
dw_lista_clasif_hist.settransobject(sqlca)
dw_lista_clasif_hist.retrieve(is_sup)
dw_lista_clasif_hist.object.c_codigo.text		= is_codigo1
dw_lista_clasif_hist.object.c_estado.text		= is_estado1
dw_lista_clasif_hist.object.c_rut.text			= is_rut1
dw_lista_clasif_hist.object.c_nombre.text	= is_nombre1
dw_lista_clasif_hist.object.c_fecha_ini.text	= is_fecha1
end event

type cb_4 from commandbutton within w_agente_info
integer x = 2153
integer y = 1648
integer width = 265
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso		= dw_lista_clasif_hist
f_DWToExcel( dw_paso )
//OpenWithParm(w_exportar, dw_paso)
end event

type cb_2 from commandbutton within w_agente_info
integer x = 1902
integer y = 1648
integer width = 247
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Im&primir"
end type

event clicked;dw_lista_clasif_hist.print()


end event

type cb_sup from commandbutton within w_agente_info
event clicked pbm_bnclicked
integer x = 457
integer y = 1648
integer width = 494
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ResComi &Supervisor"
end type

event clicked;dw_lista_clasif_hist.dataobject 					= 'dw_lista_res_comi_sup'
dw_lista_clasif_hist.settransobject(sqlca)
dw_lista_clasif_hist.retrieve(is_sup)
dw_lista_clasif_hist.object.c_codigo.text		= is_codigo1
dw_lista_clasif_hist.object.c_estado.text		= is_estado1
dw_lista_clasif_hist.object.c_rut.text			= is_rut1
dw_lista_clasif_hist.object.c_nombre.text	= is_nombre1
dw_lista_clasif_hist.object.c_fecha_ini.text	= is_fecha1
end event

type dw_lista_clasif_hist from datawindow within w_agente_info
integer x = 32
integer y = 568
integer width = 2889
integer height = 1048
integer taborder = 10
string dataobject = "dw_lista_clasif_hist_sup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_agente_info
integer x = 955
integer y = 1648
integer width = 375
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Hist.Clasif.Age"
end type

event clicked;dw_lista_clasif_hist.dataobject 					= 'dw_lista_clasif_hist'
dw_lista_clasif_hist.settransobject(sqlca)
dw_lista_clasif_hist.retrieve(is_age)
dw_lista_clasif_hist.object.c_codigo.text		= is_codigo
dw_lista_clasif_hist.object.c_estado.text		= is_estado
dw_lista_clasif_hist.object.c_rut.text			= is_rut
dw_lista_clasif_hist.object.c_nombre.text	= is_nombre
dw_lista_clasif_hist.object.c_fecha_ini.text	= is_fecha
end event

type cb_agente from commandbutton within w_agente_info
integer x = 32
integer y = 1648
integer width = 421
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&ResComi Agente"
end type

event clicked;dw_lista_clasif_hist.dataobject 					= 'dw_lista_res_comi'
dw_lista_clasif_hist.settransobject(sqlca)
dw_lista_clasif_hist.retrieve(is_age)
dw_lista_clasif_hist.object.c_codigo.text		= is_codigo
dw_lista_clasif_hist.object.c_estado.text		= is_estado
dw_lista_clasif_hist.object.c_rut.text			= is_rut
dw_lista_clasif_hist.object.c_nombre.text	= is_nombre
dw_lista_clasif_hist.object.c_fecha_ini.text	= is_fecha

end event

type dw_datos_agente_sup from datawindow within w_agente_info
integer x = 9
integer y = 8
integer width = 2939
integer height = 524
string dataobject = "dw_datos_agente_sup"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_agente_info
integer x = 2638
integer y = 1648
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

