forward
global type w_cobranza_historica from window
end type
type tab_1 from tab within w_cobranza_historica
end type
type tabpage_2 from userobject within tab_1
end type
type cb_imprimir_ct from commandbutton within tabpage_2
end type
type cb_exportar_ct from commandbutton within tabpage_2
end type
type cb_filtrar_ct from commandbutton within tabpage_2
end type
type cb_ordenar_ct from commandbutton within tabpage_2
end type
type cb_estado from commandbutton within tabpage_2
end type
type dw_cob_tele from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_imprimir_ct cb_imprimir_ct
cb_exportar_ct cb_exportar_ct
cb_filtrar_ct cb_filtrar_ct
cb_ordenar_ct cb_ordenar_ct
cb_estado cb_estado
dw_cob_tele dw_cob_tele
end type
type tabpage_3 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_3
end type
type cb_5 from commandbutton within tabpage_3
end type
type cb_4 from commandbutton within tabpage_3
end type
type cb_3 from commandbutton within tabpage_3
end type
type cb_publico from commandbutton within tabpage_3
end type
type dw_at_pub from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_7 cb_7
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_publico cb_publico
dw_at_pub dw_at_pub
end type
type tabpage_4 from userobject within tab_1
end type
type cb_11 from commandbutton within tabpage_4
end type
type cb_10 from commandbutton within tabpage_4
end type
type cb_9 from commandbutton within tabpage_4
end type
type cb_8 from commandbutton within tabpage_4
end type
type dw_at_terreno from datawindow within tabpage_4
end type
type cb_at_terreno from commandbutton within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_at_terreno dw_at_terreno
cb_at_terreno cb_at_terreno
end type
type tabpage_5 from userobject within tab_1
end type
type cb_15 from commandbutton within tabpage_5
end type
type cb_14 from commandbutton within tabpage_5
end type
type cb_13 from commandbutton within tabpage_5
end type
type cb_12 from commandbutton within tabpage_5
end type
type dw_cob_carta from datawindow within tabpage_5
end type
type cb_at_carta from commandbutton within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
dw_cob_carta dw_cob_carta
cb_at_carta cb_at_carta
end type
type tabpage_6 from userobject within tab_1
end type
type cb_19 from commandbutton within tabpage_6
end type
type cb_18 from commandbutton within tabpage_6
end type
type cb_17 from commandbutton within tabpage_6
end type
type cb_16 from commandbutton within tabpage_6
end type
type cb_parque from commandbutton within tabpage_6
end type
type dw_parque from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_parque cb_parque
dw_parque dw_parque
end type
type tab_1 from tab within w_cobranza_historica
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type
type cb_cd from commandbutton within w_cobranza_historica
end type
type cb_td from commandbutton within w_cobranza_historica
end type
type cb_postventa from commandbutton within w_cobranza_historica
end type
type dw_datos from datawindow within w_cobranza_historica
end type
type dw_4 from datawindow within w_cobranza_historica
end type
type cb_1 from commandbutton within w_cobranza_historica
end type
type cb_cerrar from commandbutton within w_cobranza_historica
end type
type cb_2 from commandbutton within w_cobranza_historica
end type
end forward

global type w_cobranza_historica from window
integer x = 1189
integer y = 556
integer width = 3017
integer height = 2352
boolean titlebar = true
string title = "Datos de Cobranza"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
tab_1 tab_1
cb_cd cb_cd
cb_td cb_td
cb_postventa cb_postventa
dw_datos dw_datos
dw_4 dw_4
cb_1 cb_1
cb_cerrar cb_cerrar
cb_2 cb_2
end type
global w_cobranza_historica w_cobranza_historica

on w_cobranza_historica.create
this.tab_1=create tab_1
this.cb_cd=create cb_cd
this.cb_td=create cb_td
this.cb_postventa=create cb_postventa
this.dw_datos=create dw_datos
this.dw_4=create dw_4
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.cb_2=create cb_2
this.Control[]={this.tab_1,&
this.cb_cd,&
this.cb_td,&
this.cb_postventa,&
this.dw_datos,&
this.dw_4,&
this.cb_1,&
this.cb_cerrar,&
this.cb_2}
end on

