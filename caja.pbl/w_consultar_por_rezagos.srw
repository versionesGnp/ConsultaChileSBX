forward
global type w_consultar_por_rezagos from window
end type
type cb_ctacte from commandbutton within w_consultar_por_rezagos
end type
type cb_limpiar from commandbutton within w_consultar_por_rezagos
end type
type cb_filtrar from commandbutton within w_consultar_por_rezagos
end type
type cb_sort from commandbutton within w_consultar_por_rezagos
end type
type cb_exportar from commandbutton within w_consultar_por_rezagos
end type
type cb_imprimir from commandbutton within w_consultar_por_rezagos
end type
type cb_cerrar from commandbutton within w_consultar_por_rezagos
end type
type st_4 from statictext within w_consultar_por_rezagos
end type
type p_fin from picture within w_consultar_por_rezagos
end type
type em_fec_fin from editmask within w_consultar_por_rezagos
end type
type st_3 from statictext within w_consultar_por_rezagos
end type
type p_ini from picture within w_consultar_por_rezagos
end type
type em_fec_ini from editmask within w_consultar_por_rezagos
end type
type rb_comprobante from radiobutton within w_consultar_por_rezagos
end type
type rb_contrato from radiobutton within w_consultar_por_rezagos
end type
type ddlb_tipo_cob from dropdownlistbox within w_consultar_por_rezagos
end type
type st_1 from statictext within w_consultar_por_rezagos
end type
type ddlb_base from dropdownlistbox within w_consultar_por_rezagos
end type
type st_2 from statictext within w_consultar_por_rezagos
end type
type pb_procesar from picturebutton within w_consultar_por_rezagos
end type
type dw_lista from datawindow within w_consultar_por_rezagos
end type
type gb_1 from groupbox within w_consultar_por_rezagos
end type
type gb_2 from groupbox within w_consultar_por_rezagos
end type
type gb_3 from groupbox within w_consultar_por_rezagos
end type
type gb_4 from groupbox within w_consultar_por_rezagos
end type
end forward

global type w_consultar_por_rezagos from window
integer width = 2569
integer height = 1848
boolean titlebar = true
string title = "Consultar Rezagos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
st_4 st_4
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
rb_comprobante rb_comprobante
rb_contrato rb_contrato
ddlb_tipo_cob ddlb_tipo_cob
st_1 st_1
ddlb_base ddlb_base
st_2 st_2
pb_procesar pb_procesar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_consultar_por_rezagos w_consultar_por_rezagos

type variables
string	is_opcion
end variables

on w_consultar_por_rezagos.create
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.st_4=create st_4
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.rb_comprobante=create rb_comprobante
this.rb_contrato=create rb_contrato
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.st_1=create st_1
this.ddlb_base=create ddlb_base
this.st_2=create st_2
this.pb_procesar=create pb_procesar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_ctacte,&
this.cb_limpiar,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.st_4,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.rb_comprobante,&
this.rb_contrato,&
this.ddlb_tipo_cob,&
this.st_1,&
this.ddlb_base,&
this.st_2,&
this.pb_procesar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_consultar_por_rezagos.destroy
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.st_4)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.rb_comprobante)
destroy(this.rb_contrato)
destroy(this.ddlb_tipo_cob)
destroy(this.st_1)
destroy(this.ddlb_base)
destroy(this.st_2)
destroy(this.pb_procesar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;String	ls_base
gf_centrar(w_consultar_por_rezagos)
dw_lista.settransobject(sqlca)
cb_limpiar.triggerevent(clicked!)
end event

type cb_ctacte from commandbutton within w_consultar_por_rezagos
integer x = 1509
integer y = 1604
integer width = 430
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato o No tiene Contrato Asociado")
	END IF
end if
end event

type cb_limpiar from commandbutton within w_consultar_por_rezagos
integer x = 1106
integer y = 1604
integer width = 274
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;ddlb_base.reset()
ddlb_base.enabled			= false
ddlb_tipo_cob.reset()
ddlb_tipo_cob.enabled	= false
dw_lista.reset()
rb_contrato.checked		= false
rb_comprobante.checked	= false
em_fec_ini.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
em_fec_fin.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
end event

type cb_filtrar from commandbutton within w_consultar_por_rezagos
integer x = 741
integer y = 1604
integer width = 224
integer height = 100
integer taborder = 100
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

type cb_sort from commandbutton within w_consultar_por_rezagos
integer x = 512
integer y = 1604
integer width = 224
integer height = 100
integer taborder = 90
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

type cb_exportar from commandbutton within w_consultar_por_rezagos
integer x = 283
integer y = 1604
integer width = 224
integer height = 100
integer taborder = 80
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

type cb_imprimir from commandbutton within w_consultar_por_rezagos
integer x = 32
integer y = 1604
integer width = 219
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_printdlg(dw_lista,gstr_print,w_consultar_por_rezagos)

end event

type cb_cerrar from commandbutton within w_consultar_por_rezagos
integer x = 2139
integer y = 1604
integer width = 352
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_por_rezagos)
end event

type st_4 from statictext within w_consultar_por_rezagos
integer x = 1257
integer y = 364
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_fin from picture within w_consultar_por_rezagos
integer x = 2368
integer y = 348
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

