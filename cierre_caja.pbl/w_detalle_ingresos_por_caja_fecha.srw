forward
global type w_detalle_ingresos_por_caja_fecha from window
end type
type hpb_1 from hprogressbar within w_detalle_ingresos_por_caja_fecha
end type
type st_fondo from statictext within w_detalle_ingresos_por_caja_fecha
end type
type st_porc from statictext within w_detalle_ingresos_por_caja_fecha
end type
type cb_exportar from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type cb_filtrar from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type cb_ordenar from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type cb_imprimir from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type cb_ctacte from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type cb_cerrar from commandbutton within w_detalle_ingresos_por_caja_fecha
end type
type dw_lista from datawindow within w_detalle_ingresos_por_caja_fecha
end type
end forward

global type w_detalle_ingresos_por_caja_fecha from window
integer width = 2693
integer height = 1952
boolean titlebar = true
string title = "Detalle Ingreso"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_ingresos_por_caja_fecha w_detalle_ingresos_por_caja_fecha

type variables
String	is_caja
Date		id_fecha,id_fecha_fin
datawindow dw_paso
end variables

on w_detalle_ingresos_por_caja_fecha.create
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.hpb_1,&
this.st_fondo,&
this.st_porc,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_ingresos_por_caja_fecha.destroy
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_monto,ll_indi,ll_tot_reg,ll_tot_porc,ll_tot_porc_aux
String	ls_tipo_cob,ls_tipo_mov
Datetime	ldt_fec_ini,ldt_fec_fin

SetPointer(HourGlass!)
gf_centrar(w_detalle_ingresos_por_caja_fecha)
is_caja 						= substr(1,1,Message.StringParm)
id_fecha						= date(substr(1,2,Message.StringParm))
id_fecha_fin					= date(substr(1,3,Message.StringParm))
ldt_fec_ini					= datetime(id_fecha,time('00:00:00'))
ldt_fec_fin					= datetime(id_fecha_fin,time('23:59:59'))
if is_caja='TODAS' then
	dw_lista.dataobject	= 'dw_lista_detalle_ingresos_todas'
	dw_lista.settransobject(sqlca)
	ll_tot_reg				= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)
else
	dw_lista.dataobject	= 'dw_lista_detalle_ingresos'
	dw_lista.settransobject(sqlca)
	ll_tot_reg				= dw_lista.retrieve(is_caja,ldt_fec_ini,ldt_fec_fin)
end if
if ll_tot_reg>0 then
	st_fondo.visible			= true
	hpb_1.visible 			= true
	st_porc.visible 			= true
	ll_tot_porc				= 0
	ll_tot_porc_aux			= 0
	hpb_1.Position			= ll_tot_porc
	st_porc.text				= string(ll_tot_porc)+" %"
	for ll_indi=1 to ll_tot_reg
		ls_tipo_cob			= dw_lista.getitemstring(ll_indi,'tipo_cob')
		ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
		ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
		if ls_tipo_cob ='NB' or  ls_tipo_cob ='NC' or ls_tipo_mov='Z' then
			ll_monto			= ( -1 *  ll_monto )
		end if
		dw_lista.setitem(ll_indi,'c_monto_final',ll_monto)
	next
	dw_lista.accepttext()
	st_fondo.visible			= false
	hpb_1.visible 			= false
	st_porc.visible 			= false
end if
dw_lista.object.t_parque.text	= gs_conexion
SetPointer(Arrow!)
end event

type hpb_1 from hprogressbar within w_detalle_ingresos_por_caja_fecha
boolean visible = false
integer x = 690
integer y = 840
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_detalle_ingresos_por_caja_fecha
boolean visible = false
integer x = 658
integer y = 736
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porc from statictext within w_detalle_ingresos_por_caja_fecha
boolean visible = false
integer x = 1262
integer y = 764
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_exportar from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 827
integer y = 1732
integer width = 265
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 1097
integer y = 1732
integer width = 265
integer height = 96
integer taborder = 40
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

type cb_ordenar from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 1367
integer y = 1732
integer width = 265
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
if dw_lista.rowcount() > 0 then
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if	
end event

type cb_imprimir from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 1637
integer y = 1732
integer width = 265
integer height = 96
integer taborder = 60
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

type cb_ctacte from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 37
integer y = 1732
integer width = 430
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'contrato')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
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
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato")
	END IF
end if
end event

type cb_cerrar from commandbutton within w_detalle_ingresos_por_caja_fecha
integer x = 2327
integer y = 1732
integer width = 306
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_ingresos_por_caja_fecha)
end event

type dw_lista from datawindow within w_detalle_ingresos_por_caja_fecha
integer x = 37
integer y = 32
integer width = 2597
integer height = 1664
integer taborder = 10
string dataobject = "dw_lista_detalle_ingresos_todas"
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

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event doubleclicked;if row>0 then
	cb_ctacte.triggerevent(clicked!)
end if
end event

