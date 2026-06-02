forward
global type w_buscar_fallecido_supervisor from window
end type
type cb_ctacte from commandbutton within w_buscar_fallecido_supervisor
end type
type cb_cerrar from commandbutton within w_buscar_fallecido_supervisor
end type
type dw_lista from datawindow within w_buscar_fallecido_supervisor
end type
type pb_ok from picturebutton within w_buscar_fallecido_supervisor
end type
type em_mat from editmask within w_buscar_fallecido_supervisor
end type
type em_pat from editmask within w_buscar_fallecido_supervisor
end type
type em_nombre from editmask within w_buscar_fallecido_supervisor
end type
type st_4 from statictext within w_buscar_fallecido_supervisor
end type
type st_3 from statictext within w_buscar_fallecido_supervisor
end type
type st_2 from statictext within w_buscar_fallecido_supervisor
end type
type rb_nombre from radiobutton within w_buscar_fallecido_supervisor
end type
type rb_rut from radiobutton within w_buscar_fallecido_supervisor
end type
type em_rut from editmask within w_buscar_fallecido_supervisor
end type
type st_1 from statictext within w_buscar_fallecido_supervisor
end type
end forward

global type w_buscar_fallecido_supervisor from window
integer width = 3278
integer height = 1956
boolean titlebar = true
string title = "Buscar Fallecido"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
dw_lista dw_lista
pb_ok pb_ok
em_mat em_mat
em_pat em_pat
em_nombre em_nombre
st_4 st_4
st_3 st_3
st_2 st_2
rb_nombre rb_nombre
rb_rut rb_rut
em_rut em_rut
st_1 st_1
end type
global w_buscar_fallecido_supervisor w_buscar_fallecido_supervisor

on w_buscar_fallecido_supervisor.create
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.pb_ok=create pb_ok
this.em_mat=create em_mat
this.em_pat=create em_pat
this.em_nombre=create em_nombre
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.rb_nombre=create rb_nombre
this.rb_rut=create rb_rut
this.em_rut=create em_rut
this.st_1=create st_1
this.Control[]={this.cb_ctacte,&
this.cb_cerrar,&
this.dw_lista,&
this.pb_ok,&
this.em_mat,&
this.em_pat,&
this.em_nombre,&
this.st_4,&
this.st_3,&
this.st_2,&
this.rb_nombre,&
this.rb_rut,&
this.em_rut,&
this.st_1}
end on

on w_buscar_fallecido_supervisor.destroy
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.pb_ok)
destroy(this.em_mat)
destroy(this.em_pat)
destroy(this.em_nombre)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.rb_nombre)
destroy(this.rb_rut)
destroy(this.em_rut)
destroy(this.st_1)
end on

event open;gf_centrar(w_buscar_fallecido_supervisor)
dw_lista.settransobject(sqlca)
rb_rut.triggerevent(clicked!)
end event

type cb_ctacte from commandbutton within w_buscar_fallecido_supervisor
integer x = 27
integer y = 1696
integer width = 425
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;if dw_lista.getrow() > 0 and dw_lista.rowcount() > 0 then
	gs_base 									= dw_lista.GetItemString(dw_lista.getrow(), "base")
	gs_serie 									= dw_lista.GetItemString(dw_lista.getrow(), "ss")
	gi_numero 								= dw_lista.GetItemNumber(dw_lista.getrow(), "contrato")
	gi_rut 									= dw_lista.GetItemNumber(dw_lista.getrow(), "cadena_rut")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O","U" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_buscar_fallecido_supervisor
integer x = 2802
integer y = 1696
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_fallecido_supervisor)
end event

type dw_lista from datawindow within w_buscar_fallecido_supervisor
integer x = 41
integer y = 476
integer width = 3136
integer height = 1176
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_buscar_fallecidos_supervisor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
//	ls_estado_ctto	= this.getitemstring(this.getrow(),'cadena_estado')
//	if ls_estado_ctto <> 'V' and 
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type pb_ok from picturebutton within w_buscar_fallecido_supervisor
integer x = 2999
integer y = 40
integer width = 178
integer height = 156
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_rut
String		ls_nom,ls_pat,ls_mat
if rb_rut.checked=true then
	ll_rut		= long(em_rut.text)
	if ll_rut > 0 then
		if dw_lista.retrieve(ll_rut)=0 then messagebox("Advertencia","No Registra Dato")
	end if
elseif rb_nombre.checked=true then
	ls_nom	= trim(em_nombre.text)
	ls_pat		= trim(em_pat.text)
	ls_mat	= trim(em_mat.text)
	if isnull(ls_nom) and isnull(ls_pat) and isnull(ls_mat) then
		messagebox("Advertencia","Debe ingresar Nombre Fallecido")
	else
		if isnull(ls_nom) then ls_nom = '' 
		if isnull(ls_pat) then ls_pat = ''
		if isnull(ls_mat) then ls_mat = ''
		ls_nom				= ls_nom+'%'
		ls_pat					= ls_pat
		ls_mat				= ls_mat
		if dw_lista.retrieve(ls_nom,ls_pat,ls_mat)=0 then messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type em_mat from editmask within w_buscar_fallecido_supervisor
integer x = 1897
integer y = 336
integer width = 741
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_pat from editmask within w_buscar_fallecido_supervisor
integer x = 1897
integer y = 228
integer width = 741
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_nombre from editmask within w_buscar_fallecido_supervisor
integer x = 1897
integer y = 120
integer width = 741
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_4 from statictext within w_buscar_fallecido_supervisor
integer x = 1463
integer y = 348
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Apellido Materno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_buscar_fallecido_supervisor
integer x = 1463
integer y = 240
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Apellido Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_buscar_fallecido_supervisor
integer x = 1463
integer y = 132
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_nombre from radiobutton within w_buscar_fallecido_supervisor
integer x = 1358
integer y = 24
integer width = 535
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Nombre"
end type

event clicked;if this.checked=true then
	dw_lista.dataobject	= 'dw_lista_buscar_fallecidos_superv_nom'
	dw_lista.settransobject(sqlca)
	dw_lista.reset()
	
	em_nombre.text		= ''
	em_pat.text				= ''
	em_mat.text			= ''
	em_nombre.enabled	= true
	em_pat.enabled		= true
	em_mat.enabled		= true
	
	em_rut.enabled		= false
	em_rut.text				= ''
	em_nombre.setfocus()
end if
end event

type rb_rut from radiobutton within w_buscar_fallecido_supervisor
integer x = 41
integer y = 28
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Rut"
boolean checked = true
end type

event clicked;if this.checked=true then
	dw_lista.dataobject	= 'dw_lista_buscar_fallecidos_supervisor'
	dw_lista.settransobject(sqlca)
	dw_lista.reset()
	
	em_nombre.text		= ''
	em_pat.text				= ''
	em_mat.text			= ''
	em_nombre.enabled	= false
	em_pat.enabled		= false
	em_mat.enabled		= false
	
	em_rut.enabled		= true
	em_rut.text				= ''
	em_rut.setfocus()
end if
end event

type em_rut from editmask within w_buscar_fallecido_supervisor
integer x = 306
integer y = 120
integer width = 562
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_buscar_fallecido_supervisor
integer x = 151
integer y = 132
integer width = 123
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

