forward
global type w_anticipo_comisiones from window
end type
type pb_1 from picturebutton within w_anticipo_comisiones
end type
type cb_filtrar_a_pago from commandbutton within w_anticipo_comisiones
end type
type pb_aceptar from picturebutton within w_anticipo_comisiones
end type
type cbx_todos_rescomi from checkbox within w_anticipo_comisiones
end type
type cbx_todos_prom from checkbox within w_anticipo_comisiones
end type
type cbx_pagada from checkbox within w_anticipo_comisiones
end type
type cbx_castigada from checkbox within w_anticipo_comisiones
end type
type cbx_con_saldo from checkbox within w_anticipo_comisiones
end type
type cbx_pendiente from checkbox within w_anticipo_comisiones
end type
type cbx_resciliado from checkbox within w_anticipo_comisiones
end type
type cbx_vigente from checkbox within w_anticipo_comisiones
end type
type pb_filtrar from picturebutton within w_anticipo_comisiones
end type
type pb_ordenar from picturebutton within w_anticipo_comisiones
end type
type pb_imprimir from picturebutton within w_anticipo_comisiones
end type
type pb_exportar from picturebutton within w_anticipo_comisiones
end type
type pb_cerrar from picturebutton within w_anticipo_comisiones
end type
type dw_lista from datawindow within w_anticipo_comisiones
end type
type gb_2 from groupbox within w_anticipo_comisiones
end type
type gb_1 from groupbox within w_anticipo_comisiones
end type
end forward

global type w_anticipo_comisiones from window
integer width = 3584
integer height = 2180
boolean titlebar = true
string title = "Consulta Anticipo Comisiones Promesas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_1 pb_1
cb_filtrar_a_pago cb_filtrar_a_pago
pb_aceptar pb_aceptar
cbx_todos_rescomi cbx_todos_rescomi
cbx_todos_prom cbx_todos_prom
cbx_pagada cbx_pagada
cbx_castigada cbx_castigada
cbx_con_saldo cbx_con_saldo
cbx_pendiente cbx_pendiente
cbx_resciliado cbx_resciliado
cbx_vigente cbx_vigente
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_cerrar pb_cerrar
dw_lista dw_lista
gb_2 gb_2
gb_1 gb_1
end type
global w_anticipo_comisiones w_anticipo_comisiones

type variables
String	is_filtro=''
string	ls_filtter_cadena='', ls_filtter_rescomi='', ls_filtter=''
end variables

forward prototypes
public subroutine wf_validar_todos_rescomi ()
public subroutine wf_validar_todos_promesa ()
end prototypes

public subroutine wf_validar_todos_rescomi ();if cbx_pendiente.checked=true and cbx_castigada.checked=true and &
	cbx_con_saldo.checked=true and cbx_pagada.checked=true then
	cbx_todos_rescomi.checked	= true
else
	cbx_todos_rescomi.checked	= false
end if

end subroutine

public subroutine wf_validar_todos_promesa ();if cbx_vigente.checked=true and cbx_resciliado.checked=true then
	cbx_todos_prom.checked	= true
else
	cbx_todos_prom.checked	= false
end if
end subroutine

on w_anticipo_comisiones.create
this.pb_1=create pb_1
this.cb_filtrar_a_pago=create cb_filtrar_a_pago
this.pb_aceptar=create pb_aceptar
this.cbx_todos_rescomi=create cbx_todos_rescomi
this.cbx_todos_prom=create cbx_todos_prom
this.cbx_pagada=create cbx_pagada
this.cbx_castigada=create cbx_castigada
this.cbx_con_saldo=create cbx_con_saldo
this.cbx_pendiente=create cbx_pendiente
this.cbx_resciliado=create cbx_resciliado
this.cbx_vigente=create cbx_vigente
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.cb_filtrar_a_pago,&
this.pb_aceptar,&
this.cbx_todos_rescomi,&
this.cbx_todos_prom,&
this.cbx_pagada,&
this.cbx_castigada,&
this.cbx_con_saldo,&
this.cbx_pendiente,&
this.cbx_resciliado,&
this.cbx_vigente,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_cerrar,&
this.dw_lista,&
this.gb_2,&
this.gb_1}
end on

