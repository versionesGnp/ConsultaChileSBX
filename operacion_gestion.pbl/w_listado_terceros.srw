forward
global type w_listado_terceros from window
end type
type cb_cta_corriente from commandbutton within w_listado_terceros
end type
type cb_filtrar from commandbutton within w_listado_terceros
end type
type cb_ordenar from commandbutton within w_listado_terceros
end type
type cb_exportar from commandbutton within w_listado_terceros
end type
type cb_limpiar from commandbutton within w_listado_terceros
end type
type cb_imprimir from commandbutton within w_listado_terceros
end type
type cb_cerrar from commandbutton within w_listado_terceros
end type
type pb_aceptar from picturebutton within w_listado_terceros
end type
type st_hasta from statictext within w_listado_terceros
end type
type em_inicio from editmask within w_listado_terceros
end type
type em_termino from editmask within w_listado_terceros
end type
type st_desde from statictext within w_listado_terceros
end type
type p_inicio from picture within w_listado_terceros
end type
type p_termino from picture within w_listado_terceros
end type
type dw_listado_terceros from datawindow within w_listado_terceros
end type
type gb_periodo from groupbox within w_listado_terceros
end type
end forward

global type w_listado_terceros from window
integer width = 4101
integer height = 1820
boolean titlebar = true
string title = "Listado de Clientes Terceros por Periodo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_cta_corriente cb_cta_corriente
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_inicio p_inicio
p_termino p_termino
dw_listado_terceros dw_listado_terceros
gb_periodo gb_periodo
end type
global w_listado_terceros w_listado_terceros

type variables
long	il_row
end variables

on w_listado_terceros.create
this.cb_cta_corriente=create cb_cta_corriente
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_inicio=create p_inicio
this.p_termino=create p_termino
this.dw_listado_terceros=create dw_listado_terceros
this.gb_periodo=create gb_periodo
this.Control[]={this.cb_cta_corriente,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.pb_aceptar,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_inicio,&
this.p_termino,&
this.dw_listado_terceros,&
this.gb_periodo}
end on

on w_listado_terceros.destroy
destroy(this.cb_cta_corriente)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_inicio)
destroy(this.p_termino)
destroy(this.dw_listado_terceros)
destroy(this.gb_periodo)
end on

event open;string		ls_nom_parque,ls_string
long		ll_cod_parque

gf_centrar(w_listado_terceros)

dw_listado_terceros.settransobject(sqlca)

em_inicio.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_termino.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_cta_corriente from commandbutton within w_listado_terceros
integer x = 1742
integer y = 1604
integer width = 416
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;if dw_listado_terceros.rowcount()>0 then
	gs_base		= dw_listado_terceros.getitemstring(il_row,'base')
	gs_serie		= dw_listado_terceros.getitemstring(il_row,'serie')
	gi_numero	= dw_listado_terceros.getitemnumber(il_row,'numero')
	gi_rut			= dw_listado_terceros.getitemnumber(il_row,'rut_titular')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 AND gi_rut > 0 THEN
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
			CASE "D" // Derecho
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato Valido")
	END IF
else
	messagebox("Advertencia","Debe Seleccionar Contrato")
end if
end event

type cb_filtrar from commandbutton within w_listado_terceros
integer x = 46
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_listado_terceros.setfilter(ls_nulo)
dw_listado_terceros.filter()
end event

type cb_ordenar from commandbutton within w_listado_terceros
integer x = 311
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;if dw_listado_terceros.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_listado_terceros.SETSORT(NULO)
	dw_listado_terceros.SORT()
end if
end event

type cb_exportar from commandbutton within w_listado_terceros
integer x = 571
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado_terceros
if dw_listado_terceros.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_limpiar from commandbutton within w_listado_terceros
integer x = 1170
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_listado_terceros.reset()
em_inicio.text				= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_termino.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

end event

type cb_imprimir from commandbutton within w_listado_terceros
integer x = 832
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_listado_terceros.rowcount()>0 then
	dw_listado_terceros.object.datawindow.Print.Preview		= true
	dw_listado_terceros.object.datawindow.zoom				= 80
	f_Print( dw_listado_terceros )
	dw_listado_terceros.object.datawindow.Print.Preview		= false
	dw_listado_terceros.object.datawindow.zoom				= 100
end if
end event

type cb_cerrar from commandbutton within w_listado_terceros
integer x = 3730
integer y = 1588
integer width = 315
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_listado_terceros)
end event

type pb_aceptar from picturebutton within w_listado_terceros
integer x = 1344
integer y = 60
integer width = 142
integer height = 120
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_tipo_cliente,ls_canal
long		ll_tot_reg
date		ldt_fec_ini,ldt_fec_fin

dw_listado_terceros.settransobject(sqlca)

ldt_fec_ini									= date(em_inicio.text) //,time('00:00:00'))
//ldt_fec_fin									= datetime(date(em_termino.text),time('00:00:00'))
ldt_fec_fin									= date(em_termino.text)
if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
	if ldt_fec_ini>ldt_fec_fin then
		messagebox("Advertencia","Rango Fecha Invalido")
	else
		ll_tot_reg					= dw_listado_terceros.retrieve(ldt_fec_ini,ldt_fec_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
end if

end event

type st_hasta from statictext within w_listado_terceros
integer x = 677
integer y = 84
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_listado_terceros
integer x = 238
integer y = 76
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_termino from editmask within w_listado_terceros
integer x = 841
integer y = 76
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_desde from statictext within w_listado_terceros
integer x = 50
integer y = 84
integer width = 187
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type p_inicio from picture within w_listado_terceros
integer x = 585
integer y = 72
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_listado_terceros.reset()
end event

type p_termino from picture within w_listado_terceros
integer x = 1193
integer y = 72
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_listado_terceros.reset()
end event

type dw_listado_terceros from datawindow within w_listado_terceros
integer x = 37
integer y = 196
integer width = 3991
integer height = 1356
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_terceros"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event doubleclicked;if row > 0 then
	il_row	= row
	cb_cta_corriente.triggerevent(clicked!)
end if
end event

type gb_periodo from groupbox within w_listado_terceros
integer x = 37
integer y = 16
integer width = 1266
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

