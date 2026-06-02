forward
global type w_ingreso_pago_pie_pactado from window
end type
type cb_ctacte from commandbutton within w_ingreso_pago_pie_pactado
end type
type pb_ok from picturebutton within w_ingreso_pago_pie_pactado
end type
type em_nro_cuotas from editmask within w_ingreso_pago_pie_pactado
end type
type st_2 from statictext within w_ingreso_pago_pie_pactado
end type
type st_1 from statictext within w_ingreso_pago_pie_pactado
end type
type cb_cerrar from commandbutton within w_ingreso_pago_pie_pactado
end type
type cb_aceptar from commandbutton within w_ingreso_pago_pie_pactado
end type
type dw_lista from datawindow within w_ingreso_pago_pie_pactado
end type
end forward

global type w_ingreso_pago_pie_pactado from window
integer width = 3122
integer height = 1504
boolean titlebar = true
string title = "Ingreso Pago Pie Pactados"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_ctacte cb_ctacte
pb_ok pb_ok
em_nro_cuotas em_nro_cuotas
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
end type
global w_ingreso_pago_pie_pactado w_ingreso_pago_pie_pactado

type variables
String		is_base,is_serie,is_tipo_cob,is_mod='N',is_pasa='S'
Long		il_row,il_folio,il_valor_pie_pesos
Double	il_numero,idb_iva
end variables

forward prototypes
public subroutine wf_borrar_valores ()
end prototypes

public subroutine wf_borrar_valores ();Long		ll_suma_cuota
Double	ldb_suma_cuota_real
ll_suma_cuota			= 0
ldb_suma_cuota_real	= 0

if w_ingreso2.tab_ingreso.SelectedTab = 2 then
	w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'cantidad',0)
	w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto_uf',ldb_suma_cuota_real)
	w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',ll_suma_cuota)
	w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
	w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'cantidad',0)
	w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto_uf',ldb_suma_cuota_real)
	w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto',ll_suma_cuota)
	w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
	w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setfocus()
end if
CloseWithReturn(w_ingreso_pago_pie_pactado, 'N')
end subroutine

on w_ingreso_pago_pie_pactado.create
this.cb_ctacte=create cb_ctacte
this.pb_ok=create pb_ok
this.em_nro_cuotas=create em_nro_cuotas
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ctacte,&
this.pb_ok,&
this.em_nro_cuotas,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista}
end on

on w_ingreso_pago_pie_pactado.destroy
destroy(this.cb_ctacte)
destroy(this.pb_ok)
destroy(this.em_nro_cuotas)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
end on

event open;long		ll_tot_reg,ll_indi,ll_suma_canc=0
String		ls_estado

SELECT	"TASA"."IVA"  INTO :idb_iva  FROM 	"TASA"  WHERE "TASA"."LOOK" = 1   ;
gl_iva_pie_l				= 0
is_mod					= 'N'
gf_centrar(w_ingreso_pago_pie_pactado)
dw_lista.settransobject(sqlca)
cb_aceptar.enabled	= true
if gs_depto='T' or gs_depto='J' or gs_depto='I' then
	if isvalid(w_ingreso2) then
		cb_aceptar.text	= '&Grabar'
	else
		cb_aceptar.text	= '&Aceptar'
	end if	
//	cb_aceptar.text	= '&Grabar'
else
	cb_aceptar.text	= '&Aceptar'
end if
is_base 					= trim(substr(1,1,Message.StringParm))
is_serie					= trim(substr(1,2,Message.StringParm))
il_numero				= Double(substr(1,3,Message.StringParm))
is_tipo_cob				= trim(substr(1,4,Message.StringParm))
il_folio					= long(substr(1,5,Message.StringParm))
gs_base					= is_base
gs_serie					= is_serie
gi_numero				= il_numero
if gs_base = 'O' or gs_base='U' then
	dw_lista.dataobject = 'dw_lista_pagar_cuotas_pie'
elseif gs_base = 'A' then
	dw_lista.dataobject = 'dw_lista_pagar_cuotas_pie_aumentos'
elseif gs_base = 'F' or gs_base='G' then	
	dw_lista.dataobject = 'dw_lista_pagar_cuotas_pie_fune'
elseif gs_base = 'L' then	
	dw_lista.dataobject = 'dw_lista_pagar_cuotas_pie_lib'	
