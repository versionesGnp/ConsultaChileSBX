forward
global type w_lista_beneficiario_seguro_complementar from window
end type
type cb_filtrar from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type cb_sort from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type cb_exportar from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type cb_imprimir from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type cb_cta_cte from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type pb_ok from picturebutton within w_lista_beneficiario_seguro_complementar
end type
type p_fin from picture within w_lista_beneficiario_seguro_complementar
end type
type em_fec_fin from editmask within w_lista_beneficiario_seguro_complementar
end type
type st_3 from statictext within w_lista_beneficiario_seguro_complementar
end type
type p_ini from picture within w_lista_beneficiario_seguro_complementar
end type
type em_fec_ini from editmask within w_lista_beneficiario_seguro_complementar
end type
type st_2 from statictext within w_lista_beneficiario_seguro_complementar
end type
type cb_cerrar from commandbutton within w_lista_beneficiario_seguro_complementar
end type
type dw_lista from datawindow within w_lista_beneficiario_seguro_complementar
end type
type gb_1 from groupbox within w_lista_beneficiario_seguro_complementar
end type
end forward

global type w_lista_beneficiario_seguro_complementar from window
integer width = 3365
integer height = 2044
boolean titlebar = true
string title = "Beneficiario Seguro Complementario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_beneficiario_seguro_complementar w_lista_beneficiario_seguro_complementar

type variables
Long	il_row
end variables

on w_lista_beneficiario_seguro_complementar.create
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_beneficiario_seguro_complementar.destroy
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Date	ld_fec_ini,ld_fec_fin
gf_centrar(w_lista_beneficiario_seguro_complementar)
em_fec_ini.text	= string(today())
em_fec_fin.text	= string(today())
ld_fec_ini			= date(em_fec_ini.text)
ld_fec_fin			= date(em_fec_fin.text)
dw_lista.settransobject(sqlca)
dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end event

type cb_filtrar from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 1879
integer y = 1824
integer width = 224
integer height = 88
integer taborder = 90
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

type cb_sort from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 1650
integer y = 1824
integer width = 224
integer height = 88
integer taborder = 80
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

type cb_exportar from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 1422
integer y = 1824
integer width = 224
integer height = 88
integer taborder = 70
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

type cb_imprimir from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 1143
integer y = 1824
integer width = 219
integer height = 88
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
	dw_lista.object.datawindow.zoom = 72
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom = 100
end if

end event

type cb_cta_cte from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 41
integer y = 1820
integer width = 448
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'beneficiarios_seguro_numero')
	gs_base		= dw_lista.getitemstring(il_row,'beneficiarios_seguro_base')
	gs_serie		= dw_lista.getitemstring(il_row,'beneficiarios_seguro_serie')
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
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type pb_ok from picturebutton within w_lista_beneficiario_seguro_complementar
integer x = 1792
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

event clicked;String	ls_descrip, ls_base, ls_serie, ls_tipo_sol, ls_mod_cliente, ls_usu_ope, ls_usu_inf,&
			ls_filtro,ls_estado_reg
long		ll_tot_reg, ll_indi,  ll_corr, ll_rut, ll_est_ope, ll_est_inf,ll_tot_porc_aux,ll_tot_porc,ll_est_mod
Datetime	ld_fec_ope, ld_fec_inf,ldt_fec_max,ldt_fecha_crea
Date		ld_fec_ini,ld_fec_fin
Double	ll_numero
SetPointer(HourGlass!)
ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
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
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then messagebox("Advertencia","No Registra Beneficiario en Rango de Fecha Indicada")
		end if
	end if
end if
SetPointer(Arrow!)
end event

type p_fin from picture within w_lista_beneficiario_seguro_complementar
integer x = 1591
integer y = 52
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

type em_fec_fin from editmask within w_lista_beneficiario_seguro_complementar
integer x = 1230
integer y = 52
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

type st_3 from statictext within w_lista_beneficiario_seguro_complementar
integer x = 1038
integer y = 68
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

type p_ini from picture within w_lista_beneficiario_seguro_complementar
integer x = 923
integer y = 52
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

type em_fec_ini from editmask within w_lista_beneficiario_seguro_complementar
integer x = 562
integer y = 52
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

type st_2 from statictext within w_lista_beneficiario_seguro_complementar
integer x = 41
integer y = 68
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

type cb_cerrar from commandbutton within w_lista_beneficiario_seguro_complementar
integer x = 2994
integer y = 1820
integer width = 311
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_beneficiario_seguro_complementar)
end event

type dw_lista from datawindow within w_lista_beneficiario_seguro_complementar
integer x = 37
integer y = 196
integer width = 3269
integer height = 1568
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_beneficiario_seg_comp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
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

type gb_1 from groupbox within w_lista_beneficiario_seguro_complementar
integer x = 1115
integer y = 1772
integer width = 1019
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

