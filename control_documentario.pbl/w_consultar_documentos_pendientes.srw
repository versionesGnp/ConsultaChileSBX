forward
global type w_consultar_documentos_pendientes from window
end type
type cb_digitacion from commandbutton within w_consultar_documentos_pendientes
end type
type rb_todos from radiobutton within w_consultar_documentos_pendientes
end type
type cb_glosa from commandbutton within w_consultar_documentos_pendientes
end type
type cb_cta_cte from commandbutton within w_consultar_documentos_pendientes
end type
type cb_docto_pendiente from commandbutton within w_consultar_documentos_pendientes
end type
type dw_print from datawindow within w_consultar_documentos_pendientes
end type
type pb_buscar from picturebutton within w_consultar_documentos_pendientes
end type
type em_ctto from editmask within w_consultar_documentos_pendientes
end type
type st_1 from statictext within w_consultar_documentos_pendientes
end type
type cb_eliminar from commandbutton within w_consultar_documentos_pendientes
end type
type dw_jefe from datawindow within w_consultar_documentos_pendientes
end type
type rb_jefe from radiobutton within w_consultar_documentos_pendientes
end type
type rb_periodo from radiobutton within w_consultar_documentos_pendientes
end type
type pb_ok from picturebutton within w_consultar_documentos_pendientes
end type
type em_fec_fin from editmask within w_consultar_documentos_pendientes
end type
type st_3 from statictext within w_consultar_documentos_pendientes
end type
type em_fec_ini from editmask within w_consultar_documentos_pendientes
end type
type st_2 from statictext within w_consultar_documentos_pendientes
end type
type cb_1 from commandbutton within w_consultar_documentos_pendientes
end type
type cb_2 from commandbutton within w_consultar_documentos_pendientes
end type
type cb_3 from commandbutton within w_consultar_documentos_pendientes
end type
type cb_cerrar from commandbutton within w_consultar_documentos_pendientes
end type
type dw_lista from datawindow within w_consultar_documentos_pendientes
end type
type gb_1 from groupbox within w_consultar_documentos_pendientes
end type
end forward

global type w_consultar_documentos_pendientes from window
integer width = 3625
integer height = 2012
boolean titlebar = true
string title = "Consultar Documentos Pendientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_digitacion cb_digitacion
rb_todos rb_todos
cb_glosa cb_glosa
cb_cta_cte cb_cta_cte
cb_docto_pendiente cb_docto_pendiente
dw_print dw_print
pb_buscar pb_buscar
em_ctto em_ctto
st_1 st_1
cb_eliminar cb_eliminar
dw_jefe dw_jefe
rb_jefe rb_jefe
rb_periodo rb_periodo
pb_ok pb_ok
em_fec_fin em_fec_fin
st_3 st_3
em_fec_ini em_fec_ini
st_2 st_2
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_consultar_documentos_pendientes w_consultar_documentos_pendientes

type variables
Long	il_row
end variables

on w_consultar_documentos_pendientes.create
this.cb_digitacion=create cb_digitacion
this.rb_todos=create rb_todos
this.cb_glosa=create cb_glosa
this.cb_cta_cte=create cb_cta_cte
this.cb_docto_pendiente=create cb_docto_pendiente
this.dw_print=create dw_print
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_1=create st_1
this.cb_eliminar=create cb_eliminar
this.dw_jefe=create dw_jefe
this.rb_jefe=create rb_jefe
this.rb_periodo=create rb_periodo
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_digitacion,&
this.rb_todos,&
this.cb_glosa,&
this.cb_cta_cte,&
this.cb_docto_pendiente,&
this.dw_print,&
this.pb_buscar,&
this.em_ctto,&
this.st_1,&
this.cb_eliminar,&
this.dw_jefe,&
this.rb_jefe,&
this.rb_periodo,&
this.pb_ok,&
this.em_fec_fin,&
this.st_3,&
this.em_fec_ini,&
this.st_2,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_consultar_documentos_pendientes.destroy
destroy(this.cb_digitacion)
destroy(this.rb_todos)
destroy(this.cb_glosa)
destroy(this.cb_cta_cte)
destroy(this.cb_docto_pendiente)
destroy(this.dw_print)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_1)
destroy(this.cb_eliminar)
destroy(this.dw_jefe)
destroy(this.rb_jefe)
destroy(this.rb_periodo)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_consultar_documentos_pendientes)
cb_eliminar.visible		= false
dw_jefe.settransobject(sqlca)
rb_periodo.checked		= true
rb_periodo.triggerevent(clicked!)
if gs_depto='V' or gs_depto='O' or gs_depto='I' or gs_depto='E' then
	cb_1.enabled			= true
	cb_3.enabled			= true
	cb_2.enabled			= true
	rb_todos.visible			= true
	if gs_depto='I' or gs_user='MARCOS' THEN
		cb_eliminar.visible	= true
	END IF
