forward
global type w_ingreso_detalle_excepciones_bkp from window
end type
type cb_insertar from commandbutton within w_ingreso_detalle_excepciones_bkp
end type
type cb_eliminar from commandbutton within w_ingreso_detalle_excepciones_bkp
end type
type st_3 from statictext within w_ingreso_detalle_excepciones_bkp
end type
type st_2 from statictext within w_ingreso_detalle_excepciones_bkp
end type
type cb_cerrar from commandbutton within w_ingreso_detalle_excepciones_bkp
end type
type dw_lista_3 from datawindow within w_ingreso_detalle_excepciones_bkp
end type
type dw_lista_2 from datawindow within w_ingreso_detalle_excepciones_bkp
end type
type cb_grabar from commandbutton within w_ingreso_detalle_excepciones_bkp
end type
type cb_imprimir from commandbutton within w_ingreso_detalle_excepciones_bkp
end type
end forward

global type w_ingreso_detalle_excepciones_bkp from window
integer width = 2784
integer height = 1900
boolean titlebar = true
string title = "Ingreso Excepciones"
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
global w_ingreso_detalle_excepciones_bkp w_ingreso_detalle_excepciones_bkp

type variables
Long		il_grupo,il_row,il_row_3,il_estado
Double	il_numero
String		is_base,is_serie,is_referencia,is_opcion,is_memo
Datetime	idt_fecha_crea
Date		id_fecha
DragObject control_dw
end variables

on w_ingreso_detalle_excepciones_bkp.create
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

on w_ingreso_detalle_excepciones_bkp.destroy
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
gf_centrar(w_ingreso_detalle_excepciones)
is_base							= trim(substr(1,1,Message.StringParm))
is_serie							= trim(substr(1,2,Message.StringParm))
il_numero						= Double(substr(1,3,Message.StringParm))
is_referencia					= trim(substr(1,4,Message.StringParm))
ls_fecha_comp					= trim(substr(1,5,Message.StringParm))
ls_fecha							= mid(ls_fecha_comp,1,10)
ls_hora							= mid(ls_fecha_comp,11)
idt_fecha_crea					= datetime(date(ls_fecha),time(ls_hora))
is_opcion						= trim(substr(1,6,Message.StringParm))
is_memo							= trim(substr(1,7,Message.StringParm))
il_estado						= long(substr(1,8,Message.StringParm))
dw_lista_2.settransobject(sqlca)
dw_lista_3.settransobject(sqlca)
id_fecha							= RelativeDate(date(idt_fecha_crea),10)
if is_opcion='M' then
	st_2.visible				= false
	dw_lista_2.visible		= false
	st_3.y						= 24
	dw_lista_3.y				= 96
	dw_lista_3.height			= 1524
	if dw_lista_3.retrieve(is_base,is_serie,il_numero,is_referencia,idt_fecha_crea)=0 then
		messagebox("Advertencia","No Registra Dato")
		cb_cerrar.triggerevent(clicked!)
	else
		cb_grabar.visible		= false
		cb_insertar.visible	= false
		cb_eliminar.visible	= false
		cb_imprimir.visible	= true
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
end if
dw_lista_2.retrieve(3)
dw_lista_3.object.t_titulo.text	= 'Excepciones Contrato Nº: '+ is_base +'-'+ is_serie +'-'+string( il_numero ,"###,###,###,###")+'              Ref.Memo: '+  is_referencia 
end event

type cb_insertar from commandbutton within w_ingreso_detalle_excepciones_bkp
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
		ls_descrip_2	= trim(dw_lista_2.getitemstring(il_row,'descripcion'))
		for ll_indi=1 to ll_tot_reg
			ll_cod_grupo	= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
			ll_excepcion	= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
			SELECT	"CD_TIPO_EXCEPCION_DETALLE"."DESCRIPCION"  
			INTO 		:ls_descrip_3  
			FROM 		"CD_TIPO_EXCEPCION_DETALLE"  
			WHERE  ( "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" = :ll_excepcion) AND  
					 ( "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" = :ll_cod_grupo  )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_descrip_3	= trim(ls_descrip_3)
				if ls_descrip_2 = ls_descrip_3 then
					messagebox("Advertencia","Excepción Duplicada")
					ll_count ++
					exit
				end if
			end if
		next
	end if
	if ll_count=0 then
		ll_cod_grupo	= 3
		ll_excepcion	= dw_lista_2.getitemnumber(il_row,'codigo')
		ll_new	= dw_lista_3.insertrow(0)
		dw_lista_3.scrolltorow(ll_new)
		dw_lista_3.setitem(ll_new,'base',is_base)
		dw_lista_3.setitem(ll_new,'serie',is_serie)
		dw_lista_3.setitem(ll_new,'numero',il_numero)
		dw_lista_3.setitem(ll_new,'referencia_memo',is_referencia)
		dw_lista_3.setitem(ll_new,'fecha_crea',idt_fecha_crea)
		dw_lista_3.setitem(ll_new,'codigo_grupo_excepcion',ll_cod_grupo)
		dw_lista_3.setitem(ll_new,'codigo_excepcion',ll_excepcion)
		dw_lista_3.setitem(ll_new,'fecha_entrega_pendiente',id_fecha)
		dw_lista_3.setitem(ll_new,'estado_entrega','P')
		dw_lista_3.accepttext()
	end if
else
	if il_row=0 or isnull(il_row) then
		messagebox("Advertencia","Debe Seleccionar Opción")
		dw_lista_2.setfocus()
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_detalle_excepciones_bkp
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

type st_3 from statictext within w_ingreso_detalle_excepciones_bkp
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
string text = "Excepciones Asignadas al Memorandum"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingreso_detalle_excepciones_bkp
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

