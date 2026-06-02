forward
global type w_solicitud_gestion_funeraria from window
end type
type cb_buscar_ficha from commandbutton within w_solicitud_gestion_funeraria
end type
type em_fecha_actual from statictext within w_solicitud_gestion_funeraria
end type
type st_promesa from statictext within w_solicitud_gestion_funeraria
end type
type rb_digitadas from radiobutton within w_solicitud_gestion_funeraria
end type
type rb_sin_digitar from radiobutton within w_solicitud_gestion_funeraria
end type
type rb_cheque_entregado from radiobutton within w_solicitud_gestion_funeraria
end type
type rb_cheque_pendiente from radiobutton within w_solicitud_gestion_funeraria
end type
type fecha_t from statictext within w_solicitud_gestion_funeraria
end type
type usuario_t from statictext within w_solicitud_gestion_funeraria
end type
type st_usuario from statictext within w_solicitud_gestion_funeraria
end type
type cb_solicitud from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_asociar_rut from commandbutton within w_solicitud_gestion_funeraria
end type
type pb_buscar from picturebutton within w_solicitud_gestion_funeraria
end type
type em_ctto from editmask within w_solicitud_gestion_funeraria
end type
type rb_todas from radiobutton within w_solicitud_gestion_funeraria
end type
type rb_pagada from radiobutton within w_solicitud_gestion_funeraria
end type
type rb_pendiente from radiobutton within w_solicitud_gestion_funeraria
end type
type cb_detalle from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_ingresar_gestion from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_imprimir from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_exportar from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_filtrar from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_cta_cte from commandbutton within w_solicitud_gestion_funeraria
end type
type cb_cerrar from commandbutton within w_solicitud_gestion_funeraria
end type
type gb_3 from groupbox within w_solicitud_gestion_funeraria
end type
type dw_lista_solicitud from datawindow within w_solicitud_gestion_funeraria
end type
type gb_estado from groupbox within w_solicitud_gestion_funeraria
end type
type gb_estado_cheque from groupbox within w_solicitud_gestion_funeraria
end type
type gb_estado_promesa from groupbox within w_solicitud_gestion_funeraria
end type
end forward

global type w_solicitud_gestion_funeraria from window
integer width = 3913
integer height = 2220
boolean titlebar = true
string title = "Control Funeraria"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_buscar_ficha cb_buscar_ficha
em_fecha_actual em_fecha_actual
st_promesa st_promesa
rb_digitadas rb_digitadas
rb_sin_digitar rb_sin_digitar
rb_cheque_entregado rb_cheque_entregado
rb_cheque_pendiente rb_cheque_pendiente
fecha_t fecha_t
usuario_t usuario_t
st_usuario st_usuario
cb_solicitud cb_solicitud
cb_asociar_rut cb_asociar_rut
pb_buscar pb_buscar
em_ctto em_ctto
rb_todas rb_todas
rb_pagada rb_pagada
rb_pendiente rb_pendiente
cb_detalle cb_detalle
cb_ingresar_gestion cb_ingresar_gestion
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_cta_cte cb_cta_cte
cb_cerrar cb_cerrar
gb_3 gb_3
dw_lista_solicitud dw_lista_solicitud
gb_estado gb_estado
gb_estado_cheque gb_estado_cheque
gb_estado_promesa gb_estado_promesa
end type
global w_solicitud_gestion_funeraria w_solicitud_gestion_funeraria

type variables
Long		il_row
String	is_filtro
end variables

event open;long		ll_new,ll_tot_reg
datetime	ldt_fecha_actual

gf_centrar(w_solicitud_gestion_funeraria)
dw_lista_solicitud.dataobject	= 'dw_lista_solicitud_funeraria'
dw_lista_solicitud.settransobject(sqlca)
ll_tot_reg				= dw_lista_solicitud.retrieve()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
end if
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
em_fecha_actual.text								= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fecha_actual									= datetime(date(em_fecha_actual.text),time('00:00:00'))
st_usuario.text									= string(gs_user)
st_promesa.text									= 'Nº Folio'
dw_lista_solicitud.Object.numero_t.border	= 6
dw_lista_solicitud.Object.folio_t.border	= 5