else
	cb_1.enabled			= false
	cb_3.enabled			= false
	cb_2.enabled			= false
end if
dw_lista.settransobject(sqlca)

end event

type cb_digitacion from commandbutton within w_consultar_documentos_pendientes
integer x = 1019
integer y = 1752
integer width = 352
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver Digitación"
end type

event clicked;long ll_resp

if dw_lista.rowcount() > 0 then
	if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		SELECT	"CADENA"."RUT"
		INTO 		:gi_rut
		FROM 	"CADENA"  
		WHERE 	"CADENA"."CODIGO" = :gs_base AND  
				 	"CADENA"."SERIE" = :gs_serie AND  
				 	"CADENA"."NUMERO" = :gi_numero 
		USING	sqlca;
		if isnull(gi_rut) then gi_rut=0
		if gi_rut=0 then
			messagebox("Advertencia","Contrato Seleccionado No Se Encuentra Digitado")
		end if	
		CHOOSE CASE gs_base
			CASE "O","U" // Oferta
				if isvalid(w_ingresar_oferta) then close(w_ingresar_oferta)
				Open(w_ingresar_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_ingresar_liberador) then close(w_ingresar_liberador)
				Open(w_ingresar_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_ingresar_aumento_capacidad) then close(w_ingresar_aumento_capacidad)
				Open(w_ingresar_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

type rb_todos from radiobutton within w_consultar_documentos_pendientes
boolean visible = false
integer x = 2871
integer y = 52
integer width = 347
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
end type

event clicked;em_fec_ini.enabled	= false
em_fec_fin.enabled	= false
dw_jefe.enabled		= false
em_fec_ini.text			= string(month(today()),"00")
em_fec_fin.text			= string(year(today()),"0000")
dw_lista.settransobject(sqlca)
dw_lista.reset()
dw_jefe.reset()
dw_jefe.insertrow(0)
dw_jefe.setfocus()
end event

type cb_glosa from commandbutton within w_consultar_documentos_pendientes
integer x = 695
integer y = 1752
integer width = 329
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Glosa Excep."
end type

event clicked;string		ls_base,ls_serie,ls_string
long		ll_grupo,ll_codigo
Double	ll_numero

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ll_numero			= dw_lista.getitemnumber(il_row,'numero')
	ll_grupo				= dw_lista.getitemnumber(il_row,'codigo_grupo_excepcion')
	ll_codigo				= dw_lista.getitemnumber(il_row,'codigo_excepcion')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ll_numero) and ll_numero >0 then
		ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_grupo)+'~t'+string(ll_codigo)
		if isvalid(w_glosa_excepcion) then close(w_glosa_excepcion)
		OpenWithParm (w_glosa_excepcion,ls_string)
	end if
end if




end event

type cb_cta_cte from commandbutton within w_consultar_documentos_pendientes
integer x = 439
integer y = 1752
integer width = 261
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a. Cte"
end type

event clicked;if dw_lista.rowcount() > 0 then
	if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		SELECT	"CADENA"."RUT"
		INTO 		:gi_rut
		FROM 	"CADENA"  
		WHERE 	"CADENA"."CODIGO" = :gs_base AND  
				 	"CADENA"."SERIE" = :gs_serie AND  
				 	"CADENA"."NUMERO" = :gi_numero 
		USING	sqlca;
		if isnull(gi_rut) then gi_rut=0
		if gi_rut=0 then
			messagebox("Advertencia","Contrato Seleccionado No Se Encuentra Digitado")
		else
			CHOOSE CASE gs_base
				CASE "O","U" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
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
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
			END CHOOSE
		end if
	end if