on w_cobranza_historica.destroy
destroy(this.tab_1)
destroy(this.cb_cd)
destroy(this.cb_td)
destroy(this.cb_postventa)
destroy(this.dw_datos)
destroy(this.dw_4)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.cb_2)
end on

event open;string 	ls_opera
Long		ll_tot_reg

gf_centrar(w_cobranza_historica)
CHOOSE CASE gs_base
	CASE 'O','U'
		dw_datos.dataobject	= 'dw_titulo_cobranza_promesa'
	CASE 'L'
		dw_datos.dataobject	= 'dw_titulo_cobranza_liberador'
	CASE 'P'
		dw_datos.dataobject	= 'dw_titulo_cobranza_pagare'
	CASE 'R'
		dw_datos.dataobject	= 'dw_titulo_cobranza_reprog_mant'
	CASE 'C'
		dw_datos.dataobject	= 'dw_titulo_cobranza_contrato_isacruz'
	CASE 'D'
		dw_datos.dataobject	= 'dw_titulo_cobranza_derecho'
	CASE 'A'
		dw_datos.dataobject	= 'dw_titulo_cobranza_aumento'
	CASE 'F'
		dw_datos.dataobject	= 'dw_titulo_cobranza_funeraria'
END CHOOSE
dw_datos.settransobject (sqlca)
dw_datos.retrieve(gs_base,gs_serie,gi_numero,gi_rut)
tab_1.tabpage_2.dw_cob_tele.settransobject (sqlca)
tab_1.tabpage_5.dw_cob_carta.settransobject (sqlca)
tab_1.tabpage_3.dw_at_pub.settransobject (sqlca)
tab_1.tabpage_4.dw_at_terreno.settransobject (sqlca)
dw_4.settransobject (sqlca)
tab_1.tabpage_6.dw_parque.settransobject (sqlca)
//telefonica
ll_tot_reg	= tab_1.tabpage_2.dw_cob_tele.retrieve (gi_rut)
if ll_tot_reg = 0 then	
	tab_1.tabpage_2.dw_cob_tele.dataobject 					= 'dw_no_hay_datos'
	dw_4.Object.rpt1.DataObject 	= "dw_no_hay_datos"
else
	dw_4.Object.rpt1.DataObject 	= "dw_cobranza_telefonica_1"
end if
//carta
ll_tot_reg	= tab_1.tabpage_5.dw_cob_carta.retrieve (gi_rut)
if ll_tot_reg = 0 then	
	tab_1.tabpage_5.dw_cob_carta.dataobject 					= 'dw_no_hay_datos'
	dw_4.Object.rpt2.DataObject 	= "dw_no_hay_datos"
else
	dw_4.Object.rpt2.DataObject 	= "dw_cobranza_carta_1"
end if
//publico
ll_tot_reg	= tab_1.tabpage_3.dw_at_pub.retrieve (gs_base,gs_serie,gi_numero)
if ll_tot_reg = 0 then	
	tab_1.tabpage_3.dw_at_pub.dataobject 					= 'dw_no_hay_datos'
	dw_4.Object.rpt3.DataObject 	= "dw_no_hay_datos"
else
	dw_4.Object.rpt3.DataObject 	= "dw_cobranza_atencion_pub_1"
end if
//Atencion Terreno
ll_tot_reg	= tab_1.tabpage_4.dw_at_terreno.retrieve (gi_rut)
if ll_tot_reg = 0 then	
	tab_1.tabpage_4.dw_at_terreno.dataobject 					= 'dw_no_hay_datos'
	dw_4.Object.rpt1.DataObject 	= "dw_no_hay_datos"
else
	dw_4.Object.rpt1.DataObject 	= "dw_cobranza_telefonica_1"