end event

on w_solicitud_gestion_funeraria.create
this.cb_buscar_ficha=create cb_buscar_ficha
this.em_fecha_actual=create em_fecha_actual
this.st_promesa=create st_promesa
this.rb_digitadas=create rb_digitadas
this.rb_sin_digitar=create rb_sin_digitar
this.rb_cheque_entregado=create rb_cheque_entregado
this.rb_cheque_pendiente=create rb_cheque_pendiente
this.fecha_t=create fecha_t
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.cb_solicitud=create cb_solicitud
this.cb_asociar_rut=create cb_asociar_rut
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.rb_todas=create rb_todas
this.rb_pagada=create rb_pagada
this.rb_pendiente=create rb_pendiente
this.cb_detalle=create cb_detalle
this.cb_ingresar_gestion=create cb_ingresar_gestion
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_cta_cte=create cb_cta_cte
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.dw_lista_solicitud=create dw_lista_solicitud
this.gb_estado=create gb_estado
this.gb_estado_cheque=create gb_estado_cheque
this.gb_estado_promesa=create gb_estado_promesa
this.Control[]={this.cb_buscar_ficha,&
this.em_fecha_actual,&
this.st_promesa,&
this.rb_digitadas,&
this.rb_sin_digitar,&
this.rb_cheque_entregado,&
this.rb_cheque_pendiente,&
this.fecha_t,&
this.usuario_t,&
this.st_usuario,&
this.cb_solicitud,&
this.cb_asociar_rut,&
this.pb_buscar,&
this.em_ctto,&
this.rb_todas,&
this.rb_pagada,&
this.rb_pendiente,&
this.cb_detalle,&
this.cb_ingresar_gestion,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_cta_cte,&
this.cb_cerrar,&
this.gb_3,&
this.dw_lista_solicitud,&
this.gb_estado,&
this.gb_estado_cheque,&
this.gb_estado_promesa}
end on

on w_solicitud_gestion_funeraria.destroy
destroy(this.cb_buscar_ficha)
destroy(this.em_fecha_actual)
destroy(this.st_promesa)
destroy(this.rb_digitadas)
destroy(this.rb_sin_digitar)
destroy(this.rb_cheque_entregado)
destroy(this.rb_cheque_pendiente)
destroy(this.fecha_t)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.cb_solicitud)
destroy(this.cb_asociar_rut)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.rb_todas)
destroy(this.rb_pagada)
destroy(this.rb_pendiente)
destroy(this.cb_detalle)
destroy(this.cb_ingresar_gestion)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_cta_cte)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.dw_lista_solicitud)
destroy(this.gb_estado)
destroy(this.gb_estado_cheque)
destroy(this.gb_estado_promesa)
end on

type cb_buscar_ficha from commandbutton within w_solicitud_gestion_funeraria
integer x = 905
integer y = 1896
integer width = 366
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Ficha"
end type

event clicked;if isvalid(w_listado_ficha_sepultacion) then close(w_listado_ficha_sepultacion)
open(w_listado_ficha_sepultacion)
end event

type em_fecha_actual from statictext within w_solicitud_gestion_funeraria
integer x = 3383
integer y = 28
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_promesa from statictext within w_solicitud_gestion_funeraria
integer x = 2062
integer y = 2004
integer width = 279
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_digitadas from radiobutton within w_solicitud_gestion_funeraria
integer x = 2624
integer y = 96
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Digitadas"
end type

event clicked;string	ls_filtro,ls_campo_ord
long		ll_tot_reg,ll_tot_fila

dw_lista_solicitud.dataobject	= 'dw_lista_solicitud_funeraria'
dw_lista_solicitud.settransobject(sqlca)
ll_tot_reg				= dw_lista_solicitud.retrieve()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
end if
ls_filtro = "cd_folio_ult_estado = 11"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_fila				= dw_lista_solicitud.rowcount()
if ll_tot_fila=0 then
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type rb_sin_digitar from radiobutton within w_solicitud_gestion_funeraria
integer x = 2240
integer y = 96
integer width = 370
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sin Digitar"
end type

event clicked;string	ls_filtro,ls_campo_ord
long		ll_tot_reg,ll_tot_fila

