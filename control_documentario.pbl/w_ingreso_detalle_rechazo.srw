forward
global type w_ingreso_detalle_rechazo from window
end type
type cb_insertar from commandbutton within w_ingreso_detalle_rechazo
end type
type cb_eliminar from commandbutton within w_ingreso_detalle_rechazo
end type
type st_3 from statictext within w_ingreso_detalle_rechazo
end type
type st_2 from statictext within w_ingreso_detalle_rechazo
end type
type cb_cerrar from commandbutton within w_ingreso_detalle_rechazo
end type
type dw_lista_3 from datawindow within w_ingreso_detalle_rechazo
end type
type dw_lista_2 from datawindow within w_ingreso_detalle_rechazo
end type
type cb_grabar from commandbutton within w_ingreso_detalle_rechazo
end type
type cb_imprimir from commandbutton within w_ingreso_detalle_rechazo
end type
end forward

global type w_ingreso_detalle_rechazo from window
integer width = 2784
integer height = 1900
boolean titlebar = true
string title = "Ingreso Rechazo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_insertar cb_insertar
cb_eliminar cb_eliminar
st_3 st_3
st_2 st_2
cb_cerrar cb_cerrar
dw_lista_3 dw_lista_3
dw_lista_2 dw_lista_2
cb_grabar cb_grabar
cb_imprimir cb_imprimir
end type
global w_ingreso_detalle_rechazo w_ingreso_detalle_rechazo

type variables
Long		il_grupo,il_row,il_row_3,il_cod_estado
String	is_base,is_serie,is_opcion,is_glosa
Datetime	idt_fecha_crea
Date		id_fecha
Double	il_numero
DragObject control_dw
end variables

on w_ingreso_detalle_rechazo.create
this.cb_insertar=create cb_insertar
this.cb_eliminar=create cb_eliminar
this.st_3=create st_3
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista_3=create dw_lista_3
this.dw_lista_2=create dw_lista_2
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.Control[]={this.cb_insertar,&
this.cb_eliminar,&
this.st_3,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista_3,&
this.dw_lista_2,&
this.cb_grabar,&
this.cb_imprimir}
end on

on w_ingreso_detalle_rechazo.destroy
destroy(this.cb_insertar)
destroy(this.cb_eliminar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista_3)
destroy(this.dw_lista_2)
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
end on

event open;String	ls_fecha,ls_hora,ls_fecha_comp
gf_centrar(w_ingreso_detalle_rechazo)
is_base							= trim(substr(1,1,Message.StringParm))
is_serie							= trim(substr(1,2,Message.StringParm))
il_numero						= Double(substr(1,3,Message.StringParm))
ls_fecha_comp					= trim(substr(1,4,Message.StringParm))
ls_fecha							= mid(ls_fecha_comp,1,10)
ls_hora							= mid(ls_fecha_comp,11)
idt_fecha_crea					= datetime(date(ls_fecha),time(ls_hora))
is_opcion						= trim(substr(1,5,Message.StringParm))
is_glosa							= trim(substr(1,6,Message.StringParm))
il_cod_estado					= long(substr(1,7,Message.StringParm))
dw_lista_2.settransobject(sqlca)
dw_lista_3.settransobject(sqlca)
id_fecha							= RelativeDate(date(idt_fecha_crea),10)
if is_opcion='M' then
	st_2.visible				= false
	dw_lista_2.visible		= false
	st_3.y						= 24
	dw_lista_3.y				= 96
	dw_lista_3.height			= 1524
	if dw_lista_3.retrieve(is_base,is_serie,il_numero,is_glosa,idt_fecha_crea)=0 then
		messagebox("Advertencia","No Registra Dato")
		cb_cerrar.triggerevent(clicked!)
	else
		cb_grabar.visible		= false
		cb_insertar.visible	= false
		cb_eliminar.visible	= false
		cb_imprimir.visible	= true
		dw_lista_2.retrieve(3)
		dw_lista_3.object.t_titulo.text	= 'Rechazo Contrato Nº: '+ is_base +'-'+ is_serie +'-'+string( il_numero ,"###,###,###,###")
	end if
