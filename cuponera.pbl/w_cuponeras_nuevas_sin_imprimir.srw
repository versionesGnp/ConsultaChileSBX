forward
global type w_cuponeras_nuevas_sin_imprimir from window
end type
type rb_35 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_34 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_33 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type cb_buscar_formula from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_16 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_15 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_14 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type st_2 from statictext within w_cuponeras_nuevas_sin_imprimir
end type
type st_1 from statictext within w_cuponeras_nuevas_sin_imprimir
end type
type dwe_archivo_cuponera from datawindow within w_cuponeras_nuevas_sin_imprimir
end type
type cb_crear_cupones from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type cb_4 from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type cb_3 from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type cb_2 from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type cb_exportar from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_5 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_4 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_6 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_3 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_2 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type rb_1 from radiobutton within w_cuponeras_nuevas_sin_imprimir
end type
type dw_muestra from datawindow within w_cuponeras_nuevas_sin_imprimir
end type
type cb_1 from commandbutton within w_cuponeras_nuevas_sin_imprimir
end type
type gb_1 from groupbox within w_cuponeras_nuevas_sin_imprimir
end type
end forward

global type w_cuponeras_nuevas_sin_imprimir from window
integer width = 3374
integer height = 1400
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
rb_35 rb_35
rb_34 rb_34
rb_33 rb_33
cb_buscar_formula cb_buscar_formula
rb_16 rb_16
rb_15 rb_15
rb_14 rb_14
st_2 st_2
st_1 st_1
dwe_archivo_cuponera dwe_archivo_cuponera
cb_crear_cupones cb_crear_cupones
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
rb_5 rb_5
rb_4 rb_4
rb_6 rb_6
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_muestra dw_muestra
cb_1 cb_1
gb_1 gb_1
end type
global w_cuponeras_nuevas_sin_imprimir w_cuponeras_nuevas_sin_imprimir

type variables
long	il_filas, il_row
end variables

on w_cuponeras_nuevas_sin_imprimir.create
this.rb_35=create rb_35
this.rb_34=create rb_34
this.rb_33=create rb_33
this.cb_buscar_formula=create cb_buscar_formula
this.rb_16=create rb_16
this.rb_15=create rb_15
this.rb_14=create rb_14
this.st_2=create st_2
this.st_1=create st_1
this.dwe_archivo_cuponera=create dwe_archivo_cuponera
this.cb_crear_cupones=create cb_crear_cupones
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_6=create rb_6
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_muestra=create dw_muestra
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_35,&
this.rb_34,&
this.rb_33,&
this.cb_buscar_formula,&
this.rb_16,&
this.rb_15,&
this.rb_14,&
this.st_2,&
this.st_1,&
this.dwe_archivo_cuponera,&
this.cb_crear_cupones,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.rb_5,&
this.rb_4,&
this.rb_6,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.dw_muestra,&
this.cb_1,&
this.gb_1}
end on

on w_cuponeras_nuevas_sin_imprimir.destroy
destroy(this.rb_35)
destroy(this.rb_34)
destroy(this.rb_33)
destroy(this.cb_buscar_formula)
destroy(this.rb_16)
destroy(this.rb_15)
destroy(this.rb_14)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dwe_archivo_cuponera)
destroy(this.cb_crear_cupones)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_6)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_muestra)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_cuponeras_nuevas_sin_imprimir)
gs_ventana		= 'w_cuponeras_nuevas_sin_imprimir'
f_valida_objeto()
CHOOSE CASE gl_cupones
	CASE 1
		dw_muestra.dataobject 	= 'dw_cuponeras_nuevas_promesas'
		this.title					= 'Promesas Nuevas para emisión de Cuponeras'
		rb_1.checked 				= true
	CASE 2
		dw_muestra.dataobject 	= 'dw_cuponeras_nuevas_liberadores'
		rb_2.checked 				= true
		this.title					= 'Liberadores Nuevos para emisión de Cuponeras'
	CASE 3
		dw_muestra.dataobject 	= 'dw_cuponeras_nuevas_pagare'
		rb_3.checked 				= true
		this.title					= 'Pagaré Nuevas para emisión de Cuponeras'
	CASE 4
		dw_muestra.dataobject 	= 'dw_cuponeras_nuevas_aumento_capacidad'
		rb_33.checked 				= true
		this.title					= 'Aumento Capacidad Nuevas para emisión de Cuponeras'
		
		
	CASE 11
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_promesas'
		rb_4.checked 				= true
		this.title					= 'Promesas Antiguas para emisión de Cuponeras'
	CASE 12
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_liberador'
		rb_5.checked 				= true
		this.title					= 'Liberadores Antiguos para emisión de Cuponeras'
	CASE 13
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_pagare'
		rb_6.checked 				= true
		this.title					= 'Pagaré Antiguos para emisión de Cuponeras'
	CASE 14
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_aumento'
		rb_34.checked 				= true
		this.title					= 'Aumento Capacidad Antiguos para emisión de Cuponeras'
		
		
	CASE 111
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_promesas2'
		rb_14.checked 				= true
		this.title					= 'Promesas con Pie Pagado y sin Facturar para emisión de Cuponeras'
	CASE 112
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_liberador2'
		rb_15.checked 				= true
		this.title					= 'Liberadores con Pie Pagado y sin Facturar para emisión de Cuponeras'
	CASE 113
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_pagare2'
		rb_16.checked 				= true
		this.title					= 'Pagaré con Pie Pagado y sin Facturar para emisión de Cuponeras'
	CASE 114
		dw_muestra.dataobject 	= 'dw_cuponeras_nunca_emitida_aumento2'
		rb_35.checked 				= true
		this.title					= 'Aumento Capacidad con Pie Pagado y sin Facturar para emisión de Cuponeras'
