forward
global type w_detalle_nota_de_credito from window
end type
type cb_imprimir2 from commandbutton within w_detalle_nota_de_credito
end type
type cb_ordenar2 from commandbutton within w_detalle_nota_de_credito
end type
type cb_filtrar2 from commandbutton within w_detalle_nota_de_credito
end type
type cb_filtrar from commandbutton within w_detalle_nota_de_credito
end type
type cb_ordenar from commandbutton within w_detalle_nota_de_credito
end type
type cb_imprimir from commandbutton within w_detalle_nota_de_credito
end type
type st_7 from statictext within w_detalle_nota_de_credito
end type
type cb_ctacte from commandbutton within w_detalle_nota_de_credito
end type
type st_6 from statictext within w_detalle_nota_de_credito
end type
type pb_procesar from picturebutton within w_detalle_nota_de_credito
end type
type em_folio from editmask within w_detalle_nota_de_credito
end type
type st_5 from statictext within w_detalle_nota_de_credito
end type
type ddlb_tipo_cob from dropdownlistbox within w_detalle_nota_de_credito
end type
type st_1 from statictext within w_detalle_nota_de_credito
end type
type em_numero from editmask within w_detalle_nota_de_credito
end type
type st_4 from statictext within w_detalle_nota_de_credito
end type
type ddlb_serie from dropdownlistbox within w_detalle_nota_de_credito
end type
type st_3 from statictext within w_detalle_nota_de_credito
end type
type ddlb_base from dropdownlistbox within w_detalle_nota_de_credito
end type
type st_2 from statictext within w_detalle_nota_de_credito
end type
type cb_1 from commandbutton within w_detalle_nota_de_credito
end type
type dw_lista from datawindow within w_detalle_nota_de_credito
end type
type gb_1 from groupbox within w_detalle_nota_de_credito
end type
type gb_2 from groupbox within w_detalle_nota_de_credito
end type
type dw_detalle from datawindow within w_detalle_nota_de_credito
end type
type p_1 from picture within w_detalle_nota_de_credito
end type
end forward

global type w_detalle_nota_de_credito from window
integer width = 2322
integer height = 2132
boolean titlebar = true
string title = "Detalle Nota de Crédito"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir2 cb_imprimir2
cb_ordenar2 cb_ordenar2
cb_filtrar2 cb_filtrar2
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
st_7 st_7
cb_ctacte cb_ctacte
st_6 st_6
pb_procesar pb_procesar
em_folio em_folio
st_5 st_5
ddlb_tipo_cob ddlb_tipo_cob
st_1 st_1
em_numero em_numero
st_4 st_4
ddlb_serie ddlb_serie
st_3 st_3
ddlb_base ddlb_base
st_2 st_2
cb_1 cb_1
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
dw_detalle dw_detalle
p_1 p_1
end type
global w_detalle_nota_de_credito w_detalle_nota_de_credito

type variables
string	is_opcion
end variables

on w_detalle_nota_de_credito.create
this.cb_imprimir2=create cb_imprimir2
this.cb_ordenar2=create cb_ordenar2
this.cb_filtrar2=create cb_filtrar2
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.st_7=create st_7
this.cb_ctacte=create cb_ctacte
this.st_6=create st_6
this.pb_procesar=create pb_procesar
this.em_folio=create em_folio
this.st_5=create st_5
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.st_1=create st_1
this.em_numero=create em_numero
this.st_4=create st_4
this.ddlb_serie=create ddlb_serie
this.st_3=create st_3
this.ddlb_base=create ddlb_base
this.st_2=create st_2
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_detalle=create dw_detalle
this.p_1=create p_1
this.Control[]={this.cb_imprimir2,&
this.cb_ordenar2,&
this.cb_filtrar2,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.st_7,&
this.cb_ctacte,&
this.st_6,&
this.pb_procesar,&
this.em_folio,&
this.st_5,&
this.ddlb_tipo_cob,&
this.st_1,&
this.em_numero,&
this.st_4,&
this.ddlb_serie,&
this.st_3,&
this.ddlb_base,&
this.st_2,&
this.cb_1,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.dw_detalle,&
this.p_1}
end on

on w_detalle_nota_de_credito.destroy
destroy(this.cb_imprimir2)
destroy(this.cb_ordenar2)
destroy(this.cb_filtrar2)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.st_7)
destroy(this.cb_ctacte)
destroy(this.st_6)
destroy(this.pb_procesar)
destroy(this.em_folio)
destroy(this.st_5)
destroy(this.ddlb_tipo_cob)
destroy(this.st_1)
destroy(this.em_numero)
destroy(this.st_4)
destroy(this.ddlb_serie)
destroy(this.st_3)
destroy(this.ddlb_base)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_detalle)
destroy(this.p_1)
end on

event open;String		ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
Double	ll_numero

