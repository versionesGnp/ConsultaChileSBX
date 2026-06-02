forward
global type w_ver_todos_reclamos from window
end type
type cb_reasignar from commandbutton within w_ver_todos_reclamos
end type
type pb_filtrar_usuario from picturebutton within w_ver_todos_reclamos
end type
type dw_usuario from datawindow within w_ver_todos_reclamos
end type
type st_1 from statictext within w_ver_todos_reclamos
end type
type pb_buscar from picturebutton within w_ver_todos_reclamos
end type
type em_ctto from editmask within w_ver_todos_reclamos
end type
type st_busqueda from statictext within w_ver_todos_reclamos
end type
type dwe_ticket from datawindow within w_ver_todos_reclamos
end type
type cb_fallecido from commandbutton within w_ver_todos_reclamos
end type
type cb_detalle_gestion from commandbutton within w_ver_todos_reclamos
end type
type cb_5 from commandbutton within w_ver_todos_reclamos
end type
type cb_cerrar from commandbutton within w_ver_todos_reclamos
end type
type cb_imprimir from commandbutton within w_ver_todos_reclamos
end type
type cb_exportar from commandbutton within w_ver_todos_reclamos
end type
type cb_filtrar from commandbutton within w_ver_todos_reclamos
end type
type cb_ordenar from commandbutton within w_ver_todos_reclamos
end type
type dw_lista from datawindow within w_ver_todos_reclamos
end type
type pb_ok from picturebutton within w_ver_todos_reclamos
end type
type p_fin from picture within w_ver_todos_reclamos
end type
type em_fec_fin from editmask within w_ver_todos_reclamos
end type
type st_3 from statictext within w_ver_todos_reclamos
end type
type p_ini from picture within w_ver_todos_reclamos
end type
type em_fec_ini from editmask within w_ver_todos_reclamos
end type
type st_2 from statictext within w_ver_todos_reclamos
end type
type dw_parque from datawindow within w_ver_todos_reclamos
end type
type gb_1 from groupbox within w_ver_todos_reclamos
end type
type cb_ticket from commandbutton within w_ver_todos_reclamos
end type
type cb_obs from commandbutton within w_ver_todos_reclamos
end type
end forward

global type w_ver_todos_reclamos from window
integer width = 4215
integer height = 1964
boolean titlebar = true
string title = "Ver Requerimientos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_reasignar cb_reasignar
pb_filtrar_usuario pb_filtrar_usuario
dw_usuario dw_usuario
st_1 st_1
pb_buscar pb_buscar
em_ctto em_ctto
st_busqueda st_busqueda
dwe_ticket dwe_ticket
cb_fallecido cb_fallecido
cb_detalle_gestion cb_detalle_gestion
cb_5 cb_5
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_lista dw_lista
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
dw_parque dw_parque
gb_1 gb_1
cb_ticket cb_ticket
cb_obs cb_obs
end type
global w_ver_todos_reclamos w_ver_todos_reclamos

event open;Long		ll_mes,ll_ano,ll_cod_parque

gf_centrar(w_ver_todos_reclamos)
dw_lista.settransobject(sqlca)
dwe_ticket.settransobject(sqlca)
dw_parque.dataobject 				= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_usuario.settransobject(sqlca)
dw_usuario.insertrow(0)
SELECT 	"ENCARGADOS"."COD_PARQUE"  
INTO 		:ll_cod_parque  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
if ll_cod_parque <> 9999 then
	if isvalid(w_ingreso_reclamo) then
		ll_cod_parque					= w_ingreso_reclamo.dw_ingreso.getitemnumber(1,'cod_parque')
	else
		if gs_conexion	= "Parque El Prado" then
			ll_cod_parque				= 1
		elseif gs_conexion	= "Parque La Foresta" then
			ll_cod_parque				= 11
		elseif gs_conexion	= "Parque Concepción" then
			ll_cod_parque				= 801
		end if
	end if
end if
if gs_depto='P' or gs_depto='I' then 
	cb_obs.visible 						= true
else
	cb_obs.visible						= false
end if
dw_parque.setitem(1,'parque',ll_cod_parque)
dw_parque.accepttext()
ll_mes									= month(date(gdt_fec_sistema))
ll_ano										= year(date(gdt_fec_sistema))
em_fec_ini.text							= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
em_fec_fin.text							= string(gdt_fec_sistema,'dd/mm/yyyy')
pb_ok.triggerevent(clicked!)
end event

