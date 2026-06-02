forward
global type w_buscar_ficha_por_contrato from window
end type
type cb_4 from commandbutton within w_buscar_ficha_por_contrato
end type
type cb_2 from commandbutton within w_buscar_ficha_por_contrato
end type
type cb_3 from commandbutton within w_buscar_ficha_por_contrato
end type
type cb_imprimir from commandbutton within w_buscar_ficha_por_contrato
end type
type pb_ok from picturebutton within w_buscar_ficha_por_contrato
end type
type dp_fin from datepicker within w_buscar_ficha_por_contrato
end type
type st_2 from statictext within w_buscar_ficha_por_contrato
end type
type dp_inicio from datepicker within w_buscar_ficha_por_contrato
end type
type st_1 from statictext within w_buscar_ficha_por_contrato
end type
type cb_cerrar from commandbutton within w_buscar_ficha_por_contrato
end type
type cb_aceptar from commandbutton within w_buscar_ficha_por_contrato
end type
type gb_1 from groupbox within w_buscar_ficha_por_contrato
end type
type dw_lista from datawindow within w_buscar_ficha_por_contrato
end type
end forward

global type w_buscar_ficha_por_contrato from window
integer width = 3707
integer height = 1804
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
pb_ok pb_ok
dp_fin dp_fin
st_2 st_2
dp_inicio dp_inicio
st_1 st_1
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
gb_1 gb_1
dw_lista dw_lista
end type
global w_buscar_ficha_por_contrato w_buscar_ficha_por_contrato

type variables
String		is_base, is_serie
Double	il_numero,il_rut
Long		il_row
end variables

on w_buscar_ficha_por_contrato.create
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.pb_ok=create pb_ok
this.dp_fin=create dp_fin
this.st_2=create st_2
this.dp_inicio=create dp_inicio
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_4,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.pb_ok,&
this.dp_fin,&
this.st_2,&
this.dp_inicio,&
this.st_1,&
this.cb_cerrar,&
this.cb_aceptar,&
this.gb_1,&
this.dw_lista}
end on

on w_buscar_ficha_por_contrato.destroy
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.pb_ok)
destroy(this.dp_fin)
destroy(this.st_2)
destroy(this.dp_inicio)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;datetime		ldt_fec_ini,ldt_fec_fin
String			ls_opcion

gf_centrar(w_buscar_ficha_por_contrato)
is_base									= trim(substr(1,1,Message.StringParm))
is_serie									= trim(substr(1,2,Message.StringParm))
il_numero								= Double(substr(1,3,Message.StringParm))
il_rut										= Double(substr(1,4,Message.StringParm))
ls_opcion									= trim(substr(1,5,Message.StringParm))
if ls_opcion='N' then
	cb_aceptar.enabled				= false
else
	cb_aceptar.enabled				= true
end if
if il_rut = 0 then
	dw_lista.dataobject				= 'dw_lista_buscar_fichas_individual_ctto'
	dw_lista.settransobject(sqlca)
	this.title								= 'Listado Contrato '+is_base+'-'+is_serie+'-'+String(il_numero,'###,###,###,###,##0')
	dp_inicio.value						= datetime(relativedate(date(gdt_fec_sistema),-365))
	ldt_fec_ini							= datetime(date(dp_inicio.text),time('00:00:00'))
	ldt_fec_fin							= datetime(date(dp_fin.text),time('23:59:59'))
//	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(is_base, is_serie, il_numero)=0 then
		messagebox("Advertencia","No Registra Datos Asociado Contrato "+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###') )
		
		close(w_buscar_ficha_por_contrato)
	end if
elseif il_rut > 0 then
	dw_lista.dataobject				= 'dw_lista_buscar_fichas_individual_rut'
	dw_lista.settransobject(sqlca)
	this.title								= 'Listado Rut Titular '+String(il_rut,'###,###,###,###,##0')
	dp_inicio.value						= datetime(relativedate(date(gdt_fec_sistema),-365))
	ldt_fec_ini							= datetime(date(dp_inicio.text),time('00:00:00'))
	ldt_fec_fin							= datetime(date(dp_fin.text),time('23:59:59'))
//	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(il_rut)=0 then
		messagebox("Advertencia","No Registra Datos Asociado Rut Titular "+string(il_rut,'###,###,###,###,###') )
		
		close(w_buscar_ficha_por_contrato)
	end if
end if
end event

type cb_4 from commandbutton within w_buscar_ficha_por_contrato
integer x = 1243
integer y = 1576
integer width = 238
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_buscar_ficha_por_contrato
integer x = 1710
integer y = 1576
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)

end event

type cb_3 from commandbutton within w_buscar_ficha_por_contrato
integer x = 1486
integer y = 1576
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_buscar_ficha_por_contrato
integer x = 2117
integer y = 1576
integer width = 219
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom        	= 52
	f_printdlg(dw_lista,gstr_print,w_consultar_ficha)
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type pb_ok from picturebutton within w_buscar_ficha_por_contrato
boolean visible = false
integer x = 1659
integer y = 28
integer width = 155
integer height = 128
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime		ldt_fec_ini,ldt_fec_fin
Double		ll_rut
String			ls_nombre,ls_ap_pat

ldt_fec_ini		= datetime(date(dp_inicio.text),time('00:00:00'))
ldt_fec_fin		= datetime(date(dp_fin.text),time('23:59:59'))
if ldt_fec_ini > ldt_fec_fin then
	messagebox("Advertencia","Fecha Inicio NO debe ser Mayor a fecha Termino")
	dp_fin.setfocus()
