forward
global type w_estadistica_cajas from window
end type
type cb_exportar from commandbutton within w_estadistica_cajas
end type
type p_hasta from picture within w_estadistica_cajas
end type
type em_hasta from editmask within w_estadistica_cajas
end type
type st_11 from statictext within w_estadistica_cajas
end type
type cb_ver_detalle from commandbutton within w_estadistica_cajas
end type
type cb_grafico from commandbutton within w_estadistica_cajas
end type
type cb_imprimir from commandbutton within w_estadistica_cajas
end type
type cb_aceptar from commandbutton within w_estadistica_cajas
end type
type p_desde from picture within w_estadistica_cajas
end type
type em_de from editmask within w_estadistica_cajas
end type
type st_1 from statictext within w_estadistica_cajas
end type
type cb_cerrar from commandbutton within w_estadistica_cajas
end type
type dw_lista from datawindow within w_estadistica_cajas
end type
type dw_contar from datawindow within w_estadistica_cajas
end type
type gb_1 from groupbox within w_estadistica_cajas
end type
end forward

global type w_estadistica_cajas from window
integer width = 2903
integer height = 2104
boolean titlebar = true
string title = "Estadistica Cajas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_exportar cb_exportar
p_hasta p_hasta
em_hasta em_hasta
st_11 st_11
cb_ver_detalle cb_ver_detalle
cb_grafico cb_grafico
cb_imprimir cb_imprimir
cb_aceptar cb_aceptar
p_desde p_desde
em_de em_de
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
dw_contar dw_contar
gb_1 gb_1
end type
global w_estadistica_cajas w_estadistica_cajas

type variables
datawindow dw_paso
end variables

on w_estadistica_cajas.create
this.cb_exportar=create cb_exportar
this.p_hasta=create p_hasta
this.em_hasta=create em_hasta
this.st_11=create st_11
this.cb_ver_detalle=create cb_ver_detalle
this.cb_grafico=create cb_grafico
this.cb_imprimir=create cb_imprimir
this.cb_aceptar=create cb_aceptar
this.p_desde=create p_desde
this.em_de=create em_de
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.dw_contar=create dw_contar
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.p_hasta,&
this.em_hasta,&
this.st_11,&
this.cb_ver_detalle,&
this.cb_grafico,&
this.cb_imprimir,&
this.cb_aceptar,&
this.p_desde,&
this.em_de,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.dw_contar,&
this.gb_1}
end on

on w_estadistica_cajas.destroy
destroy(this.cb_exportar)
destroy(this.p_hasta)
destroy(this.em_hasta)
destroy(this.st_11)
destroy(this.cb_ver_detalle)
destroy(this.cb_grafico)
destroy(this.cb_imprimir)
destroy(this.cb_aceptar)
destroy(this.p_desde)
destroy(this.em_de)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_contar)
destroy(this.gb_1)
end on

event open;Long	ll_cod_parque
gf_centrar(w_estadistica_cajas)
dw_lista.settransobject(sqlca)
dw_contar.settransobject(sqlca)
em_de.text										= string(gdt_fec_sistema,"dd/mm/yyyy")
em_hasta.text									= string(gdt_fec_sistema,"dd/mm/yyyy")
dw_lista.object.t_titulo.text				= 'Estadistica por Caja~rFecha del '+string(em_de.text) +'hasta el '+string(em_hasta.text)
dw_lista.object.t_parque.text				= gs_conexion
//cb_aceptar.triggerevent(clicked!)
dw_lista.object.gr_grafico.Visible 		= '0'
dw_lista.object.gr_grafico_ing.Visible = '0'
em_de.setfocus()
end event

