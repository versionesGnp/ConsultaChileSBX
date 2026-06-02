forward
global type w_informe_pagos_no_aceptados from window
end type
type cb_po_rut from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_cta_cte from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_filtrar from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_sort from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_exportar from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_imprimir from commandbutton within w_informe_pagos_no_aceptados
end type
type cb_mostrar from commandbutton within w_informe_pagos_no_aceptados
end type
type pb_ok from picturebutton within w_informe_pagos_no_aceptados
end type
type p_fin from picture within w_informe_pagos_no_aceptados
end type
type em_fec_fin from editmask within w_informe_pagos_no_aceptados
end type
type st_3 from statictext within w_informe_pagos_no_aceptados
end type
type p_ini from picture within w_informe_pagos_no_aceptados
end type
type em_fec_ini from editmask within w_informe_pagos_no_aceptados
end type
type st_2 from statictext within w_informe_pagos_no_aceptados
end type
type cb_cerrar from commandbutton within w_informe_pagos_no_aceptados
end type
type dw_lista from datawindow within w_informe_pagos_no_aceptados
end type
type gb_1 from groupbox within w_informe_pagos_no_aceptados
end type
end forward

global type w_informe_pagos_no_aceptados from window
integer width = 3685
integer height = 1864
boolean titlebar = true
string title = "Pago No Aceptado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_po_rut cb_po_rut
cb_cta_cte cb_cta_cte
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_mostrar cb_mostrar
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_pagos_no_aceptados w_informe_pagos_no_aceptados

type variables
Long	il_row
end variables

on w_informe_pagos_no_aceptados.create
this.cb_po_rut=create cb_po_rut
this.cb_cta_cte=create cb_cta_cte
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_mostrar=create cb_mostrar
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_po_rut,&
this.cb_cta_cte,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_mostrar,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_informe_pagos_no_aceptados.destroy
destroy(this.cb_po_rut)
destroy(this.cb_cta_cte)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_mostrar)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_informe_pagos_no_aceptados)
dw_lista.settransobject(sqlca)
em_fec_ini.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
em_fec_fin.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
dw_lista.Modify ( "DataWindow.header.height=264" )
dw_lista.Modify ( "DataWindow.detail.height=4" )
cb_mostrar.text	= 'Mostrar Detalle'
end event

type cb_po_rut from commandbutton within w_informe_pagos_no_aceptados
integer x = 1079
integer y = 1652
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asociar*Rut"
end type

event clicked;if il_row>0 then
	if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
	gi_rut	= 	dw_lista.getitemnumber(il_row,'rut_cliente')
	gi_tipo_busqueda 	= 1
	open(w_listado_contratos_rut)
else
	messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
end if
end event

type cb_cta_cte from commandbutton within w_informe_pagos_no_aceptados
integer x = 658
integer y = 1652
integer width = 416
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_rut		= 	dw_lista.getitemnumber(il_row,'rut_cliente')
	if gs_base='W' then
		cb_po_rut.triggerevent(clicked!)
	else
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
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
		END CHOOSE
	end if
end if
end event

type cb_filtrar from commandbutton within w_informe_pagos_no_aceptados
integer x = 2533
integer y = 1652
integer width = 224
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_informe_pagos_no_aceptados
integer x = 2304
integer y = 1652
integer width = 224
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_informe_pagos_no_aceptados
integer x = 2075
integer y = 1652
integer width = 224
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_informe_pagos_no_aceptados
integer x = 1824
integer y = 1652
integer width = 224
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_printdlg(dw_lista,gstr_print,w_informe_pagos_no_aceptados)

end event

type cb_mostrar from commandbutton within w_informe_pagos_no_aceptados
integer x = 27
integer y = 1652
integer width = 512
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mostrar Detalle"
end type

event clicked;if cb_mostrar.text = 'Mostrar Detalle' then
	cb_mostrar.text	= 'No Mostrar Detalle'
	dw_lista.Modify ( "DataWindow.header.height=336")
	dw_lista.Modify ( "DataWindow.detail.height=87")
else
	cb_mostrar.text	= 'Mostrar Detalle'
	dw_lista.Modify ( "DataWindow.header.height=264")
	dw_lista.Modify ( "DataWindow.detail.height=4")
end if
end event

type pb_ok from picturebutton within w_informe_pagos_no_aceptados
integer x = 1742
integer y = 24
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;Date	ld_fec_ini,ld_fec_fin

SetPointer(HourGlass!)
ld_fec_ini						= date(em_fec_ini.text)
ld_fec_fin						= date(em_fec_fin.text)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type p_fin from picture within w_informe_pagos_no_aceptados
integer x = 1595
integer y = 52
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_informe_pagos_no_aceptados
integer x = 1234
integer y = 52
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_informe_pagos_no_aceptados
integer x = 1042
integer y = 68
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_ini from picture within w_informe_pagos_no_aceptados
integer x = 928
integer y = 52
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_informe_pagos_no_aceptados
integer x = 567
integer y = 52
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_pagos_no_aceptados
integer x = 46
integer y = 68
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informe_pagos_no_aceptados
integer x = 3314
integer y = 1652
integer width = 306
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_pagos_no_aceptados)
end event

type dw_lista from datawindow within w_informe_pagos_no_aceptados
integer x = 27
integer y = 200
integer width = 3593
integer height = 1408
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_correlativo_pagos_no_aceptados"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_informe_pagos_no_aceptados
integer x = 1801
integer y = 1604
integer width = 978
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

