forward
global type w_detalle_lista_generada_gestion_carta from window
end type
type cb_historico from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_carta
end type
type dw_lista from datawindow within w_detalle_lista_generada_gestion_carta
end type
type gb_1 from groupbox within w_detalle_lista_generada_gestion_carta
end type
end forward

global type w_detalle_lista_generada_gestion_carta from window
integer width = 2994
integer height = 1808
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_historico cb_historico
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_lista_generada_gestion_carta w_detalle_lista_generada_gestion_carta

type variables
long		il_codigo,il_row
String	MenuHabilitado,is_estado,is_string,is_usuario
end variables

on w_detalle_lista_generada_gestion_carta.create
this.cb_historico=create cb_historico
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_historico,&
this.cb_cerrar,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_lista_generada_gestion_carta.destroy
destroy(this.cb_historico)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;long		ll_indi, ll_tot_reg, ll_count_reg, ll_rut
Datetime	ldt_fecha
SetPointer(HourGlass!)
connect using trans_1;
gf_centrar(w_detalle_lista_generada_gestion_carta)
dw_lista.settransobject(sqlca)
il_codigo				= long(substr(1,1,Message.StringParm))
is_usuario				= substr(1,2,Message.StringParm)
this.title				= 'Detalle de Clientes Gestión Envio Carta         CODIGO:  '+string(il_codigo)
ll_tot_reg				= dw_lista.retrieve(il_codigo,is_usuario)
if ll_tot_reg>0 then
	for ll_indi = 1 to ll_tot_reg
		ll_rut			= dw_lista.getitemnumber(ll_indi,'gc_detalle_gestion_rut_cliente')
		ldt_fecha		= dw_lista.getitemdatetime(ll_indi,'gc_detalle_gestion_fecha_carta_envio')
		ll_count_reg	= 0
		SELECT	count("TELE_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"TELE_LOG"  
		WHERE  ( "TELE_LOG"."RUT" = :ll_rut ) and
				 ( "TELE_LOG"."FECHA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_telefono',0)
		else
			dw_lista.setitem(ll_indi,'estatus_telefono',1)
		end if
		ll_count_reg	= 0
		SELECT	count("CARTA_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"CARTA_LOG"  
		WHERE  ( "CARTA_LOG"."RUT" = :ll_rut ) and
				 ( "CARTA_LOG"."FECHA_CARTA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_carta',0)
		else
			dw_lista.setitem(ll_indi,'estatus_carta',1)
		end if
		ll_count_reg	= 0
		SELECT	count("ATENCION_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"ATENCION_LOG"  
		WHERE  ( "ATENCION_LOG"."RUT" = :ll_rut ) and
				 ( "ATENCION_LOG"."FECHA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_publico',0)
		else
			dw_lista.setitem(ll_indi,'estatus_publico',1)
		end if
	next
end if
disconnect using trans_1;
SetPointer(Arrow!)
end event

type cb_historico from commandbutton within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_dwnmousemove
integer x = 1669
integer y = 1576
integer width = 283
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_carta
integer x = 2683
integer y = 1576
integer width = 251
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_lista_generada_gestion_carta)
end event

type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_carta
integer x = 1198
integer y = 1576
integer width = 407
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
	param			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
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
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				OpenWithParm(w_cuenta_corriente_funeraria,param) 
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1576
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

type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1576
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

type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1576
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

type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 20
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

type dw_lista from datawindow within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 44
integer width = 2889
integer height = 1472
integer taborder = 10
string dataobject = "dw_detale_select_por_gestion_envio_carta"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= this.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= this.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_numero	= this.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gi_rut		= this.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	is_estado	= 'G'
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= this.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= this.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_numero	= this.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gi_rut		= this.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	is_estado	= 'G'
end if

end event

event doubleclicked;if row>0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= this.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= this.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_numero	= this.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gi_rut		= this.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	is_estado	= 'G'
	cb_ctacte.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_detalle_lista_generada_gestion_carta
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1528
integer width = 1088
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

