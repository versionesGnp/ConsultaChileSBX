forward
global type w_informe_fecha_hora from window
end type
type cb_ctacte from commandbutton within w_informe_fecha_hora
end type
type cb_imprimir from commandbutton within w_informe_fecha_hora
end type
type cb_filtrar from commandbutton within w_informe_fecha_hora
end type
type cb_exportar from commandbutton within w_informe_fecha_hora
end type
type cb_mostrar from commandbutton within w_informe_fecha_hora
end type
type pb_aceptar from picturebutton within w_informe_fecha_hora
end type
type em_hora_fin from editmask within w_informe_fecha_hora
end type
type st_4 from statictext within w_informe_fecha_hora
end type
type p_hasta from picture within w_informe_fecha_hora
end type
type em_hasta from editmask within w_informe_fecha_hora
end type
type st_3 from statictext within w_informe_fecha_hora
end type
type em_hora_ini from editmask within w_informe_fecha_hora
end type
type st_2 from statictext within w_informe_fecha_hora
end type
type p_desde from picture within w_informe_fecha_hora
end type
type em_de from editmask within w_informe_fecha_hora
end type
type st_1 from statictext within w_informe_fecha_hora
end type
type cb_cerrar from commandbutton within w_informe_fecha_hora
end type
type dw_lista from datawindow within w_informe_fecha_hora
end type
type gb_1 from groupbox within w_informe_fecha_hora
end type
type gb_2 from groupbox within w_informe_fecha_hora
end type
type gb_3 from groupbox within w_informe_fecha_hora
end type
end forward

global type w_informe_fecha_hora from window
integer width = 2638
integer height = 1560
boolean titlebar = true
string title = "Informe Cierre Caja (Fecha / Hora)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_mostrar cb_mostrar
pb_aceptar pb_aceptar
em_hora_fin em_hora_fin
st_4 st_4
p_hasta p_hasta
em_hasta em_hasta
st_3 st_3
em_hora_ini em_hora_ini
st_2 st_2
p_desde p_desde
em_de em_de
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_informe_fecha_hora w_informe_fecha_hora

on w_informe_fecha_hora.create
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_mostrar=create cb_mostrar
this.pb_aceptar=create pb_aceptar
this.em_hora_fin=create em_hora_fin
this.st_4=create st_4
this.p_hasta=create p_hasta
this.em_hasta=create em_hasta
this.st_3=create st_3
this.em_hora_ini=create em_hora_ini
this.st_2=create st_2
this.p_desde=create p_desde
this.em_de=create em_de
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_ctacte,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_mostrar,&
this.pb_aceptar,&
this.em_hora_fin,&
this.st_4,&
this.p_hasta,&
this.em_hasta,&
this.st_3,&
this.em_hora_ini,&
this.st_2,&
this.p_desde,&
this.em_de,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_informe_fecha_hora.destroy
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_mostrar)
destroy(this.pb_aceptar)
destroy(this.em_hora_fin)
destroy(this.st_4)
destroy(this.p_hasta)
destroy(this.em_hasta)
destroy(this.st_3)
destroy(this.em_hora_ini)
destroy(this.st_2)
destroy(this.p_desde)
destroy(this.em_de)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;gf_centrar(w_informe_fecha_hora)
em_de.text							= string(gdt_fec_sistema,"dd/mm/yyyy")
em_hora_ini.text					= '08 : 30'
em_hasta.text						= string(gdt_fec_sistema,"dd/mm/yyyy")
em_hora_fin.text					= '14 : 00'
dw_lista.settransobject(sqlca)
dw_lista.Modify ( "DataWindow.detail.height=0" )
dw_lista.object.t_5.visible	= false
dw_lista.object.t_6.visible	= false
dw_lista.object.t_7.visible	= false
dw_lista.object.t_8.visible	= false
dw_lista.object.t_9.visible	= false
dw_lista.object.t_10.visible	= false
dw_lista.object.t_11.visible	= false
dw_lista.object.t_12.visible	= false
end event

