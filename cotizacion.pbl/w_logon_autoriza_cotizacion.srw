forward
global type w_logon_autoriza_cotizacion from window
end type
type dw_ip from datawindow within w_logon_autoriza_cotizacion
end type
type st_3 from statictext within w_logon_autoriza_cotizacion
end type
type sle_clave from singlelineedit within w_logon_autoriza_cotizacion
end type
type sle_usuario from singlelineedit within w_logon_autoriza_cotizacion
end type
type st_2 from statictext within w_logon_autoriza_cotizacion
end type
type st_1 from statictext within w_logon_autoriza_cotizacion
end type
type cb_cancelar from commandbutton within w_logon_autoriza_cotizacion
end type
type cb_aceptar from commandbutton within w_logon_autoriza_cotizacion
end type
type p_1 from picture within w_logon_autoriza_cotizacion
end type
end forward

global type w_logon_autoriza_cotizacion from window
integer x = 425
integer y = 416
integer width = 1847
integer height = 612
boolean titlebar = true
string title = "Ingreso al Sistema"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
dw_ip dw_ip
st_3 st_3
sle_clave sle_clave
sle_usuario sle_usuario
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
p_1 p_1
end type
global w_logon_autoriza_cotizacion w_logon_autoriza_cotizacion

on w_logon_autoriza_cotizacion.create
this.dw_ip=create dw_ip
this.st_3=create st_3
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.p_1=create p_1
this.Control[]={this.dw_ip,&
this.st_3,&
this.sle_clave,&
this.sle_usuario,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.p_1}
end on

on w_logon_autoriza_cotizacion.destroy
destroy(this.dw_ip)
destroy(this.st_3)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;gf_centrar(w_logon_autoriza_cotizacion)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if

p_1.x			= 32
p_1.y			= 32
p_1.width	= 407
p_1.height	= 436
this.title 	= gs_app_name



end event

type dw_ip from datawindow within w_logon_autoriza_cotizacion
boolean visible = false
integer x = 384
integer y = 676
integer width = 576
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dwe_tcp_ip"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_logon_autoriza_cotizacion
integer x = 475
integer y = 76
integer width = 1298
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_logon_autoriza_cotizacion
integer x = 777
integer y = 356
integer width = 594
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_logon_autoriza_cotizacion
integer x = 777
integer y = 216
integer width = 599
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_logon_autoriza_cotizacion
integer x = 558
integer y = 356
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_logon_autoriza_cotizacion
integer x = 498
integer y = 216
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_logon_autoriza_cotizacion
integer x = 1422
integer y = 348
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_logon_autoriza_cotizacion)
end event

type cb_aceptar from commandbutton within w_logon_autoriza_cotizacion
integer x = 1422
integer y = 208
integer width = 361
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;String	ls_usuario,ls_clave,ls_estado,ls_depto
ls_usuario 						= trim(Upper(sle_usuario.text))
ls_clave							= Trim(upper(sle_clave.text))
SELECT	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."DEPTO"
INTO 		:ls_estado,   				:ls_depto
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario and
			"ENCARGADOS"."PASSWORD" = :ls_clave
USING		sqlca;    
if sqlca.sqlcode=0 then
	if ls_estado='A' then
		if ls_depto='G' or ls_depto='I' then
			if isvalid(w_cotizaciones) then
				if gs_conexion	= "Parque El Prado" then
					w_cotizaciones.rb_prado.enabled		= true
					w_cotizaciones.rb_manantial.enabled	= true
					w_cotizaciones.setfocus()
					Close(w_logon_autoriza_cotizacion)
				end if
			end if
		else
			messagebox("Advertencia","Ud. No tiene Acceso a Autorizar Otros Parques")
		end if
	else
		messagebox("Advertencia","Usuario Inactivo")
	end if
else
	MessageBox(gs_app_name, "El Usuario NO se encuentra o su Clave es Incorrecta.")
	sle_clave.text 				= ""
	sle_clave.SetFocus( )
end if
end event

type p_1 from picture within w_logon_autoriza_cotizacion
integer x = 32
integer y = 32
integer width = 407
integer height = 436
string picturename = "logo_parque_conce.jpg"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

