forward
global type w_analisis_cuponera from window
end type
type cb_ctacte from commandbutton within w_analisis_cuponera
end type
type st_16 from statictext within w_analisis_cuponera
end type
type dw_parque from datawindow within w_analisis_cuponera
end type
type cb_buscar_formula from commandbutton within w_analisis_cuponera
end type
type hpb_1 from hprogressbar within w_analisis_cuponera
end type
type st_porc from statictext within w_analisis_cuponera
end type
type st_registro from statictext within w_analisis_cuponera
end type
type st_nro_registros from statictext within w_analisis_cuponera
end type
type st_60textdias from statictext within w_analisis_cuponera
end type
type st_60dias from statictext within w_analisis_cuponera
end type
type dwe_archivo_cuponera from datawindow within w_analisis_cuponera
end type
type cb_crear_cupones from commandbutton within w_analisis_cuponera
end type
type cb_exportar from commandbutton within w_analisis_cuponera
end type
type cb_2 from commandbutton within w_analisis_cuponera
end type
type cb_3 from commandbutton within w_analisis_cuponera
end type
type cb_4 from commandbutton within w_analisis_cuponera
end type
type st_azul from statictext within w_analisis_cuponera
end type
type st_desmarcar from statictext within w_analisis_cuponera
end type
type st_negro from statictext within w_analisis_cuponera
end type
type st_todos from statictext within w_analisis_cuponera
end type
type st_6 from statictext within w_analisis_cuponera
end type
type st_5 from statictext within w_analisis_cuponera
end type
type st_4 from statictext within w_analisis_cuponera
end type
type st_3 from statictext within w_analisis_cuponera
end type
type st_2 from statictext within w_analisis_cuponera
end type
type st_1 from statictext within w_analisis_cuponera
end type
type cb_1 from commandbutton within w_analisis_cuponera
end type
type gb_1 from groupbox within w_analisis_cuponera
end type
type st_fondo from statictext within w_analisis_cuponera
end type
type dw_detalle_ingreso from datawindow within w_analisis_cuponera
end type
type cb_procesar from commandbutton within w_analisis_cuponera
end type
type gb_2 from groupbox within w_analisis_cuponera
end type
end forward

global type w_analisis_cuponera from window
integer width = 3365
integer height = 1964
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
cb_ctacte cb_ctacte
st_16 st_16
dw_parque dw_parque
cb_buscar_formula cb_buscar_formula
hpb_1 hpb_1
st_porc st_porc
st_registro st_registro
st_nro_registros st_nro_registros
st_60textdias st_60textdias
st_60dias st_60dias
dwe_archivo_cuponera dwe_archivo_cuponera
cb_crear_cupones cb_crear_cupones
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_azul st_azul
st_desmarcar st_desmarcar
st_negro st_negro
st_todos st_todos
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
st_fondo st_fondo
dw_detalle_ingreso dw_detalle_ingreso
cb_procesar cb_procesar
gb_2 gb_2
end type
global w_analisis_cuponera w_analisis_cuponera

type variables
long		il_filas, il_row
Datetime	idt_fecha_hoy

end variables

event open;Long	ll_parque

gf_centrar(w_analisis_cuponera)
idt_fecha_hoy	= datetime(today(),time('00:00:00'))
gs_ventana		= 'w_analisis_cuponera'
f_valida_objeto()
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_parque.accepttext()
dwe_archivo_cuponera.settransobject(sqlca)
dw_detalle_ingreso.dataobject = 'dw_detalle_cupones'
dw_detalle_ingreso.settransobject(sqlca)
if gl_analisis	= 1 then //promesas
	THIS.title	= 'Analisis Cuponeras de PROMESAS'
	dw_detalle_ingreso.object.t_titulo.text = 'Analisis Cuponeras de PROMESAS'
elseif gl_analisis	= 2 then //Pagare
	THIS.title	= 'Analisis Cuponeras de PAGARE'
	dw_detalle_ingreso.object.t_titulo.text = 'Analisis Cuponeras de PAGARE'
elseif gl_analisis	= 3 then //Liberador
	THIS.title	= 'Analisis Cuponeras de LIBERADORES'
	dw_detalle_ingreso.object.t_titulo.text = 'Analisis Cuponeras de LIBERADORES'
