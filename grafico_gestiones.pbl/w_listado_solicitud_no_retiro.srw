forward
global type w_listado_solicitud_no_retiro from window
end type
type dw_listado_no_retiro_flores from datawindow within w_listado_solicitud_no_retiro
end type
type pb_consultar from picturebutton within w_listado_solicitud_no_retiro
end type
type st_2 from statictext within w_listado_solicitud_no_retiro
end type
type em_fec_fin from editmask within w_listado_solicitud_no_retiro
end type
type em_fec_ini from editmask within w_listado_solicitud_no_retiro
end type
type st_1 from statictext within w_listado_solicitud_no_retiro
end type
type p_3 from picture within w_listado_solicitud_no_retiro
end type
type p_4 from picture within w_listado_solicitud_no_retiro
end type
end forward

global type w_listado_solicitud_no_retiro from window
integer width = 3904
integer height = 1944
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_listado_no_retiro_flores dw_listado_no_retiro_flores
pb_consultar pb_consultar
st_2 st_2
em_fec_fin em_fec_fin
em_fec_ini em_fec_ini
st_1 st_1
p_3 p_3
p_4 p_4
end type
global w_listado_solicitud_no_retiro w_listado_solicitud_no_retiro

on w_listado_solicitud_no_retiro.create
this.dw_listado_no_retiro_flores=create dw_listado_no_retiro_flores
this.pb_consultar=create pb_consultar
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.p_3=create p_3
this.p_4=create p_4
this.Control[]={this.dw_listado_no_retiro_flores,&
this.pb_consultar,&
this.st_2,&
this.em_fec_fin,&
this.em_fec_ini,&
this.st_1,&
this.p_3,&
this.p_4}
end on

on w_listado_solicitud_no_retiro.destroy
destroy(this.dw_listado_no_retiro_flores)
destroy(this.pb_consultar)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.p_3)
destroy(this.p_4)
end on

type dw_listado_no_retiro_flores from datawindow within w_listado_solicitud_no_retiro
integer x = 32
integer y = 184
integer width = 3767
integer height = 1424
integer taborder = 50
string title = "none"
string dataobject = "dw_listado_ficha_no_retiro"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_consultar from picturebutton within w_listado_solicitud_no_retiro
integer x = 1193
integer y = 12
integer width = 155
integer height = 136
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin,ldt_fecha,ldt_fec_repor,ldt_fech_lim
string 	ls_cod_jef,ls_cod_sup,ls_base,ls_serie,ls_valida,ls_fecha,ls_fech_st,ls_fech_aux
long		ll_indi,ll_tot_reg,ll_rut,ll_rut_cliente,ll_count
Double	ll_numero

ldt_fech_ini									= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fech_fin									= datetime(date(em_fec_fin.text),time('23:59:59'))	
if ldt_fech_ini <= ldt_fech_fin then
	dw_listado_no_retiro_flores.settransobject(sqlca)
	ll_tot_reg									= dw_listado_no_retiro_flores.retrieve(ldt_fech_ini,ldt_fech_fin) 	
	if ll_tot_reg>0 then
	else
		Messagebox("Advertencia","No se Registran datos en Rango Consultado")
	end if
else
	Messagebox("Error","Rango de Fechas Invalido")
end if
end event

type st_2 from statictext within w_listado_solicitud_no_retiro
integer x = 617
integer y = 60
integer width = 105
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_listado_solicitud_no_retiro
integer x = 727
integer y = 44
integer width = 302
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_listado_no_retiro_flores.reset()
end event

type em_fec_ini from editmask within w_listado_solicitud_no_retiro
integer x = 201
integer y = 52
integer width = 302
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_listado_no_retiro_flores.reset()
end event

type st_1 from statictext within w_listado_solicitud_no_retiro
integer x = 41
integer y = 60
integer width = 151
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio:"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_3 from picture within w_listado_solicitud_no_retiro
integer x = 507
integer y = 44
integer width = 78
integer height = 88
integer taborder = 30
string picturename = "DDLB.BMP"
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
  em_fec_ini.text = Message.StringParm
 end if 
END IF

end event

type p_4 from picture within w_listado_solicitud_no_retiro
integer x = 1038
integer y = 44
integer width = 78
integer height = 88
integer taborder = 50
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
 em_fec_fin.text=string(today(),gs_formato_fecha)
 em_fec_fin.setfocus()
 return
end if 
if em_fec_ini.text<>'00/00/0000' then
 ls_fecha = em_fec_fin.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_fec_fin.setfocus()
  return
 else 
  em_fec_fin.text = Message.StringParm
 end if 
END IF
end event

