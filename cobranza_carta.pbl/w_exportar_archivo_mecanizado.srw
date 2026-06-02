forward
global type w_exportar_archivo_mecanizado from window
end type
type em_ot from editmask within w_exportar_archivo_mecanizado
end type
type st_ot from statictext within w_exportar_archivo_mecanizado
end type
type st_1 from statictext within w_exportar_archivo_mecanizado
end type
type dw_parque from datawindow within w_exportar_archivo_mecanizado
end type
type dw_exportar from datawindow within w_exportar_archivo_mecanizado
end type
type cb_imprimir from commandbutton within w_exportar_archivo_mecanizado
end type
type cb_sort from commandbutton within w_exportar_archivo_mecanizado
end type
type cb_filtrar from commandbutton within w_exportar_archivo_mecanizado
end type
type cb_cta_cte from commandbutton within w_exportar_archivo_mecanizado
end type
type cb_exportar from commandbutton within w_exportar_archivo_mecanizado
end type
type cb_cerrar from commandbutton within w_exportar_archivo_mecanizado
end type
type pb_ok from picturebutton within w_exportar_archivo_mecanizado
end type
type p_fin from picture within w_exportar_archivo_mecanizado
end type
type em_fec_fin from editmask within w_exportar_archivo_mecanizado
end type
type st_3 from statictext within w_exportar_archivo_mecanizado
end type
type p_ini from picture within w_exportar_archivo_mecanizado
end type
type em_fec_ini from editmask within w_exportar_archivo_mecanizado
end type
type st_2 from statictext within w_exportar_archivo_mecanizado
end type
type dw_lista from datawindow within w_exportar_archivo_mecanizado
end type
type gb_1 from groupbox within w_exportar_archivo_mecanizado
end type
end forward

global type w_exportar_archivo_mecanizado from window
integer width = 3086
integer height = 1776
boolean titlebar = true
string title = "Exportar Archivo Envio Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_ot em_ot
st_ot st_ot
st_1 st_1
dw_parque dw_parque
dw_exportar dw_exportar
cb_imprimir cb_imprimir
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_cta_cte cb_cta_cte
cb_exportar cb_exportar
cb_cerrar cb_cerrar
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
dw_lista dw_lista
gb_1 gb_1
end type
global w_exportar_archivo_mecanizado w_exportar_archivo_mecanizado

type variables
Long		il_row
String	is_depto
end variables

on w_exportar_archivo_mecanizado.create
this.em_ot=create em_ot
this.st_ot=create st_ot
this.st_1=create st_1
this.dw_parque=create dw_parque
this.dw_exportar=create dw_exportar
this.cb_imprimir=create cb_imprimir
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_cta_cte=create cb_cta_cte
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.em_ot,&
this.st_ot,&
this.st_1,&
this.dw_parque,&
this.dw_exportar,&
this.cb_imprimir,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_cta_cte,&
this.cb_exportar,&
this.cb_cerrar,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.dw_lista,&
this.gb_1}
end on

on w_exportar_archivo_mecanizado.destroy
destroy(this.em_ot)
destroy(this.st_ot)
destroy(this.st_1)
destroy(this.dw_parque)
destroy(this.dw_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_cta_cte)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Long		ll_parque
gf_centrar(w_exportar_archivo_mecanizado)
st_ot.visible				= false
em_ot.visible			= false
dw_lista.settransobject(sqlca)
em_fec_ini.text			= string(today(),"dd/mm/yyyy")
em_fec_fin.text			= string(today(),"dd/mm/yyyy")
ld_fec_ini				= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin				= datetime(date(em_fec_fin.text),lt_fin)
dw_exportar.dataobject	= 'dwe_exportar_archivo_mecanizado'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque			= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque			= 11
elseif gs_conexion = "Parque Concepción" then
	ll_parque			= 801
end if
if gs_depto='O' then
	is_depto			= 'O'
	dw_exportar.dataobject	= 'dwe_exportar_archivo_mecanizado_venc'
elseif gs_depto='I' then
	is_depto				= '%'
else
	is_depto				= gs_depto
end if
dw_exportar.settransobject(sqlca)
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_parque.accepttext()
//dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque,is_depto)
end event

type em_ot from editmask within w_exportar_archivo_mecanizado
boolean visible = false
integer x = 439
integer y = 1560
integer width = 425
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