on w_anticipo_comisiones.destroy
destroy(this.pb_1)
destroy(this.cb_filtrar_a_pago)
destroy(this.pb_aceptar)
destroy(this.cbx_todos_rescomi)
destroy(this.cbx_todos_prom)
destroy(this.cbx_pagada)
destroy(this.cbx_castigada)
destroy(this.cbx_con_saldo)
destroy(this.cbx_pendiente)
destroy(this.cbx_resciliado)
destroy(this.cbx_vigente)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;long		ll_tot_reg, ll_indi, cta_pag_s, nro_cuotas, cta_pag_m, ll_count_ingreso
string	ls_codigo, ls_serie, ls_fec_prox_comi,ls_estado
Long		ll_contrato, RET, ret1
Double	ll_count_porc,numero
Long 		cuenta, ret11, dias
datetime fecha_prim, fecha_man, fecha_vto
string 	base, serie, ls_cod_age, ls_op_recep
SetPointer(HourGlass!)
ls_op_recep	= message.stringparm
if ls_op_recep="1" then
	gb_2.visible					= true
	gb_1.visible					= true
	pb_aceptar.visible			= true
	cbx_vigente.visible			= true
	cbx_resciliado.visible		= true
	cbx_todos_prom.visible		= true
	cbx_pendiente.visible		= true
	cbx_con_saldo.visible		= true
	cbx_castigada.visible		= true
	cbx_pagada.visible			= true
	cbx_todos_rescomi.visible	= true
	cbx_vigente.checked			= true
	cbx_resciliado.checked		= true
	cbx_todos_prom.checked		= true
	cbx_pendiente.checked		= true
	cbx_con_saldo.checked		= true
	cbx_castigada.checked		= true
	cbx_pagada.checked			= true
	cbx_todos_rescomi.checked	= true
	cb_filtrar_a_pago.visible	= true
else
	cbx_vigente.visible			= false
	cbx_resciliado.visible		= false
	cbx_todos_prom.visible		= false
	cbx_pendiente.visible		= false
	cbx_con_saldo.visible		= false
	cbx_castigada.visible		= false
	cbx_pagada.visible			= false
	cbx_todos_rescomi.visible	= false
	gb_2.visible					= false
	gb_1.visible					= false
	pb_aceptar.visible			= false
	cb_filtrar_a_pago.visible	= false
end if
gf_centrar(w_anticipo_comisiones)
dw_lista.settransobject(sqlca)
this.title									= 'Consulta Anticipo Comisiones Promesas'
w_contar_registros.st_titulo.text	= 'Comisiones Promesas'
ll_tot_reg									= dw_lista.retrieve()
w_contar_registros.st_total.text		= string(ll_tot_reg,"###,###,###,##0")
for ll_indi = 1 to ll_tot_reg
	w_contar_registros.st_procesando.text	= string(ll_indi,"###,###,###,##0")
	ls_cod_age	= dw_lista.getitemstring(ll_indi,'oferta_v_cod_age')
	fecha_prim	= dw_lista.getitemdatetime(ll_indi,'pago_oferta_fecha_prim')
	cta_pag_s	= dw_lista.getitemnumber(ll_indi,'oferta_v_cta_pag_s')
	nro_cuotas	= dw_lista.getitemnumber(ll_indi,'pago_oferta_nro_cuotas')		
	serie			= dw_lista.getitemstring(ll_indi,'cadena_serie')
	numero		= dw_lista.getitemnumber(ll_indi,'cadena_numero')
	ls_estado	= dw_lista.getitemstring(ll_indi,'cadena_estado')
	RET 			= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado)
	fecha_vto	= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
	dias 			= - daysafter (today(),date(fecha_vto))
	if dias <= 5 then ret = 0    //<--
	if ret <= 0 then
		dw_lista.setitem(ll_indi,'funcion_mora',0)
	else	
		dw_lista.setitem(ll_indi,'funcion_mora',ret)			
	end if	
	ll_count_porc		= f_buscar_porc_res_comi( ls_cod_age , serie , numero, "O" )
	dw_lista.setitem(ll_indi,'por_res_comi',ll_count_porc)
	ll_count_ingreso	= f_buscar_ingreso_res_comi( ls_cod_age , serie , numero, "O" )
	dw_lista.setitem(ll_indi,'ing_res_comi',ll_count_ingreso)
	if ret < 2 then
		ls_fec_prox_comi	= f_buscar_fecha_prox_comi(serie , numero, "O")
		dw_lista.setitem(ll_indi,'fecha_pago_comi',ls_fec_prox_comi)
	end if
next
if gs_conexion = "Parque El Prado" then
	dw_lista.object.t_titulo.text = 'Parque El Prado'
elseif gs_conexion = "Parque La Foresta" then
	dw_lista.object.t_titulo.text = 'Parque La Foresta'
elseif gs_conexion = "Parque Concepción" then
	dw_lista.object.t_titulo.text = 'Parque Concepción'
end if
if ls_op_recep = "2" then
	dw_lista.object.t_18.visible						= false
	dw_lista.object.tot_reg_0.visible				= false
	dw_lista.object.t_19.visible						= false
	dw_lista.object.tot_reg_pagadas.visible		= false
	dw_lista.object.t_20.visible						= false
	dw_lista.object.tot_reg_pendientes.visible	= false
	is_filtro	= "(comision_promesa_c_pie + comision_promesa_c_primera + comision_promesa_c_segunda + comision_promesa_c_tercera + comision_promesa_c_cuarta + comision_promesa_c_quinta + comision_promesa_c_sexta) = 0 and oferta_v_estado_comi<>'P'"
	dw_lista.SetFilter(is_filtro)
	dw_lista.Filter( )