dw_lista_solicitud.dataobject	= 'dw_lista_solicitud_funeraria'
dw_lista_solicitud.settransobject(sqlca)
ll_tot_reg				= dw_lista_solicitud.retrieve()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
end if
ls_filtro = "cd_folio_ult_estado <> 11"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_fila				= dw_lista_solicitud.rowcount()
if ll_tot_fila=0 then
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type rb_cheque_entregado from radiobutton within w_solicitud_gestion_funeraria
integer x = 1330
integer y = 96
integer width = 370
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregado"
end type

event clicked;string	ls_filtro,ls_campo_ord
long		ll_tot_reg,ll_tot_fila

dw_lista_solicitud.dataobject	= 'dw_lista_solicitud_funeraria'
dw_lista_solicitud.settransobject(sqlca)
ll_tot_reg				= dw_lista_solicitud.retrieve()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
end if
ls_filtro = "cod_estado = 20"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_fila				= dw_lista_solicitud.rowcount()
if ll_tot_fila=0 then
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type rb_cheque_pendiente from radiobutton within w_solicitud_gestion_funeraria
integer x = 1733
integer y = 96
integer width = 370
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendiente"
end type

event clicked;string	ls_filtro,ls_campo_ord
long		ll_tot_reg,ll_tot_fila

dw_lista_solicitud.dataobject	= 'dw_lista_solicitud_funeraria'
dw_lista_solicitud.settransobject(sqlca)
ll_tot_reg				= dw_lista_solicitud.retrieve()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
end if
ls_filtro = "cod_estado >= 16 and cod_estado <> 20" 
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_fila				= dw_lista_solicitud.rowcount()
if ll_tot_fila=0 then
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type fecha_t from statictext within w_solicitud_gestion_funeraria
integer x = 3127
integer y = 36
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type usuario_t from statictext within w_solicitud_gestion_funeraria
integer x = 3127
integer y = 104
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_solicitud_gestion_funeraria
integer x = 3383
integer y = 104
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_solicitud from commandbutton within w_solicitud_gestion_funeraria
integer x = 41
integer y = 1896
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Solicitud Pago"
end type

event clicked;string	ls_base,ls_serie,ls_string
double		ldb_numero

if dw_lista_solicitud.rowcount() > 0 then
	if il_row > 0 then
		ls_base			= dw_lista_solicitud.getitemstring(il_row,'base')
		ls_serie			= dw_lista_solicitud.getitemstring(il_row,'serie')
		ldb_numero		= dw_lista_solicitud.getitemnumber(il_row,'numero')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 and dw_lista_solicitud.dataobject='dw_lista_solicitud_funeraria' then
			ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
			if isvalid(w_solicitud_pago_funeraria) then close(w_solicitud_pago_funeraria)
			OpenWithParm (w_solicitud_pago_funeraria,ls_string)
			w_solicitud_pago_funeraria.pb_aceptar.triggerevent(clicked!)
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Promesa")
	end if
end if
		
end event

type cb_asociar_rut from commandbutton within w_solicitud_gestion_funeraria
integer x = 791
integer y = 1988
integer width = 480
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar * &Rut Titular"
end type

event clicked;string	ls_string,ls_base,ls_serie
long		ll_rut
double	ldb_numero

if dw_lista_solicitud.rowcount()>0 then
	if il_row>0 then
		ll_rut			= dw_lista_solicitud.getitemnumber(il_row,'funeraria_pago_comision_rut_titular')
		ls_base			= dw_lista_solicitud.getitemstring(il_row,'base')
		ls_serie			= dw_lista_solicitud.getitemstring(il_row,'serie')
		ldb_numero		= dw_lista_solicitud.getitemnumber(il_row,'numero')
		if ll_rut > 0 and not isnull(ll_rut) and not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero > 0 and  dw_lista_solicitud.dataobject='dw_lista_solicitud_funeraria' then
			ls_string	= string(ll_rut)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
			if isvalid(w_asociar_x_rut) then close(w_asociar_x_rut)
			OpenWithParm (w_asociar_x_rut,ls_string)
		elseif isnull(ll_rut) and ll_rut = 0 then
			messagebox("Advertencia","La Solicitud Pago Comisión No Registra Rut del Titular")
			close(w_asociar_x_rut)
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Promesa")
	end if
