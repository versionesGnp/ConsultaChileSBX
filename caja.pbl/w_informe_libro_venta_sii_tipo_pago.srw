forward
global type w_informe_libro_venta_sii_tipo_pago from window
end type
type cb_ctacte from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type dw_empresa from datawindow within w_informe_libro_venta_sii_tipo_pago
end type
type cb_exportar from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type cb_exp_excel from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type dwe_exportar_excel from datawindow within w_informe_libro_venta_sii_tipo_pago
end type
type st_3 from statictext within w_informe_libro_venta_sii_tipo_pago
end type
type pb_ok from picturebutton within w_informe_libro_venta_sii_tipo_pago
end type
type em_year from editmask within w_informe_libro_venta_sii_tipo_pago
end type
type st_2 from statictext within w_informe_libro_venta_sii_tipo_pago
end type
type ddlb_mes from dropdownlistbox within w_informe_libro_venta_sii_tipo_pago
end type
type st_1 from statictext within w_informe_libro_venta_sii_tipo_pago
end type
type dwe_exportar from datawindow within w_informe_libro_venta_sii_tipo_pago
end type
type cb_imprimir from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type cb_filtrar from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type cb_expor from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type cb_ordenar from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type cb_cerrar from commandbutton within w_informe_libro_venta_sii_tipo_pago
end type
type dw_lista from datawindow within w_informe_libro_venta_sii_tipo_pago
end type
type gb_11 from groupbox within w_informe_libro_venta_sii_tipo_pago
end type
end forward

global type w_informe_libro_venta_sii_tipo_pago from window
integer width = 4005
integer height = 2508
boolean titlebar = true
string title = "Libro de Venta S.I.I."
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
dw_empresa dw_empresa
cb_exportar cb_exportar
cb_exp_excel cb_exp_excel
dwe_exportar_excel dwe_exportar_excel
st_3 st_3
pb_ok pb_ok
em_year em_year
st_2 st_2
ddlb_mes ddlb_mes
st_1 st_1
dwe_exportar dwe_exportar
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_expor cb_expor
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_11 gb_11
end type
global w_informe_libro_venta_sii_tipo_pago w_informe_libro_venta_sii_tipo_pago

type variables
String		is_opcion
end variables

on w_informe_libro_venta_sii_tipo_pago.create
this.cb_ctacte=create cb_ctacte
this.dw_empresa=create dw_empresa
this.cb_exportar=create cb_exportar
this.cb_exp_excel=create cb_exp_excel
this.dwe_exportar_excel=create dwe_exportar_excel
this.st_3=create st_3
this.pb_ok=create pb_ok
this.em_year=create em_year
this.st_2=create st_2
this.ddlb_mes=create ddlb_mes
this.st_1=create st_1
this.dwe_exportar=create dwe_exportar
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_expor=create cb_expor
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_11=create gb_11
this.Control[]={this.cb_ctacte,&
this.dw_empresa,&
this.cb_exportar,&
this.cb_exp_excel,&
this.dwe_exportar_excel,&
this.st_3,&
this.pb_ok,&
this.em_year,&
this.st_2,&
this.ddlb_mes,&
this.st_1,&
this.dwe_exportar,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_expor,&
this.cb_ordenar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_11}
end on

on w_informe_libro_venta_sii_tipo_pago.destroy
destroy(this.cb_ctacte)
destroy(this.dw_empresa)
destroy(this.cb_exportar)
destroy(this.cb_exp_excel)
destroy(this.dwe_exportar_excel)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.em_year)
destroy(this.st_2)
destroy(this.ddlb_mes)
destroy(this.st_1)
destroy(this.dwe_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_expor)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_11)
end on

event open;Long	ll_grupo,ll_mes,ll_anno

gf_centrar(w_informe_libro_venta_sii_tipo_pago)

