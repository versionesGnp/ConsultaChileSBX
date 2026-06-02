forward
global type w_cambiar_estado from window
end type
type cb_limpiar from commandbutton within w_cambiar_estado
end type
type st_inactivo from statictext within w_cambiar_estado
end type
type pb_buscar from picturebutton within w_cambiar_estado
end type
type em_codigo from editmask within w_cambiar_estado
end type
type st_buscar from statictext within w_cambiar_estado
end type
type rb_jefe from radiobutton within w_cambiar_estado
end type
type rb_supervisor from radiobutton within w_cambiar_estado
end type
type rb_agente from radiobutton within w_cambiar_estado
end type
type cb_grabar from commandbutton within w_cambiar_estado
end type
type cb_cerrar from commandbutton within w_cambiar_estado
end type
type dw_estado from datawindow within w_cambiar_estado
end type
type gb_1 from groupbox within w_cambiar_estado
end type
end forward

global type w_cambiar_estado from window
integer width = 2309
integer height = 1760
boolean titlebar = true
string title = "Cambiar Estado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
st_inactivo st_inactivo
pb_buscar pb_buscar
em_codigo em_codigo
st_buscar st_buscar
rb_jefe rb_jefe
rb_supervisor rb_supervisor
rb_agente rb_agente
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_estado dw_estado
gb_1 gb_1
end type
global w_cambiar_estado w_cambiar_estado

type variables
String	is_codigo,is_opcion
datetime	idt_fec_ter_actual
Date		idt_fecha_hoy
end variables

on w_cambiar_estado.create
this.cb_limpiar=create cb_limpiar
this.st_inactivo=create st_inactivo
this.pb_buscar=create pb_buscar
this.em_codigo=create em_codigo
this.st_buscar=create st_buscar
this.rb_jefe=create rb_jefe
this.rb_supervisor=create rb_supervisor
this.rb_agente=create rb_agente
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_estado=create dw_estado
this.gb_1=create gb_1
this.Control[]={this.cb_limpiar,&
this.st_inactivo,&
this.pb_buscar,&
this.em_codigo,&
this.st_buscar,&
this.rb_jefe,&
this.rb_supervisor,&
this.rb_agente,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_estado,&
this.gb_1}
end on

on w_cambiar_estado.destroy
destroy(this.cb_limpiar)
destroy(this.st_inactivo)
destroy(this.pb_buscar)
destroy(this.em_codigo)
destroy(this.st_buscar)
destroy(this.rb_jefe)
destroy(this.rb_supervisor)
destroy(this.rb_agente)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_estado)
destroy(this.gb_1)
end on

event open;gf_centrar(w_cambiar_estado)
idt_fecha_hoy			= date(gdt_fec_sistema)
rb_agente.checked		= true
is_opcion				= 'A'
st_buscar.text			= 'Buscar Agente:'
dw_estado.dataobject	= 'dw_mantenedor_agente_estado'
dw_estado.settransobject(sqlca)
dw_estado.reset()
dw_estado.insertrow(0)
dw_estado.enabled		= false
st_inactivo.text		= 'Agente Inactivo'
st_inactivo.visible	= false
end event

type cb_limpiar from commandbutton within w_cambiar_estado
integer x = 955
integer y = 1496
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;setnull(is_codigo)
em_codigo.text			= ''
dw_estado.reset()
dw_estado.insertrow(0)
dw_estado.enabled		= false
st_inactivo.visible	= false
em_codigo.setfocus()
end event

type st_inactivo from statictext within w_cambiar_estado
integer x = 1184
integer y = 236
integer width = 1019
integer height = 124
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Century Gothic"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_cambiar_estado
integer x = 1047
integer y = 244
integer width = 119
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;openwithparm(w_lista_codigos,is_opcion)
end event

type em_codigo from editmask within w_cambiar_estado
integer x = 654
integer y = 244
integer width = 366
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

event modified;Long		ll_resp,ll_new

is_codigo								= trim(this.text)
st_inactivo.visible					= false
if not isnull(is_codigo) and is_codigo<>'' then
	if is_opcion='A' or is_opcion='S' or is_opcion='J' then
		if dw_estado.retrieve(is_codigo)=0 then
			ll_new						= dw_estado.insertrow(0)
			dw_estado.enabled			= false
			cb_grabar.enabled			= false
			cb_limpiar.enabled		= false
			messagebox("Advertencia","Codigo Inexistente")
			em_codigo.text				= ''
			setnull(is_codigo)
			em_codigo.setfocus()
		else
			idt_fec_ter_actual		= dw_estado.getitemdatetime(1,'fecha_fin')
			dw_estado.enabled			= true
			cb_grabar.enabled			= true
			cb_limpiar.enabled		= true
			if dw_estado.getitemstring(1,'estado')='I' then
				st_inactivo.visible	= true
			else
				st_inactivo.visible	= false
			end if
			dw_estado.setfocus()
			dw_estado.setcolumn('estado')
		end if
	end if
