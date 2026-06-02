forward
global type w_menu_informes_ventas from window
end type
type rb_conven_estado from radiobutton within w_menu_informes_ventas
end type
type rb_estadistica_vtas from radiobutton within w_menu_informes_ventas
end type
type rb_comision_compartida from radiobutton within w_menu_informes_ventas
end type
type rb_resumen_cierre_vta from radiobutton within w_menu_informes_ventas
end type
type rb_doctos_pendiente from radiobutton within w_menu_informes_ventas
end type
type rb_lista_rezago from radiobutton within w_menu_informes_ventas
end type
type rb_clasificacion_vta from radiobutton within w_menu_informes_ventas
end type
type rb_pagos_ventas from radiobutton within w_menu_informes_ventas
end type
type rb_convencion from radiobutton within w_menu_informes_ventas
end type
type cb_aceptar from commandbutton within w_menu_informes_ventas
end type
type rb_comision_revisión from radiobutton within w_menu_informes_ventas
end type
type st_1 from statictext within w_menu_informes_ventas
end type
type rb_sales_meeting from radiobutton within w_menu_informes_ventas
end type
type rb_cartera_mora from radiobutton within w_menu_informes_ventas
end type
type rb_clasificacion from radiobutton within w_menu_informes_ventas
end type
type cb_cerrar from commandbutton within w_menu_informes_ventas
end type
type gb_1 from groupbox within w_menu_informes_ventas
end type
end forward

global type w_menu_informes_ventas from window
integer width = 2350
integer height = 1236
boolean titlebar = true
string title = "Informes Gestión Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_conven_estado rb_conven_estado
rb_estadistica_vtas rb_estadistica_vtas
rb_comision_compartida rb_comision_compartida
rb_resumen_cierre_vta rb_resumen_cierre_vta
rb_doctos_pendiente rb_doctos_pendiente
rb_lista_rezago rb_lista_rezago
rb_clasificacion_vta rb_clasificacion_vta
rb_pagos_ventas rb_pagos_ventas
rb_convencion rb_convencion
cb_aceptar cb_aceptar
rb_comision_revisión rb_comision_revisión
st_1 st_1
rb_sales_meeting rb_sales_meeting
rb_cartera_mora rb_cartera_mora
rb_clasificacion rb_clasificacion
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_menu_informes_ventas w_menu_informes_ventas

type variables
long il_row
end variables

on w_menu_informes_ventas.create
this.rb_conven_estado=create rb_conven_estado
this.rb_estadistica_vtas=create rb_estadistica_vtas
this.rb_comision_compartida=create rb_comision_compartida
this.rb_resumen_cierre_vta=create rb_resumen_cierre_vta
this.rb_doctos_pendiente=create rb_doctos_pendiente
this.rb_lista_rezago=create rb_lista_rezago
this.rb_clasificacion_vta=create rb_clasificacion_vta
this.rb_pagos_ventas=create rb_pagos_ventas
this.rb_convencion=create rb_convencion
this.cb_aceptar=create cb_aceptar
this.rb_comision_revisión=create rb_comision_revisión
this.st_1=create st_1
this.rb_sales_meeting=create rb_sales_meeting
this.rb_cartera_mora=create rb_cartera_mora
this.rb_clasificacion=create rb_clasificacion
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.rb_conven_estado,&
this.rb_estadistica_vtas,&
this.rb_comision_compartida,&
this.rb_resumen_cierre_vta,&
this.rb_doctos_pendiente,&
this.rb_lista_rezago,&
this.rb_clasificacion_vta,&
this.rb_pagos_ventas,&
this.rb_convencion,&
this.cb_aceptar,&
this.rb_comision_revisión,&
this.st_1,&
this.rb_sales_meeting,&
this.rb_cartera_mora,&
this.rb_clasificacion,&
this.cb_cerrar,&
this.gb_1}
end on

