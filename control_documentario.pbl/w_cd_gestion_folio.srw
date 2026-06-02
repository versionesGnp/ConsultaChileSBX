forward
global type w_cd_gestion_folio from window
end type
type cb_1 from commandbutton within w_cd_gestion_folio
end type
type cb_mostrar_todo from commandbutton within w_cd_gestion_folio
end type
type st_4 from statictext within w_cd_gestion_folio
end type
type dw_estado from datawindow within w_cd_gestion_folio
end type
type st_lista from statictext within w_cd_gestion_folio
end type
type rb_grupal from radiobutton within w_cd_gestion_folio
end type
type rb_individual from radiobutton within w_cd_gestion_folio
end type
type em_numero_fin from editmask within w_cd_gestion_folio
end type
type st_2 from statictext within w_cd_gestion_folio
end type
type cb_limpiar from commandbutton within w_cd_gestion_folio
end type
type cb_imprimir from commandbutton within w_cd_gestion_folio
end type
type cb_exportar from commandbutton within w_cd_gestion_folio
end type
type cb_sort from commandbutton within w_cd_gestion_folio
end type
type cb_filtrar from commandbutton within w_cd_gestion_folio
end type
type cb_cta_cte from commandbutton within w_cd_gestion_folio
end type
type pb_aceptar from picturebutton within w_cd_gestion_folio
end type
type em_numero_ini from editmask within w_cd_gestion_folio
end type
type st_1 from statictext within w_cd_gestion_folio
end type
type cb_cerrar from commandbutton within w_cd_gestion_folio
end type
type gb_2 from groupbox within w_cd_gestion_folio
end type
type gb_1 from groupbox within w_cd_gestion_folio
end type
type gb_3 from groupbox within w_cd_gestion_folio
end type
type dw_lista from datawindow within w_cd_gestion_folio
end type
type cb_ingresar from commandbutton within w_cd_gestion_folio
end type
end forward

global type w_cd_gestion_folio from window
integer width = 3127
integer height = 1808
boolean titlebar = true
string title = "Control Documentario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_mostrar_todo cb_mostrar_todo
st_4 st_4
dw_estado dw_estado
st_lista st_lista
rb_grupal rb_grupal
rb_individual rb_individual
em_numero_fin em_numero_fin
st_2 st_2
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
em_numero_ini em_numero_ini
st_1 st_1
cb_cerrar cb_cerrar
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
dw_lista dw_lista
cb_ingresar cb_ingresar
end type
global w_cd_gestion_folio w_cd_gestion_folio

type variables
Long		il_row
Double	il_numero_ini,il_numero_fin
String		is_filtro
end variables

event open;dw_lista.settransobject(sqlca)
dw_estado.settransobject(sqlca)
dw_estado.retrieve()
w_cd_gestion_folio.width	= 3127
gf_centrar(w_cd_gestion_folio)
st_lista.text					= 'Mostrar Lista Estado'
rb_individual.checked		= true
rb_individual.triggerevent(clicked!)
end event

on w_cd_gestion_folio.create
this.cb_1=create cb_1
this.cb_mostrar_todo=create cb_mostrar_todo
this.st_4=create st_4
this.dw_estado=create dw_estado
this.st_lista=create st_lista
this.rb_grupal=create rb_grupal
this.rb_individual=create rb_individual
this.em_numero_fin=create em_numero_fin
this.st_2=create st_2
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.em_numero_ini=create em_numero_ini
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.dw_lista=create dw_lista
this.cb_ingresar=create cb_ingresar
this.Control[]={this.cb_1,&
this.cb_mostrar_todo,&
this.st_4,&
this.dw_estado,&
this.st_lista,&
this.rb_grupal,&
this.rb_individual,&
this.em_numero_fin,&
this.st_2,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.em_numero_ini,&
this.st_1,&
this.cb_cerrar,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.dw_lista,&
this.cb_ingresar}
end on

on w_cd_gestion_folio.destroy
destroy(this.cb_1)
destroy(this.cb_mostrar_todo)
destroy(this.st_4)
destroy(this.dw_estado)
destroy(this.st_lista)
destroy(this.rb_grupal)
destroy(this.rb_individual)
destroy(this.em_numero_fin)
destroy(this.st_2)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.em_numero_ini)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.dw_lista)
destroy(this.cb_ingresar)
end on

