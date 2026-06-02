forward
global type w_atencion_cliente_informe from window
end type
type cb_exportar from commandbutton within w_atencion_cliente_informe
end type
type cb_filtrar from commandbutton within w_atencion_cliente_informe
end type
type cb_ordenar from commandbutton within w_atencion_cliente_informe
end type
type cb_cta_cte from commandbutton within w_atencion_cliente_informe
end type
type pb_aceptar from picturebutton within w_atencion_cliente_informe
end type
type p_termino from picture within w_atencion_cliente_informe
end type
type st_desde from statictext within w_atencion_cliente_informe
end type
type em_termino from editmask within w_atencion_cliente_informe
end type
type em_inicio from editmask within w_atencion_cliente_informe
end type
type st_hasta from statictext within w_atencion_cliente_informe
end type
type em_ctto from editmask within w_atencion_cliente_informe
end type
type pb_buscar from picturebutton within w_atencion_cliente_informe
end type
type st_promesa from statictext within w_atencion_cliente_informe
end type
type cb_cerrar from commandbutton within w_atencion_cliente_informe
end type
type cb_imprimir from commandbutton within w_atencion_cliente_informe
end type
type dw_lista from datawindow within w_atencion_cliente_informe
end type
type gb_periodo from groupbox within w_atencion_cliente_informe
end type
type gb_3 from groupbox within w_atencion_cliente_informe
end type
end forward

global type w_atencion_cliente_informe from window
integer width = 3497
integer height = 2248
boolean titlebar = true
string title = "Comisiones Compartidas"
boolean controlmenu = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
p_termino p_termino
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
em_ctto em_ctto
pb_buscar pb_buscar
st_promesa st_promesa
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_periodo gb_periodo
gb_3 gb_3
end type
global w_atencion_cliente_informe w_atencion_cliente_informe

type variables
string	is_opcion,is_base,is_serie,is_orig_venta,MenuHabilitado
long 		il_row,il_sw_pasa=0
end variables

on w_atencion_cliente_informe.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.st_promesa=create st_promesa
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_periodo=create gb_periodo
this.gb_3=create gb_3
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.p_termino,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.em_ctto,&
this.pb_buscar,&
this.st_promesa,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_periodo,&
this.gb_3}
end on

on w_atencion_cliente_informe.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.st_promesa)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_periodo)
destroy(this.gb_3)
end on

event open;string	ls_fecha_ini
long		ll_dia,ll_mes,ll_ano
datetime	ldt_fecha_ini,ldt_fecha_fin

connect using Trans_1;
gf_centrar(w_atencion_cliente_informe)
if gl_proceso>=4 then
	dw_lista.settransobject(sqlca)
	ldt_fecha_fin								= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
	if not isnull(ldt_fecha_fin) then
		ll_dia									= day(date(ldt_fecha_fin))
		ll_mes									= month(date(ldt_fecha_fin))
		ll_ano									= year(date(ldt_fecha_fin))
		em_inicio.text							= '01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
		ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
		em_termino.text						= string(ldt_fecha_fin,'dd/mm/yyyy')
	else
		ll_dia									= day(date(gdt_fec_sistema))
		ll_mes									= month(date(gdt_fec_sistema))
		ll_ano									= year(date(gdt_fec_sistema))
		em_inicio.text							= '01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
		ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
		em_termino.text						= string(ll_dia,'00')+'/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
		ldt_fecha_fin							= datetime(date(em_termino.text),time('00:00:00'))
	end if
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_atencion_cliente_informe)
end if


end event

event close;disconnect using Trans_1;
end event

type cb_exportar from commandbutton within w_atencion_cliente_informe
integer x = 1234
integer y = 2000
integer width = 238
integer height = 92
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
dw_paso				= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_atencion_cliente_informe
integer x = 1477
integer y = 2000
integer width = 238
integer height = 92
integer taborder = 50
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

type cb_ordenar from commandbutton within w_atencion_cliente_informe
integer x = 1719
integer y = 2000
integer width = 238
integer height = 92
integer taborder = 50
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

type cb_cta_cte from commandbutton within w_atencion_cliente_informe
integer x = 37
integer y = 2000
integer width = 475
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_lista.rowcount() > 0 then
	if il_row>0 then
		gs_base						= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_lista.getitemstring(il_row,'oferta_v_serie')
		gi_numero 					= dw_lista.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut						= dw_lista.getitemnumber(il_row,'cliente_rut')
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
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
		END CHOOSE
	end if
end if
end event

type pb_aceptar from picturebutton within w_atencion_cliente_informe
integer x = 1230
integer y = 52
integer width = 128
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_base,ls_serie,ls_age_1,ls_age_2,ls_asig_canal,ls_canal_2
long		ll_tot_reg,ll_indi,ll_count,ll_folio
datetime	ldt_fecha_ini,ldt_fecha_fin
double	ldb_numero,ldb_pie_pact

