forward
global type w_buscar_clasificacion_de_riesgo from window
end type
type dw_print_ext from datawindow within w_buscar_clasificacion_de_riesgo
end type
type dw_lista_gral from datawindow within w_buscar_clasificacion_de_riesgo
end type
type cb_imp_resumen from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type dw_exp_lista from datawindow within w_buscar_clasificacion_de_riesgo
end type
type cb_aceptar from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type cb_3 from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type cb_2 from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type cb_4 from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type p_2 from picture within w_buscar_clasificacion_de_riesgo
end type
type p_1 from picture within w_buscar_clasificacion_de_riesgo
end type
type pb_aceptar from picturebutton within w_buscar_clasificacion_de_riesgo
end type
type em_fec_fin from editmask within w_buscar_clasificacion_de_riesgo
end type
type em_fec_ini from editmask within w_buscar_clasificacion_de_riesgo
end type
type st_2 from statictext within w_buscar_clasificacion_de_riesgo
end type
type st_1 from statictext within w_buscar_clasificacion_de_riesgo
end type
type cb_cerrar from commandbutton within w_buscar_clasificacion_de_riesgo
end type
type dw_lista from datawindow within w_buscar_clasificacion_de_riesgo
end type
type gb_1 from groupbox within w_buscar_clasificacion_de_riesgo
end type
end forward

global type w_buscar_clasificacion_de_riesgo from window
integer width = 3291
integer height = 1912
boolean titlebar = true
string title = "Buscar Clasificaciones de Riesgo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_print_ext dw_print_ext
dw_lista_gral dw_lista_gral
cb_imp_resumen cb_imp_resumen
dw_exp_lista dw_exp_lista
cb_aceptar cb_aceptar
cb_3 cb_3
cb_2 cb_2
cb_4 cb_4
p_2 p_2
p_1 p_1
pb_aceptar pb_aceptar
em_fec_fin em_fec_fin
em_fec_ini em_fec_ini
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_clasificacion_de_riesgo w_buscar_clasificacion_de_riesgo

on w_buscar_clasificacion_de_riesgo.create
this.dw_print_ext=create dw_print_ext
this.dw_lista_gral=create dw_lista_gral
this.cb_imp_resumen=create cb_imp_resumen
this.dw_exp_lista=create dw_exp_lista
this.cb_aceptar=create cb_aceptar
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_4=create cb_4
this.p_2=create p_2
this.p_1=create p_1
this.pb_aceptar=create pb_aceptar
this.em_fec_fin=create em_fec_fin
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.dw_print_ext,&
this.dw_lista_gral,&
this.cb_imp_resumen,&
this.dw_exp_lista,&
this.cb_aceptar,&
this.cb_3,&
this.cb_2,&
this.cb_4,&
this.p_2,&
this.p_1,&
this.pb_aceptar,&
this.em_fec_fin,&
this.em_fec_ini,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_clasificacion_de_riesgo.destroy
destroy(this.dw_print_ext)
destroy(this.dw_lista_gral)
destroy(this.cb_imp_resumen)
destroy(this.dw_exp_lista)
destroy(this.cb_aceptar)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.pb_aceptar)
destroy(this.em_fec_fin)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_buscar_clasificacion_de_riesgo)
dw_lista.settransobject(sqlca)
dw_exp_lista.settransobject(sqlca)
dw_lista_gral.settransobject(sqlca)
dw_print_ext.settransobject(sqlca)
em_fec_ini.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_fin.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")

end event

type dw_print_ext from datawindow within w_buscar_clasificacion_de_riesgo
boolean visible = false
integer x = 1307
integer y = 1824
integer width = 722
integer height = 444
string title = "none"
string dataobject = "dwe_imprimir_resumen_clasifica"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista_gral from datawindow within w_buscar_clasificacion_de_riesgo
boolean visible = false
integer x = 2098
integer y = 1824
integer width = 722
integer height = 444
string dataobject = "dw_lista_general_clasificacion_resumen_b"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imp_resumen from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 576
integer y = 1664
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir &Resumen"
end type

event clicked;//if isvalid(w_imprimir_resumen_clasificacion) then close(w_imprimir_resumen_clasificacion)
//if dw_lista.rowcount()>0 then open(w_imprimir_resumen_clasificacion)
date		ld_fec_ini,ld_fec_fin
Long		ll_indi,ll_tot_reg,ll_cant_1,ll_cant_2,ll_cant_3,ll_cant_4,ll_cant_5,&
			ll_parque,ll_parque_aux,ll_contar,ll_new
Double	ll_porce_1,ll_porce_2,ll_porce_3,ll_porce_4,ll_porce_5

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
dw_print_ext.reset()
ll_tot_reg	= dw_lista_gral.retrieve(ld_fec_ini,ld_fec_fin)
ll_contar	= 0
if ll_tot_reg=0 then 
	messagebox("Advertencia","No registra datos")
