forward
global type w_producto_informe from window
end type
type cb_imprimir from commandbutton within w_producto_informe
end type
type dw_tipo from datawindow within w_producto_informe
end type
type dw_detalle from datawindow within w_producto_informe
end type
type cb_exportar from commandbutton within w_producto_informe
end type
type cb_ordenar from commandbutton within w_producto_informe
end type
type cb_filtrar from commandbutton within w_producto_informe
end type
type cb_cerrar from commandbutton within w_producto_informe
end type
type pb_aceptar from picturebutton within w_producto_informe
end type
type st_hasta from statictext within w_producto_informe
end type
type em_inicio from editmask within w_producto_informe
end type
type em_termino from editmask within w_producto_informe
end type
type st_desde from statictext within w_producto_informe
end type
type p_inicio from picture within w_producto_informe
end type
type p_termino from picture within w_producto_informe
end type
type gb_periodo from groupbox within w_producto_informe
end type
type gb_1 from groupbox within w_producto_informe
end type
type dw_lista from datawindow within w_producto_informe
end type
type gb_2 from groupbox within w_producto_informe
end type
end forward

global type w_producto_informe from window
integer width = 3090
integer height = 1908
boolean titlebar = true
string title = "Listado Registros Funeraria & Crematorio  Por Rango de Fechas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
dw_tipo dw_tipo
dw_detalle dw_detalle
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_inicio p_inicio
p_termino p_termino
gb_periodo gb_periodo
gb_1 gb_1
dw_lista dw_lista
gb_2 gb_2
end type
global w_producto_informe w_producto_informe

type variables
long il_row
end variables

on w_producto_informe.create
this.cb_imprimir=create cb_imprimir
this.dw_tipo=create dw_tipo
this.dw_detalle=create dw_detalle
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_inicio=create p_inicio
this.p_termino=create p_termino
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_imprimir,&
this.dw_tipo,&
this.dw_detalle,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.pb_aceptar,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_inicio,&
this.p_termino,&
this.gb_periodo,&
this.gb_1,&
this.dw_lista,&
this.gb_2}
end on

on w_producto_informe.destroy
destroy(this.cb_imprimir)
destroy(this.dw_tipo)
destroy(this.dw_detalle)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_inicio)
destroy(this.p_termino)
destroy(this.gb_periodo)
destroy(this.gb_1)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;datetime ldt_fec_fin,ldt_fec_ini

gf_centrar(w_producto_informe)

dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_tipo.settransobject(sqlca)
dw_tipo.insertrow(0)
em_termino.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fec_fin						= datetime(date(em_termino.text),time('00:00:00'))
em_inicio.text					= string('01/'+ string(month(date(gdt_fec_sistema)),'00')+ '/' +string(year(date(gdt_fec_sistema)),'0000'))
ldt_fec_ini						= datetime(date(em_inicio.text),time('00:00:00'))

end event

type cb_imprimir from commandbutton within w_producto_informe
integer x = 462
integer y = 1628
integer width = 462
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Resumen"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_tipo from datawindow within w_producto_informe
integer x = 1358
integer y = 80
integer width = 773
integer height = 104
integer taborder = 50
string title = "none"
string dataobject = "dwe_producto_informe"
boolean border = false
boolean livescroll = true
end type

type dw_detalle from datawindow within w_producto_informe
integer x = 46
integer y = 1912
integer width = 1371
integer height = 452
string title = "none"
string dataobject = "dw_producto_informe_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exportar from commandbutton within w_producto_informe
integer x = 1239
integer y = 1628
integer width = 219
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_ordenar from commandbutton within w_producto_informe
integer x = 1673
integer y = 1628
integer width = 219
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_filtrar from commandbutton within w_producto_informe
integer x = 1454
integer y = 1628
integer width = 219
integer height = 84
integer taborder = 100
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_cerrar from commandbutton within w_producto_informe
integer x = 2711
integer y = 1604
integer width = 306
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_producto_informe)
end event

type pb_aceptar from picturebutton within w_producto_informe
integer x = 2203
integer y = 72
integer width = 142
integer height = 116
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<"
string picturename = "ok.bmp"
end type

event clicked;long		ll_parque,ll_informe,ll_tot_reg,ll_tot_det
datetime	ld_fec_ini, ld_fec_fin
string		ls_usuario,ls_jefe_v

ld_fec_ini				= datetime(date(em_inicio.text),time('00:00:00'))
ld_fec_fin				= datetime(date(em_termino.text),time('23:59:59'))
ll_informe				= dw_tipo.getitemnumber(1,'tipo_informe')

