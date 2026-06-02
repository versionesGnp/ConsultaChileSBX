forward
global type w_cambio_pass_agente from window
end type
type cb_1 from commandbutton within w_cambio_pass_agente
end type
type p_1 from picture within w_cambio_pass_agente
end type
type dw_dato from datawindow within w_cambio_pass_agente
end type
type st_6 from statictext within w_cambio_pass_agente
end type
type sle_confirmar from singlelineedit within w_cambio_pass_agente
end type
type st_4 from statictext within w_cambio_pass_agente
end type
type st_3 from statictext within w_cambio_pass_agente
end type
type sle_nueva_clave from singlelineedit within w_cambio_pass_agente
end type
type cb_cancelar from commandbutton within w_cambio_pass_agente
end type
type cb_aceptar from commandbutton within w_cambio_pass_agente
end type
type sle_usuario from singlelineedit within w_cambio_pass_agente
end type
type sle_clave from singlelineedit within w_cambio_pass_agente
end type
type st_1 from statictext within w_cambio_pass_agente
end type
type st_2 from statictext within w_cambio_pass_agente
end type
type st_5 from statictext within w_cambio_pass_agente
end type
type gb_1 from groupbox within w_cambio_pass_agente
end type
type gb_2 from groupbox within w_cambio_pass_agente
end type
end forward

global type w_cambio_pass_agente from window
integer width = 3150
integer height = 1104
boolean titlebar = true
string title = "Cambio Clave AGENTE"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
p_1 p_1
dw_dato dw_dato
st_6 st_6
sle_confirmar sle_confirmar
st_4 st_4
st_3 st_3
sle_nueva_clave sle_nueva_clave
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
sle_usuario sle_usuario
sle_clave sle_clave
st_1 st_1
st_2 st_2
st_5 st_5
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_pass_agente w_cambio_pass_agente

on w_cambio_pass_agente.create
this.cb_1=create cb_1
this.p_1=create p_1
this.dw_dato=create dw_dato
this.st_6=create st_6
this.sle_confirmar=create sle_confirmar
this.st_4=create st_4
this.st_3=create st_3
this.sle_nueva_clave=create sle_nueva_clave
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.sle_usuario=create sle_usuario
this.sle_clave=create sle_clave
this.st_1=create st_1
this.st_2=create st_2
this.st_5=create st_5
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.p_1,&
this.dw_dato,&
this.st_6,&
this.sle_confirmar,&
this.st_4,&
this.st_3,&
this.sle_nueva_clave,&
this.cb_cancelar,&
this.cb_aceptar,&
this.sle_usuario,&
this.sle_clave,&
this.st_1,&
this.st_2,&
this.st_5,&
this.gb_1,&
this.gb_2}
end on

on w_cambio_pass_agente.destroy
destroy(this.cb_1)
destroy(this.p_1)
destroy(this.dw_dato)
destroy(this.st_6)
destroy(this.sle_confirmar)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_nueva_clave)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.sle_usuario)
destroy(this.sle_clave)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;if gs_conexion = "Parque El Prado" then
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
	p_1.picturename 		= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 		= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 		= 'logo_parque_conce.jpg'
end if
if gs_depto='I' then		
	gf_centrar(w_cambio_pass_agente)
	dw_dato.settransobject(sqlca)
	dw_dato.insertrow(0)
else
	MessageBox("ADVERTENCIA","Usted No Tiene Los Permisos Necesarios")
	close(w_cambio_pass_agente)
end if	


end event

type cb_1 from commandbutton within w_cambio_pass_agente
integer x = 1349
integer y = 856
integer width = 315
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;sle_usuario.text		= ''
sle_clave.text			= ''
sle_nueva_clave.text	= ''
sle_confirmar.text	= ''
dw_dato.reset()
dw_dato.insertrow(0)
cb_aceptar.enabled	= false
sle_usuario.setfocus()
end event

type p_1 from picture within w_cambio_pass_agente
integer x = 32
integer y = 44
integer width = 393
integer height = 336
boolean enabled = false
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_dato from datawindow within w_cambio_pass_agente
integer x = 1518
integer y = 40
integer width = 1568
integer height = 760
boolean enabled = false
string title = "none"
string dataobject = "dw_cambio_clav"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_cambio_pass_agente
integer x = 297
integer y = 456
integer width = 1001
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese la nueva clave del agente"
boolean focusrectangle = false
end type

type sle_confirmar from singlelineedit within w_cambio_pass_agente
integer x = 635
integer y = 684
integer width = 672
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;if not isnull(trim(sle_nueva_clave.text)) and not isnull(trim(sle_confirmar.text)) then 
	if trim(sle_nueva_clave.text) <> trim(sle_confirmar.text) then
		messagebox("Advertencia","Error en Confirmación, debe ser igual a Clave Nueva")
		this.text	= ''
		this.setfocus()
	end if
end if
end event

type st_4 from statictext within w_cambio_pass_agente
integer x = 155
integer y = 692
integer width = 480
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Confirme Clave:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambio_pass_agente
integer x = 238
integer y = 588
integer width = 398
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nueva Clave:"
boolean focusrectangle = false
end type