end if
end event

type pb_buscar from picturebutton within w_solicitud_gestion_funeraria
integer x = 2702
integer y = 1988
integer width = 101
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string
double	ldb_numero

ldb_numero						= double(em_ctto.text)
ll_tot_reg						= dw_lista_solicitud.rowcount()
if ldb_numero>0 and ll_tot_reg>0 then
	if st_promesa.text = 'Nº Promesa' then
		ls_string				= "numero = "+string(ldb_numero)
		ll_fila 					= dw_lista_solicitud.find(ls_string, 1, ll_tot_reg)
		if ll_fila>0 then
			dw_lista_solicitud.scrolltorow(ll_fila)
			dw_lista_solicitud.SelectRow(ll_fila, true)
		else
			messagebox("Advertencia","Nº Contrato No Existe en Lista")
			dw_lista_solicitud.scrolltorow(1)
		end if
	elseif st_promesa.text	= 'Nº Folio' then
		ls_string				= "folio = "+string(ldb_numero)
		ll_fila 					= dw_lista_solicitud.find(ls_string, 1, ll_tot_reg)
		if ll_fila>0 then
			dw_lista_solicitud.scrolltorow(ll_fila)
			dw_lista_solicitud.SelectRow(ll_fila, true)
		else
			messagebox("Advertencia","Nº Contrato No Existe en Lista")
			dw_lista_solicitud.scrolltorow(1)
		end if
	end if
end if
end event

type em_ctto from editmask within w_solicitud_gestion_funeraria
integer x = 2354
integer y = 1988
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type rb_todas from radiobutton within w_solicitud_gestion_funeraria
integer x = 91
integer y = 96
integer width = 270
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas"
boolean checked = true
end type

event clicked;long		ll_tot_reg
string	ls_filtro,ls_campo_ord

em_ctto.text				= ''
ls_filtro = "cod_estado>0"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_reg				= dw_lista_solicitud.rowcount()
if ll_tot_reg=0 then
	dw_lista_solicitud.insertrow(0)
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
cb_cta_cte.enabled	= true
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type rb_pagada from radiobutton within w_solicitud_gestion_funeraria
integer x = 398
integer y = 96
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aceptada"
end type

event clicked;long		ll_tot_reg
string	ls_filtro,ls_campo_ord

em_ctto.text				= ''
ls_filtro = "cod_estado >= 16"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_reg				= dw_lista_solicitud.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Solicitud Pagadas")
end if
cb_cta_cte.enabled	= true
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type rb_pendiente from radiobutton within w_solicitud_gestion_funeraria
integer x = 800
integer y = 96
integer width = 398
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendientes"
end type

event clicked;long		ll_tot_reg
string	ls_filtro,ls_campo_ord

em_ctto.text				= ''
ls_filtro					= "( cod_estado <> 20 and  cd_folio_ult_estado >0 ) or ( cod_estado >= 0 and  cd_folio_ult_estado <>11)"
dw_lista_solicitud.SetFilter(ls_filtro)
dw_lista_solicitud.Filter( )
ll_tot_reg				= dw_lista_solicitud.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Solicitud Pendientes")
	dw_lista_solicitud.insertrow(0)
end if
cb_cta_cte.enabled	= true
ls_campo_ord		= 'numero'
dw_lista_solicitud.Object.numero_t.border=5
dw_lista_solicitud.Object.folio_t.border=6
dw_lista_solicitud.SETSORT(ls_campo_ord)
dw_lista_solicitud.SORT()
st_promesa.text	= 'Nº Promesa'
end event

type cb_detalle from commandbutton within w_solicitud_gestion_funeraria
integer x = 37
integer y = 1988
integer width = 325
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver &Detalle"
end type

event clicked;String	ls_string,ls_base,ls_serie
double		ldb_numero

