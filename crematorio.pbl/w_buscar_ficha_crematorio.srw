forward
global type w_buscar_ficha_crematorio from window
end type
type cb_imprimir from commandbutton within w_buscar_ficha_crematorio
end type
type cb_3 from commandbutton within w_buscar_ficha_crematorio
end type
type cb_2 from commandbutton within w_buscar_ficha_crematorio
end type
type cb_1 from commandbutton within w_buscar_ficha_crematorio
end type
type rb_buscar_prelacion from radiobutton within w_buscar_ficha_crematorio
end type
type rb_buscar_fallecido from radiobutton within w_buscar_ficha_crematorio
end type
type rb_buscar_titular from radiobutton within w_buscar_ficha_crematorio
end type
type em_ap_pat_prelacion from editmask within w_buscar_ficha_crematorio
end type
type em_nom_prelacion from editmask within w_buscar_ficha_crematorio
end type
type em_rut_prelacion from editmask within w_buscar_ficha_crematorio
end type
type st_11 from statictext within w_buscar_ficha_crematorio
end type
type st_10 from statictext within w_buscar_ficha_crematorio
end type
type st_9 from statictext within w_buscar_ficha_crematorio
end type
type st_8 from statictext within w_buscar_ficha_crematorio
end type
type st_7 from statictext within w_buscar_ficha_crematorio
end type
type st_6 from statictext within w_buscar_ficha_crematorio
end type
type em_rut_fallecido from editmask within w_buscar_ficha_crematorio
end type
type em_nom_fallecido from editmask within w_buscar_ficha_crematorio
end type
type em_ap_pat_fallecido from editmask within w_buscar_ficha_crematorio
end type
type em_ap_pat_titular from editmask within w_buscar_ficha_crematorio
end type
type em_nom_titular from editmask within w_buscar_ficha_crematorio
end type
type em_rut_titular from editmask within w_buscar_ficha_crematorio
end type
type st_5 from statictext within w_buscar_ficha_crematorio
end type
type st_4 from statictext within w_buscar_ficha_crematorio
end type
type st_3 from statictext within w_buscar_ficha_crematorio
end type
type cb_aceptar from commandbutton within w_buscar_ficha_crematorio
end type
type dw_lista from datawindow within w_buscar_ficha_crematorio
end type
type cb_cerrar from commandbutton within w_buscar_ficha_crematorio
end type
type pb_ok from picturebutton within w_buscar_ficha_crematorio
end type
type st_2 from statictext within w_buscar_ficha_crematorio
end type
type st_1 from statictext within w_buscar_ficha_crematorio
end type
type dp_fin from datepicker within w_buscar_ficha_crematorio
end type
type dp_inicio from datepicker within w_buscar_ficha_crematorio
end type
type gb_2 from groupbox within w_buscar_ficha_crematorio
end type
type gb_1 from groupbox within w_buscar_ficha_crematorio
end type
end forward

global type w_buscar_ficha_crematorio from window
integer width = 3387
integer height = 2144
boolean titlebar = true
string title = "Lista Ficha Crematorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
rb_buscar_prelacion rb_buscar_prelacion
rb_buscar_fallecido rb_buscar_fallecido
rb_buscar_titular rb_buscar_titular
em_ap_pat_prelacion em_ap_pat_prelacion
em_nom_prelacion em_nom_prelacion
em_rut_prelacion em_rut_prelacion
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
em_rut_fallecido em_rut_fallecido
em_nom_fallecido em_nom_fallecido
em_ap_pat_fallecido em_ap_pat_fallecido
em_ap_pat_titular em_ap_pat_titular
em_nom_titular em_nom_titular
em_rut_titular em_rut_titular
st_5 st_5
st_4 st_4
st_3 st_3
cb_aceptar cb_aceptar
dw_lista dw_lista
cb_cerrar cb_cerrar
pb_ok pb_ok
st_2 st_2
st_1 st_1
dp_fin dp_fin
dp_inicio dp_inicio
gb_2 gb_2
gb_1 gb_1
end type
global w_buscar_ficha_crematorio w_buscar_ficha_crematorio