type sle_nueva_clave from singlelineedit within w_cambio_pass_agente
integer x = 635
integer y = 580
integer width = 672
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String	ls_password,ls_clave

ls_clave	= trim(this.text)
if not isnull(trim(sle_nueva_clave.text)) then 
	if trim(sle_nueva_clave.text) = trim(sle_clave.text) then
		messagebox("Advertencia","Clave Ingresada debe ser distinta a la Clave Actual")
		this.text		= ''
		this.setfocus()
	else
		//cb_aceptar.triggerevent(clicked!)
		sle_confirmar.setfocus()
	end if
end if


end event

type cb_cancelar from commandbutton within w_cambio_pass_agente
integer x = 2738
integer y = 856
integer width = 357
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(w_cambio_pass_agente)
end event

type cb_aceptar from commandbutton within w_cambio_pass_agente
integer x = 14
integer y = 856
integer width = 338
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;Long		ll_resp
String	ls_clave,ls_usuario

if trim(sle_clave.text)<>'' and trim(sle_nueva_clave.text)<>'' and trim(sle_confirmar.text)<>'' and &
	not isnull(sle_clave.text) and not isnull(sle_nueva_clave.text) and not isnull(sle_confirmar.text) and &
	trim(sle_nueva_clave.text)=trim(sle_confirmar.text) and trim(sle_clave.text)<>trim(sle_nueva_clave.text) then
	ll_resp 									= MessageBox("Advertencia", "Está seguro de Cambiar su Clave", Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		ls_clave								= trim(sle_nueva_clave.text)
		UPDATE	"AGENTES"  
		SET 		"CLAVE" = :ls_clave  
		WHERE 	"AGENTES"."COD_AGE" = :ls_usuario  //////////////////
		USING		sqlca ;
		if sqlca.sqlcode=0 then
			messagebox("Grabar","Grabación Exitosa")
			commit;
			close(w_cambio_pass_agente)
		else
			rollback;
			messagebox("Advertencia","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	END IF
else
	if trim(sle_clave.text)<>'' and not isnull(sle_clave.text) then
		messagebox("Advertencia","Falta Ingresar Clave")
		sle_clave.setfocus()
	elseif trim(sle_nueva_clave.text)<>'' and not isnull(sle_nueva_clave.text) then
		messagebox("Advertencia","Falta Ingresar Nueva Clave")
		sle_nueva_clave.setfocus()
	elseif trim(sle_confirmar.text)<>'' and not isnull(sle_confirmar.text) then
		messagebox("Advertencia","Falta Ingresar Confirmación Nueva Clave")
		sle_confirmar.setfocus()
	elseif trim(sle_nueva_clave.text)<>trim(sle_confirmar.text) then
		messagebox("Advertencia","Error en Confirmación de Clave, No es Igual a Nueva Clave")
		sle_confirmar.setfocus()
	elseif trim(sle_clave.text)=trim(sle_nueva_clave.text) then	
		messagebox("Advertencia","Error Clave Nueva Inválida, No debe ser Igual a Clave Actual")
		sle_nueva_clave.setfocus()
	end if
end if



end event

type sle_usuario from singlelineedit within w_cambio_pass_agente
integer x = 777
integer y = 168
integer width = 672
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

event modified;string ls_clave,ls_usuario
long ll_resp
datetime ldt_expira

ls_usuario										= trim(Upper(sle_usuario.text))

if NOT ISNULL(ls_usuario)  then
	SELECT "AGENTES"."CLAVE"
	INTO	 :ls_clave 
	FROM 	 "AGENTES" 
	WHERE	 "AGENTES"."COD_AGE" = :ls_usuario
	USING	sqlca;
	if sqlca.sqlcode = 0 Then
		sle_clave.text								= string(ls_clave)
		dw_dato.retrieve(ls_usuario)
		ll_resp 										= MessageBox("Mensaje", "¿Desea Cambiar la Clave?", Exclamation!, YesNo!, 2)
		if ll_resp = 1 then	
			cb_aceptar.enabled        			= true
			sle_confirmar.enabled 				= true
			sle_nueva_clave.enabled       	= true
			sle_nueva_clave.setfocus()	
		else
			cb_aceptar.enabled        			= false
			sle_confirmar.text 					= ''
			sle_nueva_clave.text    	     	= ''
			sle_confirmar.enabled 				= false
			sle_nueva_clave.enabled      		= false
			dw_dato.setfocus()
		end if	
	else
		MessageBox("Error","Error No se encuentra agente con ese codigo :"+sqlca.sqlerrtext)	
	end if
end if
end event

type sle_clave from singlelineedit within w_cambio_pass_agente
integer x = 777
integer y = 288
integer width = 672
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_cambio_pass_agente
integer x = 530
integer y = 176
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cambio_pass_agente
integer x = 585
integer y = 304
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
boolean focusrectangle = false
end type

type st_5 from statictext within w_cambio_pass_agente
integer x = 553
integer y = 64
integer width = 832
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese codigo del agente "
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_cambio_pass_agente
integer x = 23
integer width = 1481
integer height = 816
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
end type

type gb_2 from groupbox within w_cambio_pass_agente
integer x = 1509
integer width = 1591
integer height = 816
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