elseif gl_analisis	= 4 then //Derecho
	THIS.title	= 'Analisis Cuponeras de DERECHO ESPECIAL'
	dw_detalle_ingreso.object.t_titulo.text = 'Analisis Cuponeras de DERECHO ESPECIAL'
elseif gl_analisis	= 5 then //Aumento Capacidad
	THIS.title	= 'Analisis Cuponeras de AUMENTO CAPACIDAD'
	dw_detalle_ingreso.object.t_titulo.text = 'Analisis Cuponeras de AUMENTO CAPACIDAD'
end if
dw_parque.setfocus()
end event

on w_analisis_cuponera.create
this.cb_ctacte=create cb_ctacte
this.st_16=create st_16
this.dw_parque=create dw_parque
this.cb_buscar_formula=create cb_buscar_formula
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_registro=create st_registro
this.st_nro_registros=create st_nro_registros
this.st_60textdias=create st_60textdias
this.st_60dias=create st_60dias
this.dwe_archivo_cuponera=create dwe_archivo_cuponera
this.cb_crear_cupones=create cb_crear_cupones
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_azul=create st_azul
this.st_desmarcar=create st_desmarcar
this.st_negro=create st_negro
this.st_todos=create st_todos
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.st_fondo=create st_fondo
this.dw_detalle_ingreso=create dw_detalle_ingreso
this.cb_procesar=create cb_procesar
this.gb_2=create gb_2
this.Control[]={this.cb_ctacte,&
this.st_16,&
this.dw_parque,&
this.cb_buscar_formula,&
this.hpb_1,&
this.st_porc,&
this.st_registro,&
this.st_nro_registros,&
this.st_60textdias,&
this.st_60dias,&
this.dwe_archivo_cuponera,&
this.cb_crear_cupones,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.st_azul,&
this.st_desmarcar,&
this.st_negro,&
this.st_todos,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.gb_1,&
this.st_fondo,&
this.dw_detalle_ingreso,&
this.cb_procesar,&
this.gb_2}
end on

on w_analisis_cuponera.destroy
destroy(this.cb_ctacte)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.cb_buscar_formula)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_registro)
destroy(this.st_nro_registros)
destroy(this.st_60textdias)
destroy(this.st_60dias)
destroy(this.dwe_archivo_cuponera)
destroy(this.cb_crear_cupones)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_azul)
destroy(this.st_desmarcar)
destroy(this.st_negro)
destroy(this.st_todos)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.st_fondo)
destroy(this.dw_detalle_ingreso)
destroy(this.cb_procesar)
destroy(this.gb_2)
end on

type cb_ctacte from commandbutton within w_analisis_cuponera
event ue_mousemove pbm_mousemove
integer x = 1321
integer y = 1732
integer width = 416
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if il_row>0 and dw_detalle_ingreso.rowcount()>0 then
	gi_numero 	= dw_detalle_ingreso.getitemnumber(il_row,'numero')
	gs_base		= dw_detalle_ingreso.getitemstring(il_row,'base')
	gs_serie		= dw_detalle_ingreso.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type st_16 from statictext within w_analisis_cuponera
integer x = 37
integer y = 48
integer width = 210
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_analisis_cuponera
integer x = 261
integer y = 32
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_detalle_ingreso.reset()

end event

type cb_buscar_formula from commandbutton within w_analisis_cuponera
integer x = 727
integer y = 1732
integer width = 590
integer height = 100
integer taborder = 50
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

type hpb_1 from hprogressbar within w_analisis_cuponera
boolean visible = false
integer x = 983
integer y = 968
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
integer setstep = 1
end type

type st_porc from statictext within w_analisis_cuponera
boolean visible = false
integer x = 1015
integer y = 892
integer width = 311
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_registro from statictext within w_analisis_cuponera
boolean visible = false
integer x = 1522
integer y = 892
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
string text = "Registro"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nro_registros from statictext within w_analisis_cuponera
boolean visible = false
integer x = 1751
integer y = 892
integer width = 603
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
alignment alignment = center!
boolean focusrectangle = false
end type

type st_60textdias from statictext within w_analisis_cuponera
integer x = 2167
integer y = 1592
integer width = 1083
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Contratos con Cupones por Vencer en 60 días"
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus

SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 3 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type st_60dias from statictext within w_analisis_cuponera
integer x = 2048
integer y = 1588
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 26711808
string text = "3"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus

SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 3 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type dwe_archivo_cuponera from datawindow within w_analisis_cuponera
boolean visible = false
integer x = 2542
integer y = 2008
integer width = 347
integer height = 152
string title = "none"
string dataobject = "dwe_archivo_etiqueta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_crear_cupones from commandbutton within w_analisis_cuponera
integer x = 46
integer y = 1732
integer width = 677
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Genera Cupones y Etiquetas"
end type

event clicked;long		ll_indi, ll_estado, ll_new
Double	ll_numero
String		ls_base, ls_serie
dwe_archivo_cuponera.dataobject	= 'dwe_archivo_cuponera'
dwe_archivo_cuponera.settransobject(sqlca)
dwe_archivo_cuponera.reset()
il_filas	= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	for ll_indi = 1 to il_filas
		ll_estado	= dw_detalle_ingreso.getitemnumber(ll_indi,'linea_estado')
		if ll_estado = 0 then 
			ls_base		= dw_detalle_ingreso.getitemstring(ll_indi,'base')
			ls_serie		= dw_detalle_ingreso.getitemstring(ll_indi,'serie')
			ll_numero	= dw_detalle_ingreso.getitemnumber(ll_indi,'numero')
			ll_new		= dwe_archivo_cuponera.insertrow(0)
			dwe_archivo_cuponera.setitem(ll_new,'base',ls_base)
			dwe_archivo_cuponera.setitem(ll_new,'serie',ls_serie)
			dwe_archivo_cuponera.setitem(ll_new,'numero',ll_numero)
		end if
	next
end if
if dwe_archivo_cuponera.rowcount() > 0 then
	f_DWToExcel(dwe_archivo_cuponera)
else
	messagebox("Advertencia","Ud. debe seleccionar al menos un Contrato")
end if
end event

type cb_exportar from commandbutton within w_analisis_cuponera
integer x = 1893
integer y = 1740
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_detalle_ingreso.rowcount() > 0 then
	f_DWToExcel(dw_detalle_ingreso)
end if
end event

type cb_2 from commandbutton within w_analisis_cuponera
integer x = 2139
integer y = 1740
integer width = 242
integer height = 84
integer taborder = 80
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
dw_detalle_ingreso.SETSORT(NULO)
dw_detalle_ingreso.SORT()

end event

type cb_3 from commandbutton within w_analisis_cuponera
integer x = 2386
integer y = 1740
integer width = 206
integer height = 84
integer taborder = 90
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
dw_detalle_ingreso.SETfilter(gs_formula)
dw_detalle_ingreso.filter()
il_filas		= dw_detalle_ingreso.rowcount()
gs_formula 	= dw_detalle_ingreso.describe("datawindow.syntax")
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

type cb_4 from commandbutton within w_analisis_cuponera
integer x = 2597
integer y = 1740
integer width = 229
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle_ingreso.rowcount() > 0 then 
	dw_detalle_ingreso.object.datawindow.print.Preview = true
	f_Print( dw_detalle_ingreso )
	dw_detalle_ingreso.object.datawindow.print.Preview = false	
end if
end event

type st_azul from statictext within w_analisis_cuponera
integer x = 1179
integer y = 1592
integer width = 795
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Desmarcar Todos"
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type st_desmarcar from statictext within w_analisis_cuponera
integer x = 1056
integer y = 1588
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 15780518
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type st_negro from statictext within w_analisis_cuponera
integer x = 210
integer y = 1588
integer width = 795
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Marcar Todos"
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type st_todos from statictext within w_analisis_cuponera
integer x = 87
integer y = 1588
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 0
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type st_6 from statictext within w_analisis_cuponera
integer x = 1056
integer y = 1500
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 21004543
string text = "2"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus
SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 2 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type st_5 from statictext within w_analisis_cuponera
integer x = 2048
integer y = 1500
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "1"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus

SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 1 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type st_4 from statictext within w_analisis_cuponera
integer x = 87
integer y = 1500
integer width = 96
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type st_3 from statictext within w_analisis_cuponera
integer x = 1179
integer y = 1504
integer width = 795
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Contratos con Cupones Vencidos"
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus
SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 2 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type st_2 from statictext within w_analisis_cuponera
integer x = 2167
integer y = 1504
integer width = 1083
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Contratos con Cupones por Vencer en 30 días"
boolean focusrectangle = false
end type