end if
if dw_lista.rowcount() = 0 then
	messagebox("Advertencia","No registra dato")
	close(w_anticipo_comisiones)
else
	dw_lista.sort()
end if
close(w_contar_registros)
gs_ventana	= 'w_anticipo_comisiones'
f_valida_objeto_1()
SetPointer(Arrow!)
end event

type pb_1 from picturebutton within w_anticipo_comisiones
integer x = 3104
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Egreso (o).BMP"
string disabledname = "Egreso (o)_no.BMP"
alignment htextalign = left!
end type

event clicked;if is_filtro='estado_0=1' then
	is_filtro	= ''
	dw_lista.SetFilter(is_filtro)
	dw_lista.Filter( )
else
	is_filtro	= ''
	dw_lista.SetFilter(is_filtro)
	dw_lista.Filter( )
	is_filtro	= "estado_0=1"
	dw_lista.SetFilter(is_filtro)
	dw_lista.Filter( )
end if
dw_lista.sort()
end event

type cb_filtrar_a_pago from commandbutton within w_anticipo_comisiones
integer x = 2523
integer y = 1940
integer width = 366
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar A Pagar"
end type

event clicked;if is_filtro = "fecha_pago_comi ='S'" then 
	is_filtro = ""
else
	is_filtro = "fecha_pago_comi ='S'"
	if not isnull(ls_filtter) and ls_filtter<>'' then
		is_filtro	= ls_filtter+' and '+is_filtro
	end if
end if
dw_lista.SetFilter(is_filtro)
dw_lista.Filter( )
dw_lista.sort()
end event

type pb_aceptar from picturebutton within w_anticipo_comisiones
integer x = 2930
integer y = 1860
integer width = 169
integer height = 148
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = left!
end type

event clicked;SetNull(ls_filtter_cadena)
SetNull(ls_filtter_rescomi)
SetNull(ls_filtter)
Setnull(is_filtro)
// filtro estado cadena
if cbx_vigente.checked=true or cbx_resciliado.checked=true then
	ls_filtter_cadena	= "("
end if
if cbx_vigente.checked=true then
	ls_filtter_cadena	= ls_filtter_cadena+"cadena_estado='"+"V"+"' or cadena_estado='"+'C'+"'"
end if
if cbx_resciliado.checked=true then
	if not isnull(ls_filtter_cadena) then
		if len(ls_filtter_cadena)=1 then
			ls_filtter_cadena	= ls_filtter_cadena+"cadena_estado='"+"N"+"' or cadena_estado='"+"R"+"' or cadena_estado='"+"P"+"'"
		else
			ls_filtter_cadena	= ls_filtter_cadena+" or cadena_estado='"+"N"+"' or cadena_estado='"+"R"+"' or cadena_estado='"+"P"+"'"
		end if
	else
		ls_filtter_cadena	= "cadena_estado='"+"N"+"' or cadena_estado='"+"R"+"' or cadena_estado='"+"P"+"'"
	end if
end if
if cbx_vigente.checked=true or cbx_resciliado.checked=true then
	ls_filtter_cadena	= ls_filtter_cadena+")"
end if
// filtro estado rescomi
if cbx_pendiente.checked=true or cbx_castigada.checked=true or &
	cbx_con_saldo.checked=true or cbx_pagada.checked=true then
	ls_filtter_cadena	= ls_filtter_cadena+" and ("
end if

if cbx_pendiente.checked=true then
	if not isnull(ls_filtter_rescomi) then
		ls_filtter_rescomi	= ls_filtter_rescomi+"oferta_v_estado_comi='"+"N"+"'"
	else
		ls_filtter_rescomi	= "oferta_v_estado_comi='"+"N"+"'"
	end if
end if
if cbx_castigada.checked=true then
	if not isnull(ls_filtter_rescomi) then
		ls_filtter_rescomi	= ls_filtter_rescomi+" or oferta_v_estado_comi='"+"C"+"'"
	else
		ls_filtter_rescomi	= "oferta_v_estado_comi='"+"C"+"'"
	end if
end if
if cbx_con_saldo.checked=true then
	if not isnull(ls_filtter_rescomi) then
		ls_filtter_rescomi	= ls_filtter_rescomi+" or oferta_v_estado_comi='"+"S"+"'"
	else
		ls_filtter_rescomi	= "oferta_v_estado_comi='"+"S"+"'"
	end if
end if
if cbx_pagada.checked=true then
	if not isnull(ls_filtter_rescomi) then
		ls_filtter_rescomi	= ls_filtter_rescomi+" or oferta_v_estado_comi='"+"P"+"'"
	else
		ls_filtter_rescomi	= "oferta_v_estado_comi='"+"P"+"'"
	end if
