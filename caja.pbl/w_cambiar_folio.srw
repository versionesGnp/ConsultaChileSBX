forward
global type w_cambiar_folio from window
end type
type cb_limpiar from commandbutton within w_cambiar_folio
end type
type st_6 from statictext within w_cambiar_folio
end type
type st_5 from statictext within w_cambiar_folio
end type
type st_4 from statictext within w_cambiar_folio
end type
type st_3 from statictext within w_cambiar_folio
end type
type ddlb_tipo_cob_nuevo from dropdownlistbox within w_cambiar_folio
end type
type ddlb_tipo_cob_actual from dropdownlistbox within w_cambiar_folio
end type
type cb_cerrar from commandbutton within w_cambiar_folio
end type
type cb_grabar from commandbutton within w_cambiar_folio
end type
type dw_doc_cob from datawindow within w_cambiar_folio
end type
type dw_documentos from datawindow within w_cambiar_folio
end type
type dw_ingre from datawindow within w_cambiar_folio
end type
type dw_ingreso from datawindow within w_cambiar_folio
end type
type cb_procesar from commandbutton within w_cambiar_folio
end type
type em_nuevo from editmask within w_cambiar_folio
end type
type em_actual from editmask within w_cambiar_folio
end type
type st_2 from statictext within w_cambiar_folio
end type
type st_1 from statictext within w_cambiar_folio
end type
end forward

global type w_cambiar_folio from window
integer width = 2944
integer height = 1756
boolean titlebar = true
string title = "Cambiar Folio"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
ddlb_tipo_cob_nuevo ddlb_tipo_cob_nuevo
ddlb_tipo_cob_actual ddlb_tipo_cob_actual
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_doc_cob dw_doc_cob
dw_documentos dw_documentos
dw_ingre dw_ingre
dw_ingreso dw_ingreso
cb_procesar cb_procesar
em_nuevo em_nuevo
em_actual em_actual
st_2 st_2
st_1 st_1
end type
global w_cambiar_folio w_cambiar_folio

on w_cambiar_folio.create
this.cb_limpiar=create cb_limpiar
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_tipo_cob_nuevo=create ddlb_tipo_cob_nuevo
this.ddlb_tipo_cob_actual=create ddlb_tipo_cob_actual
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_doc_cob=create dw_doc_cob
this.dw_documentos=create dw_documentos
this.dw_ingre=create dw_ingre
this.dw_ingreso=create dw_ingreso
this.cb_procesar=create cb_procesar
this.em_nuevo=create em_nuevo
this.em_actual=create em_actual
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_limpiar,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.ddlb_tipo_cob_nuevo,&
this.ddlb_tipo_cob_actual,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_doc_cob,&
this.dw_documentos,&
this.dw_ingre,&
this.dw_ingreso,&
this.cb_procesar,&
this.em_nuevo,&
this.em_actual,&
this.st_2,&
this.st_1}
end on

on w_cambiar_folio.destroy
destroy(this.cb_limpiar)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_tipo_cob_nuevo)
destroy(this.ddlb_tipo_cob_actual)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_doc_cob)
destroy(this.dw_documentos)
destroy(this.dw_ingre)
destroy(this.dw_ingreso)
destroy(this.cb_procesar)
destroy(this.em_nuevo)
destroy(this.em_actual)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;String	ls_tipo_cob
gf_centrar(w_cambiar_folio)
dw_ingreso.settransobject(sqlca)
dw_ingre.settransobject(sqlca)
dw_documentos.settransobject(sqlca)
dw_doc_cob.settransobject(sqlca)
cb_grabar.enabled	= false
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob_actual.additem(ls_tipo_cob)
			ddlb_tipo_cob_nuevo.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;

end event

type cb_limpiar from commandbutton within w_cambiar_folio
integer x = 1285
integer y = 1512
integer width = 343
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

event clicked;String	ls_tipo_cob
dw_ingreso.reset()
dw_ingre.reset()
dw_documentos.reset()
dw_doc_cob.reset()
ddlb_tipo_cob_actual.reset()
ddlb_tipo_cob_nuevo.reset()
em_actual.text		= ''
em_nuevo.text		= ''
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob_actual.additem(ls_tipo_cob)
			ddlb_tipo_cob_nuevo.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
cb_grabar.enabled	= false
ddlb_tipo_cob_actual.setfocus()
end event

