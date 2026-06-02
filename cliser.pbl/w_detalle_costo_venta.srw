forward
global type w_detalle_costo_venta from window
end type
type cb_cerrar from commandbutton within w_detalle_costo_venta
end type
type pb_3 from picturebutton within w_detalle_costo_venta
end type
type pb_2 from picturebutton within w_detalle_costo_venta
end type
type pb_1 from picturebutton within w_detalle_costo_venta
end type
type em_hasta from editmask within w_detalle_costo_venta
end type
type em_desde from editmask within w_detalle_costo_venta
end type
type st_3 from statictext within w_detalle_costo_venta
end type
type st_2 from statictext within w_detalle_costo_venta
end type
type st_1 from statictext within w_detalle_costo_venta
end type
type ddlb_parque from dropdownlistbox within w_detalle_costo_venta
end type
type dw_lista from datawindow within w_detalle_costo_venta
end type
end forward

global type w_detalle_costo_venta from window
integer width = 1947
integer height = 1864
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
em_hasta em_hasta
em_desde em_desde
st_3 st_3
st_2 st_2
st_1 st_1
ddlb_parque ddlb_parque
dw_lista dw_lista
end type
global w_detalle_costo_venta w_detalle_costo_venta

on w_detalle_costo_venta.create
this.cb_cerrar=create cb_cerrar
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_hasta=create em_hasta
this.em_desde=create em_desde
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_parque=create ddlb_parque
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.em_hasta,&
this.em_desde,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ddlb_parque,&
this.dw_lista}
end on

on w_detalle_costo_venta.destroy
destroy(this.cb_cerrar)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_hasta)
destroy(this.em_desde)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_parque)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_ingreso_costo_venta)
em_desde.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_lista.settransobject(sqlca)
end event

type cb_cerrar from commandbutton within w_detalle_costo_venta
integer x = 1595
integer y = 1632
integer width = 306
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_detalle_costo_venta)
end event

type pb_3 from picturebutton within w_detalle_costo_venta
integer x = 1646
integer y = 60
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 	ll_pos,ll_parque
string	ls_parque
date	ld_fech_ini,ld_fech_fin

ll_pos				= Pos(trim(ddlb_parque.text), "-")
ll_parque			= long(trim(mid(ddlb_parque.text,1,(ll_pos - 1))))
if ll_parque > 0 and not isnull(ll_parque)  then
	if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_desde.setfocus()
	else
		if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_hasta.setfocus()
		else
			ld_fech_ini			= date(em_desde.text)
			ld_fech_fin			= date(em_hasta.text)
			dw_lista.retrieve(ll_parque,ld_fech_ini,ld_fech_fin)
		end if	
	end if	
else
	messagebox('Advertencia','Falta Ingresar Parque')		
end if

end event

type pb_2 from picturebutton within w_detalle_costo_venta
integer x = 1458
integer y = 148
integer width = 96
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ddlb.bmp"
alignment htextalign = left!
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_hasta.text)=-1 then 
 em_hasta.text=string(today(),gs_formato_fecha)
 em_hasta.setfocus()
 return
end if 
if em_desde.text<>'00/00/0000' then
 ls_fecha = em_hasta.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_hasta.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_hasta.setfocus()
  return
 else 
  em_hasta.text = Message.StringParm
 end if 
END IF
end event

type pb_1 from picturebutton within w_detalle_costo_venta
integer x = 1458
integer y = 52
integer width = 96
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ddlb.bmp"
alignment htextalign = left!
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_desde.text)=-1 then 
 em_desde.text=string(today(),gs_formato_fecha)
 em_desde.setfocus()
 return
end if 
if em_desde.text<>'00/00/0000' then
 ls_fecha = em_desde.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_hasta.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_desde.setfocus()
  return
 else 
  em_desde.text = Message.StringParm
 end if 
END IF
end event

type em_hasta from editmask within w_detalle_costo_venta
integer x = 1134
integer y = 148
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_desde from editmask within w_detalle_costo_venta
integer x = 1134
integer y = 52
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_3 from statictext within w_detalle_costo_venta
integer x = 955
integer y = 164
integer width = 165
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type st_2 from statictext within w_detalle_costo_venta
integer x = 946
integer y = 68
integer width = 174
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type st_1 from statictext within w_detalle_costo_venta
integer x = 73
integer y = 68
integer width = 219
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
boolean focusrectangle = false
end type

type ddlb_parque from dropdownlistbox within w_detalle_costo_venta
integer x = 311
integer y = 52
integer width = 581
integer height = 396
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
string item[] = {"1 - Prado","102 - Santiago","103 - Manantial","11 - La Foresta"}
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_detalle_costo_venta
integer x = 37
integer y = 272
integer width = 1861
integer height = 1324
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_costo_ventas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