dw_lista.reset()
ldt_fecha_ini								= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin								= datetime(date(em_termino.text),time('00:00:00'))
ll_tot_reg									= dw_lista.retrieve(ldt_fecha_ini,ldt_fecha_fin)
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Datos")
else
	dw_lista.object.usuario.text		= gs_user
	for ll_indi = 1 to ll_tot_reg
		ls_base								= dw_lista.getitemstring(ll_indi,'cadena_codigo')
		ls_serie								= dw_lista.getitemstring(ll_indi,'oferta_v_serie')
		ldb_numero							= dw_lista.getitemnumber(ll_indi,'oferta_v_nro_oferta')
		ls_age_1								= dw_lista.getitemstring(ll_indi,'oferta_v_cod_age')
		ll_folio								= dw_lista.getitemnumber(ll_indi,'funeraria_pago_comision_folio')
		ls_age_2								= dw_lista.getitemstring(ll_indi,'comision_compartida_cod_age_2')
		ll_count								= 0
		SELECT	"AGENTES"."CANAL"  
    	INTO 		:ls_canal_2  
    	FROM 		"AGENTES"  
   	WHERE 	"AGENTES"."COD_AGE" = :ls_age_1
		USING		sqlca;
		if sqlca.sqlcode=0 then
		end if
		if ll_folio>0 and (ls_age_2='' or isnull(ls_age_2)) then
			ls_asig_canal					= 'C.Funer'
		elseif (isnull(ll_folio) or ll_folio=0 ) and (ls_age_2<>'' or not isnull(ls_age_2)) then
			ls_asig_canal					= 'C.Compar'
		else
			if ls_canal_2='NF' then
				ls_asig_canal				= 'C.Dir.NF'
			else
				ls_asig_canal				= 'C.Dir.NI'
			end if
		end if
		dw_lista.setitem(ll_indi,"c_origen_venta",ls_asig_canal)
		DECLARE x1 CURSOR FOR
		SELECT	"DETALLE_PAGO_PIE"."MONTO_PIE_PAGADO_UF"  
    	FROM		"DETALLE_PAGO_PIE"  
   	WHERE		( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
         		( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
         		( "DETALLE_PAGO_PIE"."NUMERO" = :ldb_numero )
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ldb_pie_pact;
				if ldb_pie_pact > 0 and not isnull(ldb_pie_pact) then
					ll_count++
					if ll_count=1 then
						dw_lista.setitem(ll_indi,"c_pie_1",ldb_pie_pact)
					elseif ll_count=2 then
						dw_lista.setitem(ll_indi,"c_pie_2",ldb_pie_pact)
					elseif ll_count=3 then
						dw_lista.setitem(ll_indi,"c_pie_3",ldb_pie_pact)
					elseif ll_count=4 then
						dw_lista.setitem(ll_indi,"c_pie_4",ldb_pie_pact)
					end if
				end if
				setnull(ldb_pie_pact)
			LOOP
		end if
		close x1;
	next
end if
end event

type p_termino from picture within w_atencion_cliente_informe
integer x = 1106
integer y = 60
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,ls_fecha_ini
long		ll_mes,ll_ano
datetime	ldt_fecha_fin,ldt_fecha_ini

dw_lista.reset()
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF

ldt_fecha_fin						= datetime(date(em_termino.text),time('00:00:00'))
ll_mes								= month(date(ldt_fecha_fin))
ll_ano								= year(date(ldt_fecha_fin))

ls_fecha_ini						= '01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
em_inicio.text						= string(ls_fecha_ini)
ldt_fecha_ini						= datetime(date(em_inicio.text),time('00:00:00'))

end event

type st_desde from statictext within w_atencion_cliente_informe
integer x = 78
integer y = 72
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_atencion_cliente_informe
integer x = 768
integer y = 64
integer width = 334
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type em_inicio from editmask within w_atencion_cliente_informe
integer x = 247
integer y = 64
integer width = 334
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_atencion_cliente_informe
integer x = 622
integer y = 72
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_ctto from editmask within w_atencion_cliente_informe
integer x = 2665
integer y = 2000
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_atencion_cliente_informe
integer x = 3013
integer y = 2000
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string
double	ldb_numero

ldb_numero								= double(em_ctto.text)
ll_tot_reg								= dw_lista.rowcount()
st_promesa.text 						= 'Nº Promesa'
if dw_lista.rowcount() > 0 then
	ls_string							= "oferta_v_nro_oferta = "+string(ldb_numero)
end if
if ldb_numero>0 and ll_tot_reg>0 then
	ll_fila 								= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if
end event

type st_promesa from statictext within w_atencion_cliente_informe
integer x = 2345
integer y = 2016
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_atencion_cliente_informe
integer x = 3154
integer y = 2000
integer width = 274
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_atencion_cliente_informe)
end event

type cb_imprimir from commandbutton within w_atencion_cliente_informe
integer x = 2034
integer y = 2000
integer width = 238
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

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_atencion_cliente_informe
integer x = 37
integer y = 180
integer width = 3406
integer height = 1780
integer taborder = 40
string title = "none"
string dataobject = "dw_atencion_cliente_informe"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_periodo from groupbox within w_atencion_cliente_informe
integer x = 41
integer y = 8
integer width = 1175
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type gb_3 from groupbox within w_atencion_cliente_informe
integer x = 1211
integer y = 1952
integer width = 1083
integer height = 164
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