dw_empresa.settransobject(sqlca)
dw_empresa.insertrow(0)
is_opcion						= Message.StringParm
dw_lista.dataobject		= 'dw_libro_venta_group_sii_tp'
dw_lista.settransobject(sqlca)
dwe_exportar.settransobject(sqlca)
ll_mes						= month(date(gdt_fec_sistema))
ll_anno						= year(date(gdt_fec_sistema))
CHOOSE CASE ll_mes
	CASE 1
		ddlb_mes.text	= '01 - Enero'
	CASE 2
		ddlb_mes.text	= '02 - Febrero'
	CASE 3
		ddlb_mes.text	= '03 - Marzo'
	CASE 4
		ddlb_mes.text	= '04 - Abril'
	CASE 5
		ddlb_mes.text	= '05 - Mayo'
	CASE 6
		ddlb_mes.text	= '06 - Junio'
	CASE 7
		ddlb_mes.text	= '07 - Julio'
	CASE 8
		ddlb_mes.text	= '08 - Agosto'
	CASE 9
		ddlb_mes.text	= '09 - Septiembre'
	CASE 10
		ddlb_mes.text	= '10 - Octubre'
	CASE 11
		ddlb_mes.text	= '11 - Noviembre'
	CASE 12
		ddlb_mes.text	= '12 - Diciembre'
END CHOOSE
em_year.text			= string(ll_anno,'0000')
if gs_depto='I' then
	cb_filtrar.enabled	= true
else
	cb_filtrar.enabled	= false
end if
ddlb_mes.setfocus()

end event

type cb_ctacte from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 2057
integer y = 2272
integer width = 443
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;IF not isnull(gs_base) and not isnull(gs_serie) and gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
			w_cuenta_corriente_oferta.setfocus()
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
			w_cuenta_corriente_liberador.setfocus()
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
			w_cuenta_corriente_pagare.setfocus()
		CASE "C" // Contrato ISA
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
			w_cuenta_corriente_contrato_isa.setfocus()
		CASE "D" // Derecho
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
			w_cuenta_corriente_derecho.setfocus()
		CASE "R" // Derecho
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
			w_cuenta_corriente_repactar_cta_mant.setfocus()
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
			w_cuenta_corriente_aumento_capacidad.setfocus()
		CASE "F","G" // Funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			Open(w_cuenta_corriente_funeraria)
			w_cuenta_corriente_funeraria.setfocus()
		CASE "B"
			if isvalid(w_cuenta_corriente_facturas) then close(w_cuenta_corriente_facturas)
			Open(w_cuenta_corriente_facturas)
			w_cuenta_corriente_facturas.setfocus()
	END CHOOSE
END IF
end event

type dw_empresa from datawindow within w_informe_libro_venta_sii_tipo_pago
integer x = 14
integer y = 56
integer width = 933
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_listado_empresa_elect"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type cb_exportar from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 503
integer y = 2272
integer width = 242
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_exp_excel from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 1243
integer y = 2272
integer width = 480
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Excel S.I.I."
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_new,ll_largo
String		ls_tipo_dte,ls_est_doc,ls_tasa_iva,ls_dv,ls_nombre,ls_folio,ls_rut,ls_afecto,ls_exento,ls_iva,ls_total,ls_fec_pago,ls_linea,ls_caja
Datetime	ldt_fec_pago
datawindow dw_paso

