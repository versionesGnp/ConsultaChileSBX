forward
global type w_buscar_beneficiarios_seguro from window
end type
type cb_4 from commandbutton within w_buscar_beneficiarios_seguro
end type
type rb_rut from radiobutton within w_buscar_beneficiarios_seguro
end type
type rb_contrato from radiobutton within w_buscar_beneficiarios_seguro
end type
type rb_parque from radiobutton within w_buscar_beneficiarios_seguro
end type
type pb_procesar from picturebutton within w_buscar_beneficiarios_seguro
end type
type em_rut from editmask within w_buscar_beneficiarios_seguro
end type
type ddlb_serie from dropdownlistbox within w_buscar_beneficiarios_seguro
end type
type cb_asocia_contrato from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_ver_cuenta_corriente from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_1 from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_2 from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_3 from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_imprimir from commandbutton within w_buscar_beneficiarios_seguro
end type
type cb_cerrar from commandbutton within w_buscar_beneficiarios_seguro
end type
type dw_lista from datawindow within w_buscar_beneficiarios_seguro
end type
type gb_1 from groupbox within w_buscar_beneficiarios_seguro
end type
type em_numero from editmask within w_buscar_beneficiarios_seguro
end type
type st_4 from statictext within w_buscar_beneficiarios_seguro
end type
type ddlb_base from dropdownlistbox within w_buscar_beneficiarios_seguro
end type
type st_2 from statictext within w_buscar_beneficiarios_seguro
end type
type gb_2 from groupbox within w_buscar_beneficiarios_seguro
end type
type st_3 from statictext within w_buscar_beneficiarios_seguro
end type
type dw_parque from datawindow within w_buscar_beneficiarios_seguro
end type
type gb_3 from groupbox within w_buscar_beneficiarios_seguro
end type
type st_16 from statictext within w_buscar_beneficiarios_seguro
end type
type gb_4 from groupbox within w_buscar_beneficiarios_seguro
end type
type gb_5 from groupbox within w_buscar_beneficiarios_seguro
end type
type st_1 from statictext within w_buscar_beneficiarios_seguro
end type
end forward

global type w_buscar_beneficiarios_seguro from window
integer width = 3433
integer height = 1932
boolean titlebar = true
string title = "Listado de Beneficiarios "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_4 cb_4
rb_rut rb_rut
rb_contrato rb_contrato
rb_parque rb_parque
pb_procesar pb_procesar
em_rut em_rut
ddlb_serie ddlb_serie
cb_asocia_contrato cb_asocia_contrato
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
em_numero em_numero
st_4 st_4
ddlb_base ddlb_base
st_2 st_2
gb_2 gb_2
st_3 st_3
dw_parque dw_parque
gb_3 gb_3
st_16 st_16
gb_4 gb_4
gb_5 gb_5
st_1 st_1
end type
global w_buscar_beneficiarios_seguro w_buscar_beneficiarios_seguro

type variables
Long	il_row
end variables

event open;Long	ll_cod_parque
gf_centrar(w_buscar_beneficiarios_seguro)

dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_cod_parque)
dw_parque.accepttext()
rb_parque.checked	= true
rb_parque.triggerevent(clicked!)
end event

on w_buscar_beneficiarios_seguro.create
this.cb_4=create cb_4
this.rb_rut=create rb_rut
this.rb_contrato=create rb_contrato
this.rb_parque=create rb_parque
this.pb_procesar=create pb_procesar
this.em_rut=create em_rut
this.ddlb_serie=create ddlb_serie
this.cb_asocia_contrato=create cb_asocia_contrato
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.em_numero=create em_numero
this.st_4=create st_4
this.ddlb_base=create ddlb_base
this.st_2=create st_2
this.gb_2=create gb_2
this.st_3=create st_3
this.dw_parque=create dw_parque
this.gb_3=create gb_3
this.st_16=create st_16
this.gb_4=create gb_4
this.gb_5=create gb_5
this.st_1=create st_1
this.Control[]={this.cb_4,&
this.rb_rut,&
this.rb_contrato,&
this.rb_parque,&
this.pb_procesar,&
this.em_rut,&
this.ddlb_serie,&
this.cb_asocia_contrato,&
this.cb_ver_cuenta_corriente,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.em_numero,&
this.st_4,&
this.ddlb_base,&
this.st_2,&
this.gb_2,&
this.st_3,&
this.dw_parque,&
this.gb_3,&
this.st_16,&
this.gb_4,&
this.gb_5,&
this.st_1}
end on

