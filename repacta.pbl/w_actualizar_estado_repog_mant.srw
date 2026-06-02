forward
global type w_actualizar_estado_repog_mant from window
end type
type st_titulo from statictext within w_actualizar_estado_repog_mant
end type
type cb_marcar from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_exportar from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_ordenar from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_imprimir from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_filtrar from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_grabar from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_5 from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_ctacte_original from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_ctacte from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_pagos_pendientes from commandbutton within w_actualizar_estado_repog_mant
end type
type cb_cerrar from commandbutton within w_actualizar_estado_repog_mant
end type
type hpb_1 from hprogressbar within w_actualizar_estado_repog_mant
end type
type st_fondo from statictext within w_actualizar_estado_repog_mant
end type
type st_porc from statictext within w_actualizar_estado_repog_mant
end type
type dw_lista from datawindow within w_actualizar_estado_repog_mant
end type
type gb_1 from groupbox within w_actualizar_estado_repog_mant
end type
end forward

global type w_actualizar_estado_repog_mant from window
integer width = 3081
integer height = 1828
boolean titlebar = true
string title = "Actualizar Estado Reprogramación de Mantención"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_titulo st_titulo
cb_marcar cb_marcar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_grabar cb_grabar
cb_5 cb_5
cb_ctacte_original cb_ctacte_original
cb_ctacte cb_ctacte
cb_pagos_pendientes cb_pagos_pendientes
cb_cerrar cb_cerrar
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
dw_lista dw_lista
gb_1 gb_1
end type
global w_actualizar_estado_repog_mant w_actualizar_estado_repog_mant

type variables
Long		il_row
String	is_filtro,is_base
end variables

event open;Long	ll_indi,ll_tot_reg

is_base 	= Message.StringParm
gf_centrar(w_actualizar_estado_repog_mant)
connect using trans_1;
connect using trans_2;
if is_base='R' then
	w_actualizar_estado_repog_mant.title	= 'Actualizar Estado Reprogramación de Mantención'
	dw_lista.dataobject							= 'dw_actualizar_reprog_mant_canceladas'
	st_titulo.text										= ' Listado Reprogrmaciones de Mantención Saldo "0"'
	cb_ctacte.text									= 'C&ta.Ctte.Reprog.'
	cb_ctacte.visible								= true
	cb_ctacte_original.visible						= true
elseif is_base='O' then
	w_actualizar_estado_repog_mant.title	= 'Actualizar Estado Promesas'
	dw_lista.dataobject							= 'dw_actualizar_promesas_canceladas'
	st_titulo.text										= ' Listado Promesas Saldo "0"'
	cb_ctacte.text									= 'Cuen&ta Corriente'
	cb_ctacte.visible								= true
	cb_ctacte_original.visible						= false
elseif is_base='L' then
	w_actualizar_estado_repog_mant.title	= 'Actualizar Estado Anexos Liberadores'
	dw_lista.dataobject							= 'dw_actualizar_anexo_lib_canceladas'
	st_titulo.text										= ' Listado Anexos Liberadores Saldo "0"'
	cb_ctacte.text									= 'Cuen&ta Corriente'
	cb_ctacte.visible								= true
	cb_ctacte_original.visible						= false
elseif is_base='P' then
	w_actualizar_estado_repog_mant.title	= 'Actualizar Estado Pagaré'
	dw_lista.dataobject							= 'dw_actualizar_pagare_canceladas'
	st_titulo.text										= ' Listado Pagaré Saldo "0"'
	cb_ctacte.text									= 'Cuen&ta Corriente'
	cb_ctacte.visible								= true
	cb_ctacte_original.visible						= false
end if
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	if is_base='R' then
		messagebox("Advertencia","No Registra Reprogramación de Mantención Vigentes con Saldo 0")
	elseif is_base='O' then
		messagebox("Advertencia","No Registra Promesas Vigentes con Saldo 0")
	elseif is_base='L' then
		messagebox("Advertencia","No Registra Anexo Liberadores Vigentes con Saldo 0")
	elseif is_base='P' then
		messagebox("Advertencia","No Registra Pagaré Vigentes con Saldo 0")
	end if
	cb_cerrar.triggerevent(clicked!)