type cb_ctacte from commandbutton within w_informe_fecha_hora
integer x = 663
integer y = 1324
integer width = 430
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Datetime	ldt_fecha_pago
String	ls_caja,ls_tipo_cob
Long		ll_folio
if cb_mostrar.text='No Mostrar Detalle' then
	if dw_lista.rowcount()>0 then
		ldt_fecha_pago	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_pago')
		ls_caja			= dw_lista.getitemstring(dw_lista.getrow(),'cod_caja')
		ll_folio			= dw_lista.getitemnumber(dw_lista.getrow(),'folio')
		ls_tipo_cob		= dw_lista.getitemstring(dw_lista.getrow(),'tipo_cob')
		SELECT	"INGRESO"."BASE",   
					"INGRESO"."SERIE",   
					"INGRESO"."CONTRATO",   
					"INGRESO"."RUT"  
		INTO 		:gs_base,   
					:gs_serie,   
					:gi_numero,   
					:gi_rut  
		FROM 		"INGRESO"  
		WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
				 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
				 ( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
				 ( "INGRESO"."COD_CAJA" = :ls_caja )   
		USING		sqlca;
		IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
			CHOOSE CASE gs_base
				CASE "O" // Oferta
					Open(w_cuenta_corriente_oferta)
				CASE "L" // Anexo Liberador
					Open(w_cuenta_corriente_liberador)
				CASE "P" // Pagaré
					Open(w_cuenta_corriente_pagare)
				CASE "C" // Contrato ISA	
					Open(w_cuenta_corriente_contrato_isa)
				CASE "D" // Derecho
					Open(w_cuenta_corriente_derecho)
				CASE "R" // Derecho
					Open(w_cuenta_corriente_repactar_cta_mant)
			END CHOOSE
		else
			messagebox("Advertencia","Debe Seleccionar Movimiento o está en Rezago")
		END IF
	end if
else
	messagebox("Adveretencia","Debe dar Click Opción Mostrar Detalle")
end if
end event

type cb_imprimir from commandbutton within w_informe_fecha_hora
integer x = 1755
integer y = 1332
integer width = 242
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

event clicked;if dw_lista.rowcount() > 0 then 
	IF PrintSetup( ) <> -1 THEN dw_lista.Print()
END IF

end event

type cb_filtrar from commandbutton within w_informe_fecha_hora
integer x = 1509
integer y = 1332
integer width = 242
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

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_informe_fecha_hora
integer x = 1262
integer y = 1332
integer width = 242
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
dw_paso	= dw_lista
//if dw_lista.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_mostrar from commandbutton within w_informe_fecha_hora
integer x = 37
integer y = 1324
integer width = 498
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Detalle"
end type

event clicked;if cb_mostrar.text='Mostrar Detalle' then
	dw_lista.Modify ( "DataWindow.detail.height=84" )
	cb_mostrar.text='No Mostrar Detalle'
	dw_lista.object.t_5.visible	= true
	dw_lista.object.t_6.visible	= true
	dw_lista.object.t_7.visible	= true
	dw_lista.object.t_8.visible	= true
	dw_lista.object.t_9.visible	= true
	dw_lista.object.t_10.visible	= true
	dw_lista.object.t_11.visible	= true
	dw_lista.object.t_12.visible	= true
else
	dw_lista.Modify ( "DataWindow.detail.height=0" )
	cb_mostrar.text='Mostrar Detalle'
	dw_lista.object.t_5.visible	= false
	dw_lista.object.t_6.visible	= false
	dw_lista.object.t_7.visible	= false
	dw_lista.object.t_8.visible	= false
	dw_lista.object.t_9.visible	= false
	dw_lista.object.t_10.visible	= false
	dw_lista.object.t_11.visible	= false
	dw_lista.object.t_12.visible	= false
end if


end event

type pb_aceptar from picturebutton within w_informe_fecha_hora
integer x = 2418
integer y = 60
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
String	ls_hora_dw,ls_hora_w_ini,ls_hora_w_fin,ls_filtro
Long		ll_tot_reg,ll_indi,ll_hora_ini,ll_hora_fin,ll_min_ini,ll_min_fin

SetPointer(HourGlass!)
ls_filtro	= ""
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.reset()
ld_fecha_ini	= date(STRING(em_de.text))
ld_fecha_fin	= date(STRING(em_hasta.text))
ls_hora_w_ini	= trim(em_hora_ini.text)
ls_hora_w_fin	= trim(em_hora_fin.text)
ll_hora_ini		= long(mid(ls_hora_w_ini,1,2))
ll_min_ini		= long(mid(ls_hora_w_ini,6,2))
ll_hora_fin		= long(mid(ls_hora_w_fin,1,2))
ll_min_fin		= long(mid(ls_hora_w_fin,6,2))
ll_tot_reg		= dw_lista.retrieve(ld_fecha_ini,ll_hora_ini,ll_min_ini,ld_fecha_fin,ll_hora_fin,ll_min_fin)
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato")
else
	for ll_indi=1 to ll_tot_reg
		ls_hora_dw	= dw_lista.getitemstring(ll_indi,'la_hora')
		if time(ls_hora_dw)>=time(ls_hora_w_ini) and time(ls_hora_dw)<=time(ls_hora_w_fin) then
			dw_lista.setitem(ll_indi,'estado','S')
		else
			dw_lista.setitem(ll_indi,'estado','N')
		end if
	next
	dw_lista.accepttext()
	ls_filtro	= "estado='S'"
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
//	dw_lista.object.t_titulo.text	= 'Pagos del '+ trim(em_de.text)+' '+trim(em_hora_ini.text)+' al '+trim(em_hasta.text)+' '+trim(em_hora_fin.text)
end if
SetPointer(Arrow!)
end event

type em_hora_fin from editmask within w_informe_fecha_hora
integer x = 2025
integer y = 96
integer width = 315
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh : mm"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_4 from statictext within w_informe_fecha_hora
integer x = 1847
integer y = 116
integer width = 165
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
string text = "Hora"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_hasta from picture within w_informe_fecha_hora
integer x = 1760
integer y = 96
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_de.text)
dw_lista.reset()
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_hasta.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_hasta.text	= string(date(Message.StringParm))
END IF

