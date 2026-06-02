forward
global type w_cd_entrega_de_folios_a_departamento from window
end type
type st_entregar_a from statictext within w_cd_entrega_de_folios_a_departamento
end type
type cb_entragar_a from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type st_mostrar_marcados from statictext within w_cd_entrega_de_folios_a_departamento
end type
type cbx_todo from checkbox within w_cd_entrega_de_folios_a_departamento
end type
type cb_procesar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_cta_cte from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_filtrar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_sort from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_exportar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_imprimir from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_limpiar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type cb_grabar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type em_final from editmask within w_cd_entrega_de_folios_a_departamento
end type
type st_2 from statictext within w_cd_entrega_de_folios_a_departamento
end type
type em_inicial from editmask within w_cd_entrega_de_folios_a_departamento
end type
type st_1 from statictext within w_cd_entrega_de_folios_a_departamento
end type
type dw_tipo_contrato from datawindow within w_cd_entrega_de_folios_a_departamento
end type
type cb_cerrar from commandbutton within w_cd_entrega_de_folios_a_departamento
end type
type dw_lista from datawindow within w_cd_entrega_de_folios_a_departamento
end type
type gb_1 from groupbox within w_cd_entrega_de_folios_a_departamento
end type
type gb_3 from groupbox within w_cd_entrega_de_folios_a_departamento
end type
type gb_4 from groupbox within w_cd_entrega_de_folios_a_departamento
end type
type gb_2 from groupbox within w_cd_entrega_de_folios_a_departamento
end type
end forward

global type w_cd_entrega_de_folios_a_departamento from window
integer width = 3543
integer height = 2088
boolean titlebar = true
string title = "Entrega de Formularios a Departamento"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
st_entregar_a st_entregar_a
cb_entragar_a cb_entragar_a
st_mostrar_marcados st_mostrar_marcados
cbx_todo cbx_todo
cb_procesar cb_procesar
cb_cta_cte cb_cta_cte
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_grabar cb_grabar
em_final em_final
st_2 st_2
em_inicial em_inicial
st_1 st_1
dw_tipo_contrato dw_tipo_contrato
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_2 gb_2
end type
global w_cd_entrega_de_folios_a_departamento w_cd_entrega_de_folios_a_departamento

type variables
Long		il_row
String		is_filtro
datawindowchild			idw_detalle5
end variables

event open;Long		ll_codigo,ll_parque
String		ls_nombre, ls_string

gf_centrar(w_cd_entrega_de_folios_a_departamento)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
else
	ll_parque				= 11
end if