else
	ll_tot_reg										= dw_lista.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'estado',1)
	next
	dw_lista.accepttext()
	st_fondo.visible								= false
	hpb_1.visible 									= false
	st_porc.visible 								= false
//	cb_pagos_pendientes.triggerevent(clicked!)
end if
end event

on w_actualizar_estado_repog_mant.create
this.st_titulo=create st_titulo
this.cb_marcar=create cb_marcar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_grabar=create cb_grabar
this.cb_5=create cb_5
this.cb_ctacte_original=create cb_ctacte_original
this.cb_ctacte=create cb_ctacte
this.cb_pagos_pendientes=create cb_pagos_pendientes
this.cb_cerrar=create cb_cerrar
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.st_titulo,&
this.cb_marcar,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_grabar,&
this.cb_5,&
this.cb_ctacte_original,&
this.cb_ctacte,&
this.cb_pagos_pendientes,&
this.cb_cerrar,&
this.hpb_1,&
this.st_fondo,&
this.st_porc,&
this.dw_lista,&
this.gb_1}
end on

on w_actualizar_estado_repog_mant.destroy
destroy(this.st_titulo)
destroy(this.cb_marcar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_grabar)
destroy(this.cb_5)
destroy(this.cb_ctacte_original)
destroy(this.cb_ctacte)
destroy(this.cb_pagos_pendientes)
destroy(this.cb_cerrar)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event close;disconnect using trans_1;
disconnect using trans_2;

end event

type st_titulo from statictext within w_actualizar_estado_repog_mant
integer x = 37
integer y = 212
integer width = 2990
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_marcar from commandbutton within w_actualizar_estado_repog_mant
integer x = 1147
integer y = 48
integer width = 626
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Marcar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_fila
String	ls_pagos

ll_tot_reg				= dw_lista.rowcount()
dw_lista.accepttext()
if ll_tot_reg>0 then
	ll_fila	= dw_lista.Find('pagos_pendientes = "N" or pagos_pendientes = "S" or pagos_pendientes = "M"', 1, dw_lista.RowCount())
	if ll_fila>0 then
		if cb_marcar.text = 'Marcar Todo' then
			for ll_indi=1 to ll_tot_reg
				ls_pagos		= dw_lista.getitemstring(ll_indi,'pagos_pendientes')
				if ls_pagos = 'N' then 
					dw_lista.setitem(ll_indi,'estado',0)
				end if
			next
			cb_marcar.text	= 'Desmarcar Todo'
		elseif cb_marcar.text = 'Desmarcar Todo' then
			for ll_indi=1 to ll_tot_reg
				ls_pagos		= dw_lista.getitemstring(ll_indi,'pagos_pendientes')
				if ls_pagos = 'N' then 
					dw_lista.setitem(ll_indi,'estado',1)
				end if
			next
			cb_marcar.text	= 'Marcar Todo'
		end if
		dw_lista.accepttext()
		dw_lista.scrolltorow(1)
	else
		messagebox("Advertencia","Antes de Marcar, debe Actualizar Pagos")
	end if
end if
end event

type cb_exportar from commandbutton within w_actualizar_estado_repog_mant
event ue_mousemove pbm_mousemove
integer x = 2464
integer y = 48
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

type cb_ordenar from commandbutton within w_actualizar_estado_repog_mant
event ue_mousemove pbm_dwnmousemove
integer x = 1961
integer y = 48
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

type cb_imprimir from commandbutton within w_actualizar_estado_repog_mant
event ue_mousemove pbm_mousemove
integer x = 2757
integer y = 48
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
end if
end event

type cb_filtrar from commandbutton within w_actualizar_estado_repog_mant
event ue_mousemove pbm_mousemove
integer x = 2213
integer y = 48
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