type variables
String		is_tipo_venta
end variables

on w_buscar_ficha_crematorio.create
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_buscar_prelacion=create rb_buscar_prelacion
this.rb_buscar_fallecido=create rb_buscar_fallecido
this.rb_buscar_titular=create rb_buscar_titular
this.em_ap_pat_prelacion=create em_ap_pat_prelacion
this.em_nom_prelacion=create em_nom_prelacion
this.em_rut_prelacion=create em_rut_prelacion
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.em_rut_fallecido=create em_rut_fallecido
this.em_nom_fallecido=create em_nom_fallecido
this.em_ap_pat_fallecido=create em_ap_pat_fallecido
this.em_ap_pat_titular=create em_ap_pat_titular
this.em_nom_titular=create em_nom_titular
this.em_rut_titular=create em_rut_titular
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.pb_ok=create pb_ok
this.st_2=create st_2
this.st_1=create st_1
this.dp_fin=create dp_fin
this.dp_inicio=create dp_inicio
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.rb_buscar_prelacion,&
this.rb_buscar_fallecido,&
this.rb_buscar_titular,&
this.em_ap_pat_prelacion,&
this.em_nom_prelacion,&
this.em_rut_prelacion,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.em_rut_fallecido,&
this.em_nom_fallecido,&
this.em_ap_pat_fallecido,&
this.em_ap_pat_titular,&
this.em_nom_titular,&
this.em_rut_titular,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cb_aceptar,&
this.dw_lista,&
this.cb_cerrar,&
this.pb_ok,&
this.st_2,&
this.st_1,&
this.dp_fin,&
this.dp_inicio,&
this.gb_2,&
this.gb_1}
end on

on w_buscar_ficha_crematorio.destroy
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_buscar_prelacion)
destroy(this.rb_buscar_fallecido)
destroy(this.rb_buscar_titular)
destroy(this.em_ap_pat_prelacion)
destroy(this.em_nom_prelacion)
destroy(this.em_rut_prelacion)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.em_rut_fallecido)
destroy(this.em_nom_fallecido)
destroy(this.em_ap_pat_fallecido)
destroy(this.em_ap_pat_titular)
destroy(this.em_nom_titular)
destroy(this.em_rut_titular)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dp_fin)
destroy(this.dp_inicio)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;dw_lista.settransobject(sqlca)

gf_centrar(w_buscar_ficha_crematorio)
dp_inicio.value					= datetime(relativedate(date(gdt_fec_sistema),-30))
rb_buscar_titular.checked	= true
rb_buscar_titular.triggerevent(clicked!)
pb_ok.triggerevent(clicked!)
end event

type cb_imprimir from commandbutton within w_buscar_ficha_crematorio
integer x = 2190
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom        	= 52
	f_printdlg(dw_lista,gstr_print,w_consultar_ficha)
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type cb_3 from commandbutton within w_buscar_ficha_crematorio
integer x = 1559
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_buscar_ficha_crematorio
integer x = 1783
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)

end event

type cb_1 from commandbutton within w_buscar_ficha_crematorio
integer x = 1317
integer y = 1876
integer width = 238
integer height = 96
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type rb_buscar_prelacion from radiobutton within w_buscar_ficha_crematorio
integer x = 2121
integer y = 184
integer width = 745
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "buscar por Prelación"
end type

event clicked;em_rut_titular.text						= ''
em_nom_titular.text					= ''
em_ap_pat_titular.text				= ''
em_rut_fallecido.text					= ''
em_nom_fallecido.text				= ''
em_ap_pat_fallecido.text				= ''
em_rut_prelacion.text					= ''
em_nom_prelacion.text				= ''
em_ap_pat_prelacion.text			= ''
em_rut_titular.enabled				= false
em_nom_titular.enabled				= false
em_ap_pat_titular.enabled			= false
em_rut_fallecido.enabled			= false
em_nom_fallecido.enabled			= false
em_ap_pat_fallecido.enabled		= false
em_rut_prelacion.enabled			= false
em_nom_prelacion.enabled			= false
em_ap_pat_prelacion.enabled		= false
if rb_buscar_titular.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio'
	dw_lista.settransobject(sqlca)
	em_rut_titular.enabled			= true
	em_nom_titular.enabled			= true
	em_ap_pat_titular.enabled		= true
	em_rut_titular.setfocus()
