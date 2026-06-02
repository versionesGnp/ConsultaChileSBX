forward
global type w_informe_gral_admin_reclamo from window
end type
type cb_limpiar from commandbutton within w_informe_gral_admin_reclamo
end type
type pb_por_usuario from picturebutton within w_informe_gral_admin_reclamo
end type
type dwe_usuario_asignado from datawindow within w_informe_gral_admin_reclamo
end type
type cb_exportar from commandbutton within w_informe_gral_admin_reclamo
end type
type cb_filtrar from commandbutton within w_informe_gral_admin_reclamo
end type
type cb_ordenar from commandbutton within w_informe_gral_admin_reclamo
end type
type pb_ok from picturebutton within w_informe_gral_admin_reclamo
end type
type p_fin from picture within w_informe_gral_admin_reclamo
end type
type em_fec_fin from editmask within w_informe_gral_admin_reclamo
end type
type st_3 from statictext within w_informe_gral_admin_reclamo
end type
type p_ini from picture within w_informe_gral_admin_reclamo
end type
type em_fec_ini from editmask within w_informe_gral_admin_reclamo
end type
type st_2 from statictext within w_informe_gral_admin_reclamo
end type
type dw_parque from datawindow within w_informe_gral_admin_reclamo
end type
type cb_cerrar from commandbutton within w_informe_gral_admin_reclamo
end type
type cb_imprimir from commandbutton within w_informe_gral_admin_reclamo
end type
type dw_lista from datawindow within w_informe_gral_admin_reclamo
end type
type gb_1 from groupbox within w_informe_gral_admin_reclamo
end type
end forward

global type w_informe_gral_admin_reclamo from window
integer width = 3630
integer height = 1980
boolean titlebar = true
string title = "Informe General"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_limpiar cb_limpiar
pb_por_usuario pb_por_usuario
dwe_usuario_asignado dwe_usuario_asignado
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
dw_parque dw_parque
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_gral_admin_reclamo w_informe_gral_admin_reclamo

on w_informe_gral_admin_reclamo.create
this.cb_limpiar=create cb_limpiar
this.pb_por_usuario=create pb_por_usuario
this.dwe_usuario_asignado=create dwe_usuario_asignado
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.dw_parque=create dw_parque
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_limpiar,&
this.pb_por_usuario,&
this.dwe_usuario_asignado,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.dw_parque,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1}
end on

on w_informe_gral_admin_reclamo.destroy
destroy(this.cb_limpiar)
destroy(this.pb_por_usuario)
destroy(this.dwe_usuario_asignado)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.dw_parque)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_new,ll_mes,ll_ano

gf_centrar(w_informe_gral_admin_reclamo)
//if gs_depto='P' or gs_depto='Q' then
	dw_lista.dataobject		= 'dw_informe_general_requerimiento_terre'
//else
//	dw_lista.dataobject		= 'dw_informe_general_requerimiento_terr2'
//end if
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
ll_new		= dw_parque.insertrow(0)
if gs_conexion = "Parque El Prado" then
	dw_parque.setitem(ll_new,'parque',1)
elseif gs_conexion	= "Parque La Foresta" then
	dw_parque.setitem(ll_new,'parque',11)
elseif gs_conexion	= "Parque Concepción" then
	dw_parque.setitem(ll_new,'parque',801)