elseif is_opcion='N' then
	cb_imprimir.visible		= false
	st_2.visible				= true
	dw_lista_2.visible		= true
	cb_grabar.visible			= true
	cb_insertar.visible		= true
	cb_eliminar.visible		= true
	st_3.y						= 860
	dw_lista_3.y				= 932
	dw_lista_3.height			= 688
	dw_lista_2.retrieve(3)
	dw_lista_3.object.t_titulo.text	= 'Rechazo Contrato Nº: '+ is_base +'-'+ is_serie +'-'+string( il_numero ,"###,###,###,###")
end if
end event

type cb_insertar from commandbutton within w_ingreso_detalle_rechazo
integer x = 1029
integer y = 1664
integer width = 352
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;Long		ll_new,ll_tot_reg,ll_indi,ll_cod_grupo,ll_excepcion,ll_count=0
String	ls_descrip_2,ls_descrip_3
il_row	= dw_lista_2.getrow()
if il_row>0 then
	ll_tot_reg	= dw_lista_3.rowcount()
	if ll_tot_reg>0 then
		ls_descrip_2	= trim(dw_lista_2.getitemstring(il_row,'cd_tipo_rechazo_detalle_descripcion'))
		for ll_indi=1 to ll_tot_reg
			ll_cod_grupo	= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_rechazo')
			ll_excepcion	= dw_lista_3.getitemnumber(ll_indi,'codigo_rechazo')
			SELECT	"CD_TIPO_RECHAZO_DETALLE"."DESCRIPCION"  
			INTO 		:ls_descrip_3  
			FROM 		"CD_TIPO_RECHAZO_DETALLE"  
			WHERE  ( "CD_TIPO_RECHAZO_DETALLE"."CODIGO" = :ll_excepcion) AND  
					 ( "CD_TIPO_RECHAZO_DETALLE"."TIPO_RECHAZO" = :ll_cod_grupo  )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_descrip_3	= trim(ls_descrip_3)
				if ls_descrip_2 = ls_descrip_3 then
					messagebox("Advertencia","Rechazo Duplicada")
					ll_count ++
					exit
				end if
			end if
		next
	end if
	if ll_count=0 then
		if il_cod_estado=10 or il_cod_estado=27 then
			ll_cod_grupo	= 3
		elseif il_cod_estado=5 or il_cod_estado=24 then
			ll_cod_grupo	= 12
		end if
		ll_excepcion	= dw_lista_2.getitemnumber(il_row,'cd_tipo_rechazo_detalle_codigo')
		ll_new	= dw_lista_3.insertrow(0)
		dw_lista_3.scrolltorow(ll_new)
		dw_lista_3.setitem(ll_new,'base',is_base)
		dw_lista_3.setitem(ll_new,'serie',is_serie)
		dw_lista_3.setitem(ll_new,'numero',il_numero)
		dw_lista_3.setitem(ll_new,'fecha_crea',idt_fecha_crea)
		dw_lista_3.setitem(ll_new,'referencia_memo',is_glosa)
		dw_lista_3.setitem(ll_new,'codigo_grupo_rechazo',ll_cod_grupo)
		dw_lista_3.setitem(ll_new,'codigo_rechazo',ll_excepcion)
		dw_lista_3.setitem(ll_new,'estado','P')
		dw_lista_3.accepttext()
	end if
else
	if il_row=0 or isnull(il_row) then
		messagebox("Advertencia","Debe Seleccionar Opción")
		dw_lista_2.setfocus()
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_detalle_rechazo
integer x = 1390
integer y = 1664
integer width = 352
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long	ll_resp
if il_row_3>0 then
	ll_resp	= messagebox("Eliminar","Está Seguro de Eliminar Fila Nº "+string(il_row_3)+ ', recuerde Grabar antes de Cerrar ',Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista_3.deleterow(il_row_3)
		dw_lista_3.accepttext()
	end if
end if
end event

type st_3 from statictext within w_ingreso_detalle_rechazo
integer x = 55
integer y = 860
integer width = 1243
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rechazos Asignados al Documento"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingreso_detalle_rechazo
integer x = 55
integer y = 16
integer width = 645
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_detalle_rechazo
integer x = 2354
integer y = 1664
integer width = 352
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_detalle_rechazo)
end event

