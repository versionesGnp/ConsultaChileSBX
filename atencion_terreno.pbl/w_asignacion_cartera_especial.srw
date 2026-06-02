forward
global type w_asignacion_cartera_especial from window
end type
type dw_especial from datawindow within w_asignacion_cartera_especial
end type
type pb_asignar from picturebutton within w_asignacion_cartera_especial
end type
type cb_limpiar from commandbutton within w_asignacion_cartera_especial
end type
type cb_imprimir from commandbutton within w_asignacion_cartera_especial
end type
type cb_filtrar from commandbutton within w_asignacion_cartera_especial
end type
type cb_ordenar from commandbutton within w_asignacion_cartera_especial
end type
type cb_importar from commandbutton within w_asignacion_cartera_especial
end type
type dw_ejecutivo from datawindow within w_asignacion_cartera_especial
end type
type cb_eliminar from commandbutton within w_asignacion_cartera_especial
end type
type cb_nuevo from commandbutton within w_asignacion_cartera_especial
end type
type cb_ctacte from commandbutton within w_asignacion_cartera_especial
end type
type cb_grabar from commandbutton within w_asignacion_cartera_especial
end type
type cb_cerrar from commandbutton within w_asignacion_cartera_especial
end type
type dw_lista from datawindow within w_asignacion_cartera_especial
end type
type gb_1 from groupbox within w_asignacion_cartera_especial
end type
end forward

global type w_asignacion_cartera_especial from window
integer width = 3360
integer height = 1896
boolean titlebar = true
string title = "Asignar Ejecutivo Atención Terreno"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_especial dw_especial
pb_asignar pb_asignar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_importar cb_importar
dw_ejecutivo dw_ejecutivo
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_ctacte cb_ctacte
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_asignacion_cartera_especial w_asignacion_cartera_especial

type variables
Long		il_row
datetime	idt_fecha_hoy
end variables

on w_asignacion_cartera_especial.create
this.dw_especial=create dw_especial
this.pb_asignar=create pb_asignar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_importar=create cb_importar
this.dw_ejecutivo=create dw_ejecutivo
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_ctacte=create cb_ctacte
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.dw_especial,&
this.pb_asignar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_importar,&
this.dw_ejecutivo,&
this.cb_eliminar,&
this.cb_nuevo,&
this.cb_ctacte,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_asignacion_cartera_especial.destroy
destroy(this.dw_especial)
destroy(this.pb_asignar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_importar)
destroy(this.dw_ejecutivo)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_ctacte)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;connect using trans_1;
connect using trans_2;
gf_centrar(w_asignacion_cartera_especial)
dw_lista.settransobject(sqlca)
dw_especial.settransobject(sqlca)
dw_ejecutivo.settransobject(sqlca)
dw_ejecutivo.insertrow(0)
SELECT	sysdate  
INTO 		:gdt_fec_sistema  
FROM 		"TASA"  
WHERE 	"TASA"."LOOK" = 1   ;
idt_fecha_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))

end event

event close;disconnect using trans_1;
disconnect using trans_2;
end event

type dw_especial from datawindow within w_asignacion_cartera_especial
boolean visible = false
integer x = 923
integer y = 1780
integer width = 411
integer height = 432
integer taborder = 110
string title = "none"
string dataobject = "dwe_lista_contrato_especial"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_asignar from picturebutton within w_asignacion_cartera_especial
integer x = 2606
integer y = 1648
integer width = 123
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "control_documentario.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_eje
Long		ll_indi,ll_tot_reg

ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_eje			= trim(dw_ejecutivo.getitemstring(1,'ejecutivo'))
	if ls_eje='' or isnull(ls_eje) then
		messagebox("Advertencia","Debe Seleccionar Ejecutivo")
		dw_ejecutivo.setfocus()
	else
		for ll_indi=1 to ll_tot_reg
			if trim(dw_lista.getitemstring(ll_indi,'usuario_asignado')) <> 'Asignado' and &
				trim(dw_lista.getitemstring(ll_indi,'usuario_asignado')) <> 'No Existe Ctto.' then
				
				dw_lista.setitem(ll_indi,'usuario_asignado',ls_eje)
			end if
		next
		dw_lista.accepttext()
	end if
else
	messagebox("Advertencia","No Existe Contrato en Lista, para Asignar Ejecutivo")
end if
end event

type cb_limpiar from commandbutton within w_asignacion_cartera_especial
integer x = 1536
integer y = 36
integer width = 247
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
dw_ejecutivo.reset()
dw_ejecutivo.insertrow(0)
dw_lista.setfocus()
end event

