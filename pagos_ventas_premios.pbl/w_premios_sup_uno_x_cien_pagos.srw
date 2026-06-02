forward
global type w_premios_sup_uno_x_cien_pagos from window
end type
type cb_actualiza_pag from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_clasif_hist from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_filtrar from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type hpb_1 from hprogressbar within w_premios_sup_uno_x_cien_pagos
end type
type st_porc from statictext within w_premios_sup_uno_x_cien_pagos
end type
type st_fondo from statictext within w_premios_sup_uno_x_cien_pagos
end type
type cb_grabar from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_cta_cte from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_limpiar from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type dw_lista_premio from datawindow within w_premios_sup_uno_x_cien_pagos
end type
type pb_aceptar from picturebutton within w_premios_sup_uno_x_cien_pagos
end type
type em_inicio from editmask within w_premios_sup_uno_x_cien_pagos
end type
type em_termino from editmask within w_premios_sup_uno_x_cien_pagos
end type
type cb_exportar from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_2 from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type cb_imprimir from commandbutton within w_premios_sup_uno_x_cien_pagos
end type
type dw_lista from datawindow within w_premios_sup_uno_x_cien_pagos
end type
type dw_seleccion from datawindow within w_premios_sup_uno_x_cien_pagos
end type
type dw_fecha_cierre from datawindow within w_premios_sup_uno_x_cien_pagos
end type
type gb_1 from groupbox within w_premios_sup_uno_x_cien_pagos
end type
type st_cuenta from statictext within w_premios_sup_uno_x_cien_pagos
end type
end forward

global type w_premios_sup_uno_x_cien_pagos from window
integer width = 3451
integer height = 1888
boolean titlebar = true
string title = "Ingreso Caja Supervisores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_actualiza_pag cb_actualiza_pag
cb_clasif_hist cb_clasif_hist
cb_filtrar cb_filtrar
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
cb_grabar cb_grabar
cb_cta_cte cb_cta_cte
cb_limpiar cb_limpiar
dw_lista_premio dw_lista_premio
pb_aceptar pb_aceptar
em_inicio em_inicio
em_termino em_termino
cb_exportar cb_exportar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
dw_seleccion dw_seleccion
dw_fecha_cierre dw_fecha_cierre
gb_1 gb_1
st_cuenta st_cuenta
end type
global w_premios_sup_uno_x_cien_pagos w_premios_sup_uno_x_cien_pagos

type variables
long il_row
end variables

on w_premios_sup_uno_x_cien_pagos.create
this.cb_actualiza_pag=create cb_actualiza_pag
this.cb_clasif_hist=create cb_clasif_hist
this.cb_filtrar=create cb_filtrar
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.cb_grabar=create cb_grabar
this.cb_cta_cte=create cb_cta_cte
this.cb_limpiar=create cb_limpiar
this.dw_lista_premio=create dw_lista_premio
this.pb_aceptar=create pb_aceptar
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dw_seleccion=create dw_seleccion
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_1=create gb_1
this.st_cuenta=create st_cuenta
this.Control[]={this.cb_actualiza_pag,&
this.cb_clasif_hist,&
this.cb_filtrar,&
this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.cb_grabar,&
this.cb_cta_cte,&
this.cb_limpiar,&
this.dw_lista_premio,&
this.pb_aceptar,&
this.em_inicio,&
this.em_termino,&
this.cb_exportar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.dw_seleccion,&
this.dw_fecha_cierre,&
this.gb_1,&
this.st_cuenta}
end on

on w_premios_sup_uno_x_cien_pagos.destroy
destroy(this.cb_actualiza_pag)
destroy(this.cb_clasif_hist)
destroy(this.cb_filtrar)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.cb_grabar)
destroy(this.cb_cta_cte)
destroy(this.cb_limpiar)
destroy(this.dw_lista_premio)
destroy(this.pb_aceptar)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dw_seleccion)
destroy(this.dw_fecha_cierre)
destroy(this.gb_1)
destroy(this.st_cuenta)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_premios_sup_uno_x_cien_pagos)
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_premios_sup_uno_x_cien_pagos)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_actualiza_pag from commandbutton within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 2542
integer y = 116
integer width = 475
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Pagos"
end type

