forward
global type w_consultar_documentos_excepciones from window
end type
type pb_print from picturebutton within w_consultar_documentos_excepciones
end type
type dw_print from datawindow within w_consultar_documentos_excepciones
end type
type pb_buscar from picturebutton within w_consultar_documentos_excepciones
end type
type em_ctto from editmask within w_consultar_documentos_excepciones
end type
type st_1 from statictext within w_consultar_documentos_excepciones
end type
type cb_eliminar from commandbutton within w_consultar_documentos_excepciones
end type
type pb_ok from picturebutton within w_consultar_documentos_excepciones
end type
type em_fec_fin from editmask within w_consultar_documentos_excepciones
end type
type st_3 from statictext within w_consultar_documentos_excepciones
end type
type em_fec_ini from editmask within w_consultar_documentos_excepciones
end type
type st_2 from statictext within w_consultar_documentos_excepciones
end type
type cb_grabar from commandbutton within w_consultar_documentos_excepciones
end type
type cb_1 from commandbutton within w_consultar_documentos_excepciones
end type
type cb_2 from commandbutton within w_consultar_documentos_excepciones
end type
type cb_3 from commandbutton within w_consultar_documentos_excepciones
end type
type cb_cerrar from commandbutton within w_consultar_documentos_excepciones
end type
type dw_lista from datawindow within w_consultar_documentos_excepciones
end type
type gb_1 from groupbox within w_consultar_documentos_excepciones
end type
end forward

global type w_consultar_documentos_excepciones from window
integer width = 3625
integer height = 2016
boolean titlebar = true
string title = "Consultar Documentos Pendientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_print pb_print
dw_print dw_print
pb_buscar pb_buscar
em_ctto em_ctto
st_1 st_1
cb_eliminar cb_eliminar
pb_ok pb_ok
em_fec_fin em_fec_fin
st_3 st_3
em_fec_ini em_fec_ini
st_2 st_2
cb_grabar cb_grabar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_consultar_documentos_excepciones w_consultar_documentos_excepciones

type variables
Long	il_row
end variables

on w_consultar_documentos_excepciones.create
this.pb_print=create pb_print
this.dw_print=create dw_print
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_1=create st_1
this.cb_eliminar=create cb_eliminar
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_grabar=create cb_grabar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_print,&
this.dw_print,&
this.pb_buscar,&
this.em_ctto,&
this.st_1,&
this.cb_eliminar,&
this.pb_ok,&
this.em_fec_fin,&
this.st_3,&
this.em_fec_ini,&
this.st_2,&
this.cb_grabar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_consultar_documentos_excepciones.destroy
destroy(this.pb_print)
destroy(this.dw_print)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_1)
destroy(this.cb_eliminar)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_grabar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_consultar_documentos_excepciones)
cb_eliminar.visible		= false
dw_lista.settransobject(sqlca)
em_fec_ini.text		= string(month(today()),"00")
em_fec_fin.text		= string(year(today()),"0000")
if gs_depto='V' or gs_depto='O' or gs_depto='I' then
	cb_grabar.visible		= true
	cb_1.enabled			= true
	cb_3.enabled			= true
	cb_2.enabled			= true
	if gs_depto='I' or gs_user='MARCOS' THEN
		cb_eliminar.visible	= true
	END IF
else
	cb_grabar.visible		= false
	cb_1.enabled			= false
	cb_3.enabled			= false
	cb_2.enabled			= false
end if
dw_lista.settransobject(sqlca)

end event

type pb_print from picturebutton within w_consultar_documentos_excepciones
integer x = 3314
integer y = 80
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
end type

event clicked;Long		ld_fec_ini,ld_fec_fin

if dw_lista.rowcount() > 0 then 
	dw_print.dataobject	= 'dw_lista_documentos_pendientes2'
	dw_print.settransobject(sqlca)
	ld_fec_ini	= long(em_fec_ini.text)
	ld_fec_fin	= long(em_fec_fin.text)
	if ld_fec_ini=0 or isnull(ld_fec_ini) then
		messagebox("Advertencia","Mes Inválido")
		em_fec_ini.setfocus()
	else
		if ld_fec_fin=0 or isnull(ld_fec_fin) then
			messagebox("Advertencia","Año Inválida")
			em_fec_fin.setfocus()
		else
			if dw_print.retrieve(gs_depto,ld_fec_ini,ld_fec_fin)=0 then 
				messagebox("Advertencia","No Registra Dato")
			else
				f_Print( dw_print )
			end if
		end if
	end if
