forward
global type w_cambiar_promesa_de_pago_en_rezago from window
end type
type cb_limpiar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
end type
type pb_buscar from picturebutton within w_cambiar_promesa_de_pago_en_rezago
end type
type st_5 from statictext within w_cambiar_promesa_de_pago_en_rezago
end type
type em_numero from editmask within w_cambiar_promesa_de_pago_en_rezago
end type
type st_4 from statictext within w_cambiar_promesa_de_pago_en_rezago
end type
type ddlb_serie from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
end type
type st_3 from statictext within w_cambiar_promesa_de_pago_en_rezago
end type
type ddlb_base from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
end type
type st_2 from statictext within w_cambiar_promesa_de_pago_en_rezago
end type
type pb_ok from picturebutton within w_cambiar_promesa_de_pago_en_rezago
end type
type em_actual from editmask within w_cambiar_promesa_de_pago_en_rezago
end type
type ddlb_tipo_cob from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
end type
type st_1 from statictext within w_cambiar_promesa_de_pago_en_rezago
end type
type cb_cerrar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
end type
type dw_lista from datawindow within w_cambiar_promesa_de_pago_en_rezago
end type
type gb_1 from groupbox within w_cambiar_promesa_de_pago_en_rezago
end type
type cb_grabar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
end type
end forward

global type w_cambiar_promesa_de_pago_en_rezago from window
integer width = 3250
integer height = 1476
boolean titlebar = true
string title = "Cambiar Nº  de Promesa de Pago en Rezago"
windowtype windowtype = response!
long backcolor = 67108864
cb_limpiar cb_limpiar
pb_buscar pb_buscar
st_5 st_5
em_numero em_numero
st_4 st_4
ddlb_serie ddlb_serie
st_3 st_3
ddlb_base ddlb_base
st_2 st_2
pb_ok pb_ok
em_actual em_actual
ddlb_tipo_cob ddlb_tipo_cob
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
cb_grabar cb_grabar
end type
global w_cambiar_promesa_de_pago_en_rezago w_cambiar_promesa_de_pago_en_rezago

on w_cambiar_promesa_de_pago_en_rezago.create
this.cb_limpiar=create cb_limpiar
this.pb_buscar=create pb_buscar
this.st_5=create st_5
this.em_numero=create em_numero
this.st_4=create st_4
this.ddlb_serie=create ddlb_serie
this.st_3=create st_3
this.ddlb_base=create ddlb_base
this.st_2=create st_2
this.pb_ok=create pb_ok
this.em_actual=create em_actual
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.cb_grabar=create cb_grabar
this.Control[]={this.cb_limpiar,&
this.pb_buscar,&
this.st_5,&
this.em_numero,&
this.st_4,&
this.ddlb_serie,&
this.st_3,&
this.ddlb_base,&
this.st_2,&
this.pb_ok,&
this.em_actual,&
this.ddlb_tipo_cob,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.cb_grabar}
end on

on w_cambiar_promesa_de_pago_en_rezago.destroy
destroy(this.cb_limpiar)
destroy(this.pb_buscar)
destroy(this.st_5)
destroy(this.em_numero)
destroy(this.st_4)
destroy(this.ddlb_serie)
destroy(this.st_3)
destroy(this.ddlb_base)
destroy(this.st_2)
destroy(this.pb_ok)
destroy(this.em_actual)
destroy(this.ddlb_tipo_cob)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.cb_grabar)
end on

event open;String	ls_tipo_cob,ls_base

connect using Trans_1;
gf_centrar(w_cambiar_promesa_de_pago_en_rezago)
dw_lista.settransobject(sqlca)
ddlb_tipo_cob.reset()
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;

ddlb_base.reset()
ddlb_serie.reset()
em_numero.text			= ''
DECLARE	x2 CURSOR FOR  
SELECT 	"TIPO_CONTRATO"."CODIGO"  
FROM 		"TIPO_CONTRATO"  
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_base;
		if not isnull(ls_base) and ls_base<>'' then
			ddlb_base.additem(ls_base)
		end if
		setnull(ls_base)
	LOOP
end if
close x2;
ddlb_base.enabled		= false
ddlb_serie.enabled	= false
em_numero.enabled		= false
if isvalid(w_traspaso_rezago) then
	em_actual.text			= w_traspaso_rezago.sle_folio.text
	ddlb_tipo_cob.text	= Mid(w_traspaso_rezago.ddlb_tipo_cob.text,1,2)
	pb_ok.triggerevent(clicked!)
end if
ddlb_tipo_cob.setfocus()
end event

event close;disconnect using Trans_1;
end event

type cb_limpiar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
integer x = 1426
integer y = 1256
integer width = 338
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_tipo_cob, ls_base