end if
end event

type st_buscar from statictext within w_cambiar_estado
integer x = 82
integer y = 264
integer width = 530
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_jefe from radiobutton within w_cambiar_estado
integer x = 1659
integer y = 104
integer width = 503
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = " Jefe Venta"
borderstyle borderstyle = stylelowered!
end type

event clicked;is_opcion				= 'J'
st_buscar.text			= 'Buscar Jefe Venta:'
st_inactivo.text		= 'Jefe Venta Inactivo'
st_inactivo.visible	= false
dw_estado.dataobject	= 'dw_mantenedor_jefe_estado'
dw_estado.settransobject(sqlca)
dw_estado.reset()
dw_estado.insertrow(0)
dw_estado.enabled		= false
em_codigo.text			= ''
em_codigo.setfocus()
end event

type rb_supervisor from radiobutton within w_cambiar_estado
integer x = 882
integer y = 104
integer width = 539
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = " Supervisor"
borderstyle borderstyle = stylelowered!
end type

event clicked;is_opcion				= 'S'
st_buscar.text			= 'Buscar Supervisor:'
st_inactivo.text		= 'Supervisor Inactivo'
st_inactivo.visible	= false
dw_estado.dataobject	= 'dw_mantenedor_supervisor_estado'
dw_estado.settransobject(sqlca)
dw_estado.reset()
dw_estado.insertrow(0)
dw_estado.enabled		= false
em_codigo.text			= ''
em_codigo.setfocus()
end event

type rb_agente from radiobutton within w_cambiar_estado
integer x = 187
integer y = 104
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = " Agente"
borderstyle borderstyle = stylelowered!
end type

event clicked;is_opcion				= 'A'
st_buscar.text			= 'Buscar Agente:'
st_inactivo.text		= 'Agente Inactivo'
st_inactivo.visible	= false
dw_estado.dataobject	= 'dw_mantenedor_agente_estado'
dw_estado.settransobject(sqlca)
dw_estado.reset()
dw_estado.insertrow(0)
dw_estado.enabled		= false
em_codigo.text			= ''
em_codigo.setfocus()
end event

type cb_grabar from commandbutton within w_cambiar_estado
integer x = 59
integer y = 1488
integer width = 357
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if not isnull(is_codigo) and is_codigo<>'' and trim(em_codigo.text)<>'' then
	if dw_estado.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
	cb_limpiar.triggerevent(clicked!)
end if
end event

type cb_cerrar from commandbutton within w_cambiar_estado
integer x = 1856
integer y = 1488
integer width = 366
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambiar_estado)
end event

type dw_estado from datawindow within w_cambiar_estado
integer x = 55
integer y = 408
integer width = 2194
integer height = 1052
integer taborder = 30
string title = "none"
string dataobject = "dw_mantenedor_agente_estado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_estado

dw_estado.accepttext()
ls_estado						= dw_estado.getitemstring(1,'estado')
ls_columna						= dwo.name
if ls_columna='estado' then
	if ls_estado='I' then
		st_inactivo.visible	= true
		if idt_fec_ter_actual<>datetime("01/01/2099") then
			messagebox("Advertencia","Recuerde Modificar Fecha de Término, se ingresará Fecha de Hoy")
			dw_estado.setitem(1,'fecha_fin',idt_fecha_hoy)
		else
			messagebox("Advertencia","Recuerde Modificar Fecha de Término")
		end if
	elseif ls_estado<>'I' then
		st_inactivo.visible	= false
		dw_estado.setitem(1,'fecha_fin',idt_fec_ter_actual)
	end if
end if
dw_estado.accepttext()
end event

event clicked;String	ls_columna,ls_fecha
ls_columna	= dwo.name
if not isnull(is_codigo) and is_codigo<>'' and dw_estado.getitemstring(1,'estado')='I' then
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_fecha		= string(date(dw_estado.getitemdatetime(1,'fecha_fin')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_estado.setitem(1,'fecha_fin',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha	= trim(Message.StringParm)
				dw_estado.setitem(1,'fecha_fin',date(ls_fecha))
			END IF
			dw_estado.setcolumn('fecha_fin')
	END CHOOSE
end if
end event

type gb_1 from groupbox within w_cambiar_estado
integer x = 59
integer y = 28
integer width = 2167
integer height = 372
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
borderstyle borderstyle = stylelowered!
end type