type st_ot from statictext within w_exportar_archivo_mecanizado
boolean visible = false
integer x = 37
integer y = 1572
integer width = 393
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Nº O.T.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_exportar_archivo_mecanizado
integer x = 1737
integer y = 72
integer width = 229
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_exportar_archivo_mecanizado
integer x = 1993
integer y = 56
integer width = 608
integer height = 108
integer taborder = 40
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_lista.reset()
end event

type dw_exportar from datawindow within w_exportar_archivo_mecanizado
boolean visible = false
integer x = 1202
integer y = 1648
integer width = 494
integer height = 432
integer taborder = 80
string dataobject = "dwe_exportar_archivo_mecanizado_venc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_exportar_archivo_mecanizado
integer x = 1966
integer y = 1560
integer width = 219
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_sort from commandbutton within w_exportar_archivo_mecanizado
integer x = 2190
integer y = 1560
integer width = 224
integer height = 84
integer taborder = 100
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

type cb_filtrar from commandbutton within w_exportar_archivo_mecanizado
integer x = 2418
integer y = 1560
integer width = 224
integer height = 84
integer taborder = 110
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_cta_cte from commandbutton within w_exportar_archivo_mecanizado
integer x = 1481
integer y = 1552
integer width = 416
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if il_row>0 and dw_lista.rowcount()>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_numero')
	gs_base		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'gc_detalle_gestion_serie')
	gi_rut		= dw_lista.getitemnumber(il_row,'gc_detalle_gestion_rut_cliente')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type cb_exportar from commandbutton within w_exportar_archivo_mecanizado
integer x = 37
integer y = 1552
integer width = 421
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_correlativo,ll_new,ll_count,ll_resp=1,ll_nro_ot
String		ls_nombre,ls_direccion_p,ls_poblacion,ls_comuna,ls_ciudad,ls_base,ls_serie,ls_estado_tit,ls_pasa='S'
Date		ld_fecha
Double	ll_numero
datawindow dw_paso
//if is_depto	= 'O' then
////	ll_nro_ot	= long(em_ot.text)
//	if ll_nro_ot=0 or isnull(ll_nro_ot) then 
//		ls_pasa='N'
//		messagebox("Advertencia","Debe Ingresar Orden de Trabajo")
//		em_ot.setfocus()
//	end if
//end if
if ls_pasa='S' then
	ll_tot_reg	= dw_lista.rowcount()
	if ll_tot_reg > 0 then 
		dw_exportar.reset()
		for ll_indi=1 to ll_tot_reg
			ls_estado_tit	= trim(dw_lista.getitemstring(ll_indi,'cliente_estado_titular'))
			if ls_estado_tit='0' then
				ls_nombre		= trim(dw_lista.getitemstring(ll_indi,'nombre_cliente'))
			else
				ls_nombre		= 'FAMILIA'+' '+trim(dw_lista.getitemstring(ll_indi,'cliente_a_paterno'))+' '+trim(dw_lista.getitemstring(ll_indi,'cliente_a_materno'))
			end if
			ls_direccion_p	= trim(dw_lista.getitemstring(ll_indi,'tipo_via_descripcion'))+' '+trim(dw_lista.getitemstring(ll_indi,'cliente_direccion_p'))
			if isnull(trim(dw_lista.getitemstring(ll_indi,'cliente_numero_particular'))) or trim(dw_lista.getitemstring(ll_indi,'cliente_numero_particular'))='' then
				ls_direccion_p	= ls_direccion_p + ' Nº:/-'
			else
				ls_direccion_p	= ls_direccion_p + ' Nº:/'+trim(dw_lista.getitemstring(ll_indi,'cliente_numero_particular'))
			end if
			if isnull(trim(dw_lista.getitemstring(ll_indi,'cliente_depto_particular'))) or trim(dw_lista.getitemstring(ll_indi,'cliente_depto_particular'))='' then
				ls_direccion_p	= ls_direccion_p + ' D:/-'
			else
				ls_direccion_p	= ls_direccion_p + ' D:/'+trim(dw_lista.getitemstring(ll_indi,'cliente_depto_particular'))
			end if
			if isnull(trim(dw_lista.getitemstring(ll_indi,'cliente_block_particular'))) or trim(dw_lista.getitemstring(ll_indi,'cliente_block_particular'))='' then
				ls_direccion_p	= ls_direccion_p + ' B:/-'
			else
				ls_direccion_p	= ls_direccion_p + ' B:/'+trim(dw_lista.getitemstring(ll_indi,'cliente_block_particular'))
			end if
			ls_poblacion	= trim(dw_lista.getitemstring(ll_indi,'cliente_poblacion'))
			ls_comuna		= trim(dw_lista.getitemstring(ll_indi,'comuna_comuna'))
			ls_ciudad		= trim(dw_lista.getitemstring(ll_indi,'ciudad_sigla_ciudad'))
			ls_base			= trim(dw_lista.getitemstring(ll_indi,'gc_detalle_gestion_base'))
			ls_serie			= trim(dw_lista.getitemstring(ll_indi,'gc_detalle_gestion_serie'))
			ll_numero		= dw_lista.getitemnumber(ll_indi,'gc_detalle_gestion_numero')
			ll_correlativo	= dw_lista.getitemnumber(ll_indi,'gc_detalle_gestion_correlativo')
			ll_new			= dw_exportar.insertrow(0)
			dw_exportar.scrolltorow(ll_new)
			dw_exportar.setitem(ll_new,'nombre',ls_nombre)
			dw_exportar.setitem(ll_new,'direccion_p',ls_direccion_p)
			dw_exportar.setitem(ll_new,'poblacion',ls_poblacion)
			dw_exportar.setitem(ll_new,'comuna',ls_comuna)
			dw_exportar.setitem(ll_new,'ciudad',ls_ciudad)
			dw_exportar.setitem(ll_new,'base',ls_base)
			dw_exportar.setitem(ll_new,'serie',ls_serie)
			dw_exportar.setitem(ll_new,'numero',ll_numero)
			dw_exportar.setitem(ll_new,'correlativo',ll_correlativo)
			if is_depto	= 'O' then
				dw_exportar.setitem(ll_new,'fecha_emision',date(gdt_fec_sistema))