event clicked;string	ls_base,ls_serie
long		ll_graba,ll_tot_reg,ll_res,ll_dia,ll_cod_parque
datetime	ldt_fecha_cierre,ldt_fecha_act
double	ldb_numero,ldb_porcent,ldb_tot_porc,ldb_tot_porc_aux

dw_fecha_cierre.accepttext()
ldt_fecha_cierre								= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque									= dw_seleccion.getitemnumber(1,'parque')
ll_graba											= 0
if not isnull(ldt_fecha_cierre) then
	ldt_fecha_act								= datetime(date(em_termino.text),time('00:00:00'))
	ll_dia											= day(date(gdt_fec_sistema))
	if gdt_fec_sistema > ldt_fecha_act then
		if ll_dia>=17 then
			ll_res								= MessageBox("Advertencia","¿Desea Actualizar Porcentaje de Ingreso a Caja Supervisores?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				
				UPDATE	"MORA_9_12_FECHA"  
     			SET 		"FECHA" = :ldt_fecha_act
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				
				SELECT	COUNT("CADENA"."CODIGO")
				INTO		:ll_tot_reg
				FROM		"CADENA","OFERTA_V","PAGO_OFERTA","TAB_UF","MORA_9_12_FECHA"    
				WHERE   "CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
							"CADENA"."CODIGO" = 'O' AND
							"CADENA"."SERIE" <> 'R' AND 
							("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND   
							"TAB_UF"."FECHA_UF"="MORA_9_12_FECHA"."FECHA" AND    
							( "OFERTA_V"."PORC_ING_CAJA_SUP" is null or "OFERTA_V"."PORC_ING_CAJA_SUP" = 0) and
							( ROUND (((	SELECT		SUM("INGRESO"."MONTO")  
											FROM 	  	"INGRESO"  
											 WHERE 		"INGRESO"."BASE" = "CADENA"."CODIGO" AND  
															 "INGRESO"."SERIE" = "CADENA"."SERIE" AND  
															 "INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
															 ("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K') AND  
															 "INGRESO"."FECHA_PAGO" <= "TAB_UF"."FECHA_UF") * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" *  (	CASE  WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."VALOR_CUOTA"
																																																		ELSE  "PAGO_OFERTA"."VALOR_CUOTA" * "TAB_UF"."VALOR_UF" END	)) + "PAGO_OFERTA"."PIE_PAGADO"),2)) >= 14.98
				
				USING	sqlca;
				if isnull(ll_tot_reg) then ll_tot_reg=0
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Datos para Actualizar")
				else
					SetPointer(HourGlass!)
					st_fondo.visible				= true
					hpb_1.visible 				= true
					st_porc.visible 				= true
					st_cuenta.visible			= true
					ldb_tot_porc					= 0
					ldb_tot_porc_aux			= 0			
					hpb_1.Position				= ldb_tot_porc
					DECLARE x1 CURSOR FOR
					SELECT	"CADENA"."CODIGO",
        							"CADENA"."SERIE",
        							"CADENA"."NUMERO",
        							( ROUND (((	SELECT		SUM("INGRESO"."MONTO")  
												FROM 	  	"INGRESO"  
												WHERE 		"INGRESO"."BASE" = "CADENA"."CODIGO" AND  
																 "INGRESO"."SERIE" = "CADENA"."SERIE" AND  
																 "INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
																 ("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K') AND  
																 "INGRESO"."FECHA_PAGO" <= "TAB_UF"."FECHA_UF") * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" *  (	CASE  WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."VALOR_CUOTA"
																																																		ELSE  "PAGO_OFERTA"."VALOR_CUOTA" * "TAB_UF"."VALOR_UF" END	)) + "PAGO_OFERTA"."PIE_PAGADO"),2))
					FROM		"CADENA","OFERTA_V","PAGO_OFERTA","TAB_UF","MORA_9_12_FECHA"    
					WHERE   "CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
								"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
								"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
								"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
								"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
								"CADENA"."CODIGO" = 'O' AND
								"CADENA"."SERIE" <> 'R' AND 
								("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND   
								"TAB_UF"."FECHA_UF" = "MORA_9_12_FECHA"."FECHA" AND    
								( "OFERTA_V"."PORC_ING_CAJA_SUP" is null or "OFERTA_V"."PORC_ING_CAJA_SUP" = 0) and
								( ROUND (((	SELECT		SUM("INGRESO"."MONTO")  
												FROM 	  	"INGRESO"  
												 WHERE 		"INGRESO"."BASE" = "CADENA"."CODIGO" AND  
																 "INGRESO"."SERIE" = "CADENA"."SERIE" AND  
																 "INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
																 ("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K') AND  
																 "INGRESO"."FECHA_PAGO" <= "TAB_UF"."FECHA_UF") * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" *  (	CASE  WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."VALOR_CUOTA"
																																																				ELSE  "PAGO_OFERTA"."VALOR_CUOTA" * "TAB_UF"."VALOR_UF" END	)) + "PAGO_OFERTA"."PIE_PAGADO"),2)) >= 14.98
					USING	sqlca;
					open x1;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
						fetch x1 INTO	:ls_base,:ls_serie,:ldb_numero,:ldb_porcent;
							if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>''	and not isnull(ldb_numero) and ldb_numero>0 then	
								UPDATE	"OFERTA_V"  
								SET		"PORC_ING_CAJA_SUP" = :ldb_porcent,   
											"FEC_ING_CAJA_SUP" = :ldt_fecha_act  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )   
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
									ll_graba++	
								else
									rollback using Trans_1;
									messagebox("Error Grabar","Error Grabar Promesa "+ls_base+'-'+ls_serie+'-'+string(ldb_numero))
								end if
							end if
							setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ldb_porcent)
							if ldb_tot_porc <> ldb_tot_porc_aux then 
								st_porc.text				= string(ldb_tot_porc,'#0.##')+" %"
								ldb_tot_porc_aux		= ldb_tot_porc
							end if
							ldb_tot_porc					= (ll_graba / ll_tot_reg) * 100
							hpb_1.Position 				= ldb_tot_porc
							st_cuenta.text 				= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'  Reg. Cálculados '+string(ll_graba,'###,###,###')
						LOOP
					end if
					close x1;
					if ll_tot_reg=ll_graba then
						messagebox("Grabar","Grabación Exitosa")
					end if
					st_fondo.visible						= false
					hpb_1.visible 						= false
					st_porc.visible 						= false
					st_cuenta.visible					= false
					SetPointer(Arrow!)
					cb_actualiza_pag.visible			= false
					em_termino.visible				= false
				end if
			end if
		else
			messagebox("Advertencia","La Actualización de Ingreso a Caja No Debe Ser Antes del Día 17 de Cada Mes")
		end if
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if

