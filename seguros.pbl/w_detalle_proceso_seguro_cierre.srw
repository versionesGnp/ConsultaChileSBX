forward
global type w_detalle_proceso_seguro_cierre from window
end type
type cb_5 from commandbutton within w_detalle_proceso_seguro_cierre
end type
type cb_exp_rel from commandbutton within w_detalle_proceso_seguro_cierre
end type
type cb_print_rel from commandbutton within w_detalle_proceso_seguro_cierre
end type
type cb_fil_rel from commandbutton within w_detalle_proceso_seguro_cierre
end type
type cb_ord_rel from commandbutton within w_detalle_proceso_seguro_cierre
end type
type cb_cerrar from commandbutton within w_detalle_proceso_seguro_cierre
end type
type dw_lista from datawindow within w_detalle_proceso_seguro_cierre
end type
type gb_2 from groupbox within w_detalle_proceso_seguro_cierre
end type
end forward

global type w_detalle_proceso_seguro_cierre from window
integer width = 3186
integer height = 1868
boolean titlebar = true
string title = "Lista Detalle Deguro"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_5 cb_5
cb_exp_rel cb_exp_rel
cb_print_rel cb_print_rel
cb_fil_rel cb_fil_rel
cb_ord_rel cb_ord_rel
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_detalle_proceso_seguro_cierre w_detalle_proceso_seguro_cierre

type variables
Long	il_tipo_seguro
end variables

on w_detalle_proceso_seguro_cierre.create
this.cb_5=create cb_5
this.cb_exp_rel=create cb_exp_rel
this.cb_print_rel=create cb_print_rel
this.cb_fil_rel=create cb_fil_rel
this.cb_ord_rel=create cb_ord_rel
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_5,&
this.cb_exp_rel,&
this.cb_print_rel,&
this.cb_fil_rel,&
this.cb_ord_rel,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_detalle_proceso_seguro_cierre.destroy
destroy(this.cb_5)
destroy(this.cb_exp_rel)
destroy(this.cb_print_rel)
destroy(this.cb_fil_rel)
destroy(this.cb_ord_rel)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;Date		ldt_fecha_cierre
Long		ll_cod_parque,ll_tipo_seguro,ll_new
String	ls_descrip

ldt_fecha_cierre	= date(substr(1,1,Message.StringParm))
ll_cod_parque		= long(substr(1,2,Message.StringParm))
il_tipo_seguro		= long(substr(1,3,Message.StringParm))
gf_centrar(w_detalle_proceso_seguro_cierre)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(ldt_fecha_cierre,ll_cod_parque,il_tipo_seguro)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_detalle_proceso_seguro_cierre)
else
	SELECT DISTINCT "TIPO_SEGURO_PARQUE"."DESCRIPCION"
	INTO 		:ls_descrip  
	FROM 		"TIPO_SEGURO_PARQUE"  
	WHERE 	"TIPO_SEGURO_PARQUE"."CODIGO_SEGURO" = :il_tipo_seguro   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		this.title		= 'Lista Detalle '+ls_descrip+' Fecha Cierre '+string(ldt_fecha_cierre,'dd/mm/yyyy')
	else
		this.title		= 'Lista Detalle Seguro Fecha Cierre '+string(ldt_fecha_cierre,'dd/mm/yyyy')
	end if
end if
end event

type cb_5 from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 1207
integer y = 1612
integer width = 526
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Long		ll_fila

Setnull(gs_base);Setnull(gs_serie);Setnull(gi_numero)
ll_fila			= dw_lista.getrow()
if ll_fila>0 and dw_lista.rowcount()>0 then
	gs_serie		= dw_lista.getitemstring(ll_fila,'serie')
	gi_numero	= dw_lista.getitemnumber(ll_fila,'numero')
	gs_base		= dw_lista.getitemstring(ll_fila,'base')
	gi_rut		= dw_lista.getitemnumber(ll_fila,'rut')
	if ll_fila > 0 and not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
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
end if
end event

type cb_exp_rel from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 562
integer y = 1616
integer width = 247
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
if dw_lista.rowcount()>0 then
	dw_paso = dw_lista
	f_DWToExcel( dw_paso )
end if
end event

type cb_print_rel from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 896
integer y = 1616
integer width = 247
integer height = 96
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
	dw_lista.Modify("DataWindow.Zoom=68")
	f_Print( dw_lista )
	dw_lista.Modify("DataWindow.Zoom=100")
end if
end event

type cb_fil_rel from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 311
integer y = 1616
integer width = 247
integer height = 96
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

type cb_ord_rel from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 59
integer y = 1616
integer width = 247
integer height = 96
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

type cb_cerrar from commandbutton within w_detalle_proceso_seguro_cierre
integer x = 2811
integer y = 1612
integer width = 315
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_proceso_seguro_cierre)
end event

type dw_lista from datawindow within w_detalle_proceso_seguro_cierre
integer x = 37
integer y = 44
integer width = 3090
integer height = 1508
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_proceso_seguro"
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

type gb_2 from groupbox within w_detalle_proceso_seguro_cierre
integer x = 37
integer y = 1568
integer width = 1134
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

