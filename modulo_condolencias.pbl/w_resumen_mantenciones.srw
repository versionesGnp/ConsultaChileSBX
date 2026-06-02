forward
global type w_resumen_mantenciones from window
end type
type cb_exportar from commandbutton within w_resumen_mantenciones
end type
type cb_imprimir from commandbutton within w_resumen_mantenciones
end type
type cb_1 from commandbutton within w_resumen_mantenciones
end type
type dw_lista from datawindow within w_resumen_mantenciones
end type
type pb_ok from picturebutton within w_resumen_mantenciones
end type
type em_fec_fin from editmask within w_resumen_mantenciones
end type
type st_2 from statictext within w_resumen_mantenciones
end type
type em_fec_ini from editmask within w_resumen_mantenciones
end type
type p_ini from picture within w_resumen_mantenciones
end type
type st_3 from statictext within w_resumen_mantenciones
end type
type p_fin from picture within w_resumen_mantenciones
end type
type gb_1 from groupbox within w_resumen_mantenciones
end type
end forward

global type w_resumen_mantenciones from window
integer width = 2912
integer height = 1436
boolean titlebar = true
string title = "Resumen Mantencion"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_1 cb_1
dw_lista dw_lista
pb_ok pb_ok
em_fec_fin em_fec_fin
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
gb_1 gb_1
end type
global w_resumen_mantenciones w_resumen_mantenciones

on w_resumen_mantenciones.create
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_imprimir,&
this.cb_1,&
this.dw_lista,&
this.pb_ok,&
this.em_fec_fin,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.gb_1}
end on

on w_resumen_mantenciones.destroy
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.gb_1)
end on

event open;connect using Trans_1;
gf_centrar(w_resumen_mantenciones)
dw_lista.dataobject			= 'dwe_resumen_mantenciones'
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
em_fec_ini.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

event close;disconnect using Trans_1;
end event

type cb_exportar from commandbutton within w_resumen_mantenciones
integer x = 1147
integer y = 1188
integer width = 256
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_resumen_mantenciones
integer x = 1481
integer y = 1188
integer width = 256
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_1 from commandbutton within w_resumen_mantenciones
integer x = 2606
integer y = 1188
integer width = 256
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close (w_resumen_mantenciones)
end event