end if
//Parque
ll_tot_reg	= tab_1.tabpage_6.dw_parque.retrieve (gi_rut)
if ll_tot_reg = 0 then	
	tab_1.tabpage_6.dw_parque.dataobject 			= 'dw_no_hay_datos'
end if
dw_4.retrieve (gi_rut,gs_base,gs_serie,gi_numero)
if (gs_opera<>'0' and not isnull(gs_opera)) or gs_depto='E' then
	tab_1.tabpage_3.cb_publico.enabled 				= true
end if
if gs_depto='E' or gs_depto='O' or gs_depto='I' then
	tab_1.tabpage_4.cb_at_terreno.enabled			= true
else
	tab_1.tabpage_4.cb_at_terreno.enabled			= false
end if
if gs_opera<>'0' and not isnull(gs_opera) and gs_depto<>'E' then
	tab_1.tabpage_2.cb_estado.enabled 				= true
end if
if gs_depto='I' or gs_depto='P' or gs_digita='1' then
	cb_td.enabled											= true
	cb_cd.enabled											= true
else
	if gs_conexion	= "Parque La Foresta" and gs_depto='O' then
		cb_td.enabled										= true
		cb_cd.enabled										= true
	else
		cb_td.enabled										= false
		cb_cd.enabled										= false
	end if
end if
//JUAN
if gs_depto='S' or gs_depto='I' OR ( gs_conexion	= "Parque La Foresta" and (gs_depto='Q' OR gs_depto = 'W')) then
	tab_1.tabpage_6.cb_parque.enabled	= true
else
	tab_1.tabpage_6.cb_parque.enabled	= false
end if
gs_ventana								= 'w_cobranza_historica'
f_valida_objeto()
end event

type tab_1 from tab within w_cobranza_historica
event create ( )
event destroy ( )
integer x = 32
integer y = 448
integer width = 2935
integer height = 1640
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
end type

on tab_1.create
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.Control[]={this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6}
end on

on tab_1.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
end on

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2898
integer height = 1520
long backcolor = 80269524
string text = "Cobranza Telefónica"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_imprimir_ct cb_imprimir_ct
cb_exportar_ct cb_exportar_ct
cb_filtrar_ct cb_filtrar_ct
cb_ordenar_ct cb_ordenar_ct
cb_estado cb_estado
dw_cob_tele dw_cob_tele
end type

on tabpage_2.create
this.cb_imprimir_ct=create cb_imprimir_ct
this.cb_exportar_ct=create cb_exportar_ct
this.cb_filtrar_ct=create cb_filtrar_ct
this.cb_ordenar_ct=create cb_ordenar_ct
this.cb_estado=create cb_estado
this.dw_cob_tele=create dw_cob_tele
this.Control[]={this.cb_imprimir_ct,&
this.cb_exportar_ct,&
this.cb_filtrar_ct,&
this.cb_ordenar_ct,&
this.cb_estado,&
this.dw_cob_tele}
end on

on tabpage_2.destroy
destroy(this.cb_imprimir_ct)
destroy(this.cb_exportar_ct)
destroy(this.cb_filtrar_ct)
destroy(this.cb_ordenar_ct)
destroy(this.cb_estado)
destroy(this.dw_cob_tele)
end on

type cb_imprimir_ct from commandbutton within tabpage_2
integer x = 2587
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_cob_tele.rowcount() > 0 then dw_cob_tele.print()
end event

type cb_exportar_ct from commandbutton within tabpage_2
integer x = 2299
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_cob_tele
if dw_cob_tele.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_filtrar_ct from commandbutton within tabpage_2
integer x = 2011
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_cob_tele.SETfilter(NULO)
dw_cob_tele.filter()
end event

type cb_ordenar_ct from commandbutton within tabpage_2
integer x = 1723
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_cob_tele.rowcount() > 0 then
	setnull (nulo)
	dw_cob_tele.SETSORT(NULO)
	dw_cob_tele.SORT()