else
	ll_parque_aux	= dw_lista_gral.getitemnumber(1,'parque')
	for ll_indi= 1 to ll_tot_reg
		ll_parque	= dw_lista_gral.getitemnumber(ll_indi,'parque')
		ll_cant_1	= dw_lista_gral.getitemnumber(ll_indi,'sum_may0men40')
		ll_cant_2	= dw_lista_gral.getitemnumber(ll_indi,'sum_mayig40_men50')
		ll_cant_3	= dw_lista_gral.getitemnumber(ll_indi,'sum_mayig_50_men60')
		ll_cant_4	= dw_lista_gral.getitemnumber(ll_indi,'sum_mayig60_men70')
		ll_cant_5	= dw_lista_gral.getitemnumber(ll_indi,'sum_mayig70_menig100')
		ll_porce_1	= dw_lista_gral.getitemnumber(ll_indi,'porc_may0men40')
		ll_porce_2	= dw_lista_gral.getitemnumber(ll_indi,'porc_mayig40_men50')
		ll_porce_3	= dw_lista_gral.getitemnumber(ll_indi,'porc_mayig_50_men60')
		ll_porce_4	= dw_lista_gral.getitemnumber(ll_indi,'porc_mayig60_men70')
		ll_porce_5	= dw_lista_gral.getitemnumber(ll_indi,'porc_mayig70_menig100')
		ll_contar ++
		if ll_parque_aux=ll_parque then
			if ll_contar=1 then
				ll_new	= dw_print_ext.insertrow(0)
				dw_print_ext.setitem(ll_new,'cod_parque',ll_parque)
				dw_print_ext.setitem(ll_new,'cant_1',ll_cant_1)
				dw_print_ext.setitem(ll_new,'cant_2',ll_cant_2)
				dw_print_ext.setitem(ll_new,'cant_3',ll_cant_3)
				dw_print_ext.setitem(ll_new,'cant_4',ll_cant_4)
				dw_print_ext.setitem(ll_new,'cant_5',ll_cant_5)
				dw_print_ext.setitem(ll_new,'porce_1',ll_porce_1)
				dw_print_ext.setitem(ll_new,'porce_2',ll_porce_2)
				dw_print_ext.setitem(ll_new,'porce_3',ll_porce_3)
				dw_print_ext.setitem(ll_new,'porce_4',ll_porce_4)
				dw_print_ext.setitem(ll_new,'porce_5',ll_porce_5)
				ll_parque_aux	= ll_parque
			end if
		else
			ll_contar			= 1
			if ll_contar=1 then
				ll_new			= dw_print_ext.insertrow(0)
				dw_print_ext.setitem(ll_new,'cod_parque',ll_parque)
				dw_print_ext.setitem(ll_new,'cant_1',ll_cant_1)
				dw_print_ext.setitem(ll_new,'cant_2',ll_cant_2)
				dw_print_ext.setitem(ll_new,'cant_3',ll_cant_3)
				dw_print_ext.setitem(ll_new,'cant_4',ll_cant_4)
				dw_print_ext.setitem(ll_new,'cant_5',ll_cant_5)
				dw_print_ext.setitem(ll_new,'porce_1',ll_porce_1)
				dw_print_ext.setitem(ll_new,'porce_2',ll_porce_2)
				dw_print_ext.setitem(ll_new,'porce_3',ll_porce_3)
				dw_print_ext.setitem(ll_new,'porce_4',ll_porce_4)
				dw_print_ext.setitem(ll_new,'porce_5',ll_porce_5)
				ll_parque_aux	= ll_parque
				ll_contar ++
			end if
		end if		
	next
	if dw_print_ext.rowcount()>0 then 
		dw_print_ext.object.t_titulo_1.text	= 'Total Contratos Asignados a Ejecutivos en Terreno entre '+string(ld_fec_ini,'dd/mm/yyyy')+' hasta '+string(ld_fec_fin,'dd/mm/yyyy')
		f_Print( dw_print_ext )
//		f_printdlg(dw_print_ext,gstr_print,w_buscar_clasificacion_de_riesgo)
	end if
end if
end event

type dw_exp_lista from datawindow within w_buscar_clasificacion_de_riesgo
boolean visible = false
integer x = 681
integer y = 1820
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_exportar_lista_clasificacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_aceptar from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 37
integer y = 1664
integer width = 293
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String		ls_base,ls_serie,ls_dv
Long		ll_rut,ll_row,ll_new
Double	ll_numero

