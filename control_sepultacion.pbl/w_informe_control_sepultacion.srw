forward
global type w_informe_control_sepultacion from window
end type
type cb_imprimir from commandbutton within w_informe_control_sepultacion
end type
type cb_3 from commandbutton within w_informe_control_sepultacion
end type
type cb_2 from commandbutton within w_informe_control_sepultacion
end type
type cb_1 from commandbutton within w_informe_control_sepultacion
end type
type dw_parque from datawindow within w_informe_control_sepultacion
end type
type st_16 from statictext within w_informe_control_sepultacion
end type
type pb_ok from picturebutton within w_informe_control_sepultacion
end type
type em_fec_fin from editmask within w_informe_control_sepultacion
end type
type st_2 from statictext within w_informe_control_sepultacion
end type
type em_fec_ini from editmask within w_informe_control_sepultacion
end type
type p_ini from picture within w_informe_control_sepultacion
end type
type st_3 from statictext within w_informe_control_sepultacion
end type
type p_fin from picture within w_informe_control_sepultacion
end type
type cb_cerrar from commandbutton within w_informe_control_sepultacion
end type
type dw_lista from datawindow within w_informe_control_sepultacion
end type
type gb_1 from groupbox within w_informe_control_sepultacion
end type
end forward

global type w_informe_control_sepultacion from window
integer width = 3579
integer height = 2476
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_parque dw_parque
st_16 st_16
pb_ok pb_ok
em_fec_fin em_fec_fin
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_control_sepultacion w_informe_control_sepultacion

type variables
String	is_opcion
Long		il_row
end variables

on w_informe_control_sepultacion.create
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_parque=create dw_parque
this.st_16=create st_16
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_parque,&
this.st_16,&
this.pb_ok,&
this.em_fec_fin,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_informe_control_sepultacion.destroy
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_parque

gf_centrar(w_informe_control_sepultacion)
dw_parque.settransobject(sqlca)
is_opcion	= Message.StringParm	
if is_opcion='D' then //Detalle
	dw_lista.dataobject							= 'dw_informe_por_ficha_rango_fecha'
	w_informe_control_sepultacion.title		= 'Detalle Control Sepultación'
elseif is_opcion='E' then //Estadistico
	w_informe_control_sepultacion.title		= 'Cuadro Estadístico Sepultación'
	dw_lista.dataobject							= 'dw_agrupar_control_sepultacion'
elseif is_opcion = 'R' then //reduccion
	w_informe_control_sepultacion.title		= 'Fallecidos Reducción'
	dw_lista.dataobject							= 'dw_lista_reducciones_fallecidos'
end if
dw_lista.settransobject(sqlca)
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque		= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque		= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
end event

type cb_imprimir from commandbutton within w_informe_control_sepultacion
integer x = 905
integer y = 2204
integer width = 251
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
//	dw_lista.object.datawindow.Print.Preview	= true
	if dw_lista.dataobject='dw_lista_reducciones_fallecidos' then
		dw_lista.object.datawindow.zoom        = 84
	end if
	f_Print( dw_lista )
	if dw_lista.dataobject='dw_lista_reducciones_fallecidos' then
		dw_lista.object.datawindow.zoom        = 100
	end if
//	dw_lista.object.datawindow.Print.Preview	= false
end if
end event

type cb_3 from commandbutton within w_informe_control_sepultacion
integer x = 311
integer y = 2204
integer width = 251
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_informe_control_sepultacion
integer x = 567
integer y = 2204
integer width = 251
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_1 from commandbutton within w_informe_control_sepultacion
integer x = 55
integer y = 2204
integer width = 251
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type dw_parque from datawindow within w_informe_control_sepultacion
integer x = 2021
integer y = 40
integer width = 594
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_16 from statictext within w_informe_control_sepultacion
integer x = 1787
integer y = 48
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

type pb_ok from picturebutton within w_informe_control_sepultacion
integer x = 2656
integer y = 20
integer width = 151
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
Long		ll_cod_parque,ll_tot_reg,ll_indi
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

ld_fec_ini	= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin	= datetime(date(em_fec_fin.text),lt_fin)
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
				ll_tot_reg	= dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque)
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

type em_fec_fin from editmask within w_informe_control_sepultacion
integer x = 1271
integer y = 40
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

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_control_sepultacion
integer x = 32
integer y = 48
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

type em_fec_ini from editmask within w_informe_control_sepultacion
integer x = 608
integer y = 40
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

type p_ini from picture within w_informe_control_sepultacion
integer x = 969
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
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

type st_3 from statictext within w_informe_control_sepultacion
integer x = 1079
integer y = 48
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

type p_fin from picture within w_informe_control_sepultacion
integer x = 1632
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
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

type cb_cerrar from commandbutton within w_informe_control_sepultacion
integer x = 3232
integer y = 2196
integer width = 293
integer height = 112
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_control_sepultacion)
end event

type dw_lista from datawindow within w_informe_control_sepultacion
integer x = 27
integer y = 176
integer width = 3497
integer height = 1964
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_reducciones_fallecidos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_informe_control_sepultacion
integer x = 27
integer y = 2152
integer width = 1152
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

