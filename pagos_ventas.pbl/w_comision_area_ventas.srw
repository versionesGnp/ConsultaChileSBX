forward
global type w_comision_area_ventas from window
end type
type cb_filtrar from commandbutton within w_comision_area_ventas
end type
type rb_aumento from radiobutton within w_comision_area_ventas
end type
type cb_ordenar from commandbutton within w_comision_area_ventas
end type
type cb_resumen_comi from commandbutton within w_comision_area_ventas
end type
type rb_liberador from radiobutton within w_comision_area_ventas
end type
type rb_promesa from radiobutton within w_comision_area_ventas
end type
type em_cod from editmask within w_comision_area_ventas
end type
type rb_jefe from radiobutton within w_comision_area_ventas
end type
type rb_super from radiobutton within w_comision_area_ventas
end type
type rb_agte from radiobutton within w_comision_area_ventas
end type
type cb_pagos from commandbutton within w_comision_area_ventas
end type
type st_rut from statictext within w_comision_area_ventas
end type
type pb_buscar from picturebutton within w_comision_area_ventas
end type
type em_rut from editmask within w_comision_area_ventas
end type
type cb_limpiar from commandbutton within w_comision_area_ventas
end type
type cb_imprimir from commandbutton within w_comision_area_ventas
end type
type cb_cta_cte from commandbutton within w_comision_area_ventas
end type
type pb_aceptar from picturebutton within w_comision_area_ventas
end type
type p_termino from picture within w_comision_area_ventas
end type
type st_desde from statictext within w_comision_area_ventas
end type
type em_termino from editmask within w_comision_area_ventas
end type
type em_inicio from editmask within w_comision_area_ventas
end type
type st_hasta from statictext within w_comision_area_ventas
end type
type cb_cerrar from commandbutton within w_comision_area_ventas
end type
type dw_comision from datawindow within w_comision_area_ventas
end type
type gb_periodo from groupbox within w_comision_area_ventas
end type
type gb_detalle from groupbox within w_comision_area_ventas
end type
type gb_tipo_busqueda from groupbox within w_comision_area_ventas
end type
type st_cod from statictext within w_comision_area_ventas
end type
type gb_contrato from groupbox within w_comision_area_ventas
end type
type gb_1 from groupbox within w_comision_area_ventas
end type
end forward

global type w_comision_area_ventas from window
integer width = 4133
integer height = 2220
boolean titlebar = true
string title = "Comisión por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
rb_aumento rb_aumento
cb_ordenar cb_ordenar
cb_resumen_comi cb_resumen_comi
rb_liberador rb_liberador
rb_promesa rb_promesa
em_cod em_cod
rb_jefe rb_jefe
rb_super rb_super
rb_agte rb_agte
cb_pagos cb_pagos
st_rut st_rut
pb_buscar pb_buscar
em_rut em_rut
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
p_termino p_termino
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
cb_cerrar cb_cerrar
dw_comision dw_comision
gb_periodo gb_periodo
gb_detalle gb_detalle
gb_tipo_busqueda gb_tipo_busqueda
st_cod st_cod
gb_contrato gb_contrato
gb_1 gb_1
end type
global w_comision_area_ventas w_comision_area_ventas

type variables
long il_row
end variables

on w_comision_area_ventas.create
this.cb_filtrar=create cb_filtrar
this.rb_aumento=create rb_aumento
this.cb_ordenar=create cb_ordenar
this.cb_resumen_comi=create cb_resumen_comi
this.rb_liberador=create rb_liberador
this.rb_promesa=create rb_promesa
this.em_cod=create em_cod
this.rb_jefe=create rb_jefe
this.rb_super=create rb_super
this.rb_agte=create rb_agte
this.cb_pagos=create cb_pagos
this.st_rut=create st_rut
this.pb_buscar=create pb_buscar
this.em_rut=create em_rut
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.cb_cerrar=create cb_cerrar
this.dw_comision=create dw_comision
this.gb_periodo=create gb_periodo
this.gb_detalle=create gb_detalle
this.gb_tipo_busqueda=create gb_tipo_busqueda
this.st_cod=create st_cod
this.gb_contrato=create gb_contrato
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar,&
this.rb_aumento,&
this.cb_ordenar,&
this.cb_resumen_comi,&
this.rb_liberador,&
this.rb_promesa,&
this.em_cod,&
this.rb_jefe,&
this.rb_super,&
this.rb_agte,&
this.cb_pagos,&
this.st_rut,&
this.pb_buscar,&
this.em_rut,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.p_termino,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.cb_cerrar,&
this.dw_comision,&
this.gb_periodo,&
this.gb_detalle,&
this.gb_tipo_busqueda,&
this.st_cod,&
this.gb_contrato,&
this.gb_1}
end on

