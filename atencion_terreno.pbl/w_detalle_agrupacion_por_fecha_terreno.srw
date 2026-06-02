forward
global type w_detalle_agrupacion_por_fecha_terreno from window
end type
type cb_ordenar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type cb_filtrar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type cb_exportar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type cb_imprimir from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type cb_ctacte from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type dw_lista from datawindow within w_detalle_agrupacion_por_fecha_terreno
end type
type cb_cerrar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
end type
type gb_1 from groupbox within w_detalle_agrupacion_por_fecha_terreno
end type
end forward

global type w_detalle_agrupacion_por_fecha_terreno from window
integer width = 3529
integer height = 1992
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
global w_detalle_agrupacion_por_fecha_terreno w_detalle_agrupacion_por_fecha_terreno

type variables
Long	il_row
end variables

on w_detalle_agrupacion_por_fecha_terreno.create
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

on w_detalle_agrupacion_por_fecha_terreno.destroy
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;Date		ld_fecha
String	ls_opcion,ls_usuario
SetPointer(HourGlass!)
gf_centrar(w_detalle_agrupacion_por_fecha_terreno)
dw_lista.settransobject(sqlca)
ld_fecha 								= date(substr(1,1,Message.StringParm))
ls_opcion								= substr(1,2,Message.StringParm)
CHOOSE CASE ls_opcion
	CASE 'T'
		dw_lista.dataobject		= 'dw_detalle_por_fecha_cobranza_terreno'
		this.title						= 'Detalle Cobranza por Fecha'
	CASE 'V'
		dw_lista.dataobject		= 'dw_detalle_por_fecha_visita_terreno'
		this.title						= 'Detalle Visita Terreno por Fecha'
END CHOOSE
dw_lista.settransobject(sqlca)
SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO 		:ls_usuario  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE	( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
			( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 	( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING	sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	ls_usuario						= '%'
else
	ls_usuario						= gs_user
end if
dw_lista.retrieve(ld_fecha,ls_usuario)
SetPointer(Arrow!)
end event

type cb_ordenar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
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

type cb_filtrar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
event ue_mousemove pbm_mousemove
integer x = 1166
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

type cb_exportar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
event ue_mousemove pbm_mousemove
integer x = 1417
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
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_detalle_agrupacion_por_fecha_terreno
event ue_mousemove pbm_mousemove
integer x = 1710
integer y = 1768
integer width = 247
integer height = 92
integer taborder = 60
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
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_ctacte from commandbutton within w_detalle_agrupacion_por_fecha_terreno
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

event clicked;string 	ls_base,ls_serie,param
long 		ll_rut
Double	ll_numero

if il_row > 0 then
	if dw_lista.dataobject='dw_detalle_por_fecha_cobranza_terreno' then
		gs_base		= dw_lista.getitemstring(il_row,'tele_log_base')
		gs_serie		= dw_lista.getitemstring(il_row,'tele_log_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'tele_log_numero')
	elseif dw_lista.dataobject='dw_detalle_por_fecha_visita_terreno' then
		gs_base		= dw_lista.getitemstring(il_row,'atencion_log_base')
		gs_serie		= dw_lista.getitemstring(il_row,'atencion_log_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'atencion_log_numero')
	end if
	gi_rut			= dw_lista.getitemnumber(il_row,'cliente_rut')
	param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
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
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type dw_lista from datawindow within w_detalle_agrupacion_por_fecha_terreno
integer x = 32
integer y = 32
integer width = 3447
integer height = 1680
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_por_fecha_visita_terreno"
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

type cb_cerrar from commandbutton within w_detalle_agrupacion_por_fecha_terreno
integer x = 3163
integer y = 1768
integer width = 315
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_agrupacion_por_fecha_terreno)
end event

type gb_1 from groupbox within w_detalle_agrupacion_por_fecha_terreno
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