end if	
dw_lista.settransobject(sqlca)
ll_tot_reg				= dw_lista.retrieve(is_base,is_serie,il_numero,gd_uf_dia)
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'estatus',1)
		ls_estado		= trim(dw_lista.getitemstring(ll_indi,'estado'))
		if ls_estado='C' then
			dw_lista.setitem(ll_indi,'estado_pago_antiguo','S')
			dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
//			dw_lista.setitem(ll_indi,'estatus',0)
			ll_suma_canc ++
		else
			dw_lista.setitem(ll_indi,'estado_pago_antiguo','N')
			dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
		end if
	next
	dw_lista.accepttext()
	if ll_suma_canc=ll_tot_reg then
		st_1.visible					= true
		cb_aceptar.enabled		= false
		st_2.visible					= false
		em_nro_cuotas.visible	= false
		pb_ok.visible				= false
		messagebox("Advertencia","Pie Pactado está Cancelado")
		cb_cerrar.setfocus()
	else
		st_1.visible					= false
		pb_ok.visible				= true
		st_2.visible					= true
		em_nro_cuotas.visible	= true
		em_nro_cuotas.setfocus()
	end if
else
	cb_cerrar.triggerevent(clicked!)
//	CloseWithReturn(w_ingreso_pago_pie_pactado, 'N')
end if
end event

event close;Long		ll_tot_reg,ll_nulo,ll_indi,ll_estatus,ll_pie_pagado,ll_count_a,ll_numero_cuota
Datetime	ld_nulo
String		ls_nulo,ls_estado,ls_estado_ant,ls_estado_new,ls_estado_pago

