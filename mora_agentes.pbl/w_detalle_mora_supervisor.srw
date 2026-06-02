forward
global type w_detalle_mora_supervisor from window
end type
type cb_ordenar from commandbutton within w_detalle_mora_supervisor
end type
type cb_filtrar from commandbutton within w_detalle_mora_supervisor
end type
type cb_exportar from commandbutton within w_detalle_mora_supervisor
end type
type rb_vigente_dia from radiobutton within w_detalle_mora_supervisor
end type
type rb_vigente_uno from radiobutton within w_detalle_mora_supervisor
end type
type rb_vigente_dos from radiobutton within w_detalle_mora_supervisor
end type
type rb_vigente_3_mas from radiobutton within w_detalle_mora_supervisor
end type
type rb_todos from radiobutton within w_detalle_mora_supervisor
end type
type rb_vigente_mora from radiobutton within w_detalle_mora_supervisor
end type
type cb_cta_cte from commandbutton within w_detalle_mora_supervisor
end type
type cb_imprimir from commandbutton within w_detalle_mora_supervisor
end type
type cb_cerrar from commandbutton within w_detalle_mora_supervisor
end type
type dw_listado from datawindow within w_detalle_mora_supervisor
end type
type gb_1 from groupbox within w_detalle_mora_supervisor
end type
type gb_3 from groupbox within w_detalle_mora_supervisor
end type
end forward

global type w_detalle_mora_supervisor from window
integer width = 4475
integer height = 2512
boolean titlebar = true
string title = "Detalle Cartera Morosa"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
rb_vigente_dia rb_vigente_dia
rb_vigente_uno rb_vigente_uno
rb_vigente_dos rb_vigente_dos
rb_vigente_3_mas rb_vigente_3_mas
rb_todos rb_todos
rb_vigente_mora rb_vigente_mora
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_listado dw_listado
gb_1 gb_1
gb_3 gb_3
end type
global w_detalle_mora_supervisor w_detalle_mora_supervisor

type variables
Long	il_mes,il_ano,il_row
end variables

on w_detalle_mora_supervisor.create
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.rb_vigente_dia=create rb_vigente_dia
this.rb_vigente_uno=create rb_vigente_uno
this.rb_vigente_dos=create rb_vigente_dos
this.rb_vigente_3_mas=create rb_vigente_3_mas
this.rb_todos=create rb_todos
this.rb_vigente_mora=create rb_vigente_mora
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_listado=create dw_listado
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.rb_vigente_dia,&
this.rb_vigente_uno,&
this.rb_vigente_dos,&
this.rb_vigente_3_mas,&
this.rb_todos,&
this.rb_vigente_mora,&
this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_listado,&
this.gb_1,&
this.gb_3}
end on

on w_detalle_mora_supervisor.destroy
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.rb_vigente_dia)
destroy(this.rb_vigente_uno)
destroy(this.rb_vigente_dos)
destroy(this.rb_vigente_3_mas)
destroy(this.rb_todos)
destroy(this.rb_vigente_mora)
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_listado)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;string	ls_cod
long		ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

gf_centrar(w_detalle_mora_supervisor)
dw_listado.dataobject						= 'dw_ventas_x_supervisor'
dw_listado.settransobject(sqlca)
ls_cod											= substr(1,1,Message.StringParm)
ldt_fec_ini										= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ldt_fec_fin										= datetime(date(substr(1,3,Message.StringParm)),time('00:00:00'))
ll_tot_reg										= dw_listado.retrieve(ls_cod,ldt_fec_ini,ldt_fec_fin)
dw_listado.Object.usuario.text 			= gs_user

if ll_tot_reg=0 then
	messagebox("Advertencia","No registra dato")
	close(w_detalle_mora_supervisor)
end if
end event

type cb_ordenar from commandbutton within w_detalle_mora_supervisor
integer x = 2363
integer y = 2216
integer width = 270
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_listado.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.SORT()
end if
end event

type cb_filtrar from commandbutton within w_detalle_mora_supervisor
integer x = 2089
integer y = 2216
integer width = 270
integer height = 84
integer taborder = 60
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
dw_listado.SETfilter(NULO)
dw_listado.filter()
end event

type cb_exportar from commandbutton within w_detalle_mora_supervisor
integer x = 1815
integer y = 2216
integer width = 270
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type rb_vigente_dia from radiobutton within w_detalle_mora_supervisor
integer x = 329
integer y = 84
integer width = 224
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al día"
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred = 0"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta al día'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )
end event

type rb_vigente_uno from radiobutton within w_detalle_mora_supervisor
integer x = 905
integer y = 84
integer width = 457
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1 cuota en mora"
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred = 1"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta 1 cuota en mora'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )

end event

type rb_vigente_dos from radiobutton within w_detalle_mora_supervisor
integer x = 1381
integer y = 84
integer width = 485
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2 cuotas en mora"
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred = 2"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta 2 cuota en mora'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )
end event

