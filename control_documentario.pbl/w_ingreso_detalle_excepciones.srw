forward
global type w_ingreso_detalle_excepciones from window
end type
type cb_docto_pendiente from commandbutton within w_ingreso_detalle_excepciones
end type
type cb_limpiar from commandbutton within w_ingreso_detalle_excepciones
end type
type rb_ventas from radiobutton within w_ingreso_detalle_excepciones
end type
type rb_pendientes from radiobutton within w_ingreso_detalle_excepciones
end type
type cb_insertar from commandbutton within w_ingreso_detalle_excepciones
end type
type cb_eliminar from commandbutton within w_ingreso_detalle_excepciones
end type
type st_3 from statictext within w_ingreso_detalle_excepciones
end type
type st_2 from statictext within w_ingreso_detalle_excepciones
end type
type cb_cerrar from commandbutton within w_ingreso_detalle_excepciones
end type
type dw_lista_3 from datawindow within w_ingreso_detalle_excepciones
end type
type dw_lista_2 from datawindow within w_ingreso_detalle_excepciones
end type
type cb_grabar from commandbutton within w_ingreso_detalle_excepciones
end type
type cb_imprimir from commandbutton within w_ingreso_detalle_excepciones
end type
end forward

global type w_ingreso_detalle_excepciones from window
integer width = 3328
integer height = 2052
boolean titlebar = true
string title = "Ingreso Excepciones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_docto_pendiente cb_docto_pendiente
cb_limpiar cb_limpiar
rb_ventas rb_ventas
rb_pendientes rb_pendientes
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
global w_ingreso_detalle_excepciones w_ingreso_detalle_excepciones

type variables
Long		il_grupo,il_row,il_row_3,il_estado
String		is_base,is_serie,is_referencia,is_opcion,is_memo,is_pasa
Datetime	idt_fecha_crea
Date		id_fecha
Double	il_numero
DragObject control_dw
end variables

on w_ingreso_detalle_excepciones.create
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_limpiar=create cb_limpiar
this.rb_ventas=create rb_ventas
this.rb_pendientes=create rb_pendientes
this.cb_insertar=create cb_insertar
this.cb_eliminar=create cb_eliminar
this.st_3=create st_3
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista_3=create dw_lista_3
this.dw_lista_2=create dw_lista_2
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.Control[]={this.cb_docto_pendiente,&
this.cb_limpiar,&
this.rb_ventas,&
this.rb_pendientes,&
this.cb_insertar,&
this.cb_eliminar,&
this.st_3,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista_3,&
this.dw_lista_2,&
this.cb_grabar,&
this.cb_imprimir}
end on

on w_ingreso_detalle_excepciones.destroy
destroy(this.cb_docto_pendiente)
destroy(this.cb_limpiar)
destroy(this.rb_ventas)
destroy(this.rb_pendientes)
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

event open;String		ls_fecha,ls_hora,ls_fecha_comp,ls_p,ls_nulo
long		ll_new,ll_nulo
datetime	ldt_nulo

gf_centrar(w_ingreso_detalle_excepciones)
setnull(ls_nulo);setnull(ldt_nulo);setnull(ll_nulo)
is_base													= trim(substr(1,1,Message.StringParm))
is_serie													= trim(substr(1,2,Message.StringParm))
il_numero												= Double(substr(1,3,Message.StringParm))
is_referencia											= trim(substr(1,4,Message.StringParm))
ls_fecha_comp											= trim(substr(1,5,Message.StringParm))
ls_fecha													= mid(ls_fecha_comp,1,10)
ls_hora													= mid(ls_fecha_comp,11)
idt_fecha_crea											= datetime(date(ls_fecha),time(ls_hora))
is_opcion													= trim(substr(1,6,Message.StringParm))
is_memo													= trim(substr(1,7,Message.StringParm))
il_estado													= long(substr(1,8,Message.StringParm))
//ls_p														= '1'
if (gs_depto='I' or gs_depto='O' or gs_depto='V' or gs_depto='T') and gl_proceso>=4 then
	cb_docto_pendiente.visible						= true
