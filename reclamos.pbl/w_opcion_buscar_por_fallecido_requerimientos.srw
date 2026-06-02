forward
global type w_opcion_buscar_por_fallecido_requerimientos from window
end type
type cb_5 from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type dw_sepultura from datawindow within w_opcion_buscar_por_fallecido_requerimientos
end type
type rb_por_sepultura from radiobutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type rb_por_fallecido from radiobutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_imprimir from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_exportar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_filtrar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_ordenar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_limpiar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type dw_parque from datawindow within w_opcion_buscar_por_fallecido_requerimientos
end type
type pb_ok from picturebutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cbx_ap_mat from checkbox within w_opcion_buscar_por_fallecido_requerimientos
end type
type em_ap_mat from editmask within w_opcion_buscar_por_fallecido_requerimientos
end type
type st_ap_mat from statictext within w_opcion_buscar_por_fallecido_requerimientos
end type
type cbx_ap_pat from checkbox within w_opcion_buscar_por_fallecido_requerimientos
end type
type em_ap_pat from editmask within w_opcion_buscar_por_fallecido_requerimientos
end type
type st_ap_pat from statictext within w_opcion_buscar_por_fallecido_requerimientos
end type
type cbx_nombre from checkbox within w_opcion_buscar_por_fallecido_requerimientos
end type
type em_nombre from editmask within w_opcion_buscar_por_fallecido_requerimientos
end type
type st_nombre from statictext within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_aceptar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type cb_cerrar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
end type
type dw_lista from datawindow within w_opcion_buscar_por_fallecido_requerimientos
end type
type gb_2 from groupbox within w_opcion_buscar_por_fallecido_requerimientos
end type
type gb_3 from groupbox within w_opcion_buscar_por_fallecido_requerimientos
end type
end forward

global type w_opcion_buscar_por_fallecido_requerimientos from window
integer width = 4242
integer height = 1796
boolean titlebar = true
string title = "Buscar Fallecido"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
dw_sepultura dw_sepultura
rb_por_sepultura rb_por_sepultura
rb_por_fallecido rb_por_fallecido
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
dw_parque dw_parque
pb_ok pb_ok
cbx_ap_mat cbx_ap_mat
em_ap_mat em_ap_mat
st_ap_mat st_ap_mat
cbx_ap_pat cbx_ap_pat
em_ap_pat em_ap_pat
st_ap_pat st_ap_pat
cbx_nombre cbx_nombre
em_nombre em_nombre
st_nombre st_nombre
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
gb_3 gb_3
end type
global w_opcion_buscar_por_fallecido_requerimientos w_opcion_buscar_por_fallecido_requerimientos

type variables
Datawindow	idw_detalle6
end variables

on w_opcion_buscar_por_fallecido_requerimientos.create
this.cb_5=create cb_5
this.dw_sepultura=create dw_sepultura
this.rb_por_sepultura=create rb_por_sepultura
this.rb_por_fallecido=create rb_por_fallecido
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.dw_parque=create dw_parque
this.pb_ok=create pb_ok
this.cbx_ap_mat=create cbx_ap_mat
this.em_ap_mat=create em_ap_mat
this.st_ap_mat=create st_ap_mat
this.cbx_ap_pat=create cbx_ap_pat
this.em_ap_pat=create em_ap_pat
this.st_ap_pat=create st_ap_pat
this.cbx_nombre=create cbx_nombre
this.em_nombre=create em_nombre
this.st_nombre=create st_nombre
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_5,&
this.dw_sepultura,&
this.rb_por_sepultura,&
this.rb_por_fallecido,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_limpiar,&
this.dw_parque,&
this.pb_ok,&
this.cbx_ap_mat,&
this.em_ap_mat,&
this.st_ap_mat,&
this.cbx_ap_pat,&
this.em_ap_pat,&
this.st_ap_pat,&
this.cbx_nombre,&
this.em_nombre,&
this.st_nombre,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2,&
this.gb_3}
end on