if dw_lista_solicitud.rowcount()>0 then
	ls_base		= dw_lista_solicitud.getitemstring(il_row,'base')
	ls_serie		= dw_lista_solicitud.getitemstring(il_row,'serie')
	ldb_numero	= dw_lista_solicitud.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
	if isvalid(w_funeraria_consultas_detalle_gestion) then close(w_funeraria_consultas_detalle_gestion)
	if not isnull(ls_base) and ldb_numero>0 then openwithparm(w_funeraria_consultas_detalle_gestion,ls_string)
end if
end event

type cb_ingresar_gestion from commandbutton within w_solicitud_gestion_funeraria
integer x = 448
integer y = 1896
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Gestión"
end type

event clicked;string	ls_base,ls_serie,ls_string,ls_depto
long		ll_folio
double	ldb_numero


close(w_solicitud_control_funeraria)
dw_lista_solicitud.accepttext()
if dw_lista_solicitud.rowcount()>0 then
	ls_base				= dw_lista_solicitud.getitemstring(il_row,'base')
	ls_serie				= dw_lista_solicitud.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista_solicitud.getitemnumber(il_row,'numero')
	ll_folio				= dw_lista_solicitud.getitemnumber(il_row,'folio')
	if ll_folio>0 then
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 and dw_lista_solicitud.dataobject='dw_lista_solicitud_funeraria' then
			ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
			if isvalid(w_solicitud_control_funeraria) then close(w_solicitud_control_funeraria)
			OpenWithParm (w_solicitud_control_funeraria,ls_string)
		end if
	else
		messagebox("Advertencia","No Puede Ingresar Gestión Solicitud Debe Ser Creada")
		close(w_solicitud_control_funeraria)
	end if
end if
end event

type cb_imprimir from commandbutton within w_solicitud_gestion_funeraria
integer x = 2862
integer y = 1988
integer width = 229
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_solicitud.rowcount() > 0 then f_Print( dw_lista_solicitud )
end event

type cb_exportar from commandbutton within w_solicitud_gestion_funeraria
integer x = 3095
integer y = 1988
integer width = 229
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_solicitud
if dw_lista_solicitud.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_solicitud_gestion_funeraria
integer x = 3328
integer y = 1988
integer width = 178
integer height = 88
integer taborder = 110
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
dw_lista_solicitud.SETfilter(NULO)
dw_lista_solicitud.filter()
end event

type cb_cta_cte from commandbutton within w_solicitud_gestion_funeraria
integer x = 361
integer y = 1988
integer width = 430
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;long		ll_cd_estado_promesa

if dw_lista_solicitud.rowcount()>0 then
	if il_row>0 then
		gi_numero 					= dw_lista_solicitud.getitemnumber(il_row,'numero')
		gs_base						= dw_lista_solicitud.getitemstring(il_row,'base')
		gs_serie						= dw_lista_solicitud.getitemstring(il_row,'serie')
		ll_cd_estado_promesa 	= dw_lista_solicitud.getitemnumber(il_row,'cd_folio_ult_estado')
		gi_rut						= dw_lista_solicitud.getitemnumber(il_row,'funeraria_pago_comision_rut_titular')
		if ll_cd_estado_promesa <> 11 then
			messagebox("Advertencia","Promesa No se encuentra Digitada en el Sistema")
		else
			CHOOSE CASE gs_base
				CASE "O" // Oferta
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
end if
end event

type cb_cerrar from commandbutton within w_solicitud_gestion_funeraria
integer x = 3575
integer y = 1980
integer width = 270
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_solicitud_gestion_funeraria)
end event

type gb_3 from groupbox within w_solicitud_gestion_funeraria
integer x = 2839
integer y = 1936
integer width = 695
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista_solicitud from datawindow within w_solicitud_gestion_funeraria
integer x = 41
integer y = 236
integer width = 3808
integer height = 1644
integer taborder = 10
string dataobject = "dw_lista_solicitud_funeraria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_filtro,ls_campo_ord
long		ll_cd_estado_promesa,ll_tot_reg,ll_nulo

if row>0 then
	il_row						= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	ll_cd_estado_promesa 	= dw_lista_solicitud.getitemnumber(il_row,'cd_folio_ult_estado')
	if ll_cd_estado_promesa<>11 then
		cb_cta_cte.enabled	= false
	else
		cb_cta_cte.enabled	= true
	end if