END CHOOSE
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then 
	CHOOSE CASE gl_cupones
		CASE 1,11,111
			messagebox("Advertencia","No registran Promesas")
		CASE 2,12,112
			messagebox("Advertencia","No registran Liberadores")
		CASE 3,13,113
			messagebox("Advertencia","No registran Pagaré")
		CASE 4,14,114
			messagebox("Advertencia","No registran Aumento Capacidad")
	END CHOOSE
	close(w_cuponeras_nuevas_sin_imprimir)
end if

end event

type rb_35 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 1000
integer width = 686
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Aumento Cap.solo con Pie"
end type

event clicked;gl_cupones 					= 114
w_cuponeras_nuevas_sin_imprimir.title = 'Aumento Capacidad con Pie Pagado y sin Facturar para emisión de Cuponeras'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_aumento2'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Aumento Capacidad")

end event

type rb_34 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 664
integer width = 654
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Aumento Cap. Antiguos"
end type

event clicked;gl_cupones 					= 14
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Cuponeras Nunca Emitidas de Aumento Capacidad'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_aumento'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Aumento Capacidad")

end event

type rb_33 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 332
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Aumento Cap. Nuevos"
end type

event clicked;gl_cupones 					= 4
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Nuevas Cuponeras de Aumento Capacidad'
dw_muestra.dataobject	= 'dw_cuponeras_nuevas_aumento_capacidad'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Aumento Capacidad")

end event

type cb_buscar_formula from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 1262
integer y = 1160
integer width = 603
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar / Gra&bar Formula"
end type

event clicked;open(w_formulas)
end event

type rb_16 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 932
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Pagaré solo con Pie"
end type

event clicked;gl_cupones 					= 113
w_cuponeras_nuevas_sin_imprimir.title = 'Pagaré con Pie Pagado y sin Facturar para emisión de Cuponeras'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_pagare2'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Pagaré")

end event

type rb_15 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 864
integer width = 677
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Liberadores solo con Pie"
end type

event clicked;gl_cupones 					= 112
w_cuponeras_nuevas_sin_imprimir.title = 'Liberadores con Pie Pagado y sin Facturar para emisión de Cuponeras'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_liberador2'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Liberadores")

end event

type rb_14 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 796
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Promesas solo con Pie"
end type

event clicked;gl_cupones 					= 111
w_cuponeras_nuevas_sin_imprimir.title = 'Promesas con Pie Pagado y sin Facturar para emisión de Cuponeras'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_promesas2'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Promesa")

end event

type st_2 from statictext within w_cuponeras_nuevas_sin_imprimir
integer x = 1335
integer y = 1016
integer width = 640
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "Desmarcar Todos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
if il_filas > 0 then
	for ll_indi = 1 to il_filas
		dw_muestra.setitem(ll_indi,'linea_estado',1)
	next
end if
SetPointer(Arrow!)

end event

type st_1 from statictext within w_cuponeras_nuevas_sin_imprimir
integer x = 603
integer y = 1016
integer width = 640
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "Marcar Todos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
if il_filas > 0 then
	for ll_indi = 1 to il_filas
		dw_muestra.setitem(ll_indi,'linea_estado',0)
	next
end if
SetPointer(Arrow!)

end event

type dwe_archivo_cuponera from datawindow within w_cuponeras_nuevas_sin_imprimir
boolean visible = false
integer x = 2203
integer y = 1488
integer width = 347
integer height = 152
string title = "none"
string dataobject = "dwe_archivo_etiqueta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_crear_cupones from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 1979
integer y = 1160
integer width = 896
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Genera Archivo Cupones y Etiquetas"
end type