on w_buscar_beneficiarios_seguro.destroy
destroy(this.cb_4)
destroy(this.rb_rut)
destroy(this.rb_contrato)
destroy(this.rb_parque)
destroy(this.pb_procesar)
destroy(this.em_rut)
destroy(this.ddlb_serie)
destroy(this.cb_asocia_contrato)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.em_numero)
destroy(this.st_4)
destroy(this.ddlb_base)
destroy(this.st_2)
destroy(this.gb_2)
destroy(this.st_3)
destroy(this.dw_parque)
destroy(this.gb_3)
destroy(this.st_16)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.st_1)
end on

type cb_4 from commandbutton within w_buscar_beneficiarios_seguro
integer x = 1915
integer y = 1692
integer width = 503
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar x &Rut Titular"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "cadena_codigo")
	gs_serie 								= dw_lista.GetItemString(il_row, "cadena_serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "cadena_numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "cliente_rut")
	gs_apellido_paterno					= dw_lista.GetItemString(il_row, "cliente_a_paterno")
	gs_apellido_materno					= dw_lista.GetItemString(il_row, "cliente_a_materno")
	gs_nombres								= dw_lista.GetItemString(il_row, "cliente_nombre")
	gs_dv										= dw_lista.GetItemString(il_row, "cliente_dv")
	gs_estado								= dw_lista.GetItemString(il_row, "cadena_estado")
	gl_cod_parque_cta						= dw_lista.GetItemNumber(il_row, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
		gi_tipo_busqueda 					= 1
		if il_row > 0 then 
			gs_base_aux						= gs_base
			gs_serie_aux					= gs_serie
			gl_numero_aux					= gi_numero
			if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
			open(w_listado_contratos_rut)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type rb_rut from radiobutton within w_buscar_beneficiarios_seguro
integer x = 2496
integer y = 108
integer width = 622
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Por Rut Titular"
end type

event clicked;if rb_rut.checked=true then
	dw_lista.dataobject	= 'dw_listado_beneficiarios_seguro_rut_clie'
	dw_lista.settransobject(sqlca)
	dw_parque.enabled		= false
	dw_parque.reset()
	dw_parque.insertrow(0)
	ddlb_base.reset()
	ddlb_serie.reset()
	em_numero.text			= ''
	em_rut.text				= ''
	ddlb_base.enabled		= false
	ddlb_serie.enabled	= false
	em_numero.enabled		= false
	em_rut.enabled			= true
	em_rut.setfocus()
end if
end event

type rb_contrato from radiobutton within w_buscar_beneficiarios_seguro
integer x = 1353
integer y = 112
integer width = 571
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Por Contrato"
end type

event clicked;if rb_contrato.checked=true then
	dw_lista.dataobject	= 'dw_listado_beneficiarios_seguro_contrato'
	dw_lista.settransobject(sqlca)
	String	ls_base
	dw_parque.enabled		= false
	dw_parque.reset()
	dw_parque.insertrow(0)
	ddlb_base.reset()
	ddlb_serie.reset()
	em_numero.text			= ''
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
		ddlb_serie.reset()
		em_numero.text		= ''
	end if
	close x1;	
	em_rut.text				= ''
	ddlb_base.enabled		= true
	ddlb_serie.enabled	= true
	em_numero.enabled		= true
	em_rut.enabled			= false
	ddlb_base.setfocus()
end if






end event

type rb_parque from radiobutton within w_buscar_beneficiarios_seguro
integer x = 187
integer y = 108
integer width = 553
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Por Parque"
end type

event clicked;if rb_parque.checked=true then
	dw_lista.dataobject	= 'dw_listado_beneficiarios_seguro_parque'
	dw_lista.settransobject(sqlca)
	Long	ll_cod_parque
	dw_parque.enabled		= true
	dw_parque.reset()
	dw_parque.insertrow(0)
	if gs_conexion	= "Parque El Prado" then
		ll_cod_parque		= 1
	elseif gs_conexion = "Parque La Foresta" then
		ll_cod_parque		= 11
	elseif gs_conexion = "Parque Concepción" then
		ll_cod_parque		= 801
	end if
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
	dw_parque.accepttext()
	ddlb_base.reset()
	ddlb_serie.reset()
	em_numero.text			= ''
	em_rut.text				= ''
	ddlb_base.enabled		= false
	ddlb_serie.enabled	= false
	em_numero.enabled		= false
	em_rut.enabled			= false
	dw_parque.setfocus()
end if
end event

type pb_procesar from picturebutton within w_buscar_beneficiarios_seguro
integer x = 3200
integer y = 280
integer width = 178
integer height = 156
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean originalsize = true
string picturename = "ok.bmp"
end type

event clicked;Long		ll_cod_parque,ll_rut
String		ls_base,ls_serie
Double	ll_numero
if rb_parque.checked=true then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	if ll_cod_parque>0 then
		if dw_lista.retrieve(ll_cod_parque)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
	
elseif rb_contrato.checked=true then
	ls_base			= trim(ddlb_base.text)
	ls_serie			= trim(ddlb_serie.text)
	ll_numero		= Double(trim(em_numero.text))
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 and ls_base<>'' and ls_serie<>'' then
		if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		if isnull(ls_base) or ls_base='' then
			messagebox("Advertencia","Debe Ingresar Base del Contrato")
			ddlb_base.setfocus()
		elseif isnull(ls_serie) or ls_serie='' then
			messagebox("Advertencia","Debe Ingresar Serie del Contrato")
			ddlb_serie.setfocus()
		elseif isnull(ll_numero) or ll_numero=0 then
			messagebox("Advertencia","Debe Ingresar Número del Contrato")
			em_numero.setfocus()
		end if
	end if
	
elseif rb_rut.checked=true then
	ll_rut		= long(trim(em_rut.text))
	if ll_rut>0 then
		if dw_lista.retrieve(ll_rut)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		if isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Debe Ingresar Rut del Titular")
			em_rut.setfocus()
		end if
	end if
end if
end event

type em_rut from editmask within w_buscar_beneficiarios_seguro
integer x = 2688
integer y = 320
integer width = 393
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_procesar.triggerevent(clicked!)
end event

type ddlb_serie from dropdownlistbox within w_buscar_beneficiarios_seguro
integer x = 1499
integer y = 320
integer width = 229
integer height = 400
integer taborder = 30
boolean bringtotop = true
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

event selectionchanged;String	ls_filtro
ls_filtro		= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.reset()

end event

type cb_asocia_contrato from commandbutton within w_buscar_beneficiarios_seguro
integer x = 1518
integer y = 1692
integer width = 384
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Ctto"
end type

event clicked;if dw_lista.rowcount()>0 and il_row>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "cadena_codigo")
	gs_serie 								= dw_lista.GetItemString(il_row, "cadena_serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "cadena_numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "cliente_rut")
	gs_apellido_paterno					= dw_lista.GetItemString(il_row, "cliente_a_paterno")
	gs_apellido_materno					= dw_lista.GetItemString(il_row, "cliente_a_materno")
	gs_nombres								= dw_lista.GetItemString(il_row, "cliente_nombre")
	gs_dv										= dw_lista.GetItemString(il_row, "cliente_dv")
	gs_estado								= dw_lista.GetItemString(il_row, "cadena_estado")
	gl_cod_parque_cta						= dw_lista.GetItemNumber(il_row, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		if il_row > 0 then 
			if isvalid(w_listado_contratos_por_todas_las_tablas) then close(w_listado_contratos_por_todas_las_tablas)
			open(w_listado_contratos_por_todas_las_tablas)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type cb_ver_cuenta_corriente from commandbutton within w_buscar_beneficiarios_seguro
integer x = 1065
integer y = 1692
integer width = 439
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 and il_row>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "cadena_codigo")
	gs_serie 								= dw_lista.GetItemString(il_row, "cadena_serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "cadena_numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "cliente_rut")
	gs_apellido_paterno					= dw_lista.GetItemString(il_row, "cliente_a_paterno")
	gs_apellido_materno					= dw_lista.GetItemString(il_row, "cliente_a_materno")
	gs_nombres								= dw_lista.GetItemString(il_row, "cliente_nombre")
	gs_dv										= dw_lista.GetItemString(il_row, "cliente_dv")
	gs_estado								= dw_lista.GetItemString(il_row, "cadena_estado")
	gl_cod_parque_cta						= dw_lista.GetItemNumber(il_row, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O","U","M" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type cb_1 from commandbutton within w_buscar_beneficiarios_seguro
integer x = 105
integer y = 1692
integer width = 219
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_buscar_beneficiarios_seguro
integer x = 553
integer y = 1692
integer width = 219
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_buscar_beneficiarios_seguro
integer x = 329
integer y = 1692
integer width = 219
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_buscar_beneficiarios_seguro
integer x = 777
integer y = 1692
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

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_buscar_beneficiarios_seguro
integer x = 3026
integer y = 1692
integer width = 347
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_beneficiarios_seguro)
end event