end if
end event

type cb_estado from commandbutton within tabpage_2
integer x = 27
integer y = 1392
integer width = 489
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gestión Telefónica"
end type

event clicked;//open(w_mensaje_cobranza_telefonica)
if isvalid(w_mensaje_cobranza_telefonica) then close(w_mensaje_cobranza_telefonica)
string 	param,ls_retorno
if gi_numero > 0 then
	param     			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	if gi_numero>0 then OpenWithParm(w_mensaje_cobranza_telefonica,param)
//	st_total_ct.text	= 'Total Registro:  '+string(dw_1.rowcount(),"###,###,###,##0")
else
	messagebox('Selección','Seleciones un Contrato.',information!)
end if
end event

type dw_cob_tele from datawindow within tabpage_2
integer x = 27
integer y = 36
integer width = 2843
integer height = 1324
integer taborder = 10
string title = "none"
string dataobject = "dw_cobranza_telefonica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;String	ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
Double	ll_numero
if row > 0 then
	ls_base		= dw_cob_tele.getitemstring(row,'base')
	ls_serie		= dw_cob_tele.getitemstring(row,'serie')
	ll_numero	= dw_cob_tele.getitemnumber(row,'numero')
	ls_estado	= dw_cob_tele.getitemstring(row,'estado')
	ldt_fecha		= dw_cob_tele.getitemdatetime(row,'fecha')
	ll_rut			= dw_cob_tele.getitemnumber(row,'rut')
	ls_string		= 'AT'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2898
integer height = 1520
long backcolor = 80269524
string text = "Atención Público"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_7 cb_7
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_publico cb_publico
dw_at_pub dw_at_pub
end type

on tabpage_3.create
this.cb_7=create cb_7
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_publico=create cb_publico
this.dw_at_pub=create dw_at_pub
this.Control[]={this.cb_7,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_publico,&
this.dw_at_pub}
end on

on tabpage_3.destroy
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_publico)
destroy(this.dw_at_pub)
end on

type cb_7 from commandbutton within tabpage_3
integer x = 2587
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_at_pub.rowcount() > 0 then dw_at_pub.print()
end event

type cb_5 from commandbutton within tabpage_3
integer x = 2299
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_at_pub
if dw_at_pub.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_4 from commandbutton within tabpage_3
integer x = 2011
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_at_pub.SETfilter(NULO)
dw_at_pub.filter()
end event

type cb_3 from commandbutton within tabpage_3
integer x = 1723
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_at_pub.rowcount() > 0 then
	setnull (nulo)
	dw_at_pub.SETSORT(NULO)
	dw_at_pub.SORT()
end if
end event

type cb_publico from commandbutton within tabpage_3
integer x = 27
integer y = 1392
integer width = 489
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gestión &Público"
end type

event clicked;if isvalid(w_mensaje_atencion_publico) then close(w_mensaje_atencion_publico)
open(w_mensaje_atencion_publico)
//st_total_cp.text	= 'Total Registro:  '+string(dw_at_pub.rowcount(),"###,###,###,##0")
end event

type dw_at_pub from datawindow within tabpage_3
integer x = 27
integer y = 36
integer width = 2843
integer height = 1324
integer taborder = 10
string title = "none"
string dataobject = "dw_cobranza_atencion_pub"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;String	ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
Double	ll_numero
if row > 0 then
	ls_base		= dw_at_pub.getitemstring(row,'base')
	ls_serie		= dw_at_pub.getitemstring(row,'serie')
	ll_numero	= dw_at_pub.getitemnumber(row,'numero')
	ls_estado	= dw_at_pub.getitemstring(row,'estado')
	ldt_fecha		= dw_at_pub.getitemdatetime(row,'fecha')
	ll_rut			= dw_at_pub.getitemnumber(row,'rut')
	ls_string		= 'AP'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2898