if dw_lista.getrow()>0 then
	ll_row		= dw_lista.getrow()
	ls_base		= dw_lista.getitemstring(ll_row,'base')
	ls_serie		= dw_lista.getitemstring(ll_row,'serie')
	ll_numero	= dw_lista.getitemnumber(ll_row,'numero')
	ll_rut		= dw_lista.getitemnumber(ll_row,'cadena_rut')
	if isvalid(w_formulario_clasificacion_riesgo) then
		if ls_base='O' then
			w_formulario_clasificacion_riesgo.dw_lista.setitem(1,'base',ls_base)
			w_formulario_clasificacion_riesgo.dw_lista.setitem(1,'serie',ls_serie)
			w_formulario_clasificacion_riesgo.dw_lista.setitem(1,'numero',ll_numero)
			w_formulario_clasificacion_riesgo.dw_lista.triggerevent(itemchanged!)
		end if
		w_formulario_clasificacion_riesgo.dw_lista.setfocus()
		cb_cerrar.triggerevent(clicked!)
	end if
end if
end event

type cb_3 from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 1801
integer y = 1672
integer width = 229
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_cod_parque,ll_plazo,ll_new
String	ls_base,ls_serie,ls_jefe,ls_estado_titular,ls_moneda,ls_estado_ctto
Datetime	ldt_fecha_crea
Double	ldb_op_pie,ldb_op_justifi,ldb_op_domi,ldb_op_plazo,ldb_op_asigna,ldb_op_total,ldb_at_tipo_vi,&
			ldb_at_post_vta,ldb_at_recep_dcto,ldb_at_clasif_vta,ldb_at_total,ldb_total,ldb_pie,ldb_pie_pagado,&
			ldb_precio,ll_numero
datawindow dw_paso