elseif isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicio")
	dp_inicio.setfocus()
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Termino")
	dp_fin.setfocus()
else
	if dw_lista.retrieve(is_base, is_serie, il_numero, ldt_fec_ini, ldt_fec_fin)=0 then
		messagebox("Advertencia","Filtro Señalado No Registra Información")
	end if
end if
end event

type dp_fin from datepicker within w_buscar_ficha_por_contrato
boolean visible = false
integer x = 1074
integer y = 48
integer width = 448
integer height = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-10-22"), Time("12:50:08.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_2 from statictext within w_buscar_ficha_por_contrato
boolean visible = false
integer x = 891
integer y = 64
integer width = 155
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type dp_inicio from datepicker within w_buscar_ficha_por_contrato
boolean visible = false
integer x = 425
integer y = 48
integer width = 448
integer height = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-10-22"), Time("12:50:08.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_1 from statictext within w_buscar_ficha_por_contrato
boolean visible = false
integer x = 55
integer y = 68
integer width = 325
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_buscar_ficha_por_contrato
integer x = 3355
integer y = 1580
integer width = 279
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_ficha_por_contrato)
end event

type cb_aceptar from commandbutton within w_buscar_ficha_por_contrato
integer x = 59
integer y = 1580
integer width = 279
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Double	ll_folio,ll_cod_parque_ori,ll_numero
String		ls_base, ls_serie,ls_estado_ctto_actual,ls_desc_ctto,ls_nuevo

if il_row > 0 and il_numero > 0 and cb_aceptar.enabled=true then
	if isvalid(w_ficha_crematorio) then
		ll_folio															= dw_lista.getitemnumber(il_row,'fc_cabecera_folio_crematorio')
		if ll_folio > 0 then
			w_ficha_crematorio.rb_buscar_folio.checked		= true
			w_ficha_crematorio.rb_buscar_folio.triggerevent(clicked!)
			w_ficha_crematorio.em_folio.text						= string(ll_folio)
			w_ficha_crematorio.dw_ctto.setitem(1,'base',is_base)
			w_ficha_crematorio.dw_ctto.setitem(1,'serie',is_serie)
			w_ficha_crematorio.dw_ctto.setitem(1,'numero',il_numero)
			w_ficha_crematorio.dw_ctto.accepttext()
			w_ficha_crematorio.pb_aceptar.triggerevent(clicked!)
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setfocus()
			close(w_buscar_ficha_por_contrato)
		end if
	end if
elseif il_row > 0 and il_rut > 0 and cb_aceptar.enabled=true then
	if isvalid(w_ficha_crematorio) then
		ll_folio															= dw_lista.getitemnumber(il_row,'fc_cabecera_folio_crematorio')
		ls_base															= dw_lista.getitemstring(il_row,'cadena_codigo')
		ls_serie															= dw_lista.getitemstring(il_row,'cadena_serie')
		ll_numero														= dw_lista.getitemnumber(il_row,'cadena_numero')
		if w_ficha_crematorio.cb_nuevo.enabled = false and w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular') > 0 then
			ls_nuevo														= 'S'
		else
			ls_nuevo														= 'N'
		end if
		if ll_folio > 0 and ls_nuevo='S' then
			messagebox("Advertencia","Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+" ya tiene Ficha Cremación Asociada, no es Posible Asignarlo (Se Limpiara Ventana Ingreso Ficha)")
			w_ficha_crematorio.cb_limpiar.triggerevent(clicked!)
			close(w_buscar_ficha_por_contrato)
		else
			if ll_numero > 0 then
	//			w_ficha_crematorio.rb_buscar_folio.checked		= true
	//			w_ficha_crematorio.rb_buscar_folio.triggerevent(clicked!)
	//			w_ficha_crematorio.em_folio.text						= string(ll_folio)
				w_ficha_crematorio.rb_buscar_ctto.checked		= true
				w_ficha_crematorio.dw_ctto.setitem(1,'base',ls_base)
				w_ficha_crematorio.dw_ctto.setitem(1,'serie',ls_serie)
				w_ficha_crematorio.dw_ctto.setitem(1,'numero',ll_numero)
				
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero)
				
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base',ls_base)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie',ls_serie)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero',ll_numero)
				
				SELECT 	"CADENA"."ESTADO",		  	"CADENA"."COD_PARQUE",   	"ESTADO"."NOMBRE_ESTADO"  
				INTO 		:ls_estado_ctto_actual  ,		:ll_cod_parque_ori,				:ls_desc_ctto
				FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
				WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
							( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
							( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
							( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
							( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
							( "CADENA"."RUT" = :il_rut ) AND  
							( "CADENA"."CODIGO" = :ls_base ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ll_numero )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
					w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
				end if
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.accepttext()
				w_ficha_crematorio.dw_ctto.accepttext()
				w_ficha_crematorio.cb_grabar.setfocus()
				close(w_buscar_ficha_por_contrato)
			end if
		end if
	end if
end if

end event

type gb_1 from groupbox within w_buscar_ficha_por_contrato
integer x = 1216
integer y = 1524
integer width = 1147
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_buscar_ficha_por_contrato
integer x = 59
integer y = 28
integer width = 3575
integer height = 1492
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_buscar_fichas_individual_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row		= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row		= this.getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;if row > 0 then
	il_row		= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	if il_row > 0 and cb_aceptar.enabled=true then cb_aceptar.triggerevent(clicked!)
end if
end event