dw_lista.reset()
ddlb_tipo_cob.reset()
em_actual.text	= ''
st_5.text			= ''
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
ddlb_base.reset()
ddlb_serie.reset()
em_numero.text			= ''
DECLARE	x2 CURSOR FOR  
SELECT 	"TIPO_CONTRATO"."CODIGO"  
FROM 		"TIPO_CONTRATO"  
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_base;
		if not isnull(ls_base) and ls_base<>'' then
			ddlb_base.additem(ls_base)
		end if
		setnull(ls_base)
	LOOP
end if
close x2;
ddlb_base.enabled		= false
ddlb_serie.enabled	= false
em_numero.enabled		= false
ddlb_tipo_cob.setfocus()
end event

type pb_buscar from picturebutton within w_cambiar_promesa_de_pago_en_rezago
integer x = 2976
integer y = 356
integer width = 105
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String		ls_base,ls_serie,ls_descrip
Double		ll_numero
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
	SELECT	"CD_ESTADO"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 		"CD_ESTADO",   
				"CD_FOLIO"  
	WHERE  ( "CD_ESTADO"."CODIGO" = "CD_FOLIO"."ULT_ESTADO" ) and  
			 (("CD_FOLIO"."BASE" = :ls_base ) AND  
			 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
			 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		st_5.text	= ls_descrip
	else
		st_5.text	= 'No Existe Contrato en Control Documentario'
	end if
end if

end event

type st_5 from statictext within w_cambiar_promesa_de_pago_en_rezago
integer x = 2350
integer y = 888
integer width = 805
integer height = 300
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_numero from editmask within w_cambiar_promesa_de_pago_en_rezago
integer x = 2656
integer y = 744
integer width = 425
integer height = 96
integer taborder = 70
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

st_5.text		= ''
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
	pb_buscar.triggerevent(clicked!)
end if

end event

type st_4 from statictext within w_cambiar_promesa_de_pago_en_rezago
integer x = 2382
integer y = 752
integer width = 251
integer height = 64
integer textsize = -10
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

type ddlb_serie from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
integer x = 2656
integer y = 548
integer width = 229
integer height = 400
integer taborder = 60
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

event selectionchanged;st_5.text	= ''
pb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within w_cambiar_promesa_de_pago_en_rezago
integer x = 2437
integer y = 556
integer width = 197
integer height = 64
integer textsize = -10
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

type ddlb_base from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
integer x = 2656
integer y = 352
integer width = 229
integer height = 400
integer taborder = 50
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
	st_5.text	= ''
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
	pb_buscar.triggerevent(clicked!)
end if
end event

type st_2 from statictext within w_cambiar_promesa_de_pago_en_rezago
integer x = 2437
integer y = 360
integer width = 197
integer height = 64
integer textsize = -10
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

type pb_ok from picturebutton within w_cambiar_promesa_de_pago_en_rezago
integer x = 1193
integer y = 28
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
end type

event clicked;String	ls_tipo_cob
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_lista.retrieve(ll_folio,ls_tipo_cob)=0 then
		messagebox("Advertencia","No Registra dato")
	else
//		dw_ingre.retrieve(ll_folio,ls_tipo_cob)
//		dw_documentos.retrieve(ll_folio,ls_tipo_cob)
//		dw_doc_cob.retrieve(ll_folio,ls_tipo_cob)
	end if
end if
end event

type em_actual from editmask within w_cambiar_promesa_de_pago_en_rezago
integer x = 727
integer y = 56
integer width = 416
integer height = 92
integer taborder = 20
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
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type ddlb_tipo_cob from dropdownlistbox within w_cambiar_promesa_de_pago_en_rezago
integer x = 411
integer y = 56
integer width = 293
integer height = 376
integer taborder = 10
integer textsize = -9
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

event selectionchanged;String	ls_tipo_cob
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type st_1 from statictext within w_cambiar_promesa_de_pago_en_rezago
integer x = 27
integer y = 68
integer width = 366
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
integer x = 2848
integer y = 1256
integer width = 338
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambiar_promesa_de_pago_en_rezago)
end event

type dw_lista from datawindow within w_cambiar_promesa_de_pago_en_rezago
integer x = 32
integer y = 200
integer width = 2240
integer height = 1028
integer taborder = 40
boolean titlebar = true
string title = " Detalle Comprobante"
string dataobject = "dw_lista_comprobante_rezago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_codigo
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo							= dw_lista.getitemnumber(row,'cd_folio_ult_estado')
	if ll_codigo=100 or ll_codigo=102 or ll_codigo=104 then
		ddlb_base.enabled			= true
		ddlb_serie.enabled		= true
		em_numero.enabled		= true
		ddlb_serie.reset()
		em_numero.text			= ''
		ddlb_base.setfocus()
	else
		ddlb_base.enabled			= false
		ddlb_serie.enabled		= false
		em_numero.enabled		= false
		em_numero.text			= ''
		messagebox("Advertencia","Recuerde Contrato debe estar NULO, para traspasar Pago en Rezago")
	end if