type rb_vigente_3_mas from radiobutton within w_detalle_mora_supervisor
integer x = 1883
integer y = 84
integer width = 622
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "3 o más cuotas en mora"
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred >= 3"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta 3 o más cuota en mora'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )
end event

type rb_todos from radiobutton within w_detalle_mora_supervisor
integer x = 82
integer y = 84
integer width = 238
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred >= 0"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )


end event

type rb_vigente_mora from radiobutton within w_detalle_mora_supervisor
integer x = 581
integer y = 84
integer width = 315
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "En mora"
end type

event clicked;string DWfilter2

DWfilter2 = "cadena_mora_mora_cred >= 1"
dw_listado.object.titulo_t.text	= 'Contratos por Agente de Venta con cuotas en mora'
dw_listado.SetFilter(DWfilter2)
dw_listado.Filter( )

end event

type cb_cta_cte from commandbutton within w_detalle_mora_supervisor
integer x = 37
integer y = 2216
integer width = 471
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if il_row>0 and dw_listado.rowcount() > 0 then
	gi_numero 	= dw_listado.getitemnumber(il_row,'oferta_v_nro_oferta')
	gs_base		= dw_listado.getitemstring(il_row,'cadena_codigo')
	gs_serie		= dw_listado.getitemstring(il_row,'oferta_v_serie')
	gi_rut 		= dw_listado.GetItemNumber(il_row, "oferta_v_rut")
	SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
	INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
	FROM 		"CADENA",	"CLIENTE"  
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) AND  
			 ( "CADENA"."RUT" = :gi_rut ) )   
	USING		sqlca;
	CHOOSE CASE gs_base
		CASE "O" 	// Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" 	// Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" 	// Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" 	// Contrato ISA
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" 	// Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" 	// Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			Open(w_cuenta_corriente_funeraria)
	END CHOOSE
else
	messagebox("Advertencia","Debe Seleccionar Contrato ")
end if
end event

type cb_imprimir from commandbutton within w_detalle_mora_supervisor
integer x = 2729
integer y = 2216
integer width = 283
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Impimir"
end type

event clicked;if dw_listado.rowcount()>0 then
	f_Print( dw_listado )
end if
end event

type cb_cerrar from commandbutton within w_detalle_mora_supervisor
integer x = 4096
integer y = 2216
integer width = 293
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_mora_supervisor)
end event

type dw_listado from datawindow within w_detalle_mora_supervisor
integer x = 37
integer y = 188
integer width = 4352
integer height = 1988
integer taborder = 10
string title = "none"
string dataobject = "dw_ventas_x_supervisor"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_campo_ord
if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
else
	ls_columna	= dwo.name
	if dw_listado.rowcount() > 0 then
		if ls_columna='a_mora' then
			ls_campo_ord	= 'cadena_mora_mora_cred'
			dw_listado.Object.a_mora.border=5
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
			dw_listado.Object.cod_age_t.border=6
		elseif ls_columna='a_oferta_v_cta_pag_s' then
			ls_campo_ord	= 'oferta_v_cta_pag_s'
			dw_listado.Object.a_oferta_v_cta_pag_s.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
			dw_listado.Object.cod_age_t.border=6
		elseif ls_columna='a_oferta_v_fecha' then
			ls_campo_ord	= 'pago_oferta_fecha'
			dw_listado.Object.a_oferta_v_fecha.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
			dw_listado.Object.cod_age_t.border=6
		elseif ls_columna='a_cadena_mora_fecha_venc_cred' then
			ls_campo_ord	= 'cadena_mora_fecha_venc_cred'
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
			dw_listado.Object.cod_age_t.border=6
		elseif ls_columna='a_oferta_v_nro_oferta' then
			ls_campo_ord	= 'c_contrato'
			dw_listado.Object.a_oferta_v_nro_oferta.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
		elseif ls_columna='a_cliente_a_paterno' then
			ls_campo_ord	= 'c_nombre_det'
			dw_listado.Object.a_cliente_a_paterno.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.cod_age_t.border=6
		elseif ls_columna='cod_age_t' then
			ls_campo_ord	= 'oferta_v_cod_age'
			dw_listado.Object.cod_age_t.border=5
			dw_listado.Object.a_mora.border=6
			dw_listado.Object.a_oferta_v_cta_pag_s.border=6
			dw_listado.Object.a_oferta_v_fecha.border=6
			dw_listado.Object.a_cadena_mora_fecha_venc_cred.border=6
			dw_listado.Object.a_oferta_v_nro_oferta.border=6
			dw_listado.Object.a_cliente_a_paterno.border=6
		end if
		dw_listado.SETSORT(ls_campo_ord)
		dw_listado.SORT()
	end if
end if
this.accepttext()
end event

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_detalle_mora_supervisor
integer x = 41
integer y = 20
integer width = 2501
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuotas en mora"
end type

type gb_3 from groupbox within w_detalle_mora_supervisor
integer x = 1792
integer y = 2168
integer width = 1243
integer height = 156
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

