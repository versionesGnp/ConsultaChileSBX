forward
global type w_ugn_contratos_digitados from window
end type
type cb_ctacte from commandbutton within w_ugn_contratos_digitados
end type
type cb_1 from commandbutton within w_ugn_contratos_digitados
end type
type pb_aceptar from picturebutton within w_ugn_contratos_digitados
end type
type dw_parque from datawindow within w_ugn_contratos_digitados
end type
type st_3 from statictext within w_ugn_contratos_digitados
end type
type em_desde from editmask within w_ugn_contratos_digitados
end type
type p_2 from picture within w_ugn_contratos_digitados
end type
type p_1 from picture within w_ugn_contratos_digitados
end type
type em_final from editmask within w_ugn_contratos_digitados
end type
type st_2 from statictext within w_ugn_contratos_digitados
end type
type st_1 from statictext within w_ugn_contratos_digitados
end type
type dw_listado from datawindow within w_ugn_contratos_digitados
end type
type cb_limpiar from commandbutton within w_ugn_contratos_digitados
end type
type cb_ordenar from commandbutton within w_ugn_contratos_digitados
end type
type cb_exportar from commandbutton within w_ugn_contratos_digitados
end type
type cb_imprimir from commandbutton within w_ugn_contratos_digitados
end type
type cb_filtrar from commandbutton within w_ugn_contratos_digitados
end type
type gb_1 from groupbox within w_ugn_contratos_digitados
end type
end forward

global type w_ugn_contratos_digitados from window
integer width = 3323
integer height = 2048
boolean titlebar = true
string title = "Contratos Digitados UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_1 cb_1
pb_aceptar pb_aceptar
dw_parque dw_parque
st_3 st_3
em_desde em_desde
p_2 p_2
p_1 p_1
em_final em_final
st_2 st_2
st_1 st_1
dw_listado dw_listado
cb_limpiar cb_limpiar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
gb_1 gb_1
end type
global w_ugn_contratos_digitados w_ugn_contratos_digitados

on w_ugn_contratos_digitados.create
this.cb_ctacte=create cb_ctacte
this.cb_1=create cb_1
this.pb_aceptar=create pb_aceptar
this.dw_parque=create dw_parque
this.st_3=create st_3
this.em_desde=create em_desde
this.p_2=create p_2
this.p_1=create p_1
this.em_final=create em_final
this.st_2=create st_2
this.st_1=create st_1
this.dw_listado=create dw_listado
this.cb_limpiar=create cb_limpiar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.cb_1,&
this.pb_aceptar,&
this.dw_parque,&
this.st_3,&
this.em_desde,&
this.p_2,&
this.p_1,&
this.em_final,&
this.st_2,&
this.st_1,&
this.dw_listado,&
this.cb_limpiar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_filtrar,&
this.gb_1}
end on

on w_ugn_contratos_digitados.destroy
destroy(this.cb_ctacte)
destroy(this.cb_1)
destroy(this.pb_aceptar)
destroy(this.dw_parque)
destroy(this.st_3)
destroy(this.em_desde)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_listado)
destroy(this.cb_limpiar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.gb_1)
end on

event open;
gf_centrar(w_ugn_contratos_digitados)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_listado.settransobject(sqlca)
em_desde.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
em_final.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_ctacte from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1792
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Long	ll_fila
if dw_listado.rowcount()>0 then
	ll_fila		= dw_listado.getrow()
	gi_rut		= dw_listado.getitemnumber(ll_fila,'cliente_rut')
	gs_base 		= dw_listado.GetItemString(ll_fila,'cadena_codigo')
	gs_serie 	= dw_listado.GetItemString(ll_fila,'cadena_serie')
	gi_numero 	= dw_listado.GetItemNumber(ll_fila,'cadena_numero')
	if gi_rut > 0 and gi_numero > 0 and not isnull(gs_base) and not isnull(gs_serie) then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

type cb_1 from commandbutton within w_ugn_contratos_digitados
integer x = 2971
integer y = 1792
integer width = 297
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ugn_contratos_digitados)
end event

type pb_aceptar from picturebutton within w_ugn_contratos_digitados
integer x = 2290
integer y = 28
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 		ll_parque,ll_tot_reg,ll_indi,ll_dias
datetime	ldt_fec_ini,ldt_fec_fin
String	ls_string