end if
end event

event rowfocuschanged;Long	ll_codigo
if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ll_codigo	= dw_lista.getitemnumber(getrow(),'cd_folio_ult_estado')
	if ll_codigo=100 or ll_codigo=102 then
		ddlb_base.enabled		= true
		ddlb_serie.enabled	= true
		em_numero.enabled		= true
		ddlb_serie.reset()
		em_numero.text			= ''
		ddlb_base.setfocus()
	else
		ddlb_base.enabled		= false
		ddlb_serie.enabled	= false
		em_numero.enabled		= false
		em_numero.text			= ''
	end if
end if
end event

type gb_1 from groupbox within w_cambiar_promesa_de_pago_en_rezago
integer x = 2318
integer y = 192
integer width = 869
integer height = 1032
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Contrato Asignar"
end type

type cb_grabar from commandbutton within w_cambiar_promesa_de_pago_en_rezago
integer x = 32
integer y = 1256
integer width = 338
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_codigo,ll_rut,ll_folio,ll_pasa1=0,ll_pasa2=0
String		ls_base,ls_serie,ls_base_real,ls_serie_real,ls_descrip,ls_tipo_cob
Double	ll_numero,ll_numero_real

if dw_lista.getrow()>0 then
	ll_codigo	= dw_lista.getitemnumber(dw_lista.getrow(),'cd_folio_ult_estado')
	if ll_codigo=100 or ll_codigo=102  or ll_codigo=104 then
		ls_base			= dw_lista.getitemstring(dw_lista.getrow(),'cliente_rezago_base')
		ls_serie			= dw_lista.getitemstring(dw_lista.getrow(),'cliente_rezago_serie')
		ll_numero		= dw_lista.getitemnumber(dw_lista.getrow(),'cliente_rezago_numero')
		ll_rut				= dw_lista.getitemnumber(dw_lista.getrow(),'ingreso_rut')
		ls_tipo_cob		= trim(ddlb_tipo_cob.text)
		ll_folio			= long(em_actual.text)
		ls_base_real	= trim(ddlb_base.text)
		ls_serie_real	= trim(ddlb_serie.text)
		ll_numero_real	= Double(em_numero.text)
		SELECT	"CD_ESTADO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 		"CD_ESTADO",   
					"CD_FOLIO"  
		WHERE  ( "CD_ESTADO"."CODIGO" = "CD_FOLIO"."ULT_ESTADO" ) and  
				 (("CD_FOLIO"."BASE" = :ls_base_real ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie_real ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero_real ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			UPDATE	"CLIENTE_REZAGO"  
			SET 		"BASE" = :ls_base_real,   
						"SERIE" = :ls_serie_real,   
						"NUMERO" = :ll_numero_real  
			WHERE  ( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
					 ( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
					 ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
					 ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND  
					 ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_pasa1	= 0
				UPDATE	"DETALLE_PAGO_PIE_COMPROBANTE"  
				SET 		"BASE" = :ls_base_real,   
							"SERIE" = :ls_serie_real,   
							"NUMERO" = :ll_numero_real,
							"BASE_ORIGINAL" = :ls_base,
							"SERIE_ORIGINAL" = :ls_serie,
							"NUMERO_ORIGINAL" = :ll_numero
				WHERE  ( "DETALLE_PAGO_PIE_COMPROBANTE"."BASE" = :ls_base ) AND  
						 ( "DETALLE_PAGO_PIE_COMPROBANTE"."SERIE" = :ls_serie ) AND  
						 ( "DETALLE_PAGO_PIE_COMPROBANTE"."NUMERO" = :ll_numero ) AND  
						 ( "DETALLE_PAGO_PIE_COMPROBANTE"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "DETALLE_PAGO_PIE_COMPROBANTE"."FOLIO" = :ll_folio )   
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					ll_pasa2	= 0
				else
					ll_pasa2 ++
				end if
			else
				ll_pasa1	++
			end if
			if ll_pasa1=0 and ll_pasa2=0 then
				commit using sqlca;
				commit using Trans_1;
				messagebox("Grabar","Grabación Exitosa")
				cb_limpiar.triggerevent(clicked!)
			else
				rollback using sqlca;
				rollback using Trans_1;
				messagebox("Error Grabar","Error al Grabar")
			end if
		else
			messagebox("Advertencia",'No Existe Contrato en Control Documentario')
		end if
	else
		messagebox("Advertencia","Recuerde Contrato debe estar NULO, para Traspasar Pago en Rezago")
	end if
end if
end event