if trim(em_inicio.text)='00/00/0000' or isnull(em_inicio.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_inicio.setfocus()
else
	if trim(em_termino.text)='00/00/0000' or isnull(em_termino.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_termino.setfocus()
	else
		ll_tot_det														= dw_detalle.retrieve(ld_fec_ini,ld_fec_fin)
		if ll_tot_det = 0 then
			messagebox("Advertencia","No Registra Servicios Funerarios & Crematorio para las Fecha Seleccionadas")
		else
			if ll_informe=1 then
				dw_lista.dataobject								= 'dw_producto_informe'
				dw_lista.settransobject(sqlca)
				ll_tot_reg											= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
				if ll_tot_reg>0 then
					dw_lista.object.usuario.text					= gs_user
					dw_lista.object.t_titulo.text					= 'Informe Servicios Funerarios & Crematorio (Total por Fechas)'
				end if
			elseif ll_informe=2 then
				dw_lista.dataobject								= 'dw_producto_informe_age'
				dw_lista.settransobject(sqlca)
				ll_tot_reg											= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
				if ll_tot_reg>0 then
					dw_lista.object.usuario.text					= gs_user
					dw_lista.object.t_titulo.text					= 'Informe Servicios Funerarios & Crematorio (Agente de Ventas)'
				end if	
				
			elseif ll_informe=3 then
				dw_lista.dataobject								= 'dw_producto_informe_serv'
				dw_lista.settransobject(sqlca)
				ll_tot_reg											= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
				if ll_tot_reg>0 then
					dw_lista.object.usuario.text					= gs_user
					dw_lista.object.t_titulo.text					= 'Informe Servicios Funerarios & Crematorio (Estado Activación Servicio)'
				end if		
			
			elseif ll_informe=4 then
				dw_lista.dataobject								= 'dw_producto_informe_parq'
				dw_lista.settransobject(sqlca)
				ll_tot_reg											= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
				if ll_tot_reg>0 then
					dw_lista.object.usuario.text					= gs_user
					dw_lista.object.t_titulo.text					= 'Informe Servicios Funerarios & Crematorio (Parque Contrato)'
				end if
				
			elseif ll_informe=5 then
				dw_lista.dataobject								= 'dw_producto_informe_uso'
				dw_lista.settransobject(sqlca)
				ll_tot_reg											= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
				if ll_tot_reg>0 then
					dw_lista.object.usuario.text					= gs_user
					dw_lista.object.t_titulo.text					= 'Informe Servicios Funerarios & Crematorio (Uso Servicio)'
				end if		
				
			end if
		end if
	end if
end if


end event

type st_hasta from statictext within w_producto_informe
integer x = 677
integer y = 92
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_producto_informe
integer x = 238
integer y = 84
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_termino from editmask within w_producto_informe
integer x = 841
integer y = 84
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_desde from statictext within w_producto_informe
integer x = 50
integer y = 92
integer width = 187
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type p_inicio from picture within w_producto_informe
integer x = 585
integer y = 80
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_termino from picture within w_producto_informe
integer x = 1193
integer y = 80
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_lista.reset()
end event

type gb_periodo from groupbox within w_producto_informe
integer x = 1344
integer y = 16
integer width = 814
integer height = 180
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Tipo Informe"
end type

type gb_1 from groupbox within w_producto_informe
integer x = 434
integer y = 1580
integer width = 1481
integer height = 160
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type dw_lista from datawindow within w_producto_informe
integer x = 41
integer y = 220
integer width = 2985
integer height = 1364
integer taborder = 70
string title = "none"
string dataobject = "dw_producto_informe_uso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//string ls_columna
//
//ls_columna					= dwo.name
//if getrow() > 0 then
//	il_row					= getrow()
//	This.SelectRow(0, FALSE)
//	This.SelectRow(il_row, TRUE)
//	if ls_columna='t_verde' or ls_columna='t_texto_verde' then
//		gs_formula			= "sw_activa_servicio=0"
//		dw_lista.SETfilter(gs_formula)
//		dw_lista.filter()
//		dw_lista.sort()
//	elseif ls_columna = 't_blanco' or ls_columna='t_texto_blanco' then	
//		gs_formula			= "sw_activa_servicio=1"
//		dw_lista.SETfilter(gs_formula)
//		dw_lista.filter()
//		dw_lista.sort()
//	elseif ls_columna = 't_amarillo' or ls_columna='t_texto_amarillo' then	
//		gs_formula			= "sw_activa_servicio=2"
//		dw_lista.SETfilter(gs_formula)
//		dw_lista.filter()
//		dw_lista.sort()	
//	elseif ls_columna = 't_todo' then
//		gs_formula			= ''
//		dw_lista.SETfilter(gs_formula)
//		dw_lista.filter()
//		dw_lista.sort()
//	end if	
//end if	
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	il_row		= getrow()
end if
end event

type gb_2 from groupbox within w_producto_informe
integer x = 37
integer y = 16
integer width = 1266
integer height = 180
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

