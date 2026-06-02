forward
global type w_contratos_digitados_por_fecha from window
end type
type dw_ingreso_cttos_por_fecha from datawindow within w_contratos_digitados_por_fecha
end type
type p_4 from picture within w_contratos_digitados_por_fecha
end type
type p_3 from picture within w_contratos_digitados_por_fecha
end type
type st_1 from statictext within w_contratos_digitados_por_fecha
end type
type em_fec_ini from editmask within w_contratos_digitados_por_fecha
end type
type em_fec_fin from editmask within w_contratos_digitados_por_fecha
end type
type st_2 from statictext within w_contratos_digitados_por_fecha
end type
type pb_consultar from picturebutton within w_contratos_digitados_por_fecha
end type
type cb_cerrar from commandbutton within w_contratos_digitados_por_fecha
end type
type cb_limpiar from commandbutton within w_contratos_digitados_por_fecha
end type
type cb_imprimir from commandbutton within w_contratos_digitados_por_fecha
end type
type cb_exportar from commandbutton within w_contratos_digitados_por_fecha
end type
type cb_filtar from commandbutton within w_contratos_digitados_por_fecha
end type
type cb_ctta_corriente from commandbutton within w_contratos_digitados_por_fecha
end type
type gb_1 from groupbox within w_contratos_digitados_por_fecha
end type
end forward

global type w_contratos_digitados_por_fecha from window
integer width = 4101
integer height = 1852
boolean titlebar = true
string title = "Ingreso Contratos Digitados"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_ingreso_cttos_por_fecha dw_ingreso_cttos_por_fecha
p_4 p_4
p_3 p_3
st_1 st_1
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
pb_consultar pb_consultar
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtar cb_filtar
cb_ctta_corriente cb_ctta_corriente
gb_1 gb_1
end type
global w_contratos_digitados_por_fecha w_contratos_digitados_por_fecha

type variables
long il_row
end variables

on w_contratos_digitados_por_fecha.create
this.dw_ingreso_cttos_por_fecha=create dw_ingreso_cttos_por_fecha
this.p_4=create p_4
this.p_3=create p_3
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.pb_consultar=create pb_consultar
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtar=create cb_filtar
this.cb_ctta_corriente=create cb_ctta_corriente
this.gb_1=create gb_1
this.Control[]={this.dw_ingreso_cttos_por_fecha,&
this.p_4,&
this.p_3,&
this.st_1,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.pb_consultar,&
this.cb_cerrar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtar,&
this.cb_ctta_corriente,&
this.gb_1}
end on

on w_contratos_digitados_por_fecha.destroy
destroy(this.dw_ingreso_cttos_por_fecha)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.pb_consultar)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtar)
destroy(this.cb_ctta_corriente)
destroy(this.gb_1)
end on