on w_ver_todos_reclamos.create
this.cb_reasignar=create cb_reasignar
this.pb_filtrar_usuario=create pb_filtrar_usuario
this.dw_usuario=create dw_usuario
this.st_1=create st_1
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_busqueda=create st_busqueda
this.dwe_ticket=create dwe_ticket
this.cb_fallecido=create cb_fallecido
this.cb_detalle_gestion=create cb_detalle_gestion
this.cb_5=create cb_5
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_lista=create dw_lista
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.dw_parque=create dw_parque
this.gb_1=create gb_1
this.cb_ticket=create cb_ticket
this.cb_obs=create cb_obs
this.Control[]={this.cb_reasignar,&
this.pb_filtrar_usuario,&
this.dw_usuario,&
this.st_1,&
this.pb_buscar,&
this.em_ctto,&
this.st_busqueda,&
this.dwe_ticket,&
this.cb_fallecido,&
this.cb_detalle_gestion,&
this.cb_5,&
this.cb_cerrar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_lista,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.dw_parque,&
this.gb_1,&
this.cb_ticket,&
this.cb_obs}
end on

on w_ver_todos_reclamos.destroy
destroy(this.cb_reasignar)
destroy(this.pb_filtrar_usuario)
destroy(this.dw_usuario)
destroy(this.st_1)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_busqueda)
destroy(this.dwe_ticket)
destroy(this.cb_fallecido)
destroy(this.cb_detalle_gestion)
destroy(this.cb_5)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_lista)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.dw_parque)
destroy(this.gb_1)
destroy(this.cb_ticket)
destroy(this.cb_obs)
end on

type cb_reasignar from commandbutton within w_ver_todos_reclamos
integer x = 1307
integer y = 1748
integer width = 466
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reasignar Ticket"
end type

event clicked;Long		ll_fila,ll_folio,ll_cod_gestion

if dw_lista.rowcount() > 0 then
	ll_fila					= dw_lista.getrow()
	ll_folio				= dw_lista.getitemnumber(ll_fila,'numero_reclamo')
	ll_cod_gestion		= dw_lista.getitemnumber(ll_fila,'ult_estado_gestion')
	if (ll_folio > 0 and (ll_cod_gestion = 5 or ll_cod_gestion = 3)) then
		if isvalid(w_ingreso_observacion_termino) then close(w_ingreso_observacion_termino)
		OpenWithParm(w_ingreso_observacion_termino, string(ll_folio)+'~t'+string(ll_cod_gestion))
	else
		messagebox("Advertencia","Recuerde Ultimo Estado Gestión debe estar Codigo 5 o 3")
	end if
end if
end event

type pb_filtrar_usuario from picturebutton within w_ver_todos_reclamos
integer x = 3776
integer y = 1752
integer width = 101
integer height = 88
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
end type

event clicked;string		ls_string,ls_usuario

ls_usuario					= dw_usuario.getitemstring(1,'usuario')
if not isnull(ls_usuario) then
	ls_string					= "usuario_asignado = '"+ls_usuario+"'"
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	if dw_lista.rowcount() = 0 then
		messagebox("Advertencia","No Registra Dato Usuario Asignado "+ls_usuario)
	end if
end if
end event

type dw_usuario from datawindow within w_ver_todos_reclamos
integer x = 3086
integer y = 1752
integer width = 699
integer height = 100
integer taborder = 180
string title = "none"
string dataobject = "dwe_lista_encargado_reclamo"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_ver_todos_reclamos
integer x = 2752
integer y = 1764
integer width = 320
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_ver_todos_reclamos
integer x = 2642
integer y = 1752
integer width = 101
integer height = 88
integer taborder = 170
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
Double	ll_numero
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_numero					= Double(em_ctto.text)
	if ll_numero > 0 then
		ls_string					= "numero_reclamo = "+string(ll_numero)
		ll_fila 						= dw_lista.find(ls_string, 1, ll_tot_reg)
		if ll_fila>0 then
			dw_lista.scrolltorow(ll_fila)
			dw_lista.SelectRow(ll_fila, true)
		else
			messagebox("Advertencia","Nº Requerimiento No Existe en Lista")
			dw_lista.scrolltorow(1)
		end if
	end if
end if
end event

