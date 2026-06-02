forward
global type w_cd_gestion_asignacion_agente from window
end type
type cb_1 from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_anular from commandbutton within w_cd_gestion_asignacion_agente
end type
type dw_base from datawindow within w_cd_gestion_asignacion_agente
end type
type rb_grupal from radiobutton within w_cd_gestion_asignacion_agente
end type
type rb_individual from radiobutton within w_cd_gestion_asignacion_agente
end type
type em_numero_fin from editmask within w_cd_gestion_asignacion_agente
end type
type st_2 from statictext within w_cd_gestion_asignacion_agente
end type
type cb_asignar from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_limpiar from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_imprimir from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_exportar from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_sort from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_filtrar from commandbutton within w_cd_gestion_asignacion_agente
end type
type cb_cta_cte from commandbutton within w_cd_gestion_asignacion_agente
end type
type pb_aceptar from picturebutton within w_cd_gestion_asignacion_agente
end type
type em_numero_ini from editmask within w_cd_gestion_asignacion_agente
end type
type st_1 from statictext within w_cd_gestion_asignacion_agente
end type
type cb_cerrar from commandbutton within w_cd_gestion_asignacion_agente
end type
type dw_lista from datawindow within w_cd_gestion_asignacion_agente
end type
type gb_2 from groupbox within w_cd_gestion_asignacion_agente
end type
type gb_1 from groupbox within w_cd_gestion_asignacion_agente
end type
type gb_3 from groupbox within w_cd_gestion_asignacion_agente
end type
type gb_4 from groupbox within w_cd_gestion_asignacion_agente
end type
end forward

global type w_cd_gestion_asignacion_agente from window
integer width = 3122
integer height = 1808
boolean titlebar = true
string title = "Control Documentario ~"Asignar Contratos Agentes~""
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_1 cb_1
cb_anular cb_anular
dw_base dw_base
rb_grupal rb_grupal
rb_individual rb_individual
em_numero_fin em_numero_fin
st_2 st_2
cb_asignar cb_asignar
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
dw_lista dw_lista
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type
global w_cd_gestion_asignacion_agente w_cd_gestion_asignacion_agente

type variables
Long		il_row
Double	il_numero_ini,il_numero_fin
String	is_filtro,is_base
end variables

event open;gf_centrar(w_cd_gestion_asignacion_agente)
if gs_depto='R' then
	dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente_sup'
elseif gs_depto='X' then
	dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente_ugn'	
else
	dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente'
end if
dw_lista.settransobject(sqlca)
rb_grupal.checked				= true
cb_anular.enabled				= false
dw_base.settransobject(sqlca)
dw_base.insertrow(0)
if isvalid(w_validar_promesa_operaciones) then
	rb_grupal.enabled			= false
	rb_individual.enabled		= true
	rb_individual.checked		= true
	rb_individual.triggerevent(clicked!)
	if long(w_validar_promesa_operaciones.em_numero.text) > 0 then
		dw_base.setitem(1,'base', w_validar_promesa_operaciones.dw_base.getitemstring(1,'base'))
		em_numero_ini.text	= w_validar_promesa_operaciones.em_numero.text
		em_numero_fin.text	= w_validar_promesa_operaciones.em_numero.text
		em_numero_fin.triggerevent(modified!)
		pb_aceptar.setfocus()
	end if
//	rb_individual.triggerevent(clicked!)
end if
end event

on w_cd_gestion_asignacion_agente.create
this.cb_1=create cb_1
this.cb_anular=create cb_anular
this.dw_base=create dw_base
this.rb_grupal=create rb_grupal
this.rb_individual=create rb_individual
this.em_numero_fin=create em_numero_fin
this.st_2=create st_2
this.cb_asignar=create cb_asignar
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
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_1,&
this.cb_anular,&
this.dw_base,&
this.rb_grupal,&
this.rb_individual,&
this.em_numero_fin,&
this.st_2,&
this.cb_asignar,&
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
this.dw_lista,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.gb_4}
end on

on w_cd_gestion_asignacion_agente.destroy
destroy(this.cb_1)
destroy(this.cb_anular)
destroy(this.dw_base)
destroy(this.rb_grupal)
destroy(this.rb_individual)
destroy(this.em_numero_fin)
destroy(this.st_2)
destroy(this.cb_asignar)
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
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type cb_1 from commandbutton within w_cd_gestion_asignacion_agente
integer x = 965
integer y = 1580
integer width = 238
integer height = 100
integer taborder = 90
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

