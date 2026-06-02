forward
global type w_a_sectores from window
end type
type cb_8 from commandbutton within w_a_sectores
end type
type dw_a_sector_planimetria from datawindow within w_a_sectores
end type
type cb_6 from commandbutton within w_a_sectores
end type
type cb_5 from commandbutton within w_a_sectores
end type
type cb_4 from commandbutton within w_a_sectores
end type
type cb_3 from commandbutton within w_a_sectores
end type
type cb_fallecidos from commandbutton within w_a_sectores
end type
type cb_2 from commandbutton within w_a_sectores
end type
type st_1 from statictext within w_a_sectores
end type
type cb_1 from commandbutton within w_a_sectores
end type
end forward

global type w_a_sectores from window
integer x = 1335
integer y = 684
integer width = 3109
integer height = 1716
boolean titlebar = true
string title = "Listado por sector"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 77571519
cb_8 cb_8
dw_a_sector_planimetria dw_a_sector_planimetria
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_fallecidos cb_fallecidos
cb_2 cb_2
st_1 st_1
cb_1 cb_1
end type
global w_a_sectores w_a_sectores

on w_a_sectores.create
this.cb_8=create cb_8
this.dw_a_sector_planimetria=create dw_a_sector_planimetria
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_fallecidos=create cb_fallecidos
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.cb_8,&
this.dw_a_sector_planimetria,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_fallecidos,&
this.cb_2,&
this.st_1,&
this.cb_1}
end on

on w_a_sectores.destroy
destroy(this.cb_8)
destroy(this.dw_a_sector_planimetria)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_fallecidos)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;integer i, ret2

gf_centrar(w_a_sectores)

string estado_cadena
//dw_a_sector_planimetria.DataObject = 'a_sector_planimetria'

dw_a_sector_planimetria.SetTransObject(SQLCA)
dw_a_sector_planimetria.Retrieve(gs_sector)

if dw_a_sector_planimetria.rowcount() > 0 then
	for i =1 to dw_a_sector_planimetria.rowcount()
		
	gs_base = dw_a_sector_planimetria.GetItemString(i, "base")
	gs_serie = dw_a_sector_planimetria.GetItemString(i, "serie")
	gi_numero = dw_a_sector_planimetria.GetItemNumber(i, "nro_contrato")
	
//	estado_cadena=f_cadena(gs_base, gs_serie, gi_numero)		
//	dw_a_sector_planimetria.setitem(i,'estado_c',estado_cadena)
	
//	ret2 = f_fallecido(gs_serie, gi_numero, gs_base)	
//	if ret2 <= 0 then
//		dw_a_sector_planimetria.setitem(i,'fallecido',0)
//	   else	
//		dw_a_sector_planimetria.setitem(i,'fallecido',ret2)			
//	end if
//
		
//		fecha_prim = dw_listado_ofertas.getitemdatetime(i,'pago_oferta_fecha_prim')
//		cta_pag_s  = dw_listado_ofertas.getitemnumber(i,'oferta_v_cta_pag_s')
//		nro_cuotas = dw_listado_ofertas.getitemnumber(i,'pago_oferta_nro_cuotas')		
//		fecha_man  = dw_listado_ofertas.getitemdatetime(i,'oferta_v_fecha_m')
//		cta_pag_m  = dw_listado_ofertas.getitemnumber(i,'oferta_v_cta_pag_m')
//		serie      = dw_listado_ofertas.getitemstring(i,'oferta_v_serie')
//   	numero     = dw_listado_ofertas.getitemnumber(i,'oferta_v_nro_oferta')
//		RET = funcion_mora(fecha_prim,cta_pag_s,nro_cuotas)
//		ret1 = f_mant (fecha_man, cta_pag_m)
//		ret11 =-daysafter(today(),funcion_venc_ano( fecha_man , cta_pag_m  ))
//		if ret11 < 0 then 
//			ret1=0
//		end if
//		ret2 = f_fallecido(serie, numero, base)
//		if ret <= 0 then
//			dw_listado_ofertas.setitem(i,'mora_cta',0)
//		else	
//			dw_listado_ofertas.setitem(i,'mora_cta',ret)			
//		end if	
//		if ret1 <= 0 then
//			dw_listado_ofertas.setitem(i,'mora_man',0)
//		else	
//			dw_listado_ofertas.setitem(i,'mora_man',ret1)			
//		end if	
//		if ret2 <= 0 then
//			dw_listado_ofertas.setitem(i,'fallecido',0)
//		else	
//			dw_listado_ofertas.setitem(i,'fallecido',ret2)			
//		end if
//		w_espera.st_i.text="Reg. Leidos "+ string(i) +" de " + string(cuenta)		
	next