dwe_exportar_excel.reset()
ll_tot_reg			= dw_lista.rowcount()
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	for ll_indi=1 to ll_tot_reg
		ls_tipo_dte	= dw_lista.getitemstring(ll_indi,'electronica_fb_tipo_tipo_dte')
		ls_folio		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_numero_documento'))
		ls_est_doc	= dw_lista.getitemstring(ll_indi,'estado_documento')
		ls_tasa_iva	= String(dw_lista.getitemNumber(ll_indi,'tasa_iva'))
		ls_fec_pago	= String(dw_lista.getitemdatetime(ll_indi,'vista_listado_ingreso_sii_fecha_pago'),'yyyy-mm-dd')
		ldt_fec_pago= dw_lista.getitemdatetime(ll_indi,'vista_listado_ingreso_sii_fecha_pago')
		ls_rut			= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_rut'))
		ls_dv			= dw_lista.getitemstring(ll_indi,'vista_listado_ingreso_sii_dv')
		ls_nombre	= dw_lista.getitemstring(ll_indi,'nombre_cliente')
		ls_afecto		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_afecto'))
		ls_exento	= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_exento'))
		ls_iva			= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_iva'))
		ls_total		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_total'))
		ls_caja		= dw_lista.getitemstring(ll_indi,'vista_listado_ingreso_sii_cod_caja')
		if isnull(ls_tipo_dte) then ls_tipo_dte=''
		if isnull(ls_folio) then ls_folio=''
		if isnull(ls_est_doc) then ls_est_doc=''
		if isnull(ls_tasa_iva) then ls_tasa_iva=''
		if isnull(ls_fec_pago) then ls_fec_pago=''
		if isnull(ls_rut) then ls_rut=''
		if isnull(ls_dv) then ls_dv=''
		if isnull(ls_nombre) then ls_nombre=''
		if isnull(ls_afecto) then ls_afecto=''
		if isnull(ls_exento) then ls_exento=''
		if isnull(ls_iva) then ls_iva=''
		if isnull(ls_total) then ls_total=''
		if isnull(ls_caja) then ls_caja=''
		ll_largo		= len(ls_tipo_dte)
		if ll_largo > 3 then
			ls_tipo_dte	= mid(ls_tipo_dte,1,3)
		else
			ls_tipo_dte	= ls_tipo_dte+Space(3 - ll_largo)
		end if
		
		ll_largo		= len(ls_folio)
		if ll_largo > 10 then
			ls_folio	= mid(ls_folio,1,10)
		else
			ls_folio	= ls_folio+Space(10 - ll_largo)
		end if
		
		ll_largo		= len(ls_est_doc)
		if ll_largo > 1 then
			ls_est_doc	= mid(ls_est_doc,1,1)
		else
			ls_est_doc	= ls_est_doc+Space(1 - ll_largo)
		end if
		
		ll_largo		= len(ls_tasa_iva)
		if ll_largo > 2 then
			ls_tasa_iva	= mid(ls_tasa_iva,1,2)
		else
			ls_tasa_iva	= ls_tasa_iva+Space(2 - ll_largo)
		end if
		
		ll_largo		= len(ls_tasa_iva)
		if ll_largo > 2 then
			ls_tasa_iva	= mid(ls_tasa_iva,1,2)
		else
			ls_tasa_iva	= ls_tasa_iva+Space(2 - ll_largo)
		end if
		
		ls_rut			= ls_rut+'-'+ls_dv
		ll_largo		= len(ls_rut)
		if ll_largo > 11 then
			ls_rut		= mid(ls_rut,1,11)
		else
			ls_rut		= ls_rut+Space(11 - ll_largo)
		end if
		
		ll_largo		= len(ls_nombre)
		if ll_largo > 50 then
			ls_nombre	= mid(ls_nombre,1,50)
		else
			ls_nombre	= ls_nombre+Space(50 - ll_largo)
		end if
		
		ll_largo		= len(ls_afecto)
		if ll_largo > 18 then
			ls_afecto	= mid(ls_afecto,1,18)
		else
			ls_afecto	= ls_afecto+Space(18 - ll_largo)
		end if
		
		ll_largo		= len(ls_exento)
		if ll_largo > 18 then
			ls_exento	= mid(ls_exento,1,18)
		else
			ls_exento	= ls_exento+Space(18 - ll_largo)
		end if
		
		ll_largo		= len(ls_iva)
		if ll_largo > 18 then
			ls_iva	= mid(ls_iva,1,18)
		else
			ls_iva	= ls_iva+Space(18 - ll_largo)
		end if
		ll_largo		= len(ls_total)
		if ll_largo > 18 then
			ls_total	= mid(ls_total,1,18)
		else
			ls_total	= ls_total+Space(18 - ll_largo)
		end if