end if
dw_lista_2.settransobject(sqlca)
dw_lista_3.settransobject(sqlca)
id_fecha													= RelativeDate(date(idt_fecha_crea),10)
if is_opcion='M' then 
	// w_cd_consultas_detalle_gestion
	st_2.visible											= false
	dw_lista_2.visible									= false
	cb_limpiar.visible									= false
	dw_lista_3.enabled								= false
	st_3.y													= 24
	dw_lista_3.y											= 96
	dw_lista_3.height									= 1652
	dw_lista_3.dataobject								= 'dw_ingreso_detalle_excepcion'
	w_ingreso_detalle_excepciones.width			= 3319
	dw_lista_3.width									= 3200
	cb_cerrar.x											= 2907
	cb_limpiar.x											= 1893
	cb_eliminar.x										= 1536
	cb_insertar.x										= 1179
	dw_lista_3.settransobject(sqlca)
	if dw_lista_3.retrieve(is_base,is_serie,il_numero,is_referencia,idt_fecha_crea)=0 then
		messagebox("Advertencia","No Registra Dato")
		cb_cerrar.triggerevent(clicked!)
	else
		cb_grabar.visible								= false
		cb_insertar.visible								= false
		cb_eliminar.visible								= false
		cb_limpiar.visible								= false
		cb_imprimir.visible								= true
	end if
	rb_ventas.triggerevent(clicked!)//dw_lista_2.retrieve(3)
	dw_lista_3.object.t_titulo.text	= 'Excepciones Contrato Nº: '+ is_base +'-'+ is_serie +'-'+string( il_numero ,"###,###,###,###")+'              Ref.Memo: '+  is_referencia 
elseif is_opcion='N' then		
	//w_cd_memorandum
	cb_imprimir.visible									= false
	st_2.visible											= true
	dw_lista_2.visible									= true
	cb_grabar.visible									= true
	cb_insertar.visible									= true
	cb_eliminar.visible									= true
	cb_limpiar.visible									= true
	st_3.y													= 748
	dw_lista_3.y											= 820
	dw_lista_3.height									= 924
	dw_lista_3.dataobject								= 'dw_ingreso_detalle_excepcion_cd'
	dw_lista_3.settransobject(sqlca)
	rb_ventas.triggerevent(clicked!)//dw_lista_2.retrieve(3)
	dw_lista_3.object.t_titulo.text					= 'Excepciones Contrato Nº: '+ is_base +'-'+ is_serie +'-'+string( il_numero ,"###,###,###,###")+'              Ref.Memo: '+  is_referencia 
	w_ingreso_detalle_excepciones.width			= 2807
	dw_lista_3.width									= 2679
	cb_cerrar.x											= 2377
	cb_limpiar.x											= 1563
	cb_eliminar.x										= 1207
	cb_insertar.x										= 850
else
	if gs_opcion_docto='I' then		
		// w_docto_pendiente_estructura 
		w_ingreso_detalle_excepciones.width		= 2807
		dw_lista_3.width								= 2679
		cb_cerrar.x										= 2377
		cb_limpiar.x										= 1563
		cb_eliminar.x									= 1207
		cb_insertar.x									= 850
		st_3.y												= 748
		dw_lista_3.y										= 820
		dw_lista_3.height								= 924
		dw_lista_3.dataobject							= 'dw_ingreso_detalle_excepcion_ing'
		dw_lista_3.settransobject(sqlca)
	end if
end if
gf_centrar(w_ingreso_detalle_excepciones)

end event

type cb_docto_pendiente from commandbutton within w_ingreso_detalle_excepciones
boolean visible = false
integer x = 407
integer y = 1768
integer width = 434
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string	ls_string

if not isnull(is_base) and is_base<>'' and not isnull(is_serie)  and is_serie<>'' and not isnull(il_numero) and il_numero >0 then
	ls_string		= 'M'+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+gs_depto
	if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
	OpenWithParm (w_docto_pendiente_promesa,ls_string)
end if


end event

type cb_limpiar from commandbutton within w_ingreso_detalle_excepciones
integer x = 1893
integer y = 1768
integer width = 352
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_ingreso_detalle_excepciones.triggerevent(open!)
is_pasa													= 'S'
end event