elseif rb_buscar_fallecido.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_fall'
	dw_lista.settransobject(sqlca)
	em_rut_fallecido.enabled		= true
	em_nom_fallecido.enabled		= true
	em_ap_pat_fallecido.enabled	= true
	em_rut_fallecido.setfocus()
elseif rb_buscar_prelacion.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_pre'
	dw_lista.settransobject(sqlca)
	em_rut_prelacion.enabled		= true
	em_nom_prelacion.enabled		= true
	em_ap_pat_prelacion.enabled	= true
	em_rut_prelacion.setfocus()
end if
end event

type rb_buscar_fallecido from radiobutton within w_buscar_ficha_crematorio
integer x = 1088
integer y = 184
integer width = 745
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Fallecido"
end type

event clicked;em_rut_titular.text						= ''
em_nom_titular.text					= ''
em_ap_pat_titular.text				= ''
em_rut_fallecido.text					= ''
em_nom_fallecido.text				= ''
em_ap_pat_fallecido.text				= ''
em_rut_prelacion.text					= ''
em_nom_prelacion.text				= ''
em_ap_pat_prelacion.text			= ''
em_rut_titular.enabled				= false
em_nom_titular.enabled				= false
em_ap_pat_titular.enabled			= false
em_rut_fallecido.enabled			= false
em_nom_fallecido.enabled			= false
em_ap_pat_fallecido.enabled		= false
em_rut_prelacion.enabled			= false
em_nom_prelacion.enabled			= false
em_ap_pat_prelacion.enabled		= false
if rb_buscar_titular.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio'
	dw_lista.settransobject(sqlca)
	em_rut_titular.enabled			= true
	em_nom_titular.enabled			= true
	em_ap_pat_titular.enabled		= true
	em_rut_titular.setfocus()
elseif rb_buscar_fallecido.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_fall'
	dw_lista.settransobject(sqlca)
	em_rut_fallecido.enabled		= true
	em_nom_fallecido.enabled		= true
	em_ap_pat_fallecido.enabled	= true
	em_rut_fallecido.setfocus()
elseif rb_buscar_prelacion.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_pre'
	dw_lista.settransobject(sqlca)
	em_rut_prelacion.enabled		= true
	em_nom_prelacion.enabled		= true
	em_ap_pat_prelacion.enabled	= true
	em_rut_prelacion.setfocus()
end if
end event

type rb_buscar_titular from radiobutton within w_buscar_ficha_crematorio
integer x = 69
integer y = 184
integer width = 745
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Titular"
boolean checked = true
end type

event clicked;em_rut_titular.text						= ''
em_nom_titular.text					= ''
em_ap_pat_titular.text				= ''
em_rut_fallecido.text					= ''
em_nom_fallecido.text				= ''
em_ap_pat_fallecido.text				= ''
em_rut_prelacion.text					= ''
em_nom_prelacion.text				= ''
em_ap_pat_prelacion.text			= ''
em_rut_titular.enabled				= false
em_nom_titular.enabled				= false
em_ap_pat_titular.enabled			= false
em_rut_fallecido.enabled			= false
em_nom_fallecido.enabled			= false
em_ap_pat_fallecido.enabled		= false
em_rut_prelacion.enabled			= false
em_nom_prelacion.enabled			= false
em_ap_pat_prelacion.enabled		= false
if rb_buscar_titular.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio'
	dw_lista.settransobject(sqlca)
	em_rut_titular.enabled			= true
	em_nom_titular.enabled			= true
	em_ap_pat_titular.enabled		= true
	em_rut_titular.setfocus()
elseif rb_buscar_fallecido.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_fall'
	dw_lista.settransobject(sqlca)
	em_rut_fallecido.enabled		= true
	em_nom_fallecido.enabled		= true
	em_ap_pat_fallecido.enabled	= true
	em_rut_fallecido.setfocus()