end event

type cb_clasif_hist from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 608
integer y = 1644
integer width = 443
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Hist."
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_fecha_cierre.accepttext()
dw_lista.accepttext()

if dw_lista.dataobject			='dw_premios_sup_uno_x_cien_group_res' and dw_lista.rowcount() > 0 then
	ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
elseif dw_lista.dataobject		='dw_premios_sup_uno_x_cien_pagos' and dw_lista.rowcount() > 0 then
	ls_codigo						= dw_lista.getitemstring(il_row,'supervisor_cod_sup')
	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
elseif dw_lista.dataobject		='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
	ls_codigo						= dw_lista.getitemstring(il_row,'cod_age_sup')
	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
end if
if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
	ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
	if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
	OpenWithParm (w_clasifica_historica,ls_string)
end if
end event

type cb_filtrar from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 3474
integer y = 1464
integer width = 334
integer height = 88
integer taborder = 80
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
dw_lista_premio.SETfilter(NULO)
dw_lista_premio.filter()
end event

type hpb_1 from hprogressbar within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 1211
integer y = 840
integer width = 1042
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 1582
integer y = 768
integer width = 306
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 1189
integer y = 752
integer width = 1093
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 41
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_haber,ls_estado_sup,ls_fecha_prem,ls_codigo,ls_cod_contad,ls_serie,ls_moneda,ls_estado_premio,ls_tipo_empleado,ls_base
long		ll_ano,ll_mes,ll_res,ll_tot_reg,ll_indi,ll_rut,ll_tot_pagado,ll_malos,ll_cont,ll_tot_porc,&
			ll_tot_porc_aux,ll_ctas_pag,ll_cod_parque,ll_tipo_premio,ll_cta