end if
end event

type cb_docto_pendiente from commandbutton within w_consultar_documentos_pendientes
integer x = 37
integer y = 1752
integer width = 407
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string		ls_base,ls_serie,ls_string
Double	ll_numero

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ll_numero			= dw_lista.getitemnumber(il_row,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ll_numero) and ll_numero >0 then
		ls_string			= 'M'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+gs_depto
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if


end event

type dw_print from datawindow within w_consultar_documentos_pendientes
boolean visible = false
integer x = 1797
integer y = 1880
integer width = 411
integer height = 432
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_buscar from picturebutton within w_consultar_documentos_pendientes
integer x = 3141
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
Double	ll_numero
String		ls_string
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

type em_ctto from editmask within w_consultar_documentos_pendientes
integer x = 2725
integer y = 1756
integer width = 402
integer height = 92
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

type st_1 from statictext within w_consultar_documentos_pendientes
integer x = 2263
integer y = 1776
integer width = 471
integer height = 64
integer textsize = -8
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

type cb_eliminar from commandbutton within w_consultar_documentos_pendientes
integer x = 1422
integer y = 1752
integer width = 206
integer height = 88
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

type dw_jefe from datawindow within w_consultar_documentos_pendientes
integer x = 1285
integer y = 136
integer width = 1536
integer height = 116
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_jefe_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
pb_ok.setfocus()
end event

type rb_jefe from radiobutton within w_consultar_documentos_pendientes
integer x = 1321
integer y = 52
integer width = 663
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Jefe Venta"
end type

event clicked;em_fec_ini.enabled	= false
em_fec_fin.enabled	= false
dw_jefe.enabled		= true
em_fec_ini.text			= string(month(today()),"00")
em_fec_fin.text			= string(year(today()),"0000")
dw_lista.settransobject(sqlca)
dw_lista.reset()
dw_jefe.reset()
dw_jefe.insertrow(0)
dw_jefe.setfocus()
end event

type rb_periodo from radiobutton within w_consultar_documentos_pendientes
integer x = 91
integer y = 52
integer width = 549
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Periodo"
end type

event clicked;em_fec_ini.enabled	= true
em_fec_fin.enabled	= true
dw_jefe.enabled		= false
em_fec_ini.text			= string(month(today()),"00")
em_fec_fin.text			= string(year(today()),"0000")
dw_jefe.reset()
dw_jefe.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.reset()
em_fec_ini.setfocus()
end event

type pb_ok from picturebutton within w_consultar_documentos_pendientes
integer x = 3378
integer y = 76
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

event clicked;Long		ll_mes,ll_anno
String	ls_jefe
dw_jefe.accepttext()
if rb_periodo.checked=true then
	ll_mes												= long(em_fec_ini.text)
	ll_anno												= long(em_fec_fin.text)
	if ll_mes=0 or isnull(ll_mes) then
		messagebox("Advertencia","Mes Inválido")
		em_fec_ini.setfocus()
	else
		if ll_anno=0 or isnull(ll_anno) then
			messagebox("Advertencia","Año Inválida")
			em_fec_fin.setfocus()
		else
			if gs_depto='B' then
				dw_lista.dataobject = 'dw_lista_documentos_pendiente_ctto_jefe'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,gs_user,ll_mes,ll_anno)=0 then messagebox("Advertencia","No Registra Dato")
			elseif gs_depto='R' then
				dw_lista.dataobject = 'dw_lista_documentos_pendiente_ctto_depto'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,gs_user,ll_mes,ll_anno)=0 then messagebox("Advertencia","No Registra Dato")
			else
				dw_lista.dataobject = 'dw_lista_documentos_pendientes_contrato'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,ll_mes,ll_anno)=0 then messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
