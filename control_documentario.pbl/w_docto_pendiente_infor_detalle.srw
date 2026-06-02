forward
global type w_docto_pendiente_infor_detalle from window
end type
type cb_docto_pendiente from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_exportar from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_asocia_contrato from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_cta_cte from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_ordenar from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_imprimir from commandbutton within w_docto_pendiente_infor_detalle
end type
type cb_cerrar from commandbutton within w_docto_pendiente_infor_detalle
end type
type dw_lista from datawindow within w_docto_pendiente_infor_detalle
end type
end forward

global type w_docto_pendiente_infor_detalle from window
integer width = 3817
integer height = 2036
boolean titlebar = true
string title = "Detalle Ventas Evaluadas "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_calcular ( )
cb_docto_pendiente cb_docto_pendiente
cb_exportar cb_exportar
cb_asocia_contrato cb_asocia_contrato
cb_cta_cte cb_cta_cte
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_docto_pendiente_infor_detalle w_docto_pendiente_infor_detalle

type variables
long		il_row
end variables

on w_docto_pendiente_infor_detalle.create
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_exportar=create cb_exportar
this.cb_asocia_contrato=create cb_asocia_contrato
this.cb_cta_cte=create cb_cta_cte
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_docto_pendiente,&
this.cb_exportar,&
this.cb_asocia_contrato,&
this.cb_cta_cte,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_docto_pendiente_infor_detalle.destroy
destroy(this.cb_docto_pendiente)
destroy(this.cb_exportar)
destroy(this.cb_asocia_contrato)
destroy(this.cb_cta_cte)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;string	ls_periodo
long	ll_tipo,ll_cod_exc_ini,ll_cod_exc_fin,ll_cod_grupo_d,ll_cod_grupo_e,ll_tot_reg,ll_mes_ini,ll_ano_ini,ll_mes_fin,ll_ano_fin

gf_centrar(w_docto_pendiente_infor_detalle)

ll_tipo												= long(substr(1,1,Message.StringParm))
ll_mes_ini										= long(substr(1,2,Message.StringParm))
ll_ano_ini										= long(substr(1,3,Message.StringParm))
ll_mes_fin										= long(substr(1,4,Message.StringParm))
ll_ano_fin										= long(substr(1,5,Message.StringParm))
ls_periodo										= substr(1,6,Message.StringParm)
dw_lista.dataobject							='dw_doctos_pend_informe_detalle'
if ll_tipo=1 then
	dw_lista.object.t_titulo.text				= 'Informe Excepciones por Estructura Ventas'
	ll_cod_exc_ini								= 0
	ll_cod_exc_fin								= 1000
	ll_cod_grupo_d								= 4
	ll_cod_grupo_e								= 3
elseif ll_tipo=2 then
	dw_lista.object.t_titulo.text				= 'Informe Detalle por Tipo Excepción'
	ll_cod_exc_ini								= 0
	ll_cod_exc_fin								= 1000
	ll_cod_grupo_d								= 4
	ll_cod_grupo_e								= 3
elseif ll_tipo=3 then
	dw_lista.dataobject						='dw_doctos_pend_informe_detalle3'
	dw_lista.object.t_titulo.text				= 'Informe Modificaciones de Contratos'
	ll_cod_exc_ini								= 25
	ll_cod_exc_fin								= 25
	ll_cod_grupo_d								= 4
	ll_cod_grupo_e								= 4
elseif ll_tipo=4 then
	if ls_periodo	= 'F' then
		dw_lista.object.t_titulo.text			= 'Informe Entrega Documentos Pendientes a la Fecha'
	elseif ls_periodo = 'C' then
		dw_lista.object.t_titulo.text			= 'Informe Entrega Documentos Pendientes al Cierre Período'
	end if
	ll_cod_exc_ini								= 0
	ll_cod_exc_fin								= 1000
	ll_cod_grupo_d								= 4
	ll_cod_grupo_e								= 4
elseif ll_tipo=5 then	
	dw_lista.dataobject						='dw_doctos_pend_informe_detalle5'
	dw_lista.object.t_titulo.text				= 'Informe Detalle Excepción por Contrato'
	ll_cod_exc_ini								= 0
	ll_cod_exc_fin								= 1000
	ll_cod_grupo_d								= 3
	ll_cod_grupo_e								= 3
end if
dw_lista.settransobject(sqlca)