type st_6 from statictext within w_cambiar_folio
integer x = 1522
integer y = 832
integer width = 498
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla Doc_cob"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cambiar_folio
integer x = 1522
integer y = 172
integer width = 498
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla Documentos"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cambiar_folio
integer x = 64
integer y = 832
integer width = 402
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla Ingre"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambiar_folio
integer x = 64
integer y = 172
integer width = 402
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla Ingreso"
boolean focusrectangle = false
end type

type ddlb_tipo_cob_nuevo from dropdownlistbox within w_cambiar_folio
integer x = 1673
integer y = 44
integer width = 293
integer height = 376
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;Long		ll_count,ll_folio
String	ls_tipo_cob

ls_tipo_cob	= trim(ddlb_tipo_cob_nuevo.text)
ll_folio		= long(em_nuevo.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	SELECT	COUNT("INGRESO"."TIPO_COB")  
	INTO 		:ll_count  
	FROM 		"INGRESO"  
	WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
			 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob )   
	USING		sqlca;
	if ll_count>0 then
		messagebox("Advertencia","Error Comprobante "+ls_tipo_cob+'-'+string(ll_folio)+' Ya Existe')
		em_nuevo.text	= ''
		em_nuevo.setfocus()
	end if
end if
end event

type ddlb_tipo_cob_actual from dropdownlistbox within w_cambiar_folio
integer x = 411
integer y = 44
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
dw_ingreso.reset()
dw_ingre.reset()
dw_documentos.reset()
dw_doc_cob.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob_actual.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then ddlb_tipo_cob_nuevo.text = ls_tipo_cob
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_ingreso.retrieve(ll_folio,ls_tipo_cob)=0 then
		messagebox("Advertencia","No Registra dato")
	else
		dw_ingre.retrieve(ll_folio,ls_tipo_cob)
		dw_documentos.retrieve(ll_folio,ls_tipo_cob)
		dw_doc_cob.retrieve(ll_folio,ls_tipo_cob)
	end if
end if
end event

type cb_cerrar from commandbutton within w_cambiar_folio
integer x = 2519
integer y = 1512
integer width = 343
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

event clicked;close(w_cambiar_folio)
end event

type cb_grabar from commandbutton within w_cambiar_folio
integer x = 41
integer y = 1512
integer width = 343
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long	ll_resp_1,ll_resp_2,ll_resp_3,ll_resp_4
ll_resp_1	= dw_ingreso.update()
ll_resp_2	= dw_ingre.update()
ll_resp_3	= dw_documentos.update()
ll_resp_4	= dw_doc_cob.update()
if ll_resp_1=1 and ll_resp_2=1 and ll_resp_3=1 and ll_resp_4=1 then
	commit using sqlca;
	messagebox("Grabar","Grabación Exitosa")
	cb_limpiar.triggerevent(clicked!)
else
	rollback using sqlca;
	messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if


end event

type dw_doc_cob from datawindow within w_cambiar_folio
integer x = 1499
integer y = 904
integer width = 1362
integer height = 568
integer taborder = 90
string title = "none"
string dataobject = "dw_tabla_doc_cob"
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

type dw_documentos from datawindow within w_cambiar_folio
integer x = 1499
integer y = 244
integer width = 1362
integer height = 568
integer taborder = 80
string title = "none"
string dataobject = "dw_tabla_documentos"
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

type dw_ingre from datawindow within w_cambiar_folio
integer x = 41
integer y = 904
integer width = 1362
integer height = 568
integer taborder = 70
string title = "none"
string dataobject = "dw_tabla_ingre"
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

type dw_ingreso from datawindow within w_cambiar_folio
integer x = 41
integer y = 244
integer width = 1362
integer height = 568
integer taborder = 60
string title = "none"
string dataobject = "dw_tabla_ingreso"
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

type cb_procesar from commandbutton within w_cambiar_folio
integer x = 2519
integer y = 40
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;String		ls_cob_actual,ls_cob_nuevo
Long		ll_folio_actual,ll_folio_nuevo,ll_indi,ll_tot_reg,ll_sw_1,ll_sw_2,&
			ll_sw_3,ll_sw_4,ll_resp

ls_cob_actual		= trim(ddlb_tipo_cob_actual.text)
ls_cob_nuevo		= trim(ddlb_tipo_cob_nuevo.text)
ll_folio_actual		= long(em_actual.text)
ll_folio_nuevo		= long(em_nuevo.text)