type em_fec_fin from editmask within w_consultar_por_rezagos
integer x = 2025
integer y = 348
integer width = 338
integer height = 88
integer taborder = 40
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

type st_3 from statictext within w_consultar_por_rezagos
integer x = 1870
integer y = 364
integer width = 151
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_ini from picture within w_consultar_por_rezagos
integer x = 1783
integer y = 348
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

type em_fec_ini from editmask within w_consultar_por_rezagos
integer x = 1440
integer y = 348
integer width = 338
integer height = 88
integer taborder = 30
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

type rb_comprobante from radiobutton within w_consultar_por_rezagos
integer x = 1038
integer y = 116
integer width = 978
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Tipo COMPROBANTE"
end type

event clicked;String	ls_tipo_cob
if this.checked=true then
	ddlb_base.reset()
	ddlb_tipo_cob.reset()
	ddlb_base.enabled			= false
	ddlb_tipo_cob.enabled	= true
	dw_lista.dataobject		= 'dw_consultar_cliente_rezago_comprobante'
	dw_lista.settransobject(sqlca)
	ddlb_tipo_cob.reset()
	DECLARE	x2 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO"  
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x2 into :ls_tipo_cob;
			if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
				ddlb_tipo_cob.additem(ls_tipo_cob)
			end if
			setnull(ls_tipo_cob)
		LOOP
	end if
	close x2;
	ddlb_tipo_cob.setfocus()
end if
end event

type rb_contrato from radiobutton within w_consultar_por_rezagos
integer x = 91
integer y = 116
integer width = 855
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Tipo CONTRATO"
end type

event clicked;String	ls_base,ls_tipo_cob
if this.checked=true then
	ddlb_base.reset()
	ddlb_base.enabled			= true
	dw_lista.dataobject		= 'dw_consultar_cliente_rezago'
	dw_lista.settransobject(sqlca)
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TIPO_CONTRATO"."CODIGO"  
	FROM 		"TIPO_CONTRATO"  
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :ls_base;
			if not isnull(ls_base) and ls_base<>'' then
				ddlb_base.additem(ls_base)
			end if
			setnull(ls_base)
		LOOP
	end if
	close x1;
	ddlb_tipo_cob.reset()
	ddlb_tipo_cob.enabled	= false
	ddlb_base.setfocus()
end if
end event

type ddlb_tipo_cob from dropdownlistbox within w_consultar_por_rezagos
integer x = 859
integer y = 348
integer width = 325
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()

end event

type st_1 from statictext within w_consultar_por_rezagos
integer x = 544
integer y = 360
integer width = 297
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Cobro"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_consultar_por_rezagos
integer x = 210
integer y = 348
integer width = 261
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_2 from statictext within w_consultar_por_rezagos
integer x = 64
integer y = 360
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_procesar from picturebutton within w_consultar_por_rezagos
integer x = 2286
integer y = 76
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Date ld_fecha_ini, ld_fecha_fin
String	ls_base,ls_tipo_cob
ld_fecha_ini	= date(em_fec_ini.text)
ld_fecha_fin	= date(em_fec_fin.text)
if rb_contrato.checked=true or rb_comprobante.checked=true then
	if ld_fecha_fin < ld_fecha_ini then
		messagebox("Advertencia","Rangi de Fecha Inválida")
		em_fec_ini.setfocus()
	else
		if rb_contrato.checked=true then
			ls_base		= trim(ddlb_base.text)
			if isnull(ls_base) or ls_base='' then
				messagebox("Advertencia","Debe Ingresar Base")
				ddlb_base.setfocus()
			else
				if dw_lista.retrieve(ls_base,ld_fecha_ini,ld_fecha_fin)=0 then
					messagebox("Advertencia","No registra dato")
				end if
			end if
		elseif rb_comprobante.checked=true then
			ls_tipo_cob	= trim(ddlb_tipo_cob.text)
			if isnull(ls_tipo_cob) or ls_tipo_cob='' then
				messagebox("Advertencia","Debe Ingresar Tipo Comprobante")
				ddlb_tipo_cob.setfocus()
			else
				if dw_lista.retrieve(ls_tipo_cob,ld_fecha_ini,ld_fecha_fin)=0 then
					messagebox("Advertencia","No registra dato")
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Opción")
end if
end event

type dw_lista from datawindow within w_consultar_por_rezagos
integer x = 32
integer y = 508
integer width = 2455
integer height = 1056
integer taborder = 60
string title = "none"
string dataobject = "dw_consultar_cliente_rezago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row>0 then cb_ctacte.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_consultar_por_rezagos
integer x = 32
integer y = 268
integer width = 475
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Base"
end type

type gb_2 from groupbox within w_consultar_por_rezagos
integer x = 530
integer y = 268
integer width = 686
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Tipo Comprobante"
end type

type gb_3 from groupbox within w_consultar_por_rezagos
integer x = 32
integer y = 20
integer width = 2459
integer height = 232
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

type gb_4 from groupbox within w_consultar_por_rezagos
integer x = 1239
integer y = 268
integer width = 1253
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rango Fecha"
end type