type cb_exportar from commandbutton within w_estadistica_cajas
integer x = 992
integer y = 1892
integer width = 302
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type p_hasta from picture within w_estadistica_cajas
integer x = 1385
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_hasta
ld_fecha				= date(em_hasta.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_hasta.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_hasta.text	= string(date(Message.StringParm))
	dw_lista.reset()
END IF

dw_lista.reset()
ld_fecha				= date(em_de.text)
ld_fecha_hasta		= date(em_hasta.text)
if ld_fecha<=ld_fecha_hasta then cb_aceptar.triggerevent(clicked!)
end event

type em_hasta from editmask within w_estadistica_cajas
integer x = 1042
integer y = 84
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;Date	ld_fecha,ld_fecha_hasta
dw_lista.reset()
ld_fecha			= date(em_de.text)
ld_fecha_hasta	= date(em_hasta.text)
//if ld_fecha<=ld_fecha_hasta then cb_aceptar.triggerevent(clicked!)
end event

type st_11 from statictext within w_estadistica_cajas
integer x = 823
integer y = 92
integer width = 183
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ver_detalle from commandbutton within w_estadistica_cajas
integer x = 37
integer y = 1892
integer width = 352
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Detalle"
end type

event clicked;String	ls_fecha,ls_fecha_fin,ls_string,ls_caja

if dw_lista.getrow()>0 and dw_lista.object.gr_grafico.Visible = '0' then
	ls_caja			= dw_lista.getitemstring(dw_lista.getrow(),'caja')
	ls_fecha			= trim(em_de.text)
	ls_fecha_fin	= trim(em_hasta.text)
	if not isnull(ls_caja) and not isnull(date(ls_fecha)) then
		ls_string	= ls_caja+'~t'+ls_fecha+'~t'+ls_fecha_fin
		openwithparm(w_detalle_ingresos_por_caja_fecha,ls_string)
	end if
end if
end event

type cb_grafico from commandbutton within w_estadistica_cajas
integer x = 1691
integer y = 1892
integer width = 443
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mostrar Gráfico"
end type

event clicked;if dw_lista.object.gr_grafico.Visible = '1' then
	dw_lista.object.gr_grafico.Visible 		= '0'
	dw_lista.object.gr_grafico_ing.Visible = '0'
	cb_grafico.text								= 'Mostrar Gráfico'
else
	dw_lista.object.gr_grafico.Visible	 	= '1'
	dw_lista.object.gr_grafico_ing.Visible = '1'
	cb_grafico.text								= 'Sacar Gráfico'
end if

end event

type cb_imprimir from commandbutton within w_estadistica_cajas
integer x = 686
integer y = 1892
integer width = 302
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	if dw_lista.visible=true then
		IF PrintSetup( ) <> -1 THEN dw_lista.Print()
	end if
END IF

end event

type cb_aceptar from commandbutton within w_estadistica_cajas
integer x = 2400
integer y = 80
integer width = 402
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;Datetime	ld_fecha,ld_fecha_hasta
String	ls_caja
Double	ll_monto_adm,ll_monto_inm,ll_new,ll_cant_doc_adm,ll_cant_doc_inm,ll_monto_adm_nb,&
			ll_monto_inm_nc,ll_calculo,ll_total
Long		ll_cod_parque
SetPointer(HourGlass!)
ld_fecha			= datetime(date(em_de.text),time('00:00:00'))
ld_fecha_hasta	= datetime(date(em_hasta.text),time('23:59:59'))
if ld_fecha>ld_fecha_hasta then
	messagebox("Advertencia","Rango de Fecha Inválida, Fecha Inicial debe ser Menor o Igual a la fecha de Término")
	em_de.setfocus()
else
	dw_lista.reset()
	dw_lista.object.t_titulo.text	= 'Estadistica por Caja~rFecha del '+string(em_de.text) +' al '+string(em_hasta.text)
	dw_lista.object.t_parque.text	= gs_conexion
	if not isnull(ld_fecha) and not isnull(ld_fecha_hasta) then
		DECLARE	x1 CURSOR FOR  
		SELECT DISTINCT "INGRESO"."COD_CAJA"  
		FROM 		"INGRESO"  
		WHERE 	(("INGRESO"."FECHA_PAGO" >= :ld_fecha) AND
					("INGRESO"."FECHA_PAGO" <= :ld_fecha_hasta))
		ORDER BY "COD_CAJA"
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch x1 into :ls_caja;
				if not isnull(ls_caja) then
					ll_new			= dw_lista.insertrow(0)
					ll_monto_adm	= 0
					ll_monto_inm	= 0
					ll_cant_doc_inm= 0
					ll_cant_doc_adm= 0
					ll_monto_adm_nb= 0
					ll_monto_inm_nc= 0
					dw_lista.setitem(ll_new,'caja',ls_caja)
					if ls_caja='CC' then
						dw_contar.dataobject	= 'dw_contar_folios_por_fecha_adm_cc'
						dw_contar.settransobject(sqlca)
						ll_cant_doc_adm		= dw_contar.retrieve(ld_fecha,ld_fecha_hasta,ls_caja)
						if isnull(ll_cant_doc_adm) then ll_cant_doc_adm=0
						dw_lista.setitem(ll_new,'cant_doc_adm',ll_cant_doc_adm)
						dw_contar.dataobject	= 'dw_contar_folios_por_fecha_inm_cc'
						dw_contar.settransobject(sqlca)
						ll_cant_doc_inm		= dw_contar.retrieve(ld_fecha,ld_fecha_hasta,ls_caja)
						if isnull(ll_cant_doc_inm) then ll_cant_doc_adm=0
						dw_lista.setitem(ll_new,'cant_doc_inm',ll_cant_doc_inm)
						dw_lista.setitem(ll_new,'total_doc',ll_cant_doc_adm + ll_cant_doc_inm)
					else
						dw_contar.dataobject	= 'dw_contar_folios_por_fecha_adm'
						dw_contar.settransobject(sqlca)
						ll_cant_doc_adm		= dw_contar.retrieve(ld_fecha,ld_fecha_hasta,ls_caja)
						if isnull(ll_cant_doc_adm) then ll_cant_doc_adm=0
						dw_lista.setitem(ll_new,'cant_doc_adm',ll_cant_doc_adm)
						dw_contar.dataobject	= 'dw_contar_folios_por_fecha_inm'
						dw_contar.settransobject(sqlca)
						ll_cant_doc_inm		= dw_contar.retrieve(ld_fecha,ld_fecha_hasta,ls_caja)
						if isnull(ll_cant_doc_inm) then ll_cant_doc_adm=0
						dw_lista.setitem(ll_new,'cant_doc_inm',ll_cant_doc_inm)
						dw_lista.setitem(ll_new,'total_doc',ll_cant_doc_adm + ll_cant_doc_inm)
					end if
					SELECT	sum("INGRESO"."MONTO")  
					INTO 		:ll_monto_adm  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."FECHA_PAGO" >= :ld_fecha ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hasta ) AND  
							 ( "INGRESO"."COD_CAJA" = :ls_caja )  AND
							 ( "INGRESO"."PAGO_HIST" = 'A' )  AND
							 (("INGRESO"."TIPO_COB" = 'BL' ) or
							 ( "INGRESO"."TIPO_COB" = 'BI' ) or 
							 ( "INGRESO"."TIPO_COB" = 'B0' ) or ( "INGRESO"."TIPO_COB" = 'BR' ) or ( "INGRESO"."TIPO_COB" = 'CS' ) or 
							 ( "INGRESO"."TIPO_COB" = 'FA' ) or 
							 ( "INGRESO"."TIPO_COB" = 'BM' ));

					SELECT	sum("INGRESO"."MONTO")  
					INTO 		:ll_monto_adm_nb  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."FECHA_PAGO" >= :ld_fecha ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hasta ) AND  
							 ( "INGRESO"."COD_CAJA" = :ls_caja )  AND
							 ( "INGRESO"."PAGO_HIST" = 'A' )  AND
							 ( "INGRESO"."TIPO_COB" = 'NB' );
					if isnull(ll_monto_adm) then ll_monto_adm=0
					if isnull(ll_monto_adm_nb) then ll_monto_adm_nb=0
					ll_monto_adm  	= ll_monto_adm - ll_monto_adm_nb
					dw_lista.setitem(ll_new,'pago_adm',ll_monto_adm)
					
					SELECT	sum("INGRESO"."MONTO")  
					INTO 		:ll_monto_inm  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."FECHA_PAGO" >= :ld_fecha ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hasta ) AND  
							 ( "INGRESO"."COD_CAJA" = :ls_caja )  AND
							 ( "INGRESO"."PAGO_HIST" = 'A' )  AND
							 (("INGRESO"."TIPO_COB" = 'CU' ) or 
							 ("INGRESO"."TIPO_COB" = 'CI' ) or 
							 ("INGRESO"."TIPO_COB" = 'BE' ) or ( "INGRESO"."TIPO_COB" = 'BR' ) or ( "INGRESO"."TIPO_COB" = 'CS' ) or 
							 ("INGRESO"."TIPO_COB" = 'C0' ) OR 
							 ("INGRESO"."TIPO_COB" = 'C1' ) OR 
							 ("INGRESO"."TIPO_COB" = 'CC' ));

					SELECT	sum("INGRESO"."MONTO")  
					INTO 		:ll_monto_inm_nc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."FECHA_PAGO" >= :ld_fecha ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hasta ) AND  
							 ( "INGRESO"."COD_CAJA" = :ls_caja )  AND
							 ( "INGRESO"."PAGO_HIST" = 'A' )  AND
							 (("INGRESO"."TIPO_COB" = 'NC' ) or 
							 ("INGRESO"."TIPO_COB" = 'NE' ) or 
							 ( "INGRESO"."TIPO_COB" = 'N1' ));
							 
					if isnull(ll_monto_inm) then ll_monto_inm=0
					if isnull(ll_monto_inm_nc) then ll_monto_inm_nc=0
					ll_monto_inm	= ll_monto_inm - ll_monto_inm_nc
					if isnull(ll_monto_inm) then ll_monto_inm=0
					if isnull(ll_monto_adm) then ll_monto_adm=0
					dw_lista.setitem(ll_new,'pago_inm',ll_monto_inm)
					dw_lista.accepttext()
					ll_total	= ll_monto_adm + ll_monto_inm
					dw_lista.setitem(ll_new,'total_pago',ll_total)
					dw_lista.accepttext()
				end if
				setnull(ls_caja);setnull(ll_monto_adm);setnull(ll_monto_inm);setnull(ll_total)
				setnull(ll_monto_adm_nb);setnull(ll_monto_inm_nc)
				setnull(ll_cant_doc_adm);setnull(ll_cant_doc_inm)
			LOOP
		end if
		close x1;
	end if
