forward
global type w_ingreso_cd_memorandum_digitacion from window
end type
type cbx_excepcion from checkbox within w_ingreso_cd_memorandum_digitacion
end type
type dw_lista_excepciones from datawindow within w_ingreso_cd_memorandum_digitacion
end type
type cb_cancelar from commandbutton within w_ingreso_cd_memorandum_digitacion
end type
type cb_aceptar from commandbutton within w_ingreso_cd_memorandum_digitacion
end type
type em_referencia from editmask within w_ingreso_cd_memorandum_digitacion
end type
type st_1 from statictext within w_ingreso_cd_memorandum_digitacion
end type
type cb_grabar from commandbutton within w_ingreso_cd_memorandum_digitacion
end type
type cb_cerrar from commandbutton within w_ingreso_cd_memorandum_digitacion
end type
type mle_memo from multilineedit within w_ingreso_cd_memorandum_digitacion
end type
type gb_1 from groupbox within w_ingreso_cd_memorandum_digitacion
end type
type gb_3 from groupbox within w_ingreso_cd_memorandum_digitacion
end type
end forward

global type w_ingreso_cd_memorandum_digitacion from window
integer width = 2514
integer height = 1580
boolean titlebar = true
string title = "Ingresar Memorandum"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cbx_excepcion cbx_excepcion
dw_lista_excepciones dw_lista_excepciones
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
em_referencia em_referencia
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
mle_memo mle_memo
gb_1 gb_1
gb_3 gb_3
end type
global w_ingreso_cd_memorandum_digitacion w_ingreso_cd_memorandum_digitacion

type variables
String	is_base,is_serie
Long		il_tipo_opcion
Double	il_numero
end variables

on w_ingreso_cd_memorandum_digitacion.create
this.cbx_excepcion=create cbx_excepcion
this.dw_lista_excepciones=create dw_lista_excepciones
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.em_referencia=create em_referencia
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.mle_memo=create mle_memo
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.cbx_excepcion,&
this.dw_lista_excepciones,&
this.cb_cancelar,&
this.cb_aceptar,&
this.em_referencia,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.mle_memo,&
this.gb_1,&
this.gb_3}
end on

on w_ingreso_cd_memorandum_digitacion.destroy
destroy(this.cbx_excepcion)
destroy(this.dw_lista_excepciones)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.em_referencia)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.mle_memo)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;gf_centrar(w_ingreso_cd_memorandum_digitacion)
is_base 								= trim(substr(1,1,Message.StringParm))
is_serie								= trim(substr(1,2,Message.StringParm))
il_numero							= Double(trim(substr(1,3,Message.StringParm)))
gs_base								= is_base
gs_serie								= is_serie
gi_numero							= gi_numero
mle_memo.enabled				= false
dw_lista_excepciones.settransobject(sqlca)
dw_lista_excepciones.retrieve()
gb_3.visible							= false
cb_aceptar.visible					= false
cb_cancelar.visible					= false
dw_lista_excepciones.visible	= false
gb_3.text								= 'Seleccione Tipo de Excepción'
em_referencia.setfocus()
end event

type cbx_excepcion from checkbox within w_ingreso_cd_memorandum_digitacion
integer x = 448
integer y = 1352
integer width = 1134
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Se Acepta por Excepción"
end type

event clicked;mle_memo.enabled					= false
em_referencia.enabled				= false
cb_grabar.enabled						= false
this.enabled								= false
cb_cerrar.enabled						= false
if this.checked=true then
	gb_3.visible							= true
	dw_lista_excepciones.visible	= true
	cb_aceptar.visible					= true
	cb_cancelar.visible					= true
else
	gb_3.visible							= false
	dw_lista_excepciones.visible	= false
	cb_aceptar.visible					= false
	cb_cancelar.visible					= false
end if
end event

type dw_lista_excepciones from datawindow within w_ingreso_cd_memorandum_digitacion
boolean visible = false
integer x = 393
integer y = 408
integer width = 1714
integer height = 692
integer taborder = 40
string dataobject = "dw_lista_excepciones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	cb_aceptar.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_cancelar from commandbutton within w_ingreso_cd_memorandum_digitacion
boolean visible = false
integer x = 1824
integer y = 1172
integer width = 283
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ca&ncelar"
end type

event clicked;setnull(il_tipo_opcion)
if dw_lista_excepciones.visible= true then
	cbx_excepcion.enabled		= true
end if
gb_3.visible							= false
cb_aceptar.visible					= false
cb_cancelar.visible					= false
dw_lista_excepciones.visible	= false
mle_memo.enabled				= true
em_referencia.enabled			= true
cb_grabar.enabled					= true
cb_cerrar.enabled					= true
end event