type em_ctto from editmask within w_ver_todos_reclamos
integer x = 2309
integer y = 1752
integer width = 329
integer height = 92
integer taborder = 160
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

event modified;if Double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_busqueda from statictext within w_ver_todos_reclamos
integer x = 1915
integer y = 1768
integer width = 384
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Requerimiento"
alignment alignment = right!
boolean focusrectangle = false
end type

type dwe_ticket from datawindow within w_ver_todos_reclamos
boolean visible = false
integer x = 1957
integer y = 1856
integer width = 741
integer height = 484
string title = "none"
string dataobject = "dwe_imprimir_ticket"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_fallecido from commandbutton within w_ver_todos_reclamos
integer x = 315
integer y = 1748
integer width = 334
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Por Fallecido"
end type

event clicked;Long		ll_cod_parque,ll_fila
String		ls_cod_sol

if dw_lista.rowcount() > 0 then
	ll_fila					= dw_lista.getrow()
	ll_cod_parque		= dw_lista.getitemnumber(ll_fila,'cod_parque')
	ls_cod_sol			= dw_lista.getitemstring(ll_fila,'codigo_solicitud')
	if ll_cod_parque > 0 and not isnull(ls_cod_sol) then
		if isvalid(w_opcion_buscar_por_fallecido_requerimientos) then close(w_opcion_buscar_por_fallecido_requerimientos)
		open(w_opcion_buscar_por_fallecido_requerimientos)
	end if
end if
end event

type cb_detalle_gestion from commandbutton within w_ver_todos_reclamos
integer x = 32
integer y = 1748
integer width = 283
integer height = 96
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver &Detalle"
end type

event clicked;string	ls_string,ls_cod_solic
long	ll_num_reclamo,ll_fila

if dw_lista.rowcount() > 0 then
	ll_fila									= dw_lista.getrow()
	if ll_fila > 0 then
		ll_num_reclamo				= dw_lista.getitemnumber(ll_fila,'numero_reclamo')
		ls_cod_solic						= dw_lista.getitemstring(ll_fila,'codigo_solicitud')
		if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
			ls_string						= string(ll_num_reclamo)+'~t'+ls_cod_solic
			if isvalid(w_detalle_gestion) then close(w_detalle_gestion)
			OpenWithParm (w_detalle_gestion,ls_string)
		end if
	end if
end if
end event

type cb_5 from commandbutton within w_ver_todos_reclamos
integer x = 3003
integer y = 72
integer width = 229
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta Cte"
end type

event clicked;Long		ll_fila
String	ls_ctto

Setnull(gs_base);Setnull(gs_serie);Setnull(gi_numero)
ll_fila				= dw_lista.getrow()
if ll_fila>0 and dw_lista.rowcount()>0 then
	gi_numero	= dw_lista.getitemnumber(ll_fila,'numero')
	gs_serie		= dw_lista.getitemstring(ll_fila,'serie')
	gs_base		= dw_lista.getitemstring(ll_fila,'base')
	if ll_fila > 0 and not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
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
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_ver_todos_reclamos
integer x = 3931
integer y = 1748
integer width = 233
integer height = 96
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ver_todos_reclamos)
end event

type cb_imprimir from commandbutton within w_ver_todos_reclamos
event ue_mousemove pbm_mousemove
integer x = 3913
integer y = 72
integer width = 229
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_ver_todos_reclamos
event ue_mousemove pbm_mousemove
integer x = 3680
integer y = 72
integer width = 229
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_ver_todos_reclamos
event ue_mousemove pbm_mousemove
integer x = 3470
integer y = 72
integer width = 206
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string 	ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_ver_todos_reclamos
event ue_mousemove pbm_dwnmousemove
integer x = 3237
integer y = 72
integer width = 229
integer height = 80
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

type dw_lista from datawindow within w_ver_todos_reclamos
integer x = 32
integer y = 208
integer width = 4137
integer height = 1476
integer taborder = 100
string title = "none"
string dataobject = "dw_lista_buscar_reclamos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna,ls_texto
Long		ll_cod_gestion

ls_columna	= dwo.name
if row > 0 then
	ll_cod_gestion		= dw_lista.getitemnumber(row,'ult_estado_gestion')
	if ll_cod_gestion=10 or gs_depto='I' then
		cb_obs.enabled	= true
	else
		cb_obs.enabled	= false
	end if
	This.SelectRow(0, false)
	This.SelectRow(row, true)