type dw_lista from datawindow within w_resumen_mantenciones
integer x = 37
integer y = 164
integer width = 2825
integer height = 964
integer taborder = 30
string title = "none"
string dataobject = "dwe_resumen_mantenciones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_ok from picturebutton within w_resumen_mantenciones
integer x = 1618
integer y = 12
integer width = 137
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_usuario_mc,ls_nombre_falle,ls_ap_falle,ls_nombre
long		ll_ctto_prado,ll_prom_prado,ll_tot_venc_prado,ll_cod_parque,ll_pag_prado,ll_mes_ini,ll_mes_fin
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.reset()
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		ldt_fec_ini														= datetime(date(em_fec_ini.text),time('00:00:00'))
		ldt_fec_fin														= datetime(date(em_fec_fin.text),time('00:00:00'))
		ll_mes_ini														= month(date(em_fec_ini.text))
		ll_mes_fin														= month(date(em_fec_fin.text))
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			dw_lista.object.usuario.text								= gs_user
			dw_lista.object.titulo_t.text								='Período del '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string( ldt_fec_fin,'dd/mm/yyyy')
			dw_lista.insertrow(0)
			DECLARE x1 CURSOR FOR
			SELECT		"CODIGO","NOMBRE"  
			FROM 		"COD_PARQ"  
			WHERE 		"COD_PARQ"."GRUPO" = 1
			ORDER BY 	"COD_PARQ"."CODIGO"
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ll_cod_parque,	:ls_nombre;
					if not isnull(ll_cod_parque) or ll_cod_parque > 0 then
						//// calculo de	mantenciones por pagar	
						SELECT	count("CONTRATO"."NRO_CONTRATO")
						INTO		:ll_ctto_prado
						FROM 	"CADENA","CONTRATO"  
						WHERE	"CADENA"."SERIE" = "CONTRATO"."SERIE_C"  and  
									"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO"  and  
									"CADENA"."CODIGO" = 'C'  AND  
									("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND
									"CADENA"."COD_PARQUE" = :ll_cod_parque AND  
									(( SELECT to_number(to_char("CONTRATO"."FECHA_M", 'MM')) from dual) >= :ll_mes_ini and
									( SELECT to_number(to_char("CONTRATO"."FECHA_M", 'MM')) from dual) <= :ll_mes_fin )
						USING	Trans_1;
						if Trans_1.sqlcode = 0 then
							if ll_ctto_prado > 0 then
								ll_ctto_prado	= ll_ctto_prado
							else
								ll_ctto_prado = 0
							end if	
						else
							ll_ctto_prado = 0
						end if
						SELECT 	count("OFERTA_V"."NRO_OFERTA")
						INTO		:ll_prom_prado
						FROM 	"CADENA", "OFERTA_V"  
						WHERE 	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
									"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
									"CADENA"."CODIGO" = 'O'  AND  
									("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND
									"CADENA"."COD_PARQUE" = :ll_cod_parque AND
									(( SELECT to_number(to_char("OFERTA_V"."FECHA_M", 'MM')) from dual) >= :ll_mes_ini and
									( SELECT to_number(to_char("OFERTA_V"."FECHA_M", 'MM')) from dual) <= :ll_mes_fin )
						USING	Trans_1;
						if Trans_1.sqlcode = 0 then
							if ll_prom_prado > 0 then
								ll_prom_prado	= ll_prom_prado
							else
								ll_prom_prado	= 0
							end if	
						else
							ll_prom_prado = 0
						end if
						ll_tot_venc_prado		= ll_ctto_prado + ll_prom_prado
						/////calculo de mantenciones pagadas
						SELECT 	count("CADENA"."NUMERO")  
						INTO 		:ll_pag_prado  
						FROM 	"CADENA","INGRESO"  
						WHERE 	"CADENA"."SERIE" = "INGRESO"."SERIE" and  
									"CADENA"."NUMERO" = "INGRESO"."CONTRATO" and  
									("CADENA"."CODIGO" = 'O' OR "CADENA"."CODIGO" = 'C') AND  
									("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
									"INGRESO"."TIPO_MOV" = 'F' AND  
									"INGRESO"."PAGO_HIST" = 'A' AND  
									("INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'CU') AND  
									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND  
									"CADENA"."COD_PARQUE" = :ll_cod_parque
						USING	Trans_1;
						if Trans_1.sqlcode = 0 then
							if ll_pag_prado > 0 then
								ll_pag_prado	= ll_pag_prado
							else
								ll_pag_prado = 0
							end if	
						else
							ll_pag_prado = 0
						end if		
						if ll_cod_parque=1 then
							dw_lista.object.t_prado.text		= ls_nombre
							dw_lista.setitem(1,'tot_venc_prado',ll_tot_venc_prado)
							dw_lista.setitem(1,'tot_pag_prado',ll_pag_prado)
						elseif ll_cod_parque=102 then
							dw_lista.object.t_manantial.text		= ls_nombre
							dw_lista.setitem(1,'tot_venc_manantial',ll_tot_venc_prado)
							dw_lista.setitem(1,'tot_pag_manantial',ll_pag_prado)
						elseif ll_cod_parque=103 then
							dw_lista.object.t_santiago.text		= ls_nombre
							dw_lista.setitem(1,'tot_venc_santiago',ll_tot_venc_prado)
							dw_lista.setitem(1,'tot_pag_santiago',ll_pag_prado)
						elseif ll_cod_parque=101 then
							dw_lista.object.t_canaan.text		= ls_nombre
							dw_lista.setitem(1,'tot_venc_canaan',ll_tot_venc_prado)
							dw_lista.setitem(1,'tot_pag_canaan',ll_pag_prado)	
						elseif ll_cod_parque=11 then
							dw_lista.object.t_prado.text		= ls_nombre
							dw_lista.setitem(1,'tot_venc_prado',ll_tot_venc_prado)
							dw_lista.setitem(1,'tot_pag_prado',ll_pag_prado)	
							dw_lista.object.t_manantial.visible					= false
							dw_lista.object.t_santiago.visible					= false
							dw_lista.object.t_canaan.visible					= false
							dw_lista.object.tot_venc_manantial.visible		= false
							dw_lista.object.tot_venc_santiago.visible			= false
							dw_lista.object.tot_venc_canaan.visible			= false
							dw_lista.object.tot_pag_manantial.visible		= false
							dw_lista.object.tot_pag_santiago.visible			= false
							dw_lista.object.tot_pag_canaan.visible			= false
							dw_lista.object.c_manantial.visible				= false
							dw_lista.object.c_santiago.visible					= false
							dw_lista.object.c_canaan.visible					= false
						end if
					end if	
					setnull(ll_cod_parque);setnull(ls_nombre);
				LOOP
			end if
			close x1;	
		end if
	end if
end if	
end event

type em_fec_fin from editmask within w_resumen_mantenciones
integer x = 1125
integer y = 32
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -10
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
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_resumen_mantenciones
integer x = 32
integer y = 40
integer width = 439
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fechas:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_resumen_mantenciones
integer x = 485
integer y = 32
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type p_ini from picture within w_resumen_mantenciones
integer x = 846
integer y = 32
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
		dw_lista.reset()
	end if	
END IF
end event

type st_3 from statictext within w_resumen_mantenciones
integer x = 933
integer y = 40
integer width = 169
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_fin from picture within w_resumen_mantenciones
integer x = 1486
integer y = 32
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		dw_lista.reset()
	end if	
END IF
end event

type gb_1 from groupbox within w_resumen_mantenciones
integer x = 1143
integer y = 1136
integer width = 613
integer height = 168
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