dw_exp_lista.reset()
ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base				= dw_lista.getitemstring(ll_indi,'base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
		ls_jefe				= dw_lista.getitemstring(ll_indi,'jefe_venta')
		ldt_fecha_crea		= dw_lista.getitemdatetime(ll_indi,'fecha_crea')
		ldb_op_pie			= dw_lista.getitemnumber(ll_indi,'op_pie')
		ldb_op_justifi		= dw_lista.getitemnumber(ll_indi,'op_justifica_renta')
		ldb_op_domi			= dw_lista.getitemnumber(ll_indi,'op_comp_domicilio')
		ldb_op_plazo		= dw_lista.getitemnumber(ll_indi,'op_plazo')
		ldb_op_asigna		= dw_lista.getitemnumber(ll_indi,'at_electrodomestico')
		if isnull(ldb_op_pie) then ldb_op_pie=0
		if isnull(ldb_op_justifi) then ldb_op_justifi=0
		if isnull(ldb_op_domi) then ldb_op_domi=0
		if isnull(ldb_op_plazo) then ldb_op_plazo=0
		if isnull(ldb_op_asigna) then ldb_op_asigna=0
		ldb_op_total		= ldb_op_pie + ldb_op_justifi + ldb_op_domi + ldb_op_plazo + ldb_op_asigna
		
		ldb_at_tipo_vi		= dw_lista.getitemnumber(ll_indi,'at_tipo_vivienda')
		ldb_at_post_vta	= dw_lista.getitemnumber(ll_indi,'at_automovil')
		ldb_at_recep_dcto	= dw_lista.getitemnumber(ll_indi,'at_telecomunicaciones')
		ldb_at_clasif_vta	= dw_lista.getitemnumber(ll_indi,'at_interes_cliente')
		if isnull(ldb_at_tipo_vi) then ldb_at_tipo_vi=0
		if isnull(ldb_at_post_vta) then ldb_at_post_vta=0
		if isnull(ldb_at_recep_dcto) then ldb_at_recep_dcto=0
		if isnull(ldb_at_clasif_vta) then ldb_at_clasif_vta=0
		ldb_at_total		= ldb_at_tipo_vi + ldb_at_post_vta + ldb_at_recep_dcto + ldb_at_clasif_vta
		ldb_total			= ldb_op_total + ldb_at_total
		
		ll_cod_parque		= dw_lista.getitemnumber(ll_indi,'parque')
		ls_estado_titular	= dw_lista.getitemstring(ll_indi,'estado_titular')
		ll_plazo				= dw_lista.getitemnumber(ll_indi,'plazo')
		ldb_pie				= dw_lista.getitemnumber(ll_indi,'pie')
		ldb_pie_pagado		= dw_lista.getitemnumber(ll_indi,'pie_pagado')
		ldb_precio			= dw_lista.getitemnumber(ll_indi,'precio')
		ls_moneda			= dw_lista.getitemstring(ll_indi,'moneda')
		ls_estado_ctto		= dw_lista.getitemstring(ll_indi,'cadena_estado')
		
		ll_new				= dw_exp_lista.insertrow(0)
		dw_exp_lista.scrolltorow(ll_new)
		dw_exp_lista.setitem(ll_new,'base',ls_base)
		dw_exp_lista.setitem(ll_new,'serie',ls_serie)
		dw_exp_lista.setitem(ll_new,'numero',ll_numero)
		dw_exp_lista.setitem(ll_new,'cod_jefe',ls_jefe)
		dw_exp_lista.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
		dw_exp_lista.setitem(ll_new,'op_pie',ldb_op_pie)
		dw_exp_lista.setitem(ll_new,'op_justifica_renta',ldb_op_justifi)
		dw_exp_lista.setitem(ll_new,'op_comprob_domicilio',ldb_op_domi)
		dw_exp_lista.setitem(ll_new,'op_plazo',ldb_op_plazo)
		dw_exp_lista.setitem(ll_new,'op_asignacion',ldb_op_asigna)
		dw_exp_lista.setitem(ll_new,'op_total',ldb_op_total)
		dw_exp_lista.setitem(ll_new,'at_tipo_vivienda',ldb_at_tipo_vi)
		dw_exp_lista.setitem(ll_new,'at_post_venta',ldb_at_post_vta)
		dw_exp_lista.setitem(ll_new,'at_recepcion_dctos',ldb_at_recep_dcto)
		dw_exp_lista.setitem(ll_new,'at_clasifica_venta',ldb_at_clasif_vta)
		dw_exp_lista.setitem(ll_new,'at_total',ldb_at_total)
		dw_exp_lista.setitem(ll_new,'total_promedio',ldb_op_total + ldb_at_total)
		dw_exp_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
		dw_exp_lista.setitem(ll_new,'estado_titular',ls_estado_titular)
		dw_exp_lista.setitem(ll_new,'plazo',ll_plazo)
		dw_exp_lista.setitem(ll_new,'pie',ldb_pie)
		dw_exp_lista.setitem(ll_new,'pie_pagado',ldb_pie_pagado)
		dw_exp_lista.setitem(ll_new,'precio',ldb_precio)
		dw_exp_lista.setitem(ll_new,'moneda',ls_moneda)
		dw_exp_lista.setitem(ll_new,'estado_contrato',ls_estado_ctto)
	next
	dw_exp_lista.accepttext()
	dw_paso	= dw_exp_lista
	if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end if
end event

type cb_2 from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 1554
integer y = 1672
integer width = 238
integer height = 92
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
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_4 from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 1321
integer y = 1672
integer width = 224
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type p_2 from picture within w_buscar_clasificacion_de_riesgo
integer x = 1518
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_fin.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_fin.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
dw_lista.reset()
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_fin.text	= string(ls_fecha)
END IF
em_fec_fin.setfocus()
end event

type p_1 from picture within w_buscar_clasificacion_de_riesgo
integer x = 859
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_ini.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_ini.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
dw_lista.reset()
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_ini.text	= string(ls_fecha)
END IF
em_fec_ini.setfocus()
end event

type pb_aceptar from picturebutton within w_buscar_clasificacion_de_riesgo
integer x = 1678
integer y = 32
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;date	ld_fec_ini,ld_fec_fin

SetPointer(HourGlass!)
ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then 
		messagebox("Advertencia","No registra datos")
	end if
end if
SetPointer(Arrow!)
end event

type em_fec_fin from editmask within w_buscar_clasificacion_de_riesgo
integer x = 1170
integer y = 60
integer width = 343
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

type em_fec_ini from editmask within w_buscar_clasificacion_de_riesgo
integer x = 512
integer y = 60
integer width = 343
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
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_buscar_clasificacion_de_riesgo
integer x = 951
integer y = 76
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_buscar_clasificacion_de_riesgo
integer x = 37
integer y = 72
integer width = 475
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha Desde:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_buscar_clasificacion_de_riesgo
integer x = 2939
integer y = 1664
integer width = 293
integer height = 104
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_clasificacion_de_riesgo)
end event

type dw_lista from datawindow within w_buscar_clasificacion_de_riesgo
integer x = 32
integer y = 208
integer width = 3200
integer height = 1408
integer taborder = 40
string dataobject = "dw_lista_general_clasificacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro
ls_columna	= dwo.name
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	if ls_columna='t_bajo' then
		ls_filtro	= "c_evaluacion='Bajo'"
		dw_lista.setfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_medio' then
		ls_filtro	= "c_evaluacion='Medio'"
		dw_lista.setfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_alto' then
		ls_filtro	= "c_evaluacion='Alto'"
		dw_lista.setfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_todo' then
		ls_filtro	= ""
		dw_lista.setfilter(ls_filtro)
		dw_lista.filter()
	end if
end if
end event

event doubleclicked;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_clasificacion_de_riesgo
integer x = 1298
integer y = 1624
integer width = 754
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