else
	if ls_columna='t_todo' then
		dw_lista.SETfilter('')
		dw_lista.filter()
		em_ctto.text		= ''
		dw_usuario.reset()
		dw_usuario.insertrow(0)
	elseif ls_columna='t_10_reclamo' then
		ls_texto			= "ult_estado_gestion =10 AND  reclamo_solicitud_tipo_solicitud ='R'"
		dw_lista.SETfilter(ls_texto)
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;Long		ll_cod_gestion

if getrow() > 0 then
	ll_cod_gestion		= dw_lista.getitemnumber(getrow(),'ult_estado_gestion')
	if ll_cod_gestion=10 or gs_depto='I' then
		cb_obs.enabled	= true
	else
		cb_obs.enabled	= false
	end if
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type pb_ok from picturebutton within w_ver_todos_reclamos
integer x = 2414
integer y = 24
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Long		ll_cod_parque
Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

SetPointer(HourGlass!)
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
em_ctto.text						= ''
if isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe seleccionar Parque")
	dw_parque.setfocus()
else
	ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
	ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
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
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque)=0 then
					messagebox("Advertencia","No Registra Dato")
					em_fec_fin.setfocus()
				end if
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_ver_todos_reclamos
integer x = 2295
integer y = 68
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
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

type em_fec_fin from editmask within w_ver_todos_reclamos
integer x = 1952
integer y = 68
integer width = 334
integer height = 88
integer taborder = 30
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_ver_todos_reclamos
integer x = 1769
integer y = 84
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
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

type p_ini from picture within w_ver_todos_reclamos
integer x = 1691
integer y = 68
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
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

type em_fec_ini from editmask within w_ver_todos_reclamos
integer x = 1349
integer y = 68
integer width = 334
integer height = 88
integer taborder = 20
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_ver_todos_reclamos
integer x = 837
integer y = 84
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_ver_todos_reclamos
integer x = 46
integer y = 68
integer width = 777
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type gb_1 from groupbox within w_ver_todos_reclamos
event ue_mousemove pbm_mousemove
integer x = 2976
integer y = 24
integer width = 1193
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_ticket from commandbutton within w_ver_todos_reclamos
integer x = 649
integer y = 1748
integer width = 325
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print TICKET"
end type

event clicked;Long		ll_fila,ll_folio,ll_dia_fec,ll_mes_fec,ll_anno_fec,ll_new,ll_cod_reclamo
date		ld_fec_prox
String		ls_nom_contacto,ls_ap_pat_contacto,ls_ap_mat_contacto,ls_nombre,ls_fecha,ls_fec_comp,ls_descrip,ls_titulo,ls_descrip_reclamo,&
			ls_nom_encargado,ls_descrip_depto,ls_glosa_original