dw_tipo_contrato.getchild('depto',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if

dw_tipo_contrato.getchild('parque',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve()=0 then
	idw_detalle3.insertrow(0)
end if

dw_tipo_contrato.getchild('base',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve()=0 then
	idw_detalle4.insertrow(0)
end if

dw_tipo_contrato.getchild('serie',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if idw_detalle5.retrieve('O',ll_parque)=0 then
	idw_detalle5.insertrow(0)
end if
dw_tipo_contrato.insertrow(0)
dw_tipo_contrato.accepttext()
setnull(gs_usuario_entregar)
st_entregar_a.text		= ''
dw_lista.settransobject(sqlca)
dw_tipo_contrato.setfocus()
dw_tipo_contrato.setcolumn('depto')
cbx_todo.enabled			= false
cbx_todo.checked			= false
end event

on w_cd_entrega_de_folios_a_departamento.create
this.st_entregar_a=create st_entregar_a
this.cb_entragar_a=create cb_entragar_a
this.st_mostrar_marcados=create st_mostrar_marcados
this.cbx_todo=create cbx_todo
this.cb_procesar=create cb_procesar
this.cb_cta_cte=create cb_cta_cte
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.em_final=create em_final
this.st_2=create st_2
this.em_inicial=create em_inicial
this.st_1=create st_1
this.dw_tipo_contrato=create dw_tipo_contrato
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.st_entregar_a,&
this.cb_entragar_a,&
this.st_mostrar_marcados,&
this.cbx_todo,&
this.cb_procesar,&
this.cb_cta_cte,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_grabar,&
this.em_final,&
this.st_2,&
this.em_inicial,&
this.st_1,&
this.dw_tipo_contrato,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_3,&
this.gb_4,&
this.gb_2}
end on

on w_cd_entrega_de_folios_a_departamento.destroy
destroy(this.st_entregar_a)
destroy(this.cb_entragar_a)
destroy(this.st_mostrar_marcados)
destroy(this.cbx_todo)
destroy(this.cb_procesar)
destroy(this.cb_cta_cte)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.em_inicial)
destroy(this.st_1)
destroy(this.dw_tipo_contrato)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_2)
end on

type st_entregar_a from statictext within w_cd_entrega_de_folios_a_departamento
integer x = 485
integer y = 408
integer width = 1646
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_entragar_a from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 46
integer y = 408
integer width = 430
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Personal"
end type

event clicked;String		ls_depto

ls_depto					= trim(dw_tipo_contrato.getitemstring(1,'depto'))
setnull(gs_usuario_entregar)
st_entregar_a.text		= ''
if not isnull(ls_depto) and ls_depto<>'' then
	OpenWithParm(w_cd_lista_usuario_a_quien_entregar_doc,ls_depto)
else
	messagebox("Advertencia","Debe Seleccionar Departamento a Entregar Documentos")
	dw_tipo_contrato.setfocus()
	dw_tipo_contrato.setcolumn('depto')
end if
end event

type st_mostrar_marcados from statictext within w_cd_entrega_de_folios_a_departamento
integer x = 2514
integer y = 1812
integer width = 439
integer height = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Solo Marcados"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if is_filtro='marca = 0' then
	is_filtro	= ''
	st_mostrar_marcados.text	= 'Mostrar Solo Marcados'
else
	is_filtro	= 'marca = 0'
	st_mostrar_marcados.text	= 'Mostrar Todo'
end if
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
dw_lista.SORT()
end event

type cbx_todo from checkbox within w_cd_entrega_de_folios_a_departamento
integer x = 2935
integer y = 116
integer width = 471
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_estado,ll_count,ll_marca
Double	ll_numero
String		ls_estado_reg,ls_base,ls_serie,ls_usuario,ls_depto,ls_glosa,ls_descrip_depto,&
			ls_memo,ls_serie_tipo,ls_serie_aux

if cbx_todo.checked=true then
	dw_lista.accepttext()
	ls_depto					= dw_tipo_contrato.getitemstring(1,'depto')
	ls_serie_tipo			= dw_tipo_contrato.getitemstring(1,'serie')
	ll_tot_reg				= dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_estado_reg	= dw_lista.getitemstring(ll_indi,'estado_reg')
			ls_base			= dw_lista.getitemstring(ll_indi,'base')
			ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
			ll_estado			= dw_lista.getitemnumber(ll_indi,'ult_estado')
			ls_usuario		= dw_lista.getitemstring(ll_indi,'usuario_crea')
			if ll_estado=0 and not isnull(ls_usuario) then
				ll_count ++
				if ls_depto='V' then
					dw_lista.setitem(ll_indi,'ult_estado',1)
				elseif ls_depto='P' then
					dw_lista.setitem(ll_indi,'ult_estado',6)
				elseif ls_depto='T' then
					dw_lista.setitem(ll_indi,'ult_estado',20)
				end if
				if not isnull(ls_serie_tipo) then dw_lista.setitem(ll_indi,'serie',ls_serie_tipo)
				dw_lista.setitem(ll_indi,'marca',0)
			end if
		next
		dw_lista.accepttext()
	end if
//	if ll_count=0 then messagebox("Advertencia","No Registra Formulario para Entrega")
elseif cbx_todo.checked=false then
	ll_tot_reg				= dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_estado_reg	= dw_lista.getitemstring(ll_indi,'estado_reg')
			ls_base			= dw_lista.getitemstring(ll_indi,'base')
			ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
			ll_estado			= dw_lista.getitemnumber(ll_indi,'ult_estado')
			ls_usuario		= dw_lista.getitemstring(ll_indi,'usuario_crea')
			ll_marca			= dw_lista.getitemnumber(ll_indi,'marca')
			SELECT	"CD_FOLIO"."SERIE"  
			INTO 		:ls_serie_aux  
			FROM 	"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_indi,'serie',ls_serie_aux)
			end if
			if ll_marca=0 and (ll_estado=1 or ll_estado=6 or ll_estado=20) then
				dw_lista.setitem(ll_indi,'ult_estado',0)
				dw_lista.setitem(ll_indi,'marca',1)
			end if
		next
	end if
	dw_lista.accepttext()
end if
end event

type cb_procesar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 2907
integer y = 280
integer width = 526
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Procesar"
end type

event clicked;String		ls_base,ls_serie,ls_glosa,ls_descrip_estado,ls_depto,ls_usuario,ls_estado_reg,	ls_serie_aux,ls_memo='-'
Long		ll_tot_reg,ll_estado,ll_count=0,ll_cod_parque
Double	ll_numero,ll_folio_ini,ll_folio_fin,ll_indi
SetPointer(HourGlass!)
ls_base				= dw_tipo_contrato.getitemstring(1,'base')
ls_serie				= dw_tipo_contrato.getitemstring(1,'serie')
ls_depto				= dw_tipo_contrato.getitemstring(1,'depto')
ll_cod_parque		= dw_tipo_contrato.getitemnumber(1,'parque')
ll_folio_ini			= Double(em_inicial.text)
ll_folio_fin			= Double(em_final.text)
if not isnull(ls_base) and not isnull(ls_serie) and ll_folio_ini>0 and ll_folio_fin>0 and not isnull(ls_depto) then
	if ll_folio_ini>ll_folio_fin then
		messagebox("Advertencia","Rango de Folio Inválido")
		dw_lista.reset()
		em_final.setfocus()
	else
		if ll_cod_parque=0 or isnull(ll_cod_parque) then
			messagebox("Advertencia","Debe Seleccionar PARQUE")
			dw_tipo_contrato.setfocus()
			dw_tipo_contrato.setcolumn('parque')
		else
			ll_tot_reg	= dw_lista.retrieve(ll_folio_ini,ll_folio_fin,ls_base)
			if ll_tot_reg>0 then
				cbx_todo.checked	= false
				cbx_todo.enabled	= true
				for ll_indi=1 to ll_tot_reg
					ls_serie_aux	= dw_lista.getitemstring(ll_indi,'serie')
					ll_estado		= dw_lista.getitemnumber(ll_indi,'ult_estado')
					if ll_estado=0 then ll_count ++
					if isnull(ls_serie_aux) or ls_serie_aux='' then
						dw_lista.setitem(ll_indi,'serie',ls_serie)
					end if
					dw_lista.setitem(ll_indi,'marca',1)
				next
				dw_lista.accepttext()
				if ll_count=0 then messagebox("Advertencia","No Registra Folio para Asignar")
			else
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
else
	if isnull(ls_base) then
		messagebox("Advertencia","Base Inválida")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('base')
	elseif isnull(ls_serie) then
		messagebox("Advertencia","Serie Inválida")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('serie')
	elseif isnull(ls_depto) then
		messagebox("Advertencia","Departamento Inválido")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('depto')
	elseif isnull(ll_folio_ini) or ll_folio_ini=0 then
		messagebox("Advertencia","Folio Rango Inicial Inválido")
		em_inicial.setfocus()
	elseif isnull(ll_folio_fin) or ll_folio_fin=0 then
		messagebox("Advertencia","Folio Rango Final Inválido")
		em_final.setfocus()
	end if
end if
SetPointer(Arrow!)
end event

type cb_cta_cte from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 434
integer y = 1824
integer width = 352
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a.Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta/Columbario
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
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
		CASE "F","G", "V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type cb_filtrar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 2098
integer y = 1836
integer width = 251
integer height = 88
integer taborder = 130
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

type cb_sort from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 1842
integer y = 1836
integer width = 251
integer height = 88
integer taborder = 120
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

type cb_exportar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 1586
integer y = 1836
integer width = 251
integer height = 88
integer taborder = 110
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

type cb_imprimir from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 864
integer y = 1824
integer width = 315
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 1257
integer y = 1824
integer width = 274
integer height = 104
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_tipo_contrato.reset()
dw_tipo_contrato.insertrow(0)
Setnull(il_row);Setnull(is_filtro)
em_inicial.text					= ''
em_final.text					= ''
st_entregar_a.text				= ''
dw_lista.reset()
cbx_todo.checked				= false
cbx_todo.enabled				= false
dw_tipo_contrato.setfocus()
end event

type cb_grabar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 41
integer y = 1824
integer width = 315
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_estado_cd,ll_marca,ll_count,ll_resp,ll_sw_pasa=0,ll_cod_parque
String		ls_base,ls_serie,ls_glosa,ls_memo,ls_estado_reg,ls_depto,ls_glosa_cd,ls_descrip_depto,ls_filtro,ls_nombre_entregar,ls_ref_memo
Datetime	ldt_fecha
Double	ll_numero,ll_folio_ini,ll_folio_fin

SetPointer(HourGlass!)
dw_tipo_contrato.accepttext()
ls_base								= dw_tipo_contrato.getitemstring(1,'base')
ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
ll_folio_ini							= Double(em_inicial.text)
ll_folio_fin							= Double(em_final.text)
ll_cod_parque						= dw_tipo_contrato.getitemnumber(1,'parque')
if not isnull(ls_base) and not isnull(ls_serie) and ll_folio_ini>0 and ll_folio_fin>0 and not isnull(ls_depto) then
	if ll_folio_ini>ll_folio_fin then
		messagebox("Advertencia","Rango de Folio Inválido")
		em_final.setfocus()
	else
		ll_tot_reg					= dw_lista.rowcount()
		ll_count						= dw_lista.Find("marca = 0", 1, dw_lista.RowCount())
		if ll_count>0 then
			if not isnull(gs_usuario_entregar) and gs_usuario_entregar<>'' then
				if ls_depto='P' and ls_base<>'S' then
					ll_resp	= MessageBox("Advertencia", "Recuerde será Asignado al Depto. Atención Cliente, se actualizará a (Serie=R, Agente=CA, Superv.=CS y Jefe Vta=CJ)", Exclamation!, YesNo!, 2)
					if ll_resp = 1 then
						ll_sw_pasa	= 0
					else
						ll_sw_pasa ++
					end if
				end if
				if ll_sw_pasa=0 then
					ls_filtro					= 'marca = 0'
					dw_lista.SETfilter(ls_filtro)
					dw_lista.filter()
					ll_tot_reg				= dw_lista.rowcount()
					ls_depto					= dw_tipo_contrato.getitemstring(1,'depto')
					SELECT 	"CD_CODIGO_DEPTO"."DESCRIPCION"  
					INTO 		:ls_descrip_depto  
					FROM 	"CD_CODIGO_DEPTO"  
					WHERE 	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto   
					USING		sqlca;
					for ll_indi=1 to ll_tot_reg
						SELECT	sysdate
						INTO 		:ldt_fecha
						FROM 	"TASA"  ;
						gdt_fec_sistema	= ldt_fecha
						ll_marca	= dw_lista.getitemnumber(ll_indi,'marca')
						if ll_marca=0 then
							ls_base			= dw_lista.getitemstring(ll_indi,'base')
							ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
							ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
							ll_estado_cd		= dw_lista.getitemnumber(ll_indi,'ult_estado')
							ls_memo			= dw_lista.getitemstring(ll_indi,'ult_memo')
							ls_ref_memo	= dw_lista.getitemstring(ll_indi,'ult_referencia_memo')
							dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
							dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
							dw_lista.setitem(ll_indi,'depto_asignado',ls_depto)
							dw_lista.setitem(ll_indi,'usuario_entregar_form',gs_usuario_entregar)
							if ls_depto='P' then
								if gs_conexion	= "Parque La Foresta" then
									dw_lista.setitem(ll_indi,'cod_agente','302')
									dw_lista.setitem(ll_indi,'cod_supervisor','099')
									dw_lista.setitem(ll_indi,'cod_jefe_venta','CJ')
								else
									dw_lista.setitem(ll_indi,'cod_agente','CA')
									dw_lista.setitem(ll_indi,'cod_supervisor','CS')
									dw_lista.setitem(ll_indi,'cod_jefe_venta','CJ')
									
								end if
								if ls_base='S' then
									ls_serie		= 'P'
								else
									if ls_base='L' then
//										ls_serie	= 'L'
									else
										ls_serie	= 'R'
									end if
								end if
								dw_lista.setitem(ll_indi,'serie',ls_serie)
							end if
							if ls_base='L' and ls_serie='R' then
								ll_estado_cd			= 9
								if isnull(ls_memo) then ls_memo='-'
								if isnull(ls_ref_memo) then ls_ref_memo='-'
								ls_glosa_cd			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ACEPTA CONTRATO Y ENTREGA A DIGITACION, POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
								INSERT INTO "CD_FOLIO_DETALLE"  
										( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   		"FECHA_ESTADO",   "GLOSA",   		"MEMO",		"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM" )  
								VALUES 
										( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   				:ll_estado_cd, 	:ldt_fecha,   			:ls_glosa_cd,	:ls_memo,	:ls_ref_memo,				:gs_usuario_entregar ) 
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
									
									UPDATE 	"CD_FOLIO"  
									SET 		"ULT_ESTADO" = :ll_estado_cd,   
												"ULT_FECHA_ESTADO" = :gdt_fec_sistema,   
												"ULT_GLOSA_ESTADO" = :ls_glosa_cd  
									WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
												( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
												( "CD_FOLIO"."NUMERO" = :ll_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit using sqlca;
									else
										rollback using sqlca;
									end if	
								else
									rollback using sqlca;
								end if

							else
								SELECT	"ENCARGADOS"."NOMBRE"  
								INTO 		:ls_nombre_entregar  
								FROM 	"ENCARGADOS"  
								WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
								USING	sqlca;
								ls_glosa			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ENTREGA AL DEPTO.: '+ls_descrip_depto+' A '+ ls_nombre_entregar +', POR '+gs_user+': '+gs_nombre_usuario+' EL '+string(date(gdt_fec_sistema),"dd/mm/yyyy")
								dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa)
								UPDATE	"CD_FOLIO_DETALLE"  
								SET 		"SERIE" = :ls_serie  
								WHERE  ( "CD_FOLIO_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CD_FOLIO_DETALLE"."NUMERO" = :ll_numero )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
									ll_cod_parque									= 0
									INSERT INTO "CD_FOLIO_DETALLE"  
												( "BASE",   	"SERIE",	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",	"ESTADO",		"FECHA_ESTADO",	"GLOSA",   	"MEMO",		"USUARIO_ENTREGAR_FORM",	"COD_PARQUE")  
									VALUES	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,   			:ll_estado_cd,	:ldt_fecha,   		:ls_glosa,	:ls_memo,	:gs_usuario_entregar,			:ll_cod_parque )  
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit using sqlca;
									else
										rollback using sqlca;
									end if
								else
									rollback using sqlca;
								end if
								
							end if
						end if
					next
					dw_lista.accepttext()
					ls_filtro			= ''
					dw_lista.SETfilter(ls_filtro)
					dw_lista.filter()
					if dw_lista.update()=1 then
						commit using sqlca;
						messagebox("GRABAR","Grabación Exitosa")
						cb_limpiar.triggerevent(clicked!)
					else
						rollback using sqlca;
						messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Usuario a Entregar Documentos")
				cb_entragar_a.setfocus()
			end if
		else
			ls_filtro				= ''
			dw_lista.SETfilter(ls_filtro)
			dw_lista.filter()
			Messagebox("Advertencia","No Registra Folio Marcado para Entrega")
			dw_lista.setfocus()
		end if
	end if
end if
SetPointer(Arrow!)
end event

type em_final from editmask within w_cd_entrega_de_folios_a_departamento
integer x = 2263
integer y = 244
integer width = 558
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
string mask = "###,###,###,###"
boolean spin = true
end type

event modified;Double		ll_folio_ini,ll_folio_fin
String			ls_base,ls_depto
ls_base			= dw_tipo_contrato.getitemstring(1,'base')
ls_depto			= dw_tipo_contrato.getitemstring(1,'depto')
ll_folio_ini		= Double(em_inicial.text)
ll_folio_fin		= Double(em_final.text)
if ll_folio_ini>ll_folio_fin then
	if ll_folio_ini>0 and ll_folio_fin>0 then
		messagebox("Advertencia","Rango Inválido")
		em_final.text	= ''
		em_final.setfocus()
	end if
else
	if ll_folio_ini>0 and ll_folio_fin>0 then
		if cbx_todo.checked=true then
			if not isnull(ls_base) and not isnull(ls_depto) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
		else
			if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
		end if	
	end if
end if
end event

type st_2 from statictext within w_cd_entrega_de_folios_a_departamento
integer x = 2053
integer y = 264
integer width = 160
integer height = 68
integer textsize = -10
integer weight = 400
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

type em_inicial from editmask within w_cd_entrega_de_folios_a_departamento
integer x = 2263
integer y = 112
integer width = 558
integer height = 100
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
string mask = "###,###,###,###"
boolean spin = true
end type

event modified;Double		ll_folio_ini,ll_folio_fin
String			ls_base,ls_depto
ls_base			= dw_tipo_contrato.getitemstring(1,'base')
ls_depto			= dw_tipo_contrato.getitemstring(1,'depto')
ll_folio_ini		= Double(em_inicial.text)
ll_folio_fin		= Double(em_final.text)
if ll_folio_ini>ll_folio_fin then
	if ll_folio_ini>0 and ll_folio_fin>0 then
		messagebox("Advertencia","Rango Inválido")
		em_inicial.text	= ''
		em_inicial.setfocus()
	end if
else
	if ll_folio_ini>0 and ll_folio_fin>0 then
		if cbx_todo.checked=true then
			if not isnull(ls_base) and not isnull(ls_depto) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
		else
			if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
		end if	
	end if
end if
end event

type st_1 from statictext within w_cd_entrega_de_folios_a_departamento
integer x = 2030
integer y = 128
integer width = 183
integer height = 68
integer textsize = -10
integer weight = 400
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

type dw_tipo_contrato from datawindow within w_cd_entrega_de_folios_a_departamento
integer x = 59
integer y = 104
integer width = 1911
integer height = 284
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_contrato_asigna_depto_cd"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base,ls_depto,ls_nulo,ls_serie,ls_descrip
Long		ll_cod_parque,ll_nulo
Double	ll_folio_ini,ll_folio_fin

Setnull(ls_nulo);setnull(ll_nulo)
dw_tipo_contrato.accepttext()
ls_columna								= dwo.name
dw_lista.reset()
if ls_columna='depto' then
	dw_tipo_contrato.setitem(1,'parque',ll_nulo)
	dw_tipo_contrato.setitem(1,'base',ls_nulo)
	dw_tipo_contrato.setitem(1,'serie',ls_nulo)
	dw_tipo_contrato.accepttext()
	idw_detalle3.retrieve()
	idw_detalle4.retrieve()
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	if not isnull(ls_base) and ls_base<>'' then
		idw_detalle5.retrieve(ls_base,ll_cod_parque)
	end if
elseif ls_columna='parque' then
	dw_tipo_contrato.setitem(1,'base',ls_nulo)
	dw_tipo_contrato.setitem(1,'serie',ls_nulo)
	dw_tipo_contrato.accepttext()
	idw_detalle4.retrieve()
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	if not isnull(ls_base) and ls_base<>'' then
		idw_detalle5.retrieve(ls_base,ll_cod_parque)
	end if
elseif ls_columna='base' then
	dw_tipo_contrato.setitem(1,'serie',ls_nulo)
	dw_tipo_contrato.accepttext()
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	if not isnull(ls_base) and ls_base<>'' then
		idw_detalle5.retrieve(ls_base,ll_cod_parque)
	end if
elseif ls_columna='serie' then
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
		SELECT	"CD_CODIGO_DEPTO"."DESCRIPCION"
		INTO		:ls_descrip
    		FROM		"CD_CODIGO_DEPTO"  
   		WHERE	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto
		USING	sqlca;
		if ls_depto='P' and ls_serie<>'R' and ls_base <> 'L' then
			messagebox("Advertencia",'Depto. '+ls_descrip+' No Puede Generar Serie Distinta de "R - Reprogramaciones"')
			dw_tipo_contrato.setitem(1,'serie',ls_nulo)
			dw_tipo_contrato.setfocus()
			dw_tipo_contrato.setcolumn('serie')
		elseif ls_depto<>'P' and ls_serie='R' and ls_base <> 'L' then
			messagebox("Advertencia",'Depto. '+ls_descrip+' No Puede Generar Serie "R - Reprogramaciones"')
			dw_tipo_contrato.setitem(1,'serie',ls_nulo)
			dw_tipo_contrato.setfocus()
			dw_tipo_contrato.setcolumn('serie')
		end if
		dw_tipo_contrato.accepttext()
	end if
end if
dw_tipo_contrato.accepttext()
ls_depto									= dw_tipo_contrato.getitemstring(1,'depto')
ll_cod_parque							=  dw_tipo_contrato.getitemnumber(1,'parque')
ls_base									= dw_tipo_contrato.getitemstring(1,'base')
ls_depto									= dw_tipo_contrato.getitemstring(1,'depto')
ll_folio_ini								= Double(em_inicial.text)
ll_folio_fin								= Double(em_final.text)
if cbx_todo.checked=true then
	if not isnull(ls_base) and not isnull(ls_depto) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
else
	if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 then cb_procesar.triggerevent(clicked!)
end if
end event

event itemfocuschanged;string	ls_nulo,ls_columna,ls_base,ls_serie,ls_descrip,ls_depto

Setnull(ls_nulo)
dw_tipo_contrato.accepttext()
ls_columna								= dwo.name
if ls_columna='serie' then
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
		if ls_depto='P' and ls_serie<>'R' then
			dw_tipo_contrato.setitem(1,'serie',ls_nulo)
		elseif ls_depto<>'P' and ls_serie='R' then
			dw_tipo_contrato.setitem(1,'serie',ls_nulo)
		end if
		dw_tipo_contrato.accepttext()
	end if
end if
end event

type cb_cerrar from commandbutton within w_cd_entrega_de_folios_a_departamento
integer x = 3113
integer y = 1824
integer width = 315
integer height = 104
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_entrega_de_folios_a_departamento)
end event

type dw_lista from datawindow within w_cd_entrega_de_folios_a_departamento
integer x = 41
integer y = 512
integer width = 3387
integer height = 1276
integer taborder = 60
string dataobject = "dw_lista_estado_entregado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna,ls_depto,ls_serie_tipo,ls_serie_aux,ls_base_aux
Long		ll_marca,ll_estado_cd
Double	ll_numero_aux

This.accepttext()
ls_columna	= dwo.name
if row > 0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_depto				= dw_tipo_contrato.getitemstring(1,'depto')
	ll_estado_cd		= dw_lista.getitemnumber(il_row,'ult_estado')
	ll_marca				= dw_lista.getitemnumber(il_row,'marca')
	ls_serie_tipo		= dw_tipo_contrato.getitemstring(1,'serie')
	if ls_columna='marca' then
		if ll_estado_cd=0 or (ll_marca=0 and (ll_estado_cd=1 or ll_estado_cd=6 or ll_estado_cd=20)) then
			if ll_marca=0 then
				this.setitem(il_row,'ult_estado',0)
				ls_base_aux		= dw_lista.getitemstring(il_row,'base')
				ll_numero_aux	= dw_lista.getitemnumber(il_row,'numero')
				SELECT	"CD_FOLIO"."SERIE"  
				INTO 		:ls_serie_aux  
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = :ls_base_aux ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero_aux )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(il_row,'serie',ls_serie_aux)
				end if
			elseif ll_marca=1 then
				if ls_depto='V' then
					dw_lista.setitem(il_row,'ult_estado',1)
				elseif ls_depto='P' then
					dw_lista.setitem(il_row,'ult_estado',6)
				elseif ls_depto='T' then
					dw_lista.setitem(il_row,'ult_estado',20)
				end if
				if not isnull(ls_serie_tipo) then dw_lista.setitem(il_row,'serie',ls_serie_tipo)
			end if
			dw_lista.accepttext()
		else
			dw_lista.setitem(il_row,'marca',0)
		end if
	end if
	dw_lista.accepttext()
