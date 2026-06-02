forward
global type w_listas_generadas_cartas from window
end type
type cb_detalle from commandbutton within w_listas_generadas_cartas
end type
type cb_cerrar from commandbutton within w_listas_generadas_cartas
end type
type cb_ordenar from commandbutton within w_listas_generadas_cartas
end type
type cb_filtrar from commandbutton within w_listas_generadas_cartas
end type
type cb_exportar from commandbutton within w_listas_generadas_cartas
end type
type cb_imprimir from commandbutton within w_listas_generadas_cartas
end type
type st_procesar from statictext within w_listas_generadas_cartas
end type
type pb_aceptar from picturebutton within w_listas_generadas_cartas
end type
type p_fin from picture within w_listas_generadas_cartas
end type
type em_fec_fin from editmask within w_listas_generadas_cartas
end type
type p_ini from picture within w_listas_generadas_cartas
end type
type st_2 from statictext within w_listas_generadas_cartas
end type
type em_fec_ini from editmask within w_listas_generadas_cartas
end type
type st_1 from statictext within w_listas_generadas_cartas
end type
type dw_lista from datawindow within w_listas_generadas_cartas
end type
type gb_1 from groupbox within w_listas_generadas_cartas
end type
end forward

global type w_listas_generadas_cartas from window
integer width = 2779
integer height = 1808
boolean titlebar = true
string title = "Listas Generadas para Gestión Envio Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_detalle cb_detalle
cb_cerrar cb_cerrar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
st_procesar st_procesar
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
p_ini p_ini
st_2 st_2
em_fec_ini em_fec_ini
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_listas_generadas_cartas w_listas_generadas_cartas

type variables
long	il_row
end variables

on w_listas_generadas_cartas.create
this.cb_detalle=create cb_detalle
this.cb_cerrar=create cb_cerrar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.st_procesar=create st_procesar
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.p_ini=create p_ini
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_detalle,&
this.cb_cerrar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.st_procesar,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.p_ini,&
this.st_2,&
this.em_fec_ini,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_listas_generadas_cartas.destroy
destroy(this.cb_detalle)
destroy(this.cb_cerrar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.st_procesar)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.p_ini)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event mousemove;st_procesar.visible			= false

end event

event open;datetime	ld_fec_ini, ld_fec_fin
time		lt_hora_ini,lt_hora_fin

SetPointer(HourGlass!)
lt_hora_ini				= time('00:00:00')
lt_hora_fin				= time('23:59:59')
gf_centrar(w_listas_generadas_cartas)
dw_lista.settransobject(sqlca)
em_fec_ini.text		= string(today())
em_fec_fin.text		= string(today())
ld_fec_ini				= datetime(date(em_fec_ini.text),lt_hora_ini)
ld_fec_fin				= datetime(date(em_fec_fin.text),lt_hora_fin)
if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)>0 then
	dw_lista.object.t_fecha.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
end if
em_fec_ini.setfocus()
dw_lista.accepttext()
SetPointer(Arrow!)
end event

type cb_detalle from commandbutton within w_listas_generadas_cartas
integer x = 1221
integer y = 1576
integer width = 471
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Envio Carta"
end type

event clicked;string	ls_string,ls_usuario
long		ll_codigo

if dw_lista.getrow()>0 then
	il_row		= dw_lista.getrow()
	ll_codigo	= dw_lista.getitemnumber(il_row,'gc_lista_gestion_codigo_grupo')
	ls_usuario	= dw_lista.getitemstring(il_row,'gc_lista_gestion_usuario_creador')
	ls_string	= string(ll_codigo)+'~t'+ls_usuario
	if isvalid(w_detalle_lista_generada_gestion_carta) then close(w_detalle_lista_generada_gestion_carta)
	OpenWithParm(w_detalle_lista_generada_gestion_carta, ls_string)
end if
end event

type cb_cerrar from commandbutton within w_listas_generadas_cartas
integer x = 2373
integer y = 1576
integer width = 343
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listas_generadas_cartas)
end event

type cb_ordenar from commandbutton within w_listas_generadas_cartas
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 50
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

type cb_filtrar from commandbutton within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 60
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
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_exportar from commandbutton within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 70
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

type cb_imprimir from commandbutton within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 80
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

type st_procesar from statictext within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1710
integer y = 148
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31457278
string text = "Procesar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible			= false

end event

type pb_aceptar from picturebutton within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 1755
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event ue_mousemove;st_procesar.visible			= true
end event

event clicked;datetime	ld_fec_ini, ld_fec_fin
time		lt_hora_ini,lt_hora_fin

lt_hora_ini	= time('00:00:00')
lt_hora_fin	= time('23:59:59')
ld_fec_ini	= datetime(date(em_fec_ini.text),lt_hora_ini)
ld_fec_fin	= datetime(date(em_fec_fin.text),lt_hora_fin)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
			messagebox("Advertencia","No registra dato")
		else
			dw_lista.object.t_fecha.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		end if		
	end if
end if
end event

type p_fin from picture within w_listas_generadas_cartas
integer x = 1614
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		dw_lista.reset()
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_listas_generadas_cartas
integer x = 1262
integer y = 40
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;if trim(em_fec_fin.text)<>'00/00/0000' or not isnull(em_fec_fin.text) then dw_lista.reset()
end event

type p_ini from picture within w_listas_generadas_cartas
integer x = 969
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

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
		dw_lista.reset()
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type st_2 from statictext within w_listas_generadas_cartas
integer x = 1079
integer y = 52
integer width = 160
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_listas_generadas_cartas
integer x = 617
integer y = 40
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_listas_generadas_cartas
integer x = 50
integer y = 52
integer width = 567
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha    desde:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 172
integer width = 2674
integer height = 1348
integer taborder = 40
string dataobject = "dw_lista_generadas_cobranza_envio_carta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_procesar.visible			= false

end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;string	ls_string
long		ll_codigo

if row>0 then cb_detalle.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_listas_generadas_cartas
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1528
integer width = 1088
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

