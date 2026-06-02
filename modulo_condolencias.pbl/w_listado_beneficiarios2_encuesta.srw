forward
global type w_listado_beneficiarios2_encuesta from window
end type
type cb_modif from commandbutton within w_listado_beneficiarios2_encuesta
end type
type cb_cerrar from commandbutton within w_listado_beneficiarios2_encuesta
end type
type dw_listado_beneficiarios2 from datawindow within w_listado_beneficiarios2_encuesta
end type
end forward

global type w_listado_beneficiarios2_encuesta from window
integer x = 133
integer y = 364
integer width = 2638
integer height = 1184
boolean titlebar = true
string title = "Listado de Beneficiarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_modif cb_modif
cb_cerrar cb_cerrar
dw_listado_beneficiarios2 dw_listado_beneficiarios2
end type
global w_listado_beneficiarios2_encuesta w_listado_beneficiarios2_encuesta

on w_listado_beneficiarios2_encuesta.create
this.cb_modif=create cb_modif
this.cb_cerrar=create cb_cerrar
this.dw_listado_beneficiarios2=create dw_listado_beneficiarios2
this.Control[]={this.cb_modif,&
this.cb_cerrar,&
this.dw_listado_beneficiarios2}
end on

on w_listado_beneficiarios2_encuesta.destroy
destroy(this.cb_modif)
destroy(this.cb_cerrar)
destroy(this.dw_listado_beneficiarios2)
end on

event open;string	ls_base,ls_serie,ls_string
double	ll_numero

gf_centrar (w_listado_beneficiarios2_encuesta)
dw_listado_beneficiarios2.SetTransObject(SQLCA)
//if gs_solicitudes='1' or gs_solicitudes='2' or gs_solicitudes='3' or gs_digita='1' then	//operaciones 1/2/3
//	if gs_base='O' then
//		cb_modifi.enabled	= true
//	else
//		cb_modifi.enabled	= false
//	end if
//else
//	cb_modifi.enabled		= false
//end if
ls_string						= Message.StringParm
ls_base 						= substr(1,1,Message.StringParm)
ls_serie						= substr(1,2,Message.StringParm)
ll_numero					= Double(substr(1,3,Message.StringParm))

if dw_listado_beneficiarios2.Retrieve(ls_serie,ll_numero)=0 then
//	messagebox("Advertencia","No registra Beneficiarios")
end if
end event

type cb_modif from commandbutton within w_listado_beneficiarios2_encuesta
boolean visible = false
integer x = 46
integer y = 936
integer width = 558
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Modifica Beneficiario"
end type

event clicked;if isvalid(w_modificar_beneficiarios)=true then close(w_modificar_beneficiarios)
open(w_modificar_beneficiarios)
end event

type cb_cerrar from commandbutton within w_listado_beneficiarios2_encuesta
integer x = 2254
integer y = 936
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_listado_beneficiarios2_encuesta)
end event

type dw_listado_beneficiarios2 from datawindow within w_listado_beneficiarios2_encuesta
integer x = 46
integer y = 40
integer width = 2528
integer height = 860
integer taborder = 10
string dataobject = "d_listado_beneficiarios2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