event clicked;long		ll_indi, ll_estado, ll_tot_porc=0, ll_tot_porc_aux, ll_estatus

SetPointer(HourGlass!)
st_fondo.visible					= true
hpb_1.visible 						= true
st_porc.visible 					= true
st_nro_registros.visible		= true
st_registro.visible				= true
il_filas								= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position					= ll_tot_porc
	for ll_indi = 1 to il_filas
		ll_estado					= dw_detalle_ingreso.getitemnumber(ll_indi,'estado')
		if ll_estado = 1 then
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		else
			dw_detalle_ingreso.setitem(ll_indi,'linea_estado',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text			= string(ll_tot_porc)+" %"
			ll_tot_porc_aux		= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible					= false
hpb_1.visible 						= false
st_porc.visible 					= false
st_nro_registros.visible		= false
st_registro.visible				= false
end event

type st_1 from statictext within w_analisis_cuponera
integer x = 210
integer y = 1500
integer width = 795
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Contratos con Cupones Vigentes"
boolean focusrectangle = false
end type

event clicked;long	ll_indi, ll_tot_porc=0, ll_tot_porc_aux
SetPointer(HourGlass!)
st_fondo.visible				= true
hpb_1.visible 					= true
st_porc.visible 				= true
st_nro_registros.visible	= true
st_registro.visible			= true
il_filas							= dw_detalle_ingreso.rowcount()
if il_filas > 0 then
	hpb_1.Position		= ll_tot_porc
	for ll_indi = 1 to il_filas
		dw_detalle_ingreso.setitem(ll_indi,'linea_estado',0)
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc					= (ll_indi * 100) / il_filas //100 - (il_filas / ll_indi)
		hpb_1.Position 			= ll_tot_porc
		st_nro_registros.text	= string(ll_indi)+" de "+string(il_filas)
	next
end if
SetPointer(Arrow!)
st_fondo.visible				= false
hpb_1.visible 					= false
st_porc.visible 				= false
st_nro_registros.visible	= false
st_registro.visible			= false
end event

type cb_1 from commandbutton within w_analisis_cuponera
integer x = 3013
integer y = 1732
integer width = 283
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_analisis_cuponera)

end event

type gb_1 from groupbox within w_analisis_cuponera
integer x = 46
integer y = 1428
integer width = 3250
integer height = 260
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Estado Cupones"
end type

type st_fondo from statictext within w_analisis_cuponera
boolean visible = false
integer x = 951
integer y = 864
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_detalle_ingreso from datawindow within w_analisis_cuponera
integer x = 46
integer y = 152
integer width = 3246
integer height = 1260
integer taborder = 20
string dataobject = "dw_detalle_cupones"
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

event doubleclicked;string		ls_base2, ls_serie2, ls_string
Double	ll_numero2
if this.getrow() > 0 then
	ls_base2		= this.getitemstring(il_row,'base')
	ls_serie2	= this.getitemstring(il_row,'serie')
	ll_numero2	= this.getitemnumber(il_row,'numero')
	if ls_base2 <> '' and ls_serie2 <> '' and ll_numero2 > 0 then
		ls_string	= ls_base2+ls_serie2+string(ll_numero2)
		OpenWithParm(w_detalle_contratos, ls_string)
	end if
end if
end event

type cb_procesar from commandbutton within w_analisis_cuponera
integer x = 901
integer y = 28
integer width = 334
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;string	ls_base
Long		ll_parque,ll_indi,ll_mes,ll_year
String	ls_fecha_ini,ls_fecha_fin
Datetime	ld_fec_ini60,ld_fec_fin60,ld_fec_ini30,ld_fec_fin30,ldt_fecha_cupon
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