event clicked;string	ls_formula
long 		ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string 	ls_texto
setnull (is_filtro)
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
ls_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal		= len(ls_formula)
ll_posini			= Pos(ls_formula, "filter") + 8
ll_posfin			= len("~nfilter~n")
ls_texto				= mid(ls_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(ls_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto				= ll_posfin - ll_posini
ls_formula			= trim(mid(ls_formula,ll_posini,ll_resto))
if mid(ls_formula,1,2)='7;' then
	ls_formula		= ''
end if
dw_lista.SETfilter(ls_formula)
dw_lista.filter()
is_filtro	= ls_formula
end event

type cb_grabar from commandbutton within w_actualizar_estado_repog_mant
integer x = 37
integer y = 1572
integer width = 343
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg, ll_indi, ll_corr,ll_cantidad,ll_contar=0,ll_contar_up=0,ll_contar_insert=0,&
			ll_contar_br=0,ll_ctas_pactadas_original,ll_ctas_pactadas,ll_rut_cliente,ll_folio,&
			ll_correlativo,ll_cuotas_en_mora,ll_cta_pag_m,ll_tot_porc,ll_tot_porc_aux
String		ls_base,ls_serie,ls_base_original,ls_serie_original,ls_serie_asoc,ls_base_asoc
datetime	ldt_fecha
Double	ll_numero,ll_numero_original,ll_numero_asoc
SetPointer(HourGlass!)
if isnull(dw_lista.getitemstring(1,'pagos_pendientes')) or dw_lista.getitemstring(1,'pagos_pendientes')='' then
	messagebox("Advertencia","Antes de Grabar debe Actualizar Pagos Pendientes")
	cb_pagos_pendientes.setfocus()
else
	if is_base='O' or is_base='L' or is_base='P' then
		dw_lista.SETfilter('pagos_pendientes = "N" and estado=0 and cadena_estado = "V" ')
	elseif is_base='R' then
		dw_lista.SETfilter('pagos_pendientes = "N" and estado=0 and estado_pago = "V" ')
	end if
	dw_lista.filter()
	ll_tot_reg								= dw_lista.rowcount()
	ll_tot_porc								= 0
	ll_tot_porc_aux						= 0			
	hpb_1.Position							= ll_tot_porc
	if ll_tot_reg>0 then
		ldt_fecha							= datetime(date(gdt_fec_sistema),time('00:00:00'))
//		SELECT	COUNT("LOG_REPACTA_CANCELADAS"."CORRELATIVO")  
//		INTO 		:ll_folio
//		FROM 		"LOG_REPACTA_CANCELADAS"  
		SELECT	MAX("INGRESO"."FOLIO")  
		INTO 		:ll_folio  
		FROM 	"INGRESO"  
		WHERE 	"INGRESO"."TIPO_COB" = 'BR'  
		USING		sqlca;
		if ll_folio>0 then
			ll_folio ++
		else
			ll_folio								= 1
		end if
		st_fondo.visible							= true
		hpb_1.visible 							= true
		st_porc.visible 							= true
		for ll_indi=1 to ll_tot_reg
			if is_base='R' then
				ls_base							= dw_lista.getitemstring(ll_indi,'base')
				ls_serie							= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero						= dw_lista.getitemnumber(ll_indi,'numero')
				ll_corr							= dw_lista.getitemnumber(ll_indi,'correlativo')
				ll_ctas_pactadas_original		= dw_lista.getitemnumber(ll_indi,"cta_mora_original")
				ll_ctas_pactadas				= dw_lista.getitemnumber(ll_indi,"cuotas_pactadas")
				ls_base_original				= dw_lista.getitemstring(ll_indi,"base_original")
				ls_serie_original				= dw_lista.getitemstring(ll_indi,"serie_original")
				ll_numero_original				= dw_lista.getitemnumber(ll_indi,"numero_original")
				ll_rut_cliente					= dw_lista.getitemnumber(ll_indi,"rut_cliente")
				ll_cuotas_en_mora			= dw_lista.getitemnumber(ll_indi,'cuotas_en_mora')
				dw_lista.setitem(ll_indi,'estado_pago','C')
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'C'  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					ll_contar ++
					if ls_base_original='C' then
						ll_cantidad				= 0
						SELECT	"CONTRATO"."NRO_REPROG_MANT"
						INTO 		:ll_cantidad
						FROM 	"CONTRATO",   
									"CADENA"  
						WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
								 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
								 (("CONTRATO"."SERIE_C" = :ls_serie_original ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero_original ) AND  
								 ( "CADENA"."CODIGO" = :ls_base_original ) )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							if isnull(ll_cantidad) then ll_cantidad=0
							ll_cantidad ++
						end if
						UPDATE	"CONTRATO"  
						SET 		"NRO_REPROG_MANT" = :ll_cantidad,
									"ANEXO_REPACTA" = null,   
									"CTA_REPACTA" = null,
									"FECHA_REPROG_MANT" = :ldt_fecha
						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_original ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero_original )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							ll_contar_up ++
						end if
		
					elseif ls_base_original='O' then
						ll_cantidad				= 0
						SELECT	"OFERTA_V"."NRO_REPROG_MANT"
						INTO 		:ll_cantidad
						FROM 		"CADENA",   
									"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base_original ) AND  
								 ( "CADENA"."SERIE" = :ls_serie_original ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero_original ) )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							if isnull(ll_cantidad) then ll_cantidad=0
							ll_cantidad ++
						end if
						UPDATE	"OFERTA_V"  
						SET 		"NRO_REPROG_MANT" = :ll_cantidad,
									"ANEXO_REPACTA" = null,   
									"CTA_REPACTA" = null,
									"FECHA_REPROG_MANT" = :ldt_fecha
						WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_original ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_original )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							ll_contar_up ++
						end if
					end if
					SELECT	MAX("LOG_REPACTA_CANCELADAS"."CORRELATIVO")  
					INTO 		:ll_correlativo  
					FROM 		"LOG_REPACTA_CANCELADAS"  
					WHERE  ( "LOG_REPACTA_CANCELADAS"."BASE" = :ls_base ) AND  
							 ( "LOG_REPACTA_CANCELADAS"."SERIE" = :ls_serie ) AND  
							 ( "LOG_REPACTA_CANCELADAS"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if ll_correlativo>0 then
						ll_correlativo ++
					else
						ll_correlativo			= 1
					end if
					INSERT INTO	"LOG_REPACTA_CANCELADAS"
								(	"CORRELATIVO",		"BASE",		"SERIE",		"NUMERO",	"CUOTAS_PACTADAS_ORIGINAL",	"CUOTAS_PACTADAS",	"FECHA",		"TIPO_CLIENTE",	"BASE_CTTO_ORIGINAL",	"SERIE_CTTO_ORIGINAL",	"NUMERO_CTTO_ORIGINAL",	"RUT_CLIENTE",		"COD_PAGO_RECONOCIMIENTO",	"FOLIO_RECONOCIMIENTO" )  
					VALUES	( :ll_correlativo,	:ls_base,	:ls_serie,	:ll_numero,	:ll_ctas_pactadas_original,	:ll_ctas_pactadas,	:ldt_fecha,	:ll_rut_cliente,	:ls_base_original,		:ls_serie_original,		:ll_numero_original,		:ll_rut_cliente,	'BR',								:ll_folio )  
					USING		Trans_2;
					if Trans_2.sqlcode=0 then
						ll_contar_insert ++
					end if
					INSERT INTO	"INGRESO"  
								( "FOLIO",		"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",	"CUOTAS_PAG",			"SERIE",					"CONTRATO",				"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST",	"BASE",					"RUT",				"USUARIO",		"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",	"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",		"FECHA_DEPOSITO" )
					VALUES 	( :ll_folio,		'BR',				:ldt_fecha,			'F',					0,				:ll_cuotas_en_mora,		:ls_serie_original,		:ll_numero_original,		'CR',				null,			0,					'A',				:ls_base_original,		:ll_rut_cliente,		:gs_user,		null,			null,					null,						null,						null,			null,				null,				:ldt_fecha,		'0',						null,					null,										:ldt_fecha )  
					USING		Trans_2;
					if Trans_2.sqlcode=0 then
						ll_folio ++
						ll_contar_br ++
					else
						messagebox("error","Error al Grabar INGRESO "+Trans_2.sqlerrtext)
					end if
				else
					messagebox("Error Grabar","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
				end if
				
			elseif is_base='O' then
				ls_base							= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie							= dw_lista.getitemstring(ll_indi,'cadena_serie')
				ll_numero						= dw_lista.getitemnumber(ll_indi,'cadena_numero')
				ll_ctas_pactadas				= dw_lista.getitemnumber(ll_indi,"pago_oferta_nro_cuotas")
				ll_rut_cliente					= dw_lista.getitemnumber(ll_indi,"cadena_rut")
				ll_cuotas_en_mora				= dw_lista.getitemnumber(ll_indi,'cadena_mora_mora_cred')
				dw_lista.setitem(ll_indi,'cadena_estado','C')
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'C'  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_contar ++
					SELECT	MAX("LOG_PROMESAS_CANCELADAS"."CORRELATIVO")  
					INTO 		:ll_correlativo  
					FROM 		"LOG_PROMESAS_CANCELADAS"  
					WHERE  ( "LOG_PROMESAS_CANCELADAS"."BASE" = :ls_base ) AND  
							 ( "LOG_PROMESAS_CANCELADAS"."SERIE" = :ls_serie ) AND  
							 ( "LOG_PROMESAS_CANCELADAS"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if ll_correlativo>0 then
						ll_correlativo ++
					else
						ll_correlativo			= 1
					end if
					INSERT INTO "LOG_PROMESAS_CANCELADAS"  
								( "CORRELATIVO",		"BASE",		"SERIE",		"NUMERO",	"CUOTAS_PACTADAS",	"FECHA",		"RUT_CLIENTE" )  
					VALUES 	( :ll_correlativo,	:ls_base,	:ls_serie,	:ll_numero,	:ll_ctas_pactadas,	:ldt_fecha,	:ll_rut_cliente )  
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ll_contar_insert ++
					end if
				else
					messagebox("Error Grabar","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
				end if
				
			elseif is_base='P' then
				ls_base							= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie							= dw_lista.getitemstring(ll_indi,'cadena_serie')
				ll_numero						= dw_lista.getitemnumber(ll_indi,'cadena_numero')
				ll_ctas_pactadas				= dw_lista.getitemnumber(ll_indi,"pagare_plazo")
				ll_rut_cliente					= dw_lista.getitemnumber(ll_indi,"cadena_rut")
				ll_cuotas_en_mora				= dw_lista.getitemnumber(ll_indi,'cadena_mora_mora_cred')
				dw_lista.setitem(ll_indi,'cadena_estado','C')
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'C'  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_contar ++
					SELECT	"PAGARE"."SERIE",   
								"PAGARE"."NRO_OFERTA",   
								"PAGARE"."BASE"  
					INTO 		:ls_serie_asoc,   
								:ll_numero_asoc,   
								:ls_base_asoc  
					FROM 		"CADENA",   
								"PAGARE"  
					WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
							 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_base_asoc='C' then
							UPDATE	"CADENA"  
							SET 		"ESTADO" = 'C'  
							WHERE  ( "CADENA"."CODIGO" = :ls_base_asoc ) AND  
									 ( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero_asoc )  AND
									 ( "CADENA"."ESTADO" = 'V' )
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if

					SELECT	MAX("LOG_PAGARE_CANCELADAS"."CORRELATIVO")  
					INTO 		:ll_correlativo  
					FROM 		"LOG_PAGARE_CANCELADAS"  
					WHERE  ( "LOG_PAGARE_CANCELADAS"."BASE" = :ls_base ) AND  
							 ( "LOG_PAGARE_CANCELADAS"."SERIE" = :ls_serie ) AND  
							 ( "LOG_PAGARE_CANCELADAS"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if ll_correlativo>0 then
						ll_correlativo ++
					else
						ll_correlativo			= 1
					end if
					INSERT INTO "LOG_PAGARE_CANCELADAS"  
								( "CORRELATIVO",		"BASE",		"SERIE",		"NUMERO",	"CUOTAS_PACTADAS",	"FECHA",		"RUT_CLIENTE" )  
					VALUES 	( :ll_correlativo,	:ls_base,	:ls_serie,	:ll_numero,	:ll_ctas_pactadas,	:ldt_fecha,	:ll_rut_cliente )  
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ll_contar_insert ++
					end if
				else
					messagebox("Error Grabar","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
				end if
				
			elseif is_base='L' then
				ls_base							= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie							= dw_lista.getitemstring(ll_indi,'cadena_serie')
				ll_numero						= dw_lista.getitemnumber(ll_indi,'cadena_numero')
				ll_ctas_pactadas				= dw_lista.getitemnumber(ll_indi,"pago_liberador_nro_cuotas")
				ll_rut_cliente					= dw_lista.getitemnumber(ll_indi,"cadena_rut")
				ll_cuotas_en_mora				= dw_lista.getitemnumber(ll_indi,'cadena_mora_mora_cred')
				dw_lista.setitem(ll_indi,'cadena_estado','C')
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'C'  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_contar ++
					SELECT	MAX("LOG_ANEXO_LIB_CANCELADAS"."CORRELATIVO")  
					INTO 		:ll_correlativo  
					FROM 		"LOG_ANEXO_LIB_CANCELADAS"  
					WHERE  ( "LOG_ANEXO_LIB_CANCELADAS"."BASE" = :ls_base ) AND  
							 ( "LOG_ANEXO_LIB_CANCELADAS"."SERIE" = :ls_serie ) AND  
							 ( "LOG_ANEXO_LIB_CANCELADAS"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if ll_correlativo>0 then
						ll_correlativo ++
					else
						ll_correlativo			= 1
					end if
					INSERT INTO "LOG_ANEXO_LIB_CANCELADAS"  
								( "CORRELATIVO",		"BASE",		"SERIE",		"NUMERO",	"CUOTAS_PACTADAS",	"FECHA",		"RUT_CLIENTE" )  
					VALUES 	( :ll_correlativo,	:ls_base,	:ls_serie,	:ll_numero,	:ll_ctas_pactadas,	:ldt_fecha,	:ll_rut_cliente )  
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ll_contar_insert ++
					end if
				else
					messagebox("Error Grabar","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
				end if
			end if
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text				= string(ll_tot_porc)+" %"
				ll_tot_porc_aux			= ll_tot_porc
			end if
			ll_tot_porc						= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 				= ll_tot_porc
		next
		if is_base='R' then
			if ll_contar=ll_tot_reg and ll_contar_up=ll_tot_reg and ll_contar_insert=ll_tot_reg and &
				ll_contar_br=ll_tot_reg then
				commit using sqlca;
				commit using Trans_1;
				commit using Trans_2;
				if dw_lista.update() = 1 then
					commit;
					messagebox("Grabar","Grabación Exitosa")
				else
					rollback;
					messagebox("Error Grabar","Error Grabar REPACTA MANTENCION SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback using sqlca;
				rollback using Trans_1;
				rollback using Trans_2;
				if ll_contar <> ll_tot_reg then
					messagebox("Error Grabar","Error al Grabar Tabla de CADENA")
				elseif ll_contar_up <> ll_tot_reg then
					messagebox("Error Grabar","Error al Grabar Tabla de CONTRATOS")
				elseif ll_contar_insert <> ll_tot_reg then
					messagebox("Error Grabar","Error al Grabar Tabla LOG_REPACTA_CANCELADAS")
				elseif ll_contar_br <> ll_tot_reg then
					messagebox("Error Grabar","Error al Grabar Tabla INGRESO")
				end if
			end if
		elseif is_base='O' or is_base='L' or is_base='P' then
			if ll_contar=ll_tot_reg and ll_contar_insert=ll_tot_reg then
				commit using sqlca;
				commit using Trans_1;
				messagebox("Grabar","Grabación Exitosa")
			else
				rollback using sqlca;
				rollback using Trans_1;
				if ll_contar <> ll_tot_reg then
					messagebox("Error Grabar","Error al Grabar Tabla de CADENA")
				elseif ll_contar_insert <> ll_tot_reg then
					if is_base='O' then
						messagebox("Error Grabar","Error al Grabar Tabla LOG_PROMESAS_CANCELADAS")
					elseif is_base='L' then
						messagebox("Error Grabar","Error al Grabar Tabla LOG_ANEXO_LIB_CANCELADAS")
					elseif is_base='P' then
						messagebox("Error Grabar","Error al Grabar Tabla LOG_PAGARE_CANCELADAS")
					end if
				end if
			end if
		end if
	end if
	st_fondo.visible					= false
	hpb_1.visible 						= false
	st_porc.visible 					= false
	if not isnull(is_filtro) or is_filtro <> '' then	
		dw_lista.SETfilter(is_filtro)
	else
		dw_lista.SETfilter('')
	end if
	dw_lista.filter()
	dw_lista.scrolltorow(1)
end if
SetPointer(Arrow!)
end event

type cb_5 from commandbutton within w_actualizar_estado_repog_mant
integer x = 1957
integer y = 1572
integer width = 521
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Documentos"
end type

event clicked;if dw_lista.rowcount()>0 then
	if is_base='R' then
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'numero')
		gi_rut		= dw_lista.getitemnumber(il_row,'rut_cliente')
	elseif is_base='O' or is_base='L' then
		gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie		= dw_lista.getitemstring(il_row,'cadena_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'cadena_numero')
		gi_rut		= dw_lista.getitemnumber(il_row,'cadena_rut')
	end if
	if gi_rut>0 then
		SELECT	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"
		INTO 		:gl_cod_parque_cta,		:gs_estado,				:gs_dv,				:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno
		FROM 		"CADENA",   
					"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 ( "CADENA"."RUT" = :gi_rut  ) AND 
				 ( "CADENA"."CODIGO" = :gs_base ) AND 
				 ( "CADENA"."SERIE" = :gs_serie ) AND
				 ( "CADENA"."NUMERO" = :gi_numero )
		USING		SQLCA;
		if not isnull(gs_base) and gi_numero>0 then
			if isvalid(w_VER_CHEQUES) then close(w_VER_CHEQUES)
			Open(w_VER_CHEQUES)
		end if
	else
		messagebox("Advertencia","No Tiene Rut Cliente Asociado")
	end if
end if
end event

type cb_ctacte_original from commandbutton within w_actualizar_estado_repog_mant
integer x = 1161
integer y = 1572
integer width = 494
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta.Ctte.Ctto.Original"
end type

event clicked;string param

dw_lista.accepttext()
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'base_original')
	gs_serie		= dw_lista.getitemstring(il_row,'serie_original')
	gi_numero	= dw_lista.getitemnumber(il_row,'numero_original')
	gi_rut		= dw_lista.getitemnumber(il_row,'rut_cliente')
	param     	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
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

type cb_ctacte from commandbutton within w_actualizar_estado_repog_mant
integer x = 741
integer y = 1572
integer width = 416
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;string param

dw_lista.accepttext()
if il_row > 0 then
	if is_base='R' then
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'numero')
		gi_rut		= dw_lista.getitemnumber(il_row,'rut_cliente')
	elseif is_base='O' or is_base='L' or is_base='P' then
		gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie		= dw_lista.getitemstring(il_row,'cadena_serie')
		gi_numero	= dw_lista.getitemnumber(il_row,'cadena_numero')
		gi_rut		= dw_lista.getitemnumber(il_row,'cadena_rut')
	end if
	param     	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
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

type cb_pagos_pendientes from commandbutton within w_actualizar_estado_repog_mant
integer x = 37
integer y = 48
integer width = 928
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualiza Pagos Pendientes"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_corr,ll_count,ll_tot_porc,ll_tot_porc_aux,ll_saldo,ll_pasa
String	ls_base,ls_serie
Date		ld_fecha
Double	ll_numero
SetPointer(HourGlass!)
ld_fecha					= date(gdt_fec_sistema)
ll_tot_reg				= dw_lista.rowcount()
ll_tot_porc				= 0
ll_tot_porc_aux		= 0
hpb_1.Position			= ll_tot_porc
if ll_tot_reg>0 then
	st_fondo.visible	= true
	hpb_1.visible 		= true
	st_porc.visible 	= true
	for ll_indi=1 to ll_tot_reg
		ll_pasa			= 0
		if is_base='R' then
			ls_base		= dw_lista.getitemstring(ll_indi,'base')
			ls_serie		= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero	= dw_lista.getitemnumber(ll_indi,'numero')
			ll_corr		= dw_lista.getitemnumber(ll_indi,'correlativo')
			
		elseif is_base='O' or is_base='L' then
			ls_base		= dw_lista.getitemstring(ll_indi,'cadena_codigo')
			ls_serie		= dw_lista.getitemstring(ll_indi,'cadena_serie')
			ll_numero	= dw_lista.getitemnumber(ll_indi,'cadena_numero')
			// pendiente factura oferta
			SELECT	"FACTURA_OFERTA"."SALDO_TOTAL"  
			INTO 		:ll_saldo  
			FROM 		"FACTURA_OFERTA"  
			WHERE  ( "FACTURA_OFERTA"."BASE" = :ls_base ) AND  
					 ( "FACTURA_OFERTA"."SERIE" = :ls_serie ) AND  
					 ( "FACTURA_OFERTA"."NUMERO" = :ll_numero ) AND  
					 ( "FACTURA_OFERTA"."ESTADO" = 'N' OR  
					   "FACTURA_OFERTA"."ESTADO" = 'S') AND  
					   "FACTURA_OFERTA"."FECHA_CIERRE" = (	SELECT MAX("FACTURA_OFERTA"."FECHA_CIERRE") 
																		FROM 		  "FACTURA_OFERTA" 
																		WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base ) AND 
																					( "FACTURA_OFERTA"."SERIE" = :ls_serie ) AND 
																					( "FACTURA_OFERTA"."NUMERO" = :ll_numero ) AND 
																					( "FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S') )   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				ll_pasa ++
			end if
			if ll_saldo>0 then
				ll_pasa ++
				dw_lista.setitem(ll_indi,'pagos_pendientes','Y')
			else
				dw_lista.setitem(ll_indi,'pagos_pendientes','F')
			end if
		end if
		if ll_pasa=0 then
			SELECT	COUNT("INGRESO"."FOLIO")  
			INTO 		:ll_count  
			FROM 		"DOCUMENTOS",   
						"INGRESO"  
			WHERE  (("DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A' ) and  
					 (	"DOCUMENTOS"."COD_PAGO" = 'CH' AND  
						"DOCUMENTOS"."FECHA_VENC" > :ld_fecha AND  
						"INGRESO"."BASE" = :ls_base AND  
						"INGRESO"."SERIE" = :ls_serie AND  
						"INGRESO"."CONTRATO" = :ll_numero)  OR
					 ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 (	"DOCUMENTOS"."COD_PAGO" = 'CH' AND  
					 (	"DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T' ) AND  
					 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A' ) and  
						"INGRESO"."BASE" = :ls_base AND  
						"INGRESO"."SERIE" = :ls_serie AND  
						"INGRESO"."CONTRATO" = :ll_numero) )
			USING		sqlca;
			if ll_count>0 then
				dw_lista.setitem(ll_indi,'pagos_pendientes','S')
			else
				dw_lista.setitem(ll_indi,'pagos_pendientes','N')
			end if
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text		= string(ll_tot_porc)+" %"
			ll_tot_porc_aux	= ll_tot_porc
		end if
		ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
		hpb_1.Position 		= ll_tot_porc
	next
	dw_lista.accepttext()
	st_fondo.visible			= false
	hpb_1.visible 				= false
	st_porc.visible 			= false
	dw_lista.SORT()
	dw_lista.scrolltorow(1)
end if
SetPointer(Arrow!)
end event

type cb_cerrar from commandbutton within w_actualizar_estado_repog_mant
integer x = 2683
integer y = 1572
integer width = 343
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualizar_estado_repog_mant)
end event

type hpb_1 from hprogressbar within w_actualizar_estado_repog_mant
boolean visible = false
integer x = 850
integer y = 808
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_actualizar_estado_repog_mant
boolean visible = false
integer x = 818
integer y = 704
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

type st_porc from statictext within w_actualizar_estado_repog_mant
boolean visible = false
integer x = 1390
integer y = 732
integer width = 233
integer height = 68
boolean bringtotop = true
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

type dw_lista from datawindow within w_actualizar_estado_repog_mant
integer x = 37
integer y = 328
integer width = 2990
integer height = 1188
integer taborder = 70
string title = " Listado Reprogrmaciones de Mantención Saldo ~"0~""
string dataobject = "dw_actualizar_pagare_canceladas"
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_actualizar_estado_repog_mant
event ue_mousemove pbm_mousemove
integer x = 1938
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