if not isnull(ls_cob_actual) and ls_cob_actual<>'' and not isnull(ls_cob_nuevo) and &
	ls_cob_nuevo<>'' and ll_folio_actual>0 and ll_folio_nuevo>0 then
	ll_tot_reg	= dw_ingreso.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_ingreso.setitem(ll_indi,'folio',ll_folio_nuevo)
		dw_ingreso.setitem(ll_indi,'tipo_cob',ls_cob_nuevo)
		ll_sw_1 ++
	next
	dw_ingreso.accepttext()
	ll_tot_reg	= dw_ingre.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_ingre.setitem(ll_indi,'folio',ll_folio_nuevo)
		dw_ingre.setitem(ll_indi,'tipo_cob',ls_cob_nuevo)
		ll_sw_2 ++
	next
	dw_ingre.accepttext()
	ll_tot_reg	= dw_documentos.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_documentos.setitem(ll_indi,'folio',ll_folio_nuevo)
		dw_documentos.setitem(ll_indi,'tipo_cob',ls_cob_nuevo)
		ll_sw_3 ++
	next
	dw_documentos.accepttext()
	ll_tot_reg	= dw_doc_cob.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_doc_cob.setitem(ll_indi,'folio',ll_folio_nuevo)
		dw_doc_cob.setitem(ll_indi,'tipo_cob',ls_cob_nuevo)
		ll_sw_4 ++
	next
	dw_doc_cob.accepttext()
	if ll_sw_1>0 and ll_sw_2>0 and ll_sw_3>0 and ll_sw_4>0 then
		ll_resp				= messagebox("Actualización","Se Modificó Comprobante, recuerde debe Grabar",Exclamation!,YesNo!,2)
		if ll_resp=1 then 
			cb_grabar.enabled	= true
//			cb_grabar.triggerevent(clicked!)
		else
			cb_grabar.enabled	= false
		end if
	else
		cb_grabar.enabled		= false
	end if
else
	if isnull(ls_cob_actual) or ls_cob_actual='' then
		messagebox("Advertencia","Falta Ingresar Tipo Cobro Actual")
		ddlb_tipo_cob_actual.setfocus()
	elseif isnull(ls_cob_nuevo) or ls_cob_nuevo='' then
		messagebox("Advertencia","Falta Ingresar Tipo Cobro Nuevo")
		ddlb_tipo_cob_nuevo.setfocus()
	elseif ll_folio_actual=0 or isnull(ll_folio_actual) then
		messagebox("Advertencia","Falta Ingresar Folio Actual")
		em_actual.setfocus()
	elseif ll_folio_nuevo=0 or isnull(ll_folio_nuevo) then
		messagebox("Advertencia","Falta Ingresar Folio Nuevo")
		em_nuevo.setfocus()
	end if
end if
end event

type em_nuevo from editmask within w_cambiar_folio
integer x = 1984
integer y = 44
integer width = 416
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;Long		ll_count,ll_folio
String	ls_tipo_cob

ls_tipo_cob	= trim(ddlb_tipo_cob_nuevo.text)
ll_folio		= long(em_nuevo.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	SELECT	COUNT("INGRESO"."TIPO_COB")  
	INTO 		:ll_count  
	FROM 		"INGRESO"  
	WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
			 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob )   
	USING		sqlca;
	if ll_count>0 then
		messagebox("Advertencia","Error Comprobante "+ls_tipo_cob+'-'+string(ll_folio)+' Ya Existe')
		em_nuevo.text	= ''
		em_nuevo.setfocus()
	end if
end if
end event

type em_actual from editmask within w_cambiar_folio
integer x = 727
integer y = 44
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
dw_ingreso.reset()
dw_ingre.reset()
dw_documentos.reset()
dw_doc_cob.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob_actual.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_ingreso.retrieve(ll_folio,ls_tipo_cob)=0 then
		messagebox("Advertencia","No Registra dato")
	else
		dw_ingre.retrieve(ll_folio,ls_tipo_cob)
		dw_documentos.retrieve(ll_folio,ls_tipo_cob)
		dw_doc_cob.retrieve(ll_folio,ls_tipo_cob)
	end if
end if
end event

type st_2 from statictext within w_cambiar_folio
integer x = 1330
integer y = 32
integer width = 320
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante Nuevo"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cambiar_folio
integer x = 27
integer y = 32
integer width = 366
integer height = 112
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante Actual"
alignment alignment = right!
boolean focusrectangle = false
end type