on w_menu_informes_ventas.destroy
destroy(this.rb_conven_estado)
destroy(this.rb_estadistica_vtas)
destroy(this.rb_comision_compartida)
destroy(this.rb_resumen_cierre_vta)
destroy(this.rb_doctos_pendiente)
destroy(this.rb_lista_rezago)
destroy(this.rb_clasificacion_vta)
destroy(this.rb_pagos_ventas)
destroy(this.rb_convencion)
destroy(this.cb_aceptar)
destroy(this.rb_comision_revisión)
destroy(this.st_1)
destroy(this.rb_sales_meeting)
destroy(this.rb_cartera_mora)
destroy(this.rb_clasificacion)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;string	ls_est_conv
gf_centrar(w_menu_informes_ventas)

SELECT	"ENCARGADOS"."ACCESO_CONVENIO"  
INTO		:ls_est_conv  
FROM		"ENCARGADOS"  
WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;
if ls_est_conv = 'A' then
	rb_conven_estado.enabled				= true
else
	rb_conven_estado.enabled				= false
end if	
if gs_depto = 'I' or gs_depto = 'G' or gs_depto = 'D' or gs_depto = '2' or gs_depto = 'Z' then
	rb_cartera_mora.enabled				= true
	rb_clasificacion_vta.enabled				= true
	rb_lista_rezago.enabled					= true
	rb_doctos_pendiente.enabled			= true
	rb_resumen_cierre_vta.enabled		= true
	rb_comision_revisión.enabled			= true
	rb_clasificacion.enabled					= true
	rb_sales_meeting.enabled				= true
	rb_convencion.enabled					= true
	rb_pagos_ventas.enabled				= true
	rb_comision_compartida.enabled		= true
	rb_estadistica_vtas.enabled				= true
elseif gs_depto = 'X' then
	rb_cartera_mora.enabled				= true
	rb_clasificacion_vta.enabled				= true
	rb_lista_rezago.enabled					= true
	rb_doctos_pendiente.enabled			= true
	rb_resumen_cierre_vta.enabled		= true
	rb_comision_compartida.enabled		= true
	rb_estadistica_vtas.enabled				= true
	rb_comision_revisión.enabled			= true
	rb_clasificacion.enabled					= true
	rb_sales_meeting.enabled				= true
	rb_convencion.enabled					= true
	rb_pagos_ventas.enabled				= true
elseif gs_depto = 'O' or gs_depto = 'E' then
	rb_cartera_mora.enabled				= true
	rb_clasificacion_vta.enabled				= true
	rb_lista_rezago.enabled					= true
	rb_doctos_pendiente.enabled			= true
	rb_resumen_cierre_vta.enabled		= true
	rb_comision_revisión.enabled			= false
	rb_clasificacion.enabled					= false
	rb_sales_meeting.enabled				= false
	rb_convencion.enabled					= false
	rb_pagos_ventas.enabled				= false
	rb_comision_compartida.enabled		= false
	rb_estadistica_vtas.enabled				= true
elseif gs_depto = 'P' then
	rb_cartera_mora.enabled				= true
	rb_clasificacion_vta.enabled				= true
	rb_lista_rezago.enabled					= true
	rb_doctos_pendiente.enabled			= true
	rb_resumen_cierre_vta.enabled		= true
	rb_comision_revisión.enabled			= false
	rb_clasificacion.enabled					= false
	rb_sales_meeting.enabled				= false
	rb_convencion.enabled					= false
	rb_pagos_ventas.enabled				= false
	rb_comision_compartida.enabled		= true
	rb_estadistica_vtas.enabled				= true
elseif gs_depto = 'B' or gs_depto = 'R' or gs_depto = 'V' or gs_depto = 'U' then
	if gs_depto <> 'R' then
		rb_estadistica_vtas.enabled			= true
	else
		rb_estadistica_vtas.enabled			= false
	end if
	rb_cartera_mora.enabled				= true
	rb_clasificacion_vta.enabled				= true
	rb_lista_rezago.enabled					= true
	rb_doctos_pendiente.enabled			= true
	rb_resumen_cierre_vta.enabled		= true
	rb_comision_revisión.enabled			= true
	rb_clasificacion.enabled					= true
	rb_sales_meeting.enabled				= true
	rb_convencion.enabled					= true
	rb_pagos_ventas.enabled				= true
	rb_comision_compartida.enabled		= false
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_menu_informes_ventas)
end if
end event

