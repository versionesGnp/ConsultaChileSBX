forward
global type w_asignar_ejecutivo_atencion_terreno from window
end type
type cb_ctacte from commandbutton within w_asignar_ejecutivo_atencion_terreno
end type
type cb_grabar from commandbutton within w_asignar_ejecutivo_atencion_terreno
end type
type cb_cerrar from commandbutton within w_asignar_ejecutivo_atencion_terreno
end type
type dw_lista from datawindow within w_asignar_ejecutivo_atencion_terreno
end type
end forward

global type w_asignar_ejecutivo_atencion_terreno from window
integer width = 3209
integer height = 1896
boolean titlebar = true
string title = "Asignar Ejecutivo Atención Terreno"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_asignar_ejecutivo_atencion_terreno w_asignar_ejecutivo_atencion_terreno

type variables
Long	il_row
string	is_grupo_cob
datawindowchild	idw_detalle6
end variables

on w_asignar_ejecutivo_atencion_terreno.create
this.cb_ctacte=create cb_ctacte
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ctacte,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_asignar_ejecutivo_atencion_terreno.destroy
destroy(this.cb_ctacte)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_filtrar,ls_base,ls_serie,ls_tipo_cob
Long		ll_indi,ll_tot_reg,ll_numero,ll_rut,ll_new
datetime	ldt_fecha_hoy

gf_centrar(w_asignar_ejecutivo_atencion_terreno)
if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	is_grupo_cob		= 'C'
elseif gs_tipo_cob='N' then
	is_grupo_cob		= 'N'
elseif gs_tipo_cob='T' then	
	is_grupo_cob		= 'T'
end if
dw_lista.dataobject 		= 'dw_lista_grabar_asignacion_ejecutivo'
dw_lista.settransobject(sqlca)
dw_lista.getchild('tipo_cobranza',idw_detalle6)
idw_detalle6.settransobject(sqlca)
if idw_detalle6.retrieve(is_grupo_cob)=0 then
	idw_detalle6.insertrow(0)
end if

SELECT	sysdate  
INTO 		:gdt_fec_sistema  
FROM 	"TASA"  
WHERE	"TASA"."LOOK" = 1   ;
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_filtrar						= "estado_reg = 0"
if gs_tipo_cob='N' or gs_tipo_cob='T' then
	w_generar_filtro_at_terreno.dw_lista.SETfilter(ls_filtrar)
	w_generar_filtro_at_terreno.dw_lista.filter()
	ll_tot_reg					=  w_generar_filtro_at_terreno.dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_base				= w_generar_filtro_at_terreno.dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= w_generar_filtro_at_terreno.dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= w_generar_filtro_at_terreno.dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= w_generar_filtro_at_terreno.dw_lista.getitemnumber(ll_indi,'rut')
			ls_tipo_cob			= w_generar_filtro_at_terreno.dw_lista.getitemstring(ll_indi,'vista_atencion_terreno_tipo_cobranza')
			ll_new				= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
	//		dw_lista.setitem(ll_new,'codigo_grupo',)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'rut_cliente',ll_rut)
			dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'estado_llamada','S')
			dw_lista.setitem(ll_new,'estado_visita','S')
			dw_lista.setitem(ll_new,'estado_gestion','P')
	//		dw_lista.setitem(ll_new,'usuario_asignado',)
			dw_lista.setitem(ll_indi,'tipo_cobranza',ls_tipo_cob)
		next
		dw_lista.accepttext()
	else
		messagebox("Advertencia","No Registra Promesa para Asignar Ejecutivo")
		close(w_asignar_ejecutivo_atencion_terreno)
	end if