type dw_lista_3 from datawindow within w_ingreso_detalle_rechazo
integer x = 55
integer y = 932
integer width = 2651
integer height = 688
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_detalle_rechazo"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_3	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_3, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_3	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_3, TRUE)
end if
end event

event dragdrop;Long	ll_new,ll_tot_reg,ll_indi,ll_cod_grupo,ll_excepcion,ll_count=0
String	ls_descrip_2,ls_descrip_3

control_dw					= DraggedObject()
il_row						= dw_lista_2.getrow()
if il_row>0 then
	ll_tot_reg				= dw_lista_3.rowcount()
	if ll_tot_reg>0 then
		ls_descrip_2		= trim(dw_lista_2.getitemstring(il_row,'cd_tipo_rechazo_detalle_descripcion'))
		for ll_indi=1 to ll_tot_reg
			ll_cod_grupo	= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_rechazo')
			ll_excepcion	= dw_lista_3.getitemnumber(ll_indi,'codigo_rechazo')
			SELECT	"CD_TIPO_RECHAZO_DETALLE"."DESCRIPCION"  
			INTO 		:ls_descrip_3  
			FROM 		"CD_TIPO_RECHAZO_DETALLE"  
			WHERE  ( "CD_TIPO_RECHAZO_DETALLE"."CODIGO" = :ll_excepcion  ) AND  
					 ( "CD_TIPO_RECHAZO_DETALLE"."TIPO_RECHAZO" = :ll_cod_grupo)   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_descrip_3	= trim(ls_descrip_3)
				if ls_descrip_2 = ls_descrip_3 then
					messagebox("Advertencia","Rechazo Duplicada")
					ll_count ++
					exit
				end if
			end if
		next
	end if
	if ll_count=0 then
		if il_cod_estado=10 or il_cod_estado=27 then
			ll_cod_grupo	= 3
		elseif il_cod_estado=5 or il_cod_estado=24 then
			ll_cod_grupo	= 12
		end if
		ll_excepcion		= dw_lista_2.getitemnumber(il_row,'cd_tipo_rechazo_detalle_codigo')
		ll_new				= dw_lista_3.insertrow(0)
		dw_lista_3.scrolltorow(ll_new)
		dw_lista_3.setitem(ll_new,'base',is_base)
		dw_lista_3.setitem(ll_new,'serie',is_serie)
		dw_lista_3.setitem(ll_new,'numero',il_numero)
		dw_lista_3.setitem(ll_new,'fecha_crea',idt_fecha_crea)
		dw_lista_3.setitem(ll_new,'referencia_memo',is_glosa)
		dw_lista_3.setitem(ll_new,'codigo_grupo_rechazo',ll_cod_grupo)
		dw_lista_3.setitem(ll_new,'codigo_rechazo',ll_excepcion)
		dw_lista_3.setitem(ll_new,'estado','P')
		dw_lista_3.accepttext()
	end if
else
	if il_row=0 or isnull(il_row) then
		messagebox("Advertencia","Debe Seleccionar Opción")
		dw_lista_2.setfocus()
	end if
end if
end event

event itemchanged;string	ls_string
long ll_codigo

il_row	= this.getrow()
if il_row > 0 then
	ll_codigo			= dw_lista_3.getitemnumber(il_row,'codigo_rechazo')
	if ll_codigo = 25 then
		ls_string			= is_base+'~t'+is_serie+'~t'+string(il_numero)
		if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
		OpenWithparm(w_cd_mantenedor_contrato,ls_string)
	end if	
end if	
end event

