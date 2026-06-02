forward
global type w_detalle_seguros_desgravamen from window
end type
type cb_filtrar from commandbutton within w_detalle_seguros_desgravamen
end type
type cb_ordenar from commandbutton within w_detalle_seguros_desgravamen
end type
type cb_exportar from commandbutton within w_detalle_seguros_desgravamen
end type
type cb_imprimir from commandbutton within w_detalle_seguros_desgravamen
end type
type cb_cerrar from commandbutton within w_detalle_seguros_desgravamen
end type
type dw_detalle from datawindow within w_detalle_seguros_desgravamen
end type
end forward

global type w_detalle_seguros_desgravamen from window
integer width = 3003
integer height = 1712
boolean titlebar = true
string title = "Detalle Seguro de Desgravamen"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_seguros_desgravamen w_detalle_seguros_desgravamen

type variables
long	il_row
end variables

on w_detalle_seguros_desgravamen.create
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_seguros_desgravamen.destroy
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_tipo_sol,ls_base,ls_serie,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat
long		ll_rut,ll_ctas_pactadas,ll_ctas_pagadas,ll_new
Double	ll_valor_cta,ll_numero
Datetime	ldt_fecha  
SetPointer(HourGlass!)
ls_tipo_sol	= trim(Message.StringParm)
if isnull(ls_tipo_sol) or ls_tipo_sol='' then close(w_detalle_seguros_desgravamen)
gf_centrar(w_detalle_seguros_desgravamen)
dw_detalle.settransobject(sqlca)

connect using trans_1;
connect using trans_2;
IF ls_tipo_sol='4' THEN
	DECLARE x1 CURSOR FOR  
	SELECT	"SOL_ESTATUS"."BASE",   
				"SOL_ESTATUS"."SERIE",   
				"SOL_ESTATUS"."NUMERO"  
	FROM 		"SOL_ESTATUS",   
				"SOL_SEGURO_DESG"  
	WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
			 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) and 
				"SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol )  
	Using		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			Fetch x1 into :ls_base,:ls_serie,:ll_numero;
			if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) then
				ll_new	= dw_detalle.insertrow(0)
				dw_detalle.scrolltorow(ll_new)
				dw_detalle.setitem(ll_new,'base',ls_base)
				dw_detalle.setitem(ll_new,'serie',ls_serie)
				dw_detalle.setitem(ll_new,'numero',ll_numero)
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"CLIENTE"."RUT",   
									"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO",   
									"PAGO_OFERTA"."NRO_CUOTAS",   
									"PAGO_OFERTA"."VALOR_CUOTA",   
									"OFERTA_V"."CTA_PAG_S",   
									"OFERTA_V"."U_FECHA"  
						INTO 		:ll_rut,   
									:ls_dv,   
									:ls_nombre,   
									:ls_ap_pat,   
									:ls_ap_mat,   
									:ll_ctas_pactadas,   
									:ll_valor_cta,   
									:ll_ctas_pagadas,   
									:ldt_fecha  
						FROM 		"CLIENTE",   
									"OFERTA_V",   
									"PAGO_OFERTA",   
									"SOL_ESTATUS"  
						WHERE	 ( "CLIENTE"."RUT" = "OFERTA_V"."RUT" ) and  
								 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "PAGO_OFERTA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "PAGO_OFERTA"."NRO_OFERTA" = "SOL_ESTATUS"."NUMERO" ) and  
								 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) and
								 ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
								 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
								 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) )   
						USING		trans_1;
						if trans_1.sqlcode=0 then
							dw_detalle.setitem(ll_new,'nombre',ls_nombre)
							dw_detalle.setitem(ll_new,'ap_paterno',ls_ap_pat)
							dw_detalle.setitem(ll_new,'ap_materno',ls_ap_mat)
							dw_detalle.setitem(ll_new,'rut',ll_rut)
							dw_detalle.setitem(ll_new,'dv',ls_dv)
							dw_detalle.setitem(ll_new,'ctas_pactadas',ll_ctas_pactadas)
							dw_detalle.setitem(ll_new,'valor_cta',ll_valor_cta)
							dw_detalle.setitem(ll_new,'ctas_pagadas',ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'saldo_ctas',ll_ctas_pactadas - ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'fecha_ctto',ldt_fecha)
						end if
	
					CASE 'L'
						SELECT	"CLIENTE"."RUT",   
									"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO",   
									"PAGO_LIBERADOR"."NRO_CUOTAS",   
									"PAGO_LIBERADOR"."VALOR_CUOTA",   
									"ANEXO_LIBERADOR"."CTA_PAG_M",   
									"ANEXO_LIBERADOR"."U_FECHA"  
						INTO		:ll_rut,
									:ls_dv,
									:ls_nombre,
									:ls_ap_pat,
									:ls_ap_mat,
									:ll_ctas_pactadas,
									:ll_valor_cta,
									:ll_ctas_pagadas,
									:ldt_fecha
						FROM 		"ANEXO_LIBERADOR",   
									"CLIENTE",   
									"PAGO_LIBERADOR",   
									"SOL_ESTATUS",   
									"SOL_SEGURO_DESG"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								 ( "CLIENTE"."RUT" = "ANEXO_LIBERADOR"."RUT" ) and  
								 ( "PAGO_LIBERADOR"."SERIE_M" = "SOL_ESTATUS"."SERIE" ) and  
								 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = "SOL_ESTATUS"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
								 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
								 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) and
								 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
								 ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
								 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
								 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) )   
						USING		trans_2;
						if trans_2.sqlcode=0 then
							dw_detalle.setitem(ll_new,'nombre',ls_nombre)
							dw_detalle.setitem(ll_new,'ap_paterno',ls_ap_pat)
							dw_detalle.setitem(ll_new,'ap_materno',ls_ap_mat)
							dw_detalle.setitem(ll_new,'rut',ll_rut)
							dw_detalle.setitem(ll_new,'dv',ls_dv)
							dw_detalle.setitem(ll_new,'ctas_pactadas',ll_ctas_pactadas)
							dw_detalle.setitem(ll_new,'valor_cta',ll_valor_cta)
							dw_detalle.setitem(ll_new,'ctas_pagadas',ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'saldo_ctas',ll_ctas_pactadas - ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'fecha_ctto',ldt_fecha)
						end if
				END CHOOSE
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ll_numero)
			setnull(ls_dv);setnull(ls_nombre);setnull(ls_ap_pat);setnull(ls_ap_mat)
			setnull(ll_rut);setnull(ll_ctas_pactadas);setnull(ll_valor_cta);setnull(ll_ctas_pagadas)
			setnull(ldt_fecha)
		LOOP
		dw_detalle.accepttext()
		dw_detalle.SORT()
		dw_detalle.scrolltorow(1)
	end if
	close x1;
