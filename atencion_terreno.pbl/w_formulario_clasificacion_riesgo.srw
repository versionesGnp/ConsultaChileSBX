forward
global type w_formulario_clasificacion_riesgo from window
end type
type cb_buscar_clasi from commandbutton within w_formulario_clasificacion_riesgo
end type
type dw_atencion_terreno_resumen from datawindow within w_formulario_clasificacion_riesgo
end type
type dw_atencion_terreno_nota from datawindow within w_formulario_clasificacion_riesgo
end type
type cb_limpiar from commandbutton within w_formulario_clasificacion_riesgo
end type
type cb_cobranza from commandbutton within w_formulario_clasificacion_riesgo
end type
type cb_cta_cte from commandbutton within w_formulario_clasificacion_riesgo
end type
type cb_print from commandbutton within w_formulario_clasificacion_riesgo
end type
type cb_grabar from commandbutton within w_formulario_clasificacion_riesgo
end type
type dw_print from datawindow within w_formulario_clasificacion_riesgo
end type
type cb_cerrar from commandbutton within w_formulario_clasificacion_riesgo
end type
type dw_lista from datawindow within w_formulario_clasificacion_riesgo
end type
end forward

global type w_formulario_clasificacion_riesgo from window
integer width = 3419
integer height = 2176
boolean titlebar = true
string title = "Formulario de Clasificación de Riesgo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_buscar_clasi cb_buscar_clasi
dw_atencion_terreno_resumen dw_atencion_terreno_resumen
dw_atencion_terreno_nota dw_atencion_terreno_nota
cb_limpiar cb_limpiar
cb_cobranza cb_cobranza
cb_cta_cte cb_cta_cte
cb_print cb_print
cb_grabar cb_grabar
dw_print dw_print
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_formulario_clasificacion_riesgo w_formulario_clasificacion_riesgo

type variables
String	is_opcion
end variables

on w_formulario_clasificacion_riesgo.create
this.cb_buscar_clasi=create cb_buscar_clasi
this.dw_atencion_terreno_resumen=create dw_atencion_terreno_resumen
this.dw_atencion_terreno_nota=create dw_atencion_terreno_nota
this.cb_limpiar=create cb_limpiar
this.cb_cobranza=create cb_cobranza
this.cb_cta_cte=create cb_cta_cte
this.cb_print=create cb_print
this.cb_grabar=create cb_grabar
this.dw_print=create dw_print
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_buscar_clasi,&
this.dw_atencion_terreno_resumen,&
this.dw_atencion_terreno_nota,&
this.cb_limpiar,&
this.cb_cobranza,&
this.cb_cta_cte,&
this.cb_print,&
this.cb_grabar,&
this.dw_print,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_formulario_clasificacion_riesgo.destroy
destroy(this.cb_buscar_clasi)
destroy(this.dw_atencion_terreno_resumen)
destroy(this.dw_atencion_terreno_nota)
destroy(this.cb_limpiar)
destroy(this.cb_cobranza)
destroy(this.cb_cta_cte)
destroy(this.cb_print)
destroy(this.cb_grabar)
destroy(this.dw_print)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long	ll_new
gf_centrar(w_formulario_clasificacion_riesgo)
is_opcion	= trim(Message.StringParm)
dw_lista.settransobject(sqlca)
dw_lista.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_atencion_terreno_nota.settransobject(sqlca)
dw_atencion_terreno_nota.retrieve()
dw_atencion_terreno_resumen.settransobject(sqlca)
dw_atencion_terreno_resumen.retrieve()
ll_new								= dw_lista.insertrow(0)
dw_print.settransobject(sqlca)
if is_opcion='S' then
	cb_grabar.enabled				= true
	cb_cta_cte.enabled			= true
	cb_cobranza.enabled			= true
	cb_limpiar.enabled			= true
	cb_buscar_clasi.enabled		= true
	dw_lista.enabled				= true
	dw_lista.setfocus()
elseif is_opcion='N' then
	if dw_lista.retrieve(gs_base,gs_serie,gi_numero,gs_depto)=0 then
		messagebox("Advertencia","No Registra Formulario Clasificación de Riesgo")
		close(w_formulario_clasificacion_riesgo)
	else
		cb_grabar.enabled			= false
		cb_cta_cte.enabled		= false
		cb_cobranza.enabled		= false
		cb_limpiar.enabled		= false
		cb_buscar_clasi.enabled	= false
		dw_lista.enabled			= false
	end if