elseif rb_buscar_prelacion.checked = true then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_pre'
	dw_lista.settransobject(sqlca)
	em_rut_prelacion.enabled		= true
	em_nom_prelacion.enabled		= true
	em_ap_pat_prelacion.enabled	= true
	em_rut_prelacion.setfocus()
end if
end event

type em_ap_pat_prelacion from editmask within w_buscar_ficha_crematorio
integer x = 2395
integer y = 452
integer width = 672
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_nom_prelacion from editmask within w_buscar_ficha_crematorio
integer x = 2395
integer y = 360
integer width = 672
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_rut_prelacion from editmask within w_buscar_ficha_crematorio
integer x = 2395
integer y = 268
integer width = 453
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#################"
end type

type st_11 from statictext within w_buscar_ficha_crematorio
integer x = 2080
integer y = 464
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_buscar_ficha_crematorio
integer x = 2080
integer y = 372
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_buscar_ficha_crematorio
integer x = 2080
integer y = 280
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_buscar_ficha_crematorio
integer x = 1047
integer y = 280
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_buscar_ficha_crematorio
integer x = 1047
integer y = 372
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_buscar_ficha_crematorio
integer x = 1047
integer y = 464
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_rut_fallecido from editmask within w_buscar_ficha_crematorio
integer x = 1349
integer y = 268
integer width = 453
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#################"
end type

type em_nom_fallecido from editmask within w_buscar_ficha_crematorio
integer x = 1349
integer y = 360
integer width = 672
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_ap_pat_fallecido from editmask within w_buscar_ficha_crematorio
integer x = 1349
integer y = 452
integer width = 672
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_ap_pat_titular from editmask within w_buscar_ficha_crematorio
integer x = 338
integer y = 452
integer width = 667
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_nom_titular from editmask within w_buscar_ficha_crematorio
integer x = 338
integer y = 360
integer width = 672
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_rut_titular from editmask within w_buscar_ficha_crematorio
integer x = 338
integer y = 268
integer width = 453
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#################"
end type

type st_5 from statictext within w_buscar_ficha_crematorio
integer x = 27
integer y = 464
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_buscar_ficha_crematorio
integer x = 27
integer y = 372
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_buscar_ficha_crematorio
integer x = 27
integer y = 280
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_buscar_ficha_crematorio
integer x = 18
integer y = 1876
integer width = 343
integer height = 104
integer taborder = 170
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila,ll_folio_fc
String		ls_tipo_origen

if (isvalid(w_ficha_crematorio) or isvalid(w_ficha_crematorio_sin_venta)) and dw_lista.rowcount() > 0  then
	ll_fila				= dw_lista.getrow()
	ll_folio_fc		= dw_lista.getitemnumber(ll_fila,'folio_crematorio')
	ls_tipo_origen	= dw_lista.getitemstring(ll_fila,'tipo_origen')
	if ll_folio_fc > 0 and not isnull(ls_tipo_origen) then
//		w_ficha_crematorio.cb_limpiar.triggerevent(clicked!)
		if isvalid(w_ficha_crematorio) then
			if ls_tipo_origen='CV' then
				w_ficha_crematorio.ddplb_tipo_venta.text	= 'CV - Con Venta'
			elseif ls_tipo_origen='SV' then
				w_ficha_crematorio.ddplb_tipo_venta.text	= 'SV - Sin Venta'
			end if
			w_ficha_crematorio.ddplb_tipo_venta.triggerevent(selectionchanged!)
			w_ficha_crematorio.rb_buscar_folio.checked	= true	
			w_ficha_crematorio.rb_buscar_folio.triggerevent(clicked!)
			w_ficha_crematorio.em_folio.text					= string(ll_folio_fc)
			w_ficha_crematorio.em_folio.triggerevent(modified!)
		end if
		close(w_buscar_ficha_crematorio)
	end if
else
	messagebox("Advertencia","No Hay Ficha a Seleccionar")
end if
end event