type dw_lista_2 from datawindow within w_ingreso_detalle_rechazo
integer x = 55
integer y = 96
integer width = 2651
integer height = 716
integer taborder = 10
string dragicon = "Exclamation!"
string title = "none"
string dataobject = "dw_lista_de_rechazo"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_grabar from commandbutton within w_ingreso_detalle_rechazo
integer x = 55
integer y = 1664
integer width = 352
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long	ll_grupo,ll_excepcion,ll_grabar_1,ll_grabar_2,ll_grabar_3
if is_opcion='N' then
	if dw_lista_3.rowcount()>0 then
		if isvalid(w_cd_gestion_folio) then
			ll_grupo			= 3
			ll_excepcion	= dw_lista_2.getitemnumber(dw_lista_2.getrow(),'cd_tipo_rechazo_detalle_codigo')
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_tipo_rechazo',ll_excepcion)
			w_cd_gestion_folio.dw_lista.accepttext()
			ll_grabar_1		= w_cd_gestion_folio.dw_lista.update()
			if ll_grabar_1 = 1 then 
				UPDATE	"CD_FOLIO_DETALLE"  
				SET 		"TIPO_RECHAZO" = :ll_excepcion  
				WHERE  ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
						 ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) AND  
						 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = (SELECT MAX("CD_FOLIO_DETALLE"."FECHA_CREA") FROM "CD_FOLIO_DETALLE" WHERE ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_grabar_2	= 1
				else
					ll_grabar_2	= 0
				end if
			end if
		elseif isvalid(w_documentos_pendientes) then
			ll_grupo			= 3
			ll_excepcion	= dw_lista_2.getitemnumber(dw_lista_2.getrow(),'cd_tipo_rechazo_detalle_codigo')
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_tipo_rechazo',ll_excepcion)
			w_documentos_pendientes.dw_lista.accepttext()
			ll_grabar_1		= w_documentos_pendientes.dw_lista.update()
			if ll_grabar_1 = 1 then 
				UPDATE	"CD_FOLIO_DETALLE"  
				SET 		"TIPO_RECHAZO" = :ll_excepcion  
				WHERE  ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
						 ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) AND  
						 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = (SELECT MAX("CD_FOLIO_DETALLE"."FECHA_CREA") FROM "CD_FOLIO_DETALLE" WHERE ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_grabar_2	= 1
				else
					ll_grabar_2	= 0
				end if
			end if
		elseif isvalid(w_validar_promesa_operaciones) then
			ll_grupo			= 3
			ll_excepcion	= dw_lista_2.getitemnumber(dw_lista_2.getrow(),'cd_tipo_rechazo_detalle_codigo')
			UPDATE	"CD_FOLIO"  
			SET 		"ULT_TIPO_RECHAZO" = :ll_excepcion  
			WHERE  ( "CD_FOLIO"."BASE" = :is_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :is_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :il_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_grabar_1	= 1
				UPDATE	"CD_FOLIO_DETALLE"  
				SET 		"TIPO_RECHAZO" = :ll_excepcion  
				WHERE  ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
						 ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) AND  
						 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = (SELECT MAX("CD_FOLIO_DETALLE"."FECHA_CREA") FROM "CD_FOLIO_DETALLE" WHERE ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND ( "CD_FOLIO_DETALLE"."ESTADO" = :il_cod_estado ) ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_grabar_2	= 1
				else
					ll_grabar_2	= 0
				end if
			end if
		end if
		ll_grabar_3		= dw_lista_3.update()
		if ll_grabar_1=1 and ll_grabar_2=1 and ll_grabar_3=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_cd_ingresar_control_documentacion) then 
				w_cd_ingresar_control_documentacion.cbx_tipo_rechazo.enabled	= false
			elseif isvalid(w_validar_promesa_operaciones) then
				w_validar_promesa_operaciones.cbx_tipo_rechazo.enabled			= false
			end if
			close(w_cd_memorandum)
			cb_cerrar.triggerevent(clicked!)
		else
			rollback using sqlca;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif is_opcion='M' then
	if dw_lista_3.rowcount()>0 then
		ll_grabar_3		= dw_lista_3.update()
		if ll_grabar_3=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
			close(w_cd_memorandum)
			cb_cerrar.triggerevent(clicked!)
		else
			rollback using sqlca;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","No Registra Dato a Grabar")
	end if
end if
end event

type cb_imprimir from commandbutton within w_ingreso_detalle_rechazo
integer x = 55
integer y = 1664
integer width = 352
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&mprimir"
end type

event clicked;if dw_lista_3.rowcount()>0 then f_Print( dw_lista_3 )
end event