end if
if ls_columna='t_rojo' or ls_columna='t_rojo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'N'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'I'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_blanco' or ls_columna='t_blanco_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'N'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_amarillo' or ls_columna='t_amarillo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'N'+"'" then
		is_filtro	= "estado_reg="+"'"+'A'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;String		ls_columna,ls_depto,ls_base_aux,ls_serie_aux,ls_serie_tipo
Long		ll_marca,ll_estado_cd
Double	ll_numero_aux

This.accepttext()
ls_columna	= dwo.name
if row > 0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_depto				= dw_tipo_contrato.getitemstring(1,'depto')
	ll_estado_cd		= dw_lista.getitemnumber(il_row,'ult_estado')
	ll_marca				= dw_lista.getitemnumber(il_row,'marca')
	ls_serie_tipo		= dw_tipo_contrato.getitemstring(1,'serie')
	if ls_columna='marca' then
		if ll_estado_cd=0 or (ll_marca=0 and (ll_estado_cd=1 or ll_estado_cd=6 or ll_estado_cd=20)) then
			if ll_marca=0 then
				this.setitem(il_row,'ult_estado',0)
				ls_base_aux		= dw_lista.getitemstring(il_row,'base')
				ll_numero_aux	= dw_lista.getitemnumber(il_row,'numero')
				SELECT	"CD_FOLIO"."SERIE"  
				INTO 		:ls_serie_aux  
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = :ls_base_aux ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero_aux )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(il_row,'serie',ls_serie_aux)
				end if
			elseif ll_marca=1 then
				if ls_depto='V' then
					dw_lista.setitem(il_row,'ult_estado',1)
				elseif ls_depto='P' then
					dw_lista.setitem(il_row,'ult_estado',6)
				elseif ls_depto='T' then
					dw_lista.setitem(il_row,'ult_estado',20)
				end if
				if not isnull(ls_serie_tipo) then dw_lista.setitem(il_row,'serie',ls_serie_tipo)
			end if
			dw_lista.accepttext()
		else
			dw_lista.setitem(il_row,'marca',0)
		end if
	end if
	dw_lista.accepttext()
end if
if ls_columna='t_rojo' or ls_columna='t_rojo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'N'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'I'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_blanco' or ls_columna='t_blanco_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'N'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_amarillo' or ls_columna='t_amarillo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'N'+"'" then
		is_filtro	= "estado_reg="+"'"+'A'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
end event

type gb_1 from groupbox within w_cd_entrega_de_folios_a_departamento
integer x = 41
integer y = 16
integer width = 1952
integer height = 380
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar Contrato y Departamento"
end type

type gb_3 from groupbox within w_cd_entrega_de_folios_a_departamento
integer x = 1559
integer y = 1784
integer width = 823
integer height = 164
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_cd_entrega_de_folios_a_departamento
integer x = 2898
integer y = 20
integer width = 535
integer height = 228
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Marcar Item"
end type

type gb_2 from groupbox within w_cd_entrega_de_folios_a_departamento
integer x = 2011
integer y = 16
integer width = 864
integer height = 380
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Folio a Generar"
end type

