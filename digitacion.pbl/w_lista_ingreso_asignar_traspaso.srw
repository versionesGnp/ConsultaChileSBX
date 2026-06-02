forward
global type w_lista_ingreso_asignar_traspaso from window
end type
type st_2 from statictext within w_lista_ingreso_asignar_traspaso
end type
type st_comprobante from statictext within w_lista_ingreso_asignar_traspaso
end type
type st_1 from statictext within w_lista_ingreso_asignar_traspaso
end type
type cb_asignar from commandbutton within w_lista_ingreso_asignar_traspaso
end type
type cb_cerrar from commandbutton within w_lista_ingreso_asignar_traspaso
end type
type dw_rezagos from datawindow within w_lista_ingreso_asignar_traspaso
end type
type dw_cuotas_pie from datawindow within w_lista_ingreso_asignar_traspaso
end type
end forward

global type w_lista_ingreso_asignar_traspaso from window
integer width = 3666
integer height = 1544
boolean titlebar = true
string title = "Detalle Pagos y Asignación Pie Pactado en Rezago"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_2 st_2
st_comprobante st_comprobante
st_1 st_1
cb_asignar cb_asignar
cb_cerrar cb_cerrar
dw_rezagos dw_rezagos
dw_cuotas_pie dw_cuotas_pie
end type
global w_lista_ingreso_asignar_traspaso w_lista_ingreso_asignar_traspaso

type variables
String	is_base,is_serie,is_tipo_cob
Long		il_folio_pie
Double	idb_pie,idb_uf_fecha_indicada,il_numero
end variables

on w_lista_ingreso_asignar_traspaso.create
this.st_2=create st_2
this.st_comprobante=create st_comprobante
this.st_1=create st_1
this.cb_asignar=create cb_asignar
this.cb_cerrar=create cb_cerrar
this.dw_rezagos=create dw_rezagos
this.dw_cuotas_pie=create dw_cuotas_pie
this.Control[]={this.st_2,&
this.st_comprobante,&
this.st_1,&
this.cb_asignar,&
this.cb_cerrar,&
this.dw_rezagos,&
this.dw_cuotas_pie}
end on

on w_lista_ingreso_asignar_traspaso.destroy
destroy(this.st_2)
destroy(this.st_comprobante)
destroy(this.st_1)
destroy(this.cb_asignar)
destroy(this.cb_cerrar)
destroy(this.dw_rezagos)
destroy(this.dw_cuotas_pie)
end on

event open;Datetime	idt_fecha_pacta
Long		ll_indi,ll_tot_reg_rez
String		ls_rezago