type cb_aceptar from commandbutton within w_ingreso_cd_memorandum_digitacion
boolean visible = false
integer x = 393
integer y = 1172
integer width = 283
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_lista_excepciones.visible= true then
	il_tipo_opcion					= dw_lista_excepciones.getitemnumber(dw_lista_excepciones.getrow(),'tipo_excepcion')
	cbx_excepcion.enabled		= true
end if
gb_3.visible							= false
cb_aceptar.visible					= false
cb_cancelar.visible					= false
dw_lista_excepciones.visible	= false
mle_memo.enabled				= true
em_referencia.enabled			= true
cb_grabar.enabled					= true
cb_cerrar.enabled					= true
end event

type em_referencia from editmask within w_ingreso_cd_memorandum_digitacion
integer x = 398
integer y = 140
integer width = 1998
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;String	ls_ref
ls_ref	= trim(em_referencia.text)
if not isnull(ls_ref) and ls_ref<>'' then
	mle_memo.enabled	= true
	mle_memo.text		= 'MEMORANDUM INGRESADO POR '+gs_us+' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+','
else
	mle_memo.enabled	= false
end if
end event

type st_1 from statictext within w_ingreso_cd_memorandum_digitacion
integer x = 96
integer y = 148
integer width = 302
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia"
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_ingreso_cd_memorandum_digitacion
integer x = 37
integer y = 1336
integer width = 306
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_memo,ls_ref
ls_memo		= trim(mle_memo.text)
ls_ref			= trim(em_referencia.text)
if not isnull(ls_memo) and ls_memo<>'' and not isnull(ls_ref) and ls_ref<>'' then
	if cbx_excepcion.checked=true and isnull(il_tipo_opcion) then
		messagebox("Advertencia","Debe Seleccionar Tipo de Excepción")
		cbx_excepcion.setfocus()
	else
		ls_memo	= 'MEMORANDUM: '+ls_memo
		if cbx_excepcion.checked=true then
			INSERT INTO "CD_FOLIO_DETALLE"  
						( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO",	"TIPO_EXCEPCION",		"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION"   )  
			VALUES	( :is_base,	:is_serie,	:il_numero,	:gdt_fec_sistema,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:ls_memo,	'',				'',						'',						:ls_ref,					:il_tipo_opcion,		'S',						9 )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"CD_FOLIO"  
				SET 		"ULT_TIPO_EXCEPCION" = :il_tipo_opcion,   
							"ULT_ESTADO_EXCEPCION" = 'S',   
							"ULT_ESTADO_ASOCIADO_EXCEPCION" = 9  
				WHERE	 ( "CD_FOLIO"."BASE" = :is_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :is_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :il_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				messagebox("Grabar","Grabación Exitosa")
				close(w_ingreso_cd_memorandum_digitacion)
			else
				rollback;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		else
			INSERT INTO "CD_FOLIO_DETALLE"  
						( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO"   )  
			VALUES	( :is_base,	:is_serie,	:il_numero,	:gdt_fec_sistema,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:ls_memo,	'',				'',						'',						:ls_ref )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				close(w_ingreso_cd_memorandum_digitacion)
			else
				rollback;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
		if isvalid(w_ingresar_oferta) then w_ingresar_oferta.cb_aceptar.setfocus()
		if isvalid(w_ingresar_liberador) then w_ingresar_liberador.cb_aceptar.setfocus()
		if isvalid(w_ingresar_pagare) then w_ingresar_pagare.cb_aceptar.setfocus()
		messagebox("Grabar","Grabación Exitosa")
		close(w_cd_memorandum)
	end if
else
	if isnull(ls_memo) or ls_memo='' then
		messagebox("Advertencia","Debe Ingresar Memorandum")
		mle_memo.setfocus()
	elseif isnull(ls_ref) or ls_ref='' then
		messagebox("Advertencia","Debe Ingresar Referencia")
		em_referencia.setfocus()
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_cd_memorandum_digitacion
integer x = 2135
integer y = 1336
integer width = 325
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_cd_memorandum_digitacion)
end event

type mle_memo from multilineedit within w_ingreso_cd_memorandum_digitacion
integer x = 101
integer y = 280
integer width = 2295
integer height = 940
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean vscrollbar = true
boolean autovscroll = true
textcase textcase = upper!
integer limit = 1500
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_1 from groupbox within w_ingreso_cd_memorandum_digitacion
integer x = 37
integer y = 24
integer width = 2423
integer height = 1260
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Memorandum"
end type

type gb_3 from groupbox within w_ingreso_cd_memorandum_digitacion
boolean visible = false
integer x = 288
integer y = 292
integer width = 1920
integer height = 1068
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