end if
dwe_usuario_asignado.settransobject(sqlca)
dwe_usuario_asignado.getchild('usuario',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(gs_user)
dwe_usuario_asignado.insertrow(0)
ll_mes					= month(date(gdt_fec_sistema))
ll_ano						= year(date(gdt_fec_sistema))
em_fec_ini.text			= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
em_fec_fin.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
end event

type cb_limpiar from commandbutton within w_informe_gral_admin_reclamo
integer x = 1289
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
dwe_usuario_asignado.reset()
idw_detalle.retrieve(gs_user)
dwe_usuario_asignado.insertrow(0)
end event

type pb_por_usuario from picturebutton within w_informe_gral_admin_reclamo
integer x = 2766
integer y = 1720
integer width = 114
integer height = 104
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "reclamo_web.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_filtro,ls_codigo

ls_codigo			= dwe_usuario_asignado.getitemstring(1,'usuario')
if not isnull(ls_codigo) then
	ls_codigo		= "reclamo_solicitud_usuario_asignado = '"+TRIM(ls_codigo)+"'"
	dw_lista.SETfilter(ls_codigo)
	dw_lista.filter()
	if dw_lista.rowcount() = 0 then
		messagebox("Advertencia","No registra Dato")
	end if
end if
end event

type dwe_usuario_asignado from datawindow within w_informe_gral_admin_reclamo
integer x = 1755
integer y = 1736
integer width = 992
integer height = 92
integer taborder = 110
string title = "none"
string dataobject = "dwe_filtrar_usuario_asignado_reclamo"
boolean border = false
boolean livescroll = true
end type

type cb_exportar from commandbutton within w_informe_gral_admin_reclamo
event ue_mousemove pbm_mousemove
integer x = 1006
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 90
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

type cb_filtrar from commandbutton within w_informe_gral_admin_reclamo
event ue_mousemove pbm_mousemove
integer x = 722
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 80
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

type cb_ordenar from commandbutton within w_informe_gral_admin_reclamo
event ue_mousemove pbm_dwnmousemove
integer x = 489
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 70
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

type pb_ok from picturebutton within w_informe_gral_admin_reclamo
integer x = 2747
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
//				if dw_lista.dataobject	 = 'dw_informe_general_requerimiento_terre' then
					if dw_lista.retrieve(ll_cod_parque,ld_fec_ini,ld_fec_fin,gs_user) = 0 then
						messagebox("Advertencia","No Registra Dato")
						em_fec_fin.setfocus()
					end if
//				elseif 	dw_lista.dataobject = 'dw_informe_general_requerimiento_terr2' then
//					if dw_lista.retrieve(ll_cod_parque,ld_fec_ini,ld_fec_fin) = 0 then
//						messagebox("Advertencia","No Registra Dato")
//						em_fec_fin.setfocus()
//					end if
//				end if
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_informe_gral_admin_reclamo
integer x = 2560
integer y = 56
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

type em_fec_fin from editmask within w_informe_gral_admin_reclamo
integer x = 2199
integer y = 56
integer width = 357
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

type st_3 from statictext within w_informe_gral_admin_reclamo
integer x = 2007
integer y = 72
integer width = 160
integer height = 56
integer textsize = -8
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

type p_ini from picture within w_informe_gral_admin_reclamo
integer x = 1874
integer y = 56
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

type em_fec_ini from editmask within w_informe_gral_admin_reclamo
integer x = 1513
integer y = 56
integer width = 357
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

type st_2 from statictext within w_informe_gral_admin_reclamo
integer x = 992
integer y = 72
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 400
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

type dw_parque from datawindow within w_informe_gral_admin_reclamo
integer x = 46
integer y = 56
integer width = 887
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type cb_cerrar from commandbutton within w_informe_gral_admin_reclamo
integer x = 3237
integer y = 1732
integer width = 315
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_informe_gral_admin_reclamo)
end event

type cb_imprimir from commandbutton within w_informe_gral_admin_reclamo
integer x = 41
integer y = 1732
integer width = 315
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.t_todo.visible	= false
	f_Print( dw_lista )
	dw_lista.object.t_todo.visible	= true
end if
end event

type dw_lista from datawindow within w_informe_gral_admin_reclamo
integer x = 41
integer y = 212
integer width = 3506
integer height = 1484
integer taborder = 50
string title = "none"
string dataobject = "dw_informe_general_requerimiento_terre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna

ls_columna		= dwo.name
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
else
	if ls_columna='t_todo' then
		dw_lista.SETfilter('')
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type gb_1 from groupbox within w_informe_gral_admin_reclamo
event ue_mousemove pbm_mousemove
integer x = 466
integer y = 1692
integer width = 1074
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