//		ls_linea		= ls_tipo_dte+'|'+ls_folio+'|'+ls_est_doc+'|'+ls_tasa_iva+'|'+ls_fec_pago+'|'+ls_rut+'|'+ls_nombre+'|'+ls_exento+'|'+ls_afecto+'|'+ls_iva+'|'+ls_total
		ll_new		= dwe_exportar_excel.insertrow(0)
		dwe_exportar_excel.setitem(ll_new,'tipo_libro','V')
		dwe_exportar_excel.setitem(ll_new,'tipo_documento',ls_tipo_dte)
		dwe_exportar_excel.setitem(ll_new,'nro_documento',Double(ls_folio))
		if ls_est_doc='A' then dwe_exportar_excel.setitem(ll_new,'anulado',ls_est_doc)
		dwe_exportar_excel.setitem(ll_new,'rut',ls_rut)
		dwe_exportar_excel.setitem(ll_new,'razon_social',ls_nombre)
		dwe_exportar_excel.setitem(ll_new,'fecha_documento',ldt_fec_pago)
		dwe_exportar_excel.setitem(ll_new,'monto_exento',long(ls_exento))
		dwe_exportar_excel.setitem(ll_new,'monto_neto',long(ls_afecto))
		dwe_exportar_excel.setitem(ll_new,'tasa_impuesto',double(ls_tasa_iva))
		dwe_exportar_excel.setitem(ll_new,'monto_iva',long(ls_iva))
		dwe_exportar_excel.setitem(ll_new,'monto_total',long(ls_total))
		dwe_exportar_excel.setitem(ll_new,'cod_caja',ls_caja)
	next	
	dwe_exportar_excel.accepttext()
	dw_paso	= dwe_exportar_excel
	SetPointer(Arrow!)
	if dwe_exportar_excel.rowcount() > 0 then f_DWToExcel( dw_paso )
else
	messagebox("Advertencia","No Registra Dato a Exportar")
end if
end event

type dwe_exportar_excel from datawindow within w_informe_libro_venta_sii_tipo_pago
boolean visible = false
integer x = 2761
integer y = 2288
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_libro_venta_excel"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_informe_libro_venta_sii_tipo_pago
integer x = 37
integer y = 216
integer width = 3904
integer height = 92
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 12639424
string text = " Detalle Libro Venta"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_informe_libro_venta_sii_tipo_pago
integer x = 2816
integer y = 32
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;String	ls_mes,ls_anno,ls_fecha,ls_rut_emp

dw_lista.reset()
ls_rut_emp	= dw_empresa.getitemstring(1,'rut_empresa')
ls_mes		= mid(ddlb_mes.text,1,2)
ls_anno		= trim(em_year.text)
ls_fecha		= ls_mes+'/'+ls_anno
if not isnull(ls_mes) and not isnull(ls_anno) then
	if dw_lista.retrieve(ls_fecha,ls_rut_emp,is_opcion)=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
else
	if isnull(ls_mes) then
		messagebox("Advertencia","Debe Seleccionar Mes")
		ddlb_mes.setfocus()
	elseif isnull(ls_anno) then
		messagebox("Advertencia","Debe Seleccionar Año")
		em_year.setfocus()
	end if
end if

end event

type em_year from editmask within w_informe_libro_venta_sii_tipo_pago
integer x = 2363
integer y = 56
integer width = 384
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_libro_venta_sii_tipo_pago
integer x = 2185
integer y = 72
integer width = 146
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_mes from dropdownlistbox within w_informe_libro_venta_sii_tipo_pago
integer x = 1518
integer y = 56
integer width = 626
integer height = 1080
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
string item[] = {"01 - Enero","02 - Febrero","03 - Marzo","04 - Abril","05 - Mayo","06 - Junio","07 - Julio","08 - Agosto","09 - Septiembre","10 - Octubre","11 - noviembre","12 - Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_1 from statictext within w_informe_libro_venta_sii_tipo_pago
integer x = 974
integer y = 72
integer width = 539
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Periodo"
boolean focusrectangle = false
end type

type dwe_exportar from datawindow within w_informe_libro_venta_sii_tipo_pago
boolean visible = false
integer x = 2066
integer y = 2436
integer width = 571
integer height = 600
string title = "none"
string dataobject = "dwe_exportar_libro_venta_sii"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 1778
integer y = 2272
integer width = 219
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )		//f_printdlg(dw_lista,gstr_print,w_informe_libro_venta_sii_tipo_pago)
end event

