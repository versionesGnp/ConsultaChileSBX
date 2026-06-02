forward
global type w_detalle_agrupacion_rango_fecha_cob from window
end type
type cb_ordenar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type cb_filtrar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type cb_exportar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type cb_imprimir from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type cb_ctacte from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type dw_lista from datawindow within w_detalle_agrupacion_rango_fecha_cob
end type
type cb_cerrar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
end type
type gb_1 from groupbox within w_detalle_agrupacion_rango_fecha_cob
end type
end forward

global type w_detalle_agrupacion_rango_fecha_cob from window
integer width = 2953
integer height = 2000
boolean titlebar = true
string title = "Detalle Cobranza por Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_detalle_agrupacion_rango_fecha_cob w_detalle_agrupacion_rango_fecha_cob

type variables
Long	il_row,il_parque
end variables

on w_detalle_agrupacion_rango_fecha_cob.create
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_1}
end on

on w_detalle_agrupacion_rango_fecha_cob.destroy
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;Date		ld_fecha_ini,ld_fecha_fin
String	ls_opcion
SetPointer(HourGlass!)
gf_centrar(w_detalle_agrupacion_rango_fecha_cob)
ld_fecha_ini 	= date(substr(1,1,Message.StringParm))
ld_fecha_fin 	= date(substr(1,2,Message.StringParm))
ls_opcion		= substr(1,3,Message.StringParm)
il_parque		= long(substr(1,4,Message.StringParm))
CHOOSE CASE ls_opcion
	CASE 'T'
		dw_lista.dataobject	= 'dw_detalle_por_fecha_cobranza_rango'
		this.title				= 'Detalle Cobranza Telefónica por Rango de Fecha'
	CASE 'C'
		dw_lista.dataobject	= 'dw_detalle_por_fecha_envio_carta_rango'
		this.title				= 'Detalle Envio Carta Cobranza por Rango de Fecha'
	CASE 'P'
		dw_lista.dataobject	= 'dw_detalle_por_post_venta_rango'
		this.title				= 'Detalle Post-Venta por Rango de Fecha'
END CHOOSE
dw_lista.settransobject(sqlca)
dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
SetPointer(Arrow!)
end event

type cb_ordenar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
event ue_mousemove pbm_mousemove
integer x = 914
integer y = 1768
integer width = 247
integer height = 92
integer taborder = 30
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

type cb_filtrar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
event ue_mousemove pbm_mousemove
integer x = 1166
integer y = 1768
integer width = 247
integer height = 92
integer taborder = 30
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

type cb_exportar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
event ue_mousemove pbm_mousemove
integer x = 1417
integer y = 1768
integer width = 247
integer height = 92
integer taborder = 40
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

type cb_imprimir from commandbutton within w_detalle_agrupacion_rango_fecha_cob
event ue_mousemove pbm_mousemove
integer x = 1710
integer y = 1768
integer width = 247
integer height = 92
integer taborder = 50
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

type cb_ctacte from commandbutton within w_detalle_agrupacion_rango_fecha_cob
integer x = 32
integer y = 1768
integer width = 407
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string		param
long 	 	ll_rut
if il_row > 0 then
	if dw_lista.dataobject='dw_detalle_por_fecha_cobranza_rango' then
		gs_base		= dw_lista.getitemstring(il_row,'tele_log_base')
		gs_serie		= dw_lista.getitemstring(il_row,'tele_log_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'tele_log_numero')
	elseif dw_lista.dataobject='dw_detalle_por_fecha_envio_carta_rango' then
		gs_base		= dw_lista.getitemstring(il_row,'carta_log_base')
		gs_serie		= dw_lista.getitemstring(il_row,'carta_log_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'carta_log_numero')
	elseif dw_lista.dataobject='dw_detalle_por_post_venta_rango' then
		gs_base		= dw_lista.getitemstring(il_row,'tele_log_post_venta_base')
		gs_serie		= dw_lista.getitemstring(il_row,'tele_log_post_venta_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'tele_log_post_venta_numero')
	end if
	gi_rut		= dw_lista.getitemnumber(il_row,'cliente_rut')	
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type dw_lista from datawindow within w_detalle_agrupacion_rango_fecha_cob
integer x = 32
integer y = 32
integer width = 2871
integer height = 1680
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_por_post_venta_rango"
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

type cb_cerrar from commandbutton within w_detalle_agrupacion_rango_fecha_cob
integer x = 2587
integer y = 1768
integer width = 315
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_agrupacion_rango_fecha_cob)
end event

type gb_1 from groupbox within w_detalle_agrupacion_rango_fecha_cob
event ue_mousemove pbm_mousemove
integer x = 891
integer y = 1720
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

