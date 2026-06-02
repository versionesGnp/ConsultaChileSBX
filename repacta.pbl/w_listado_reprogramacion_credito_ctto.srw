forward
global type w_listado_reprogramacion_credito_ctto from window
end type
type cb_anular from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type cb_filtrar from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type cb_sort from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type cb_exportar from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type cb_print from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type dw_ctto from datawindow within w_listado_reprogramacion_credito_ctto
end type
type dw_print from datawindow within w_listado_reprogramacion_credito_ctto
end type
type cb_cerrar from commandbutton within w_listado_reprogramacion_credito_ctto
end type
type dw_lista from datawindow within w_listado_reprogramacion_credito_ctto
end type
type gb_1 from groupbox within w_listado_reprogramacion_credito_ctto
end type
end forward

global type w_listado_reprogramacion_credito_ctto from window
integer width = 3227
integer height = 1924
boolean titlebar = true
string title = "Listado Reprogramación de Crédito"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_anular cb_anular
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_print cb_print
dw_ctto dw_ctto
dw_print dw_print
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_listado_reprogramacion_credito_ctto w_listado_reprogramacion_credito_ctto

type variables
Long	il_row
end variables

on w_listado_reprogramacion_credito_ctto.create
this.cb_anular=create cb_anular
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_print=create cb_print
this.dw_ctto=create dw_ctto
this.dw_print=create dw_print
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_anular,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_print,&
this.dw_ctto,&
this.dw_print,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_listado_reprogramacion_credito_ctto.destroy
destroy(this.cb_anular)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_print)
destroy(this.dw_ctto)
destroy(this.dw_print)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_new
Double	ll_numero,ll_numero_1
String		ls_base,ls_serie,ls_estado,ls_tipo_reprog,ls_base_1,ls_serie_1,ls_usuario
Date		ldt_fecha
Double	ldb_suma

this.title						= 'Listado Reprogramación de Crédito Contrato Nº '+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")
gf_centrar(w_listado_reprogramacion_credito_ctto)
dw_lista.settransobject(sqlca)
if gs_base='O' then
	dw_ctto.dataobject	= 'd_datos_cuenta_ci_oferta_repacta'
elseif gs_base='P' then
	dw_ctto.dataobject	= 'd_datos_cuenta_ci_pagare_repacta'
end if
dw_ctto.settransobject(sqlca)
dw_print.settransobject(sqlca)

ls_base_1					= gs_base
ls_serie_1					= gs_serie
ll_numero_1					= gi_numero

if dw_lista.retrieve(gs_base,gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_listado_reprogramacion_credito_ctto)
else
	if dw_ctto.retrieve(gs_serie,gi_numero)=0 then
		close(w_listado_reprogramacion_credito_ctto)
	else
		if gs_depto='I' or gs_depto='O' or gs_solicitudes='2' then
			cb_anular.visible	= true
		else
			cb_anular.visible	= false
		end if
		dw_lista.scrolltorow(1)
		ls_usuario				= gs_nom_comp_usuario
		ls_base					= dw_lista.getitemstring(1,'base')
		ls_serie					= dw_lista.getitemstring(1,'serie')
		ll_numero				= dw_lista.getitemnumber(1,'numero')
		ls_estado				= dw_lista.getitemstring(1,'estado')
		ldt_fecha					= DATE(dw_lista.getitemdatetime(1,'fecha_crea'))
		ls_tipo_reprog			= dw_lista.getitemstring(1,'repacta_credito_tipo_reprog')
		SELECT 		SUM( "SEGURO_ASOCIADOS"."MONTO_PRIMA" )
		INTO			:ldb_suma
		FROM			"SEGURO_ASOCIADOS"
		WHERE	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
					  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
				 	  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
				  	  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  	  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND  
				  	  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )     
		USING		sqlca;
		if ll_numero>0 then
			if dw_print.retrieve(ls_base,ls_serie,ll_numero,gs_nom_comp_usuario,ls_estado,ldt_fecha,ldb_suma)=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				if ls_tipo_reprog='A' then
					dw_print.object.t_titulo.text	= 'Reprogramación por Uso Anticipado'
				else
					dw_print.object.t_titulo.text	= 'Reprogramación'
				end if
			end if
		end if
	end if
end if
end event