type rb_ventas from radiobutton within w_ingreso_detalle_excepciones
integer x = 1307
integer y = 12
integer width = 681
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excepciones de Ventas"
boolean checked = true
end type

event clicked;dw_lista_2.retrieve(3)
end event

type rb_pendientes from radiobutton within w_ingreso_detalle_excepciones
integer x = 2007
integer y = 12
integer width = 722
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos Pendientes"
end type

event clicked;dw_lista_2.retrieve(4)
end event

type cb_insertar from commandbutton within w_ingreso_detalle_excepciones
integer x = 1179
integer y = 1768
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

event clicked;Long		ll_new,ll_tot_reg,ll_indi,ll_cod_grupo,ll_excepcion,ll_count=0,ll_res,ll_nulo
String	ls_descrip_2,ls_descrip_3,ls_base_aux,ls_nulo
datetime	ldt_fecha_comprom

setnull(ls_nulo);setnull(ll_nulo)
il_row						= dw_lista_2.getrow()
if is_opcion='M' or is_opcion='N' then
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
			if rb_ventas.checked=true then
				ll_cod_grupo	= 3
			elseif rb_pendientes.checked=true then
				ll_cod_grupo	= 4
			end if
			ll_excepcion		= dw_lista_2.getitemnumber(il_row,'codigo')
			SELECT	"CD_FOLIO_DETALLE_EXCEPCION"."BASE"  
			INTO 		:ls_base_aux  
			FROM 		"CD_FOLIO_DETALLE_EXCEPCION"  
			WHERE  ( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
					 ( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
					 ( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
					 ( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = :ll_cod_grupo ) AND  
					 ( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = :ll_excepcion )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Excepción Codigo Nº "+string(ll_excepcion)+" ya Existe")
			elseif sqlca.sqlcode=100 then
				ll_new				= dw_lista_3.insertrow(0)
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
				dw_lista_3.setitem(ll_new,'estado_entrega_opera','P')
				dw_lista_3.setitem(ll_new,'estado','V')
				dw_lista_3.accepttext()
			else
				messagebox("Error","Error SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		if il_row=0 or isnull(il_row) then
			messagebox("Advertencia","Debe Seleccionar Opción")
			dw_lista_2.setfocus()
		end if
	end if
else
	if gs_opcion_docto='I' then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM		"TASA"  
		WHERE		"TASA"."LOOK" = 1   
		USING		sqlca ;
		dw_lista_3.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(is_base)=0 then		//'O'
			idw_detalle.insertrow(0)
		end if
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
							ll_res	= MessageBox("Advertencia", "Excepción Duplicada Desea Ingresarla", Exclamation!, YesNo!, 2)
							if ll_res=1 then
								ll_count	= 0
							else
								ll_count ++
							end if
							exit
						end if
					end if
				next
			end if
			if ll_count=0 then
				if rb_ventas.checked=true then
					ll_cod_grupo	= 3
					is_referencia	= 'EXCEPCION DE VENTA'
				elseif rb_pendientes.checked=true then
					ll_cod_grupo	= 4
					is_referencia	= 'DOCUMENTO PENDIENTE'
				end if
				ll_excepcion		= dw_lista_2.getitemnumber(il_row,'codigo')
				SELECT	"CD_FOLIO_DETALLE_EXCEPCION"."BASE"  
				INTO 		:ls_base_aux  
				FROM 		"CD_FOLIO_DETALLE_EXCEPCION"  
				WHERE  ( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
						 ( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = :ll_cod_grupo ) AND  
						 ( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = :ll_excepcion )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Excepción Codigo Nº "+string(ll_excepcion)+" ya Existe")
				elseif sqlca.sqlcode=100 then
					ldt_fecha_comprom				= datetime((RelativeDate(date(gdt_fec_sistema),+ 15)),time('00:00:00'))
					ll_new							= dw_lista_3.insertrow(0)
					dw_lista_3.scrolltorow(ll_new)
					dw_lista_3.setitem(ll_new,'base',ls_nulo)
					idw_detalle.retrieve(is_base)		//'O'
					dw_lista_3.setitem(ll_new,'serie',ls_nulo)
					dw_lista_3.setitem(ll_new,'numero',ll_nulo)
					dw_lista_3.setitem(ll_new,'referencia_memo',is_referencia)
					dw_lista_3.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
					dw_lista_3.setitem(ll_new,'codigo_grupo_excepcion',ll_cod_grupo)
					dw_lista_3.setitem(ll_new,'codigo_excepcion',ll_excepcion)
					dw_lista_3.setitem(ll_new,'fecha_entrega_pendiente',ldt_fecha_comprom)
					dw_lista_3.setitem(ll_new,'estado_entrega','P')
					dw_lista_3.setitem(ll_new,'estado_entrega_opera','P')
					dw_lista_3.setitem(ll_new,'estado','V')
					dw_lista_3.accepttext()
				else
					messagebox("Error","Error SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			if il_row=0 or isnull(il_row) then
				messagebox("Advertencia","Debe Seleccionar Opción")
				dw_lista_2.setfocus()
			end if
		end if
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_detalle_excepciones
integer x = 1536
integer y = 1768
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
	is_pasa													= 'S'
	ll_resp	= messagebox("Eliminar","Está Seguro de Eliminar Fila Nº "+string(il_row_3)+ ', recuerde Grabar antes de Cerrar ',Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista_3.deleterow(il_row_3)
		dw_lista_3.accepttext()
	end if
end if
end event

type st_3 from statictext within w_ingreso_detalle_excepciones
integer x = 50
integer y = 736
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

type st_2 from statictext within w_ingreso_detalle_excepciones
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

type cb_cerrar from commandbutton within w_ingreso_detalle_excepciones
integer x = 2907
integer y = 1768
integer width = 352
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
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

type dw_lista_3 from datawindow within w_ingreso_detalle_excepciones
integer x = 55
integer y = 820
integer width = 3200
integer height = 912
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_detalle_excepcion_ing"
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

event rowfocuschanged;//if getrow()>0 then
//	il_row_3	= getrow()
//	This.SelectRow(0, FALSE)
//	This.SelectRow(il_row_3, TRUE)
//end if
end event

event dragdrop;Long	ll_new,ll_tot_reg,ll_indi,ll_cod_grupo,ll_excepcion,ll_count=0,ll_nulo,ll_res
String	ls_descrip_2,ls_descrip_3,ls_base_aux,ls_nulo
datetime	ldt_nulo,ldt_fecha_comprom

control_dw						= DraggedObject()
setnull(ls_nulo);setnull(ldt_nulo);setnull(ll_nulo)
il_row								= dw_lista_2.getrow()
if is_opcion='M' or is_opcion='N' then
	if il_row>0 then
		ll_tot_reg				= dw_lista_3.rowcount()
		if ll_tot_reg>0 then
			ls_descrip_2			= trim(dw_lista_2.getitemstring(il_row,'descripcion'))
			for ll_indi=1 to ll_tot_reg
				ll_cod_grupo	= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
				ll_excepcion		= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
				SELECT	"CD_TIPO_EXCEPCION_DETALLE"."DESCRIPCION"  
				INTO 		:ls_descrip_3  
				FROM 	"CD_TIPO_EXCEPCION_DETALLE"  
				WHERE  	( "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" = :ll_excepcion  ) AND  
						 	( "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" = :ll_cod_grupo)   
				USING	sqlca;
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
			if rb_ventas.checked=true then
				ll_cod_grupo	= 3
			elseif rb_pendientes.checked=true then
				ll_cod_grupo	= 4
			end if
			ll_excepcion			= dw_lista_2.getitemnumber(il_row,'codigo')
			SELECT	"CD_FOLIO_DETALLE_EXCEPCION"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"CD_FOLIO_DETALLE_EXCEPCION"  
			WHERE 	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
					 	( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
					 	( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
					 	( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = :ll_cod_grupo ) AND  
					 	( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = :ll_excepcion )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Excepción Codigo Nº "+string(ll_excepcion)+" ya Existe")
			elseif sqlca.sqlcode=100 then
				ll_new				= dw_lista_3.insertrow(0)
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
				dw_lista_3.setitem(ll_new,'estado_entrega_opera','P')
				dw_lista_3.setitem(ll_new,'estado','V')
				dw_lista_3.accepttext()
			else
				messagebox("Error","Error SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		if il_row=0 or isnull(il_row) then
			messagebox("Advertencia","Debe Seleccionar Opción")
			dw_lista_2.setfocus()
		end if
	end if
else
	if gs_opcion_docto='I' then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM		"TASA"  
		WHERE	"TASA"."LOOK" = 1   
		USING	sqlca ;
		dw_lista_3.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(is_base)=0 then		//'O'
			idw_detalle.insertrow(0)
		end if
		if il_row>0 then
			ll_tot_reg									= dw_lista_3.rowcount()
			if ll_tot_reg>0 then
				ls_descrip_2								= trim(dw_lista_2.getitemstring(il_row,'descripcion'))
				for ll_indi=1 to ll_tot_reg
					ll_cod_grupo						= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
					ll_excepcion							= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
					SELECT	"CD_TIPO_EXCEPCION_DETALLE"."DESCRIPCION"  
					INTO 		:ls_descrip_3  
					FROM		"CD_TIPO_EXCEPCION_DETALLE"  
					WHERE  	( "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" = :ll_excepcion  ) AND  
								( "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" = :ll_cod_grupo)   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						ls_descrip_3	= trim(ls_descrip_3)
						if ls_descrip_2 = ls_descrip_3 then
							ll_res							= MessageBox("Advertencia", "Excepción Duplicada Desea Ingresarla", Exclamation!, YesNo!, 2)
							if ll_res=1 then
								ll_count	= 0
							else
								ll_count ++
							end if
							exit
						end if
					end if
				next
			end if
			if ll_count=0 then
				if rb_ventas.checked=true then
					ll_cod_grupo						= 3
					is_referencia						= 'EXCEPCION DE VENTA'
				elseif rb_pendientes.checked=true then
					ll_cod_grupo						= 4
					is_referencia						= 'DOCUMENTO PENDIENTE'
				end if
				ll_excepcion								= dw_lista_2.getitemnumber(il_row,'codigo')
				SELECT	"CD_FOLIO_DETALLE_EXCEPCION"."BASE"  
				INTO 		:ls_base_aux  
				FROM 	"CD_FOLIO_DETALLE_EXCEPCION"  
				WHERE 	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = :ll_cod_grupo ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = :ll_excepcion )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Excepción Codigo Nº "+string(ll_excepcion)+" ya Existe")
				elseif sqlca.sqlcode=100 then
					ldt_fecha_comprom				= datetime((RelativeDate(date(gdt_fec_sistema),+ 15)),time('00:00:00'))
					ll_new								= dw_lista_3.insertrow(0)
					dw_lista_3.scrolltorow(ll_new)
					dw_lista_3.setitem(ll_new,'base',ls_nulo)
					idw_detalle.retrieve(is_base)		//'O'
					dw_lista_3.setitem(ll_new,'serie',ls_nulo)
					dw_lista_3.setitem(ll_new,'numero',ll_nulo)
					dw_lista_3.setitem(ll_new,'referencia_memo',is_referencia)
					dw_lista_3.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
					dw_lista_3.setitem(ll_new,'codigo_grupo_excepcion',ll_cod_grupo)
					dw_lista_3.setitem(ll_new,'codigo_excepcion',ll_excepcion)
					dw_lista_3.setitem(ll_new,'fecha_entrega_pendiente',ldt_fecha_comprom)
					dw_lista_3.setitem(ll_new,'estado_entrega','P')
					dw_lista_3.setitem(ll_new,'estado_entrega_opera','P')
					dw_lista_3.setitem(ll_new,'estado','V')
					dw_lista_3.accepttext()
				else
					messagebox("Error","Error SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			if il_row=0 or isnull(il_row) then
				messagebox("Advertencia","Debe Seleccionar Opción")
				dw_lista_2.setfocus()
			end if
		end if
	end if
end if
end event

event itemchanged;string	ls_columna,ls_base,ls_serie,ls_base_c,ls_serie_c,ls_descrip,ls_string
long		ll_verif,ll_tot_reg,ll_indi,ll_excepcion,&
			ll_grupo,ll_excepcion_c,ll_grupo_c,ll_res,ll_count
Double	ll_numero,ll_numero_c
dw_lista_3.AcceptText()
ls_columna												= dwo.name
is_pasa													= 'S'
if il_row_3>0 then
	if ls_columna = 'base' then
		ls_base											= dw_lista_3.getitemstring(il_row_3,'base')
		dw_lista_3.settransobject(sqlca)
		dw_lista_3.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_base)=0 then
			idw_detalle.insertrow(0)
		end if
	elseif ls_columna = 'numero' then
		ls_base											= dw_lista_3.getitemstring(il_row_3,'base')
		ls_serie											= dw_lista_3.getitemstring(il_row_3,'serie')
		ll_numero										= dw_lista_3.getitemnumber(il_row_3,'numero')
		ll_excepcion										= dw_lista_3.getitemnumber(il_row_3,'codigo_excepcion')
		ll_grupo											= dw_lista_3.getitemnumber(il_row_3,'codigo_grupo_excepcion')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 then
			SELECT	count("CD_FOLIO"."BASE")  
			INTO		:ll_verif  
			FROM		"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ll_verif) or ll_verif=0 then
					messagebox("Advertencia","Contrato Registrado No Existe en Control Documentario")
					is_pasa								= 'M'
				else
					SELECT DISTINCT	"CD_TIPO_EXCEPCION_DETALLE"."DESCRIPCION"  
					INTO		:ls_descrip
					FROM		"CD_FOLIO_DETALLE_EXCEPCION","CD_TIPO_EXCEPCION_DETALLE"   
					WHERE	( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" ) and
								( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :ls_base ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :ls_serie ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :ll_numero ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = :ll_grupo ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = :ll_excepcion ) AND
								( "CD_TIPO_EXCEPCION_DETALLE"."TIPO_EXCEPCION" = :ll_grupo ) AND  
								( "CD_TIPO_EXCEPCION_DETALLE"."CODIGO" = :ll_excepcion )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if not isnull(ll_verif) or ll_verif>0 then
							SELECT count("BASE")  
							INTO 		:ll_count  
							FROM		"CD_FOLIO_DETALLE_EXCEPCION"  
							WHERE 	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
										( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
										( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
										( "CD_FOLIO_DETALLE_EXCEPCION"."ESTADO" = 'V' )
							USING	sqlca;
							if isnull(ll_count) then ll_count=0
							if ll_count>0 then
								messagebox("Advertencia",'Tipo Excepción '+string(ll_excepcion)+' - '+ls_descrip+' Se Encuentra Registrada')
								if ll_excepcion=25 then
									ll_res									= messagebox('Advertencia','Desea Modificar Informe "Modificación Contratos"  ',Exclamation!,YesNo!,2)
									cb_grabar.enabled					= false		
									if ll_res=1 then
										is_pasa							= 'X'
									else
										is_pasa							= 'M'
									end if
								else
									is_pasa								= 'M'
								end if
							else
								if ll_excepcion=25 then
									ll_res									= messagebox('Advertencia','Desea Modificar Informe "Modificación Contratos"  ',Exclamation!,YesNo!,2)
									if ll_res=1 then
										is_pasa							= 'X'
									end if
								end if
							end if
						else
							ll_tot_reg									= dw_lista_3.rowcount()
							if ll_tot_reg>0 then
								for ll_indi=1 to (ll_tot_reg - 1) 
									if il_row_3 = 1 and ll_indi=1 then
									else
										ls_base_c				= dw_lista_3.getitemstring(ll_indi,'base')
										ls_serie_c				= dw_lista_3.getitemstring(ll_indi,'serie')
										ll_numero_c				= dw_lista_3.getitemnumber(ll_indi,'numero')
										ll_excepcion_c			= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
										ll_grupo_c				= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
										if ls_base = ls_base_c and ls_serie = ls_serie_c and ll_numero = ll_numero_c and ll_excepcion = ll_excepcion_c and ll_grupo = ll_grupo_c then
											messagebox("Advertencia","Número Contrato y Tipo Excepción Duplicada")
											cb_grabar.enabled					= false		
											is_pasa				= 'N'
										end if
									end if
								next
							end if
						end if
						if ll_excepcion=25 then
							ll_res									= messagebox('Advertencia','Desea Modificar Informe "Modificación Contratos"  ',Exclamation!,YesNo!,2)
							if ll_res=1 then
								is_pasa							= 'X'
							end if
						end if
					else
						if ll_excepcion=25 then
							ll_res									= messagebox('Advertencia','Desea Modificar Informe "Modificación Contratos"  ',Exclamation!,YesNo!,2)
							if ll_res=1 then
								is_pasa							= 'X'
							end if
						end if
					end if			
				end if
			end if
			if is_pasa = 'N' then
				dw_lista_3.deleterow(il_row_3)
				dw_lista_3.accepttext()
			elseif is_pasa = 'M' then
				dw_lista_3.accepttext()
				dw_lista_3.setfocus()
				dw_lista_3.setcolumn('numero')
			elseif is_pasa = 'X' then
				ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(il_row_3)
				if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
				OpenWithparm(w_cd_mantenedor_contrato,ls_string)
//			else
//				ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(il_row_3)
//				if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
//				OpenWithparm(w_cd_mantenedor_contrato,ls_string)
			end if
		end if
	end if
end if
end event

event itemfocuschanged;string	ls_base,ls_serie,ls_nulo,ls_pasa,ls_base_c,ls_serie_c,ls_descrip
long		ll_verif,ll_nulo,ll_excepcion,ll_grupo,ll_tot_reg,&
			ll_indi,ll_excepcion_c,ll_grupo_c
Double	ll_numero,ll_numero_c
setnull(ls_nulo);setnull(ll_nulo)
if is_pasa='S' or is_pasa = 'M' then
	if is_pasa = 'M' then
		dw_lista_3.setitem(il_row_3,'base',ls_nulo)
		dw_lista_3.setitem(il_row_3,'serie',ls_nulo)
		dw_lista_3.setitem(il_row_3,'numero',ll_nulo)
		dw_lista_3.accepttext()
		dw_lista_3.setfocus()
		dw_lista_3.setcolumn('base')
	end if
end if
end event

event doubleclicked;string	ls_base,ls_serie,ls_string
long	ll_tot_reg,ll_excep
Double	ll_numero
ll_tot_reg				= 	dw_lista_3.rowcount()
if ll_tot_reg>0 then
	ll_excep				= dw_lista_3.getitemnumber(il_row_3,'codigo_excepcion')
	if ll_excep=25 then
		ls_base			= dw_lista_3.getitemstring(il_row_3,'base')
		ls_serie			= dw_lista_3.getitemstring(il_row_3,'serie')
		ll_numero		= dw_lista_3.getitemnumber(il_row_3,'numero')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 then
			ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(il_row_3)
			if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
			OpenWithparm(w_cd_mantenedor_contrato,ls_string)
		end if
	end if
end if
end event

type dw_lista_2 from datawindow within w_ingreso_detalle_excepciones
integer x = 55
integer y = 96
integer width = 2679
integer height = 620
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

type cb_grabar from commandbutton within w_ingreso_detalle_excepciones
integer x = 55
integer y = 1768
integer width = 352
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_base,ls_serie,ls_memo,ls_referencia,ls_pasa
Long		ll_grupo,ll_excepcion,ll_grabar_1,ll_grabar_2,ll_grabar_3,ll_tot_reg,&
			ll_indi,ll_graba,ll_estado,ll_codigo_excep,ll_decto_comi,ll_res
datetime	ldt_fecha_crea
Double	ll_numero
dw_lista_3.accepttext()
if is_opcion='N'  OR is_opcion='M' then
	if is_opcion='N' then
		if dw_lista_3.rowcount()>0 then
			if isvalid(w_cd_gestion_folio) then
				if rb_ventas.checked=true then
					ll_grupo		= 3
				elseif rb_pendientes.checked=true then
					ll_grupo		= 4
				end if
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
				if rb_ventas.checked=true then
					ll_grupo		= 3
				elseif rb_pendientes.checked=true then
					ll_grupo		= 4
				end if
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
			elseif isvalid(w_validar_promesa_operaciones) then
				if rb_ventas.checked=true then
					ll_grupo		= 3
				elseif rb_pendientes.checked=true then
					ll_grupo		= 4
				end if
				UPDATE	"CD_FOLIO"  
				SET 		"ULT_TIPO_EXCEPCION" = :ll_grupo,   
							"ULT_ESTADO_EXCEPCION" = 'S'  
				WHERE  ( "CD_FOLIO"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :il_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_grabar_1		= 1
					is_memo			= 'MEMORANDUM: '+is_memo
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
				commit using sqlca;
				messagebox("Grabar","Grabación Exitosa")
				if isvalid(w_cd_ingresar_control_documentacion) then w_cd_ingresar_control_documentacion.cb_memo.enabled	= false
				if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.cb_memo.enabled	= false
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
else
	if gs_opcion_docto='I' then
		ll_grabar_2					= 0
		ll_tot_reg					= dw_lista_3.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_pasa				= 'N'
				ls_base				= dw_lista_3.getitemstring(ll_indi,'base')
				ls_serie				= dw_lista_3.getitemstring(ll_indi,'serie')
				ll_numero			= dw_lista_3.getitemnumber(ll_indi,'numero')
				ldt_fecha_crea		= dw_lista_3.getitemdatetime(ll_indi,'fecha_crea')
				ls_memo				= dw_lista_3.getitemstring(ll_indi,'referencia_memo')
				ls_referencia		= dw_lista_3.getitemstring(ll_indi,'referencia_memo')			
				ll_grupo				= dw_lista_3.getitemnumber(ll_indi,'codigo_grupo_excepcion')
				ll_excepcion		= dw_lista_3.getitemnumber(ll_indi,'codigo_excepcion')
				if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>''	and not isnull(ll_numero) and ll_numero>0 then
					ls_pasa			= 'S'
					if ll_excepcion=7 or ll_excepcion=8 then
						ll_decto_comi	= dw_lista_3.getitemnumber(ll_indi,'porce_descuento')
						if not isnull(ll_decto_comi) and  ll_decto_comi>0 then
							ls_pasa	= 'S'
						else
							ls_pasa	= 'N'
						end if
					end if
				end if
				if ls_pasa= 'S' then			
					SELECT	"ULT_ESTADO"  
					INTO 		:ll_estado   
					FROM 		"CD_FOLIO"  
					WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
								( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
								( "CD_FOLIO"."NUMERO" = :ll_numero )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if not isnull(ldt_fecha_crea) and not isnull(ll_estado) and ll_estado>0 then
							INSERT INTO "CD_FOLIO_DETALLE"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO",	"TIPO_EXCEPCION",		"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION")  
							VALUES	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_crea,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:ls_memo,	'',				'',						'',						:ls_referencia,		:ll_grupo,				'S',						:ll_estado )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit using sqlca;
								ll_grabar_2	= ll_grabar_2+1
							else
								rollback using sqlca;
							end if
						end if
					end if
				else
					if isnull(ls_base) or ls_base='' then
						messagebox("Advertencia", "Debe Ingresar Base Contrato")
						dw_lista_3.setfocus()
						dw_lista_3.setcolumn('base')
					elseif isnull(ls_serie) or ls_serie='' then
						messagebox("Advertencia", "Debe Ingresar Serie Contrato")
						dw_lista_3.setfocus()
						dw_lista_3.setcolumn('serie')
					elseif isnull(ll_numero) or ll_numero=0 then
						messagebox("Advertencia", "Debe Ingresar Numero Contrato")
						dw_lista_3.setfocus()
						dw_lista_3.setcolumn('numero')
					elseif isnull(ll_decto_comi) or ll_decto_comi=0 then
						messagebox("Advertencia", "Debe Ingresar Porcentaje Descuento")
						dw_lista_3.setfocus()
						dw_lista_3.setcolumn('porce_descuento')	
					end if
				end if
			next
			if ll_tot_reg=ll_grabar_2 then
				if dw_lista_3.update() = 1 then
					commit using sqlca;
					messagebox('Grabar','Grabación Exitosa')
					dw_lista_3.reset()
					ll_res					= messagebox("Advertencia","Desea Ingresar Otro Documento Pendiente", Exclamation!, YesNo!, 2)
					if ll_res=1 then
					else
						close(w_ingreso_detalle_excepciones)
					end if
				else
					rollback using sqlca;
					messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_ingreso_detalle_excepciones
integer x = 55
integer y = 1768
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