datetime	ldt_fecha_fin,ldt_fecha_proceso,ldt_fecha_prem,ldt_fecha_consul,ldt_fecha_ini
double	ldb_numero,ldb_valor_uf,ldb_porcentaje,ldb_porce_vta,ldb_precio,ldb_premio,ldb_sum_res

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
ldt_fecha_ini														= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin														= datetime(date(em_termino.text),time('00:00:00'))
ldt_fecha_proceso													= gdt_fec_sistema
ll_mes																= month(date(ldt_fecha_fin))
ll_ano																	= year(date(ldt_fecha_fin))
ls_haber      														= 'H'
ls_estado_sup 														= 'A'
ls_fecha_prem														= '17/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
ldt_fecha_prem														= datetime(date(ls_fecha_prem),time('00:00:00'))
ls_estado_premio													= 'P'
ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
ll_tipo_premio														= 9
ls_tipo_empleado													= 'S'	
if ldt_fecha_prem > ldt_fecha_proceso then
	messagebox("Grabar","No Puede Ejecutar el Proceso de Premio con Fecha :"+string(ldt_fecha_proceso,"dd/mm/yyyy"))
else
	SELECT	"VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE		 "TAB_UF"."FECHA_UF" = :ldt_fecha_fin
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) or ldb_valor_uf > 0 then
			SELECT DISTINCT	"FECHA_TERMINO"
			INTO		:ldt_fecha_consul
			FROM		"CIERRE_PAGOS_VENTAS"
			WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
						"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
						"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
						"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				if not isnull(ldt_fecha_consul) then
					messagebox("Advertencia","Proceso Premio Ingreso Caja Supervisores Fue Grabado con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
				end if
			else
				ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Premio Ingreso Caja Supervisores?", Exclamation!, YesNo!, 2)
				if ll_res = 1 then
					SetPointer(HourGlass!)
					st_fondo.visible							= true
					hpb_1.visible 								= true
					st_porc.visible 							= true
					ll_tot_porc									= 0
					ll_tot_porc_aux							= 0			
					hpb_1.Position								= ll_tot_porc
					ll_tot_reg									= dw_lista_premio.rowcount()											
					for ll_indi = 1 to ll_tot_reg
						ls_codigo								= dw_lista_premio.getitemstring(ll_indi,'cod_sup')
						ll_rut									= dw_lista_premio.getitemnumber(ll_indi,'rut')
						ll_tot_pagado						= dw_lista_premio.getitemnumber(ll_indi,'pago_mes')
						ls_cod_contad						= dw_lista_premio.getitemstring(ll_indi,'cod_haber')
						ldb_numero							= dw_lista_premio.getitemnumber(ll_indi,'numero')
						ls_serie								= dw_lista_premio.getitemstring(ll_indi,'serie')
						ldb_porcentaje						= dw_lista_premio.getitemnumber(ll_indi,'porce_pago')
						ldb_porce_vta						= 1
						ldb_precio							= dw_lista_premio.getitemnumber(ll_indi,'precio')
						
						ldb_premio							= ( ll_tot_pagado * 0.01)
						ls_moneda							= dw_lista_premio.getitemstring(ll_indi,'moneda')
						ls_base								= dw_lista_premio.getitemstring(ll_indi,'codigo')
						
						SELECT	count("BASE"),sum("TOTAL_PAGO")
						INTO		:ll_cta,	:ldb_sum_res
						FROM 	"RES_COMI"  
						WHERE	( "RES_COMI"."COD_AGE_SUP" = :ls_codigo ) AND  
									( "RES_COMI"."BASE" = :ls_base ) AND  
									( "RES_COMI"."SERIE" = :ls_serie ) AND  
									( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contad ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha_fin )
						USING	sqlca;
						if isnull(ll_cta) then ll_cta=0
						if isnull(ldb_sum_res) then ldb_sum_res=0
						if ll_cta>0 then
							ldb_premio					= ldb_premio + ldb_sum_res
							UPDATE	"RES_COMI"  
     						SET 		"TOTAL_PAGO" = :ldb_premio  
  							WHERE	( "RES_COMI"."COD_AGE_SUP" = :ls_codigo ) AND  
										( "RES_COMI"."BASE" = :ls_base ) AND  
										( "RES_COMI"."SERIE" = :ls_serie ) AND  
										( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
										( "RES_COMI"."COD_CONTABLE" = :ls_cod_contad ) AND  
										( "RES_COMI"."FECHA" = :ldt_fecha_fin )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit using sqlca;
							else
								rollback using sqlca;
							end if
						end if	
						if f_graba_res_comi(ls_codigo,ll_rut,ll_tot_pagado,ls_cod_contad,string(ll_mes),ldt_fecha_fin,ldb_numero,ls_serie,ldb_porcentaje,ldb_porce_vta,ldb_precio,ldb_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_estado_premio,ls_estado_sup,ls_base,ll_cod_parque,0,0)= -1 then
							ll_malos++
						else
							ll_cont++
						end if
						if ll_tot_porc <> ll_tot_porc_aux then 
							st_porc.text						= string(ll_tot_porc)+" %"
							ll_tot_porc_aux					= ll_tot_porc
						end if
						ll_tot_porc								= (ll_indi / ll_tot_reg) * 100
						hpb_1.Position 						= ll_tot_porc
					next
					
					INSERT INTO "CIERRE_PAGOS_VENTAS"  
									( "FECHA_INICIO",	"FECHA_TERMINO",	"FECHA_PROCESO",		"TIPO_PREMIO",		"COD_PARQUE",		"USUARIO_CREA",	"TIPO_EMPLEADO" )  
					VALUES		( :ldt_fecha_ini,	:ldt_fecha_fin,	:ldt_fecha_proceso,	:ll_tipo_premio,	:ll_cod_parque,	:gs_user,			:ls_tipo_empleado )  ;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
					st_fondo.visible								= false
					hpb_1.visible 								= false
					st_porc.visible 								= false
					SetPointer(Arrow!)
					messagebox("Grabar","Proceso Grabación Exitoso")
					dw_lista.Reset()
					dw_lista_premio.Reset()
				else
					messagebox("Grabar","Proceso de grabación Cancelado")
				end if
			end if
		end if
	end if
end if
end event

type cb_cta_cte from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 1051
integer y = 1644
integer width = 425
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;dw_lista.accepttext()
if dw_lista.dataobject='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
	gs_base				= dw_lista.getitemstring(il_row,'cadena_codigo')
	gs_serie				= dw_lista.getitemstring(il_row,'serie')
	gi_numero			= dw_lista.getitemnumber(il_row,'contrato')
	gi_rut				= dw_lista.getitemnumber(il_row,'cadena_rut')
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
end event

type cb_limpiar from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 1801
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premios_sup_uno_x_cien_pagos.triggerevent(open!)
end event

type dw_lista_premio from datawindow within w_premios_sup_uno_x_cien_pagos
integer x = 3479
integer y = 224
integer width = 2450
integer height = 1032
integer taborder = 50
string title = "none"
string dataobject = "dw_premios_sup_uno_x_cien_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_premios_sup_uno_x_cien_pagos
integer x = 2386
integer y = 80
integer width = 137
integer height = 120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_jefe,ls_superv,ls_parque,ls_codigo,ls_clasif_hist,ls_cod_sup,ls_estado,ls_nombre,ls_a_pater,ls_a_mater,ls_nombre_comp,&
			ls_cod_contab,ls_tipo_empleado,ls_pasa='S'
long		ll_cod_parque,ll_tot_reg,ll_indi,ll_rut,ll_new,ll_tipo_premio,ll_cta_vtas
datetime	ldt_fecha_cierre,ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_consul,ldt_fecha_ing,ldt_fec_ini_m,ldt_fec_fin_m

dw_lista.reset()
dw_lista_premio.reset()
dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
ls_jefe																= dw_seleccion.getitemstring(1,'jefe')
ls_superv															= dw_seleccion.getitemstring(1,'supervisor')
ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ldt_fecha_ini														= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin														= datetime(date(em_termino.text),time('00:00:00'))
ls_cod_contab														= 'P09'
ll_tipo_premio														= 9
ls_tipo_empleado													= 'S'

if isnull(ldt_fecha_cierre) then
	messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
	dw_fecha_cierre.setfocus()
	dw_fecha_cierre.setcolumn('cierre_ventas')
	ls_pasa															= 'N'
elseif isnull(ll_cod_parque) and ll_cod_parque=0 then
	messagebox("Advertencia", "Debe Ingresar Parque")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('parque')
	ls_pasa															= 'N'
end if
if ls_pasa='S' then
	SELECT DISTINCT	"FECHA_TERMINO"
	INTO		:ldt_fecha_consul
	FROM		"CIERRE_PAGOS_VENTAS"
	WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
				"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
				"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
				"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_consul) then
			if (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (ls_superv = '' or isnull(ls_superv)) and not isnull(ldt_fecha_cierre) then
				cb_cta_cte.enabled									= false
				cb_imprimir.enabled									= true
				cb_grabar.visible										= false
				dw_lista.dataobject									='dw_premios_sup_uno_x_cien_group_res'
				dw_lista.settransobject(sqlca)
				dw_lista.object.usuario.text							= gs_user
				DECLARE x1 CURSOR FOR
				SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."RUT",	"SUPERVISOR"."ESTADO",	"SUPERVISOR"."FECHA_ING",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO"  
				FROM 	"RES_COMI",  "SUPERVISOR"  
				WHERE	( "RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" ) and
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab ) AND
							( "SUPERVISOR"."COD_PARQUE" = :ll_cod_parque ) and
							( "SUPERVISOR"."COD_JEFE" = :ls_jefe ) and  
							( "RES_COMI"."FECHA" = :ldt_fecha_fin )
				ORDER BY	"SUPERVISOR"."FECHA_ING" ASC
				USING	Trans_1;
				open x1;
					if Trans_1.sqlcode=0 then
						DO WHILE Trans_1.sqlcode=0
						fetch x1 INTO	:ls_cod_sup,	:ll_rut,	:ls_estado,	:ldt_fecha_ing,	:ls_nombre,	:ls_a_pater,	:ls_a_mater;
							if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 and not isnull(ls_estado) and ls_estado<>'' then
								ls_nombre_comp							= ls_nombre+' '+ls_a_pater+' '+ls_a_mater
								ll_new									= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"rut",ll_rut)
								dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
								dw_lista.setitem(ll_new,"estado",ls_estado)
								dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
								ls_clasif_hist							= f_clasif_hist(ls_cod_sup,ldt_fecha_fin)
								dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
								SELECT	SUM("RES_COMI"."TOTAL_PAGO"),count("RES_COMI"."FECHA")    
								INTO		:ll_total_pago,	:ll_cta_vtas  
								FROM		"RES_COMI"  
								WHERE	( "RES_COMI"."COD_AGE_SUP" = :ls_cod_sup ) AND  
											( "RES_COMI"."FECHA" = :ldt_fecha_fin ) AND  
											( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab )
								USING	Trans_2;
								if isnull(ll_total_pago) then ll_total_pago = 0
								if isnull(ll_cta_vtas) then ll_cta_vtas = 0
								
								dw_lista.setitem(ll_new,"premio",ll_total_pago)
								dw_lista.setitem(ll_new,"cta_vtas",ll_cta_vtas)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_fin)
							end if
							setnull(ls_cod_sup);setnull(ll_rut);setnull(ls_estado)
						LOOP
					end if
				close x1;
				ll_tot_reg												= dw_lista.RowCount()
				if ll_tot_reg=0 then 
					messagebox("Advertencia","No Registra datos")
				end if
			elseif (not isnull(ll_cod_parque) or ll_cod_parque>0) and (not isnull(ls_jefe) or ls_jefe<>'') and (not isnull(ls_superv) or ls_superv <>'') and not isnull(ldt_fecha_cierre) then
				cb_cta_cte.enabled									= true
				cb_imprimir.enabled									= true
				cb_grabar.visible										= false
				dw_lista.dataobject									='dw_premios_sup_uno_x_cien_detalle'
				dw_lista.settransobject(sqlca)
				ll_tot_reg												= dw_lista.retrieve(ldt_fecha_fin,ls_superv)
				dw_lista.object.usuario.text						= gs_user
				for ll_indi = 1 to ll_tot_reg
					ls_codigo											= dw_lista.getitemstring(ll_indi,'cod_age_sup')
					ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha_fin)
					dw_lista.setitem(ll_indi,"c_clasif",ls_clasif_hist)
				next
				if ll_tot_reg=0 then 
					messagebox("Advertencia","No Registra datos")
				end if
			else
				if isnull(ldt_fecha_cierre) then
					messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
					dw_fecha_cierre.setfocus()
					dw_fecha_cierre.setcolumn('cierre_ventas')
				elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
					messagebox("Advertencia", "Debe Ingresar Parque")
					dw_seleccion.setfocus()
					dw_seleccion.setcolumn('parque')
				elseif isnull(ls_jefe) or ls_jefe='' then
					messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
					dw_seleccion.setfocus()
					dw_seleccion.setcolumn('jefe')
				end if
			end if
		end if
	else
		if gl_proceso >= 4 then
			if not isnull(ll_cod_parque) or ll_cod_parque>0 and not isnull(ldt_fecha_cierre) then
				
				UPDATE	"PREMIO_TIPO"  
     			SET 		"FECHA_INI" = :ldt_fecha_ini,
				  			"FECHA_FIN" = :ldt_fecha_fin
				WHERE 	"PREMIO_TIPO"."CARGO" = 'S' AND  
			         		"PREMIO_TIPO"."COD_PREMIO" = 9 AND  
			         		"PREMIO_TIPO"."PARQUE" = :ll_cod_parque			  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				
				
				SELECT to_date(add_months( to_date(:ldt_fecha_fin), -1 )) INTO :ldt_fec_fin_m FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_fin), -2 )) INTO :ldt_fec_ini_m FROM dual;
				ldt_fec_ini_m				= datetime((RelativeDate(date(ldt_fec_ini_m), + 1)),time('00:00:00'))
				
				UPDATE	"MORA_9_12_FECHA"  
     			SET 		"FECHA_INI" = :ldt_fec_ini_m,
				  			"FECHA" = :ldt_fec_fin_m,
							 "COD_PARQUE" =:ll_cod_parque
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				
				
				dw_lista_premio.dataobject							='dw_premios_sup_uno_x_cien_total'
				dw_lista_premio.settransobject(sqlca)
				ll_tot_reg												= dw_lista_premio.retrieve()
				SELECT	"COD_PARQ"."NOMBRE"  
				INTO 		:ls_parque  
				FROM 		"COD_PARQ"  
				WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque ;
				cb_cta_cte.enabled									= false
				cb_imprimir.enabled									= false
				cb_grabar.visible										= true
				dw_lista.dataobject									='dw_premios_sup_uno_x_cien_pagos'
				dw_lista.settransobject(sqlca)
				ll_tot_reg												= dw_lista.retrieve(ldt_fecha_ini,ldt_fecha_fin,ll_cod_parque)
				dw_lista.object.t_parque_t.text						= ls_parque
				dw_lista.object.usuario.text							= gs_user
				for ll_indi = 1 to ll_tot_reg
					ls_codigo												= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
					ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha_fin)
					dw_lista.setitem(ll_indi,"c_clasif",ls_clasif_hist)
				next
				if ll_tot_reg=0 then 
					messagebox("Advertencia","No Registra datos")
				end if
			elseif not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv<>'' and not isnull(ldt_fecha_cierre) then
				messagebox("Advertencia","El Proceso Premio Ingreso Caja Supervisores Debe Ser Grabado")	
			else
				if isnull(ldt_fecha_cierre) then
					messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
					dw_fecha_cierre.setfocus()
					dw_fecha_cierre.setcolumn('cierre_ventas')
				elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
					messagebox("Advertencia", "Debe Ingresar Parque")
					dw_seleccion.setfocus()
					dw_seleccion.setcolumn('parque')
				elseif isnull(ls_jefe) or ls_jefe='' then
					messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
					dw_seleccion.setfocus()
					dw_seleccion.setcolumn('jefe')
				end if
			end if
		else
			messagebox("Advertencia", "Proceso Premio Ingreso Caja Supervisores No Esta Creado")
		end if
	end if