ELSEIF ls_tipo_sol='22' THEN
	DECLARE x2 CURSOR FOR  
	SELECT	"SOL_ESTATUS"."BASE",   
				"SOL_ESTATUS"."SERIE",   
				"SOL_ESTATUS"."NUMERO"  
	FROM 		"SOL_ESTATUS",   
				"SOL_SEGURO_FALLECE"  
	WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
			 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) and 
				"SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol )  
	Using		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			Fetch x2 into :ls_base,:ls_serie,:ll_numero;
			if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) then
				ll_new	= dw_detalle.insertrow(0)
				dw_detalle.scrolltorow(ll_new)
				dw_detalle.setitem(ll_new,'base',ls_base)
				dw_detalle.setitem(ll_new,'serie',ls_serie)
				dw_detalle.setitem(ll_new,'numero',ll_numero)
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"CLIENTE"."RUT",   
									"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO",   
									"PAGO_OFERTA"."NRO_CUOTAS",   
									"PAGO_OFERTA"."VALOR_CUOTA",   
									"OFERTA_V"."CTA_PAG_S",   
									"OFERTA_V"."U_FECHA"  
						INTO 		:ll_rut,   
									:ls_dv,   
									:ls_nombre,   
									:ls_ap_pat,   
									:ls_ap_mat,   
									:ll_ctas_pactadas,   
									:ll_valor_cta,   
									:ll_ctas_pagadas,   
									:ldt_fecha  
						FROM 		"CLIENTE",   
									"OFERTA_V",   
									"PAGO_OFERTA",   
									"SOL_ESTATUS"  
						WHERE	 ( "CLIENTE"."RUT" = "OFERTA_V"."RUT" ) and  
								 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "PAGO_OFERTA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "PAGO_OFERTA"."NRO_OFERTA" = "SOL_ESTATUS"."NUMERO" ) and  
								 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) and
								 ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
								 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
								 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) )   
						USING		trans_1;
						if trans_1.sqlcode=0 then
							dw_detalle.setitem(ll_new,'nombre',ls_nombre)
							dw_detalle.setitem(ll_new,'ap_paterno',ls_ap_pat)
							dw_detalle.setitem(ll_new,'ap_materno',ls_ap_mat)
							dw_detalle.setitem(ll_new,'rut',ll_rut)
							dw_detalle.setitem(ll_new,'dv',ls_dv)
							dw_detalle.setitem(ll_new,'ctas_pactadas',ll_ctas_pactadas)
							dw_detalle.setitem(ll_new,'valor_cta',ll_valor_cta)
							dw_detalle.setitem(ll_new,'ctas_pagadas',ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'saldo_ctas',ll_ctas_pactadas - ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'fecha_ctto',ldt_fecha)
						end if
	
					CASE 'L'
						SELECT	"CLIENTE"."RUT",   
									"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO",   
									"PAGO_LIBERADOR"."NRO_CUOTAS",   
									"PAGO_LIBERADOR"."VALOR_CUOTA",   
									"ANEXO_LIBERADOR"."CTA_PAG_M",   
									"ANEXO_LIBERADOR"."U_FECHA"  
						INTO		:ll_rut,
									:ls_dv,
									:ls_nombre,
									:ls_ap_pat,
									:ls_ap_mat,
									:ll_ctas_pactadas,
									:ll_valor_cta,
									:ll_ctas_pagadas,
									:ldt_fecha
						FROM 		"ANEXO_LIBERADOR",   
									"CLIENTE",   
									"PAGO_LIBERADOR",   
									"SOL_ESTATUS",   
									"SOL_SEGURO_FALLECE"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								 ( "CLIENTE"."RUT" = "ANEXO_LIBERADOR"."RUT" ) and  
								 ( "PAGO_LIBERADOR"."SERIE_M" = "SOL_ESTATUS"."SERIE" ) and  
								 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = "SOL_ESTATUS"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
								 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
								 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) and
								 (("SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
								 ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
								 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
								 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) )   
						USING		trans_2;
						if trans_2.sqlcode=0 then
							dw_detalle.setitem(ll_new,'nombre',ls_nombre)
							dw_detalle.setitem(ll_new,'ap_paterno',ls_ap_pat)
							dw_detalle.setitem(ll_new,'ap_materno',ls_ap_mat)
							dw_detalle.setitem(ll_new,'rut',ll_rut)
							dw_detalle.setitem(ll_new,'dv',ls_dv)
							dw_detalle.setitem(ll_new,'ctas_pactadas',ll_ctas_pactadas)
							dw_detalle.setitem(ll_new,'valor_cta',ll_valor_cta)
							dw_detalle.setitem(ll_new,'ctas_pagadas',ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'saldo_ctas',ll_ctas_pactadas - ll_ctas_pagadas)
							dw_detalle.setitem(ll_new,'fecha_ctto',ldt_fecha)
						end if
				END CHOOSE
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ll_numero)
			setnull(ls_dv);setnull(ls_nombre);setnull(ls_ap_pat);setnull(ls_ap_mat)
			setnull(ll_rut);setnull(ll_ctas_pactadas);setnull(ll_valor_cta);setnull(ll_ctas_pagadas)
			setnull(ldt_fecha)
		LOOP
		dw_detalle.accepttext()
		dw_detalle.SORT()
		dw_detalle.scrolltorow(1)
	end if
	close x2;
END IF
Disconnect using trans_1;
Disconnect using trans_2;
SetPointer(Arrow!)
end event

type cb_filtrar from commandbutton within w_detalle_seguros_desgravamen
integer x = 983
integer y = 1480
integer width = 288
integer height = 104
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_ordenar from commandbutton within w_detalle_seguros_desgravamen
integer x = 695
integer y = 1480
integer width = 288
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_exportar from commandbutton within w_detalle_seguros_desgravamen
integer x = 407
integer y = 1480
integer width = 288
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_detalle_seguros_desgravamen
integer x = 59
integer y = 1480
integer width = 288
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_Print( dw_detalle )
end if
end event

type cb_cerrar from commandbutton within w_detalle_seguros_desgravamen
integer x = 2651
integer y = 1480
integer width = 288
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_seguros_desgravamen)
end event

type dw_detalle from datawindow within w_detalle_seguros_desgravamen
integer x = 46
integer y = 40
integer width = 2894
integer height = 1392
integer taborder = 10
string dataobject = "dwe_detalle_seguros_desgravamen"
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

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

