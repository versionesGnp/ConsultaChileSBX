forward
global type w_reserva_encargados from window
end type
type cbx_2 from checkbox within w_reserva_encargados
end type
type cbx_1 from checkbox within w_reserva_encargados
end type
type cb_2 from commandbutton within w_reserva_encargados
end type
type cb_1 from commandbutton within w_reserva_encargados
end type
type p_2 from picture within w_reserva_encargados
end type
type p_1 from picture within w_reserva_encargados
end type
type em_2 from editmask within w_reserva_encargados
end type
type em_1 from editmask within w_reserva_encargados
end type
type ddlb_1 from dropdownlistbox within w_reserva_encargados
end type
type gb_1 from groupbox within w_reserva_encargados
end type
type gb_2 from groupbox within w_reserva_encargados
end type
end forward

global type w_reserva_encargados from window
integer width = 1678
integer height = 696
windowtype windowtype = response!
long backcolor = 67108864
cbx_2 cbx_2
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
p_2 p_2
p_1 p_1
em_2 em_2
em_1 em_1
ddlb_1 ddlb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_reserva_encargados w_reserva_encargados

type variables

end variables

event open;gf_centrar(w_reserva_encargados)
integer id_parque
string sql

gi_parque = integer(w_plano_sector_parque.st_parque.text)
sql = "SELECT DISTINCT ENCARGADOS.NOMBRE|| '"+FILL(' ' ,20)+" ' ||LOG_RESERVA_SEPULTURA.USUARIO_LOG FROM ENCARGADOS, LOG_RESERVA_SEPULTURA WHERE ENCARGADOS.CODIGO_USUARIO = LOG_RESERVA_SEPULTURA.USUARIO_LOG and LOG_RESERVA_SEPULTURA.COD_PARQUE = "+string(gi_parque,'###')

f_ddlb_all(ddlb_1,sql)
em_1.text = string(today (),'dd/mm/yyyy')
em_2.text = string(today (),'dd/mm/yyyy')



end event

on w_reserva_encargados.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_2=create p_2
this.p_1=create p_1
this.em_2=create em_2
this.em_1=create em_1
this.ddlb_1=create ddlb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.cb_2,&
this.cb_1,&
this.p_2,&
this.p_1,&
this.em_2,&
this.em_1,&
this.ddlb_1,&
this.gb_1,&
this.gb_2}
end on

on w_reserva_encargados.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.ddlb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cbx_2 from checkbox within w_reserva_encargados
integer x = 1326
integer y = 328
integer width = 219
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "No"
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.checked then 
	this.text='Si'
else
	this.text='No'
end if
end event

type cbx_1 from checkbox within w_reserva_encargados
integer x = 1326
integer y = 104
integer width = 219
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "No"
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.checked then 
	this.text='Si'
else
	this.text='No'
end if
end event

type cb_2 from commandbutton within w_reserva_encargados
integer x = 1207
integer y = 508
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;string nulo

setnull(nulo)
w_resumenes_planimetria.dw_1.setredraw(false)
w_resumenes_planimetria.dw_1.setfilter("")
w_resumenes_planimetria.dw_1.filter()
w_resumenes_planimetria.dw_1.GROUPCALC() 
w_resumenes_planimetria.dw_1.setredraw(true)
close(w_reserva_encargados)
end event

type cb_1 from commandbutton within w_reserva_encargados
integer x = 32
integer y = 508
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;string nulo,filtro
w_resumenes_planimetria.dw_1.setredraw(false)
if cbx_1.checked and cbx_2.checked then 
	filtro ='usuario_log = "'+ trim(mid(ddlb_1.text, Pos(ddlb_1.text, '  ')))+'"'+' and (fecha_log >= datetime("'+em_1.text+' 00:00:00")'+' and fecha_log <= datetime("'+em_2.text+' 23:59:59"))'
	w_resumenes_planimetria.dw_1.setfilter(filtro)
	w_resumenes_planimetria.dw_1.filter()
	w_resumenes_planimetria.dw_1.object.t_4.text = 'Reservado por: '+trim(mid(ddlb_1.text,1, 15))+', Entre Fechas '+em_1.text+ ' y '+em_2.text
elseif cbx_1.checked then 
	filtro ='usuario_log = "'+ trim(mid(ddlb_1.text, Pos(ddlb_1.text, '  ')))+'"'
	w_resumenes_planimetria.dw_1.setfilter(filtro)
	w_resumenes_planimetria.dw_1.filter()	
	w_resumenes_planimetria.dw_1.object.t_4.text = 'Reservado por: '+trim(mid(ddlb_1.text, 1,15))
elseif cbx_2.checked then 
	filtro ='fecha_log >= datetime("'+em_1.text+' 00:00:00")'+' and fecha_log <= datetime("'+em_2.text+' 23:59:59")'
	w_resumenes_planimetria.dw_1.setfilter(filtro)
	w_resumenes_planimetria.dw_1.filter()	
	w_resumenes_planimetria.dw_1.object.t_4.text = 'Reservado entre fechas '+em_1.text+ ' y '+em_2.text
end if
w_resumenes_planimetria.dw_1.object.t_2.text = 'Usuario: '+gs_nom_comp_usuario
w_resumenes_planimetria.dw_1.GROUPCALC() 
w_resumenes_planimetria.dw_1.setredraw(true)
close(w_reserva_encargados)
end event

type p_2 from picture within w_reserva_encargados
integer x = 690
integer y = 324
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
		cbx_2.checked = true
		cbx_2.text='Si'
	end if	
END IF
end event

type p_1 from picture within w_reserva_encargados
integer x = 123
integer y = 324
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
		cbx_2.checked = true
		cbx_2.text='Si'
	end if	
END IF
end event

type em_2 from editmask within w_reserva_encargados
integer x = 800
integer y = 324
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;cbx_2.checked = true
cbx_2.text='Si'
end event

type em_1 from editmask within w_reserva_encargados
integer x = 238
integer y = 320
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;cbx_2.checked = true
cbx_2.text='Si'
end event

type ddlb_1 from dropdownlistbox within w_reserva_encargados
integer x = 238
integer y = 88
integer width = 782
integer height = 804
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;cbx_1.checked = true
cbx_1.text='Si'

end event

type gb_1 from groupbox within w_reserva_encargados
integer x = 32
integer y = 248
integer width = 1577
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 67108864
string text = "Filtro de fechas"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_reserva_encargados
integer x = 32
integer y = 8
integer width = 1577
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 67108864
string text = "Filtro de Usuarios"
borderstyle borderstyle = stylelowered!
end type