integer height = 1520
long backcolor = 80269524
string text = "Atención Terreno"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_at_terreno dw_at_terreno
cb_at_terreno cb_at_terreno
end type

on tabpage_4.create
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_at_terreno=create dw_at_terreno
this.cb_at_terreno=create cb_at_terreno
this.Control[]={this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.dw_at_terreno,&
this.cb_at_terreno}
end on

on tabpage_4.destroy
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_at_terreno)
destroy(this.cb_at_terreno)
end on

type cb_11 from commandbutton within tabpage_4
integer x = 2587
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_at_terreno.rowcount() > 0 then dw_at_terreno.print()
end event

type cb_10 from commandbutton within tabpage_4
integer x = 2299
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_at_terreno
if dw_at_terreno.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_9 from commandbutton within tabpage_4
integer x = 2011
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_at_terreno.SETfilter(NULO)
dw_at_terreno.filter()
end event

type cb_8 from commandbutton within tabpage_4
integer x = 1723
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_at_terreno.rowcount() > 0 then
	setnull (nulo)
	dw_at_terreno.SETSORT(NULO)
	dw_at_terreno.SORT()
end if
end event

type dw_at_terreno from datawindow within tabpage_4
integer x = 27
integer y = 36
integer width = 2843
integer height = 1324
integer taborder = 30
string title = "none"
string dataobject = "dw_cobranza_atencion_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;String		ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
Double	ll_numero
if row > 0 then
	ls_base		= dw_at_terreno.getitemstring(row,'atencion_log_base')
	ls_serie		= dw_at_terreno.getitemstring(row,'atencion_log_serie')
	ll_numero	= dw_at_terreno.getitemnumber(row,'atencion_log_numero')
	ls_estado	= dw_at_terreno.getitemstring(row,'atencion_log_estado')
	ldt_fecha		= dw_at_terreno.getitemdatetime(row,'atencion_log_fecha')
	ll_rut			= dw_at_terreno.getitemnumber(row,'atencion_log_rut')
	ls_string		= 'TE'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_at_terreno from commandbutton within tabpage_4
integer x = 27
integer y = 1392
integer width = 489
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gestión Terreno"
end type

event clicked;if isvalid(w_mensaje_atencion_terreno) then close(w_mensaje_atencion_terreno)
open(w_mensaje_atencion_terreno)
end event

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2898
integer height = 1520
long backcolor = 80269524
string text = "Cobranza Carta"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
dw_cob_carta dw_cob_carta
cb_at_carta cb_at_carta
end type

on tabpage_5.create
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.dw_cob_carta=create dw_cob_carta
this.cb_at_carta=create cb_at_carta
this.Control[]={this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.dw_cob_carta,&
this.cb_at_carta}
end on

on tabpage_5.destroy
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.dw_cob_carta)
destroy(this.cb_at_carta)
end on

type cb_15 from commandbutton within tabpage_5
integer x = 2587
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_cob_carta.rowcount() > 0 then dw_cob_carta.print()
end event

type cb_14 from commandbutton within tabpage_5
integer x = 2299
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_cob_carta
if dw_cob_carta.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_13 from commandbutton within tabpage_5
integer x = 2011
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_cob_carta.SETfilter(NULO)
dw_cob_carta.filter()
end event

type cb_12 from commandbutton within tabpage_5
integer x = 1723
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_cob_carta.rowcount() > 0 then
	setnull (nulo)
	dw_cob_carta.SETSORT(NULO)
	dw_cob_carta.SORT()
end if
end event

type dw_cob_carta from datawindow within tabpage_5
integer x = 27
integer y = 36
integer width = 2843
integer height = 1324
integer taborder = 20
string title = "none"
string dataobject = "dw_cobranza_carta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_at_carta from commandbutton within tabpage_5
boolean visible = false
integer x = 27
integer y = 1392
integer width = 489
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cobranza Carta"
end type

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2898
integer height = 1520
long backcolor = 80269524
string text = "Administración Parque"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_parque cb_parque
dw_parque dw_parque
end type

