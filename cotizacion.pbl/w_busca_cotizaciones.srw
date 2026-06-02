forward
global type w_busca_cotizaciones from window
end type
type cb_4 from commandbutton within w_busca_cotizaciones
end type
type cb_3 from commandbutton within w_busca_cotizaciones
end type
type cb_2 from commandbutton within w_busca_cotizaciones
end type
type cb_exportar from commandbutton within w_busca_cotizaciones
end type
type pb_ok from picturebutton within w_busca_cotizaciones
end type
type em_fec_fin from editmask within w_busca_cotizaciones
end type
type st_16 from statictext within w_busca_cotizaciones
end type
type dw_parque from datawindow within w_busca_cotizaciones
end type
type st_2 from statictext within w_busca_cotizaciones
end type
type em_fec_ini from editmask within w_busca_cotizaciones
end type
type p_ini from picture within w_busca_cotizaciones
end type
type st_3 from statictext within w_busca_cotizaciones
end type
type p_fin from picture within w_busca_cotizaciones
end type
type cb_cerrar from commandbutton within w_busca_cotizaciones
end type
type cb_aceptar from commandbutton within w_busca_cotizaciones
end type
type dw_lista from datawindow within w_busca_cotizaciones
end type
type gb_2 from groupbox within w_busca_cotizaciones
end type
end forward

global type w_busca_cotizaciones from window
integer width = 4247
integer height = 2320
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
pb_ok pb_ok
em_fec_fin em_fec_fin
st_16 st_16
dw_parque dw_parque
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_2 gb_2
end type
global w_busca_cotizaciones w_busca_cotizaciones

on w_busca_cotizaciones.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_16=create st_16
this.dw_parque=create dw_parque
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.pb_ok,&
this.em_fec_fin,&
this.st_16,&
this.dw_parque,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_2}
end on

on w_busca_cotizaciones.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;
em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')

gf_centrar(w_busca_cotizaciones)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(1,'cod_parque',801)
end if
end event

type cb_4 from commandbutton within w_busca_cotizaciones
integer x = 2597
integer y = 2028
integer width = 229
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 73
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= False
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_3 from commandbutton within w_busca_cotizaciones
integer x = 2386
integer y = 2028
integer width = 206
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_busca_cotizaciones
integer x = 2139
integer y = 2028
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_exportar from commandbutton within w_busca_cotizaciones
integer x = 1893
integer y = 2028
integer width = 242
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type pb_ok from picturebutton within w_busca_cotizaciones
integer x = 2670
integer y = 28
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
end type

event clicked;datetime	ld_fec_ini,ld_fec_fin
Long		ll_cod_parque,ll_tot_reg
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')
ld_fec_ini													= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin													= datetime(date(em_fec_fin.text),lt_fin)

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
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
				ll_tot_reg	= dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque,gs_user)
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Dato")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_parque.setfocus()
			end if
		end if
	end if
end if
end event

type em_fec_fin from editmask within w_busca_cotizaciones
integer x = 1280
integer y = 56
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

type st_16 from statictext within w_busca_cotizaciones
integer x = 1787
integer y = 64
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_busca_cotizaciones
integer x = 2021
integer y = 56
integer width = 594
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_busca_cotizaciones
integer x = 41
integer y = 64
integer width = 544
integer height = 72
integer textsize = -10
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

type em_fec_ini from editmask within w_busca_cotizaciones
integer x = 617
integer y = 56
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

type p_ini from picture within w_busca_cotizaciones
integer x = 978
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

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

type st_3 from statictext within w_busca_cotizaciones
integer x = 1088
integer y = 64
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

type p_fin from picture within w_busca_cotizaciones
integer x = 1641
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

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

type cb_cerrar from commandbutton within w_busca_cotizaciones
integer x = 3753
integer y = 2004
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_busca_cotizaciones)
end event

type cb_aceptar from commandbutton within w_busca_cotizaciones
integer x = 41
integer y = 2004
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_corr,ll_fila,ll_cod_parque,ll_capacidad
String	ls_sector,ls_tipo_sep
datawindowchild	idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9
if dw_lista.rowcount() > 0 then
	ll_fila												= dw_lista.getrow()
	if ll_fila > 0 then
		ll_corr											= dw_lista.getitemnumber(ll_fila,'correlativo_interno')
		if w_cotizaciones.dw_ingreso_cotizacion.retrieve(ll_corr)>0 then
			w_cotizaciones.cb_imprimir.enabled	= true
			ll_cod_parque								= dw_lista.getitemnumber(ll_fila,'cod_parque')
			ls_sector									= dw_lista.getitemstring(ll_fila,'sector')
			ls_tipo_sep									= dw_lista.getitemstring(ll_fila,'tipo_sepultura')
			ll_capacidad								= dw_lista.getitemnumber(ll_fila,'capacidad')
			w_cotizaciones.dw_ingreso_cotizacion.getchild('sector',idw_detalle6)
			idw_detalle6.settransobject(sqlca)
			idw_detalle6.retrieve(ll_cod_parque)
			
			w_cotizaciones.dw_ingreso_cotizacion.getchild('capacidad',idw_detalle7)
			idw_detalle7.settransobject(sqlca)
			idw_detalle7.retrieve(ls_sector,ls_tipo_sep,ll_cod_parque)
			
			w_cotizaciones.dw_ingreso_cotizacion.getchild('tipo_sepultura',idw_detalle8)
			idw_detalle8.settransobject(sqlca)
			idw_detalle8.retrieve(ls_sector,ll_cod_parque)
			
			w_cotizaciones.dw_ingreso_cotizacion.getchild('uso',idw_detalle9)
			idw_detalle9.settransobject(sqlca)
			idw_detalle9.retrieve(ls_sector,ls_tipo_sep,ll_capacidad,ll_cod_parque)
		else
			w_cotizaciones.cb_imprimir.enabled	= false
		end if
		w_cotizaciones.dw_ingreso_cotizacion.setfocus()
		close(w_busca_cotizaciones)
	else
		messagebox("Advertencia","Debe Seleccionar Registro")
	end if
end if
end event

type dw_lista from datawindow within w_busca_cotizaciones
integer x = 41
integer y = 220
integer width = 4114
integer height = 1736
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_cotizaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row > 0 then 
	cb_aceptar.triggerevent(clicked!)
end if	
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type gb_2 from groupbox within w_busca_cotizaciones
integer x = 1870
integer y = 1980
integer width = 983
integer height = 156
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

