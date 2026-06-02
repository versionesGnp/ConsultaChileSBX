forward
global type w_beneficios_gestion from window
end type
type st_ci from statictext within w_beneficios_gestion
end type
type sle_ci from singlelineedit within w_beneficios_gestion
end type
type rb_ci from radiobutton within w_beneficios_gestion
end type
type rb_cu from radiobutton within w_beneficios_gestion
end type
type dw_datos_cliente from datawindow within w_beneficios_gestion
end type
type gb_1 from groupbox within w_beneficios_gestion
end type
type gb_2 from groupbox within w_beneficios_gestion
end type
type dw_pagos from datawindow within w_beneficios_gestion
end type
type cb_usar_beneficio from commandbutton within w_beneficios_gestion
end type
type cb_cerrar from commandbutton within w_beneficios_gestion
end type
type dw_lista_beneficios from datawindow within w_beneficios_gestion
end type
end forward

global type w_beneficios_gestion from window
integer width = 2510
integer height = 1576
boolean titlebar = true
string title = "Gestion Beneficios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_ci st_ci
sle_ci sle_ci
rb_ci rb_ci
rb_cu rb_cu
dw_datos_cliente dw_datos_cliente
gb_1 gb_1
gb_2 gb_2
dw_pagos dw_pagos
cb_usar_beneficio cb_usar_beneficio
cb_cerrar cb_cerrar
dw_lista_beneficios dw_lista_beneficios
end type
global w_beneficios_gestion w_beneficios_gestion

type variables
string 	ls_base,ls_serie
Double	ll_numero
end variables

on w_beneficios_gestion.create
this.st_ci=create st_ci
this.sle_ci=create sle_ci
this.rb_ci=create rb_ci
this.rb_cu=create rb_cu
this.dw_datos_cliente=create dw_datos_cliente
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_pagos=create dw_pagos
this.cb_usar_beneficio=create cb_usar_beneficio
this.cb_cerrar=create cb_cerrar
this.dw_lista_beneficios=create dw_lista_beneficios
this.Control[]={this.st_ci,&
this.sle_ci,&
this.rb_ci,&
this.rb_cu,&
this.dw_datos_cliente,&
this.gb_1,&
this.gb_2,&
this.dw_pagos,&
this.cb_usar_beneficio,&
this.cb_cerrar,&
this.dw_lista_beneficios}
end on

on w_beneficios_gestion.destroy
destroy(this.st_ci)
destroy(this.sle_ci)
destroy(this.rb_ci)
destroy(this.rb_cu)
destroy(this.dw_datos_cliente)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_pagos)
destroy(this.cb_usar_beneficio)
destroy(this.cb_cerrar)
destroy(this.dw_lista_beneficios)
end on

event open;string ls_ventana,ls_usuario,ls_estado
long	ll_rut,ll_cod_benef,ll_cod_benef_d,ll_cant_benef,ll_indi,ll_folio
date	ld_fecha_uso

gf_centrar(w_beneficios_gestion)
dw_datos_cliente.settransobject(sqlca)
dw_pagos.settransobject(sqlca)
dw_lista_beneficios.settransobject(sqlca)

ll_rut				= LONG(substr(1,1,Message.StringParm))
ls_base 			= substr(1,2,Message.StringParm)
ls_serie			= substr(1,3,Message.StringParm)
ll_numero		= Double(substr(1,4,Message.StringParm))

//ll_rut				= 11585623
//ls_base 			= 'O'
//ls_serie			= 'I'
//ll_numero		= 21690

//
if rb_cu.checked = true then
	dw_pagos.visible					= true
	dw_pagos.x							= 50
	dw_pagos.y							= 756
	sle_ci.visible							= false
	st_ci.visible							= false
	gb_1.x								= 37
	gb_1.y								= 1280
	dw_lista_beneficios.x				= 46
	dw_lista_beneficios.y				= 1364
	cb_usar_beneficio.x				= 32
	cb_usar_beneficio.y				= 1932
	cb_cerrar.x							= 2130
	cb_cerrar.y							= 1932
	w_beneficios_gestion.height		= 2226	
elseif rb_ci.checked = true then
	dw_pagos.visible					= false
	dw_pagos.x							= 50
	dw_pagos.y							= 756
	sle_ci.visible							= true
	st_ci.visible							= true
	gb_1.x								= 37
	gb_1.y								= 740
	dw_lista_beneficios.x				= 46
	dw_lista_beneficios.y				= 812
	cb_usar_beneficio.x				= 32
	cb_usar_beneficio.y				= 1344
	cb_cerrar.x							= 2130
	cb_cerrar.y							= 1344
	w_beneficios_gestion.height		= 1596
	sle_ci.enabled						= true
end if	

if not isnull(ll_rut) and ll_rut <> 0 then
	if dw_datos_cliente.retrieve(ll_rut) > 0 then
		if not isnull(ls_base) and ls_base <> '' and not isnull(ls_base) and ls_base <> '' and  not isnull(ll_numero) and ll_numero <> 0 then
			if rb_ci.checked = true then
				dw_pagos.retrieve(ls_base,ls_serie,ll_numero)
			end if
			dw_lista_beneficios.retrieve(ls_base,ls_serie,ll_numero)
		end if
	else
		messagebox('Aviso','Rut no Encontrado')
	end if	
