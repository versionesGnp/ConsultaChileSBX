forward
global type w_actualizar_datos_cliente from window
end type
type cb_ctacte from commandbutton within w_actualizar_datos_cliente
end type
type rb_anulado from radiobutton within w_actualizar_datos_cliente
end type
type rb_gestionado from radiobutton within w_actualizar_datos_cliente
end type
type rb_pendientes from radiobutton within w_actualizar_datos_cliente
end type
type rb_todos from radiobutton within w_actualizar_datos_cliente
end type
type cb_limpiar from commandbutton within w_actualizar_datos_cliente
end type
type cb_imprimir from commandbutton within w_actualizar_datos_cliente
end type
type cb_cerrar from commandbutton within w_actualizar_datos_cliente
end type
type cb_aceptar from commandbutton within w_actualizar_datos_cliente
end type
type em_fec_fin from editmask within w_actualizar_datos_cliente
end type
type st_2 from statictext within w_actualizar_datos_cliente
end type
type em_fec_ini from editmask within w_actualizar_datos_cliente
end type
type p_ini from picture within w_actualizar_datos_cliente
end type
type st_3 from statictext within w_actualizar_datos_cliente
end type
type p_fin from picture within w_actualizar_datos_cliente
end type
type pb_ok2 from picturebutton within w_actualizar_datos_cliente
end type
type dw_actualizar_datos from datawindow within w_actualizar_datos_cliente
end type
type gb_1 from groupbox within w_actualizar_datos_cliente
end type
end forward

global type w_actualizar_datos_cliente from window
integer width = 3744
integer height = 1884
boolean titlebar = true
string title = "Actualizar Datos Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
rb_anulado rb_anulado
rb_gestionado rb_gestionado
rb_pendientes rb_pendientes
rb_todos rb_todos
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
em_fec_fin em_fec_fin
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
pb_ok2 pb_ok2
dw_actualizar_datos dw_actualizar_datos
gb_1 gb_1
end type
global w_actualizar_datos_cliente w_actualizar_datos_cliente

type variables
long il_row
end variables

on w_actualizar_datos_cliente.create
this.cb_ctacte=create cb_ctacte
this.rb_anulado=create rb_anulado
this.rb_gestionado=create rb_gestionado
this.rb_pendientes=create rb_pendientes
this.rb_todos=create rb_todos
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.pb_ok2=create pb_ok2
this.dw_actualizar_datos=create dw_actualizar_datos
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.rb_anulado,&
this.rb_gestionado,&
this.rb_pendientes,&
this.rb_todos,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.cb_aceptar,&
this.em_fec_fin,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.pb_ok2,&
this.dw_actualizar_datos,&
this.gb_1}
end on

on w_actualizar_datos_cliente.destroy
destroy(this.cb_ctacte)
destroy(this.rb_anulado)
destroy(this.rb_gestionado)
destroy(this.rb_pendientes)
destroy(this.rb_todos)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.pb_ok2)
destroy(this.dw_actualizar_datos)
destroy(this.gb_1)
end on

event open;gf_centrar(w_actualizar_datos_cliente)
dw_actualizar_datos.settransobject(sqlca)
em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_ini.SetFocus()
end event

type cb_ctacte from commandbutton within w_actualizar_datos_cliente
integer x = 1051
integer y = 1620
integer width = 480
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_rut
Double	ll_numero

ll_numero				= dw_actualizar_datos.getitemnumber(dw_actualizar_datos.getrow(),'numero')
ll_rut						= dw_actualizar_datos.getitemnumber(dw_actualizar_datos.getrow(),'rut')
if ll_numero>0 THEN
	gs_base 				= dw_actualizar_datos.getitemstring(dw_actualizar_datos.getrow(),'base')
	gs_serie 				= dw_actualizar_datos.getitemstring(dw_actualizar_datos.getrow(),'serie')
	gi_numero			= ll_numero
	gi_tipo_busqueda	= 0
elseif ll_rut>0 then
	gi_rut 				= dw_actualizar_datos.getitemnumber(dw_actualizar_datos.getrow(),'rut')
	gi_tipo_busqueda 	= 1
end if
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
Open(w_listado_contratos)
end event

type rb_anulado from radiobutton within w_actualizar_datos_cliente
integer x = 2994
integer y = 92
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anulado"
end type

event clicked;dw_actualizar_datos.reset()
pb_ok2.triggerevent(clicked!)
end event

type rb_gestionado from radiobutton within w_actualizar_datos_cliente
integer x = 2510
integer y = 92
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestionado"
end type

event clicked;dw_actualizar_datos.reset()
pb_ok2.triggerevent(clicked!)
end event

type rb_pendientes from radiobutton within w_actualizar_datos_cliente
integer x = 2030
integer y = 92
integer width = 398
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendientes"
end type