end if
if not isnull(ls_filtter_cadena) and not isnull(ls_filtter_rescomi) then
	ls_filtter	= ls_filtter_cadena+" "+ls_filtter_rescomi
else
	if isnull(ls_filtter_cadena) and not isnull(ls_filtter_rescomi) then
		ls_filtter	= ls_filtter_rescomi
	elseif not isnull(ls_filtter_cadena) and isnull(ls_filtter_rescomi) then
		ls_filtter	= ls_filtter_cadena
	end if
end if
if cbx_pendiente.checked=true or cbx_castigada.checked=true or &
	cbx_con_saldo.checked=true or cbx_pagada.checked=true then
	ls_filtter	= ls_filtter+")"
end if
if ls_filtter='' or isnull(ls_filtter) or ls_filtter_cadena='' or &
	isnull(ls_filtter_cadena) or ls_filtter_rescomi='' or isnull(ls_filtter_rescomi) then
	messagebox("Advertencia","Debe Selección por lo menos Una Opción Estado Promesa & Una Opción Estado Res-Comi")
else
	if not isnull(ls_filtter) then
		dw_lista.SetFilter(ls_filtter)
		dw_lista.Filter( )
		dw_lista.sort()
	end if
end if

end event

type cbx_todos_rescomi from checkbox within w_anticipo_comisiones
integer x = 2592
integer y = 1856
integer width = 293
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Todos"
end type

event clicked;if this.checked=true then
	cbx_pendiente.checked	= true
	cbx_castigada.checked	= true
	cbx_con_saldo.checked	= true
	cbx_pagada.checked		= true
else
	cbx_pendiente.checked	= false
	cbx_castigada.checked	= false
	cbx_con_saldo.checked	= false
	cbx_pagada.checked		= false
end if
end event

type cbx_todos_prom from checkbox within w_anticipo_comisiones
integer x = 1230
integer y = 1860
integer width = 288
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Todos"
end type

event clicked;if this.checked= true then
	cbx_vigente.checked		= true
	cbx_resciliado.checked	= true
else
	cbx_vigente.checked		= false
	cbx_resciliado.checked	= false
end if
end event

type cbx_pagada from checkbox within w_anticipo_comisiones
integer x = 2139
integer y = 1936
integer width = 430
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " P - Pagada"
end type

event clicked;wf_validar_todos_rescomi()
end event

type cbx_castigada from checkbox within w_anticipo_comisiones
integer x = 2139
integer y = 1860
integer width = 430
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " C - Castigada"
end type

event clicked;wf_validar_todos_rescomi()
end event

type cbx_con_saldo from checkbox within w_anticipo_comisiones
integer x = 1582
integer y = 1936
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " S - Con Saldo"
end type

event clicked;wf_validar_todos_rescomi()
end event

type cbx_pendiente from checkbox within w_anticipo_comisiones
integer x = 1582
integer y = 1860
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " N - Pendiente Pago"
end type

event clicked;wf_validar_todos_rescomi()
end event

type cbx_resciliado from checkbox within w_anticipo_comisiones
integer x = 786
integer y = 1936
integer width = 439
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " N - Resciliado"
end type

event clicked;wf_validar_todos_promesa()
end event

type cbx_vigente from checkbox within w_anticipo_comisiones
integer x = 786
integer y = 1860
integer width = 439
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " V - Vigente"
end type

event clicked;wf_validar_todos_promesa()
end event

type pb_filtrar from picturebutton within w_anticipo_comisiones
event ue_mousemove pbm_mousemove
integer x = 384
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_anticipo_comisiones
event ue_mousemove pbm_mousemove
integer x = 215
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_anticipo_comisiones
event ue_mousemove pbm_mousemove
integer x = 553
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;long		ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false				
end if
end event

type pb_exportar from picturebutton within w_anticipo_comisiones
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_cerrar from picturebutton within w_anticipo_comisiones
integer x = 3337
integer y = 1860
integer width = 165
integer height = 148
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_anticipo_comisiones)
end event

type dw_lista from datawindow within w_anticipo_comisiones
integer x = 41
integer y = 32
integer width = 3461
integer height = 1760
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_contratos_sin_agrupar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dw_lista.getrow()>0 then
	gi_numero 			= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_numero')
	gi_tipo_busqueda 	= 8
	Open(w_listado_contratos)
end if
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

type gb_2 from groupbox within w_anticipo_comisiones
integer x = 741
integer y = 1804
integer width = 795
integer height = 232
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Promesa"
end type

type gb_1 from groupbox within w_anticipo_comisiones
integer x = 1550
integer y = 1804
integer width = 1358
integer height = 232
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Res-Comi"
end type