elseif rb_jefe.checked=true then
	ls_jefe											= dw_jefe.getitemstring(1,'jefe')
	if not isnull(ls_jefe) and ls_jefe<>'' then
		if gs_depto='B' then
				dw_lista.dataobject= 'dw_lista_documentos_pen_ctto_jefe'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
		elseif gs_depto='R' then
			dw_lista.dataobject= 'dw_lista_documentos_pend_ctto_depto'
			dw_lista.settransobject(sqlca)
			if dw_lista.retrieve(gs_depto,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
		else
			dw_lista.dataobject= 'dw_lista_documentos_pend_contrato'
			dw_lista.settransobject(sqlca)
			if dw_lista.retrieve(gs_depto,ls_jefe)=0 then messagebox("Advertencia","No Registra Dato")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Jefe Venta")
		dw_jefe.setfocus()
	end if
elseif rb_todos.checked=true then
	dw_lista.dataobject = 'dw_lista_documentos_pendientes_ctto_todo'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(gs_depto)=0 then messagebox("Advertencia","No Registra Dato")
end if
end event

type em_fec_fin from editmask within w_consultar_documentos_pendientes
integer x = 704
integer y = 148
integer width = 329
integer height = 92
integer taborder = 20
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
string minmax = "0~~2100"
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

type st_3 from statictext within w_consultar_documentos_pendientes
integer x = 535
integer y = 160
integer width = 142
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

type em_fec_ini from editmask within w_consultar_documentos_pendientes
event ue_keydown pbm_keydown
integer x = 233
integer y = 148
integer width = 274
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string minmax = "1~~12"
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

type st_2 from statictext within w_consultar_documentos_pendientes
integer x = 59
integer y = 160
integer width = 160
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_consultar_documentos_pendientes
integer x = 1627
integer y = 1752
integer width = 206
integer height = 88
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

type cb_2 from commandbutton within w_consultar_documentos_pendientes
integer x = 2034
integer y = 1752
integer width = 206
integer height = 88
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

type cb_3 from commandbutton within w_consultar_documentos_pendientes
integer x = 1829
integer y = 1752
integer width = 206
integer height = 88
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

type cb_cerrar from commandbutton within w_consultar_documentos_pendientes
integer x = 3278
integer y = 1756
integer width = 288
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

event clicked;close(w_consultar_documentos_pendientes)
end event

type dw_lista from datawindow within w_consultar_documentos_pendientes
integer x = 46
integer y = 292
integer width = 3506
integer height = 1424
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_documentos_pend_contrato"
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
			ls_filtro	= 'cd_folio_detalle_excepcion_estado_entreg<>"R"'
		CASE 't_recepcionado'
			ls_filtro	= 'cd_folio_detalle_excepcion_estado_entreg="R"'
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

event doubleclicked;string	ls_base,ls_serie,ls_string
long	ll_tot_reg,ll_excep,ll_mes,ll_ano
datetime	ldt_fec_fin
Double	ll_numero

ll_tot_reg						= 	dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_excep						= dw_lista.getitemnumber(il_row,'codigo_excepcion')
	if ll_excep=25 then
		ls_base					= dw_lista.getitemstring(il_row,'base')
		ls_serie					= dw_lista.getitemstring(il_row,'serie')
		ll_numero				= dw_lista.getitemnumber(il_row,'numero')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 then
			SELECT	"MES_CIERRE",	"ANO_CIERRE"  
			INTO 		:ll_mes,			:ll_ano  
			FROM 	"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :ll_numero )
			USING	sqlca;
			if isnull(ll_mes) then ll_mes=0
			if isnull(ll_ano) then ll_ano=0
			if ll_mes>0 and ll_ano>0 then
				ldt_fec_fin			= f_fecha_fin(ll_mes,ll_ano)
				if ldt_fec_fin>=datetime(date(string('30/06/2014')),time('00:00:00')) then
					ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(il_row)
					if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
					OpenWithparm(w_cd_mantenedor_contrato,ls_string)
				else
					messagebox("Advertencia","Contrato No Registra Detalle Modificación Contrato, Período Ventas "+string(ldt_fec_fin,'dd/mm/yyyy'))
				end if
			end if
		end if
	end if
end if
end event

type gb_1 from groupbox within w_consultar_documentos_pendientes
integer x = 46
integer width = 3301
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