end if
end event

type cb_buscar_clasi from commandbutton within w_formulario_clasificacion_riesgo
integer x = 2043
integer y = 1948
integer width = 498
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Clasificación"
end type

event clicked;if isvalid(w_buscar_clasificacion_de_riesgo) then close(w_buscar_clasificacion_de_riesgo)
open(w_buscar_clasificacion_de_riesgo)
end event

type dw_atencion_terreno_resumen from datawindow within w_formulario_clasificacion_riesgo
integer x = 2057
integer y = 168
integer width = 1312
integer height = 488
string title = "none"
string dataobject = "dw_atencion_terreno_resumen_pantalla"
boolean border = false
boolean livescroll = true
end type

type dw_atencion_terreno_nota from datawindow within w_formulario_clasificacion_riesgo
integer x = 41
integer y = 168
integer width = 1522
integer height = 488
string title = "none"
string dataobject = "dw_atencion_terreno_nota_pantalla"
boolean border = false
boolean livescroll = true
end type

type cb_limpiar from commandbutton within w_formulario_clasificacion_riesgo
integer x = 1678
integer y = 1948
integer width = 270
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
dw_lista.insertrow(0)
dw_lista.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
Setnull(gs_base);Setnull(gs_serie);Setnull(gi_numero);Setnull(gi_rut)
dw_lista.setfocus()
dw_lista.setcolumn('base')
end event

type cb_cobranza from commandbutton within w_formulario_clasificacion_riesgo
integer x = 1280
integer y = 1948
integer width = 302
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;gs_base   = dw_lista.getitemstring(1,'base' )
gs_serie  = dw_lista.getitemstring(1,'serie')
gi_numero = dw_lista.getitemnumber(1,'numero' )
SELECT	"OFERTA_V"."RUT"  
INTO 		:gi_rut  
FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
		 ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
		 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
		 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
		 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
		 (("CADENA"."CODIGO" = :gs_base ) AND  
		 ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
		 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
USING		sqlca;
if not isnull(gs_base) and gs_base<>'' and not isnull(gs_serie) and gs_serie<>'' and &
	gi_numero>0 and gi_rut>0 then
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_cta_cte from commandbutton within w_formulario_clasificacion_riesgo
integer x = 827
integer y = 1948
integer width = 448
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta C&orriente"
end type

event clicked;string param
gs_base   = dw_lista.getitemstring(1,'base' )
gs_serie  = dw_lista.getitemstring(1,'serie')
gi_numero = dw_lista.getitemnumber(1,'numero' )
SELECT	"OFERTA_V"."RUT"  
INTO 		:gi_rut  
FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
		 ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
		 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
		 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
		 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
		 (("CADENA"."CODIGO" = :gs_base ) AND  
		 ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
		 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
USING		sqlca;
if not isnull(gs_base) and gs_base<>'' and not isnull(gs_serie) and gs_serie<>'' and &
	gi_numero>0 and gi_rut>0 then

	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)
		CASE "F","G" // Anexo funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param)	
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
	END CHOOSE
end if
end event

type cb_print from commandbutton within w_formulario_clasificacion_riesgo
integer x = 434
integer y = 1948
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;String		ls_base,ls_serie
Double	ll_numero

ls_base			= dw_lista.getitemstring(1,'base')
ls_serie			= dw_lista.getitemstring(1,'serie')
ll_numero		= dw_lista.getitemnumber(1,'numero')
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 and &
	ls_base<>'' and ls_serie<>'' then
	if dw_print.retrieve(ls_base,ls_serie,ll_numero)>0 then
		f_Print( dw_print )
//		f_printdlg(dw_print,gstr_print,parent)
	end if
end if
end event

type cb_grabar from commandbutton within w_formulario_clasificacion_riesgo
integer x = 37
integer y = 1948
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String		ls_base,ls_serie
Double	ldb_suma,ldb_suma_op,ll_numero

dw_lista.accepttext()
ls_base				= dw_lista.getitemstring(1,'base')
ls_serie				= dw_lista.getitemstring(1,'serie')
ll_numero			= dw_lista.getitemnumber(1,'numero')
ldb_suma			= double(dw_lista.getitemnumber(1,'c_suma'))
ldb_suma_op		= double(dw_lista.getitemnumber(1,'c_suma_op'))
if isnull(ls_base) or ls_base='' then
	messagebox("Advertencia","Debe Ingresar Base")
	dw_lista.setfocus()
	dw_lista.setcolumn('base')
elseif isnull(ls_serie) or ls_serie='' then
	messagebox("Advertencia","Debe Ingresar Serie")
	dw_lista.setfocus()
	dw_lista.setcolumn('serie')
elseif isnull(ll_numero) or ll_numero=0 then
	messagebox("Advertencia","Debe Ingresar Número")
	dw_lista.setfocus()
	dw_lista.setcolumn('numero')
elseif (isnull(ldb_suma) or ldb_suma=0) and gs_depto='E' then
	messagebox("Advertencia","Debe Ingresar Evaluación")
	dw_lista.setfocus()
	dw_lista.setcolumn('at_tipo_vivienda')
elseif (isnull(ldb_suma) or ldb_suma=0) then
	messagebox("Advertencia","Debe Ingresar Evaluación")
	dw_lista.setfocus()
	dw_lista.setcolumn('op_pie')
else
	if dw_lista.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		cb_limpiar.triggerevent(clicked!)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_print from datawindow within w_formulario_clasificacion_riesgo
boolean visible = false
integer x = 421
integer y = 2060
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_clasificacion_de_riesgo_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_formulario_clasificacion_riesgo
integer x = 3035
integer y = 1948
integer width = 315
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_formulario_clasificacion_riesgo)
end event