//				dw_exportar.setitem(ll_new,'numero_orden_trabajo',ll_nro_ot)
			end if
		next
		dw_exportar.accepttext()
		ld_fecha	= date(em_fec_ini.text)
		SELECT 	MAX("GESTION_CARTA_GENERA_ARCHIVO"."CORRELATIVO")  
		INTO 		:ll_count
		FROM 		"GESTION_CARTA_GENERA_ARCHIVO"  
		WHERE  ( "GESTION_CARTA_GENERA_ARCHIVO"."FECHA_PROCESO" = :ld_fecha ) AND  
				 ( "GESTION_CARTA_GENERA_ARCHIVO"."DEPARTAMENTO" = :is_depto ) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ll_count>0 then
				if ll_count=1 then ll_resp = MessageBox("Advertencia", "Este Archivo ya fue Generado "+string(ll_count)+" vez, desea crear nuevamente",Exclamation!, YesNo!, 2)
				if ll_count>1 then ll_resp = MessageBox("Advertencia", "Este Archivo ya fue Generado "+string(ll_count)+" veces, desea crear nuevamente",Exclamation!, YesNo!, 2)
			end if
		end if
		dw_paso		= dw_exportar
		//if ll_resp=1 then	OpenWithParm(w_exportar_archivo_envio_carta, dw_paso)
		if ll_resp=1 then	f_DWToExcel( dw_paso )
	end if
end if
end event

type cb_cerrar from commandbutton within w_exportar_archivo_mecanizado
integer x = 2702
integer y = 1552
integer width = 325
integer height = 104
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_exportar_archivo_mecanizado)
end event

type pb_ok from picturebutton within w_exportar_archivo_mecanizado
integer x = 2638
integer y = 24
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Long		ll_parque
SetPointer(HourGlass!)
ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			ll_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if not isnull(ll_parque) then
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque,is_depto)=0 then
					messagebox("Advertencia","No Registra Dato en Rango de Fecha")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_parque.setfocus()
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type p_fin from picture within w_exportar_archivo_mecanizado
integer x = 1591
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_exportar_archivo_mecanizado
integer x = 1230
integer y = 56
integer width = 357
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
end type

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_exportar_archivo_mecanizado
integer x = 1038
integer y = 72
integer width = 160
integer height = 56
integer textsize = -8
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

type p_ini from picture within w_exportar_archivo_mecanizado
integer x = 923
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_exportar_archivo_mecanizado
integer x = 562
integer y = 56
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
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

type st_2 from statictext within w_exportar_archivo_mecanizado
integer x = 41
integer y = 72
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_exportar_archivo_mecanizado
integer x = 37
integer y = 200
integer width = 2990
integer height = 1308
integer taborder = 50
string title = "none"
string dataobject = "dw_exportar_archivo_mecanizado"
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

type gb_1 from groupbox within w_exportar_archivo_mecanizado
integer x = 1938
integer y = 1512
integer width = 731
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