on w_comision_area_ventas.destroy
destroy(this.cb_filtrar)
destroy(this.rb_aumento)
destroy(this.cb_ordenar)
destroy(this.cb_resumen_comi)
destroy(this.rb_liberador)
destroy(this.rb_promesa)
destroy(this.em_cod)
destroy(this.rb_jefe)
destroy(this.rb_super)
destroy(this.rb_agte)
destroy(this.cb_pagos)
destroy(this.st_rut)
destroy(this.pb_buscar)
destroy(this.em_rut)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.cb_cerrar)
destroy(this.dw_comision)
destroy(this.gb_periodo)
destroy(this.gb_detalle)
destroy(this.gb_tipo_busqueda)
destroy(this.st_cod)
destroy(this.gb_contrato)
destroy(this.gb_1)
end on

event open;string	ls_fecha_comi_ant
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ant,ll_ano_comi_ant
datetime	ldt_fecha_comi,ldt_fecha_comi_ant

gf_centrar(w_comision_area_ventas)
if gl_proceso >= 4 then
	if gs_user='MARCOS' then
		cb_filtrar.visible				= true
	end if
	
	dw_comision.settransobject(sqlca)
	SELECT	MAX("RES_COMI"."FECHA") 
	INTO		:ldt_fecha_comi  
	FROM 		"RES_COMI"  
	WHERE		(	"COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '066' OR "COD_CONTABLE" = '067' OR "COD_CONTABLE" = '068' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090') 
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_comi) then
			em_termino.text			= string(ldt_fecha_comi,'dd/mm/yyyy')
			ll_mes_comi					= month(date(ldt_fecha_comi))
			ll_ano_comi					= year(date(ldt_fecha_comi))
			if ll_mes_comi = 1 then
				ll_mes_comi_ant 		= ll_mes_comi + 11
				ll_ano_comi_ant 		= ll_ano_comi - 1
				ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
				em_inicio.text			= string(ls_fecha_comi_ant)
				ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
			else
				ll_mes_comi_ant 		= ll_mes_comi - 1
				ll_ano_comi_ant 		= ll_ano_comi
				ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
				em_inicio.text			= string(ls_fecha_comi_ant)
				ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
			end if
		end if
	end if
	rb_promesa.triggerevent(clicked!)
else
	messagebox("Advertencia","Usuario no Autorizado")
	close(w_comision_area_ventas)
end if
end event

type cb_filtrar from commandbutton within w_comision_area_ventas
boolean visible = false
integer x = 1413
integer y = 1956
integer width = 238
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
dw_comision.SETfilter(NULO)
dw_comision.filter()
end event

type rb_aumento from radiobutton within w_comision_area_ventas
integer x = 1947
integer y = 92
integer width = 535
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Aumento Capac."
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type cb_ordenar from commandbutton within w_comision_area_ventas
boolean visible = false
integer x = 928
integer y = 2088
integer width = 247
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_comision.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_comision.SETSORT(NULO)
	dw_comision.SORT()
end if
end event

type cb_resumen_comi from commandbutton within w_comision_area_ventas
integer x = 50
integer y = 1952
integer width = 517
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen Comisiones"
end type

event clicked;string	ls_string,ls_cod_contable
datetime	ldt_fecha_term,ldt_fecha_comi