type cb_filtrar from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 302
integer y = 2272
integer width = 197
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_expor from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 786
integer y = 2272
integer width = 453
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar TXT S.I.I."
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_new,ll_largo
String		ls_tipo_dte,ls_est_doc,ls_tasa_iva,ls_dv,ls_nombre,ls_folio,ls_rut,ls_afecto,ls_exento,ls_iva,ls_total,ls_fec_pago,ls_linea
datawindow dw_paso
	
dwe_exportar.reset()
ll_tot_reg			= dw_lista.rowcount()
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	for ll_indi=1 to ll_tot_reg
		ls_tipo_dte	= dw_lista.getitemstring(ll_indi,'electronica_fb_tipo_tipo_dte')
		ls_folio		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_numero_documento'))
		ls_est_doc	= dw_lista.getitemstring(ll_indi,'estado_documento')
		if ls_est_doc <> 'A' then  ls_est_doc = ''
		ls_tasa_iva	= String(dw_lista.getitemnumber(ll_indi,'tasa_iva'))
		ls_fec_pago	= String(dw_lista.getitemdatetime(ll_indi,'vista_listado_ingreso_sii_fecha_pago'),'yyyy-mm-dd')
		ls_rut			= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_rut'))
		ls_dv			= dw_lista.getitemstring(ll_indi,'vista_listado_ingreso_sii_dv')
		ls_nombre	= dw_lista.getitemstring(ll_indi,'nombre_cliente')
		ls_afecto		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_afecto'))
		ls_exento	= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_exento'))
		ls_iva			= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_iva'))
		ls_total		= String(dw_lista.getitemnumber(ll_indi,'vista_listado_ingreso_sii_sum_total'))
		if isnull(ls_tipo_dte) then ls_tipo_dte=''
		if isnull(ls_folio) then ls_folio='0'
		if isnull(ls_est_doc) then ls_est_doc=''
		if isnull(ls_tasa_iva) then ls_tasa_iva='0'
		if isnull(ls_fec_pago) then ls_fec_pago=''
		if isnull(ls_rut) then ls_rut=''
		if isnull(ls_dv) then ls_dv=''
		if isnull(ls_nombre) then ls_nombre=''
		if isnull(ls_afecto) then ls_afecto='0'
		if isnull(ls_exento) then ls_exento='0'
		if isnull(ls_iva) then ls_iva='0'
		if isnull(ls_total) then ls_total='0'
		
		ll_largo		= len(ls_tipo_dte)
		if ll_largo > 3 then
			ls_tipo_dte	= mid(ls_tipo_dte,1,3)
		else
			ls_tipo_dte	= ls_tipo_dte+Space(3 - ll_largo)
		end if
		
		ll_largo		= len(ls_folio)
		if ll_largo > 10 then
			ls_folio	= mid(ls_folio,1,10)
		else
			ls_folio	= ls_folio+Space(10 - ll_largo)
		end if
		
		ll_largo		= len(ls_est_doc)
		if ll_largo > 1 then
			ls_est_doc	= mid(ls_est_doc,1,1)
		else
			ls_est_doc	= ls_est_doc+Space(1 - ll_largo)
		end if
		
		ll_largo		= len(ls_tasa_iva)
		if ll_largo > 2 then
			ls_tasa_iva	= mid(ls_tasa_iva,1,2)
		else
			ls_tasa_iva	= ls_tasa_iva+Space(2 - ll_largo)
		end if
		
		ll_largo		= len(ls_tasa_iva)
		if ll_largo > 2 then
			ls_tasa_iva	= mid(ls_tasa_iva,1,2)
		else
			ls_tasa_iva	= ls_tasa_iva+Space(2 - ll_largo)
		end if
		
		ls_rut			= ls_rut+'-'+ls_dv
		ll_largo		= len(ls_rut)
		if ll_largo > 11 then
			ls_rut		= mid(ls_rut,1,11)
		else
			ls_rut		= ls_rut+Space(11 - ll_largo)
		end if
		
		ll_largo		= len(ls_nombre)
		if ll_largo > 50 then
			ls_nombre	= mid(ls_nombre,1,50)
		else
			ls_nombre	= ls_nombre+Space(50 - ll_largo)
		end if
		
		ll_largo		= len(ls_afecto)
		if ll_largo > 18 then
			ls_afecto	= mid(ls_afecto,1,18)
		else
			ls_afecto	= ls_afecto+Space(18 - ll_largo)
		end if
		
		ll_largo		= len(ls_exento)
		if ll_largo > 18 then
			ls_exento	= mid(ls_exento,1,18)
		else
			ls_exento	= ls_exento+Space(18 - ll_largo)
		end if
		
		ll_largo		= len(ls_iva)
		if ll_largo > 18 then
			ls_iva	= mid(ls_iva,1,18)
		else
			ls_iva	= ls_iva+Space(18 - ll_largo)
		end if
		ll_largo		= len(ls_total)
		if ll_largo > 18 then
			ls_total	= mid(ls_total,1,18)
		else
			ls_total	= ls_total+Space(18 - ll_largo)
		end if
		ls_linea		= ls_tipo_dte+'|'+ls_folio+'|'+ls_est_doc+'|'+ls_tasa_iva+'|'+ls_fec_pago+'|'+ls_rut+'|'+ls_nombre+'|'+ls_exento+'|'+ls_afecto+'|'+ls_iva+'|'+ls_total
		ll_new		= dwe_exportar.insertrow(0)
		dwe_exportar.setitem(ll_new,'linea',ls_linea)
	next	
	dwe_exportar.accepttext()
	dw_paso	= dwe_exportar
	SetPointer(Arrow!)
	if dwe_exportar.rowcount() > 0 then f_DWToExcel( dw_paso )
