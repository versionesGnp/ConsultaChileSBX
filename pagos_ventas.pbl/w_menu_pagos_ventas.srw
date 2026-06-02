forward
global type w_menu_pagos_ventas from window
end type
type rb_mejores from radiobutton within w_menu_pagos_ventas
end type
type rb_premio_calidad_cartera from radiobutton within w_menu_pagos_ventas
end type
type rb_premio_1%_superv from radiobutton within w_menu_pagos_ventas
end type
type cb_aceptar from commandbutton within w_menu_pagos_ventas
end type
type rb_comision_pagada from radiobutton within w_menu_pagos_ventas
end type
type cb_cerrar from commandbutton within w_menu_pagos_ventas
end type
end forward

global type w_menu_pagos_ventas from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Pagos Ventas"
string menuname = "m_menu_pagos_ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_mejores rb_mejores
rb_premio_calidad_cartera rb_premio_calidad_cartera
rb_premio_1%_superv rb_premio_1%_superv
cb_aceptar cb_aceptar
rb_comision_pagada rb_comision_pagada
cb_cerrar cb_cerrar
end type
global w_menu_pagos_ventas w_menu_pagos_ventas

type variables
long il_row
end variables

on w_menu_pagos_ventas.create
if this.MenuName = "m_menu_pagos_ventas" then this.MenuID = create m_menu_pagos_ventas
this.rb_mejores=create rb_mejores
this.rb_premio_calidad_cartera=create rb_premio_calidad_cartera
this.rb_premio_1%_superv=create rb_premio_1%_superv
this.cb_aceptar=create cb_aceptar
this.rb_comision_pagada=create rb_comision_pagada
this.cb_cerrar=create cb_cerrar
this.Control[]={this.rb_mejores,&
this.rb_premio_calidad_cartera,&
this.rb_premio_1%_superv,&
this.cb_aceptar,&
this.rb_comision_pagada,&
this.cb_cerrar}
end on

on w_menu_pagos_ventas.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_mejores)
destroy(this.rb_premio_calidad_cartera)
destroy(this.rb_premio_1%_superv)
destroy(this.cb_aceptar)
destroy(this.rb_comision_pagada)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_menu_pagos_ventas)

if gs_depto='R' or gs_depto='B' or gs_depto='I' or gs_depto='D' or gs_depto='G' or gs_depto='O' or gs_depto='Z' or gs_depto='2' then	
	m_menu_pagos_ventas.m_comisiones.visible				= true
	m_menu_pagos_ventas.m_premios.visible					= true
else
	m_menu_pagos_ventas.m_comisiones.visible				= true
	m_menu_pagos_ventas.m_premios.visible					= false
end if


end event

type rb_mejores from radiobutton within w_menu_pagos_ventas
boolean visible = false
integer x = 78
integer y = 2016
integer width = 960
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Premios Mejores"
end type

type rb_premio_calidad_cartera from radiobutton within w_menu_pagos_ventas
boolean visible = false
integer x = 78
integer y = 1832
integer width = 960
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Premios Calidad Cartera"
end type

type rb_premio_1%_superv from radiobutton within w_menu_pagos_ventas
boolean visible = false
integer x = 78
integer y = 1924
integer width = 960
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Premios 1 % para Supervisores"
end type

type cb_aceptar from commandbutton within w_menu_pagos_ventas
boolean visible = false
integer x = 1298
integer y = 2008
integer width = 329
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if rb_comision_pagada.checked= true then
	if gs_depto = 'B' or gs_depto = 'R' or gs_depto = 'X' then
		if isvalid(w_comision_pagadas) then close(w_comision_pagadas)
		open(w_comision_pagadas)
	elseif gs_depto = 'I' or gs_depto = 'V' or gs_depto = 'D' or gs_depto = 'O' or gs_depto = 'Z' or gs_depto = '2' then
		if isvalid(w_comision_area_ventas) then close(w_comision_area_ventas)
		open(w_comision_area_ventas)
	end if
elseif rb_premio_calidad_cartera.checked= true then
	if isvalid(w_premios_calidad_cartera_sup) then close(w_premios_calidad_cartera_sup)
	open(w_premios_calidad_cartera_sup)
elseif rb_premio_1%_superv.checked= true then
	if isvalid(w_premios_sup_uno_x_cien_pagos) then close(w_premios_sup_uno_x_cien_pagos)
	open(w_premios_sup_uno_x_cien_pagos)
elseif rb_mejores.checked= true then
	if isvalid(w_premios_mejores) then close(w_premios_mejores)
	open(w_premios_mejores)	
end if
end event

type rb_comision_pagada from radiobutton within w_menu_pagos_ventas
boolean visible = false
integer x = 78
integer y = 1740
integer width = 960
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impresión Comisiones Pagadas"
boolean checked = true
end type

type cb_cerrar from commandbutton within w_menu_pagos_ventas
integer x = 2971
integer y = 1560
integer width = 329
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_menu_pagos_ventas)
end event