type cb_1 from commandbutton within w_cd_gestion_folio
integer x = 878
integer y = 1580
integer width = 238
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle"
end type

event clicked;String	ls_string,ls_base,ls_serie
Double	ll_numero
if dw_lista.rowcount()>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_mostrar_todo from commandbutton within w_cd_gestion_folio
integer x = 3150
integer y = 1580
integer width = 535
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Sacar Filtro Estado"
end type

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_4 from statictext within w_cd_gestion_folio
integer x = 3131
integer y = 16
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Estado"
boolean focusrectangle = false
end type

type dw_estado from datawindow within w_cd_gestion_folio
integer x = 3122
integer y = 84
integer width = 576
integer height = 1448
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_estados_cd"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event doubleclicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event rowfocuschanged;Long		ll_codigo
String	ls_string
if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	ll_codigo					= this.getitemnumber(this.getrow(),'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

type st_lista from statictext within w_cd_gestion_folio
integer x = 2418
integer y = 1568
integer width = 334
integer height = 128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Lista Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_string

if st_lista.text='Mostrar Lista Estado' then
	w_cd_gestion_folio.width	= 3744
	st_lista.text					= 'NO Mostrar Lista Estado'
elseif st_lista.text='NO Mostrar Lista Estado' then
	w_cd_gestion_folio.width	= 3127
	st_lista.text					= 'Mostrar Lista Estado'
	ls_string						= ''
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
gf_centrar(w_cd_gestion_folio)
end event

type rb_grupal from radiobutton within w_cd_gestion_folio
integer x = 96
integer y = 132
integer width = 379
integer height = 92
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupal"
end type

event clicked;em_numero_ini.enabled	= true
em_numero_fin.enabled	= true
em_numero_fin.visible	= true
st_2.visible					= true
em_numero_ini.text		= ''
em_numero_fin.text		= ''
gb_1.text						= 'Ingrese Rango Folio'
dw_lista.reset()
em_numero_ini.setfocus()
//cb_limpiar.triggerevent(clicked!)
end event

type rb_individual from radiobutton within w_cd_gestion_folio
integer x = 567
integer y = 132
integer width = 507
integer height = 92
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Individual"
end type

event clicked;em_numero_ini.enabled	= true
em_numero_fin.enabled	= false
em_numero_fin.visible	= false
st_2.visible					= false
em_numero_ini.text		= ''
em_numero_fin.text		= ''
gb_1.text						= 'Ingrese Folio'
dw_lista.reset()
em_numero_ini.setfocus()
//cb_limpiar.triggerevent(clicked!)
end event

type em_numero_fin from editmask within w_cd_gestion_folio
integer x = 2199
integer y = 124
integer width = 626
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###,###"
boolean spin = true
end type

event modified;il_numero_ini	= Double(em_numero_ini.text)
il_numero_fin	= Double(em_numero_fin.text)
if not isnull(il_numero_fin) and not isnull(il_numero_ini) then
	if il_numero_ini>0 and il_numero_fin>0 and il_numero_ini <= il_numero_fin then
		dw_lista.reset()
		pb_aceptar.triggerevent(clicked!)
	else
		messagebox("Advertencia","Rango Folio Inválido")
		em_numero_ini.setfocus()
	end if
end if
end event

type st_2 from statictext within w_cd_gestion_folio
integer x = 2007
integer y = 136
integer width = 178
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_cd_gestion_folio
integer x = 1152
integer y = 1588
integer width = 229
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Setnull(il_row);Setnull(is_filtro);setnull(il_numero_ini);setnull(il_numero_fin)
dw_lista.reset()
em_numero_ini.text	= ''
em_numero_fin.text	= ''
em_numero_ini.setfocus()
end event

type cb_imprimir from commandbutton within w_cd_gestion_folio
integer x = 1399
integer y = 1588
integer width = 229
integer height = 80
integer taborder = 100
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

type cb_exportar from commandbutton within w_cd_gestion_folio
integer x = 1646
integer y = 1588
integer width = 229
integer height = 80
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

type cb_sort from commandbutton within w_cd_gestion_folio
integer x = 1879
integer y = 1588
integer width = 229
integer height = 80
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

type cb_filtrar from commandbutton within w_cd_gestion_folio
integer x = 2112
integer y = 1588
integer width = 229
integer height = 80
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

type cb_cta_cte from commandbutton within w_cd_gestion_folio
integer x = 466
integer y = 1580
integer width = 398
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
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
end event

type pb_aceptar from picturebutton within w_cd_gestion_folio
integer x = 2871
integer y = 88
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_string,ls_cod_sup,ls_filtro
long		ll_tot_reg,ll_indi

il_numero_ini										= Double(em_numero_ini.text)
il_numero_fin										= Double(em_numero_fin.text)
if not isnull(il_numero_fin) and not isnull(il_numero_ini) then
	if il_numero_ini>0 and il_numero_fin>0 and il_numero_ini <= il_numero_fin then
		ls_string										= ''
		dw_lista.SETfilter(ls_string)
		dw_lista.filter()
		ll_tot_reg									= dw_lista.retrieve(il_numero_ini,il_numero_fin)			
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Dato")
			Setnull(il_numero_ini);Setnull(il_numero_fin)
			em_numero_ini.text					= ''
			em_numero_fin.text					= ''
			em_numero_ini.setfocus()
		else
			if gs_depto='R' then
				for ll_indi=1 to dw_lista.rowcount()
					ls_cod_sup						= dw_lista.getitemstring(ll_indi,'cod_supervisor')
					if ls_cod_sup<>gs_user then
						messagebox("Advertencia","Lista Consultada Registra Contrato(S) No Asociado al Supervisor")
						ls_filtro						= "cod_supervisor = '"+gs_user+"'"
						dw_lista.setfilter(ls_filtro)
						dw_lista.filter()
					end if
				next
			else
				dw_lista.setfocus()
			end if
		end if
	else
		messagebox("Advertencia","Rango Folio Inválido")
		em_numero_ini.setfocus()
	end if
end if
end event

type em_numero_ini from editmask within w_cd_gestion_folio
integer x = 1371
integer y = 124
integer width = 626
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###,###"
boolean spin = true
end type

event modified;il_numero_ini						= Double(em_numero_ini.text)
if not isnull(il_numero_ini) then
	if il_numero_ini>0 then
		if rb_grupal.checked=true then
			il_numero_fin			= il_numero_ini + 5
		else
			il_numero_fin			= il_numero_ini
		end if
		em_numero_fin.text		= string(il_numero_fin,"###,###,###,###,###")
		dw_lista.reset()
		if rb_individual.checked=true then pb_aceptar.triggerevent(clicked!)
		em_numero_fin.setfocus()
	else
		em_numero_ini.setfocus()
	end if
end if
end event

type st_1 from statictext within w_cd_gestion_folio
integer x = 1161
integer y = 136
integer width = 187
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cd_gestion_folio
integer x = 2802
integer y = 1580
integer width = 270
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

event clicked;close(w_cd_gestion_folio)
end event

type gb_2 from groupbox within w_cd_gestion_folio
integer x = 41
integer y = 28
integer width = 1070
integer height = 236
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Modo Asignación"
end type

type gb_1 from groupbox within w_cd_gestion_folio
integer x = 1134
integer y = 28
integer width = 1938
integer height = 236
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Rango Folio"
end type

type gb_3 from groupbox within w_cd_gestion_folio
integer x = 1129
integer y = 1536
integer width = 1239
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_cd_gestion_folio
integer x = 41
integer y = 288
integer width = 3031
integer height = 1244
integer taborder = 40
string dataobject = "dw_lista_folios_para_gestionar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna,ls_age,ls_sup,ls_jefe,ls_user
Long		ll_estado

ls_columna					= dwo.name
if row>0 then
	il_row						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_user						= this.getitemstring(il_row,'usuario_crea')
	if isnull(ls_user) or ls_user='' then
		cb_ingresar.enabled	= false
	else
		cb_ingresar.enabled	= true
		ls_age					= this.getitemstring(il_row,'cod_agente')
		ls_sup					= this.getitemstring(il_row,'cod_supervisor')
		ls_jefe					= this.getitemstring(il_row,'cod_jefe_venta')
		ll_estado					= this.getitemnumber(il_row,'ult_estado')
	end if
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

event rowfocuschanged;String		ls_age,ls_sup,ls_jefe,ls_user
Long		ll_estado
if this.getrow()>0 then
	il_row						= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_user						= this.getitemstring(il_row,'usuario_crea')
	if isnull(ls_user) or ls_user='' then
		cb_ingresar.enabled	= false
	else
		cb_ingresar.enabled	= true
		ls_age					= this.getitemstring(il_row,'cod_agente')
		ls_sup					= this.getitemstring(il_row,'cod_supervisor')
		ls_jefe					= this.getitemstring(il_row,'cod_jefe_venta')
		ll_estado					= this.getitemnumber(il_row,'ult_estado')
	end if
end if
end event

event doubleclicked;Long	ll_ult_estado
if row>0 then
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_ult_estado	= dw_lista.getitemnumber(il_row,'ult_estado')
	if ll_ult_estado=11 then cb_cta_cte.triggerevent(clicked!)
end if
end event

event rbuttondown;Long		ll_estado
String	ls_string,MenuHabilitado
if row>0 then
	m_control_documento_popup Menu
	Menu = Create m_control_documento_popup
//	Menu.m_popup.m_ingresargestiontelefonica.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
	Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
end if
end event

type cb_ingresar from commandbutton within w_cd_gestion_folio
integer x = 41
integer y = 1580
integer width = 411
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Gestión"
end type

event clicked;String		ls_string,ls_depto,ls_descrip
Long		ll_estado
if il_row>0 then
	gi_numero 		= dw_lista.getitemnumber(il_row,'numero')
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_estado 		= dw_lista.getitemnumber(il_row,'ult_estado')
	if isnull(ll_estado) then
		messagebox("Advertencia","Contrato Antiguo, es posible consultar Cuenta Corriente")
	else
		SELECT	"CD_ESTADO"."GLOSA"  
		INTO 		:ls_descrip  
		FROM 	"CD_ESTADO"  
		WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
	
		ls_depto			= dw_lista.getitemstring(il_row,'depto_asignado')
		if not isnull(gi_numero) and gi_numero>0 and not isnull(gs_base) and not isnull(gs_serie) then
			if (gs_conexion="Parque La Foresta" and ls_depto='O') or (gs_conexion="Parque La Foresta" and ls_depto='P') or &
				(gs_conexion="Parque La Foresta" and ls_depto='T') or (ls_depto=gs_depto) or (gs_depto='R' or gs_depto='X') or (gs_depto='O' and ll_estado=16) or &
				(gs_depto='O' and ll_estado=23) or gs_depto='I' or ll_estado=4 or ll_estado=10 or ll_estado=27 or ll_estado=5 or &
				ll_estado=24 or ll_estado=11 or ll_estado=9 or ll_estado=8 or ll_estado=18 or ll_estado=21 or ll_estado=22 or &
				ll_estado=25 OR ll_estado=26 OR ll_estado=28 OR ll_estado=29 then
				
				if ll_estado>1 then
					if ll_estado=100 or ll_estado=101 or ll_estado=102 or ll_estado=103 or ll_estado=104 or ll_estado=105 then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif (gs_depto='P' and ll_estado<>6) and (gs_depto='P' and ll_estado<>17) then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=9)  or (gs_depto='E' and ll_estado=9) or &
							 (gs_depto='D' and ll_estado=9)  or (gs_depto='O' and ll_estado=5) or &
							 ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=11) or (gs_depto='E' and ll_estado=11) or &
							 (gs_depto='D' and ll_estado=11) or ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=4) or &
							 (gs_depto='E' and ll_estado=23) or (gs_depto='T' and ll_estado=4) or &
							 (gs_depto='D' and ll_estado=4) then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif gs_depto<>'O' and ll_estado=8 then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					else
						ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
						if isvalid(w_cd_ingresar_control_documentacion) then close(w_cd_ingresar_control_documentacion)
						openwithparm(w_cd_ingresar_control_documentacion,ls_string)
					end if
				else
					if gs_depto='V' or gs_depto='R' or gs_depto='X' then
						messagebox("Advertencia","No es posible Ingresar Gestión, recuerde Estado Actual por lo menos debe estar en Código 2-Asignado Form.Agente")
					elseif gs_depto='E' then
						messagebox("Advertencia","No es posible Ingresar Gestión, recuerde Estado Actual por lo menos debe estar en Código 21-Asignado Form.Ejecutivo")
					end if
				end if
			elseif ll_estado=9 then
				messagebox("Advertencia","Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+", está Aceptado por Depto. Operaciones")
			else
				messagebox("Advertencia","Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+", No está Asignado a su Departamento")
			end if
		end if
	end if
end if
end event

