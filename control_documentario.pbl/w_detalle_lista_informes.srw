forward
global type w_detalle_lista_informes from window
end type
type cb_detalle from commandbutton within w_detalle_lista_informes
end type
type cb_imprimir from commandbutton within w_detalle_lista_informes
end type
type cb_exportar from commandbutton within w_detalle_lista_informes
end type
type cb_sort from commandbutton within w_detalle_lista_informes
end type
type cb_filtrar from commandbutton within w_detalle_lista_informes
end type
type cb_cerrar from commandbutton within w_detalle_lista_informes
end type
type dw_lista from datawindow within w_detalle_lista_informes
end type
end forward

global type w_detalle_lista_informes from window
integer width = 3360
integer height = 1960
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_detalle cb_detalle
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_lista_informes w_detalle_lista_informes

type variables
Long		il_correlativo, il_row,il_codigo

end variables

on w_detalle_lista_informes.create
this.cb_detalle=create cb_detalle
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_detalle,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_lista_informes.destroy
destroy(this.cb_detalle)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_detalle_lista_informes)
il_correlativo					= long(trim(substr(1,1,Message.StringParm)))
il_codigo						= long(trim(substr(1,2,Message.StringParm)))
CHOOSE CASE il_codigo
	CASE 2 //Entrega Documentos Agente
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Entrega de Documento(s) a Departamento Operaciones'
		dw_lista.dataobject	= 'dw_lista_informe_entrega_agente_consulta'
		dw_lista.settransobject(sqlca)
	CASE 4 //Entrega Documentos Operaciones
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Entrega de Documento(s) a Departamento Operaciones'
		dw_lista.dataobject	= 'dw_lista_informe_por_estado_consulta'
		dw_lista.settransobject(sqlca)
	CASE 3 //Entrega Documentos Supervisores
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Entrega de Documento(s) a Supervisores'
		dw_lista.dataobject	= 'dw_lista_informe_entrega_supervisor_cons'
		dw_lista.settransobject(sqlca)
	CASE 12 //Devolución Documentos antes 5
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos'
		dw_lista.dataobject	= 'dw_lista_informe_devolucion_supervisor_c'
		dw_lista.settransobject(sqlca)
	CASE 102	//Devolución Documentos Nulos a Operaciones
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos Nulos a Depto Operaciones'
		dw_lista.dataobject	= 'dw_lista_informe_detalle_nulos_consulta'
		dw_lista.settransobject(sqlca)
	CASE 10 //Devolución Documentos adm ventas
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto Adm. Ventas'
		dw_lista.dataobject	= 'dw_lista_informe_por_admvta_consulta'
		dw_lista.settransobject(sqlca)
	CASE 17 //Devolución Documentos at. clientes
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Cliente'
		dw_lista.dataobject	= 'dw_lista_informe_por_atcli_consulta'
		dw_lista.settransobject(sqlca)
	CASE 27 //Devolución Documentos at. terreno
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_por_at_terreno_consulta'
		dw_lista.settransobject(sqlca)
		
	CASE 21 //Entrega Documentos a Ejecutivo
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_entrega_et_consulta'
		dw_lista.settransobject(sqlca)
	CASE 23 //Entrega Documentos a Depto Operaciones
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_por_estado_consulta_at'
		dw_lista.settransobject(sqlca)
	CASE 104 //Entrega Documentos Nulos a Depto Operaciones
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_detalle_nulo_consul_at'
		dw_lista.settransobject(sqlca)
	CASE 22 //recepción Documentos del Ejecutivo
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_recep_dcto_et'
		dw_lista.settransobject(sqlca)
	CASE 28 //Devolución Documentos a Ejecutivo
		this.title				= 'Consultar Lista Nº '+string(il_correlativo,"###,###,###,###")+', Devolución de Documentos a Depto At. Terreno'
		dw_lista.dataobject	= 'dw_lista_informe_devolucion_dcto_et'
		dw_lista.settransobject(sqlca)
END CHOOSE
if dw_lista.retrieve(il_correlativo,il_codigo)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_detalle_lista_informes)
end if
end event

type cb_detalle from commandbutton within w_detalle_lista_informes
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1716
integer width = 411
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;String		ls_string,ls_base,ls_serie
Double	ll_numero
if dw_lista.rowcount()>0 and il_row>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_imprimir from commandbutton within w_detalle_lista_informes
event ue_mousemove pbm_mousemove
integer x = 517
integer y = 1716
integer width = 306
integer height = 96
integer taborder = 30
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

type cb_exportar from commandbutton within w_detalle_lista_informes
event ue_mousemove pbm_mousemove
integer x = 891
integer y = 1716
integer width = 306
integer height = 96
integer taborder = 40
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

type cb_sort from commandbutton within w_detalle_lista_informes
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 686
integer y = 1960
integer width = 229
integer height = 80
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

type cb_filtrar from commandbutton within w_detalle_lista_informes
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 919
integer y = 1960
integer width = 229
integer height = 80
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

type cb_cerrar from commandbutton within w_detalle_lista_informes
integer x = 2971
integer y = 1716
integer width = 306
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_lista_informes)
end event

type dw_lista from datawindow within w_detalle_lista_informes
integer x = 50
integer y = 48
integer width = 3227
integer height = 1628
integer taborder = 10
string dataobject = "dw_lista_informe_recep_dcto_et"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