type cb_imprimir from commandbutton within w_asignacion_cartera_especial
event ue_mousemove pbm_mousemove
integer x = 3013
integer y = 44
integer width = 247
integer height = 80
integer taborder = 70
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

type cb_filtrar from commandbutton within w_asignacion_cartera_especial
event ue_mousemove pbm_mousemove
integer x = 2761
integer y = 44
integer width = 247
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_asignacion_cartera_especial
event ue_mousemove pbm_dwnmousemove
integer x = 2510
integer y = 44
integer width = 247
integer height = 80
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

type cb_importar from commandbutton within w_asignacion_cartera_especial
integer x = 32
integer y = 36
integer width = 448
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Buscar Archivo"
end type

event clicked;string		ls_archivo,ls_base,ls_serie,ls_nulo
Long		ll_tot_reg,ll_indi,ll_rut,ll_grupo,ll_new,ll_nulo
Datetime	ldt_nulo
Double	ll_numero

Setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_lista.reset()
dw_especial.reset()
dw_especial.accepttext()
SetNull(ls_archivo)
dw_especial.ImportFile(ls_archivo)
dw_especial.accepttext()
ll_tot_reg			= dw_especial.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base			= dw_especial.getitemstring(ll_indi,'base')
		ls_serie			= dw_especial.getitemstring(ll_indi,'serie')
		ll_numero		= dw_especial.getitemnumber(ll_indi,'numero')
		SELECT	"AT_GESTION"."CODIGO_GRUPO"
		INTO 		:ll_grupo
		FROM 		"AT_GESTION"  
		WHERE  ( "AT_GESTION"."BASE" = :ls_base ) AND  
				 ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
				 ( "AT_GESTION"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ll_new	= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'rut_cliente',ll_nulo)
			dw_lista.setitem(ll_new,'codigo_grupo',ll_nulo)
			dw_lista.setitem(ll_new,'usuario_asignado','Asignado')
			dw_lista.setitem(ll_new,'fecha_crea',ldt_nulo)
			dw_lista.setitem(ll_new,'estado_gestion',ls_nulo)
			dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_nulo)
			dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_nulo)
			dw_lista.setitem(ll_new,'estado_llamada',ls_nulo)
			dw_lista.setitem(ll_new,'estado_visita',ls_nulo)
		elseif sqlca.sqlcode=100 then
			SELECT	"CADENA"."RUT"  
			INTO 		:ll_rut  
			FROM 		"CADENA",   
						"OFERTA_V",   
						"PAGO_OFERTA"  
			WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_new	= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
				dw_lista.setitem(ll_new,'rut_cliente',ll_rut)
				dw_lista.setitem(ll_new,'usuario_asignado','')
				dw_lista.setitem(ll_new,'fecha_crea',idt_fecha_hoy)
				dw_lista.setitem(ll_new,'estado_gestion','P')
				dw_lista.setitem(ll_new,'fecha_prox_llamada',idt_fecha_hoy)
				dw_lista.setitem(ll_new,'fecha_prox_visita',idt_fecha_hoy)
				dw_lista.setitem(ll_new,'estado_llamada','N')
				dw_lista.setitem(ll_new,'estado_visita','N')
				dw_lista.setitem(ll_new,'rut_cliente',ll_rut)
			else
				ll_new	= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
				dw_lista.setitem(ll_new,'rut_cliente',ll_nulo)
				dw_lista.setitem(ll_new,'codigo_grupo',ll_nulo)
				dw_lista.setitem(ll_new,'usuario_asignado','No Existe Ctto.')
				dw_lista.setitem(ll_new,'fecha_crea',ldt_nulo)
				dw_lista.setitem(ll_new,'estado_gestion',ls_nulo)
				dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_nulo)
				dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_nulo)
				dw_lista.setitem(ll_new,'estado_llamada',ls_nulo)
				dw_lista.setitem(ll_new,'estado_visita',ls_nulo)
			end if
		else
			ll_new	= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'rut_cliente',ll_nulo)
			dw_lista.setitem(ll_new,'codigo_grupo',ll_nulo)
			dw_lista.setitem(ll_new,'usuario_asignado','No Existe Ctto.')
			dw_lista.setitem(ll_new,'fecha_crea',ldt_nulo)
			dw_lista.setitem(ll_new,'estado_gestion',ls_nulo)
			dw_lista.setitem(ll_new,'fecha_prox_llamada',ldt_nulo)
			dw_lista.setitem(ll_new,'fecha_prox_visita',ldt_nulo)
			dw_lista.setitem(ll_new,'estado_llamada',ls_nulo)
			dw_lista.setitem(ll_new,'estado_visita',ls_nulo)
		end if
	next
	dw_lista.accepttext()