type dw_lista from datawindow within w_buscar_ficha_crematorio
integer x = 18
integer y = 572
integer width = 3282
integer height = 1252
integer taborder = 160
string title = "none"
string dataobject = "dw_fc_buscar_ficha_crematorio_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event doubleclicked;if row > 0 then cb_aceptar.triggerevent(clicked!)
	
end event

type cb_cerrar from commandbutton within w_buscar_ficha_crematorio
integer x = 2953
integer y = 1876
integer width = 343
integer height = 104
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_ficha_crematorio)
end event

type pb_ok from picturebutton within w_buscar_ficha_crematorio
integer x = 3131
integer y = 36
integer width = 155
integer height = 128
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime		ldt_fec_ini,ldt_fec_fin
Double		ll_rut
String			ls_nombre,ls_ap_pat

ldt_fec_ini		= datetime(date(dp_inicio.text),time('00:00:00'))
ldt_fec_fin		= datetime(date(dp_fin.text),time('23:59:59'))
if rb_buscar_titular.checked = true then
	ll_rut			= Double(em_rut_titular.text)
	ls_nombre	= trim(em_nom_titular.text)
	ls_ap_pat	= trim(em_ap_pat_titular.text)
elseif rb_buscar_fallecido.checked = true then
	ll_rut			= Double(em_rut_fallecido.text)
	ls_nombre	= trim(em_nom_fallecido.text)
	ls_ap_pat	= trim(em_ap_pat_fallecido.text)
elseif rb_buscar_prelacion.checked = true then
	ll_rut			= Double(em_rut_prelacion.text)
	ls_nombre	= trim(em_nom_prelacion.text)
	ls_ap_pat	= trim(em_ap_pat_prelacion.text)
end if
if ll_rut=0 and ls_nombre='' and ls_ap_pat='' then
	dw_lista.dataobject				= 'dw_fc_buscar_ficha_crematorio_todo'
	dw_lista.settransobject(sqlca)
end if
if not isnull(ls_nombre) and ls_nombre<>'' and ls_nombre <> '-' and len(ls_nombre) > 1 then
	ls_nombre	= ls_nombre + '%'
end if
if not isnull(ls_ap_pat) and ls_ap_pat<>'' and ls_ap_pat <> '-' and len(ls_ap_pat) > 1 then
	ls_ap_pat	= ls_ap_pat + '%'
end if
if ldt_fec_ini > ldt_fec_fin then
	messagebox("Advertencia","Fecha Inicio NO debe ser Mayor a fecha Termino")
	dp_fin.setfocus()
elseif isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicio")
	dp_inicio.setfocus()
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Termino")
	dp_fin.setfocus()
else
	if isvalid(w_ficha_crematorio) then
		is_tipo_venta		= mid(w_ficha_crematorio.ddplb_tipo_venta.text,1,2)
		dw_lista.getchild('tipo_solicitud_origen',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_tipo_venta)=0 then idw_detalle2.insertrow(0)
	
		dw_lista.getchild('forma_venta',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(is_tipo_venta)=0 then idw_detalle3.insertrow(0)
	end if
	if dw_lista.dataobject	= 'dw_fc_buscar_ficha_crematorio_todo' then
		if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)=0 then
			messagebox("Advertencia","No Registra Información")
		end if
	else
		if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,ll_rut,ls_nombre,ls_ap_pat)=0 then
			messagebox("Advertencia","Filtro Señalado No Registra Información")
		end if
	end if
end if
end event

type st_2 from statictext within w_buscar_ficha_crematorio
integer x = 891
integer y = 64
integer width = 155
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_buscar_ficha_crematorio
integer x = 55
integer y = 68
integer width = 325
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type dp_fin from datepicker within w_buscar_ficha_crematorio
integer x = 1074
integer y = 48
integer width = 448
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-05-24"), Time("20:55:40.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_inicio from datepicker within w_buscar_ficha_crematorio
integer x = 425
integer y = 48
integer width = 448
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-05-24"), Time("20:55:40.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type gb_2 from groupbox within w_buscar_ficha_crematorio
integer x = 27
integer width = 3049
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_buscar_ficha_crematorio
integer x = 1289
integer y = 1824
integer width = 1147
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