event clicked;long		ll_indi, ll_estado, ll_new
Double	ll_numero
String		ls_base, ls_serie
dwe_archivo_cuponera.dataobject	= 'dwe_archivo_cuponera'
dwe_archivo_cuponera.settransobject(sqlca)
dwe_archivo_cuponera.reset()
if il_filas > 0 then
	for ll_indi = 1 to il_filas
		ll_estado	= dw_muestra.getitemnumber(ll_indi,'linea_estado')
		if ll_estado = 0 then 
			ls_base		= dw_muestra.getitemstring(ll_indi,'cadena_codigo')
			ls_serie		= dw_muestra.getitemstring(ll_indi,'cadena_serie')
			ll_numero	= dw_muestra.getitemnumber(ll_indi,'cadena_numero')
			ll_new		= dwe_archivo_cuponera.insertrow(0)
			dwe_archivo_cuponera.setitem(ll_new,'base',ls_base)
			dwe_archivo_cuponera.setitem(ll_new,'serie',ls_serie)
			dwe_archivo_cuponera.setitem(ll_new,'numero',ll_numero)
		end if
	next
end if
if dwe_archivo_cuponera.rowcount() > 0 then
	f_DWToExcel( dwe_archivo_cuponera)
else
	messagebox("Advertencia","Ud. debe seleccionar al menos un Contrato")
end if
end event

type cb_4 from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 878
integer y = 1160
integer width = 270
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_muestra.rowcount() > 0 then 
	dw_muestra.object.datawindow.print.Preview = true
	f_Print( dw_muestra )
	dw_muestra.object.datawindow.print.Preview = false	
end if
end event

type cb_3 from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 603
integer y = 1160
integer width = 270
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
string ls_texto
setnull (gs_formula)
dw_muestra.SETfilter(gs_formula)
dw_muestra.filter()
il_filas		= dw_muestra.rowcount()
gs_formula 	= dw_muestra.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if
end event

type cb_2 from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 329
integer y = 1160
integer width = 270
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_muestra.SETSORT(NULO)
dw_muestra.SORT()

end event

type cb_exportar from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 55
integer y = 1160
integer width = 270
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_muestra.rowcount() > 0 then
	f_DWToExcel( dw_muestra)
end if
end event

type rb_5 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 528
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Liberadores Antiguos"
end type

event clicked;gl_cupones 					= 12
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Cuponeras Nunca Emitidas de Liberadores'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_liberador'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Liberadores")

end event

type rb_4 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 460
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Promesas Antiguas"
end type

event clicked;gl_cupones 					= 11
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Cuponeras Nunca Emitidas de Promesas'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_promesas'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Promesa")

end event

type rb_6 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 596
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Pagaré Antiguos"
end type

event clicked;gl_cupones 					= 13
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Cuponeras Nunca Emitidas de Pagaré'
dw_muestra.dataobject	= 'dw_cuponeras_nunca_emitida_pagare'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Pagaré")

end event

type rb_3 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 264
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Pagaré Nuevos"
end type

event clicked;gl_cupones 					= 3
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Nuevas Cuponeras de Pagaré'
dw_muestra.dataobject	= 'dw_cuponeras_nuevas_pagare'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Pagaré")

end event

type rb_2 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 196
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Liberadores Nuevos"
end type

event clicked;gl_cupones 					= 2
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Nuevas Cuponeras de Liberadores'
dw_muestra.dataobject	= 'dw_cuponeras_nuevas_liberadores'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Liberadores")

end event

type rb_1 from radiobutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2615
integer y = 128
integer width = 613
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = " Promesas Nuevas"
end type

event clicked;gl_cupones 					= 1
w_cuponeras_nuevas_sin_imprimir.title = 'Emisión Nuevas Cuponeras de Promesas'
dw_muestra.dataobject	= 'dw_cuponeras_nuevas_promesas'
dw_muestra.settransobject(sqlca)
il_filas	= dw_muestra.retrieve()
if il_filas=0 then messagebox("Advertencia","No registra Promesa")

end event

type dw_muestra from datawindow within w_cuponeras_nuevas_sin_imprimir
integer x = 46
integer y = 56
integer width = 2514
integer height = 1044
integer taborder = 10
string dataobject = "dw_cuponeras_nunca_emitida_promesas2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event doubleclicked;string		ls_base2, ls_serie2, ls_string
Double	ll_numero2
if il_row > 0 then
	ls_base2		= this.getitemstring(il_row,'cadena_codigo')
	ls_serie2		= this.getitemstring(il_row,'cadena_serie')
	ll_numero2	= this.getitemnumber(il_row,'cadena_numero')
	if ls_base2 <> '' and ls_serie2 <> '' and ll_numero2 > 0 then
		ls_string	= ls_base2+ls_serie2+string(ll_numero2)
		OpenWithParm(w_detalle_contratos, ls_string)
	end if
end if
end event

type cb_1 from commandbutton within w_cuponeras_nuevas_sin_imprimir
integer x = 2990
integer y = 1160
integer width = 325
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cuponeras_nuevas_sin_imprimir)
end event

type gb_1 from groupbox within w_cuponeras_nuevas_sin_imprimir
integer x = 2587
integer y = 28
integer width = 731
integer height = 1072
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Narrow"
long backcolor = 67108864
string text = "Contratos sin Cuponeras"
end type