end if
end event

type dw_print from datawindow within w_consultar_documentos_excepciones
boolean visible = false
integer x = 1797
integer y = 1880
integer width = 411
integer height = 432
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_buscar from picturebutton within w_consultar_documentos_excepciones
integer x = 2880
integer y = 1756
integer width = 114
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;Long		ll_tot_reg,ll_fila
String		ls_string
Double	ll_numero
ll_numero	= Double(em_ctto.text)
ll_tot_reg	= dw_lista.rowcount()
if ll_numero>0 and ll_tot_reg>0 then
	ls_string	= "numero = "+string(ll_numero)
	ll_fila = dw_lista.Find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if
end event

type em_ctto from editmask within w_consultar_documentos_excepciones
integer x = 2423
integer y = 1756
integer width = 448
integer height = 100
integer taborder = 120
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

event modified;if long(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_1 from statictext within w_consultar_documentos_excepciones
integer x = 1888
integer y = 1776
integer width = 503
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Contrato:"
boolean focusrectangle = false
end type

type cb_eliminar from commandbutton within w_consultar_documentos_excepciones
integer x = 448
integer y = 1756
integer width = 334
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eli&minar"
end type

event clicked;String		ls_base,ls_serie
Long		ll_excep,ll_resp
Double	ll_numero
if il_row>0 and dw_lista.rowcount()>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ll_excep		= dw_lista.getitemnumber(il_row,'codigo_excepcion')
	ll_resp		= messagebox("Eliminar","Está Seguro de Eliminar Fila: "+string(il_row)+", Contrato Nº: "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+', Codigo Excepción: '+string(ll_excep),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista.deleterow(il_row)
	end if
end if
end event

type pb_ok from picturebutton within w_consultar_documentos_excepciones
integer x = 1989
integer y = 80
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Long		ld_fec_ini,ld_fec_fin

ld_fec_ini	= long(em_fec_ini.text)
ld_fec_fin	= long(em_fec_fin.text)
if ld_fec_ini=0 or isnull(ld_fec_ini) then
	messagebox("Advertencia","Mes Inválido")
	em_fec_ini.setfocus()
else
	if ld_fec_fin=0 or isnull(ld_fec_fin) then
		messagebox("Advertencia","Año Inválida")
		em_fec_fin.setfocus()
	else
		if gs_depto='B' then
			dw_lista.dataobject		= 'dw_lista_documento_pendiente_ctto2_jefe'
			dw_lista.settransobject(sqlca)
			if dw_lista.retrieve(gs_depto,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
		elseif gs_depto='R' then
			dw_lista.dataobject		= 'dw_lista_documento_pendiente_ctto2_depto'
			dw_lista.settransobject(sqlca)
			if dw_lista.retrieve(gs_depto,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
		else
			dw_lista.dataobject		= 'dw_lista_documentos_pendientes_contrato2'
			dw_lista.settransobject(sqlca)
			if dw_lista.retrieve(gs_depto)=0 then messagebox("Advertencia","No Registra Dato")
		end if
	end if
end if

end event

type em_fec_fin from editmask within w_consultar_documentos_excepciones
integer x = 1467
integer y = 100
integer width = 425
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

event modified;Long	ll_ano,ll_mes
dw_lista.reset()
ll_ano	= long(this.text)
ll_mes	= long(em_fec_ini.text)
if ll_ano>0 and ll_mes>0 then
//	pb_ok.setfocus()
else
	messagebox("Advertencia","Año Inválido")
	em_fec_fin.text	= string(year(today()),"0000")
	em_fec_fin.setfocus()
end if
end event

type st_3 from statictext within w_consultar_documentos_excepciones
integer x = 965
integer y = 112
integer width = 475
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año Periodo"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_consultar_documentos_excepciones
event ue_keydown pbm_keydown
integer x = 585
integer y = 100
integer width = 325
integer height = 112
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
end type

event ue_keydown;if long(em_fec_ini.text)>0 then em_fec_ini.triggerevent(modified!)
end event

event modified;Long	ll_mes
dw_lista.reset()
ll_mes					= long(this.text)
if ll_mes>0 and ll_mes<=12 then
//	em_fec_fin.setfocus()
elseif ll_mes=0 then 
	em_fec_ini.text	= '12'
else
	messagebox("Advertencia","Mes Inválido")
	em_fec_ini.text	= string(month(today()),"00")
	em_fec_ini.setfocus()
end if
end event

type st_2 from statictext within w_consultar_documentos_excepciones
integer x = 91
integer y = 112
integer width = 466
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes Periodo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_consultar_documentos_excepciones
integer x = 46
integer y = 1756
integer width = 334
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_1 from commandbutton within w_consultar_documentos_excepciones
integer x = 841
integer y = 1756
integer width = 219
integer height = 100
integer taborder = 90
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

type cb_2 from commandbutton within w_consultar_documentos_excepciones
integer x = 1289
integer y = 1756
integer width = 219
integer height = 100
integer taborder = 110
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

type cb_3 from commandbutton within w_consultar_documentos_excepciones
integer x = 1065
integer y = 1756
integer width = 219
integer height = 100
integer taborder = 100
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

type cb_cerrar from commandbutton within w_consultar_documentos_excepciones
integer x = 3218
integer y = 1756
integer width = 334
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

event clicked;close(w_consultar_documentos_excepciones)
end event

type dw_lista from datawindow within w_consultar_documentos_excepciones
integer x = 46
integer y = 292
integer width = 3506
integer height = 1424
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_documento_pendiente_ctto2_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna,ls_estado
Long		ll_row
date		ld_fecha

setnull(ld_fecha)
ls_columna	= dwo.name
ll_row		= this.getrow()
if ls_columna='estado_entrega' then
	ls_estado	= trim(data)
	if ls_estado='R' then
		if isnull(this.getitemdatetime(ll_row,'fecha_recepcion_documento')) then
			dw_lista.setitem(ll_row,'fecha_recepcion_documento',date(gdt_fec_sistema))
			dw_lista.accepttext()
		end if
	else
		dw_lista.setitem(ll_row,'fecha_recepcion_documento',ld_fecha)
		dw_lista.accepttext()
	end if
elseif ls_columna='cd_folio_detalle_excepcion_estado_entreg' then
	ls_estado	= trim(data)
	if ls_estado='R' then
		if isnull(this.getitemdatetime(ll_row,'cd_folio_detalle_excepcion_fecha_recepci')) then
			dw_lista.setitem(ll_row,'cd_folio_detalle_excepcion_fecha_recepci',date(gdt_fec_sistema))
			dw_lista.accepttext()
		end if
	else
		dw_lista.setitem(ll_row,'cd_folio_detalle_excepcion_fecha_recepci',ld_fecha)
		dw_lista.accepttext()
	end if
end if
end event

event clicked;string	ls_columna,ls_filtro

ls_columna				= dwo.name
if row=0 then
	CHOOSE CASE ls_columna
		CASE 't_pendiente'
			ls_filtro	= 'estado_entrega<>"R"'
		CASE 't_recepcionado'
			ls_filtro	= 'estado_entrega="R"'
		CASE 't_blanco'
			ls_filtro	= 'color="BLANCO"'
		CASE 't_rojo'
			ls_filtro	= 'color="ROJO"'
		CASE 't_amarillo'
			ls_filtro	= 'color="AMARILLO"'
		CASE 't_todo'
			ls_filtro	= ''
	END CHOOSE
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.SORT()
	if dw_lista.rowcount()=0 then messagebox("Advertencia","No Registra Dato")
else
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	this.scrolltorow(il_row)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	this.scrolltorow(il_row)
end if
end event

type gb_1 from groupbox within w_consultar_documentos_excepciones
integer x = 46
integer width = 3506
integer height = 280
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

