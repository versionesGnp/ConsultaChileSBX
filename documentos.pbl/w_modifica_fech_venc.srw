forward
global type w_modifica_fech_venc from window
end type
type p_1 from picture within w_modifica_fech_venc
end type
type em_1 from editmask within w_modifica_fech_venc
end type
type st_1 from statictext within w_modifica_fech_venc
end type
type cb_2 from commandbutton within w_modifica_fech_venc
end type
type cb_1 from commandbutton within w_modifica_fech_venc
end type
type gb_1 from groupbox within w_modifica_fech_venc
end type
end forward

global type w_modifica_fech_venc from window
integer x = 1637
integer y = 1428
integer width = 1051
integer height = 636
boolean titlebar = true
string title = "Prorroga"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
p_1 p_1
em_1 em_1
st_1 st_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_modifica_fech_venc w_modifica_fech_venc

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
em_1.text = string(today ())
end event

on w_modifica_fech_venc.create
this.p_1=create p_1
this.em_1=create em_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.p_1,&
this.em_1,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_modifica_fech_venc.destroy
destroy(this.p_1)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type p_1 from picture within w_modifica_fech_venc
integer x = 640
integer y = 192
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

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
	em_1.text = Message.StringParm
END IF
end event

type em_1 from editmask within w_modifica_fech_venc
integer x = 270
integer y = 188
integer width = 361
integer height = 96
integer taborder = 2
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~r"
end type

type st_1 from statictext within w_modifica_fech_venc
integer x = 91
integer y = 40
integer width = 727
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Fecha de Vencimiento :"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_modifica_fech_venc
integer x = 663
integer y = 400
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_modifica_fech_venc)
end event

type cb_1 from commandbutton within w_modifica_fech_venc
integer x = 59
integer y = 400
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;closewithreturn (w_modifica_fech_venc,em_1.text)
end event

type gb_1 from groupbox within w_modifica_fech_venc
integer x = 59
integer y = 40
integer width = 905
integer height = 316
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "none"
borderstyle borderstyle = stylelowered!
end type