event open;string	ls_base
ls_base = 'O'
if gs_depto='I' or gs_depto='G' or gs_depto='O' then
	gf_centrar(w_contratos_digitados_por_fecha)
	dw_ingreso_cttos_por_fecha.dataobject						= 'dw_ctto_digitados_fecha' 
	dw_ingreso_cttos_por_fecha.settransobject(sqlca)
	dw_ingreso_cttos_por_fecha.getchild('pago_oferta_codigo_tipo_seguro',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.retrieve(1,ls_base)
	if idw_detalle2.rowcount()=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_ingreso_cttos_por_fecha.getchild('cliente_comuna',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(1)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	em_fec_ini.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
	em_fec_fin.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
	em_fec_ini.setfocus()
else
	Messagebox("Mensaje","Usted No Tiene Los Permisos Necesarios Para Esta Aplicación")
	close(w_contratos_digitados_por_fecha)
end if	
end event

type dw_ingreso_cttos_por_fecha from datawindow within w_contratos_digitados_por_fecha
integer x = 14
integer y = 24
integer width = 4023
integer height = 1564
integer taborder = 60
string title = "none"
string dataobject = "dw_ctto_digitados_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
//	cb_ctta_corriente.triggerevent(clicked!)
end if
end event

type p_4 from picture within w_contratos_digitados_por_fecha
integer x = 1134
integer y = 1636
integer width = 78
integer height = 88
integer taborder = 40
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
 em_fec_fin.text=string(today(),gs_formato_fecha)
 em_fec_fin.setfocus()
 return
end if 
if em_fec_ini.text<>'00/00/0000' then
 ls_fecha = em_fec_fin.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_fec_fin.setfocus()
  return
 else 
  em_fec_fin.text = Message.StringParm
 end if 
END IF
end event

type p_3 from picture within w_contratos_digitados_por_fecha
integer x = 553
integer y = 1636
integer width = 78
integer height = 88
integer taborder = 20
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

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

type st_1 from statictext within w_contratos_digitados_por_fecha
integer x = 14
integer y = 1652
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_contratos_digitados_por_fecha
integer x = 201
integer y = 1636
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_ingreso_cttos_por_fecha.reset()
end event

type em_fec_fin from editmask within w_contratos_digitados_por_fecha
integer x = 782
integer y = 1636
integer width = 343
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_ingreso_cttos_por_fecha.reset()
end event

type st_2 from statictext within w_contratos_digitados_por_fecha
integer x = 645
integer y = 1652
integer width = 114
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_consultar from picturebutton within w_contratos_digitados_por_fecha
integer x = 1243
integer y = 1612
integer width = 155
integer height = 136
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string ls_aux
dateTime ldt_fech_ini,ldt_fech_fin

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ldt_fech_ini									= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fech_fin									= datetime(date(em_fec_fin.text),time('23:59:59'))	
if ldt_fech_ini <= ldt_fech_fin then
	dw_ingreso_cttos_por_fecha.retrieve(ldt_fech_ini,ldt_fech_fin)
else
	Messagebox("Error","Rango de Fechas Invalido")
end if	
end event

type cb_cerrar from commandbutton within w_contratos_digitados_por_fecha
integer x = 3721
integer y = 1632
integer width = 315
integer height = 96
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_contratos_digitados_por_fecha)
end event

type cb_limpiar from commandbutton within w_contratos_digitados_por_fecha
integer x = 2546
integer y = 1640
integer width = 293
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;em_fec_ini.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
dw_ingreso_cttos_por_fecha.reset()
end event

type cb_imprimir from commandbutton within w_contratos_digitados_por_fecha
integer x = 2249
integer y = 1640
integer width = 293
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_ingreso_cttos_por_fecha.rowcount() > 0 then
	dw_ingreso_cttos_por_fecha.object.datawindow.Print.Preview	= true
	dw_ingreso_cttos_por_fecha.object.datawindow.zoom				= 70
	f_Print( dw_ingreso_cttos_por_fecha )
	dw_ingreso_cttos_por_fecha.object.datawindow.Print.Preview	= False
	dw_ingreso_cttos_por_fecha.object.datawindow.zoom				= 100
end if
end event

type cb_exportar from commandbutton within w_contratos_digitados_por_fecha
integer x = 1957
integer y = 1640
integer width = 293
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_ingreso_cttos_por_fecha
if dw_ingreso_cttos_por_fecha.rowcount() > 0 then f_DWToExcel( dw_paso)
end event

type cb_filtar from commandbutton within w_contratos_digitados_por_fecha
integer x = 1664
integer y = 1640
integer width = 293
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtar"
end type

event clicked;//if dw_ingreso_cttos_por_fecha.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_ingreso_cttos_por_fecha.SETfilter(NULO)
	dw_ingreso_cttos_por_fecha.filter()
//end if
end event

type cb_ctta_corriente from commandbutton within w_contratos_digitados_por_fecha
integer x = 2894
integer y = 1640
integer width = 475
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;if dw_ingreso_cttos_por_fecha.rowcount()>0 then
	gs_base		= dw_ingreso_cttos_por_fecha.getitemstring(il_row,'cadena_codigo')
	gs_serie		= dw_ingreso_cttos_por_fecha.getitemstring(il_row,'cadena_serie')
	gi_numero	= dw_ingreso_cttos_por_fecha.getitemnumber(il_row,'cadena_numero')
	gi_rut			= dw_ingreso_cttos_por_fecha.getitemnumber(il_row,'cliente_rut')
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
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato")
	END IF
else
	messagebox("Advertencia","Debe Seleccionar Contrato")
end if
end event

type gb_1 from groupbox within w_contratos_digitados_por_fecha
integer x = 1637
integer y = 1588
integer width = 1230
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