else
	ls_columna				= dwo.name
	if ls_columna='folio_t' then
		ls_campo_ord		= 'folio'
		em_ctto.text		= ''
		dw_lista_solicitud.Object.folio_t.border=5
		dw_lista_solicitud.Object.numero_t.border=6
		dw_lista_solicitud.SETSORT(ls_campo_ord)
		dw_lista_solicitud.SORT()
		st_promesa.text	= 'Nº Folio'
		
	elseif ls_columna='numero_t' then
		ls_campo_ord		= 'numero'
		em_ctto.text		= ''
		dw_lista_solicitud.Object.numero_t.border=5
		dw_lista_solicitud.Object.folio_t.border=6
		dw_lista_solicitud.SETSORT(ls_campo_ord)
		dw_lista_solicitud.SORT()
		st_promesa.text	= 'Nº Promesa'
					
	elseif ls_columna='t_agente' or ls_columna='t_agente_color' then
		ls_filtro			= "funeraria_estado_depto_2 = 'P'"
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
		ll_tot_reg			= dw_lista_solicitud.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Promesas asignadas a su Departamento")
		end if
	elseif ls_columna='t_supervisor' or ls_columna='t_supervisor_color' then
		ls_filtro				= "funeraria_estado_depto_2 = 'X'"
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
		ll_tot_reg				= dw_lista_solicitud.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Promesas asignadas a su Departamento")
		end if
	elseif ls_columna='t_adm_ventas' or ls_columna='t_adm_ventas_color' then
		ls_filtro				= "funeraria_estado_depto_2 = 'O'"
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
		ll_tot_reg				= dw_lista_solicitud.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Promesas asignadas a su Departamento")
		end if
	elseif ls_columna='t_contabilidad' or ls_columna='t_contabilidad_color' then
		ls_filtro				= "funeraria_estado_depto_2 = 'C'"
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
		ll_tot_reg				= dw_lista_solicitud.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Promesas asignadas a su Departamento")
		end if
	elseif ls_columna='t_tesoreria' or ls_columna='t_tesoreria_color' then
		ls_filtro				= "funeraria_estado_depto_2 = 'T'"
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
		ll_tot_reg				= dw_lista_solicitud.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Promesas asignadas a su Departamento")
		end if
	elseif ls_columna='t_todo' then
		ls_filtro				= ""
		dw_lista_solicitud.SetFilter(ls_filtro)
		dw_lista_solicitud.Filter( )
	end if
end if
this.accepttext()
end event

event rowfocuschanged;long	ll_cd_estado_promesa

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	ll_cd_estado_promesa = dw_lista_solicitud.getitemnumber(il_row,'cd_folio_ult_estado')
	if ll_cd_estado_promesa<>11 then
		cb_cta_cte.enabled	= false
	else
		cb_cta_cte.enabled	= true
	end if
end if


end event

event doubleclicked;string	ls_base,ls_serie,ls_string
double		ldb_numero

if row > 0 then
	il_row		= row
	ls_base		= dw_lista_solicitud.getitemstring(il_row,'base')
	ls_serie		= dw_lista_solicitud.getitemstring(il_row,'serie')
	ldb_numero	= dw_lista_solicitud.getitemnumber(il_row,'numero')
		
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 and dw_lista_solicitud.dataobject='dw_lista_solicitud_funeraria' then
		ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
		OpenWithParm (w_solicitud_pago_funeraria,ls_string)
		w_solicitud_pago_funeraria.pb_aceptar.triggerevent(clicked!)
	end if
else
	messagebox("Advertencia","Debe Seleccionar Promesa")
end if
end event

type gb_estado from groupbox within w_solicitud_gestion_funeraria
integer x = 41
integer y = 16
integer width = 1216
integer height = 188
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Solicitudes Comisión  Funerarias"
end type

type gb_estado_cheque from groupbox within w_solicitud_gestion_funeraria
integer x = 1285
integer y = 16
integer width = 855
integer height = 188
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Cheque"
end type

type gb_estado_promesa from groupbox within w_solicitud_gestion_funeraria
integer x = 2171
integer y = 16
integer width = 841
integer height = 188
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Promesas"
end type

