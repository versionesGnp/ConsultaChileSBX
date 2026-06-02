forward
global type w_listados_secretaria from window
end type
type cb_aceptar from commandbutton within w_listados_secretaria
end type
type cb_cerrar from commandbutton within w_listados_secretaria
end type
type rb_capilla_imple from radiobutton within w_listados_secretaria
end type
type rb_no_retiro from radiobutton within w_listados_secretaria
end type
type rb_obi_dia from radiobutton within w_listados_secretaria
end type
type gb_1 from groupbox within w_listados_secretaria
end type
end forward

global type w_listados_secretaria from window
integer width = 1179
integer height = 884
boolean titlebar = true
string title = "Informes Secretaría"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
rb_capilla_imple rb_capilla_imple
rb_no_retiro rb_no_retiro
rb_obi_dia rb_obi_dia
gb_1 gb_1
end type
global w_listados_secretaria w_listados_secretaria

on w_listados_secretaria.create
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.rb_capilla_imple=create rb_capilla_imple
this.rb_no_retiro=create rb_no_retiro
this.rb_obi_dia=create rb_obi_dia
this.gb_1=create gb_1
this.Control[]={this.cb_aceptar,&
this.cb_cerrar,&
this.rb_capilla_imple,&
this.rb_no_retiro,&
this.rb_obi_dia,&
this.gb_1}
end on

on w_listados_secretaria.destroy
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.rb_capilla_imple)
destroy(this.rb_no_retiro)
destroy(this.rb_obi_dia)
destroy(this.gb_1)
end on

event open;gf_centrar(w_listados_secretaria)

end event

type cb_aceptar from commandbutton within w_listados_secretaria
integer x = 32
integer y = 620
integer width = 279
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;if rb_obi_dia.checked = true then
	if isvalid(w_listado_obiturario_dia) then close(w_listado_obiturario_dia)
	open(w_listado_obiturario_dia)
elseif 	rb_no_retiro.checked = true then
	if isvalid(w_solicitud_no_retiro) then close(w_solicitud_no_retiro)
	open(w_solicitud_no_retiro)
elseif 	rb_capilla_imple.checked = true then
	if isvalid(w_solicitud_no_retiro) then close(w_solicitud_no_retiro)
	open(w_imprimir_documentos_parques)
end if
end event

type cb_cerrar from commandbutton within w_listados_secretaria
integer x = 837
integer y = 620
integer width = 279
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listados_secretaria)
end event

type rb_capilla_imple from radiobutton within w_listados_secretaria
integer x = 96
integer y = 404
integer width = 951
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Implementación/Uso Capilla"
end type

type rb_no_retiro from radiobutton within w_listados_secretaria
integer x = 96
integer y = 280
integer width = 951
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud de Retiro"
end type

type rb_obi_dia from radiobutton within w_listados_secretaria
integer x = 96
integer y = 156
integer width = 951
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Obituario del Día"
end type

type gb_1 from groupbox within w_listados_secretaria
integer x = 41
integer y = 20
integer width = 1074
integer height = 544
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informes Administracióm"
end type