on tabpage_6.create
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_parque=create cb_parque
this.dw_parque=create dw_parque
this.Control[]={this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_parque,&
this.dw_parque}
end on

on tabpage_6.destroy
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_parque)
destroy(this.dw_parque)
end on

type cb_19 from commandbutton within tabpage_6
integer x = 2587
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_parque.rowcount() > 0 then dw_parque.print()
end event

type cb_18 from commandbutton within tabpage_6
integer x = 2299
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_parque
if dw_parque.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_17 from commandbutton within tabpage_6
integer x = 2011
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_parque.SETfilter(NULO)
dw_parque.filter()
end event

type cb_16 from commandbutton within tabpage_6
integer x = 1723
integer y = 1392
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_parque.rowcount() > 0 then
	setnull (nulo)
	dw_parque.SETSORT(NULO)
	dw_parque.SORT()
end if
end event

type cb_parque from commandbutton within tabpage_6
integer x = 27
integer y = 1392
integer width = 489
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gestión &Parque"
end type

event clicked;if isvalid(w_mensaje_atencion_parque) then close(w_mensaje_atencion_parque)
open(w_mensaje_atencion_parque)
end event

type dw_parque from datawindow within tabpage_6
integer x = 27
integer y = 36
integer width = 2843
integer height = 1324
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_detalle_atencion_parque"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;String		ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
Double	ll_numero
if row > 0 then
	ls_base		= dw_parque.getitemstring(row,'base')
	ls_serie		= dw_parque.getitemstring(row,'serie')
	ll_numero	= dw_parque.getitemnumber(row,'numero')
	ls_estado	= dw_parque.getitemstring(row,'estado')
	ldt_fecha		= dw_parque.getitemdatetime(row,'fecha_crea')
	ll_rut			= dw_parque.getitemnumber(row,'rut')
	ls_string		= 'PA'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_cd from commandbutton within w_cobranza_historica
integer x = 654
integer y = 2128
integer width = 439
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contrato Definitivo"
end type

event clicked;if isvalid(w_entregar_documento_tit_dom_ccto_def) then close(w_entregar_documento_tit_dom_ccto_def)
openwithparm(w_entregar_documento_tit_dom_ccto_def,'C')
end event

type cb_td from commandbutton within w_cobranza_historica
integer x = 325
integer y = 2128
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Título Dominio"
end type

event clicked;if isvalid(w_entregar_documento_tit_dom_ccto_def) then close(w_entregar_documento_tit_dom_ccto_def)
openwithparm(w_entregar_documento_tit_dom_ccto_def,'T')
end event

type cb_postventa from commandbutton within w_cobranza_historica
integer x = 41
integer y = 2128
integer width = 283
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Post-Venta"
end type

event clicked;if isvalid(w_detalle_postventa) then close(w_detalle_postventa)
open(w_detalle_postventa)
end event

type dw_datos from datawindow within w_cobranza_historica
integer x = 23
integer y = 4
integer width = 2939
integer height = 448
string title = "none"
string dataobject = "dw_titulo_cobranza_funeraria"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_cobranza_historica
boolean visible = false
integer x = 270
integer y = 2404
integer width = 608
integer height = 252
boolean titlebar = true
string dataobject = "dw_imprime_historicos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type cb_1 from commandbutton within w_cobranza_historica
integer x = 1275
integer y = 2128
integer width = 229
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_4.retrieve (gi_rut,gs_base,gs_serie,gi_numero) > 0 then
	dw_4.print()
end if
end event

type cb_cerrar from commandbutton within w_cobranza_historica
integer x = 2683
integer y = 2128
integer width = 270
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;CLOSE(w_cobranza_historica)
end event

type cb_2 from commandbutton within w_cobranza_historica
boolean visible = false
integer x = 1783
integer y = 2316
integer width = 274
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesos"
end type

event clicked;OpenWithParm(w_ultimos_procesos_cartas, 'NO')
end event

