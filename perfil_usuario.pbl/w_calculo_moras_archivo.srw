forward
global type w_calculo_moras_archivo from window
end type
type cb_limpiar from commandbutton within w_calculo_moras_archivo
end type
type cb_filtrar from commandbutton within w_calculo_moras_archivo
end type
type cb_ordenar from commandbutton within w_calculo_moras_archivo
end type
type cb_imprimir from commandbutton within w_calculo_moras_archivo
end type
type cb_exportar from commandbutton within w_calculo_moras_archivo
end type
type cb_proceso from commandbutton within w_calculo_moras_archivo
end type
type cb_cerrar from commandbutton within w_calculo_moras_archivo
end type
type dw_calculo from datawindow within w_calculo_moras_archivo
end type
end forward

global type w_calculo_moras_archivo from window
integer width = 3013
integer height = 1728
boolean titlebar = true
string title = "Calculo de Moras (Crédito / Mantención)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_proceso cb_proceso
cb_cerrar cb_cerrar
dw_calculo dw_calculo
end type
global w_calculo_moras_archivo w_calculo_moras_archivo

on w_calculo_moras_archivo.create
this.cb_limpiar=create cb_limpiar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_proceso=create cb_proceso
this.cb_cerrar=create cb_cerrar
this.dw_calculo=create dw_calculo
this.Control[]={this.cb_limpiar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_proceso,&
this.cb_cerrar,&
this.dw_calculo}
end on

on w_calculo_moras_archivo.destroy
destroy(this.cb_limpiar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_proceso)
destroy(this.cb_cerrar)
destroy(this.dw_calculo)
end on

event open;gf_centrar(w_calculo_moras_archivo)
end event

type cb_limpiar from commandbutton within w_calculo_moras_archivo
integer x = 1609
integer y = 1476
integer width = 274
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_calculo.reset()
end event

type cb_filtrar from commandbutton within w_calculo_moras_archivo
integer x = 1262
integer y = 1476
integer width = 274
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_calculo.SETfilter(NULO)
dw_calculo.filter()

end event

type cb_ordenar from commandbutton within w_calculo_moras_archivo
integer x = 983
integer y = 1476
integer width = 274
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_calculo.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_calculo.SETSORT(NULO)
	dw_calculo.SORT()
end if

end event

type cb_imprimir from commandbutton within w_calculo_moras_archivo
integer x = 704
integer y = 1476
integer width = 274
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_calculo.rowcount() > 0 then
	f_Print( dw_calculo )
end if

end event

type cb_exportar from commandbutton within w_calculo_moras_archivo
integer x = 425
integer y = 1476
integer width = 274
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_calculo
if dw_calculo.rowcount() > 0 then f_DWToExcel( dw_paso )


end event

type cb_proceso from commandbutton within w_calculo_moras_archivo
integer x = 37
integer y = 1476
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso"
end type

event clicked;string	null_str,ls_base,ls_serie
Long		ll_tot_reg,ll_indi,ll_total_ctas,ll_ctas_pag,ret,ll_ctas_pag_mant,&
			ret1,ret11
Double	ll_numero
datetime	ld_fecha_prim,ld_fecha_tope,ld_fecha_mant,ld_fecha_corte_mant
dw_calculo.reset()
SetNull(null_str)
dw_calculo.ImportFile(null_str)
ll_tot_reg					= dw_calculo.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_base					= dw_calculo.getitemstring(ll_indi,'base')
	ls_serie					= dw_calculo.getitemstring(ll_indi,'serie')
	ll_numero				= dw_calculo.getitemnumber(ll_indi,'numero')
	ld_fecha_prim			= dw_calculo.getitemdatetime(ll_indi,'fecha_prim')
	ld_fecha_tope			= dw_calculo.getitemdatetime(ll_indi,'fecha_corte_credito')
	ll_total_ctas			= dw_calculo.getitemnumber(ll_indi,'nro_cuotas_credito')
	ll_ctas_pag				= dw_calculo.getitemnumber(ll_indi,'ctas_pagadas_credito')
	// mora credito
	RET 						= funcion_mora_importar(ld_fecha_prim,ll_ctas_pag,ll_total_ctas,ld_fecha_tope)
	dw_calculo.setitem(ll_indi,'mora_credito',ret)
	// mora mantencion
	ld_fecha_mant			= dw_calculo.getitemdatetime(ll_indi,'fecha_mant')
	ll_ctas_pag_mant		= dw_calculo.getitemnumber(ll_indi,'ctas_pagadas_mant')
	ld_fecha_corte_mant	= dw_calculo.getitemdatetime(ll_indi,'fecha_corte_mant')
	ret1 						= f_mant (ld_fecha_mant, ll_ctas_pag_mant)
	ret11 					= -daysafter(date(ld_fecha_corte_mant),funcion_venc_ano( ld_fecha_mant , ll_ctas_pag_mant  ))
	if ret11 < 0 then 
		ret1					= 0
	end if
	dw_calculo.setitem(ll_indi,'mora_mant',ret1)
next
end event

type cb_cerrar from commandbutton within w_calculo_moras_archivo
integer x = 2633
integer y = 1476
integer width = 293
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_calculo_moras_archivo)
end event

type dw_calculo from datawindow within w_calculo_moras_archivo
integer x = 37
integer y = 32
integer width = 2889
integer height = 1408
integer taborder = 10
string title = "none"
string dataobject = "dw_calculo_mora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