end event

type em_hasta from editmask within w_informe_fecha_hora
integer x = 1417
integer y = 96
integer width = 338
integer height = 88
integer taborder = 30
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
string displaydata = ""
end type

event modified;dw_lista.reset()

end event

type st_3 from statictext within w_informe_fecha_hora
integer x = 1239
integer y = 104
integer width = 165
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_hora_ini from editmask within w_informe_fecha_hora
integer x = 846
integer y = 96
integer width = 315
integer height = 92
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
maskdatatype maskdatatype = timemask!
string mask = "hh : mm"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_fecha_hora
integer x = 686
integer y = 116
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
string text = "Hora"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_desde from picture within w_informe_fecha_hora
integer x = 581
integer y = 96
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_de.text)
dw_lista.reset()
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_de.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_de.text	= string(date(Message.StringParm))
END IF

end event

type em_de from editmask within w_informe_fecha_hora
integer x = 238
integer y = 96
integer width = 338
integer height = 88
integer taborder = 10
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
string displaydata = ""
end type

event modified;dw_lista.reset()

end event

type st_1 from statictext within w_informe_fecha_hora
integer x = 64
integer y = 104
integer width = 160
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informe_fecha_hora
integer x = 2281
integer y = 1324
integer width = 297
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_fecha_hora)
end event

type dw_lista from datawindow within w_informe_fecha_hora
integer x = 37
integer y = 252
integer width = 2542
integer height = 1028
integer taborder = 60
string dataobject = "dw_informe_caja_por_dia_hora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_informe_fecha_hora
integer x = 37
integer y = 16
integer width = 1157
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Fecha y Hora Inicial"
end type

type gb_2 from groupbox within w_informe_fecha_hora
integer x = 1221
integer y = 16
integer width = 1157
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Fecha y Hora Término"
end type

type gb_3 from groupbox within w_informe_fecha_hora
integer x = 1234
integer y = 1280
integer width = 791
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