if dw_lista.rowcount() > 0 then
	SetPointer(HourGlass!)
	ll_fila					= dw_lista.getrow()
	ll_folio				= dw_lista.getitemnumber(ll_fila,'numero_reclamo')
	if ll_folio > 0 then
		dwe_ticket.reset()
		ll_new			= dwe_ticket.insertrow(0)
		SELECT	"RECLAMO_SOLICITUD"."NOMBRE_CONTACTO",   
					"RECLAMO_SOLICITUD"."A_PATERNO_CONTACTO",   
					"RECLAMO_SOLICITUD"."A_MATERNO_CONTACTO",
					"RECLAMO_SOLICITUD"."CODIGO_RECLAMO",
					"RECLAMO_SOLICITUD"."GLOSA_RECLAMO_ORIGINAL"
		INTO 		:ls_nom_contacto,   
					:ls_ap_pat_contacto,   
					:ls_ap_mat_contacto,
					:ll_cod_reclamo,
					:ls_glosa_original
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE 	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :ll_folio  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ls_nom_contacto) 		then ls_nom_contacto='-'
			if isnull(ls_ap_pat_contacto) 	then ls_ap_pat_contacto='-'
			if isnull(ls_ap_mat_contacto) 	then ls_ap_mat_contacto='-'
		end if
		ls_nombre									= ls_nom_contacto+' '+ls_ap_pat_contacto+' '+ls_ap_mat_contacto
		
		ld_fec_prox				 					= date( dw_lista.getitemdatetime(ll_fila,'fecha_crea'))
		ll_dia_fec									= day(ld_fec_prox)
		ll_mes_fec									= month(ld_fec_prox)
		ll_anno_fec									= year(ld_fec_prox)
		CHOOSE CASE UPPER(DayName(ld_fec_prox))
			CASE 'LUNES','MONDAY'
				ls_fecha								= 'LUNES'
			CASE 'MARTES','TUESDAY'
				ls_fecha								= 'MARTES'
			CASE 'MIERCOLES','WEDNESDAY'
				ls_fecha								= 'MIERCOLES'
			CASE 'JUEVES','THURSDAY'
				ls_fecha								= 'JUEVES'
			CASE 'VIERNES','FRIDAY'
				ls_fecha								= 'VIERNES'
			CASE 'SABADO','SATURDAY'
				ls_fecha								= 'SABADO'
			CASE 'DOMINGO','SUNDAY'
				ls_fecha								= 'DOMINGO'
		END CHOOSE
		ls_fec_comp									= trim(ls_fecha)
		
		if ll_mes_fec=1 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE ENERO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=2 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE FEBRERO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=3 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE MARZO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=4 then	
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE ABRIL DE '+string(ll_anno_fec)
		elseif ll_mes_fec=5 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE MAYO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=6 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE JUNIO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=7 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE JULIO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=8 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE AGOSTO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=9 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE SEPTIEMBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=10 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE OCTUBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=11 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE NOVIEMBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=12 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE DICIEMBRE DE '+string(ll_anno_fec)
		end if
		dwe_ticket.setitem( ll_new,'fecha',ls_fec_comp)
		dwe_ticket.object.t_folio.text			= 'FOLIO SOLICITUD   '+string(ll_folio,'###,###,###,###,##0')
		ls_titulo										= 'ESTIMADO(A)  '+ls_nombre
		dwe_ticket.setitem( ll_new, 'titulo', ls_titulo )

		ls_descrip									= '	LE INFORMAMOS QUE HOY '+ls_fec_comp+' HEMOS RECEPCIONADO SU REQUERIMIENTO Y HA SIDO INGRESADO EN NUESTRO SISTEMA DE CONTROL DE SOLICITUDES CON FOLIO N° '+string(ll_folio,'###,###,##0')+', CON EL SIGUIENTE DETALLE.'
		dwe_ticket.setitem( ll_new,'descripcion',ls_descrip)
		
		SELECT		"RECLAMO_CODIGO_RECLAMO"."DESCRIPCION"  
		INTO 			:ls_descrip_reclamo
		FROM 		"RECLAMO_CODIGO_RECLAMO"  
		WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_cod_reclamo  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dwe_ticket.setitem( ll_new,'folio',ls_descrip_reclamo+  ' - REQUERIMIENTO ORIGINAL:  '+ls_glosa_original)
		end if
		
		SELECT		"ENCARGADOS"."NOMBRE",   
						"CODIGO_DEPTO"."DESCRIPCION"  
		INTO			:ls_nom_encargado,
						:ls_descrip_depto
		FROM 		"CODIGO_DEPTO",   
						"ENCARGADOS"  
		WHERE 	   ( "CODIGO_DEPTO"."CODIGO" = "ENCARGADOS"."DEPTO" ) and  
					   (("ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dwe_ticket.setitem( ll_new,'atendido_por',ls_nom_encargado)
			dwe_ticket.setitem( ll_new,'departamento',ls_descrip_depto)
		end if
		if dwe_ticket.rowcount() > 0 then f_Print( dwe_ticket )
	end if
	SetPointer(Arrow!)
end if
end event

type cb_obs from commandbutton within w_ver_todos_reclamos
integer x = 974
integer y = 1748
integer width = 334
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Observación"
end type

event clicked;Long		ll_fila,ll_folio,ll_cod_gestion

if dw_lista.rowcount() > 0 then
	ll_fila					= dw_lista.getrow()
	ll_folio				= dw_lista.getitemnumber(ll_fila,'numero_reclamo')
	ll_cod_gestion		= dw_lista.getitemnumber(ll_fila,'ult_estado_gestion')
	if (ll_folio > 0 and ll_cod_gestion>=10) then
		if isvalid(w_ingreso_observacion_termino) then close(w_ingreso_observacion_termino)
		OpenWithParm(w_ingreso_observacion_termino, string(ll_folio)+'~t'+string(ll_cod_gestion))
	end if
end if

end event