ll_parque			= dw_parque.getitemnumber(1,'parque')
ldt_fec_ini			= datetime(date(em_desde.text),time('00:00:00'))
ldt_fec_fin			= datetime(date(em_final.text),time('23:59:59'))
if ll_parque > 0 then
	if ldt_fec_ini <= ldt_fec_fin then
		if dw_listado.retrieve(ldt_fec_ini,ldt_fec_fin,ll_parque) >0 then
			ls_string	= 'cadena_cod_parque = '+string(ll_parque)
			dw_listado.setfilter(ls_string)
			dw_listado.filter()
			if dw_listado.rowcount() = 0 then Messagebox("Advertencia","No Registra Dato")	
		else
			Messagebox("Advertencia","No Registra Dato")	
		end if	
	else
	Messagebox("Advertencia","La Fecha de Inicio es Mayor que La Fecha Final")	
	end if
else
	Messagebox("Advertencia","Debe Seleccionar Parque")
end if




end event

type dw_parque from datawindow within w_ugn_contratos_digitados
integer x = 1390
integer y = 44
integer width = 800
integer height = 116
integer taborder = 30
string title = "none"
string dataobject = "dwe_parque_condolencias"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_string

dw_listado.reset()
ls_string			= ''
dw_listado.setfilter(ls_string)
dw_listado.filter()
end event

type st_3 from statictext within w_ugn_contratos_digitados
integer x = 1193
integer y = 68
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_desde from editmask within w_ugn_contratos_digitados
integer x = 201
integer y = 56
integer width = 311
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_listado.reset()
end event

type p_2 from picture within w_ugn_contratos_digitados
integer x = 1083
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_listado.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type p_1 from picture within w_ugn_contratos_digitados
integer x = 521
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_listado.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_final from editmask within w_ugn_contratos_digitados
integer x = 763
integer y = 56
integer width = 311
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_listado.reset()
end event

type st_2 from statictext within w_ugn_contratos_digitados
integer x = 608
integer y = 72
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ugn_contratos_digitados
integer x = 32
integer y = 72
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha:"
boolean focusrectangle = false
end type

type dw_listado from datawindow within w_ugn_contratos_digitados
integer x = 37
integer y = 208
integer width = 3232
integer height = 1528
integer taborder = 50
string title = "none"
string dataobject = "dw_contratos_digitados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna

ls_columna					= dwo.name
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	if ls_columna='t_blanco' or ls_columna='t_texto_blanco' then
		gs_formula			= "oferta_v_tipo_venta='C'"
		dw_listado.SETfilter(gs_formula)
		dw_listado.filter()
		if dw_listado.rowcount() =0 then messagebox("Advertencia","No Registra Venta Origen C - UGN condolencia")
	elseif ls_columna='t_celeste' or ls_columna='t_texto_celeste' then
		gs_formula			= "oferta_v_tipo_venta<>'C'"
		dw_listado.SETfilter(gs_formula)
		dw_listado.filter()
		if dw_listado.rowcount() =0 then messagebox("Advertencia","No Registra Venta Otro Origen")
	elseif ls_columna='t_todo' then
		gs_formula			= ''
		dw_listado.SETfilter(gs_formula)
		dw_listado.filter()
		if dw_listado.rowcount() =0 then messagebox("Advertencia","No Registra Venta")
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_limpiar from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_dwnmousemove
integer x = 1605
integer y = 1792
integer width = 247
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_string

dw_listado.reset()
ls_string			= ''
dw_listado.setfilter(ls_string)
dw_listado.filter()
dw_parque.reset()
dw_parque.insertrow(0)
em_desde.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
em_final.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
em_desde.setfocus()
end event

type cb_ordenar from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_dwnmousemove
integer x = 480
integer y = 1792
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_listado.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.SORT()
end if
end event

type cb_exportar from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_mousemove
integer x = 983
integer y = 1792
integer width = 247
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_mousemove
integer x = 1230
integer y = 1792
integer width = 256
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_listado.rowcount()>0 then
	f_Print( dw_listado )
end if
end event

type cb_filtrar from commandbutton within w_ugn_contratos_digitados
event ue_mousemove pbm_mousemove
integer x = 731
integer y = 1792
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_listado.setfilter(ls_nulo)
dw_listado.filter()
end event

type gb_1 from groupbox within w_ugn_contratos_digitados
event ue_mousemove pbm_mousemove
integer x = 462
integer y = 1744
integer width = 1408
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