on w_opcion_buscar_por_fallecido_requerimientos.destroy
destroy(this.cb_5)
destroy(this.dw_sepultura)
destroy(this.rb_por_sepultura)
destroy(this.rb_por_fallecido)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.dw_parque)
destroy(this.pb_ok)
destroy(this.cbx_ap_mat)
destroy(this.em_ap_mat)
destroy(this.st_ap_mat)
destroy(this.cbx_ap_pat)
destroy(this.em_ap_pat)
destroy(this.st_ap_pat)
destroy(this.cbx_nombre)
destroy(this.em_nombre)
destroy(this.st_nombre)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;Long		ll_new,ll_cod_parque

gf_centrar(w_opcion_buscar_por_fallecido_requerimientos)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
ll_new			= dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_cod_parque				= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_cod_parque				= 801
end if
if isvalid(w_ingreso_reclamo) then
	dw_parque.setitem(ll_new,'parque',ll_cod_parque)	//w_ingreso_reclamo.dw_ingreso.getitemnumber(1,'cod_parque'))
elseif isvalid(w_ver_todos_reclamos) then
	dw_parque.setitem(ll_new,'parque',ll_cod_parque)	//w_ver_todos_reclamos.dw_parque.getitemnumber(1,'parque'))
end if
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
if ll_cod_parque > 0 then
	dw_sepultura.getchild('sector',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(ll_cod_parque)
	
	dw_sepultura.getchild('sepultura',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.insertrow(0)
else 
	dw_sepultura.getchild('sector',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.insertrow(0)
	
	dw_sepultura.getchild('sepultura',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	
	if idw_detalle2.retrieve(ll_cod_parque,'A1') = 0 then 	idw_detalle2.insertrow(0)
end if
dw_sepultura.settransobject(sqlca)
dw_sepultura.insertrow(0)
dw_sepultura.enabled		= false
em_nombre.enabled			= true
cbx_nombre.enabled			= true
em_ap_pat.enabled			= true
cbx_ap_pat.enabled			= true
em_ap_mat.enabled			= true
cbx_ap_mat.enabled			= true
end event

type cb_5 from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 448
integer y = 1532
integer width = 448
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Long		ll_fila
String	ls_ctto

Setnull(gs_base);Setnull(gs_serie);Setnull(gi_numero);Setnull(gi_rut)
ll_fila				= dw_lista.getrow()
if ll_fila>0 and dw_lista.rowcount()>0 then
	gi_numero	= dw_lista.getitemnumber(ll_fila,'contrato')
	gs_serie		= dw_lista.getitemstring(ll_fila,'ss')
	gs_base		= dw_lista.getitemstring(ll_fila,'base')
	SELECT 	"CADENA"."RUT"  
	INTO 		:gi_rut  
	FROM 	"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
				( "CADENA"."NUMERO" = :gi_numero )   ;

	if ll_fila > 0 and not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
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
end if
end event

type dw_sepultura from datawindow within w_opcion_buscar_por_fallecido_requerimientos
integer x = 2898
integer y = 104
integer width = 795
integer height = 188
integer taborder = 50
string title = "none"
string dataobject = "dwe_seleccionar_sector_sepultura_por_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_sector,ls_sepulura, ls_columna
Long		ll_cod_parque

this.accepttext()
dw_parque.accepttext()
ls_columna		= dwo.name
ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
if ll_cod_parque > 0 then
	if ls_columna='sector' then
		ls_sector	= dw_sepultura.getitemstring(1,'sector')
		idw_detalle2.retrieve(ll_cod_parque,ls_sector)
	end if
else
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
end if
end event

type rb_por_sepultura from radiobutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 2866
integer y = 16
integer width = 635
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Sepultura"
end type

event clicked;dw_lista.reset()
if rb_por_sepultura.checked=true then
	em_nombre.text				= ''
	em_ap_pat.text					= ''
	em_ap_mat.text				= ''
	cbx_nombre.checked			= false
	cbx_ap_pat.checked			= false
	cbx_ap_mat.checked			= false
	dw_sepultura.enabled		= true
	em_nombre.enabled			= false
	cbx_nombre.enabled			= false
	em_ap_pat.enabled			= false
	cbx_ap_pat.enabled			= false
	em_ap_mat.enabled			= false
	cbx_ap_mat.enabled			= false
end if
end event

type rb_por_fallecido from radiobutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 809
integer y = 16
integer width = 603
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por fallecido"
boolean checked = true
end type

event clicked;Long		ll_cod_parque

dw_lista.reset()
if rb_por_fallecido.checked=true then
	ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
	if ll_cod_parque > 0 then
		dw_sepultura.getchild('sector',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ll_cod_parque)
		
		dw_sepultura.getchild('sepultura',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.insertrow(0)
	else 
		dw_sepultura.getchild('sector',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.insertrow(0)
		
		dw_sepultura.getchild('sepultura',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.insertrow(0)
	end if
	dw_sepultura.reset()
	dw_sepultura.insertrow(0)
	dw_sepultura.enabled		= false
	em_nombre.enabled			= true
	cbx_nombre.enabled			= true
	em_ap_pat.enabled			= true
	cbx_ap_pat.enabled			= true
	em_ap_mat.enabled			= true
	cbx_ap_mat.enabled			= true
end if
end event

type cb_imprimir from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
event ue_mousemove pbm_mousemove
integer x = 1719
integer y = 1544
integer width = 229
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
event ue_mousemove pbm_mousemove
integer x = 1467
integer y = 1544
integer width = 229
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
event ue_mousemove pbm_mousemove
integer x = 1239
integer y = 1544
integer width = 229
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string 	ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
event ue_mousemove pbm_dwnmousemove
integer x = 1006
integer y = 1544
integer width = 229
integer height = 80
integer taborder = 100
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

type cb_limpiar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 2501
integer y = 1532
integer width = 311
integer height = 104
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_cod_parque

ll_cod_parque			= dw_parque.getitemnumber(1,'parque')
em_nombre.text		= ''
em_ap_pat.text			= ''
em_ap_mat.text		= ''
cbx_nombre.checked	= false
cbx_ap_pat.checked	= false
cbx_ap_mat.checked	= false
dw_lista.reset()
if ll_cod_parque > 0 then
	dw_sepultura.getchild('sector',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(ll_cod_parque)
	
	dw_sepultura.getchild('sepultura',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.insertrow(0)
else 
	dw_sepultura.getchild('sector',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.insertrow(0)
	
	dw_sepultura.getchild('sepultura',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.insertrow(0)
end if
dw_sepultura.reset()
dw_sepultura.insertrow(0)
end event

type dw_parque from datawindow within w_opcion_buscar_por_fallecido_requerimientos
integer x = 41
integer y = 100
integer width = 622
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "ddw_lista_nuestros_parques_buscar_fallecido"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long		ll_cod_parque

dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
idw_detalle.retrieve(ll_cod_parque)
dw_lista.reset()
end event

type pb_ok from picturebutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 3931
integer y = 64
integer width = 178
integer height = 156
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_nom, ls_ap_pat, ls_ap_mat, ls_sector, ls_sepultura, ls_pasa='N'
Long		ll_cod_parque

if rb_por_fallecido.checked=true then
	ls_nom			= TRIM(em_nombre.text)
	ls_ap_pat		= TRIM(em_ap_pat.text)
	ls_ap_mat		= TRIM(em_ap_mat.text)
	ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
	if ls_nom='' then setnull(ls_nom)
	if ls_ap_pat='' then setnull(ls_ap_pat)
	if ls_ap_mat='' then setnull(ls_ap_mat)
	if isnull(ls_nom) and isnull(ls_ap_pat) and isnull(ls_ap_mat) then
		messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
		em_nombre.setfocus()
		ls_pasa		= 'N'
	elseif isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
		ls_pasa		= 'N'
	else
		ls_pasa		= 'S'
	end if
	if ls_pasa = 'S' then
		if not isnull(ls_nom) and isnull(ls_ap_pat) and isnull(ls_ap_mat) then //1
			dw_lista.dataobject	= 'dw_lista_busqueda_detalle_fallecidos_re1'
			dw_lista.settransobject(sqlca)
			if cbx_nombre.checked=true then ls_nom = ls_nom+'%'
			dw_lista.retrieve(ls_nom,ll_cod_parque)
		elseif not isnull(ls_nom) and not isnull(ls_ap_pat) and isnull(ls_ap_mat) then //2
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re2'
			dw_lista.settransobject(sqlca)
			if cbx_nombre.checked=true then ls_nom = ls_nom+'%'
			if cbx_ap_pat.checked=true then ls_ap_pat = ls_ap_pat+'%'
			dw_lista.retrieve(ls_nom,ls_ap_pat,ll_cod_parque)
		elseif not isnull(ls_nom) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then //3
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re3'
			dw_lista.settransobject(sqlca)
			if cbx_nombre.checked=true then ls_nom = ls_nom+'%'
			if cbx_ap_pat.checked=true then ls_ap_pat = ls_ap_pat+'%'
			if cbx_ap_mat.checked=true then ls_ap_mat = ls_ap_mat+'%'
			dw_lista.retrieve(ls_nom,ls_ap_pat,ls_ap_mat,ll_cod_parque)		
		elseif isnull(ls_nom) and not isnull(ls_ap_pat) and isnull(ls_ap_mat) then //4
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re4'
			dw_lista.settransobject(sqlca)
			if cbx_ap_pat.checked=true then ls_ap_pat = ls_ap_pat+'%'
			dw_lista.retrieve(ls_ap_pat,ll_cod_parque)		
		elseif isnull(ls_nom) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then //5
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re5'
			dw_lista.settransobject(sqlca)
			if cbx_ap_pat.checked=true then ls_ap_pat = ls_ap_pat+'%'
			if cbx_ap_mat.checked=true then ls_ap_mat = ls_ap_mat+'%'
			dw_lista.retrieve(ls_ap_pat,ls_ap_mat,ll_cod_parque)		
		elseif isnull(ls_nom) and  isnull(ls_ap_pat) and not isnull(ls_ap_mat) then //6
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re6'
			dw_lista.settransobject(sqlca)
			if cbx_ap_mat.checked=true then ls_ap_mat = ls_ap_mat+'%'
			dw_lista.retrieve(ls_ap_mat,ll_cod_parque)		
		elseif not isnull(ls_nom) and  isnull(ls_ap_pat) and not isnull(ls_ap_mat) then //7
			dw_lista.dataobject		= 'dw_lista_busqueda_detalle_fallecidos_re7'
			dw_lista.settransobject(sqlca)
			if cbx_nombre.checked=true then ls_nom = ls_nom+'%'
			if cbx_ap_mat.checked=true then ls_ap_mat = ls_ap_mat+'%'
			dw_lista.retrieve(ls_nom,ls_ap_mat,ll_cod_parque)		
		elseif isnull(ls_nom) and  isnull(ls_ap_pat) and isnull(ls_ap_mat) then
			messagebox("Advertencia","Debe ingresar Fallecido a Buscar")
			em_nombre.setfocus()
		end if
	end if
elseif rb_por_sepultura.checked=true then
	ls_sector			= dw_sepultura.getitemstring(1,'sector')
	ls_sepultura		= dw_sepultura.getitemstring(1,'sepultura')
	ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
	if ls_sector='' then setnull(ls_sector)
	if ls_sepultura='' then setnull(ls_sepultura)
	if isnull(ls_sector)  then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_sepultura.setfocus()
		dw_sepultura.setcolumn('sector')
		ls_pasa		= 'N'
	elseif isnull(ls_sepultura)  then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_sepultura.setfocus()
		dw_sepultura.setcolumn('sepultura')
		ls_pasa		= 'N'
	elseif isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
		ls_pasa		= 'N'
	else
		ls_pasa		= 'S'
	end if
	if ls_pasa = 'S' then
//		if not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ll_cod_parque) then
			dw_lista.dataobject	= 'dw_lista_busqueda_detalle_fallecidos_sep'
			dw_lista.settransobject(sqlca)
			dw_lista.retrieve(ll_cod_parque,ls_sector,ls_sepultura)
//		end if
	end if
end if
end event

type cbx_ap_mat from checkbox within w_opcion_buscar_por_fallecido_requerimientos
integer x = 1623
integer y = 196
integer width = 174
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " %"
end type

type em_ap_mat from editmask within w_opcion_buscar_por_fallecido_requerimientos
integer x = 1106
integer y = 196
integer width = 507
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

type st_ap_mat from statictext within w_opcion_buscar_por_fallecido_requerimientos
integer x = 741
integer y = 204
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap. Materno:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_ap_pat from checkbox within w_opcion_buscar_por_fallecido_requerimientos
integer x = 2542
integer y = 104
integer width = 174
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " %"
end type

type em_ap_pat from editmask within w_opcion_buscar_por_fallecido_requerimientos
integer x = 2117
integer y = 108
integer width = 411
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

type st_ap_pat from statictext within w_opcion_buscar_por_fallecido_requerimientos
integer x = 1792
integer y = 116
integer width = 302
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap. Paterno:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_nombre from checkbox within w_opcion_buscar_por_fallecido_requerimientos
integer x = 1623
integer y = 108
integer width = 174
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " %"
end type

type em_nombre from editmask within w_opcion_buscar_por_fallecido_requerimientos
integer x = 1106
integer y = 108
integer width = 507
integer height = 76
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

type st_nombre from statictext within w_opcion_buscar_por_fallecido_requerimientos
integer x = 768
integer y = 116
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 32
integer y = 1532
integer width = 311
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila,ll_rut,ll_cod_parque,ll_estado
String		ls_base,ls_serie,ls_sector,ls_sepultura,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_estado,ls_descrip,ls_area,ls_codigo_sol,ls_depto,ls_cod_reclamo,&
			ls_cod_gerencia
Double	ll_numero

ll_fila					= dw_lista.getrow()
if ll_fila > 0 then
	ls_base			= dw_lista.getitemstring(ll_fila,'base')
	ls_serie			= dw_lista.getitemstring(ll_fila,'ss')
	ll_numero		= dw_lista.getitemnumber(ll_fila,'contrato')
	ls_sector			= dw_lista.getitemstring(ll_fila,'sector')
	ls_sepultura		= dw_lista.getitemstring(ll_fila,'n_sep')
	ls_nom_fall		= dw_lista.getitemstring(ll_fila,'nombres')
	ls_ap_pat_fall	= dw_lista.getitemstring(ll_fila,'ap_paterno')
	ls_ap_mat_fall	= dw_lista.getitemstring(ll_fila,'ap_materno')
	
	if isvalid(w_ingreso_reclamo) then
		w_ingreso_reclamo.dw_ingreso.accepttext()
		ls_cod_reclamo	= w_ingreso_reclamo.dw_ingreso.getitemstring(1,'codigo_solicitud')
		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_DEPTO",		"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"   
		INTO 		:ls_depto ,													:ls_cod_gerencia
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_reclamo   ;

		w_ingreso_reclamo.dw_ingreso.setitem(1,'base',ls_base)
		w_ingreso_reclamo.dw_ingreso.setitem(1,'serie',ls_serie)
		w_ingreso_reclamo.dw_ingreso.setitem(1,'numero',ll_numero)
	//	w_ingreso_reclamo.dw_ingreso.getchild('serie',idw_detalle6)  // base
	//	idw_detalle6.settransobject(sqlca)
	//	if not isnull(ls_base) then idw_detalle6.retrieve(ls_base)
		if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
			SELECT		"CADENA"."ESTADO" ,
							"CADENA"."RUT",
							"CADENA"."COD_PARQUE"
			INTO 			:ls_estado,
							:ll_rut,
							:ll_cod_parque
			FROM 		"CADENA"  
			WHERE 	  ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero )  
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				SELECT 		"CD_FOLIO"."ULT_ESTADO"  
				INTO 			:ll_estado  
				FROM 		"CD_FOLIO"  
				WHERE 	  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
							  ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							  ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","No Existe Nº Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,##0'))
				end if
			else
				SELECT	"ESTADO"."NOMBRE_ESTADO"  
				INTO		:ls_descrip  
				FROM		"ESTADO"  
				WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
				ls_estado								= 'Estado Contrato:  '+ls_descrip
				w_ingreso_reclamo.dw_ingreso.object.t_estado.text	= ls_estado
				if ls_base='O' then
					SELECT 		"PAGO_OFERTA"."AREA", 	"PAGO_OFERTA"."SECTOR", 	"PAGO_OFERTA"."SEPULTURA"  
					INTO 			:ls_area, 						:ls_sector,  							:ls_sepultura  
					FROM 		"OFERTA_V", 	"CADENA", 	"PAGO_OFERTA"  
					WHERE 	  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								  ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
								  ( "CADENA"."SERIE" = :ls_serie ) AND  
								  ( "CADENA"."NUMERO" = :ll_numero ) )  
					USING		sqlca;
				elseif ls_base='C' then
					SELECT	"CONTRATO"."ZONA", 	"CONTRATO"."SECTOR",  	"CONTRATO"."SEPULTURA"  
					INTO 		:ls_area,   					:ls_sector,   					:ls_sepultura  
					FROM 	"CADENA",  	"CONTRATO"  
					WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
							  ( "CADENA"."SERIE" = :ls_serie ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero ) )  
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					idw_detalle.retrieve(ll_cod_parque)
					idw_detalle2.retrieve(ll_cod_parque,ls_sector)
					idw_detalle3.retrieve(ll_cod_parque,ls_sector)
					w_ingreso_reclamo.dw_ingreso.setitem(1,'area',ls_area)
					w_ingreso_reclamo.dw_ingreso.setitem(1,'sector',ls_sector)
					w_ingreso_reclamo.dw_ingreso.setitem(1,'sepultura',ls_sepultura)
				end if
				if ls_depto <> 'Q' then 
					ll_cod_parque			= 9999
//					SELECT DISTINCT "ENCARGADOS"."RECLAMO_COG_GEREN"  
//					INTO 		:ls_cod_gerencia  
//					FROM 	"ENCARGADOS"  
//					WHERE 	"ENCARGADOS"."DEPTO" = :ls_depto  ;
				else
					ls_cod_gerencia		= 'GQ'
				end if
				idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia)
				w_ingreso_reclamo.dw_ingreso.setitem(1,'rut_titular',ll_rut)
				ls_codigo_sol		= w_ingreso_reclamo.dw_ingreso.getitemstring(1,'codigo_solicitud')
				if ls_codigo_sol <> '5' then ll_cod_parque=9999
				w_ingreso_reclamo.dw_ingreso.setitem(1,'cod_parque',ll_cod_parque)
				w_ingreso_reclamo.dw_ingreso.setcolumn('depto_asig')
			end if
		end if
		w_ingreso_reclamo.dw_ingreso.accepttext()
		w_ingreso_reclamo.setfocus()
		close(w_opcion_buscar_por_fallecido_requerimientos)
	elseif isvalid(w_ver_todos_reclamos) then
		w_ver_todos_reclamos.dw_lista.accepttext()
		ll_fila			= w_ver_todos_reclamos.dw_lista.Find("sector ='"+ls_sector+"' and sepultura = '"+ls_sepultura+"'",1, w_ver_todos_reclamos.dw_lista.RowCount())
		if ll_fila > 0 then
			w_ver_todos_reclamos.dw_lista.scrolltorow(ll_fila)
			w_ver_todos_reclamos.dw_lista.setfocus()
			close(w_opcion_buscar_por_fallecido_requerimientos)
		else
			messagebox("Advertencia","No Existe Requerimiento en Rango Fecha Indicada")
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_opcion_buscar_por_fallecido_requerimientos
integer x = 3831
integer y = 1532
integer width = 306
integer height = 104
integer taborder = 150
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_opcion_buscar_por_fallecido_requerimientos)
end event

type dw_lista from datawindow within w_opcion_buscar_por_fallecido_requerimientos
integer x = 37
integer y = 296
integer width = 4101
integer height = 1204
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_busqueda_detalle_fallecidos_sep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_opcion_buscar_por_fallecido_requerimientos
integer x = 32
integer y = 24
integer width = 645
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar Parque"
end type

type gb_3 from groupbox within w_opcion_buscar_por_fallecido_requerimientos
event ue_mousemove pbm_mousemove
integer x = 983
integer y = 1496
integer width = 987
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

