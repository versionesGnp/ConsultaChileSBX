forward
global type w_informe_carta_vs_ingreso_caja from window
end type
type cb_ctacte from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type cb_imprimir from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type cb_exportar from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type cb_filtrar from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type cb_ordenar from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type dw_tipo_mov from datawindow within w_informe_carta_vs_ingreso_caja
end type
type pb_ok from picturebutton within w_informe_carta_vs_ingreso_caja
end type
type st_2 from statictext within w_informe_carta_vs_ingreso_caja
end type
type em_fec_ini from editmask within w_informe_carta_vs_ingreso_caja
end type
type p_ini from picture within w_informe_carta_vs_ingreso_caja
end type
type st_3 from statictext within w_informe_carta_vs_ingreso_caja
end type
type em_fec_fin from editmask within w_informe_carta_vs_ingreso_caja
end type
type p_fin from picture within w_informe_carta_vs_ingreso_caja
end type
type cb_cerrar from commandbutton within w_informe_carta_vs_ingreso_caja
end type
type dw_lista from datawindow within w_informe_carta_vs_ingreso_caja
end type
type gb_1 from groupbox within w_informe_carta_vs_ingreso_caja
end type
end forward

global type w_informe_carta_vs_ingreso_caja from window
integer width = 3218
integer height = 1940
boolean titlebar = true
string title = "Informe Envio Carta V/S Ingreso Caja"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_tipo_mov dw_tipo_mov
pb_ok pb_ok
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
em_fec_fin em_fec_fin
p_fin p_fin
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_carta_vs_ingreso_caja w_informe_carta_vs_ingreso_caja

type variables
Long	il_row
end variables

on w_informe_carta_vs_ingreso_caja.create
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_tipo_mov=create dw_tipo_mov
this.pb_ok=create pb_ok
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.em_fec_fin=create em_fec_fin
this.p_fin=create p_fin
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_tipo_mov,&
this.pb_ok,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.em_fec_fin,&
this.p_fin,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_informe_carta_vs_ingreso_caja.destroy
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_tipo_mov)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.em_fec_fin)
destroy(this.p_fin)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_informe_carta_vs_ingreso_caja)
dw_lista.settransobject(sqlca)
dw_tipo_mov.settransobject(sqlca)
em_fec_ini.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_fin.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
dw_tipo_mov.getchild('tipo_mov',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve('CI')
dw_tipo_mov.insertrow(0)
end event

type cb_ctacte from commandbutton within w_informe_carta_vs_ingreso_caja
integer x = 32
integer y = 1700
integer width = 411
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

event clicked;string ls_base,ls_serie,param
long 	 ll_rut
Double	ll_numero
if il_row > 0 and dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	param     	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				OpenWithParm(w_cuenta_corriente_funeraria,param) 
		CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_imprimir from commandbutton within w_informe_carta_vs_ingreso_caja
event ue_mousemove pbm_mousemove
integer x = 1710
integer y = 1700
integer width = 247
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

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_informe_carta_vs_ingreso_caja
event ue_mousemove pbm_mousemove
integer x = 1417
integer y = 1700
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
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_informe_carta_vs_ingreso_caja
event ue_mousemove pbm_mousemove
integer x = 1166
integer y = 1700
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

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(nulo)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_informe_carta_vs_ingreso_caja
event ue_mousemove pbm_mousemove
integer x = 914
integer y = 1700
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

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type dw_tipo_mov from datawindow within w_informe_carta_vs_ingreso_caja
integer x = 1723
integer y = 52
integer width = 983
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_tipo_mov_caja_vs_ingreso"
boolean border = false
boolean livescroll = true
end type

type pb_ok from picturebutton within w_informe_carta_vs_ingreso_caja
integer x = 2784
integer y = 24
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
String	ls_tipo_mov
SetPointer(HourGlass!)
ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
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
			ls_tipo_mov	= dw_tipo_mov.getitemstring(1,'tipo_mov')
			if not isnull(ls_tipo_mov) and ls_tipo_mov<>'' then
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_tipo_mov)=0 then
					messagebox("Advertencia","No Registra Dato en Rango de Fecha")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_tipo_mov.setfocus()
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type st_2 from statictext within w_informe_carta_vs_ingreso_caja
integer x = 41
integer y = 72
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

type em_fec_ini from editmask within w_informe_carta_vs_ingreso_caja
integer x = 562
integer y = 56
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

type p_ini from picture within w_informe_carta_vs_ingreso_caja
integer x = 923
integer y = 56
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

type st_3 from statictext within w_informe_carta_vs_ingreso_caja
integer x = 1038
integer y = 72
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

type em_fec_fin from editmask within w_informe_carta_vs_ingreso_caja
integer x = 1230
integer y = 56
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

type p_fin from picture within w_informe_carta_vs_ingreso_caja
integer x = 1591
integer y = 56
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

type cb_cerrar from commandbutton within w_informe_carta_vs_ingreso_caja
integer x = 2857
integer y = 1700
integer width = 302
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_carta_vs_ingreso_caja)
end event

type dw_lista from datawindow within w_informe_carta_vs_ingreso_caja
integer x = 27
integer y = 200
integer width = 3131
integer height = 1452
integer taborder = 50
string title = "none"
string dataobject = "dw_info_ingreso_caja_despues_envio_carta"
boolean hscrollbar = true
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

event doubleclicked;if row>0 then
	il_row	= row
	cb_ctacte.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_informe_carta_vs_ingreso_caja
event ue_mousemove pbm_mousemove
integer x = 891
integer y = 1652
integer width = 1093
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