end if
SetPointer(Arrow!)
end event

type p_desde from picture within w_estadistica_cajas
integer x = 631
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_de.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_de.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_de.text	= string(date(Message.StringParm))
	dw_lista.reset()
END IF
end event

type em_de from editmask within w_estadistica_cajas
integer x = 288
integer y = 84
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_estadistica_cajas
integer x = 114
integer y = 92
integer width = 155
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_estadistica_cajas
integer x = 2487
integer y = 1892
integer width = 366
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica_cajas)
end event

type dw_lista from datawindow within w_estadistica_cajas
integer x = 37
integer y = 224
integer width = 2816
integer height = 1632
integer taborder = 40
string title = "none"
string dataobject = "dwe_estadistica_ingreso_cajas"
boolean vscrollbar = true
boolean border = false
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;string	ls_columna
String	ls_fecha,ls_fecha_fin,ls_string,ls_caja

if row>0 and dw_lista.object.gr_grafico.Visible = '0' then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	cb_ver_detalle.triggerevent(clicked!)
else
	ls_columna	= dwo.name
	if ls_columna='suma_doc_adm' or ls_columna='suma_doc_inm' or ls_columna='suma_doc' or ls_columna='suma_pago_adm' or ls_columna='suma_pago_inm' or ls_columna='suma_pago' then
		if dw_lista.getrow()>0 and dw_lista.object.gr_grafico.Visible = '0' then
			ls_caja			= dw_lista.getitemstring(dw_lista.getrow(),'caja')
			ls_fecha			= trim(em_de.text)
			ls_fecha_fin	= trim(em_hasta.text)
			if not isnull(ls_caja) and not isnull(date(ls_fecha)) then
				ls_string	= 'TODAS'+'~t'+ls_fecha+'~t'+ls_fecha_fin
				openwithparm(w_detalle_ingresos_por_caja_fecha,ls_string)
			end if
		end if
	end if
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type dw_contar from datawindow within w_estadistica_cajas
boolean visible = false
integer x = 1317
integer y = 1952
integer width = 411
integer height = 432
string dataobject = "dw_contar_folios_por_fecha_inm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_estadistica_cajas
integer x = 41
integer y = 16
integer width = 2816
integer height = 192
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