end if
end event

type em_inicio from editmask within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 3497
integer y = 120
integer width = 329
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type em_termino from editmask within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 3017
integer y = 120
integer width = 325
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type cb_exportar from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 3474
integer y = 1564
integer width = 334
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;Datawindow	dw_paso
if dw_lista_premio.rowcount()>0 then
	dw_lista_premio.accepttext()
	dw_paso				= dw_lista_premio
	f_DWToExcel( dw_paso )
end if
end event

type cb_2 from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 3127
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_sup_uno_x_cien_pagos)
end event

type cb_imprimir from commandbutton within w_premios_sup_uno_x_cien_pagos
integer x = 2080
integer y = 1644
integer width = 274
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

event clicked;long		ll_tipo_premio,ll_cod_parque
datetime	ldt_fecha_consul,ldt_fecha_fin

ll_cod_parque								= dw_seleccion.getitemnumber(1,'parque')
ldt_fecha_fin								= datetime(date(em_termino.text),time('00:00:00'))
ll_tipo_premio								= 9
SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		if dw_lista.rowcount() >0 then 
			f_Print( dw_lista )
		end if
	end if
else
	messagebox("Advertencia","Debe Grabar El Proceso de Premio Ingreso Caja Supervisor")
end if
end event

type dw_lista from datawindow within w_premios_sup_uno_x_cien_pagos
integer x = 32
integer y = 228
integer width = 3369
integer height = 1388
integer taborder = 40
string title = "none"
string dataobject = "dw_premios_sup_uno_x_cien_group_res"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;string	ls_superv,ls_string
datetime	ldt_fecha_ini,ldt_fecha_fin

ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin							= datetime(date(em_termino.text),time('00:00:00'))