ll_tot_reg										= dw_lista.retrieve(ll_mes_ini,ll_ano_ini,ll_mes_fin,ll_ano_fin,ll_cod_exc_ini,ll_cod_exc_fin,ll_cod_grupo_d,ll_cod_grupo_e)
if ll_tot_reg>0 then
	dw_lista.object.usuario.text				= gs_user
else
	messagebox("Advertencia","No Registra Datos")
	close(w_docto_pendiente_infor_detalle)
end if


end event

event close;disconnect using Trans_4;
end event

type cb_docto_pendiente from commandbutton within w_docto_pendiente_infor_detalle
integer x = 1659
integer y = 1768
integer width = 434
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string		ls_base,ls_serie,ls_string
double	ldb_numero
datetime	ldt_fec_docto

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	
	SELECT	"CIERRE_VENTA"."FEC_DOCTO_PENDIENTE"  
    	INTO 		:ldt_fec_docto  
    FROM 	"VISTA_PRODUCC_MENSUAL", "CIERRE_VENTA"  
   	WHERE	"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = "CIERRE_VENTA"."CIERRE_VENTA" and  
         		"VISTA_PRODUCC_MENSUAL"."BASE" = :ls_base AND  
         		"VISTA_PRODUCC_MENSUAL"."SERIE" = :ls_serie AND  
         		"VISTA_PRODUCC_MENSUAL"."NUMERO" = :ldb_numero
	USING	sqlca;

	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
		ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ldt_fec_docto,'dd/mm/yyyy')
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if
end event

type cb_exportar from commandbutton within w_docto_pendiente_infor_detalle
integer x = 2958
integer y = 1768
integer width = 238
integer height = 92
integer taborder = 30
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

type cb_asocia_contrato from commandbutton within w_docto_pendiente_infor_detalle
integer x = 466
integer y = 1764
integer width = 379
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Rut"
end type

event clicked;if dw_lista.getrow() > 0 then
	gs_base						= dw_lista.getitemstring(il_row,'base')
	gs_serie						= dw_lista.getitemstring(il_row,'serie')
	gi_numero					= dw_lista.getitemnumber(il_row,'numero')
	
	SELECT	"CADENA"."RUT"  
    INTO 		:gi_rut  
    FROM		"CADENA"  
   	WHERE	( "CADENA"."CODIGO" = :gs_base ) AND  
         		( "CADENA"."SERIE" = :gs_serie ) AND  
         		( "CADENA"."NUMERO" = :gi_numero ) 
	USING	sqlca;
	if isnull(gi_rut) then gi_rut=0
	if gi_rut=0 then
		messagebox("Advertencia","Contrato Sin Digitar")
	else
		gi_tipo_busqueda = 1
		open(w_listado_contratos)
	end if
end if
end event

type cb_cta_cte from commandbutton within w_docto_pendiente_infor_detalle
integer x = 37
integer y = 1764
integer width = 425
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;string	ls_base,ls_serie
long		ll_cd_estado_promesa,ll_numero

if dw_lista.rowcount() > 0 then
	gs_base						= dw_lista.getitemstring(il_row,'base')
	gs_serie						= dw_lista.getitemstring(il_row,'serie')
	gi_numero					= dw_lista.getitemnumber(il_row,'numero')
	
	SELECT	"CADENA"."RUT"  
    INTO 		:gi_rut  
    FROM		"CADENA"  
   	WHERE	( "CADENA"."CODIGO" = :gs_base ) AND  
         		( "CADENA"."SERIE" = :gs_serie ) AND  
         		( "CADENA"."NUMERO" = :gi_numero ) 
	USING	sqlca;
	if isnull(gi_rut) then gi_rut=0
	if gi_rut=0 then
		messagebox("Advertencia","Contrato Sin Digitar")
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
		END CHOOSE
	end if
end if
end event

type cb_ordenar from commandbutton within w_docto_pendiente_infor_detalle
integer x = 2482
integer y = 1768
integer width = 238
integer height = 92
integer taborder = 40
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

type cb_imprimir from commandbutton within w_docto_pendiente_infor_detalle
integer x = 2720
integer y = 1768
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then dw_lista.print()
end event

type cb_cerrar from commandbutton within w_docto_pendiente_infor_detalle
integer x = 3451
integer y = 1764
integer width = 311
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_docto_pendiente_infor_detalle)
end event

type dw_lista from datawindow within w_docto_pendiente_infor_detalle
integer x = 37
integer y = 32
integer width = 3726
integer height = 1712
integer taborder = 10
string dataobject = "dw_doctos_pend_informe_detalle5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

