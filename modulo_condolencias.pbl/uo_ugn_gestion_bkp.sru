forward
global type uo_ugn_gestion_bkp from tab
end type
type tabpage_1 from userobject within uo_ugn_gestion_bkp
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_ugn_gestion_bkp
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_ugn_gestion_bkp
end type
type cb_cerrar_2 from commandbutton within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type dw_cobranza from datawindow within tabpage_2
end type
type tabpage_2 from userobject within uo_ugn_gestion_bkp
cb_cerrar_2 cb_cerrar_2
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_ugn_gestion_bkp
end type
type cb_cerrar_3 from commandbutton within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type dw_fallecido from datawindow within tabpage_3
end type
type tabpage_3 from userobject within uo_ugn_gestion_bkp
cb_cerrar_3 cb_cerrar_3
st_2 st_2
dw_fallecido dw_fallecido
end type
type tabpage_4 from userobject within uo_ugn_gestion_bkp
end type
type dw_encuesta from datawindow within tabpage_4
end type
type st_9 from statictext within tabpage_4
end type
type dw_ingreso from datawindow within tabpage_4
end type
type dw_cliente2 from datawindow within tabpage_4
end type
type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
end type
type cb_grabar from commandbutton within tabpage_4
end type
type cb_cerrar_4 from commandbutton within tabpage_4
end type
type tabpage_4 from userobject within uo_ugn_gestion_bkp
dw_encuesta dw_encuesta
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_grabar cb_grabar
cb_cerrar_4 cb_cerrar_4
end type
end forward

global type uo_ugn_gestion_bkp from tab
integer width = 2533
integer height = 2076
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean showpicture = false
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
global uo_ugn_gestion_bkp uo_ugn_gestion_bkp

type variables
long	il_fila
end variables

on uo_ugn_gestion_bkp.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on uo_ugn_gestion_bkp.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within uo_ugn_gestion_bkp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2496
integer height = 1948
long backcolor = 67108864
string text = "Antecedentes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type

on tabpage_1.create
this.dw_cliente=create dw_cliente
this.st_4=create st_4
this.dw_contrato=create dw_contrato
this.cb_cerrar_1=create cb_cerrar_1
this.Control[]={this.dw_cliente,&
this.st_4,&
this.dw_contrato,&
this.cb_cerrar_1}
end on

on tabpage_1.destroy
destroy(this.dw_cliente)
destroy(this.st_4)
destroy(this.dw_contrato)
destroy(this.cb_cerrar_1)
end on

type dw_cliente from datawindow within tabpage_1
integer x = 14
integer y = 8
integer width = 2469
integer height = 628
integer taborder = 10
string title = "none"
string dataobject = "dw_antecedentes_cliente_ugn"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within tabpage_1
integer x = 37
integer y = 628
integer width = 567
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos Asociados"
boolean focusrectangle = false
end type

event clicked;w_general_cobranza_telefonica.tab_cobranza.visible	= false
end event

type dw_contrato from datawindow within tabpage_1
integer x = 18
integer y = 700
integer width = 2441
integer height = 868
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_ugn_cliente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_numero,ll_folio
if getrow()>0 then
	il_fila		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
end if
end event

event clicked;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_numero,ll_folio
if row>0 then
	il_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
end if
end event

type cb_cerrar_1 from commandbutton within tabpage_1
integer x = 18
integer y = 1608
integer width = 2441
integer height = 104
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type tabpage_2 from userobject within uo_ugn_gestion_bkp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2496
integer height = 1948
long backcolor = 67108864
string text = "Gestión Histórica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cerrar_2 cb_cerrar_2
st_1 st_1
dw_cobranza dw_cobranza
end type

on tabpage_2.create
this.cb_cerrar_2=create cb_cerrar_2
this.st_1=create st_1
this.dw_cobranza=create dw_cobranza
this.Control[]={this.cb_cerrar_2,&
this.st_1,&
this.dw_cobranza}
end on

on tabpage_2.destroy
destroy(this.cb_cerrar_2)
destroy(this.st_1)
destroy(this.dw_cobranza)
end on