if dw_comision.rowcount() > 0 then
	ldt_fecha_term								= datetime(date(em_termino.text),time('00:00:00'))
	SELECT	MAX("RES_COMI"."FECHA") 
	INTO		:ldt_fecha_comi  
	FROM 		"RES_COMI"  
	WHERE		"RES_COMI"."FECHA" = :ldt_fecha_term AND
				(	"RES_COMI"."COD_CONTABLE" = '022' OR
					"RES_COMI"."COD_CONTABLE" = '023' OR
					"RES_COMI"."COD_CONTABLE" = '036' OR
					"RES_COMI"."COD_CONTABLE" = '037' OR
					"RES_COMI"."COD_CONTABLE" = '066' OR
					"RES_COMI"."COD_CONTABLE" = '067' OR
					"RES_COMI"."COD_CONTABLE" = '068' OR
					"RES_COMI"."COD_CONTABLE" = '089' OR
					"RES_COMI"."COD_CONTABLE" = '090')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_comi) then
			ls_string		= string(ldt_fecha_comi,'dd/mm/yyyy')
			OpenWithParm(w_comision_resumen_ventas, ls_string)
		else
			messagebox('Advertencia','No Existe Proceso de Comisiones Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
		end if
	end if
end if


















	


end event

type rb_liberador from radiobutton within w_comision_area_ventas
integer x = 1595
integer y = 92
integer width = 329
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Liberador"
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type rb_promesa from radiobutton within w_comision_area_ventas
integer x = 1266
integer y = 92
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Promesa"
boolean checked = true
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type em_cod from editmask within w_comision_area_ventas
integer x = 2743
integer y = 1960
integer width = 306
integer height = 88
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!"
end type

event getfocus;em_rut.text				= ''
em_cod.text				= ''
end event

event modified;if string(em_cod.text)<>'' then pb_buscar.triggerevent(clicked!)
end event

type rb_jefe from radiobutton within w_comision_area_ventas
integer x = 3639
integer y = 92
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe Ventas"
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type rb_super from radiobutton within w_comision_area_ventas
integer x = 3223
integer y = 92
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Supervisor"
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type rb_agte from radiobutton within w_comision_area_ventas
integer x = 2885
integer y = 92
integer width = 293
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
boolean checked = true
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''
pb_aceptar.triggerevent(clicked!)
end event

type cb_pagos from commandbutton within w_comision_area_ventas
integer x = 992
integer y = 1952
integer width = 357
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pagos &Ventas"
end type

event clicked;string	ls_base,ls_serie,ls_string
double		ldb_numero

dw_comision.accepttext()
if dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'res_comi_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'res_comi_contrato')
	
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
		ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
		if isvalid(w_rescomi_ventas) then close(w_rescomi_ventas)
		OpenWithParm (w_rescomi_ventas,ls_string)
	end if
end if
end event

type st_rut from statictext within w_comision_area_ventas
integer x = 3058
integer y = 1976
integer width = 137
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut:"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_comision_area_ventas
boolean visible = false
integer x = 4315
integer y = 1808
integer width = 137
integer height = 116
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;string	ls_filtro,ls_codigo
long		ll_tot_reg,ll_tot_fila,ll_rut
datetime	ldt_fecha_term,ldt_fecha_comi

ldt_fecha_term								= datetime(date(em_termino.text),time('00:00:00'))
SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		"RES_COMI"."FECHA" = :ldt_fecha_term AND
			(	"RES_COMI"."COD_CONTABLE" = '022' OR
				"RES_COMI"."COD_CONTABLE" = '023' OR
				"RES_COMI"."COD_CONTABLE" = '036' OR
				"RES_COMI"."COD_CONTABLE" = '037' OR
				"RES_COMI"."COD_CONTABLE" = '066' OR
				"RES_COMI"."COD_CONTABLE" = '067' OR
				"RES_COMI"."COD_CONTABLE" = '068' OR
				"RES_COMI"."COD_CONTABLE" = '069' OR
				"RES_COMI"."COD_CONTABLE" = '070' OR
				"RES_COMI"."COD_CONTABLE" = '071' OR
				"RES_COMI"."COD_CONTABLE" = '072' OR
				"RES_COMI"."COD_CONTABLE" = '076' OR
				"RES_COMI"."COD_CONTABLE" = '077' OR
				"RES_COMI"."COD_CONTABLE" = '089' OR
				"RES_COMI"."COD_CONTABLE" = '090' OR
				"RES_COMI"."COD_CONTABLE" = '020' )
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_comi) then
		if (dw_comision.dataobject='dw_comisiones_vtas_agtes_promesa' or dw_comision.dataobject='dw_comisiones_vtas_agtes_liberador') and dw_comision.rowcount() > 0 then
			if string(em_cod.text)<>'' then
				ls_codigo							= string(em_cod.text)
				ls_filtro 							= "agentes_cod_age = '"+ls_codigo+"'"
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			elseif long(em_rut.text)>0 then
				ll_rut								= long(em_rut.text)
				ls_filtro 							= "agentes_rut = "+string(ll_rut)
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			end if
		elseif (dw_comision.dataobject='dw_comisiones_vtas_sup_promesa' or dw_comision.dataobject='dw_comisiones_vtas_sup_liberador') and dw_comision.rowcount() > 0 then
			if string(em_cod.text)<>'' then
				ls_codigo							= string(em_cod.text)
				ls_filtro 							= "supervisor_cod_sup = '"+ls_codigo+"'"
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			elseif long(em_rut.text)>0 then
				ll_rut								= long(em_rut.text)
				ls_filtro 							= "supervisor_rut = "+string(ll_rut)
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			end if
		elseif (dw_comision.dataobject='dw_comisiones_vtas_jefe_promesa' or dw_comision.dataobject='dw_comisiones_vtas_jefe_liberador') and dw_comision.rowcount() > 0 then
			if string(em_cod.text)<>'' then
				ls_codigo							= string(em_cod.text)
				ls_filtro 							= "jefe_ventas_jefe_ventas = '"+ls_codigo+"'"
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			elseif long(em_rut.text)>0 then
				ll_rut								= long(em_rut.text)
				ls_filtro 							= "jefe_ventas_rut = "+string(ll_rut)
				dw_comision.SetFilter(ls_filtro)
				dw_comision.Filter( )
				dw_comision.GroupCalc()
				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_tot_fila							= dw_comision.rowcount()
				if ll_tot_fila=0 then
					messagebox('Advertencia','No Registra Comisiones a Pago Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
				end if
			end if
		end if
	else
		messagebox('Advertencia','No Existe Proceso de Comisiones Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
	end if
end if
		
end event

type em_rut from editmask within w_comision_area_ventas
integer x = 3214
integer y = 1960
integer width = 416
integer height = 88
integer taborder = 130
integer textsize = -9
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

event getfocus;em_cod.text				= ''
em_rut.text				= ''
end event

event modified;if long(em_rut.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type cb_limpiar from commandbutton within w_comision_area_ventas
integer x = 2002
integer y = 1952
integer width = 247
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_comision.reset()
em_cod.text				= ''
em_rut.text				= ''

end event

type cb_imprimir from commandbutton within w_comision_area_ventas
integer x = 1751
integer y = 1952
integer width = 247
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_comision.rowcount() > 0 then f_Print( dw_comision )
end event

type cb_cta_cte from commandbutton within w_comision_area_ventas
integer x = 571
integer y = 1952
integer width = 416
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if dw_comision.rowcount() > 0 then
	if il_row>0 then
		gs_base						= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_comision.getitemstring(il_row,'res_comi_serie')
		gi_numero 					= dw_comision.getitemnumber(il_row,'res_comi_contrato')
		gi_rut						= dw_comision.getitemnumber(il_row,'cadena_rut')
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

type pb_aceptar from picturebutton within w_comision_area_ventas
boolean visible = false
integer x = 2592
integer y = 60
integer width = 137
integer height = 116
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long		ll_tot_reg
datetime	ldt_fecha_term,ldt_fecha_comi

ldt_fecha_term								= datetime(date(em_termino.text),time('00:00:00'))
SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		"RES_COMI"."FECHA" = :ldt_fecha_term AND
			(	"COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '066' OR "COD_CONTABLE" = '067' OR &
				"COD_CONTABLE" = '068' OR "COD_CONTABLE" = '069' OR "COD_CONTABLE" = '070' OR "COD_CONTABLE" = '071' OR "COD_CONTABLE" = '072' OR "COD_CONTABLE" = '076' OR &
				"COD_CONTABLE" = '077' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090' OR "COD_CONTABLE" = '020' OR "COD_CONTABLE" = '050' OR "COD_CONTABLE" = '028' OR "COD_CONTABLE" = '053')
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_comi) then
		if rb_agte.checked = true and rb_promesa.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_agtes_promesa'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_agte.checked = true and rb_liberador.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_agtes_liberador'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_agte.checked = true and rb_aumento.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_agtes_aumento' //nuevo
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_super.checked = true and rb_promesa.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_sup_promesa'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_super.checked = true and rb_liberador.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_sup_liberador'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_super.checked = true and rb_aumento.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_sup_aumento' //nuevo
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)	
		elseif rb_jefe.checked = true and rb_promesa.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_jefe_promesa'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_jefe.checked = true and rb_liberador.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_jefe_liberador'
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		elseif rb_jefe.checked = true and rb_aumento.checked = true then
			dw_comision.dataobject				= 'dw_comisiones_vtas_jefe_aumento' //nuevo
			dw_comision.settransobject(sqlca)
			dw_comision.object.usuario.text	= gs_user
			ll_tot_reg								= dw_comision.retrieve(ldt_fecha_term)
		end if
	else
		messagebox('Advertencia','No Existe Proceso de Comisiones Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
	end if
end if
end event

type p_termino from picture within w_comision_area_ventas
integer x = 1070
integer y = 76
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,ls_fecha_comi_ant
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ant,ll_ano_comi_ant
datetime	ldt_fecha_comi,ldt_fecha_comi_ant

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
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
dw_comision.reset()

ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(ldt_fecha_comi))
	ll_ano_comi					= year(date(ldt_fecha_comi))
	if ll_mes_comi = 1 then
		ll_mes_comi_ant 		= ll_mes_comi + 11
		ll_ano_comi_ant 		= ll_ano_comi - 1
		ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
		em_inicio.text			= string(ls_fecha_comi_ant)
		ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ant 		= ll_mes_comi - 1
		ll_ano_comi_ant 		= ll_ano_comi
		ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
		em_inicio.text			= string(ls_fecha_comi_ant)
		ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if
end event

type st_desde from statictext within w_comision_area_ventas
integer x = 82
integer y = 92
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

type em_termino from editmask within w_comision_area_ventas
integer x = 745
integer y = 80
integer width = 320
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

event modified;string	ls_fecha_comi_ini
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ini,ll_ano_comi_ini
datetime	ldt_fecha_comi,ldt_fecha_comi_ini

dw_comision.reset()


ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano_comi					= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	
	if ll_mes_comi = 1 then
		ll_mes_comi_ini 		= ll_mes_comi + 11
		ll_ano_comi_ini 		= ll_ano_comi - 1
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ini 		= ll_mes_comi - 1
		ll_ano_comi_ini 		= ll_ano_comi
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if

end event

type em_inicio from editmask within w_comision_area_ventas
integer x = 247
integer y = 80
integer width = 320
integer height = 80
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

type st_hasta from statictext within w_comision_area_ventas
integer x = 594
integer y = 88
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

type cb_cerrar from commandbutton within w_comision_area_ventas
integer x = 3730
integer y = 1936
integer width = 334
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_area_ventas)
end event

type dw_comision from datawindow within w_comision_area_ventas
integer x = 50
integer y = 204
integer width = 4014
integer height = 1688
integer taborder = 40
string title = "none"
string dataobject = "dw_comisiones_vtas_jefe_aumento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

type gb_periodo from groupbox within w_comision_area_ventas
integer x = 50
integer y = 16
integer width = 1129
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type gb_detalle from groupbox within w_comision_area_ventas
integer x = 2821
integer y = 16
integer width = 1243
integer height = 168
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle:"
end type

type gb_tipo_busqueda from groupbox within w_comision_area_ventas
integer x = 1719
integer y = 1900
integer width = 571
integer height = 164
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_cod from statictext within w_comision_area_ventas
integer x = 2528
integer y = 1976
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_contrato from groupbox within w_comision_area_ventas
integer x = 1216
integer y = 16
integer width = 1280
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Tipo Comisión"
end type

type gb_1 from groupbox within w_comision_area_ventas
integer x = 2510
integer y = 1900
integer width = 1152
integer height = 164
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Busqueda"
end type