dw_parque.accepttext()
ll_parque	= dw_parque.getitemnumber(1,'cod_parque')
if ll_parque=0 or isnull(ll_parque) then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
else
	SetPointer(HourGlass!)
	dw_detalle_ingreso.reset()
	DELETE FROM "ESTADISTICA_CUPON"  
	WHERE     ( "ESTADISTICA_CUPON"."USUARIO" = :gs_user ) AND 
				 ( "ESTADISTICA_CUPON"."COD_PARQUE" = :ll_parque );
	COMMIT;
	
	if gl_analisis	= 1 then //promesas
		ls_base	= 'O'
	elseif gl_analisis	= 2 then //Pagare
		ls_base	= 'P'
	elseif gl_analisis	= 3 then //Liberador
		ls_base	= 'L'
	elseif gl_analisis	= 4 then //Derecho
		ls_base	= 'D'
	elseif gl_analisis	= 5 then //Aumento
		ls_base	= 'A'
	end if
	DECLARE dept_proc PROCEDURE FOR sp_control_cuponera(:ls_base, :gs_user, :ll_parque);
	EXECUTE dept_proc;
	
	DELETE FROM "ESTADISTICA_CUPON"  
	WHERE ( "ESTADISTICA_CUPON"."USUARIO" = :gs_user ) AND  
			( "ESTADISTICA_CUPON"."DEL_TOTAL_CUOTA" <= 0 ) AND
			( "ESTADISTICA_CUPON"."COD_PARQUE" = :ll_parque );
	COMMIT;
	
	il_filas	= dw_detalle_ingreso.retrieve(gs_user, ll_parque)
	if il_filas = 0 then 
		messagebox("Advertencia","No registra datos")
	else
		ll_mes								= month(date(idt_fecha_hoy))
		ll_year								= year(date(idt_fecha_hoy))
		ll_mes 								= ll_mes + 2
		if ll_mes > 12 then 
			ll_mes							= 1
			ll_year ++
		end if
		ls_fecha_ini						= '01/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		if ll_mes=1 or ll_mes=3 or ll_mes=5 or ll_mes=7 or ll_mes=8 or ll_mes=10 or ll_mes=12 then
			ls_fecha_fin					= '31/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		elseif ll_mes=2 then	
			if (ll_year / 4) = int(ll_year / 4) then
				ls_fecha_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
			else
				ls_fecha_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
			end if
		elseif ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11 then
			ls_fecha_fin					= '30/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		end if
		ld_fec_ini60						= datetime(date(ls_fecha_ini),lt_ini)
		ld_fec_fin60						= datetime(date(ls_fecha_fin),lt_fin)
		
		ll_mes								= month(date(idt_fecha_hoy))
		ll_year								= year(date(idt_fecha_hoy))
		ll_mes ++
		if ll_mes > 12 then 
			ll_mes							= 1
			ll_year ++
		end if
		ls_fecha_ini						= '01/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		if ll_mes=1 or ll_mes=3 or ll_mes=5 or ll_mes=7 or ll_mes=8 or ll_mes=10 or ll_mes=12 then
			ls_fecha_fin					= '31/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		elseif ll_mes=2 then	
			if (ll_year / 4) = int(ll_year / 4) then
				ls_fecha_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
			else
				ls_fecha_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
			end if
		elseif ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11 then
			ls_fecha_fin					= '30/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
		end if
		ld_fec_ini30						= datetime(date(ls_fecha_ini),lt_ini)
		ld_fec_fin30						= datetime(date(ls_fecha_fin),lt_fin)
		for ll_indi=1 to il_filas
			ldt_fecha_cupon				= dw_detalle_ingreso.getitemdatetime(ll_indi,'fecha_cupon')
			if ldt_fecha_cupon>=ld_fec_ini30 and ldt_fecha_cupon<=ld_fec_fin30 then
				dw_detalle_ingreso.setitem(ll_indi,'estado',1)
			elseif ldt_fecha_cupon>=ld_fec_ini60 and ldt_fecha_cupon<=ld_fec_fin60 then
				dw_detalle_ingreso.setitem(ll_indi,'estado',3)
			elseif ldt_fecha_cupon< idt_fecha_hoy then
				dw_detalle_ingreso.setitem(ll_indi,'estado',2)
			else
				dw_detalle_ingreso.setitem(ll_indi,'estado',0)
			end if			
		next
		dw_detalle_ingreso.accepttext()
		st_desmarcar.triggerevent(clicked!)
	end if
	SetPointer(Arrow!)
end if
end event

type gb_2 from groupbox within w_analisis_cuponera
integer x = 1870
integer y = 1692
integer width = 983
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