type rb_conven_estado from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 712
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Estado Convenio"
end type

type rb_estadistica_vtas from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 796
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estadística Ventas"
end type

type rb_comision_compartida from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 712
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comisión Compartida"
end type

type rb_resumen_cierre_vta from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 628
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen Cierre Ventas"
end type

type rb_doctos_pendiente from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 544
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos Pendientes"
end type

type rb_lista_rezago from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 460
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rezago Pendientes "
end type

type rb_clasificacion_vta from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 376
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clasificación por Ventas"
end type

type rb_pagos_ventas from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 628
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagos Ventas"
end type

type rb_convencion from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 544
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado Convención"
end type

type cb_aceptar from commandbutton within w_menu_informes_ventas
integer x = 59
integer y = 964
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

event clicked;if rb_cartera_mora.checked= true then
	if isvalid(w_cartera_morosa) then close(w_cartera_morosa)
	open(w_cartera_morosa)

elseif rb_clasificacion_vta.checked= true then
	if isvalid(w_clasifica_venta_crea) then close(w_clasifica_venta_crea)
	open(w_clasifica_venta_crea)	

elseif rb_lista_rezago.checked= true then
	if isvalid(w_rezago_promesa_pend) then close(w_rezago_promesa_pend)
	open(w_rezago_promesa_pend)	

elseif rb_comision_revisión.checked= true then
	if isvalid(w_comision_pendiente) then close(w_comision_pendiente)
	open(w_comision_pendiente)

elseif rb_clasificacion.checked= true then
	if isvalid(w_persistencia_superv) then close(w_persistencia_superv)
	open(w_persistencia_superv)
	
elseif rb_sales_meeting.checked= true then
	if isvalid(w_sales_meeting) then close(w_sales_meeting)
	open(w_sales_meeting)

elseif rb_convencion.checked= true then
	if isvalid(w_convencion) then close(w_convencion)
	open(w_convencion)

elseif rb_pagos_ventas.checked= true then
	if isvalid(w_menu_pagos_ventas) then close(w_menu_pagos_ventas)
	open(w_menu_pagos_ventas)
	
elseif rb_doctos_pendiente.checked= true then
	if isvalid(w_docto_pendiente_estructura) then close(w_docto_pendiente_estructura)
	open(w_docto_pendiente_estructura)
	
elseif rb_resumen_cierre_vta.checked= true then
	if isvalid(w_resumen_cierre_ventas) then close(w_resumen_cierre_ventas)
	open(w_resumen_cierre_ventas)	

elseif rb_comision_compartida.checked= true then
	if isvalid(w_comision_compartida) then close(w_comision_compartida)
	open(w_comision_compartida)
	
elseif rb_estadistica_vtas.checked= true then
	if isvalid(w_estadistica_ventas_resumen) then close(w_estadistica_ventas_resumen)
	open(w_estadistica_ventas_resumen)

elseif rb_conven_estado.checked= true then
	if isvalid(w_lista_convenios_sup) then close(w_lista_convenios_sup)
	open(w_lista_convenios_sup)	
end if
end event

type rb_comision_revisión from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 292
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revisión Comisiones Pendientes"
end type

type st_1 from statictext within w_menu_informes_ventas
integer x = 59
integer y = 56
integer width = 2208
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informes Gestión Ventas"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_sales_meeting from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 460
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sales Meeting"
end type

type rb_cartera_mora from radiobutton within w_menu_informes_ventas
integer x = 137
integer y = 292
integer width = 974
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cartera en Mora"
boolean checked = true
end type

type rb_clasificacion from radiobutton within w_menu_informes_ventas
integer x = 1147
integer y = 376
integer width = 1047
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clasificación (Mora 5 7)"
end type

type cb_cerrar from commandbutton within w_menu_informes_ventas
integer x = 1938
integer y = 964
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

event clicked;close(w_menu_informes_ventas)
end event

type gb_1 from groupbox within w_menu_informes_ventas
integer x = 59
integer y = 152
integer width = 2208
integer height = 748
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

