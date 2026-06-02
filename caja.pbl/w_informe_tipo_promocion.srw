forward
global type w_informe_tipo_promocion from window
end type
type cb_filtrar from commandbutton within w_informe_tipo_promocion
end type
type cb_sort from commandbutton within w_informe_tipo_promocion
end type
type cb_exportar from commandbutton within w_informe_tipo_promocion
end type
type cb_imprimir from commandbutton within w_informe_tipo_promocion
end type
type pb_ok from picturebutton within w_informe_tipo_promocion
end type
type dw_tipo_descuento from datawindow within w_informe_tipo_promocion
end type
type p_fin from picture within w_informe_tipo_promocion
end type
type em_fec_fin from editmask within w_informe_tipo_promocion
end type
type st_3 from statictext within w_informe_tipo_promocion
end type
type p_ini from picture within w_informe_tipo_promocion
end type
type em_fec_ini from editmask within w_informe_tipo_promocion
end type
type st_2 from statictext within w_informe_tipo_promocion
end type
type cb_cerrar from commandbutton within w_informe_tipo_promocion
end type
type dw_lista from datawindow within w_informe_tipo_promocion
end type
end forward

global type w_informe_tipo_promocion from window
integer width = 3762
integer height = 2012
boolean titlebar = true
string title = "Informe de Promesas por Tipo Descuento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
pb_ok pb_ok
dw_tipo_descuento dw_tipo_descuento
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_informe_tipo_promocion w_informe_tipo_promocion

on w_informe_tipo_promocion.create
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.pb_ok=create pb_ok
this.dw_tipo_descuento=create dw_tipo_descuento
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.pb_ok,&
this.dw_tipo_descuento,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_informe_tipo_promocion.destroy
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.pb_ok)
destroy(this.dw_tipo_descuento)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long	ll_new
gf_centrar(w_informe_tipo_promocion)
dw_lista.settransobject(sqlca)
dw_tipo_descuento.settransobject(sqlca)
ll_new	= dw_tipo_descuento.insertrow(0)
dw_tipo_descuento.setitem(ll_new,'codigo_descuento',0)
dw_tipo_descuento.accepttext()
em_fec_ini.text	= string(today(),"dd/mm/yyyy")
em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end event

type cb_filtrar from commandbutton within w_informe_tipo_promocion
integer x = 763
integer y = 1784
integer width = 224
integer height = 100
integer taborder = 90
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

type cb_sort from commandbutton within w_informe_tipo_promocion
integer x = 535
integer y = 1784
integer width = 224
integer height = 100
integer taborder = 80
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

type cb_exportar from commandbutton within w_informe_tipo_promocion
integer x = 306
integer y = 1784
integer width = 224
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_informe_tipo_promocion
integer x = 55
integer y = 1784
integer width = 219
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_printdlg(dw_lista,gstr_print,w_estado_informes)

end event

type pb_ok from picturebutton within w_informe_tipo_promocion
integer x = 3534
integer y = 24
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Long		ll_descuento
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
			ll_descuento	= dw_tipo_descuento.getitemnumber(1,'codigo_descuento')
			if not isnull(ll_descuento) then
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_descuento)=0 then
					messagebox("Advertencia","No registra Dato")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Tipo Descuento")
				dw_tipo_descuento.setfocus()
				dw_tipo_descuento.setcolumn('codigo_descuento')
			end if
		end if
	end if
end if
end event

type dw_tipo_descuento from datawindow within w_informe_tipo_promocion
integer x = 1710
integer y = 44
integer width = 1623
integer height = 112
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_tipo_descuento"
boolean border = false
boolean livescroll = true
end type

type p_fin from picture within w_informe_tipo_promocion
integer x = 1577
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

type em_fec_fin from editmask within w_informe_tipo_promocion
integer x = 1216
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_informe_tipo_promocion
integer x = 1033
integer y = 72
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

type p_ini from picture within w_informe_tipo_promocion
integer x = 937
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

type em_fec_ini from editmask within w_informe_tipo_promocion
integer x = 576
integer y = 56
integer width = 357
integer height = 88
integer taborder = 10
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

type st_2 from statictext within w_informe_tipo_promocion
integer x = 50
integer y = 72
integer width = 507
integer height = 60
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

type cb_cerrar from commandbutton within w_informe_tipo_promocion
integer x = 3351
integer y = 1784
integer width = 352
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

event clicked;close(w_informe_tipo_promocion)
end event

type dw_lista from datawindow within w_informe_tipo_promocion
integer x = 55
integer y = 200
integer width = 3648
integer height = 1532
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_promesas_por_tipo_descuento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

