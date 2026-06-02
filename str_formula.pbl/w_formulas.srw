forward
global type w_formulas from window
end type
type cb_eliminar from commandbutton within w_formulas
end type
type cb_grabar from commandbutton within w_formulas
end type
type cb_insertar from commandbutton within w_formulas
end type
type st_2 from statictext within w_formulas
end type
type em_formula from editmask within w_formulas
end type
type st_1 from statictext within w_formulas
end type
type cb_aceptar from commandbutton within w_formulas
end type
type dw_muestra from datawindow within w_formulas
end type
type cb_cerrar from commandbutton within w_formulas
end type
end forward

global type w_formulas from window
integer width = 3163
integer height = 1660
boolean titlebar = true
string title = "String de Formulas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_insertar cb_insertar
st_2 st_2
em_formula em_formula
st_1 st_1
cb_aceptar cb_aceptar
dw_muestra dw_muestra
cb_cerrar cb_cerrar
end type
global w_formulas w_formulas

type variables
long il_new, il_row
end variables

on w_formulas.create
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_insertar=create cb_insertar
this.st_2=create st_2
this.em_formula=create em_formula
this.st_1=create st_1
this.cb_aceptar=create cb_aceptar
this.dw_muestra=create dw_muestra
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_eliminar,&
this.cb_grabar,&
this.cb_insertar,&
this.st_2,&
this.em_formula,&
this.st_1,&
this.cb_aceptar,&
this.dw_muestra,&
this.cb_cerrar}
end on

on w_formulas.destroy
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_insertar)
destroy(this.st_2)
destroy(this.em_formula)
destroy(this.st_1)
destroy(this.cb_aceptar)
destroy(this.dw_muestra)
destroy(this.cb_cerrar)
end on

event open;dw_muestra.settransobject(sqlca)
cb_grabar.enabled	= false
gf_centrar(w_formulas)
em_formula.text	= trim(gs_formula)
dw_muestra.retrieve(gl_aplicacion,gs_user)

end event

type cb_eliminar from commandbutton within w_formulas
integer x = 1605
integer y = 1424
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long	Net, ll_cod
if il_row > 0 then
	ll_cod	= dw_muestra.getitemnumber(il_row,'codigo')
	Net		= MessageBox("Eliminar", "Está seguro de Eliminar Fórmula "+string(ll_cod),Exclamation!, YesNo!, 2)
	IF Net = 1 THEN
		dw_muestra.deleterow(il_row)
		if dw_muestra.update()=1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error Eliminación SQL: "+sqlca.sqlerrtext)
		end if
	END IF
end if
end event

type cb_grabar from commandbutton within w_formulas
integer x = 901
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;string	ls_text
ls_text	= dw_muestra.getitemstring(il_new,'observacion')

if trim(ls_text) <> '' then
	if dw_muestra.update()=1 then
		messagebox("Grabar","Grabación Exitosa")
		commit;
	else
		rollback;
		messagebox("Error Grabar","Error Grabación SQL: "+sqlca.sqlerrtext)
	end if
	cb_grabar.enabled	= false
else
	messagebox("Advertencia","Debe ingresar Observacion")
	dw_muestra.scrolltorow(il_new)
	dw_muestra.setcolumn("observacion")
end if
end event

type cb_insertar from commandbutton within w_formulas
integer x = 393
integer y = 1424
integer width = 503
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insertar &Fórmula"
end type

event clicked;long			ll_existe, ll_count, ll_filas, ll_indi
string		ls_form
ll_filas		= dw_muestra.rowcount()
ll_existe	= 0
if trim(em_formula.text) <> '' then
	for ll_indi = 1 to ll_filas
		ls_form	= dw_muestra.getitemstring(ll_indi,'string_formula')
		if trim(ls_form) = trim(em_formula.text) then
			messagebox("Advertencia","Formula Existente")
			ll_indi		= ll_filas
			ll_existe	= 1
		end if
	next
	if ll_existe = 0 then
		il_new		= dw_muestra.insertrow(0)
		SELECT max("FORMULAS_CONSULTA"."CODIGO")
    	INTO :ll_count  
    	FROM "FORMULAS_CONSULTA"  
		Using sqlca;
		if sqlca.sqlcode = 0 then
			ll_count ++
		end if 
		if isnull(ll_count) or ll_count = 0 then ll_count = 1
		dw_muestra.setitem(il_new,'codigo',ll_count)
		dw_muestra.setitem(il_new,'codigo_sistema',gl_aplicacion)
		dw_muestra.setitem(il_new,'string_formula',trim(gs_formula))
		dw_muestra.setitem(il_new,'usuario',gs_user)
		dw_muestra.scrolltorow(il_new)
		dw_muestra.setfocus()
		cb_grabar.enabled	= true
	end if
