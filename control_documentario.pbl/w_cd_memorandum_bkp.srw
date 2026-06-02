forward
global type w_cd_memorandum_bkp from window
end type
type st_estado_asociado from statictext within w_cd_memorandum_bkp
end type
type st_5 from statictext within w_cd_memorandum_bkp
end type
type st_numero from statictext within w_cd_memorandum_bkp
end type
type st_4 from statictext within w_cd_memorandum_bkp
end type
type st_serie from statictext within w_cd_memorandum_bkp
end type
type st_3 from statictext within w_cd_memorandum_bkp
end type
type st_base from statictext within w_cd_memorandum_bkp
end type
type st_2 from statictext within w_cd_memorandum_bkp
end type
type em_referencia from editmask within w_cd_memorandum_bkp
end type
type st_1 from statictext within w_cd_memorandum_bkp
end type
type cb_grabar from commandbutton within w_cd_memorandum_bkp
end type
type cb_cerrar from commandbutton within w_cd_memorandum_bkp
end type
type gb_2 from groupbox within w_cd_memorandum_bkp
end type
type cbx_excepcion from checkbox within w_cd_memorandum_bkp
end type
type mle_memo from multilineedit within w_cd_memorandum_bkp
end type
type gb_1 from groupbox within w_cd_memorandum_bkp
end type
end forward

global type w_cd_memorandum_bkp from window
integer width = 2514
integer height = 1720
boolean titlebar = true
string title = "Ingresar Memorandum"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_estado_asociado st_estado_asociado
st_5 st_5
st_numero st_numero
st_4 st_4
st_serie st_serie
st_3 st_3
st_base st_base
st_2 st_2
em_referencia em_referencia
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
gb_2 gb_2
cbx_excepcion cbx_excepcion
mle_memo mle_memo
gb_1 gb_1
end type
global w_cd_memorandum_bkp w_cd_memorandum_bkp

type variables
String	is_base,is_serie,is_memo,is_ref
Long		il_estado,il_tipo_opcion,il_estado_anterior
Double	il_numero
datetime	idt_fecha_estado
end variables

on w_cd_memorandum_bkp.create
this.st_estado_asociado=create st_estado_asociado
this.st_5=create st_5
this.st_numero=create st_numero
this.st_4=create st_4
this.st_serie=create st_serie
this.st_3=create st_3
this.st_base=create st_base
this.st_2=create st_2
this.em_referencia=create em_referencia
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.cbx_excepcion=create cbx_excepcion
this.mle_memo=create mle_memo
this.gb_1=create gb_1
this.Control[]={this.st_estado_asociado,&
this.st_5,&
this.st_numero,&
this.st_4,&
this.st_serie,&
this.st_3,&
this.st_base,&
this.st_2,&
this.em_referencia,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.gb_2,&
this.cbx_excepcion,&
this.mle_memo,&
this.gb_1}
end on

on w_cd_memorandum_bkp.destroy
destroy(this.st_estado_asociado)
destroy(this.st_5)
destroy(this.st_numero)
destroy(this.st_4)
destroy(this.st_serie)
destroy(this.st_3)
destroy(this.st_base)
destroy(this.st_2)
destroy(this.em_referencia)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.cbx_excepcion)
destroy(this.mle_memo)
destroy(this.gb_1)
end on

event open;String	ls_memo,ls_descrip
gf_centrar(w_cd_memorandum)
is_base 								= trim(substr(1,1,Message.StringParm))
is_serie								= trim(substr(1,2,Message.StringParm))
il_numero							= Double(trim(substr(1,3,Message.StringParm)))
ls_memo								= trim(substr(1,4,Message.StringParm))
il_estado							= long(trim(substr(1,5,Message.StringParm)))
idt_fecha_estado					= datetime(trim(substr(1,6,Message.StringParm)))
il_estado_anterior				= long(trim(substr(1,7,Message.StringParm)))
st_base.text						= is_base
st_serie.text						= is_serie
st_numero.text						= string(il_numero,"###,###,###,###")
SELECT	"CD_ESTADO"."DESCRIPCION"  
INTO 		:ls_descrip  
FROM 		"CD_ESTADO"  
WHERE 	"CD_ESTADO"."CODIGO" = :il_estado   
USING		sqlca;
if sqlca.sqlcode=0 then
	st_estado_asociado.text		= string(il_estado)+'-'+ls_descrip
else
	st_estado_asociado.text		= ''
end if
cbx_excepcion.checked			= false
cbx_excepcion.visible			= false
cbx_excepcion.enabled			= false
setnull(il_tipo_opcion)
if il_estado=4 or il_estado=9 then
	cbx_excepcion.visible		= true
	cbx_excepcion.enabled		= true
	cb_grabar.x						= 1202
else
	cb_grabar.x						= 37
end if
gs_base								= is_base
gs_serie								= is_serie
gi_numero							= gi_numero
//mle_memo.text						= w_cd_ingresar_control_documentacion.dw_nuevo.getitemstring(1,'memo')
mle_memo.text						= ls_memo
em_referencia.setfocus()
end event