gf_centrar(w_detalle_nota_de_credito)
p_1.visible						= false
is_opcion 						= substr(1,1,Message.StringParm)
if is_opcion='C' then //contrato
	gb_1.text	= 'Ingresar Contrato'
	this.title	= 'Consultar Nota de Crédito por Contrato'
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
		em_numero.text			= ''
	end if
	close x1;
	dw_lista.dataobject		= 'dw_detalle_nota_de_credito'
	st_2.visible				= true
	ddlb_base.visible			= true
	st_3.visible				= true
	ddlb_serie.visible		= true
	st_4.visible				= true
	em_numero.visible			= true
	st_1.visible				= false
	ddlb_tipo_cob.visible	= false
	st_5.visible				= false
	em_folio.visible			= false
	ddlb_base.setfocus()
elseif is_opcion='F' then //folio
	gb_1.text	= 'Ingresar Nº Folio'
	this.title	= 'Consultar Nota de Crédito por Nº de Folio'
	dw_lista.dataobject		= 'dw_detalle_nota_de_credito_folio'
	DECLARE	x2 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO"  
	WHERE		"COD_PAGO"."TIPO_COB"<>'NC' and "COD_PAGO"."TIPO_COB"<>'NB'
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
		em_folio.text			= ''
	end if
	close x2;
	st_2.visible				= false
	ddlb_base.visible			= false
	st_3.visible				= false
	ddlb_serie.visible		= false
	st_4.visible				= false
	em_numero.visible			= false
	st_1.visible				= true
	ddlb_tipo_cob.visible	= true
	st_5.visible				= true
	em_folio.visible			= true
	ddlb_tipo_cob.setfocus()
elseif is_opcion='N' then //Nota de credito
	this.title	= 'Consultar Nota de Crédito'
	gb_1.text	= 'Ingresar Nº Nota de Crédito'
	dw_lista.dataobject		= 'dw_detalle_nota_de_credito_nc'
	DECLARE	x3 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO"  
	WHERE		"COD_PAGO"."TIPO_COB"='NC' or "COD_PAGO"."TIPO_COB"='NB'
	USING		sqlca;
	open x3;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x3 into :ls_tipo_cob;
			if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
				ddlb_tipo_cob.additem(ls_tipo_cob)
			end if
			setnull(ls_tipo_cob)
		LOOP
		em_folio.text			= ''
	end if
	close x3;
	st_2.visible				= false
	ddlb_base.visible			= false
	st_3.visible				= false
	ddlb_serie.visible		= false
	st_4.visible				= false
	em_numero.visible			= false
	st_1.visible				= true
	ddlb_tipo_cob.visible	= true
	st_5.visible				= true
	em_folio.visible			= true
	ddlb_tipo_cob.setfocus()
end if
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
end event

type cb_imprimir2 from commandbutton within w_detalle_nota_de_credito
integer x = 567
integer y = 1920
integer width = 251
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	IF PrintSetup( ) <> -1 THEN dw_detalle.Print()
END IF

end event

type cb_ordenar2 from commandbutton within w_detalle_nota_de_credito
integer x = 311
integer y = 1920
integer width = 251
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETSORT(NULO)
dw_detalle.SORT()

end event

type cb_filtrar2 from commandbutton within w_detalle_nota_de_credito
integer x = 55
integer y = 1920
integer width = 251
integer height = 76
integer taborder = 120
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

type cb_filtrar from commandbutton within w_detalle_nota_de_credito
integer x = 1271
integer y = 956
integer width = 251
integer height = 76
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
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_ordenar from commandbutton within w_detalle_nota_de_credito
integer x = 1527
integer y = 956
integer width = 251
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_imprimir from commandbutton within w_detalle_nota_de_credito
integer x = 1783
integer y = 956
integer width = 251
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	IF PrintSetup( ) <> -1 THEN dw_lista.Print()
END IF

end event

type st_7 from statictext within w_detalle_nota_de_credito
integer x = 37
integer y = 980
integer width = 640
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
boolean focusrectangle = false
end type

type cb_ctacte from commandbutton within w_detalle_nota_de_credito
integer x = 1134
integer y = 1908
integer width = 430
integer height = 104
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.visible=true then
	if dw_lista.rowcount()>0 then
		gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
		gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
		gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'contrato')
		IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
			CHOOSE CASE gs_base
				CASE "O" // Oferta
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
			messagebox("Advertencia","Debe Seleccionar Contrato")
		END IF
	end if
else
	messagebox("Adveretencia","Debe Seleccionar Contrato en Lista de Detalle")
end if
end event

type st_6 from statictext within w_detalle_nota_de_credito
integer x = 37
integer y = 320
integer width = 640
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nota de Crédito"
boolean focusrectangle = false
end type

type pb_procesar from picturebutton within w_detalle_nota_de_credito
integer x = 1522
integer y = 88
integer width = 160
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
Double	ll_numero