type cb_anular from commandbutton within w_cd_gestion_asignacion_agente
integer x = 361
integer y = 1580
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "A&nular Dcto"
end type

event clicked;String	ls_base,ls_serie,ls_glosa,ls_string
Long		ll_resp
Double	ll_numero
if il_row>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	if ll_numero>0 then
		ll_resp		= messagebox("Advertencia","Está Seguro de ANULAR Documento  "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###"),Exclamation!,YesNo!,2)
		if ll_resp=1 then //102
			SELECT	sysdate
			INTO 		:gdt_fec_sistema
			FROM 		"TASA"  ;
			ls_glosa		= 'ANULAR DOCUMENTO Nº  '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' POR '+gs_user+': '+gs_nom_comp_usuario+' EL DIA: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'.'
			ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(gdt_fec_sistema)+'~t'+ls_glosa+'~t'+'102'+'~t'+string(il_row)
			OPENWITHPARM(w_cd_anular_documento,ls_string)
		end if
	end if
end if
end event

type dw_base from datawindow within w_cd_gestion_asignacion_agente
integer x = 645
integer y = 112
integer width = 814
integer height = 116
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_base_cd"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_base, ls_nulo

Setnull(ls_nulo)
dw_base.accepttext()
ls_base			= trim(dw_base.getitemstring(1,'base'))
if (ls_base<>'F' and ls_base<>'G' and ls_base<>'V') and gs_depto='H' then
	messagebox("Advertencia","Ud. solo puede Asignar Contratos de Servicio")
	dw_base.setitem(1,'base',ls_nulo)
	dw_base.accepttext()
	dw_base.setfocus()
end if
dw_lista.reset()
end event

type rb_grupal from radiobutton within w_cd_gestion_asignacion_agente
integer x = 78
integer y = 92
integer width = 338
integer height = 80
integer textsize = -10
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
st_2.visible				= true
em_numero_ini.text		= ''
em_numero_fin.text		= ''
gb_1.text					= 'Ingrese Rango Folio'
dw_lista.reset()
dw_base.setfocus()
//cb_limpiar.triggerevent(clicked!)
end event

type rb_individual from radiobutton within w_cd_gestion_asignacion_agente
integer x = 78
integer y = 172
integer width = 448
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Individual"
end type

event clicked;em_numero_ini.enabled			= true
em_numero_fin.enabled			= false
em_numero_fin.visible			= false
st_2.visible							= false
if isvalid(w_validar_promesa_operaciones) then
	if long(w_validar_promesa_operaciones.em_numero.text) = 0 or isnull(w_validar_promesa_operaciones.em_numero.text) or w_validar_promesa_operaciones.em_numero.text='' then
		em_numero_fin.text		= ''
		em_numero_ini.text		= ''
	end if
else
	em_numero_fin.text			= ''
	em_numero_ini.text			= ''
end if
gb_1.text						= 'Ingrese Folio'
dw_lista.reset()
dw_base.setfocus()
//cb_limpiar.triggerevent(clicked!)
end event

type em_numero_fin from editmask within w_cd_gestion_asignacion_agente
integer x = 2427
integer y = 124
integer width = 411
integer height = 100
integer taborder = 30
integer textsize = -10
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
if not isnull(il_numero_fin) and not isnull(il_numero_ini) and il_numero_fin>0 and il_numero_ini>0 then
	if il_numero_ini>0 and il_numero_fin>0 and il_numero_ini <= il_numero_fin then
		dw_lista.reset()
		pb_aceptar.triggerevent(clicked!)
	else
		messagebox("Advertencia","Rango Folio Inválido")
		em_numero_ini.setfocus()
	end if
end if
end event

type st_2 from statictext within w_cd_gestion_asignacion_agente
integer x = 2235
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
string text = "hasta"
boolean focusrectangle = false
end type

type cb_asignar from commandbutton within w_cd_gestion_asignacion_agente
integer x = 41
integer y = 1580
integer width = 297
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event clicked;String		ls_string,ls_age,ls_sup,ls_jef
Long		ll_estado,ll_fila,ll_tot_reg

ll_tot_reg					= dw_lista.rowcount()
il_row							= dw_lista.getrow()
if ll_tot_reg>0 and il_row > 0 then
	if ll_tot_reg=1 then 
		rb_individual.checked	= true
	end if
	if rb_individual.checked=true then
		if il_row > 0 then
			gi_numero 		= dw_lista.getitemnumber(il_row,'numero')
			gs_base			= dw_lista.getitemstring(il_row,'base')
			gs_serie			= dw_lista.getitemstring(il_row,'serie')
			ll_estado 		= dw_lista.getitemnumber(il_row,'ult_estado')
			ls_age			= dw_lista.getitemstring(il_row,'cod_agente')
			ls_sup			= dw_lista.getitemstring(il_row,'cod_supervisor')
			ls_jef				= dw_lista.getitemstring(il_row,'cod_jefe_venta')
			if isnull(ls_age) or ls_age='' then ls_age=''
			if isnull(ls_sup) or ls_sup='' then ls_sup=''
			if isnull(ls_jef) or ls_jef='' then ls_jef=''
			if ll_estado=1 or ll_estado=19 or ll_estado=20 or ll_estado=32 or (ll_estado=2 and (gs_depto='R' or gs_depto='X' or gs_depto='V')) or ll_estado=35 or (ll_estado=2 and gs_depto='E' and (gs_base='G' or gs_base='V')) or ll_estado=35 or (ll_estado=2 and (gs_depto='H' or gs_depto='O') and (gs_base='G' or gs_base='V' or gs_base='F')) then
				if not isnull(gi_numero) and gi_numero>0 and not isnull(gs_base) and not isnull(gs_serie) then
					if ll_estado=1 or ll_estado=19 or ll_estado=20 or ll_estado=32 or (ll_estado=2 and (gs_depto='R' or gs_depto='X' or gs_depto='V')) or ll_estado=35 or (ll_estado=2 and gs_depto='E' and (gs_base='G' or gs_base='V')) or ll_estado=35 or (ll_estado=2 and (gs_depto='H' or gs_depto='O') and (gs_base='G' or gs_base='V' or gs_base='F')) then
						ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'I'+'~t'+ls_age+'~t'+ls_sup+'~t'+ls_jef
						if isvalid(w_cd_asignar_agente) then close(w_cd_asignar_agente)
						openwithparm(w_cd_asignar_agente,ls_string)
					else
						if gs_depto='V' or gs_depto='E' then	//or gs_depto='H' 
							messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 1-Entregar Form.Adm.Vta. o 3-Recepción de Documento por Depto.Adm.Venta")
						elseif gs_depto='O' then
							messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 20-Entregar Form.At.Terreno o 22-Recepción de Documento por Depto.At.Terreno")
						elseif gs_depto='R' then
							messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 2-Contrato Asignado Agente / Supervisor o 35-Recepción Contrato por Supervisor de Agente")
						elseif gs_depto='X' then
							messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 2-Contrato Asignado Agente / Supervisor (U.G.N.) o 35-Recepción Contrato por Supervisor de Agente (U.G.N.)")	
						end if
					end if
				end if
			else
				if gs_depto='V' or gs_depto='E' then	//or gs_depto='H' 
					messagebox("Advertencia","No es posible Asignar Formulario, recuerde Estado Actual debe estar 1-Entregar Form.Adm.Vta. o 3-Recepción de Documento por Depto.Adm.Venta")
				elseif gs_depto='O'  then
					messagebox("Advertencia","No es posible Asignar Formulario, recuerde Estado Actual debe estar 20-Entregar Form.At.Terreno o 22-Recepción de Documento por Depto.At.Terreno")
				elseif gs_depto='R' then
					messagebox("Advertencia","No es posible Asignar Formulario, recuerde Estado Actual debe estar 2-Contrato Asignado Agente / Supervisor o 35-Recepción Contrato por Supervisor de Agente")
				elseif gs_depto='X' then
					messagebox("Advertencia","No es posible Asignar Formulario, recuerde Estado Actual debe estar 2-Contrato Asignado Agente / Supervisor (U.G.N.) o 35-Recepción Contrato por Supervisor de Agente (U.G.N.)")	
				end if
			end if
		end if
	elseif rb_grupal.checked=true then
		gi_numero 		= Double(em_numero_ini.text)
		ls_age			= dw_lista.getitemstring(1,'cod_agente')
		ls_sup			= dw_lista.getitemstring(1,'cod_supervisor')
		ls_jef				= dw_lista.getitemstring(1,'cod_jefe_venta')
		if isnull(ls_age) or ls_age='' then ls_age=''
		if isnull(ls_sup) or ls_sup='' then ls_sup=''
		if isnull(ls_jef) or ls_jef='' then ls_jef=''
		ll_fila	= dw_lista.Find("ult_estado = 1 or ult_estado = 19 or ult_estado = 20 or ult_estado = 32 or (ult_estado = 2 and ( depto_asignado='V' or depto_asignado='X' or depto_asignado='R')) or ult_estado = 35",1, ll_tot_reg)
		if ll_fila>0 then
			ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'G'+'~t'+ls_age+'~t'+ls_sup+'~t'+ls_jef
			if isvalid(w_cd_asignar_agente) then close(w_cd_asignar_agente)
			openwithparm(w_cd_asignar_agente,ls_string)
		else
			if gs_depto='V' or gs_depto='H' then
				messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 1-Entregar Form.Adm.Vta. o 19-Documento Devuelto por Agente a Depto.Adm.Venta")
			elseif gs_depto='O' or gs_depto='E' then
				messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 1-Entregar Form.At.Terreno o 32-Documento Devuelto por Ejecutivo a Depto.At.Terreno")
			elseif gs_depto='R' then
				messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 2-Asignado Contrato Agente/Supervisor o 35-Recepcion Contrato por Supervisor de Agente")
			elseif gs_depto='X' then
				messagebox("Advertencia","No Registra Formularios para Entrega, recuerde Estado Actual debe estar 2-Asignado Contrato Agente/Supervisor (U.G.N.) o 35-Recepcion Contrato por Supervisor de Agente (U.G.N.)")	
			end if
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_cd_gestion_asignacion_agente
integer x = 1243
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
setnull(is_base)
dw_lista.reset()
em_numero_ini.text	= ''
em_numero_fin.text	= ''
dw_base.reset()
dw_base.insertrow(0)
em_numero_ini.setfocus()
end event

type cb_imprimir from commandbutton within w_cd_gestion_asignacion_agente
integer x = 1490
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

type cb_exportar from commandbutton within w_cd_gestion_asignacion_agente
integer x = 1737
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

type cb_sort from commandbutton within w_cd_gestion_asignacion_agente
integer x = 1970
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

type cb_filtrar from commandbutton within w_cd_gestion_asignacion_agente
integer x = 2203
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

type cb_cta_cte from commandbutton within w_cd_gestion_asignacion_agente
integer x = 695
integer y = 1580
integer width = 247
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta C&te"
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

type pb_aceptar from picturebutton within w_cd_gestion_asignacion_agente
integer x = 2871
integer y = 88
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_string
Long		ll_tot_reg

il_numero_ini				= Double(em_numero_ini.text)
il_numero_fin				= Double(em_numero_fin.text)
is_base						= trim(dw_base.getitemstring(1,'base'))
if not isnull(il_numero_fin) and not isnull(il_numero_ini) and not isnull(is_base) then
	if il_numero_ini>0 and il_numero_fin>0 and il_numero_ini <= il_numero_fin then
		if not isnull(is_base) then
			if gs_depto='R' or gs_depto='X' or ((is_base='G' or is_base='V') and gs_depto='E') then
				if gs_depto='R' then
					dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente_sup'
				elseif gs_depto='X' then
					dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente_ugn'	
				else
					dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente'
				end if
//				dw_lista.dataobject		= 'dw_lista_form_para_asignacion_agente_sup'
				dw_lista.settransobject(sqlca)
				dw_base.settransobject(sqlca)
				dw_base.insertrow(0)
			end if
			ls_string		= ''
			dw_lista.SETfilter(ls_string)
			dw_lista.filter()
			if gs_depto='R' or gs_depto='X' or (gs_depto='E' and (is_base='G' or is_base='V')) then
				ll_tot_reg	= dw_lista.retrieve(il_numero_ini, il_numero_fin, is_base, gs_user)
			else
				ll_tot_reg	= dw_lista.retrieve(il_numero_ini,il_numero_fin,is_base)
			end if
			if ll_tot_reg=0 then
				if rb_grupal.checked=true then
					if gs_depto='V' then
						messagebox("Advertencia","No Registra Dato en el Rango de Folios indicados y con Estado 1-ENTREGAR CONTRATO ADMIN.VENTA")
					elseif gs_depto='O' or gs_depto='E' then
						messagebox("Advertencia","No Registra Dato en el Rango de Folios indicados y con Estado 20-ENTREGAR CONTRATO ATENCION TERRENO")
					end if
				else
					if gs_depto='V' then
						messagebox("Advertencia","No Registra Dato Folio indicado y con Estado 1-ENTREGAR CONTRATO ADMIN.VENTA")
					elseif gs_depto='O' or gs_depto='E' then
						messagebox("Advertencia","No Registra Dato en el Rango de Folios indicados y con Estado 20-ENTREGAR CONTRATO ATENCION TERRENO")
					end if
				end if
//				Setnull(il_numero_ini);Setnull(il_numero_fin)
//				em_numero_ini.text	= ''
//				em_numero_fin.text	= ''
				em_numero_ini.setfocus()
			else
				dw_lista.setfocus()
			end if
		else
			messagebox("Advertencia","Base Inválida")
			dw_base.setfocus()
		end if
	else
		messagebox("Advertencia","Rango Folio Inválido")
		em_numero_ini.setfocus()
	end if
end if
end event

type em_numero_ini from editmask within w_cd_gestion_asignacion_agente
integer x = 1787
integer y = 124
integer width = 411
integer height = 100
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
string mask = "###,###,###,###,###,###"
boolean spin = true
end type

event modified;il_numero_ini					= Double(em_numero_ini.text)
if not isnull(il_numero_ini) then
	if il_numero_ini>0 then
		if rb_grupal.checked=true then
			il_numero_fin		= il_numero_ini + 4
		else
			il_numero_fin		= il_numero_ini
		end if
		em_numero_fin.text	= string(il_numero_fin,"###,###,###,###,###")
		dw_lista.reset()
		em_numero_fin.triggerevent(modified!)
	else
		em_numero_ini.setfocus()
	end if
end if
end event

type st_1 from statictext within w_cd_gestion_asignacion_agente
integer x = 1568
integer y = 136
integer width = 210
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
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cd_gestion_asignacion_agente
integer x = 2770
integer y = 1580
integer width = 297
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

event clicked;close(w_cd_gestion_asignacion_agente)
end event

type dw_lista from datawindow within w_cd_gestion_asignacion_agente
integer x = 41
integer y = 296
integer width = 3031
integer height = 1236
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_form_para_asignacion_agente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_age,ls_sup,ls_jefe,ls_user
Long		ll_estado
ls_columna	= dwo.name
if row>0 then
	il_row						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_user						= this.getitemstring(il_row,'usuario_crea')
	if isnull(ls_user) or ls_user='' then
		cb_asignar.enabled	= false
	else
		cb_asignar.enabled	= true
		ls_age					= this.getitemstring(il_row,'cod_agente')
		ls_sup					= this.getitemstring(il_row,'cod_supervisor')
		ls_jefe					= this.getitemstring(il_row,'cod_jefe_venta')
		ll_estado				= this.getitemnumber(il_row,'ult_estado')
		if ll_estado<>1 and ll_estado<>19 then
			cb_asignar.italic	= true
			cb_anular.enabled	= false
		else
			cb_asignar.italic	= false
			cb_anular.enabled	= true
		end if
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

event rowfocuschanged;String	ls_age,ls_sup,ls_jefe,ls_user
Long		ll_estado
if this.getrow()>0 then
	il_row						= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_user						= this.getitemstring(il_row,'usuario_crea')
	if isnull(ls_user) or ls_user='' then
		cb_asignar.enabled	= false
	else
		cb_asignar.enabled	= true
		ls_age					= this.getitemstring(il_row,'cod_agente')
		ls_sup					= this.getitemstring(il_row,'cod_supervisor')
		ls_jefe					= this.getitemstring(il_row,'cod_jefe_venta')
		ll_estado				= this.getitemnumber(il_row,'ult_estado')
		if ll_estado<>1 and ll_estado<>3 then
//		if ll_estado>1 then
			cb_asignar.italic	= true
			cb_anular.enabled	= false
		else
			cb_asignar.italic	= false
			cb_anular.enabled	= true
		end if
	end if
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_cta_cte.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_cd_gestion_asignacion_agente
integer x = 41
integer y = 28
integer width = 539
integer height = 236
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modo Asignación"
end type

type gb_1 from groupbox within w_cd_gestion_asignacion_agente
integer x = 1522
integer y = 28
integer width = 1550
integer height = 236
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Rango Folio"
end type

type gb_3 from groupbox within w_cd_gestion_asignacion_agente
integer x = 1221
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

type gb_4 from groupbox within w_cd_gestion_asignacion_agente
integer x = 608
integer y = 28
integer width = 887
integer height = 236
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Base"
end type