type dw_lista from datawindow within w_buscar_beneficiarios_seguro
integer x = 50
integer y = 472
integer width = 3323
integer height = 1152
integer taborder = 70
string dataobject = "dw_listado_beneficiarios_seguro_rut_clie"
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_ver_cuenta_corriente.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_beneficiarios_seguro
integer x = 55
integer y = 1628
integer width = 983
integer height = 188
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

type em_numero from editmask within w_buscar_beneficiarios_seguro
integer x = 1947
integer y = 320
integer width = 347
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;String		ls_base,ls_serie,ls_filtro
Double	ll_numero

ls_base				= trim(ddlb_base.text)
ls_serie				= trim(ddlb_serie.text)
ll_numero			= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	ls_filtro		= ''
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.reset()
	pb_procesar.triggerevent(clicked!)
end if

end event

type st_4 from statictext within w_buscar_beneficiarios_seguro
integer x = 1746
integer y = 340
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_buscar_beneficiarios_seguro
integer x = 1111
integer y = 320
integer width = 229
integer height = 396
integer taborder = 20
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

event selectionchanged;String	ls_base,ls_serie,ls_filtro
ls_base	= trim(ddlb_base.text)
if not isnull(ls_base) and ls_base<>'' then
	ls_filtro		= ''
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.reset()
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TABLA_SERIES"."SERIE"  
	FROM 		"TABLA_SERIES"  
	WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ddlb_serie.reset()
		DO WHILE sqlca.sqlcode=0 
			fetch x1 into :ls_serie;
			if not isnull(ls_serie) and ls_serie<>'' then
				ddlb_serie.additem(ls_serie)
			end if
			setnull(ls_serie)
		LOOP
	end if
	close x1;