type st_estado_asociado from statictext within w_cd_memorandum_bkp
integer x = 590
integer y = 168
integer width = 1838
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_cd_memorandum_bkp
integer x = 69
integer y = 180
integer width = 503
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Asociado"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_numero from statictext within w_cd_memorandum_bkp
integer x = 1202
integer y = 64
integer width = 489
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cd_memorandum_bkp
integer x = 905
integer y = 76
integer width = 274
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_serie from statictext within w_cd_memorandum_bkp
integer x = 695
integer y = 64
integer width = 178
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cd_memorandum_bkp
integer x = 480
integer y = 76
integer width = 192
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_base from statictext within w_cd_memorandum_bkp
integer x = 279
integer y = 64
integer width = 178
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_cd_memorandum_bkp
integer x = 73
integer y = 76
integer width = 178
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_referencia from editmask within w_cd_memorandum_bkp
integer x = 398
integer y = 452
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

type st_1 from statictext within w_cd_memorandum_bkp
integer x = 96
integer y = 460
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

type cb_grabar from commandbutton within w_cd_memorandum_bkp
integer x = 37
integer y = 1492
integer width = 306
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;is_memo	= trim(mle_memo.text)
is_ref	= trim(em_referencia.text)
if not isnull(is_memo) and not isnull(is_ref) then
	w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'memo',is_memo)
	w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'referencia_memo',is_ref)
	w_cd_ingresar_control_documentacion.dw_nuevo.accepttext()
	if w_cd_ingresar_control_documentacion.dw_nuevo.update()=1 then
		commit;
		if isvalid(w_cd_gestion_folio) then
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_memo',is_memo)
			w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_referencia_memo',is_ref)
			if cbx_excepcion.checked=true then
				w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_tipo_excepcion',il_tipo_opcion)
				w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_estado_excepcion','S')
				w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_estado_asociado_excepcion',il_estado_anterior)
			end if
			w_cd_gestion_folio.dw_lista.accepttext()
			if w_cd_gestion_folio.dw_lista.update()=1 then
				commit;
				is_memo	= 'MEMORANDUM: '+is_memo
				if cbx_excepcion.checked=false then
					INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO")  
					VALUES	( :is_base,	:is_serie,	:il_numero,	:gdt_fec_sistema,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:is_memo,	'',				'',						'',						:is_ref )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				w_cd_ingresar_control_documentacion.setfocus()
				messagebox("Grabar","Grabación Exitosa")
				close(w_cd_memorandum)
			else
				rollback;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		elseif isvalid(w_documentos_pendientes) then
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_memo',is_memo)
			w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_referencia_memo',is_ref)
			if cbx_excepcion.checked=true then
				w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_tipo_excepcion',il_tipo_opcion)
				w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_estado_excepcion','S')
				w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_estado_asociado_excepcion',il_estado_anterior)
			end if
			w_documentos_pendientes.dw_lista.accepttext()
			if w_documentos_pendientes.dw_lista.update()=1 then
				commit;
				is_memo	= 'MEMORANDUM: '+is_memo
				if cbx_excepcion.checked=false then
					INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",		"COD_JEFE_VENTA",		"REFERENCIA_MEMO")  
					VALUES	( :is_base,	:is_serie,	:il_numero,	:gdt_fec_sistema,	:gs_user,			99,			:gdt_fec_sistema,	'-',			:is_memo,	'',				'',						'',						:is_ref )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				w_cd_ingresar_control_documentacion.cb_memo.enabled	= false
				w_cd_ingresar_control_documentacion.setfocus()
				messagebox("Grabar","Grabación Exitosa")
				close(w_cd_memorandum)
			else
				rollback;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		rollback;
		messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
else
	if isnull(is_memo) then
		messagebox("Advertencia","Debe Ingresar Memorandum")
		mle_memo.setfocus()
	elseif isnull(is_ref) then
		messagebox("Advertencia","Debe Ingresar Referencia")
		em_referencia.setfocus()
	end if
end if
end event

type cb_cerrar from commandbutton within w_cd_memorandum_bkp
integer x = 2135
integer y = 1492
integer width = 325
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_memorandum)
end event

type gb_2 from groupbox within w_cd_memorandum_bkp
integer x = 37
integer y = 8
integer width = 2423
integer height = 272
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
end type

type cbx_excepcion from checkbox within w_cd_memorandum_bkp
integer x = 37
integer y = 1504
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

event clicked;String	ls_string
if this.checked=true then
	is_ref									= trim(em_referencia.text)
	is_memo									= trim(mle_memo.text)
	if is_ref='' or isnull(is_ref) then
		messagebox("Advertencia","Debe Ingresar Referencia")
		this.checked						= false
		em_referencia.setfocus()
	else
		if isvalid(w_ingreso_detalle_excepciones) then close(w_ingreso_detalle_excepciones)
		mle_memo.enabled					= false
		em_referencia.enabled			= false
		cb_grabar.enabled					= false
		this.enabled						= false
		cb_cerrar.enabled					= false
		ls_string							= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_ref+'~t'+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm:ss")+'~t'+'N'+'~t'+is_memo+'~t'+string(il_estado)
		OpenWithParm(w_ingreso_detalle_excepciones, ls_string)
	end if
else
	mle_memo.enabled						= true
	em_referencia.enabled				= true
	cb_grabar.enabled						= true
	this.enabled							= true
	cb_cerrar.enabled						= true
end if
end event

type mle_memo from multilineedit within w_cd_memorandum_bkp
integer x = 101
integer y = 592
integer width = 2295
integer height = 800
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

type gb_1 from groupbox within w_cd_memorandum_bkp
integer x = 37
integer y = 336
integer width = 2423
integer height = 1116
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