type cb_cerrar_2 from commandbutton within tabpage_2
integer x = 23
integer y = 1604
integer width = 2437
integer height = 108
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type st_1 from statictext within tabpage_2
integer x = 27
integer y = 16
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestión Telefónica"
boolean focusrectangle = false
end type

type dw_cobranza from datawindow within tabpage_2
integer x = 23
integer y = 76
integer width = 2437
integer height = 1484
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_historial_gestion_ugn"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type tabpage_3 from userobject within uo_ugn_gestion_bkp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2496
integer height = 1948
long backcolor = 67108864
string text = "Antecedente Fallecido"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cerrar_3 cb_cerrar_3
st_2 st_2
dw_fallecido dw_fallecido
end type

on tabpage_3.create
this.cb_cerrar_3=create cb_cerrar_3
this.st_2=create st_2
this.dw_fallecido=create dw_fallecido
this.Control[]={this.cb_cerrar_3,&
this.st_2,&
this.dw_fallecido}
end on

on tabpage_3.destroy
destroy(this.cb_cerrar_3)
destroy(this.st_2)
destroy(this.dw_fallecido)
end on

type cb_cerrar_3 from commandbutton within tabpage_3
integer x = 18
integer y = 1608
integer width = 2441
integer height = 104
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type st_2 from statictext within tabpage_3
integer x = 27
integer y = 16
integer width = 699
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedente Fallecido"
boolean focusrectangle = false
end type

type dw_fallecido from datawindow within tabpage_3
integer x = 18
integer y = 76
integer width = 2450
integer height = 1508
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ugn_antecedentes_fallecido_ficha"
boolean border = false
boolean livescroll = true
end type

type tabpage_4 from userobject within uo_ugn_gestion_bkp
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2496
integer height = 1948
long backcolor = 67108864
string text = "Gestión Telefónica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_encuesta dw_encuesta
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_grabar cb_grabar
cb_cerrar_4 cb_cerrar_4
end type

on tabpage_4.create
this.dw_encuesta=create dw_encuesta
this.st_9=create st_9
this.dw_ingreso=create dw_ingreso
this.dw_cliente2=create dw_cliente2
this.dw_ultima_cobranza_telefonica=create dw_ultima_cobranza_telefonica
this.cb_grabar=create cb_grabar
this.cb_cerrar_4=create cb_cerrar_4
this.Control[]={this.dw_encuesta,&
this.st_9,&
this.dw_ingreso,&
this.dw_cliente2,&
this.dw_ultima_cobranza_telefonica,&
this.cb_grabar,&
this.cb_cerrar_4}
end on

on tabpage_4.destroy
destroy(this.dw_encuesta)
destroy(this.st_9)
destroy(this.dw_ingreso)
destroy(this.dw_cliente2)
destroy(this.dw_ultima_cobranza_telefonica)
destroy(this.cb_grabar)
destroy(this.cb_cerrar_4)
end on

type dw_encuesta from datawindow within tabpage_4
integer x = 23
integer y = 1560
integer width = 2450
integer height = 244
integer taborder = 30
string title = "none"
string dataobject = "dw_encuesta_mc"
boolean border = false
boolean livescroll = true
end type

type st_9 from statictext within tabpage_4
integer x = 59
integer y = 892
integer width = 777
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Cobranza Telefónica"
boolean focusrectangle = false
end type

type dw_ingreso from datawindow within tabpage_4
integer x = 9
integer y = 948
integer width = 2478
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_gestion_ejecutivo_ugn"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Date		ld_fecha_asigna,ldt_fecha_tope,ld_fecha,ld_nulo
String	ls_columna,ls_base,ls_serie,ls_descrip,ls_estado_gestion,ls_nulo
Long		ll_row,ll_numero,ll_estado,ll_nulo