if dw_lista.dataobject				='dw_premios_sup_uno_x_cien_group_res' and dw_lista.rowcount() > 0 then
	ls_superv							= this.getitemstring(row,'cod_sup')
	ls_string							= ls_superv+'~t'+string(ldt_fecha_fin,'dd/mm/yyyy')
	OpenWithParm(w_premios_sup_uno_x_cien_detalle, ls_string)
elseif dw_lista.dataobject			='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
	cb_cta_cte.triggerevent(clicked!)
else
	messagebox("Advertencia","El Proceso Premio Ingreso Caja Supervisores Debe Ser Grabado")
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_seleccion from datawindow within w_premios_sup_uno_x_cien_pagos
integer x = 174
integer y = 32
integer width = 2208
integer height = 192
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_nulo,ls_columna,ls_jefe
long	ll_parque


Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque						= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

type dw_fecha_cierre from datawindow within w_premios_sup_uno_x_cien_pagos
integer x = 27
integer y = 120
integer width = 841
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_fecha_prem_ini,ls_fecha_prem_fin
long		ll_mes,ll_ano,ll_mes_prem_fin,ll_ano_prem_fin,ll_cod_parque
datetime	ldt_fecha_cierre,ldt_fecha_prem_ini,ldt_fecha_prem_fin,ldt_fecha_act_ing