end if
end event

type st_2 from statictext within w_formulas
integer x = 50
integer y = 1304
integer width = 434
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Fórmula Actual"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_formula from editmask within w_formulas
integer x = 503
integer y = 1288
integer width = 2601
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_1 from statictext within w_formulas
integer x = 59
integer y = 28
integer width = 690
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Listado de Formulas"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_formulas
integer x = 41
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long	ll_indi,ll_filas
if il_row > 0 then 
	if isvalid(w_general_cobranza_telefonica) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_general_cobranza_telefonica.dw_lista.SETfilter(gs_formula)
		w_general_cobranza_telefonica.dw_lista.filter()
		w_general_cobranza_telefonica.dw_lista.accepttext()
	end if
	if isvalid(w_ingreso_individual_cobranza) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_ingreso_individual_cobranza.dw_lista.SETfilter(gs_formula)
		w_ingreso_individual_cobranza.dw_lista.filter()
		w_ingreso_individual_cobranza.dw_lista.accepttext()
	end if
	if isvalid(w_generar_filtro_at_terreno) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_generar_filtro_at_terreno.dw_lista.SETfilter(gs_formula)
		w_generar_filtro_at_terreno.dw_lista.filter()
		w_generar_filtro_at_terreno.dw_lista.accepttext()
	end if
	if isvalid(w_filtrar_cobranza) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_filtrar_cobranza.dw_lista.SETfilter(gs_formula)
		w_filtrar_cobranza.dw_lista.filter()
		w_filtrar_cobranza.dw_lista.accepttext()
	end if
	if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_ingreso_gestion_ejecutivo_terreno.dw_lista.SETfilter(gs_formula)
		w_ingreso_gestion_ejecutivo_terreno.dw_lista.filter()
		w_ingreso_gestion_ejecutivo_terreno.dw_lista.accepttext()
	end if
	if isvalid(w_ver_agenda) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_ver_agenda.dw_lista.SETfilter(gs_formula)
		w_ver_agenda.dw_lista.filter()
		w_ver_agenda.dw_lista.accepttext()
	end if
	if isvalid(w_ingreso_individual_ugn) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_ingreso_individual_ugn.dw_lista.SETfilter(gs_formula)
		w_ingreso_individual_ugn.dw_lista.filter()
		w_ingreso_individual_ugn.dw_lista.accepttext()
	end if
//	if isvalid(w_documentos_rtf) then
//		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
//		w_documentos_rtf.dw_lista.SETfilter(gs_formula)
//		w_documentos_rtf.dw_lista.filter()
//		w_documentos_rtf.dw_lista.accepttext()
//	end if
	if isvalid(w_analisis_cuponera) then
		gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
		w_analisis_cuponera.dw_detalle_ingreso.SETfilter(gs_formula)
		w_analisis_cuponera.dw_detalle_ingreso.filter()
		w_analisis_cuponera.dw_detalle_ingreso.accepttext()
	else
		if isvalid(w_cuponeras_nuevas_sin_imprimir) then
			gs_formula	= dw_muestra.getitemstring(il_row,'string_formula')
			w_cuponeras_nuevas_sin_imprimir.dw_muestra.SETfilter(gs_formula)
			w_cuponeras_nuevas_sin_imprimir.dw_muestra.filter()
			w_cuponeras_nuevas_sin_imprimir.dw_muestra.accepttext()
		end if
	end if
end if
cb_cerrar.triggerevent(clicked!)
end event

type dw_muestra from datawindow within w_formulas
integer x = 41
integer y = 120
integer width = 3063
integer height = 1136
integer taborder = 10
string title = "none"
string dataobject = "dw_muestra_formulas"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;il_row	= row
cb_aceptar.TriggerEvent(Clicked!)

end event

event losefocus;this.accepttext()
end event

type cb_cerrar from commandbutton within w_formulas
integer x = 2757
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_formulas)
end event