if not isvalid(w_ingreso2) then
	dw_lista.accepttext()
	if isvalid(w_boletas_cuotas) or isvalid(w_repacta) then
		ll_tot_reg				= dw_lista.rowcount()
		setnull(ll_nulo);setnull(ld_nulo);setnull(ls_nulo)
		for ll_indi=1 to ll_tot_reg
			ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
			ls_estado_ant	= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
			ls_estado_new	= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
			ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
			if ls_estado='C' and ls_estado_new='S' then
				if ll_estatus = 0 then
					dw_lista.setitem(ll_indi,'estatus',1)
					dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
					dw_lista.setitem(ll_indi,'estado','P')
					dw_lista.setitem(ll_indi,'fecha_pago',ld_nulo)
					dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
					dw_lista.setitem(ll_indi,'folio',ll_nulo)
					dw_lista.setitem(ll_indi,'caja',ls_nulo)
					dw_lista.setitem(ll_indi,'usuario',ls_nulo)
					dw_lista.setitem(ll_indi,'monto_pie_pagado_peso',ll_nulo)
				end if
			end if
		next
		dw_lista.accepttext()
		ll_pie_pagado			= 0
		if dw_lista.update() = 1 then
			commit;
			for ll_indi=1 to ll_tot_reg
				ls_estado_pago		= dw_lista.getitemstring(ll_indi,'estado')
				if ls_estado_pago = 'C' then
					ll_pie_pagado ++
				end if
			next
			SELECT 	Count("INGRESO"."TIPO_COB"  )
			INTO 		:ll_count_a  
			FROM 	"INGRESO"  
			WHERE 	( "INGRESO"."BASE" = :gs_base ) AND  
						( "INGRESO"."SERIE" = :gs_serie ) AND  
						( "INGRESO"."CONTRATO" = :gi_numero ) AND  
						( "INGRESO"."TIPO_MOV" = 'A' ) AND  
						( "INGRESO"."PAGO_HIST" = 'A' )  
			USING	sqlca;
			if ll_pie_pagado <> ll_count_a then
				ll_pie_pagado		= ll_count_a
				for ll_indi=1 to ll_tot_reg
					ls_estado_pago		= dw_lista.getitemstring(ll_indi,'estado')
					ll_numero_cuota	= dw_lista.getitemnumber(ll_indi,'numero_cuota')
					if ll_numero_cuota <= ll_pie_pagado then
						dw_lista.setitem(ll_indi,'estado','C')
					else
						dw_lista.setitem(ll_indi,'estado','P')
						dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
						dw_lista.setitem(ll_indi,'folio',ll_nulo)
						dw_lista.setitem(ll_indi,'caja',ls_nulo)
						dw_lista.setitem(ll_indi,'fecha_pago',ld_nulo)
					end if
				next
				dw_lista.accepttext()
				if dw_lista.update()=1 then
					commit;
				else
					rollback;
				end if
			end if

			if gs_base='O' or gs_base='U' or gs_base='M' then
				UPDATE 	"PAGO_OFERTA"  
				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
				WHERE 	( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
							( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero )  
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if

			elseif gs_base='L' then
				UPDATE 	"PAGO_LIBERADOR"  
				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
				WHERE 	( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if

			elseif gs_base='A' then
				UPDATE 	"PAGO_AUMENTO"  
				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
				WHERE 	( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if
				
			elseif gs_base='F' or gs_base='G' or gs_base='V' then
				UPDATE 	"PRODUCTO_PAGO"  
				SET 		"CTAS_PIE_PLAZO" = :ll_tot_reg,   
							"CTAS_PIE_PAGADAS" = :ll_pie_pagado  
				WHERE 	( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_PAGO"."NUMERO" = :gi_numero )   
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if
			end if
		else
			rollback;
		end if
	end if
end if




//Long		ll_tot_reg,ll_nulo,ll_indi,ll_estatus,ll_pie_pagado
//Datetime	ld_nulo
//String		ls_nulo,ls_estado,ls_estado_ant,ls_estado_new
//
//if not isvalid(w_ingreso2) then
//	dw_lista.accepttext()
//	if isvalid(w_boletas_cuotas) or isvalid(w_repacta) then
//		ll_tot_reg				= dw_lista.rowcount()
//		setnull(ll_nulo);setnull(ld_nulo);setnull(ls_nulo)
//		for ll_indi=1 to ll_tot_reg
//			ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
//			ls_estado_ant	= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
//			ls_estado_new	= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
//			ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
//			if ls_estado='C' and ls_estado_new='S' then
//				if ll_estatus = 0 then
//					dw_lista.setitem(ll_indi,'estatus',1)
//					dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
//					dw_lista.setitem(ll_indi,'estado','P')
//					dw_lista.setitem(ll_indi,'fecha_pago',ld_nulo)
//					dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
//					dw_lista.setitem(ll_indi,'folio',ll_nulo)
//					dw_lista.setitem(ll_indi,'caja',ls_nulo)
//					dw_lista.setitem(ll_indi,'usuario',ls_nulo)
//					dw_lista.setitem(ll_indi,'monto_pie_pagado_peso',ll_nulo)
//				end if
//			end if
//		next
//		dw_lista.accepttext()
//		ll_pie_pagado			= 0
//		if dw_lista.update() = 1 then
//			commit;
//			for ll_indi=1 to ll_tot_reg
//				ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
//				if ll_estatus = 0 then
//					ll_pie_pagado ++
//				end if
//			next
//			if gs_base='O' then
//				UPDATE 	"PAGO_OFERTA"  
//				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
//							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
//				WHERE 	( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
//							( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero )  
//				USING	sqlca;
//				if sqlca.sqlcode = 0 then
//					commit;
//				else
//					rollback;
//				end if
//
//			elseif gs_base='L' then
//				UPDATE 	"PAGO_LIBERADOR"  
//				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
//							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
//				WHERE 	( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
//							( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
//				USING	sqlca;
//				if sqlca.sqlcode = 0 then
//					commit;
//				else
//					rollback;
//				end if
//
//			elseif gs_base='A' then
//				UPDATE 	"PAGO_AUMENTO"  
//				SET 		"CTAS_PACTADAS_PIE" = :ll_tot_reg,   
//							"CTAS_PAGADAS_PIE" = :ll_pie_pagado  
//				WHERE 	( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
//							( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
//				USING	sqlca;
//				if sqlca.sqlcode = 0 then
//					commit;
//				else
//					rollback;
//				end if
//			end if
//		else
//			rollback;
//		end if
//	end if
//end if
end event

type cb_ctacte from commandbutton within w_ingreso_pago_pie_pactado
integer x = 2002
integer y = 1248
integer width = 430
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "F","G"
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
END IF
end event

type pb_ok from picturebutton within w_ingreso_pago_pie_pactado
integer x = 1134
integer y = 1244
integer width = 119
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Long		ll_nro_cuotas,ll_tot_reg,ll_indi,ll_estatus,ll_nulo,ll_espado_p=0
String	ls_estado,ls_estado_ant,ls_estado_new,ls_nulo
Datetime	ld_nulo

dw_lista.accepttext()
ll_nro_cuotas			= long(em_nro_cuotas.text)
if ll_nro_cuotas > 1 then
	messagebox("Advertencia","Recuerde, Por cada Pie Pactado se debe Generar UN Documento de Pago ( CI - BE - BA )")
	em_nro_cuotas.text	= '1'
else
	ll_tot_reg				= dw_lista.rowcount()
	setnull(ll_nulo);setnull(ld_nulo);setnull(ls_nulo)
	for ll_indi=1 to ll_tot_reg
		ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
		ls_estado_ant	= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
		ls_estado_new	= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
		ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
		if ls_estado='C' and ls_estado_new='S' then
			if ll_estatus = 0 then
				dw_lista.setitem(ll_indi,'estatus',1)
				dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
				dw_lista.setitem(ll_indi,'estado','P')
				dw_lista.setitem(ll_indi,'fecha_pago',ld_nulo)
				dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
				dw_lista.setitem(ll_indi,'folio',ll_nulo)
				dw_lista.setitem(ll_indi,'caja',ls_nulo)
				dw_lista.setitem(ll_indi,'usuario',ls_nulo)
				dw_lista.setitem(ll_indi,'monto_pie_pagado_peso',ll_nulo)
			end if
		end if
	next
	dw_lista.accepttext()
	if ll_nro_cuotas>0 and ll_nro_cuotas<=ll_tot_reg then
		il_valor_pie_pesos	= 0
		for ll_indi=1 to ll_tot_reg
			ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
			ls_estado_ant	= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
			ls_estado_new	= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
			ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
			if ls_estado='P' and ls_estado_new='N' and ll_espado_p<ll_nro_cuotas then
				if ll_estatus = 1 then
					dw_lista.setitem(ll_indi,'estatus',0)
					dw_lista.setitem(ll_indi,'estado_pago_nuevo','S')
					dw_lista.setitem(ll_indi,'estado','C')
					dw_lista.setitem(ll_indi,'fecha_pago',gd_fecha_pago_plazo)
					dw_lista.setitem(ll_indi,'tipo_cob',is_tipo_cob)
					dw_lista.setitem(ll_indi,'folio',il_folio)
					dw_lista.setitem(ll_indi,'caja',gs_caja)
					dw_lista.setitem(ll_indi,'usuario',gs_user)
					dw_lista.setitem(ll_indi,'monto_pie_pagado_peso',round(dw_lista.getitemnumber(ll_indi,'monto_cuota_peso'),0))
					dw_lista.setitem(ll_indi,'detalle_pago_pie_monto_pie_pagado_uf',round(dw_lista.getitemnumber(ll_indi,'monto_cuota_uf'),4))
					dw_lista.accepttext()
					ll_espado_p ++
					il_valor_pie_pesos	= il_valor_pie_pesos + dw_lista.getitemnumber(ll_indi,'monto_pie_pagado_peso')
				end if
			end if
		next
		if long(em_nro_cuotas.text)>ll_espado_p then em_nro_cuotas.text=string(ll_espado_p)
	else
		messagebox("Advertencia","Rango de Cuotas a Cancelar Inválida")
		em_nro_cuotas.text	= ''
	end if
end if
end event

type em_nro_cuotas from editmask within w_ingreso_pago_pie_pactado
integer x = 763
integer y = 1248
integer width = 343
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
end type

event modified;Long	ll_nro_cuotas,ll_tot_reg
ll_nro_cuotas				= long(em_nro_cuotas.text)
if ll_nro_cuotas>0 and dw_lista.rowcount()>0 then pb_ok.triggerevent(clicked!)
//ll_tot_reg					= dw_lista.rowcount()
//if ll_nro_cuotas>0 and ll_nro_cuotas<=ll_tot_reg then 
//	pb_ok.triggerevent(clicked!)
//else
//	messagebox("Advertencia","Nº Cuotas Inválida")
//	em_nro_cuotas.text	= ''
//end if
end event

type st_2 from statictext within w_ingreso_pago_pie_pactado
integer x = 27
integer y = 1264
integer width = 718
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Indicar Nº Cuotas a Cancelar"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_pago_pie_pactado
boolean visible = false
integer x = 41
integer y = 1252
integer width = 1129
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Pie Pactado está Cancelado"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_pago_pie_pactado
integer x = 2743
integer y = 1248
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso2) then
	if dw_lista.rowcount()=0 then
		if w_ingreso2.tab_ingreso.SelectedTab=2 then
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.SetItem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(), "cantidad", 1)
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.SetItem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(), "monto", w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
		elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(), "cantidad", 1)
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(), "monto", w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1,"c_valor_pie_pesos"))
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.triggerevent(itemchanged!)
		end if
	end if