//	w_exportar.setfocus()
else
	messagebox("Advertencia","No Registra Dato a Exportar")
end if
end event

type cb_ordenar from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 59
integer y = 2272
integer width = 238
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.sort()
end if
end event

type cb_cerrar from commandbutton within w_informe_libro_venta_sii_tipo_pago
integer x = 3634
integer y = 2272
integer width = 306
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_libro_venta_sii_tipo_pago)
end event

type dw_lista from datawindow within w_informe_libro_venta_sii_tipo_pago
integer x = 37
integer y = 308
integer width = 3904
integer height = 1908
integer taborder = 50
string title = "Detalle Facturas"
string dataobject = "dw_libro_venta_group_sii_tp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;Long	ll_fila

if getrow() > 0 then
	ll_fila			= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	gs_base		= this.getitemstring(ll_fila,'vista_listado_ingreso_sii_base')
	gs_serie		= this.getitemstring(ll_fila,'vista_listado_ingreso_sii_serie')
	gi_numero	= this.getitemnumber(ll_fila,'vista_listado_ingreso_sii_numero')
	gi_rut			= this.getitemnumber(ll_fila,'vista_listado_ingreso_sii_rut')
end if
end event

event clicked;Long	ll_fila

if row > 0 then
	ll_fila			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	gs_base		= this.getitemstring(ll_fila,'vista_listado_ingreso_sii_base')
	gs_serie		= this.getitemstring(ll_fila,'vista_listado_ingreso_sii_serie')
	gi_numero	= this.getitemnumber(ll_fila,'vista_listado_ingreso_sii_numero')
	gi_rut			= this.getitemnumber(ll_fila,'vista_listado_ingreso_sii_rut')
end if
end event

type gb_11 from groupbox within w_informe_libro_venta_sii_tipo_pago
integer x = 37
integer y = 2216
integer width = 1984
integer height = 180
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554431
long backcolor = 81324524
end type