end if	
//Close(w_espera)
//st_1.text = String(ll_total_ofertas,"###,###,###") + " Ofertas"
//setpointer(arrow!)



//dw_a_sector_planimetria.SetTransObject(SQLCA)
//dw_a_sector_planimetria.Retrieve(gs_sector)

end event

type cb_8 from commandbutton within w_a_sectores
event clicked pbm_bnclicked
integer x = 1659
integer y = 1436
integer width = 274
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "F&iltrar"
end type

event clicked;
string nulo
setnull (nulo)
dw_a_sector_planimetria.SETFILTER(NULO)
dw_a_sector_planimetria.FILTER()
end event

type dw_a_sector_planimetria from datawindow within w_a_sectores
integer x = 55
integer y = 196
integer width = 2944
integer height = 1180
integer taborder = 10
boolean titlebar = true
string dataobject = "a_sector_planimetria_join"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base = This.GetItemString(row, "base")
	gs_serie = This.GetItemString(row, "serie")
	gi_numero = This.GetItemNumber(row, "nro_contrato")

	gi_rut=f_cadena_rut(gs_base, gs_serie, gi_numero)
	rutx=gi_rut
	cb_fallecidos.enabled = f_fallecido(gs_serie, gi_numero, gs_base) > 0
END IF
end event

type cb_6 from commandbutton within w_a_sectores
integer x = 1381
integer y = 1436
integer width = 274
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;
string nulo
setnull (nulo)
dw_a_sector_planimetria.SETSORT(NULO)
dw_a_sector_planimetria.SORT()
end event

type cb_5 from commandbutton within w_a_sectores
integer x = 1079
integer y = 1436
integer width = 297
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "x &Rut"
end type

event clicked;

//gi_rut = dw_listado_ofertas.getitemnumber(dw_listado_ofertas.getrow(),'cadena_rut')
gi_tipo_busqueda = 1

open(w_listado_contratos)
end event

type cb_4 from commandbutton within w_a_sectores
integer x = 1938
integer y = 1436
integer width = 274
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprime"
end type

event clicked;integer Net

Net = MessageBox("Imprimir" , "Desea imprimir ", Exclamation!, OKCancel!, 2)
IF Net = 1 THEN 

IF PrintSetup( ) <> -1 THEN
	dw_a_sector_planimetria.Print()
END IF
end if
end event

type cb_3 from commandbutton within w_a_sectores
integer x = 389
integer y = 1436
integer width = 320
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ontrato"
end type

event clicked;CHOOSE CASE gs_base
	CASE "O" // Oferta
		Open(w_datos_contrato_oferta)
	CASE "L" // Anexo Liberador
		Open(w_datos_contrato_liberador)
END CHOOSE


end event

type cb_fallecidos from commandbutton within w_a_sectores
integer x = 709
integer y = 1436
integer width = 366
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;	Open(w_listado_fallecidos)
end event

type cb_2 from commandbutton within w_a_sectores
integer x = 64
integer y = 1436
integer width = 320
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta.Cte"
end type

event clicked;



CHOOSE CASE gs_base
	CASE "O" // Oferta
		Open(w_cuenta_corriente_oferta)
	CASE "L" // Anexo Liberador
		Open(w_cuenta_corriente_liberador)
	CASE "P" // Pagaré
		Open(w_cuenta_corriente_pagare)
	CASE "C" // Contrato ISA	
		Open(w_cuenta_corriente_contrato_isa)
	CASE "D" // Derecho Especial
		Open(w_cuenta_corriente_derecho)
END CHOOSE

end event

type st_1 from statictext within w_a_sectores
integer x = 73
integer y = 28
integer width = 1358
integer height = 148
integer textsize = -20
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Sepulturas Asignadas "
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_a_sectores
integer x = 2706
integer y = 1436
integer width = 279
integer height = 104
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_a_sectores)
end event