event clicked;dw_actualizar_datos.reset()
pb_ok2.triggerevent(clicked!)
end event

type rb_todos from radiobutton within w_actualizar_datos_cliente
integer x = 1687
integer y = 92
integer width = 261
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;dw_actualizar_datos.reset()
pb_ok2.triggerevent(clicked!)
end event

type cb_limpiar from commandbutton within w_actualizar_datos_cliente
integer x = 1897
integer y = 1620
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_actualizar_datos.reset()
em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_imprimir from commandbutton within w_actualizar_datos_cliente
integer x = 549
integer y = 1620
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_actualizar_datos.rowcount() > 0 then 
	f_Print( dw_actualizar_datos )
end if
end event

type cb_cerrar from commandbutton within w_actualizar_datos_cliente
integer x = 3278
integer y = 1620
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualizar_datos_cliente)

end event

type cb_aceptar from commandbutton within w_actualizar_datos_cliente
integer x = 46
integer y = 1620
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_rut
Double	ll_numero
String	ls_ciudad

if isnull(il_row) or il_row=0 then
	il_row	= dw_actualizar_datos.getrow()
end if
if dw_actualizar_datos.rowcount()>0 and il_row>0 then
	ll_rut	= dw_actualizar_datos.getitemnumber(il_row,'rut')
	if ll_rut > 0 then
		if isvalid(w_detalle_datos_cliente) then close(w_detalle_datos_cliente)
		OpenWithParm(w_detalle_datos_cliente, string(ll_rut))
	end if
end if
end event

type em_fec_fin from editmask within w_actualizar_datos_cliente
integer x = 1093
integer y = 84
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_actualizar_datos.reset()

end event

type st_2 from statictext within w_actualizar_datos_cliente
integer x = 78
integer y = 92
integer width = 366
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_actualizar_datos_cliente
event ue_keypress pbm_keydown
integer x = 462
integer y = 84
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_actualizar_datos.reset()

end event

type p_ini from picture within w_actualizar_datos_cliente
integer x = 823
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_actualizar_datos.reset()
string ls_fecha,fech

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_actualizar_datos_cliente
integer x = 910
integer y = 92
integer width = 169
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_fin from picture within w_actualizar_datos_cliente
integer x = 1454
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_actualizar_datos.reset()
string ls_fecha,fech

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type pb_ok2 from picturebutton within w_actualizar_datos_cliente
event ue_mousemove pbm_mousemove
integer x = 3506
integer y = 44
integer width = 174
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime	ld_fec_ini,ld_fec_fin
Long		ll_corre,ll_tot_reg
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')
ld_fec_ini										= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin										= datetime(date(em_fec_fin.text),lt_fin)

if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			if rb_todos.checked=true then
				dw_actualizar_datos.dataobject	= 'dw_lista_datos_cliente_todos'
			elseif rb_pendientes.checked=true then
				dw_actualizar_datos.dataobject	= 'dw_lista_datos_cliente'
			elseif rb_gestionado.checked=true then
				dw_actualizar_datos.dataobject	= 'dw_lista_datos_cliente_gestionados'
			elseif rb_anulado.checked=true then
				dw_actualizar_datos.dataobject	= 'dw_lista_datos_cliente_anulado'
			end if
			dw_actualizar_datos.settransobject(sqlca)
			ll_tot_reg	= dw_actualizar_datos.retrieve(ld_fec_ini,ld_fec_fin)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
end if
end event

type dw_actualizar_datos from datawindow within w_actualizar_datos_cliente
integer x = 46
integer y = 232
integer width = 3634
integer height = 1328
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_datos_cliente_anulado"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row > 0 then 
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if	

end event

event clicked;String	ls_columna
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if dw_actualizar_datos.dataobject='dw_lista_datos_cliente_todos' then
		ls_columna	= dwo.name
		if ls_columna='t_blanco' or ls_columna='t_pendiente' then
			dw_actualizar_datos.SetFilter('estado_reg="P"')
			dw_actualizar_datos.Filter()
	
		elseif ls_columna='t_amarillo' or ls_columna='t_gestionado' then
			dw_actualizar_datos.SetFilter('estado_reg="G"')
			dw_actualizar_datos.Filter()
			
		elseif ls_columna='t_rojo' or ls_columna='t_anulado' then
			dw_actualizar_datos.SetFilter('estado_reg="A"')
			dw_actualizar_datos.Filter()
			
		elseif ls_columna='t_todo' then
			dw_actualizar_datos.SetFilter('')
			dw_actualizar_datos.Filter()
		end if
		if dw_actualizar_datos.rowcount()=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_actualizar_datos_cliente
integer x = 1641
integer y = 16
integer width = 1787
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