end if
end event

type st_ci from statictext within w_beneficios_gestion
integer x = 1184
integer y = 624
integer width = 306
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese C.I:"
boolean focusrectangle = false
end type

type sle_ci from singlelineedit within w_beneficios_gestion
integer x = 1495
integer y = 604
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_ci from radiobutton within w_beneficios_gestion
integer x = 539
integer y = 612
integer width = 192
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "C.I"
boolean checked = true
end type

event clicked;dw_pagos.visible					= false
dw_pagos.x							= 50
dw_pagos.y							= 756
sle_ci.visible							= true
st_ci.visible							= true
gb_1.x								= 37
gb_1.y								= 740
dw_lista_beneficios.x				= 46
dw_lista_beneficios.y				= 812
cb_usar_beneficio.x				= 32
cb_usar_beneficio.y				= 1344
cb_cerrar.x							= 2130
cb_cerrar.y							= 1344
w_beneficios_gestion.height		= 1596
sle_ci.enabled						= true
end event

type rb_cu from radiobutton within w_beneficios_gestion
integer x = 82
integer y = 612
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuponera"
end type

event clicked;dw_pagos.visible					= true
dw_pagos.x							= 50
dw_pagos.y							= 756
sle_ci.visible							= false
st_ci.visible							= false
gb_1.x								= 37
gb_1.y								= 1280
dw_lista_beneficios.x				= 46
dw_lista_beneficios.y				= 1364
cb_usar_beneficio.x				= 32
cb_usar_beneficio.y				= 1932
cb_cerrar.x							= 2130
cb_cerrar.y							= 1932
w_beneficios_gestion.height		= 2226	
dw_pagos.retrieve(ls_base,ls_serie,ll_numero)
end event

type dw_datos_cliente from datawindow within w_beneficios_gestion
integer x = 32
integer y = 32
integer width = 2446
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "dw_promocion_antecedentes_cliente"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_beneficios_gestion
integer x = 37
integer y = 740
integer width = 2432
integer height = 572
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Beneficios Asociados"
end type

type gb_2 from groupbox within w_beneficios_gestion
integer x = 41
integer y = 540
integer width = 722
integer height = 184
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Pago"
end type

type dw_pagos from datawindow within w_beneficios_gestion
boolean visible = false
integer x = 59
integer y = 1352
integer width = 2405
integer height = 476
integer taborder = 20
string title = "none"
string dataobject = "dw_beneficio_lista_cupones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_usar_beneficio from commandbutton within w_beneficios_gestion
integer x = 32
integer y = 1344
integer width = 384
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Usar Beneficio"
end type

event clicked;string ls_ventana,ls_usuario,ls_estado
long	ll_rut,ll_cod_benef,ll_cod_benef_d,ll_cant_benef,ll_indi,ll_corr,ll_tot_reg,ll_estado_reg,&
		ll_folio,ll_tot_cup,ll_fila,ll_count,ll_row
date	ld_fecha_uso

dw_lista_beneficios.accepttext()
if rb_ci.checked = true then
	ll_folio	= long(trim(sle_ci.text))
elseif  rb_cu.checked = true then
	ll_tot_cup 	= dw_pagos.rowcount()
	ll_count		= 0
	for ll_row = 1 to ll_tot_cup
		ll_fila 			= dw_pagos.Find("estado_reg = 0", 1, ll_tot_cup)
		if ll_fila = 1 then
			ll_folio	= dw_pagos.getitemnumber(ll_row,'estado_reg')
			ll_count	= ll_count +1
		end if	
	next	
	if ll_count = 0 then
		messagebox('Advertencia','No se ha seleccionado  Cupón')
	elseif ll_count >1 then
		messagebox('Advertencia','Se ha seleccionado más de UN Cupón')
	end if	
end if

if ll_folio > 0 and ll_count = 1 then
	ll_tot_reg 	= dw_lista_beneficios.rowcount()
	for ll_indi = 1 to ll_tot_reg
		ll_estado_reg				= dw_lista_beneficios.getitemnumber(ll_indi,'estado_reg')  
		if ll_estado_reg = 0 then	
			ll_corr					= dw_lista_beneficios.getitemnumber(ll_indi,'correlativo')
			ls_estado				= dw_lista_beneficios.getitemstring(ll_indi,'estado')
			ll_cod_benef			= dw_lista_beneficios.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_lista_beneficios.getitemnumber(ll_indi,'cod_benef_detalle')
			if ls_estado <> 'U' then
				UPDATE 	"TIPO_PROMOCION_ASOCIADOS"  
				SET 		"ESTADO" = :ls_estado,
							"FECHA_USO" = sysdate,
							"USUARIO" = :gs_user
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."CORRELATIVO" = :ll_corr )
				USING 	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if	
			else
				messagebox('Advertencia','Beneficio ya Utilizado')
			end if	
		else
		end if	
	next
END IF	
end event

type cb_cerrar from commandbutton within w_beneficios_gestion
integer x = 2130
integer y = 1344
integer width = 338
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_beneficios_gestion)
end event

type dw_lista_beneficios from datawindow within w_beneficios_gestion
integer x = 46
integer y = 812
integer width = 2400
integer height = 460
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_usar_beneficio"
boolean hscrollbar = true
boolean border = false
boolean livescroll = true
end type