end if
end event

type dw_ejecutivo from datawindow within w_asignacion_cartera_especial
integer x = 1038
integer y = 1648
integer width = 1554
integer height = 112
integer taborder = 120
string title = "none"
string dataobject = "dwe_seleccionar_encargado_terreno"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_eje

this.accepttext()
ls_eje	= trim(dw_ejecutivo.getitemstring(1,'ejecutivo'))
if ls_eje<>'' and not isnull(ls_eje) then
	pb_asignar.triggerevent(clicked!)
end if
end event

type cb_eliminar from commandbutton within w_asignacion_cartera_especial
integer x = 283
integer y = 1652
integer width = 247
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp
String		ls_base,ls_serie
Double	ll_numero

if dw_lista.rowcount()>0 and il_row>0 then
	
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ll_resp		= messagebox("Eliminar","Está Seguro de Eliminar Asignación Nº "+string(il_row,"###,###,###,###,###")+' Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###"),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista.deleterow(il_row)
		messagebox("Eliminar","Eliminación Exitosa, recuerde debe Grabar los Cambios")
		il_row	= 0
	end if
end if
end event

type cb_nuevo from commandbutton within w_asignacion_cartera_especial
integer x = 32
integer y = 1652
integer width = 247
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long	ll_new

ll_new	= dw_lista.insertrow(0)
dw_lista.scrolltorow(ll_new)
dw_lista.setfocus()
dw_lista.setcolumn('base')
end event

type cb_ctacte from commandbutton within w_asignacion_cartera_especial
integer x = 535
integer y = 36
integer width = 430
integer height = 96
integer taborder = 30
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

type cb_grabar from commandbutton within w_asignacion_cartera_especial
integer x = 567
integer y = 1652
integer width = 306
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_pasa,ll_max_grupo,ll_rut,ll_rut_cliente
String		ls_base,ls_serie,ls_usuario_asig,ls_obs,ls_estado
Datetime	ldt_fecha_crea,ldt_fecha,ldt_fec_prox_llam
Double	ll_numero

ll_pasa					= 0
ll_tot_reg				= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_base				= dw_lista.getitemstring(ll_indi,'base')
	ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
	ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
	ls_usuario_asig	= dw_lista.getitemstring(ll_indi,'usuario_asignado')
	ll_rut				= dw_lista.getitemnumber(ll_indi,'rut_cliente')
	ldt_fecha			= dw_lista.getitemdatetime(ll_indi,'fecha_crea')
	ls_estado			= dw_lista.getitemstring(ll_indi,'estado_gestion')
	if ls_base='' or isnull(ls_base) then
		messagebox("Advertencia","Debe Ingresar Base en Fila Nº "+string(ll_indi,"###,###,###,###,###"))
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('base')
		exit
	elseif ls_serie='' or isnull(ls_serie) then
		messagebox("Advertencia","Debe Ingresar Serie en Fila Nº "+string(ll_indi,"###,###,###,###,###"))
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('serie')
		exit
	elseif ll_numero=0 or isnull(ll_numero) then
		messagebox("Advertencia","Debe Ingresar Número en Fila Nº "+string(ll_indi,"###,###,###,###,###"))
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('numero')
		exit
	elseif ll_rut=0 or isnull(ll_rut) then
		messagebox("Advertencia","Debe Registrar Rut en Fila Nº "+string(ll_indi,"###,###,###,###,###")+" Contrato Inválido")
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('numero')
		exit
	elseif ls_usuario_asig='' or isnull(ls_usuario_asig) then
		messagebox("Advertencia","Debe Seleccionar y Asignar Ejecutivo en Fila Nº "+string(ll_indi,"###,###,###,###,###")+" Contrato Inválido")
		ll_pasa ++
		dw_ejecutivo.setfocus()
		exit
	elseif isnull(ldt_fecha) then
		messagebox("Advertencia","Debe Registrar Fecha Creación en Fila Nº "+string(ll_indi,"###,###,###,###,###")+" Contrato Inválido")
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('numero')
		exit
	elseif ls_estado='' or isnull(ls_estado) then
		messagebox("Advertencia","Debe Registrar Estado Gestion en Fila Nº "+string(ll_indi,"###,###,###,###,###")+" Contrato Inválido")
		ll_pasa ++
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('numero')
		exit
	end if
next
if ll_pasa=0 then
	SELECT	max("AT_LISTA_GESTION"."CODIGO_GRUPO")  
	INTO 		:ll_max_grupo  
	FROM 		"AT_LISTA_GESTION"  
	USING		sqlca;
	ll_max_grupo ++
	if ll_max_grupo>0 then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'codigo_grupo',ll_max_grupo)
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			ls_obs			= 'CARTERA ASIGNADA EJECUTIVO '+ls_usuario_asig+' el día '+string(idt_fecha_hoy,"dd/mm/yyyy")+' por '+gs_user
			INSERT INTO "AT_LISTA_GESTION"  
						( "CODIGO_GRUPO",	"FECHA_CREA",		"OBERVACION",	"USUARIO_CREADOR",	"ESTADO_GESTION_LISTA",	"USUARIO_ASIGNADO" ) 
			VALUES 	( :ll_max_grupo,	:idt_fecha_hoy,	:ls_obs,		:gs_user,				'P',							:ls_usuario_asig )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				ldt_fec_prox_llam	= datetime(RelativeDate(date(gdt_fec_sistema), 370))
				for ll_indi=1 to ll_tot_reg
					ll_rut_cliente	= dw_lista.getitemnumber(ll_indi,'rut_cliente')
					ls_base			= dw_lista.getitemstring(ll_indi,'base')
					ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
					ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
					if ll_rut_cliente>0 then
						UPDATE 	"CLIENTE"  
						SET 		"ASIGNADO_COBRANZA" = 'S',
									"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llam
						WHERE 	"CLIENTE"."RUT" = :ll_rut_cliente   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							UPDATE	"CADENA"  
							SET 		"ASIGNACION_AT" = 'S'  
							WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
									 ( "CADENA"."SERIE" = :ls_serie ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero )   
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								commit using Trans_2;
							else
								rollback using Trans_2;
								messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
							end if
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
						end if
					end if
				next
				messagebox("Grabar","Grabación Exitosa "+string(dw_lista.rowcount(),"###,###,###,###")+" Contrato(s) Asignado Grupo Nº "+string(ll_max_grupo,"###,###,###,###,###"))
				cb_limpiar.triggerevent(clicked!)
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				DELETE FROM	"AT_GESTION"  
				WHERE 		"AT_GESTION"."CODIGO_GRUPO" = :ll_max_grupo   
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_asignacion_cartera_especial
integer x = 2981
integer y = 1652
integer width = 306
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asignacion_cartera_especial)
end event