type cb_anular from commandbutton within w_listado_reprogramacion_credito_ctto
boolean visible = false
integer x = 768
integer y = 1696
integer width = 265
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;String	ls_base,ls_serie,ls_estado,ls_base_ori,ls_serie_ori
Double	ll_numero,ll_numero_ori
Long		ll_count,ll_resp
if gs_depto='I' or gs_depto='O' or gs_solicitudes='2' then
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ls_estado		= dw_lista.getitemstring(il_row,'estado')
	ls_base_ori		= dw_lista.getitemstring(il_row,'base_original')
	ls_serie_ori	= dw_lista.getitemstring(il_row,'serie_original')
	ll_numero_ori	= dw_lista.getitemnumber(il_row,'numero_original')
	if ls_estado='V' then
		SELECT	count("SOL_ESTATUS"."BASE")
		INTO 		:ll_count  
		FROM 		"SOL_ESTATUS",   
					"SOL_RESCILIA_REPROG"  
		WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
				 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
				 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
				 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' ) AND  
				 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
				 ( "SOL_ESTATUS"."BASE" = :ls_base_ori ) AND  
				 ( "SOL_ESTATUS"."SERIE" = :ls_serie_ori ) AND  
				 ( "SOL_ESTATUS"."NUMERO" = :ll_numero_ori ) )   
		USING		sqlca;
		if ll_count>0 then
			messagebox("Advertencia","No Es posible Anular, Existe Solicitud 2-Resciliación por Reprogramación asociado al Contrato Nº "+ls_base_ori+'-'+ls_serie_ori+'-'+string(ll_numero_ori,"###,###,###,###,###"))
		else
			ll_resp	= messagebox("Anular","Está Seguro de Anular Reprogramación Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###"),Exclamation!,YesNo!,2)
			if ll_resp=1 then
				dw_lista.setitem(il_row,'estado','A')
				dw_lista.accepttext()
				if dw_lista.update()=1 then
					commit;

					DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_ori,:ls_serie_ori,:ll_numero_ori,'M');
					EXECUTE sp_nuevo_cadena_mora1;

					messagebox("Anular","Anulación Exitosa")
					dw_print.reset()
					il_row	= 0
				else
					rollback;
					messagebox("Error Anular","Error al Anular Repacta_credito SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type cb_filtrar from commandbutton within w_listado_reprogramacion_credito_ctto
integer x = 2295
integer y = 1700
integer width = 201
integer height = 84
integer taborder = 70
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

type cb_sort from commandbutton within w_listado_reprogramacion_credito_ctto
integer x = 2053
integer y = 1700
integer width = 238
integer height = 84
integer taborder = 60
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

type cb_exportar from commandbutton within w_listado_reprogramacion_credito_ctto
integer x = 1806
integer y = 1700
integer width = 242
integer height = 84
integer taborder = 50
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

type cb_print from commandbutton within w_listado_reprogramacion_credito_ctto
integer x = 32
integer y = 1696
integer width = 617
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Reprogramación"
end type

event clicked;if dw_print.rowcount()>0 then
	f_Print( dw_print )
end if
end event

type dw_ctto from datawindow within w_listado_reprogramacion_credito_ctto
boolean visible = false
integer x = 635
integer y = 1732
integer width = 1134
integer height = 432
string title = "none"
string dataobject = "d_datos_cuenta_ci_oferta_repacta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print from datawindow within w_listado_reprogramacion_credito_ctto
integer x = 32
integer y = 580
integer width = 3136
integer height = 1076
integer taborder = 20
string title = "none"
string dataobject = "dw_imprimir_repro_cred_consultada_print"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_listado_reprogramacion_credito_ctto
integer x = 2834
integer y = 1696
integer width = 334
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_reprogramacion_credito_ctto)
end event

type dw_lista from datawindow within w_listado_reprogramacion_credito_ctto
integer x = 32
integer y = 24
integer width = 3136
integer height = 528
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_repactacion_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_base,ls_serie,ls_estado,ls_tipo_reprog
Date		ldt_fecha
Double	ldb_suma,ll_numero

if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ls_estado		= dw_lista.getitemstring(il_row,'estado')
	ldt_fecha			= DATE(dw_lista.getitemdatetime(il_row,'fecha_crea'))
	ls_tipo_reprog	= dw_lista.getitemstring(il_row,'repacta_credito_tipo_reprog')
	SELECT 		SUM( "SEGURO_ASOCIADOS"."MONTO_PRIMA" )
	INTO			:ldb_suma
	FROM			"SEGURO_ASOCIADOS"
   	WHERE	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
         		  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND  
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )     
	USING		sqlca;

	if dw_print.retrieve(ls_base,ls_serie,ll_numero,gs_nom_comp_usuario,ls_estado,ldt_fecha,ldb_suma)=0 then
		messagebox("Advertencia","No Registra Dato")
	else
		if ls_tipo_reprog='A' then
			dw_print.object.t_titulo.text	= 'Reprogramación por Uso Anticipado'
		else
			dw_print.object.t_titulo.text	= 'Reprogramación'
		end if
	end if
end if
end event

event rowfocuschanged;String		ls_base,ls_serie,ls_estado,ls_tipo_reprog,ls_usuario
Date		ldt_fecha
Double	ldb_suma,ll_numero

if this.getrow()>0 then
	il_row				= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_usuario		= gs_nom_comp_usuario
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ls_estado		= dw_lista.getitemstring(il_row,'estado')
	ldt_fecha			= DATE(dw_lista.getitemdatetime(il_row,'fecha_crea'))
	ls_tipo_reprog	= dw_lista.getitemstring(il_row,'repacta_credito_tipo_reprog')
	SELECT 		SUM( "SEGURO_ASOCIADOS"."MONTO_PRIMA" )
	INTO			:ldb_suma
	FROM			"SEGURO_ASOCIADOS"
   	WHERE	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
         		  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND  
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )     
	USING		sqlca;
	if dw_print.retrieve(ls_base,ls_serie,ll_numero,gs_nom_comp_usuario,ls_estado,ldt_fecha,ldb_suma)=0 then
		messagebox("Advertencia","No Registra Dato")
	else
		if ls_tipo_reprog='A' then
			dw_print.object.t_titulo.text	= 'Reprogramación por Uso Anticipado'
		else
			dw_print.object.t_titulo.text	= 'Reprogramación'
		end if
	end if
end if
end event

type gb_1 from groupbox within w_listado_reprogramacion_credito_ctto
integer x = 1783
integer y = 1652
integer width = 741
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