end if
end event

type st_2 from statictext within w_buscar_beneficiarios_seguro
integer x = 965
integer y = 340
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
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

type gb_2 from groupbox within w_buscar_beneficiarios_seguro
integer x = 946
integer y = 240
integer width = 1390
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Contrato"
end type

type st_3 from statictext within w_buscar_beneficiarios_seguro
integer x = 1353
integer y = 340
integer width = 133
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_buscar_beneficiarios_seguro
integer x = 256
integer y = 316
integer width = 594
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_filtro
ls_filtro		= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.reset()
if dw_parque.getitemnumber(1,'cod_parque')>0 then pb_procesar.triggerevent(clicked!)
end event

type gb_3 from groupbox within w_buscar_beneficiarios_seguro
integer x = 2409
integer y = 240
integer width = 713
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rut"
end type

type st_16 from statictext within w_buscar_beneficiarios_seguro
integer x = 69
integer y = 336
integer width = 169
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_buscar_beneficiarios_seguro
integer x = 50
integer y = 20
integer width = 3323
integer height = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Seleccione Opción de Busqueda"
end type

type gb_5 from groupbox within w_buscar_beneficiarios_seguro
integer x = 50
integer y = 240
integer width = 837
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Parque"
end type

type st_1 from statictext within w_buscar_beneficiarios_seguro
integer x = 2427
integer y = 344
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rur Titular"
alignment alignment = right!
boolean focusrectangle = false
end type