this.accepttext()
Setnull(ld_nulo);Setnull(ll_nulo);Setnull(ls_nulo)
ll_row				= w_ingreso_individual_ugn.dw_lista.getrow()
ls_columna			= dwo.name
ld_fecha_asigna	= date(w_ingreso_individual_ugn.dw_lista.getitemdatetime(ll_row,'ugn_cliente_asignar_falle_fecha_ingreso'))
if ls_columna='estado_gestion' then
	ls_estado_gestion	= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
	if not isnull(ls_estado_gestion) and ls_estado_gestion<>'22' and dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then 
		dw_ingreso.setitem(1,'base',ls_nulo)
		dw_ingreso.setitem(1,'serie',ls_nulo)
		dw_ingreso.setitem(1,'numero',ll_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna = 'fecha_prox_llamado' then
	ld_fecha			= Date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado'))
	ldt_fecha_tope	= RelativeDate(ld_fecha_asigna, 15)
	if ld_fecha > ldt_fecha_tope then
		messagebox("Advertencia","Fecha Próximo Llamado No debe ser Mayor al "+string(ld_fecha_asigna,'dd/mm/yyyy')+ " fecha Tope para realizar Gestión")
		dw_ingreso.setitem(1,'fecha_prox_llamado',ld_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna='serie' or ls_columna='numero' or ls_columna='base' then
	if ls_columna='base' then
		ls_base			= dw_ingreso.getitemstring(1,'base')
		idw_detalle.retrieve(ls_base)
	end if
	if ls_columna='numero' then
		if ll_numero > 0 then
			ls_base			= dw_ingreso.getitemstring(1,'base')
			ls_serie			= dw_ingreso.getitemstring(1,'serie')
			ll_numero		= dw_ingreso.getitemnumber(1,'numero')
			if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT	"CD_FOLIO"."ULT_ESTADO", 	"CD_ESTADO"."DESCRIPCION"  
				INTO 		:ll_estado,						:ls_descrip  
				FROM		"CD_FOLIO",	"CD_ESTADO"  
				WHERE  ( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
						 (("CD_FOLIO"."BASE" = :ls_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+" existe en Control Documentario - Estado "+string(ll_estado)+'-'+ls_descrip)
				else
					messagebox("Advertencia","No Existe en Control Documnetario Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,##0'))
//					dw_ingreso.setitem(1,'base',ls_nulo)
//					dw_ingreso.setitem(1,'serie',ls_nulo)
					dw_ingreso.setitem(1,'numero',ll_nulo)
					dw_ingreso.accepttext()
				end if
			end if
		end if
	end if
end if
end event

event itemfocuschanged;Date		ld_fecha_asigna,ldt_fecha_tope,ld_fecha,ld_nulo
String	ls_columna,ls_base,ls_serie,ls_estado_gestion,ls_nulo
Long		ll_row,ll_numero,ll_estado,ll_nulo

this.accepttext()
ls_columna			= dwo.name
Setnull(ld_nulo);Setnull(ll_nulo);Setnull(ls_nulo)
ll_row				= w_ingreso_individual_ugn.dw_lista.getrow()
ld_fecha				= Date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado'))
ld_fecha_asigna	= date(w_ingreso_individual_ugn.dw_lista.getitemdatetime(ll_row,'ugn_cliente_asignar_falle_fecha_ingreso'))
if not isnull(ld_fecha) then
	ldt_fecha_tope	= RelativeDate(ld_fecha_asigna, 15)
	if ld_fecha > ldt_fecha_tope then
		dw_ingreso.setitem(1,'fecha_prox_llamado',ld_nulo)
		dw_ingreso.accepttext()
	end if
end if
if ls_columna<>'base' and ls_columna<>'serie' and ls_columna<>'numero' and dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
	ls_base				= dw_ingreso.getitemstring(1,'base')
	ls_serie				= dw_ingreso.getitemstring(1,'serie')
	ll_numero			= dw_ingreso.getitemnumber(1,'numero')
	ls_estado_gestion	= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
	if ll_numero > 0 and not isnull(ls_base) and not isnull(ls_serie) then
		SELECT	"CD_FOLIO"."ULT_ESTADO"
		INTO 		:ll_estado
		FROM		"CD_FOLIO",	"CD_ESTADO"  
		WHERE  ( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
				 (("CD_FOLIO"."BASE" = :ls_base ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
//			dw_ingreso.setitem(1,'base',ls_nulo)
//			dw_ingreso.setitem(1,'serie',ls_nulo)
			dw_ingreso.setitem(1,'numero',ll_nulo)
			dw_ingreso.accepttext()
		end if
	end if
end if
end event

event clicked;String	ls_columna,ls_fecha,ls_estado
Date		ld_fecha_hoy

ls_estado		= dw_ingreso.getitemstring(1,'estado_gestion')
if not isnull(ls_estado) then
	ld_fecha_hoy	= date(gdt_fec_sistema)
	ls_columna		= dwo.name
	if ls_columna='p_1' then
		ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado')))
		if isnull(ls_fecha) then ls_fecha = string(ld_fecha_hoy,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso.setitem(1,'fecha_prox_llamado',datetime(string(ld_fecha_hoy,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso.setitem(1,'fecha_prox_llamado',date(ls_fecha))
		END IF
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_prox_llamado')
	end if
end if
end event

event constructor;if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then	//dw_ingreso_gestion_supervisor_ugn
	dw_ingreso.getchild('serie',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.insertrow(0)
end if
end event

type dw_cliente2 from datawindow within tabpage_4
integer x = 14
integer y = 8
integer width = 2473
integer height = 360
integer taborder = 20
string title = "none"
string dataobject = "dw_antecedentes_cliente_ugn_titulo"
boolean border = false
boolean livescroll = true
end type

type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
integer x = 9
integer y = 364
integer width = 2469
integer height = 540
integer taborder = 40
string title = "none"
string dataobject = "dw_ultima_cobranza_ugn"
boolean border = false
boolean livescroll = true
end type

type cb_grabar from commandbutton within tabpage_4
integer x = 18
integer y = 1820
integer width = 1225
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Grabar"
end type

event clicked;long		ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_nro_grupo,ll_sum_reg,ll_count_reg,ll_row,ll_grupo,ll_correlativo,ll_grupo_asignado,ll_nota_mc,ll_nota_serv,&
			ll_nota_1,ll_nota_2
String		ls_glosa,ls_estado,ls_estado_tele='19',ls_glosa_tele,ls_string,ls_estado_reg
Datetime	ldt_fecha,ldt_fecha_prox

dw_ingreso.accepttext()
ls_estado		= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
ls_glosa			= trim(dw_ingreso.getitemstring(1,'glosa_gestion'))
ldt_fecha_prox	= dw_ingreso.getitemdatetime(1,'fecha_prox_llamado')
ldt_fecha			= dw_ingreso.getitemdatetime(1,'fecha_gestion')
ll_nota_serv		= dw_encuesta.getitemnumber(1,'nota_servicio')
ll_nota_mc		= dw_encuesta.getitemnumber(1,'nota_maestro_c')
if not isnull(ls_estado) and not isnull(ls_glosa)and not isnull(ldt_fecha_prox) then
	ll_ret 		= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING		sqlca;
		if isvalid(w_ingreso_individual_ugn) then
			ll_row		= w_ingreso_individual_ugn.dw_lista.getrow()
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_prox_llamado_cob',ldt_fecha_prox)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_estado_gestion',ls_estado)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_fecha_gestion',ldt_fecha)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_glosa_gestion',ls_glosa)
			w_ingreso_individual_ugn.dw_lista.accepttext()
			ll_grupo				= w_ingreso_individual_ugn.dw_lista.getitemnumber(w_ingreso_individual_ugn.dw_lista.getrow(),'ugn_cliente_grupo')
			ll_correlativo		= w_ingreso_individual_ugn.dw_lista.getitemnumber(w_ingreso_individual_ugn.dw_lista.getrow(),'ugn_cliente_correlativo')
			UPDATE	"UGN_CLIENTE"  
			SET 		"ULT_ESTADO_GESTION" = :ls_estado,   
						"ULT_FECHA_GESTION" = :ldt_fecha,   
						"ULT_GLOSA_GESTION" = :ls_glosa,   
						"PROX_LLAMADO_COB" = :ldt_fecha_prox  
			WHERE  ( "UGN_CLIENTE"."GRUPO" = :ll_grupo ) AND  
					 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_correlativo )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then // UGN
					dw_ingreso.setitem(1,'grupo',ll_grupo)				
				elseif dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then //dw_ingreso_gestion_ejecutivo_ugn
					dw_ingreso.setitem(1,'grupo',ll_grupo)
					SELECT DISTINCT "UGN_EJECUTIVO_DETALLE"."GRUPO"  
					INTO 	 	:ll_grupo_asignado  
					FROM 	 "UGN_EJECUTIVO_DETALLE"  
					WHERE	 ( "UGN_EJECUTIVO_DETALLE"."GRUPO_CLIENTE" = :ll_grupo ) AND  
								 ( "UGN_EJECUTIVO_DETALLE"."CORRELATIVO_CLIENTE" = :ll_correlativo )// AND  
					//			 ( "UGN_EJECUTIVO_DETALLE"."ESTADO_GESTION" = '0' )   
					USING  sqlca;
					if sqlca.sqlcode = 0 then
						dw_ingreso.setitem(1,'grupo_asignacion',ll_grupo_asignado)
					else
						rollback;
					//	messagebox("Advertencia","Error Grabar Lista Gestión SQL:  "+sqlca.sqlerrtext)
					end if	
				end if
				dw_ingreso.accepttext()
				if dw_ingreso.update() = 1 then
					commit;
					//if dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
					if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then
						ls_estado_reg	= 'J'
						ll_nota_serv		= dw_encuesta.getitemnumber(1,'nota_servicio')
						ll_nota_mc		= dw_encuesta.getitemnumber(1,'nota_maestro_c')
						SELECT	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO",   
									"UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
						INTO 		:ll_nota_1,:ll_nota_2  
						FROM 	"UGN_ENCUESTA_SERVICIO"  
						WHERE 	( "UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo ) AND  
									( "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_correlativo )
						USING	sqlca;

						if (not isnull(ll_nota_serv) or not isnull(ll_nota_mc))and isnull(ll_nota_1) and isnull(ll_nota_2) then
							messagebox('Advertencia','No se Ingreso Datos de Encuesta')
						elseif ll_nota_1 > 0 and ll_nota_2 > 0 then
							messagebox('Advertencia','Datos de Encuesta Ya Ingresados')
						else
							if ll_nota_serv > 0 and ll_nota_mc > 0 then
								INSERT INTO "UGN_ENCUESTA_SERVICIO"  
											( "NOTA_SERVICIO", "NOTA_MAESTRO_C","DESCRIPCION_NOTA","GRUPO","CORRELATIVO" )  
								VALUES 	( :ll_nota_serv,:ll_nota_mc,null,:ll_grupo, :ll_correlativo )  
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
									messagebox('Error Grabar','Error al Actualizar UGN_ENCUESTA SQL: '+sqlca.SQLErrText,information!)
								end if
							end if
						end if
					//elseif dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then
					elseif dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
						ls_estado_reg	= 'G'
					end if
					UPDATE	"UGN_CLIENTE"  
					SET 		"ESTADO_REGISTRO" = :ls_estado_reg  
					WHERE  ( "UGN_CLIENTE"."GRUPO" = :ll_grupo ) AND  
							 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_correlativo )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox('Error Grabar','Error al Actualizar UGN_CLIENTE SQL: '+sqlca.SQLErrText,information!)
					end if
					messagebox("Grabar","Grabación Exitosa")
					if isvalid(w_ingreso_individual_ugn) then
						w_ingreso_individual_ugn.tab_cobranza.visible						= false
					end if
				else
				//	messagebox('Error Grabar','Error al Grabar Detalle_Gestión SQL: '+sqlca.SQLErrText,information!)
					ROLLBACK;
				end if
			else
				rollback;
			//	messagebox("Advertencia","Error Grabar Lista Gestión SQL:  "+sqlca.sqlerrtext)
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Datos")
	dw_ingreso.setfocus()
end if
end event

type cb_cerrar_4 from commandbutton within tabpage_4
integer x = 1248
integer y = 1820
integer width = 1216
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