dw_lista.reset()
dw_fecha_cierre.accepttext()
dw_seleccion.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'cierre_ventas'
		dw_lista.reset()
		ldt_fecha_cierre					= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
		ll_cod_parque						= dw_seleccion.getitemnumber(1,'parque')
		ll_mes								= month(date(ldt_fecha_cierre))
		ll_ano									= year(date(ldt_fecha_cierre))
		em_inicio.text						= string('16/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
		ldt_fecha_prem_ini				= datetime(date(em_inicio.text),time('00:00:00'))
		if ll_mes = 12 then
			ll_mes_prem_fin 				= ll_mes - 11
			ll_ano_prem_fin 				= ll_ano + 1
			em_termino.text				= string('15/'+ string(ll_mes_prem_fin,'00')+ '/' +string(ll_ano_prem_fin,'0000'))
			ldt_fecha_prem_fin			= datetime(date(em_termino.text),time('00:00:00'))
		else
			ll_mes_prem_fin 				= ll_mes + 1
			ll_ano_prem_fin 				= ll_ano
			em_termino.text				= string('15/'+ string(ll_mes_prem_fin,'00')+ '/' +string(ll_ano_prem_fin,'0000'))
			ldt_fecha_prem_fin			= datetime(date(em_termino.text),time('00:00:00'))
		end if
		SELECT	max("OFERTA_V"."FEC_ING_CAJA_SUP")
		INTO 		:ldt_fecha_act_ing  
		FROM 	"OFERTA_V"
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldt_fecha_act_ing) then
				ldt_fecha_act_ing			= ldt_fecha_act_ing
			end if
		end if
		
		if ldt_fecha_act_ing < ldt_fecha_prem_fin and gl_proceso>=4 then
			cb_actualiza_pag.visible		= true
			em_termino.visible			= true
		else
			cb_actualiza_pag.visible		= false
			em_termino.visible			= false
		end if
END CHOOSE
end event

type gb_1 from groupbox within w_premios_sup_uno_x_cien_pagos
integer x = 1778
integer y = 1596
integer width = 603
integer height = 164
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_cuenta from statictext within w_premios_sup_uno_x_cien_pagos
boolean visible = false
integer x = 1211
integer y = 912
integer width = 1042
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean focusrectangle = false
end type