type dw_lista from datawindow within w_asignacion_cartera_especial
integer x = 32
integer y = 164
integer width = 3255
integer height = 1448
integer taborder = 10
string title = "none"
string dataobject = "dw_agregar_asignacion_especial"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event itemchanged;String		ls_columna,ls_base,ls_serie,ls_serie_aux,ls_nulo,&
			ls_usuario_asig
Long		ll_rut,ll_nulo,ll_grupo
Datetime	ldt_fecha_asig,ldt_nulo
Double	ll_numero

this.accepttext()
ls_columna			= dwo.name
Setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
if ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ls_base			= dw_lista.getitemstring(row,'base')
	ls_serie			= dw_lista.getitemstring(row,'serie')
	ll_numero		= dw_lista.getitemnumber(row,'numero')
	if ls_base='' or isnull(ls_base) then
		messagebox("Advertencia","Debe Seleccionar Base")
		dw_lista.setfocus()
		dw_lista.setcolumn('base')
	else
		if ls_serie<>'' and not isnull(ls_serie) then
			SELECT	"TABLA_SERIES"."SERIE"  
			INTO 		:ls_serie_aux  
			FROM 		"TABLA_SERIES"  
			WHERE  ( "TABLA_SERIES"."BASE" = :ls_base ) AND  
					 ( "TABLA_SERIES"."SERIE" = :ls_serie )   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				messagebox("Advertencia","Serie No Corresponde a este Tipo de Contrato")
				dw_lista.setitem(row,'serie',ls_nulo)
			end if
			if ll_numero>0 and not isnull(ll_numero) then
				SELECT	"AT_GESTION"."CODIGO_GRUPO",	"AT_GESTION"."FECHA_CREA",	"AT_GESTION"."USUARIO_ASIGNADO"  
				INTO 		:ll_grupo,							:ldt_fecha_asig,				:ls_usuario_asig  
				FROM 		"AT_GESTION"  
				WHERE  ( "AT_GESTION"."BASE" = :ls_base ) AND  
						 ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
						 ( "AT_GESTION"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Contrato Ya Asignado Grupo Nº "+string(ll_grupo,"###,###,###,###,###")+' el día '+string(ldt_fecha_asig,"dd/mm/yyyy")+ ' a Ejecutivo '+ls_usuario_asig)
					dw_lista.setitem(row,'rut_cliente',ll_nulo)
					dw_lista.setitem(row,'codigo_grupo',ll_nulo)
					dw_lista.setitem(row,'usuario_asignado','Asignado')
					dw_lista.setitem(row,'fecha_crea',ldt_nulo)
					dw_lista.setitem(row,'estado_gestion',ls_nulo)
					dw_lista.setitem(row,'fecha_prox_llamada',ldt_nulo)
					dw_lista.setitem(row,'fecha_prox_visita',ldt_nulo)
					dw_lista.setitem(row,'estado_llamada',ls_nulo)
					dw_lista.setitem(row,'estado_visita',ls_nulo)
				elseif sqlca.sqlcode=100 then
//	 SELECT "CADENA"."RUT"  
//    INTO :ll_rut  
//    FROM "CADENA",   
//         "OFERTA_V",   
//         "PAGO_OFERTA",   
//         "CLIENTE"  
//   WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//         ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//         ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//         ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//         ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//         ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//         ( ( "CADENA"."CODIGO" = :ls_base ) AND  
//         ( "CADENA"."SERIE" = :ls_serie ) AND  
//         ( "CADENA"."NUMERO" = :ll_numero ) )   
//   UNION   
//  SELECT "CADENA"."RUT"  
//    FROM "ANEXO_LIBERADOR",   
//         "CADENA",   
//         "CLIENTE",   
//         "PAGO_LIBERADOR"  
//   WHERE ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
//         ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
//         ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//         ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//         ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//         ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//         ( ( "CADENA"."CODIGO" = :ls_base ) AND  
//         ( "CADENA"."SERIE" = :ls_serie ) AND  
//         ( "CADENA"."NUMERO" = :ll_numero ) )   ;
//
					
					
					
					
					SELECT	"CADENA"."RUT"  
					INTO 		:ll_rut  
					FROM 	"CADENA",   
								"OFERTA_V",   
								"PAGO_OFERTA"  
					WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
							   ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
							   ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							   ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							   ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							   (("CADENA"."CODIGO" = :ls_base ) AND  
							   ( "CADENA"."SERIE" = :ls_serie ) AND  
							   ( "CADENA"."NUMERO" = :ll_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(row,'rut_cliente',ll_rut)
						dw_lista.setitem(row,'fecha_crea',idt_fecha_hoy)
						dw_lista.setitem(row,'estado_gestion','P')
						dw_lista.setitem(row,'usuario_asignado','')
						dw_lista.setitem(row,'fecha_prox_llamada',idt_fecha_hoy)
						dw_lista.setitem(row,'fecha_prox_visita',idt_fecha_hoy)
						dw_lista.setitem(row,'estado_llamada','N')
						dw_lista.setitem(row,'estado_visita','N')
						dw_lista.setitem(row,'rut_cliente',ll_rut)
					else
						dw_lista.setitem(row,'rut_cliente',ll_nulo)
						dw_lista.setitem(row,'codigo_grupo',ll_nulo)
						dw_lista.setitem(row,'usuario_asignado','No Existe Ctto.')
						dw_lista.setitem(row,'fecha_crea',ldt_nulo)
						dw_lista.setitem(row,'estado_gestion',ls_nulo)
						dw_lista.setitem(row,'fecha_prox_llamada',ldt_nulo)
						dw_lista.setitem(row,'fecha_prox_visita',ldt_nulo)
						dw_lista.setitem(row,'estado_llamada',ls_nulo)
						dw_lista.setitem(row,'estado_visita',ls_nulo)
					end if
				else
					messagebox("Advertencia","Error al Buscar Contrato SQL: "+sqlca.sqlerrtext)
					dw_lista.setitem(row,'rut_cliente',ll_nulo)
					dw_lista.setitem(row,'codigo_grupo',ll_nulo)
					dw_lista.setitem(row,'usuario_asignado','No Existe Ctto.')
					dw_lista.setitem(row,'fecha_crea',ldt_nulo)
					dw_lista.setitem(row,'estado_gestion',ls_nulo)
					dw_lista.setitem(row,'fecha_prox_llamada',ldt_nulo)
					dw_lista.setitem(row,'fecha_prox_visita',ldt_nulo)
					dw_lista.setitem(row,'estado_llamada',ls_nulo)
					dw_lista.setitem(row,'estado_visita',ls_nulo)
				end if
			end if
		end if
	end if
end if
dw_lista.accepttext()
end event

type gb_1 from groupbox within w_asignacion_cartera_especial
integer x = 2487
integer width = 800
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

