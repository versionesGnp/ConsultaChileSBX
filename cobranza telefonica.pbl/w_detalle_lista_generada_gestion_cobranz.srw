forward
global type w_detalle_lista_generada_gestion_cobranz from window
end type
type cb_importar from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_historico from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_cobranz
end type
type dw_lista from datawindow within w_detalle_lista_generada_gestion_cobranz
end type
type gb_1 from groupbox within w_detalle_lista_generada_gestion_cobranz
end type
end forward

global type w_detalle_lista_generada_gestion_cobranz from window
integer width = 3717
integer height = 1824
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_importar cb_importar
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
global w_detalle_lista_generada_gestion_cobranz w_detalle_lista_generada_gestion_cobranz

type variables
long		il_codigo,il_row
String	MenuHabilitado,is_estado,is_string
end variables

on w_detalle_lista_generada_gestion_cobranz.create
this.cb_importar=create cb_importar
this.cb_historico=create cb_historico
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_importar,&
this.cb_historico,&
this.cb_cerrar,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_lista_generada_gestion_cobranz.destroy
destroy(this.cb_importar)
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
gf_centrar(w_detalle_lista_generada_gestion_cobranz)
dw_lista.settransobject(sqlca)
il_codigo				= long(substr(1,1,Message.StringParm))
this.title				= 'Detalle de Clientes Gestión          CODIGO:  '+string(il_codigo)
ll_tot_reg				= dw_lista.retrieve(il_codigo)
if ll_tot_reg>0 then
	for ll_indi = 1 to ll_tot_reg
		ll_rut			= dw_lista.getitemnumber(ll_indi,'gestion_cobranza_rut')
		ldt_fecha		= dw_lista.getitemdatetime(ll_indi,'gestion_lista_fecha')
		ll_count_reg	= 0
		SELECT	count("TELE_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"TELE_LOG"  
		WHERE  ( "TELE_LOG"."RUT" = :ll_rut ) and
				 ( "TELE_LOG"."FECHA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',1)
		end if
		ll_count_reg	= 0
		SELECT	count("CARTA_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"CARTA_LOG"  
		WHERE  ( "CARTA_LOG"."RUT" = :ll_rut ) and
				 ( "CARTA_LOG"."FECHA_CARTA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',1)
		end if
		ll_count_reg	= 0
		SELECT	count("ATENCION_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"ATENCION_LOG"  
		WHERE  ( "ATENCION_LOG"."RUT" = :ll_rut ) and
				 ( "ATENCION_LOG"."FECHA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',1)
		end if
	next
end if
disconnect using trans_1;
SetPointer(Arrow!)
end event

type cb_importar from commandbutton within w_detalle_lista_generada_gestion_cobranz
integer x = 2377
integer y = 1576
integer width = 407
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&mportar Archivo"
end type

event clicked;open(w_importar_archivo_cobranza_externa)
end event

type cb_historico from commandbutton within w_detalle_lista_generada_gestion_cobranz
event ue_mousemove pbm_dwnmousemove
integer x = 2094
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
	gs_base			= dw_lista.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie			= dw_lista.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'gestion_cobranza_rut')
	open(w_cobranza_historica)
end if
end event

type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_cobranz
integer x = 3397
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

event clicked;close(w_detalle_lista_generada_gestion_cobranz)
end event

type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_cobranz
integer x = 1687
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

event clicked;string param
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie		= dw_lista.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'gestion_cobranza_rut')
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

type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_cobranz
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

type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_cobranz
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

type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_cobranz
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

event clicked;//string nulo
long		ll_filas
//setnull (nulo)
//dw_lista.SETfilter(NULO)
//dw_lista.filter()
//gs_formula 	= dw_lista.describe("datawindow.syntax")
//messagebox("",gs_formula)

long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
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

type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_cobranz
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

type dw_lista from datawindow within w_detalle_lista_generada_gestion_cobranz
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 44
integer width = 3602
integer height = 1472
integer taborder = 10
string dataobject = "dw_detale_select_por_gestion_cob"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
ls_columna	= dwo.name

CHOOSE CASE ls_columna
	CASE 't_10','t_11' //rojo
		if is_string="gestion_cobranza_estado_llamada ='A'" then
			is_string	= ''
		else
			is_string	= "gestion_cobranza_estado_llamada ='"+'A'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
	CASE 't_12','t_13' //amarillo
		if is_string	= "gestion_cobranza_estado_llamada ='G'" then
			is_string	= ''
		else
			is_string	= "gestion_cobranza_estado_llamada ='"+'G'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
	CASE 't_14','t_15' //blanco
		if is_string	= "gestion_cobranza_estado_llamada ='P'" then
			is_string	= ''
		else
			is_string	= "gestion_cobranza_estado_llamada ='"+'P'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
END CHOOSE

if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= this.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie		= this.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero	= this.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut		= this.getitemnumber(il_row,'gestion_cobranza_rut')
	is_estado	= this.getitemstring(il_row,'gestion_cobranza_estado_llamada')
end if

end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= this.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie		= this.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero	= this.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut		= this.getitemnumber(il_row,'gestion_cobranza_rut')
	is_estado	= this.getitemstring(il_row,'gestion_cobranza_estado_llamada')
end if

end event

event rbuttondown;if row>0 then
	il_row		= row
	gs_base		= this.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie		= this.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero	= this.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut		= this.getitemnumber(il_row,'gestion_cobranza_rut')
	is_estado	= this.getitemstring(il_row,'gestion_cobranza_estado_llamada')
	if is_estado<>'A' then
		m_gestiones_popup Menu
		Menu = Create m_gestiones_popup
		Menu.m_popup.m_ingresargestiontelefonica.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
		Menu.m_popup.m_ingresarenviocarta.Visible 				= (Mid(MenuHabilitado, 2, 1) = "0")
		Menu.m_popup.m_ingresargestionatencionpublico.Visible = (Mid(MenuHabilitado, 3, 1) = "0")
		//menu.dw_paso = This
		Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
	else
		messagebox("Advertencia","Cliente Anulado")
	end if
end if
end event

event constructor;MenuHabilitado	= '000'
end event

type gb_1 from groupbox within w_detalle_lista_generada_gestion_cobranz
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