type dw_lista from datawindow within w_formulario_clasificacion_riesgo
integer x = 23
integer y = 24
integer width = 3365
integer height = 1872
integer taborder = 10
string title = "none"
string dataobject = "dw_clasificacion_de_riesgo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_base,ls_serie,ls_estado_ctto,ls_estado_titular,ls_direccion,&
			ls_comuna,ls_moneda,ls_jefe,ls_usuario_asignado,ls_comp_titular,ls_tipo_renta,&
			ls_sepultura
Long		ll_numero,ll_new,ll_parque,ll_pie_pagado,ll_plazo,ll_renta,ll_avaluo_casa,&
			ll_avaluo_auto,ll_pie_peso,ll_precio_peso
Double	ldb_pie,ldb_precio,ldb_uf_dia,ldb_calculo
Datetime	ldt_fec_hoy

this.accepttext()
ls_columna			= dw_lista.GetColumnName()
if ls_columna = "base" then
	ls_base			= dw_lista.getitemstring(1,'base')
	if not isnull(ls_base) and ls_base<>'' then
		dw_lista.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base)
	end if
end if
if ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ldt_fec_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ls_base			= dw_lista.getitemstring(1,'base')
	ls_serie			= dw_lista.getitemstring(1,'serie')
	ll_numero		= dw_lista.getitemnumber(1,'numero')
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 and &
		ls_base<>'' and ls_serie<>'' then
		if dw_lista.retrieve(ls_base,ls_serie,ll_numero,gs_depto)=0 then
			ll_new	= dw_lista.insertrow(0)
			SELECT	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"PAGO_OFERTA"."PIE",	"PAGO_OFERTA"."PIE_PAGADO",	"PAGO_OFERTA"."NRO_CUOTAS",	"CLIENTE"."ESTADO_TITULAR",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."COMUNA",	"CLIENTE"."TOTAL_RENT",	"CLIENTE"."AVALUO_CASA",	"CLIENTE"."AVALUO_AUTO",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."MONEDA",	"OFERTA_V"."COD_JEF",	"PAGO_OFERTA"."UF_DIA",	"AT_GESTION"."USUARIO_ASIGNADO",	"CLIENTE"."TIPO_RENTA",	"PAGO_OFERTA"."SEPULTURA"
			INTO 		:ll_parque,					:ls_estado_ctto,		:ldb_pie,				:ll_pie_pagado,					:ll_plazo,							:ls_estado_titular,				:ls_direccion,					:ls_comuna,				:ll_renta,					:ll_avaluo_casa,				:ll_avaluo_auto,				:ldb_precio,				:ls_moneda,					:ls_jefe,					:ldb_uf_dia,				:ls_usuario_asignado,				:ls_tipo_renta,			:ls_sepultura
			FROM 		"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"CLIENTE",	"AT_GESTION"  
			WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 (("CADENA"."CODIGO" = "AT_GESTION"."BASE" ) and
					 ( "CADENA"."SERIE" = "AT_GESTION"."SERIE" ) and
					 ( "CADENA"."NUMERO" = "AT_GESTION"."NUMERO" )) and
					 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
				dw_lista.setitem(ll_new,'plazo',ll_plazo)
				dw_lista.setitem(ll_new,'moneda',ls_moneda)
				dw_lista.setitem(ll_new,'precio',ldb_precio)
				dw_lista.setitem(ll_new,'pie',ldb_pie)
				dw_lista.setitem(ll_new,'pie_pagado',ll_pie_pagado)
				dw_lista.setitem(ll_new,'estado_titular',ls_estado_titular)
				dw_lista.setitem(ll_new,'jefe_venta',ls_jefe)
				dw_lista.setitem(ll_new,'fecha_crea',ldt_fec_hoy)
				dw_lista.setitem(ll_new,'parque',ll_parque)
				dw_lista.object.t_nuevo.text	= 'Contrato~rNuevo'
				if ls_moneda='2' then
					ll_pie_peso		= round(ldb_pie * ldb_uf_dia,0)
					ll_precio_peso	= round(ldb_precio * ldb_uf_dia,0)
				else
					ll_pie_peso		= ldb_pie
					ll_precio_peso	= ldb_precio
				end if
				ldb_calculo			= (ll_pie_peso * 100) / ll_precio_peso
				if ldb_pie=0 or isnull(ldb_pie) then
					dw_lista.setitem(ll_new,'op_pie',0)
				elseif ldb_calculo > 0 and ldb_calculo < 5 then
					dw_lista.setitem(ll_new,'op_pie',5)	
				elseif ldb_calculo >= 5 then
					dw_lista.setitem(ll_new,'op_pie',10)
				end if
				if ls_sepultura<>'0' and not isnull(ls_sepultura) then
					dw_lista.setitem(ll_new,'at_electrodomestico',10)
				else
					dw_lista.setitem(ll_new,'at_electrodomestico',0)
				end if
				SELECT	"REVISION_CONTRATOS"."COMPROBANTE_TITULAR",	"REVISION_CONTRATOS"."RENTA_LIQUIDA"  
				INTO 		:ls_comp_titular,										:ll_renta
				FROM 		"REVISION_CONTRATOS"  
				WHERE  ( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
						 ( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
						 ( "REVISION_CONTRATOS"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if ls_tipo_renta='B' or ls_tipo_renta='L' or ls_tipo_renta='I' then
					dw_lista.setitem(ll_new,'op_justifica_renta',10)
				else
					dw_lista.setitem(ll_new,'op_justifica_renta',0)
				end if
				if ls_comp_titular='S' then
					dw_lista.setitem(ll_new,'op_comp_domicilio',10)
				else
					dw_lista.setitem(ll_new,'op_comp_domicilio',0)
				end if
				if ll_plazo<=48 then
					dw_lista.setitem(ll_new,'op_plazo',10)
				elseif ll_plazo>=49 and ll_plazo<=72 then
					dw_lista.setitem(ll_new,'op_plazo',5)
				elseif ll_plazo>=73 then
					dw_lista.setitem(ll_new,'op_plazo',0)
				end if
				if ll_avaluo_casa<=300000 then
					dw_lista.setitem(ll_new,'at_tipo_vivienda',0)
				elseif ll_avaluo_casa>=300001 and ll_avaluo_casa<=5000000 then
					dw_lista.setitem(ll_new,'at_tipo_vivienda',5)
				elseif ll_avaluo_casa>=5000001 then
					dw_lista.setitem(ll_new,'at_tipo_vivienda',10)
				end if
				if ll_avaluo_auto>50000 then
					dw_lista.setitem(ll_new,'at_automovil',10)
				else
					dw_lista.setitem(ll_new,'at_automovil',0)
				end if
			else
				dw_lista.object.t_nuevo.text	= ''
				messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' No Existe')
			end if
			dw_lista.accepttext()
		else
			dw_lista.object.t_nuevo.text	= 'Contrato~ra~rModificar'
		end if
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		if gs_depto='O' or gs_depto='I' then
			dw_lista.setcolumn('op_justifica_renta')
		else
			dw_lista.setcolumn('at_tipo_vivienda')
		end if
	end if
end if
end event