end if
close(w_ingreso_pago_pie_pactado)
//CloseWithReturn(w_ingreso_pago_pie_pactado, 'N')
end event

type cb_aceptar from commandbutton within w_ingreso_pago_pie_pactado
integer x = 1390
integer y = 1248
integer width = 325
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_estatus,ll_valor_cuota,ll_cuotas_pag,ll_suma_cuota,ll_fila,ll_monto_pagado,ult_folio,ll_ctas_pag_pie,ll_ctas_pactadas_pie,ll_count_cancel,ll_suma_pie_l,&
			ll_new_iva,ll_fila_d,ll_iva_pie_l
String		ls_estado,ls_estado_antiguo,ls_moneda,ls_estado_nuevo
Double	ldb_valor_cuota_pag,ldb_valor_cuota_real,ldb_suma_cuota_real

ll_cuotas_pag	= 0
ll_suma_cuota	= 0
ll_count_cancel	= 0
ll_suma_pie_l	= 0
gl_iva_pie_l		= 0
if isvalid(w_ingreso2) then
	if w_ingreso2.dw_encabezado_ingreso_cupon.rowcount() > 0 then
		CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
			CASE 2 //CI
				ll_tot_reg								= dw_lista.rowcount()
				if ll_tot_reg>0 then
					ll_fila 									= dw_lista.Find("estatus = 0", 1, ll_tot_reg)
					if ll_fila>0 then
						for ll_indi=1 to ll_tot_reg
							ll_estatus					= dw_lista.getitemnumber(ll_indi,'estatus')
							ls_estado					= dw_lista.getitemstring(ll_indi,'estado')
							ls_estado_antiguo			= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
							ls_estado_nuevo			= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
							if ll_estatus=0 and ls_estado_antiguo<>'S' and ls_estado_nuevo='S' and ls_estado='C' then
								ll_cuotas_pag ++
								ll_valor_cuota			= dw_lista.getitemnumber(ll_indi,'monto_cuota_peso')
								ldb_valor_cuota_real	= dw_lista.getitemnumber(ll_indi,'monto_cuota')
								ll_monto_pagado		= dw_lista.getitemnumber(ll_indi,'monto_pie_pagado_peso')
								ldb_valor_cuota_pag	= dw_lista.getitemnumber(ll_indi,'detalle_pago_pie_monto_pie_pagado_uf')
	//							if ll_monto_pagado>0 then
	//								ll_valor_cuota			= ll_valor_cuota - ll_monto_pagado
	//								ldb_valor_cuota_real	= ldb_valor_cuota_real - ldb_valor_cuota_pag
	//							end if
								ll_suma_cuota			= ll_suma_cuota + ll_valor_cuota
								ldb_suma_cuota_real	= ldb_suma_cuota_real + ldb_valor_cuota_real
							end if
						next
						if ll_suma_cuota>0 or ldb_suma_cuota_real>0 or ll_monto_pagado>0 then
							w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'cantidad',1)//ll_cuotas_pag
							ls_moneda					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'moneda')
							if ls_moneda='U' then
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto_uf',ldb_suma_cuota_real)
							else
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',ll_suma_cuota)
							end if
							if dw_lista.update()=1 then
								commit;
								ll_tot_reg								= dw_lista.rowcount()
								if ll_tot_reg>0 then
									for ll_indi=1 to ll_tot_reg
										if dw_lista.getitemstring(ll_indi,'estado')='C' then
											ll_count_cancel ++
										end if
									next
									if ll_count_cancel>0 then
										if is_base='O' or is_base='U' or is_base='M' then
											SELECT	"OFERTA_V"."ULT_FOLIO",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,					:ll_ctas_pag_pie,							:ll_ctas_pactadas_pie
											FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  
											WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
													 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :is_base ) AND  
													 ( "CADENA"."SERIE" = :is_serie ) AND  
													 ( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_OFERTA"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_OFERTA"."SERIE" = :is_serie ) AND  
														 ( "PAGO_OFERTA"."NRO_OFERTA" = :il_numero ) AND  
														 ( "PAGO_OFERTA"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='A' then
											SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",	"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",	"PAGO_AUMENTO"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,					:ll_ctas_pag_pie,							:ll_ctas_pactadas_pie
											FROM 		"CADENA",   "ANEXO_AUMENTO",   "PAGO_AUMENTO"  
											WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
													 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :is_base ) AND  
													 ( "CADENA"."SERIE" = :is_serie ) AND  
													 ( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_AUMENTO"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :is_serie ) AND  
														 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero ) AND  
														 ( "PAGO_AUMENTO"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='L' then
											SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",	"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",	"PAGO_LIBERADOR"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,									:ll_ctas_pag_pie,									:ll_ctas_pactadas_pie
											FROM 		"CADENA",   "ANEXO_LIBERADOR",   "PAGO_LIBERADOR"  
											WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :is_base ) AND  
													 ( "CADENA"."SERIE" = :is_serie ) AND  
													 ( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_LIBERADOR"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
														 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) AND  
														 ( "PAGO_LIBERADOR"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='F' or is_base='G' then
											SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",	"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",	"PRODUCTO_PAGO"."CTAS_PIE_PLAZO"
											INTO 		:ult_folio,									:ll_ctas_pag_pie,									:ll_ctas_pactadas_pie
											FROM 	"CADENA",   "PRODUCTO_ANEXO",   "PRODUCTO_PAGO"  
											WHERE  	( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
													 	( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
													 	( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
													 	( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
													  	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
													 	( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
													 	(("CADENA"."CODIGO" = :is_base ) AND  
													 	( "CADENA"."SERIE" = :is_serie ) AND  
													 	( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PRODUCTO_PAGO"  
												SET 		"CTAS_PIE_PAGADAS" = :ll_count_cancel  
												WHERE  ( "PRODUCTO_PAGO"."SERIE" = :is_serie ) AND  
														 ( "PRODUCTO_PAGO"."NUMERO" = :il_numero ) AND  
														 ( "PRODUCTO_PAGO"."BASE" = :is_base ) AND  
														 ( "PRODUCTO_PAGO"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										end if
									end if
								end if
							else
								rollback;
							end if
							w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
							w_ingreso2.wf_calcular_interes("A")
							cb_cerrar.triggerevent(clicked!)
						else
							wf_borrar_valores()
						end if
					else
						wf_borrar_valores()
					end if
				else
					wf_borrar_valores()
				end if
				
			CASE 3 //BE	
				ll_tot_reg								= dw_lista.rowcount()
				if ll_tot_reg>0 then
					ll_fila 									= dw_lista.Find("estatus = 0", 1, ll_tot_reg)
					if ll_fila>0 then
						
						for ll_indi=1 to ll_tot_reg
							ll_estatus					= dw_lista.getitemnumber(ll_indi,'estatus')
							ls_estado					= dw_lista.getitemstring(ll_indi,'estado')
							ls_estado_antiguo			= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
							ls_estado_nuevo			= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
							if ll_estatus=0 and ls_estado_antiguo<>'S' and ls_estado_nuevo='S' and ls_estado='C' then
								ll_cuotas_pag ++
								ll_valor_cuota			= dw_lista.getitemnumber(ll_indi,'monto_cuota_peso')
								ldb_valor_cuota_real	= dw_lista.getitemnumber(ll_indi,'monto_cuota')
								ll_monto_pagado		= dw_lista.getitemnumber(ll_indi,'monto_pie_pagado_peso')
								if is_base='L' or is_base='F' or is_base='G' then
									ll_suma_pie_l		= ll_suma_pie_l + ll_monto_pagado
								end if
								ldb_valor_cuota_pag	= dw_lista.getitemnumber(ll_indi,'detalle_pago_pie_monto_pie_pagado_uf')
	//							if ll_monto_pagado>0 then
	//								ll_valor_cuota			= ll_valor_cuota - ll_monto_pagado
	//								ldb_valor_cuota_real	= ldb_valor_cuota_real - ldb_valor_cuota_pag
	//							end if
								ll_suma_cuota			= ll_suma_cuota + ll_valor_cuota
								ldb_suma_cuota_real	= ldb_suma_cuota_real + ldb_valor_cuota_real
							end if
						next
						
						if ll_suma_cuota > 0 or ldb_suma_cuota_real > 0 or ll_monto_pagado > 0 then
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'cantidad',1)		//ll_cuotas_pag
							ls_moneda					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'moneda')
							if ls_moneda='U' then
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto_uf',ldb_suma_cuota_real)
							else
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto',ll_suma_cuota)
							end if
							if dw_lista.update()=1 then
								commit;
								ll_tot_reg								= dw_lista.rowcount()
								if ll_tot_reg>0 then
									for ll_indi=1 to ll_tot_reg
										if dw_lista.getitemstring(ll_indi,'estado')='C' then
											ll_count_cancel ++
										end if
									next
									if ll_count_cancel>0 then
										if is_base='O' or is_base='U' then
											SELECT	"OFERTA_V"."ULT_FOLIO",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,					:ll_ctas_pag_pie,							:ll_ctas_pactadas_pie
											FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  
											WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
													 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :is_base ) AND  
													 ( "CADENA"."SERIE" = :is_serie ) AND  
													 ( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_OFERTA"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_OFERTA"."SERIE" = :is_serie ) AND  
														 ( "PAGO_OFERTA"."NRO_OFERTA" = :il_numero ) AND  
														 ( "PAGO_OFERTA"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='A' then
											SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",	"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",	"PAGO_AUMENTO"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,					:ll_ctas_pag_pie,							:ll_ctas_pactadas_pie
											FROM 		"CADENA",   "ANEXO_AUMENTO",   "PAGO_AUMENTO"  
											WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
													 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :is_base ) AND  
													 ( "CADENA"."SERIE" = :is_serie ) AND  
													 ( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_AUMENTO"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :is_serie ) AND  
														 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero ) AND  
														 ( "PAGO_AUMENTO"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='L' then
											SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",	"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",	"PAGO_LIBERADOR"."CTAS_PACTADAS_PIE"
											INTO 		:ult_folio,									:ll_ctas_pag_pie,									:ll_ctas_pactadas_pie
											FROM 	"CADENA",   "ANEXO_LIBERADOR",   "PAGO_LIBERADOR"  
											WHERE  	( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
														( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
														( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
														( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
														( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
														(("CADENA"."CODIGO" = :is_base ) AND  
														( "CADENA"."SERIE" = :is_serie ) AND  
														( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PAGO_LIBERADOR"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_count_cancel  
												WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
														 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) AND  
														 ( "PAGO_LIBERADOR"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										elseif is_base='F' or is_base='G' then
											SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",	"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",	"PRODUCTO_PAGO"."CTAS_PIE_PLAZO"
											INTO 		:ult_folio,									:ll_ctas_pag_pie,									:ll_ctas_pactadas_pie
											FROM 	"CADENA",   "PRODUCTO_ANEXO",   "PRODUCTO_PAGO"  
											WHERE  	( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
														( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
														( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
														( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
														( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
														( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
														(("CADENA"."CODIGO" = :is_base ) AND  
														( "CADENA"."SERIE" = :is_serie ) AND  
														( "CADENA"."NUMERO" = :il_numero )   )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
	//											if ( ll_ctas_pag_pie + ll_count_cancel ) > ll_ctas_pactadas_pie then
												if ll_count_cancel > ll_ctas_pactadas_pie then
													ll_count_cancel	= ll_ctas_pactadas_pie
												end if
												UPDATE	"PRODUCTO_PAGO"  
												SET 		"CTAS_PIE_PAGADAS" = :ll_count_cancel  
												WHERE 	( "PRODUCTO_PAGO"."SERIE" = :is_serie ) AND  
															( "PRODUCTO_PAGO"."BASE" = :is_base ) AND  
															( "PRODUCTO_PAGO"."NUMERO" = :il_numero ) AND  
															( "PRODUCTO_PAGO"."FOLIO" = :ult_folio )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										end if
											
									end if
								end if
							else
								rollback;
							end if
							if (is_base = 'L' or is_base='F' or is_base='G') and ll_suma_pie_l > 0 then
								ll_fila_d							= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find("tipo_cob = 'D' ",1,w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
								if ll_fila_d = 0 then
									gl_iva_pie_l					= round(ll_suma_pie_l * (idb_iva - 1),0)
									ll_new_iva					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_iva,'moneda','P')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_iva,'cantidad',1)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_iva,'monto',gl_iva_pie_l)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_iva,'tipo_cob','D')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, "uf", gd_uf)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, "folio", 0)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, "estado", 'N')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, 'base',gs_base)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, 'serie',gs_serie)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva, 'numero',gi_numero)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva,'cod_servicio',0)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva,'monto_uf',ROUND(gl_iva_pie_l / gd_uf,2) )
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_iva,'tipo_cob_otro','0')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
								end if
							end if
		//					w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.triggerevent(itemchanged!)
	//						w_ingreso2.wf_calcular_interes("A")
							cb_cerrar.triggerevent(clicked!)
						else
							wf_borrar_valores()
						end if
					else
						wf_borrar_valores()
					end if
				else
					wf_borrar_valores()
				end if
		END CHOOSE
	end if
elseif isvalid(w_boletas_cuotas) then
	w_boletas_cuotas.dw_detalle_bl.SetItem(w_boletas_cuotas.dw_detalle_bl.getrow(), "monto", il_valor_pie_pesos)
	w_boletas_cuotas.dw_detalle_bl.accepttext()
	w_boletas_cuotas.dw_detalle_bl.setfocus()
	cb_cerrar.triggerevent(clicked!)
elseif isvalid(w_repacta) then
	w_repacta.dw_detalle_ci.SetItem(w_repacta.dw_detalle_ci.getrow(), "monto", il_valor_pie_pesos)
	if is_base = 'L' and il_valor_pie_pesos > 0 then
		ll_fila_d							= w_repacta.dw_detalle_ci.find("tipo_cob = 'D' ",1,w_repacta.dw_detalle_ci.rowcount())
		if ll_fila_d = 0 then
			ll_iva_pie_l					= round(il_valor_pie_pesos * (idb_iva - 1),0)
			ll_new_iva					= w_repacta.dw_detalle_ci.insertrow(0)
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "folio", 0)
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "cantidad",1)
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "tipo_cob",'D')
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "monto", ll_iva_pie_l)
			w_repacta.dw_detalle_ci.SetItem(ll_new_iva, "monto_uf", ROUND(ll_iva_pie_l / gd_uf,2))
		end if
	end if
	w_repacta.dw_detalle_ci.accepttext()
	w_repacta.dw_detalle_ci.setfocus()
	cb_cerrar.triggerevent(clicked!)
end if
end event

type dw_lista from datawindow within w_ingreso_pago_pie_pactado
integer x = 37
integer y = 40
integer width = 3031
integer height = 1168
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_pagar_cuotas_pie_fune"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_estado_ant,ls_estado,ls_estado_new,ls_nulo
Long		ll_estatus,ll_estatus_ant,ll_tot_reg,ll_indi,ll_nulo
Datetime	ld_nulo
dw_lista.accepttext()
ls_columna			= dwo.name
if row>0 then
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if ls_columna='estatus' then is_mod='S'
end if
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	setnull(ll_nulo);setnull(ld_nulo);setnull(ls_nulo)
	if ls_columna='t_deshabilitar' then
		for ll_indi=1 to ll_tot_reg
			ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
			ls_estado_ant	= dw_lista.getitemstring(ll_indi,'estado_pago_antiguo')
			ls_estado_new	= dw_lista.getitemstring(ll_indi,'estado_pago_nuevo')
			ll_estatus		= dw_lista.getitemnumber(ll_indi,'estatus')
			if ls_estado='C' and ls_estado_new='S' then
				if ll_estatus = 0 then
					dw_lista.setitem(ll_indi,'estatus',1)
					dw_lista.setitem(ll_indi,'estado_pago_nuevo','N')
					dw_lista.setitem(ll_indi,'estado','P')
					dw_lista.setitem(ll_indi,'fecha_pago',ld_nulo)
					dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
					dw_lista.setitem(ll_indi,'folio',ll_nulo)
					dw_lista.setitem(ll_indi,'caja',ls_nulo)
					dw_lista.setitem(ll_indi,'usuario',ls_nulo)
					dw_lista.setitem(ll_indi,'monto_pie_pagado_peso',ll_nulo)
				end if
			end if
		next
	end if
end if
end event

event losefocus;em_nro_cuotas.setfocus()
end event