gf_centrar(w_lista_ingreso_asignar_traspaso)
dw_rezagos.settransobject(sqlca)
dw_cuotas_pie.settransobject(sqlca)
is_base 						= trim(substr(1,1,Message.StringParm))
is_serie						= trim(substr(1,2,Message.StringParm))
il_numero					= Double(substr(1,3,Message.StringParm))
idb_pie						= double(substr(1,4,Message.StringParm))
is_tipo_cob					= trim(substr(1,5,Message.StringParm))
il_folio_pie					= long(substr(1,6,Message.StringParm))
st_comprobante.text		= is_tipo_cob+' - '+string(il_folio_pie,"###,###,###,###,###")
SELECT DISTINCT	"DETALLE_PAGO_PIE"."FECHA_CREA"  
INTO		:idt_fecha_pacta  
FROM 	"DETALLE_PAGO_PIE"  
WHERE	( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
			( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
			( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero )   
USING	sqlca;
if sqlca.sqlcode=0 then
	if dw_rezagos.retrieve(is_base,is_serie,il_numero,is_tipo_cob,il_folio_pie)=0 then
		messagebox("Adevertencia","No Registra Pagos en Rezago para el Comprobante "+is_tipo_cob+'-'+string(il_folio_pie,"###,###,###,###,##0"))
		cb_cerrar.triggerevent(clicked!)
	else
		ll_tot_reg_rez				= dw_rezagos.rowcount()
		for ll_indi=1 to ll_tot_reg_rez
			ls_rezago				= dw_rezagos.getitemstring(ll_indi,'ingreso_rezago')
			if ls_rezago='S' then
				idt_fecha_pacta	= dw_rezagos.getitemdatetime(ll_indi,'fecha_pago')
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO 		:idb_uf_fecha_indicada  
				FROM 		"TAB_UF"  
				WHERE 	"TAB_UF"."FECHA_UF" = :idt_fecha_pacta   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					exit;
				else
					messagebox("Advertencia","No está registrada la U.F. del dia "+string(idt_fecha_pacta,"dd/mm/yyyy"))
					cb_cerrar.triggerevent(clicked!)	
				end if
			end if
		next
		if idb_uf_fecha_indicada>0 then 
			if dw_cuotas_pie.retrieve(is_base,is_serie,il_numero,idb_uf_fecha_indicada)=0 then
				messagebox("Adevertencia","No Registra Pactación Pie")
				cb_cerrar.triggerevent(clicked!)
			end if
		end if
	end if
else
	CloseWithReturn(w_lista_ingreso_asignar_traspaso,'S')
end if
end event

type st_2 from statictext within w_lista_ingreso_asignar_traspaso
integer x = 1541
integer y = 52
integer width = 832
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Cuotas Pie Parceladas"
boolean focusrectangle = false
end type

type st_comprobante from statictext within w_lista_ingreso_asignar_traspaso
integer x = 530
integer y = 24
integer width = 507
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_lista_ingreso_asignar_traspaso
integer x = 32
integer y = 32
integer width = 494
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante Nº"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_asignar from commandbutton within w_lista_ingreso_asignar_traspaso
integer x = 27
integer y = 1304
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event clicked;Long		ll_tot_reg_rez,ll_tot_reg_pie,ll_fila,ll_resp,ll_indi,ll_monto,ll_folio,&
			ll_indi_pago,ll_pie_pagado_saldo,ll_saldo,ll_count_reg,ll_ult_folio,ll_peso_a_pagar,&
			ll_valor_cuota_peso,ll_ctas_pag_pie
datetime	ldt_fecha_pago
String	ls_tipo_cob,ls_caja,ls_estado_pago
Double	ldb_uf,ldb_monto_pagado_uf,ldb_monto_debe_pagar_uf,ll_monto_pagado_peso,ldb_saldo_uf

ll_tot_reg_rez										= dw_rezagos.rowcount()
if ll_tot_reg_rez>0 then
	ll_tot_reg_pie									= dw_cuotas_pie.rowcount()
	ll_fila 												= dw_cuotas_pie.Find("detalle_pago_pie_estado = 'P'", 1, dw_cuotas_pie.RowCount())
	if ll_fila>0 then
		ll_resp										= messagebox("Advertencia","Está seguro de Asignar",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			for ll_indi=1 to ll_tot_reg_rez
				ll_monto_pagado_peso			= dw_rezagos.getitemnumber(ll_indi,'suma_monto')
				ldt_fecha_pago						= dw_rezagos.getitemdatetime(ll_indi,'fecha_pago')
				ll_monto								= dw_rezagos.getitemnumber(ll_indi,'monto')
				ls_tipo_cob							= dw_rezagos.getitemstring(ll_indi,'tipo_cob')
				ll_folio								= dw_rezagos.getitemnumber(ll_indi,'folio')
				ls_caja								= dw_rezagos.getitemstring(ll_indi,'ingreso_cod_caja')
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO 		:ldb_uf  
				FROM 	"TAB_UF"  
				WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_pago
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ldb_monto_pagado_uf			= round(ll_monto / ldb_uf,4)
					ll_pie_pagado_saldo			= 0
					for ll_indi_pago=1 to ll_tot_reg_pie
						ls_estado_pago				= dw_cuotas_pie.getitemstring(ll_indi_pago,'detalle_pago_pie_estado')
						if ls_estado_pago='P' then
							ldb_monto_debe_pagar_uf	= round(dw_cuotas_pie.getitemnumber(ll_indi_pago,'valor_cuota_uf'),4)
							ll_valor_cuota_peso		= dw_cuotas_pie.getitemnumber(ll_indi_pago,'valor_cuota_peso')
							if ldb_monto_pagado_uf > (ldb_monto_debe_pagar_uf - 0.1) then
								ll_pie_pagado_saldo	= ll_monto - ll_valor_cuota_peso
								ldb_saldo_uf			= ldb_monto_pagado_uf - ldb_monto_debe_pagar_uf
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_estado','C')
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_fecha_pago',ldt_fecha_pago)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_tipo_cob',ls_tipo_cob)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_folio',ll_folio)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_monto_pie_pagado_peso',ll_valor_cuota_peso)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_monto_pie_pagado_uf',ldb_monto_debe_pagar_uf)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_caja',ls_caja)
								dw_cuotas_pie.setitem(ll_indi_pago,'detalle_pago_pie_usuario',gs_user)
								ll_monto					= ll_pie_pagado_saldo
								ldb_monto_pagado_uf	= ldb_saldo_uf
							end if
						end if
						dw_cuotas_pie.accepttext()
					next	
					if dw_cuotas_pie.update()=1 then
						commit;
						if is_base='O' or is_base='U' then
							SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
							INTO 		:ll_count_reg  
							FROM 		"DETALLE_PAGO_PIE"  
							WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
									 ( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
									 ( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero ) AND  
									 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
							USING		sqlca;
							if ll_count_reg>0 then
								SELECT	"OFERTA_V"."ULT_FOLIO",
											"PAGO_OFERTA"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"OFERTA_V",   
											"PAGO_OFERTA"  
								WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_OFERTA"  
									SET 		"CTAS_PAGADAS_PIE" = :ll_count_reg  
									WHERE  ( "PAGO_OFERTA"."SERIE" = :is_serie ) AND  
											 ( "PAGO_OFERTA"."NRO_OFERTA" = :il_numero ) AND  
											 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								SELECT	"OFERTA_V"."ULT_FOLIO",
											"PAGO_OFERTA"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"OFERTA_V",   
											"PAGO_OFERTA"  
								WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_OFERTA"  
									SET 		"CTAS_PAGADAS_PIE" = 1  
									WHERE  ( "PAGO_OFERTA"."SERIE" = :is_serie ) AND  
											 ( "PAGO_OFERTA"."NRO_OFERTA" = :il_numero ) AND  
											 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							end if
						elseif is_base='L' then
							SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
							INTO 		:ll_count_reg  
							FROM 	"DETALLE_PAGO_PIE"  
							WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
									 ( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
									 ( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero ) AND  
									 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
							USING		sqlca;
							if ll_count_reg>0 then
								SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
											"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"ANEXO_LIBERADOR",   
											"PAGO_LIBERADOR"  
								WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
										 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_LIBERADOR"  
									SET 		"CTAS_PAGADAS_PIE" = :ll_count_reg  
									WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
											 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) AND  
											 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
											"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"ANEXO_LIBERADOR",   
											"PAGO_LIBERADOR"  
								WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
										 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_LIBERADOR"  
									SET 		"CTAS_PAGADAS_PIE" = 1  
									WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
											 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) AND  
											 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							end if
						elseif is_base='A' then
							SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
							INTO 		:ll_count_reg  
							FROM 	"DETALLE_PAGO_PIE"  
							WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
									 ( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
									 ( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero ) AND  
									 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
							USING		sqlca;
							if ll_count_reg>0 then
								SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",
											"PAGO_AUMENTO"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"ANEXO_AUMENTO",   
											"PAGO_AUMENTO"  
								WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
										 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
										 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
										 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
										 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_AUMENTO"  
									SET 		"CTAS_PAGADAS_PIE" = :ll_count_reg  
									WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :is_serie ) AND  
											 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero ) AND  
											 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",
											"PAGO_AUMENTO"."CTAS_PAGADAS_PIE"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 	"CADENA",   
											"ANEXO_AUMENTO",   
											"PAGO_AUMENTO"  
								WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
										 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
										 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
										 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
										 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PAGO_AUMENTO"  
									SET 		"CTAS_PAGADAS_PIE" = 1  
									WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :is_serie ) AND  
											 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero ) AND  
											 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							end if	
							
						elseif is_base='F' or is_base='G' or is_base='V' then
							SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
							INTO 		:ll_count_reg  
							FROM 	"DETALLE_PAGO_PIE"  
							WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
									 ( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
									 ( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero ) AND  
									 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
							USING		sqlca;
							if ll_count_reg>0 then
								SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",
											"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 		"CADENA",   
											"PRODUCTO_ANEXO",   
											"PRODUCTO_PAGO"  
								WHERE  ( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
										 ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
										 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
										 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PRODUCTO_PAGO"  
									SET 		"CTAS_PIE_PAGADAS" = :ll_count_reg  
									WHERE  ( "PRODUCTO_PAGO"."SERIE" = :is_serie ) AND  
											 ( "PRODUCTO_PAGO"."NUMERO" = :il_numero ) AND  
											 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",
											"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS"
								INTO 		:ll_ult_folio,
											:ll_ctas_pag_pie
								FROM 	"CADENA",   
											"PRODUCTO_ANEXO",   
											"PRODUCTO_PAGO"  
								WHERE  ( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
										 ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
										 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
										 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = :is_base ) AND  
										 ( "CADENA"."SERIE" = :is_serie ) AND  
										 ( "CADENA"."NUMERO" = :il_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"PRODUCTO_PAGO"  
									SET 		"CTAS_PIE_PAGADAS" = 1  
									WHERE  ( "PRODUCTO_PAGO"."SERIE" = :is_serie ) AND  
											 ( "PRODUCTO_PAGO"."NUMERO" = :il_numero ) AND  
											 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							end if
						end if
						messagebox("Grabar","Grabación Exitosa")
						CloseWithReturn(w_lista_ingreso_asignar_traspaso,'S')
					else
						rollback;
						messagebox("Error Grabar","Error al Grabación Exitosa")
					end if
				else
					messagebox("Advertencia","No Registra valor U.F. el día "+string(ldt_fecha_pago,"dd/mm/yyyy"))
					exit
				end if
			next
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_lista_ingreso_asignar_traspaso
integer x = 3237
integer y = 1304
integer width = 366
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;CloseWithReturn(w_lista_ingreso_asignar_traspaso,'N')
end event

type dw_rezagos from datawindow within w_lista_ingreso_asignar_traspaso
integer x = 27
integer y = 128
integer width = 1440
integer height = 1128
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_ingreso_pie_rezago"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_cuotas_pie from datawindow within w_lista_ingreso_asignar_traspaso
integer x = 1518
integer y = 128
integer width = 2085
integer height = 1128
integer taborder = 10
string title = "none"
string dataobject = "dw_sumar_pie_traspaso_rezago"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