type cb_cerrar from commandbutton within w_ingreso_detalle_excepciones_bkp
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

event clicked;if isvalid(w_cd_memorandum) then
	w_cd_memorandum.mle_memo.enabled			= true
	w_cd_memorandum.em_referencia.enabled	= true
	w_cd_memorandum.cb_grabar.enabled		= true
	w_cd_memorandum.cbx_excepcion.enabled	= true
	w_cd_memorandum.cb_cerrar.enabled		= true
end if
close(w_ingreso_detalle_excepciones)
end event

type dw_lista_3 from datawindow within w_ingreso_detalle_excepciones_bkp
integer x = 55
integer y = 932
integer width = 2651
integer height = 688
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_detalle_excepcion"
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
		ls_descrip_2		= trim(dw_lista_2.getitemstring(il_row,'descripcion'))
		for ll_indi=1 to ll_tot_reg
			ll_cod_grupo	= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
			ll_excepcion	= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
			SELECT	"CD_TIPO_EXCEPCION_DETALLE"."DESCRIPCION"  
			INTO 		:ls_descrip_3  
			FROM 		"CD_TIPO_EXCEPCION_DETALLE"  
			WHERE  ( "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" = :ll_excepcion  ) AND  
					 ( "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" = :ll_cod_grupo)   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_descrip_3	= trim(ls_descrip_3)
				if ls_descrip_2 = ls_descrip_3 then
					messagebox("Advertencia","Excepción Duplicada")
					ll_count ++
					exit
				end if
			end if
		next
	end if
	if ll_count=0 then
		ll_cod_grupo	= 3
		ll_excepcion	= dw_lista_2.getitemnumber(il_row,'codigo')
		ll_new			= dw_lista_3.insertrow(0)
		dw_lista_3.scrolltorow(ll_new)
		dw_lista_3.setitem(ll_new,'base',is_base)
		dw_lista_3.setitem(ll_new,'serie',is_serie)
		dw_lista_3.setitem(ll_new,'numero',il_numero)
		dw_lista_3.setitem(ll_new,'referencia_memo',is_referencia)
		dw_lista_3.setitem(ll_new,'fecha_crea',idt_fecha_crea)
		dw_lista_3.setitem(ll_new,'codigo_grupo_excepcion',ll_cod_grupo)
		dw_lista_3.setitem(ll_new,'codigo_excepcion',ll_excepcion)
		dw_lista_3.setitem(ll_new,'fecha_entrega_pendiente',id_fecha)
		dw_lista_3.setitem(ll_new,'estado_entrega','P')
		dw_lista_3.accepttext()
	end if
else
	if il_row=0 or isnull(il_row) then
		messagebox("Advertencia","Debe Seleccionar Opción")
		dw_lista_2.setfocus()
	end if
end if
end event

type dw_lista_2 from datawindow within w_ingreso_detalle_excepciones_bkp
integer x = 55
integer y = 96
integer width = 2651
integer height = 716
integer taborder = 10
string dragicon = "Exclamation!"
string title = "none"
string dataobject = "dw_lista_de_grupo_excepciones_detalle"
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

type cb_grabar from commandbutton within w_ingreso_detalle_excepciones_bkp
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
			ll_excepcion	= dw_lista_2.getitemnumber(dw_lista_2.getrow(),'codigo')
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_memo',is_memo)
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_referencia_memo',is_referencia)
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_tipo_excepcion',ll_grupo)
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_estado_excepcion','S')
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_estado_asociado_excepcion',il_estado)
			w_cd_gestion_folio.dw_lista.accepttext()
			ll_grabar_1		= w_cd_gestion_folio.dw_lista.update()
			if ll_grabar_1 = 1 then
				is_memo	= 'MEMORANDUM: '+is_memo
				INSERT INTO "CD_FOLIO_DETALLE"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO",	"TIPO_EXCEPCION",		"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION")  
				VALUES	( :is_base,	:is_serie,	:il_numero,	:idt_fecha_crea,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:is_memo,	'',				'',						'',						:is_referencia,		:ll_grupo,				'S',						:il_estado )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_grabar_2	= 1
				else
					ll_grabar_2	= 0
				end if
			end if
		elseif isvalid(w_documentos_pendientes) then
			ll_grupo			= 3
			ll_excepcion	= dw_lista_2.getitemnumber(dw_lista_2.getrow(),'codigo')
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_memo',is_memo)
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_referencia_memo',is_referencia)
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_tipo_excepcion',ll_grupo)
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_estado_excepcion','S')
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_estado_asociado_excepcion',il_estado)
			w_documentos_pendientes.dw_lista.accepttext()
			ll_grabar_1		= w_documentos_pendientes.dw_lista.update()
			if ll_grabar_1 = 1 then
				is_memo	= 'MEMORANDUM: '+is_memo
				INSERT INTO "CD_FOLIO_DETALLE"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO",	"TIPO_EXCEPCION",		"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION")  
				VALUES	( :is_base,	:is_serie,	:il_numero,	:idt_fecha_crea,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:is_memo,	'',				'',						'',						:is_referencia,		:ll_grupo,				'S',						:il_estado )  
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
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_cd_ingresar_control_documentacion) then w_cd_ingresar_control_documentacion.cb_memo.enabled	= false
			close(w_cd_memorandum)
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif is_opcion='M' then
	if dw_lista_3.rowcount()>0 then
		ll_grabar_3		= dw_lista_3.update()
		if ll_grabar_3=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			close(w_cd_memorandum)
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","No Registra Dato a Grabar")
	end if
end if
end event

type cb_imprimir from commandbutton within w_ingreso_detalle_excepciones_bkp
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

