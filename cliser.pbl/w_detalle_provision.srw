forward
global type w_detalle_provision from window
end type
type cb_filtrar from commandbutton within w_detalle_provision
end type
type cb_cuenta_corr from commandbutton within w_detalle_provision
end type
type cb_cerrar from commandbutton within w_detalle_provision
end type
type cb_limpiar from commandbutton within w_detalle_provision
end type
type cb_2 from commandbutton within w_detalle_provision
end type
type cb_imprimir from commandbutton within w_detalle_provision
end type
type dw_lista from datawindow within w_detalle_provision
end type
type gb_1 from groupbox within w_detalle_provision
end type
end forward

global type w_detalle_provision from window
integer width = 3040
integer height = 1852
boolean titlebar = true
string title = "Detalle Provisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_filtrar cb_filtrar
cb_cuenta_corr cb_cuenta_corr
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_provision w_detalle_provision

type variables
long il_row
end variables

on w_detalle_provision.create
this.cb_filtrar=create cb_filtrar
this.cb_cuenta_corr=create cb_cuenta_corr
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar,&
this.cb_cuenta_corr,&
this.cb_cerrar,&
this.cb_limpiar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_provision.destroy
destroy(this.cb_filtrar)
destroy(this.cb_cuenta_corr)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;string	ls_base
date	ld_fech_cierre
long	ll_porce_ini,ll_porce_fin,ll_cod_parque,ll_falle

gf_centrar(w_detalle_provision)

ld_fech_cierre					= date(substr(1,1,Message.StringParm))
ll_cod_parque					= Long(substr(1,2,Message.StringParm))
ls_base							= substr(1,3,Message.StringParm)
ll_porce_ini						= Long(substr(1,4,Message.StringParm))
ll_porce_fin						= Long(substr(1,5,Message.StringParm))
ll_falle							= Long(substr(1,6,Message.StringParm))

if ll_falle = 0 then
	dw_lista.dataobject = 'dw_detalle_prov_mant'
else
	dw_lista.dataobject = 'dw_detalle_prov_mant_cf'
end if	
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
if not isnull(ld_fech_cierre) and not isnull(ll_cod_parque) and not isnull(ls_base) then
	dw_lista.retrieve(ld_fech_cierre,ll_cod_parque,ls_base,ll_porce_ini,ll_porce_fin,ll_falle)
end if	
end event

type cb_filtrar from commandbutton within w_detalle_provision
integer x = 1467
integer y = 1624
integer width = 265
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_cuenta_corr from commandbutton within w_detalle_provision
integer x = 32
integer y = 1624
integer width = 416
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

event clicked;if dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'numero')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0  THEN
		CHOOSE CASE gs_base 
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato Valido")
	END IF
else
	messagebox("Advertencia","Debe Seleccionar Contrato")
end if
end event

type cb_cerrar from commandbutton within w_detalle_provision
integer x = 2729
integer y = 1624
integer width = 265
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

event clicked;close(w_detalle_provision)
end event

type cb_limpiar from commandbutton within w_detalle_provision
integer x = 1851
integer y = 1624
integer width = 265
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()

end event

type cb_2 from commandbutton within w_detalle_provision
integer x = 910
integer y = 1624
integer width = 265
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_detalle_provision
integer x = 1189
integer y = 1624
integer width = 265
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 90
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type dw_lista from datawindow within w_detalle_provision
integer x = 32
integer y = 32
integer width = 2962
integer height = 1552
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_prov_mant"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event itemfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_detalle_provision
integer x = 891
integer y = 1580
integer width = 1243
integer height = 156
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