elseif gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' then
	w_generar_filtro_cartera_cobranza.dw_lista.SETfilter(ls_filtrar)
	w_generar_filtro_cartera_cobranza.dw_lista.filter()
	ll_tot_reg					=  w_generar_filtro_cartera_cobranza.dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_base				= w_generar_filtro_cartera_cobranza.dw_lista.getitemstring(ll_indi,'vista_at_terreno_cobranza_base')
			ls_serie				= w_generar_filtro_cartera_cobranza.dw_lista.getitemstring(ll_indi,'vista_at_terreno_cobranza_serie')
			ll_numero			= w_generar_filtro_cartera_cobranza.dw_lista.getitemnumber(ll_indi,'vista_at_terreno_cobranza_numero')
			ll_rut					= w_generar_filtro_cartera_cobranza.dw_lista.getitemnumber(ll_indi,'vista_at_terreno_cobranza_rut')
			ls_tipo_cob			= w_generar_filtro_cartera_cobranza.dw_lista.getitemstring(ll_indi,'vista_at_terreno_cobranza_tipo_cobranza')
			ll_new				= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
	//		dw_lista.setitem(ll_new,'codigo_grupo',)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'rut_cliente',ll_rut)
			dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'estado_llamada','S')
			dw_lista.setitem(ll_new,'estado_visita','S')
			dw_lista.setitem(ll_new,'estado_gestion','P')
	//		dw_lista.setitem(ll_new,'usuario_asignado',)
			dw_lista.setitem(ll_indi,'tipo_cobranza',ls_tipo_cob)
		next
		dw_lista.accepttext()
	else
		messagebox("Advertencia","No Registra Promesa para Asignar Ejecutivo")
		close(w_asignar_ejecutivo_atencion_terreno)	
	end if
elseif gs_tipo_cob='J' then
	ls_filtrar						= "marca = 1"
	
	dw_lista.dataobject 		= 'dw_lista_grabar_asignacion_ejecutivo_jud'
	dw_lista.settransobject(sqlca)
	dw_lista.getchild('tipo_cobranza',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	if idw_detalle6.retrieve(is_grupo_cob)=0 then
		idw_detalle6.insertrow(0)
	end if
	
	w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.SETfilter(ls_filtrar)
	w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.filter()
	ll_tot_reg					=  w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_base				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'rut_cliente')
			ls_tipo_cob			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'tipo_cobranza')
			ll_new				= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
	//		dw_lista.setitem(ll_new,'codigo_grupo',)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'rut_cliente',ll_rut)
			dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_fecha_hoy)
			dw_lista.setitem(ll_new,'estado_llamada','S')
			dw_lista.setitem(ll_new,'estado_visita','S')
			dw_lista.setitem(ll_new,'estado_gestion','P')
	//		dw_lista.setitem(ll_new,'usuario_asignado',)
			dw_lista.setitem(ll_indi,'tipo_cobranza',ls_tipo_cob)
			
			DELETE FROM "AT_GESTION"  
   			WHERE	( "AT_GESTION"."BASE" = :ls_base ) AND  
						( "AT_GESTION"."SERIE" = :ls_serie ) AND  
						( "AT_GESTION"."NUMERO" = :ll_numero ) AND  
						( "AT_GESTION"."TIPO_COBRANZA" = 'J' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		next
		dw_lista.accepttext()
	else
		messagebox("Advertencia","No Registra Promesa para Asignar Ejecutivo")
		close(w_asignar_ejecutivo_atencion_terreno)	
	end if
	
//	ls_base						= substr(1,1,Message.StringParm)
//	ls_serie						= substr(1,2,Message.StringParm)
//	ll_numero					= Double(substr(1,3,Message.StringParm))
//	
//	
//	ll_tot_reg					=  dw_lista.retrieve(ls_base,ls_serie,ll_numero)
//	if ll_tot_reg=0 then
//		messagebox("Advertencia","No Registra Promesa para Asignar Ejecutivo")
//		close(w_asignar_ejecutivo_atencion_terreno)
//	end if
end if
end event

type cb_ctacte from commandbutton within w_asignar_ejecutivo_atencion_terreno
integer x = 1408
integer y = 1652
integer width = 430
integer height = 96
integer taborder = 40
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
	gs_base   = dw_lista.getitemstring(il_row,'base' )
	gs_serie  = dw_lista.getitemstring(il_row,'serie')
	gi_numero = dw_lista.getitemnumber(il_row,'numero' )
	gi_rut    = dw_lista.getitemnumber(il_row,'rut_cliente')
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
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_grabar from commandbutton within w_asignar_ejecutivo_atencion_terreno
integer x = 32
integer y = 1652
integer width = 306
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if isvalid(w_grabar_lista_gestion_atencion_terreno) then close(w_grabar_lista_gestion_atencion_terreno)
open(w_grabar_lista_gestion_atencion_terreno)
end event

type cb_cerrar from commandbutton within w_asignar_ejecutivo_atencion_terreno
integer x = 2853
integer y = 1652
integer width = 306
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asignar_ejecutivo_atencion_terreno)
end event

type dw_lista from datawindow within w_asignar_ejecutivo_atencion_terreno
integer x = 32
integer y = 32
integer width = 3127
integer height = 1572
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_grabar_asignacion_ejecutivo"
boolean vscrollbar = true
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