if is_opcion='C' then
	ls_base		= trim(ddlb_base.text)
	ls_serie		= trim(ddlb_serie.text)
	ll_numero	= Double(em_numero.text)
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
		ls_serie<>'' and ll_numero>0 then
		if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
			messagebox("Advertencia","No Registra Dato")
			em_numero.setfocus()
		end if
	end if
elseif is_opcion='F' or is_opcion='N' then
	ls_tipo_cob	= trim(ddlb_tipo_cob.text)
	ll_folio		= long(em_folio.text)
	if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
		if dw_lista.retrieve(ls_tipo_cob,ll_folio)=0 then
			messagebox("Advertencia","No Registra Dato")
			em_folio.setfocus()
		end if
	end if
end if
end event

type em_folio from editmask within w_detalle_nota_de_credito
integer x = 987
integer y = 108
integer width = 416
integer height = 96
integer taborder = 50
integer textsize = -10
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

event modified;String	ls_tipo_cob
Long		ll_folio
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_folio.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	dw_lista.reset()
	pb_procesar.triggerevent(clicked!)
end if
end event

type st_5 from statictext within w_detalle_nota_de_credito
integer x = 782
integer y = 120
integer width = 178
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tipo_cob from dropdownlistbox within w_detalle_nota_de_credito
integer x = 338
integer y = 108
integer width = 334
integer height = 400
integer taborder = 40
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

type st_1 from statictext within w_detalle_nota_de_credito
integer x = 78
integer y = 120
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
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

type em_numero from editmask within w_detalle_nota_de_credito
integer x = 1061
integer y = 108
integer width = 347
integer height = 96
integer taborder = 30
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

event modified;String		ls_base,ls_serie
Double	ll_numero

ls_base	= trim(ddlb_base.text)
ls_serie	= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	dw_lista.reset()
	pb_procesar.triggerevent(clicked!)
end if
end event

type st_4 from statictext within w_detalle_nota_de_credito
integer x = 859
integer y = 120
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

type ddlb_serie from dropdownlistbox within w_detalle_nota_de_credito
integer x = 613
integer y = 108
integer width = 229
integer height = 400
integer taborder = 20
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

event selectionchanged;dw_lista.reset()
em_numero.setfocus()
end event

type st_3 from statictext within w_detalle_nota_de_credito
integer x = 466
integer y = 120
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
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_detalle_nota_de_credito
integer x = 224
integer y = 108
integer width = 229
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

event selectionchanged;String	ls_base,ls_serie
ls_base	= trim(ddlb_base.text)
if not isnull(ls_base) and ls_base<>'' then
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
	ddlb_serie.setfocus()
end if
end event

type st_2 from statictext within w_detalle_nota_de_credito
integer x = 78
integer y = 120
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

type cb_1 from commandbutton within w_detalle_nota_de_credito
integer x = 1906
integer y = 1908
integer width = 357
integer height = 104
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_nota_de_credito)
end event

type dw_lista from datawindow within w_detalle_nota_de_credito
integer x = 32
integer y = 404
integer width = 2231
integer height = 528
integer taborder = 70
string title = "none"
string dataobject = "dw_detalle_nota_de_credito_folio"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_tipo_cob
Long		ll_folio
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ls_tipo_cob	= dw_lista.getitemstring(dw_lista.getrow(),'tipo_cob')
	ll_folio		= dw_lista.getitemnumber(dw_lista.getrow(),'folio')
	if dw_detalle.retrieve(ls_tipo_cob,ll_folio) = 0 then
		p_1.visible						= true
	else
		p_1.visible						= false
	end if
end if
end event

event rowfocuschanged;String	ls_tipo_cob
Long		ll_folio
if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ls_tipo_cob	= dw_lista.getitemstring(dw_lista.getrow(),'tipo_cob')
	ll_folio		= dw_lista.getitemnumber(dw_lista.getrow(),'folio')
	if dw_detalle.retrieve(ls_tipo_cob,ll_folio) = 0 then
		p_1.visible						= true
	else
		p_1.visible						= false
	end if
end if
end event

type gb_1 from groupbox within w_detalle_nota_de_credito
integer x = 32
integer y = 16
integer width = 1440
integer height = 244
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

type gb_2 from groupbox within w_detalle_nota_de_credito
integer x = 27
integer y = 1872
integer width = 823
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_detalle from datawindow within w_detalle_nota_de_credito
integer x = 32
integer y = 1056
integer width = 2231
integer height = 816
integer taborder = 110
string title = "none"
string dataobject = "dw_consultar_detalle_nota_de_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
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

type p_1 from picture within w_detalle_nota_de_credito
integer x = 41
integer y = 1064
integer width = 2217
integer height = 800
string picturename = "sin_detalle.bmp"
boolean focusrectangle = false
end type

