forward
global type w_mantenedor_cuenta_pat from window
end type
type cb_ctacte from commandbutton within w_mantenedor_cuenta_pat
end type
type tab_1 from tab within w_mantenedor_cuenta_pat
end type
type tabpage_1 from userobject within tab_1
end type
type cb_mostrar from commandbutton within tabpage_1
end type
type cb_exportar_existe from commandbutton within tabpage_1
end type
type cb_filtrar_existe from commandbutton within tabpage_1
end type
type cb_sort_existe from commandbutton within tabpage_1
end type
type rb_16_al_fm from radiobutton within tabpage_1
end type
type rb_6_al_15 from radiobutton within tabpage_1
end type
type rb_1_al_5 from radiobutton within tabpage_1
end type
type cb_grabar from commandbutton within tabpage_1
end type
type p_fin from picture within tabpage_1
end type
type em_fec_fin from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type p_ini from picture within tabpage_1
end type
type em_fec_ini from editmask within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_lista from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_mostrar cb_mostrar
cb_exportar_existe cb_exportar_existe
cb_filtrar_existe cb_filtrar_existe
cb_sort_existe cb_sort_existe
rb_16_al_fm rb_16_al_fm
rb_6_al_15 rb_6_al_15
rb_1_al_5 rb_1_al_5
cb_grabar cb_grabar
p_fin p_fin
em_fec_fin em_fec_fin
st_2 st_2
p_ini p_ini
em_fec_ini em_fec_ini
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
type tabpage_2 from userobject within tab_1
end type
type cb_grabar_mod from commandbutton within tabpage_2
end type
type cb_anular from commandbutton within tabpage_2
end type
type pb_ok from picturebutton within tabpage_2
end type
type pb_buscar from picturebutton within tabpage_2
end type
type em_ctto from editmask within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type cb_exportar_existe_p from commandbutton within tabpage_2
end type
type cb_filtrar_existe_p from commandbutton within tabpage_2
end type
type cb_sort_existe_p from commandbutton within tabpage_2
end type
type dw_lista_p from datawindow within tabpage_2
end type
type p_fin_p from picture within tabpage_2
end type
type em_fec_fin_p from editmask within tabpage_2
end type
type st_22 from statictext within tabpage_2
end type
type p_ini_p from picture within tabpage_2
end type
type em_fec_ini_p from editmask within tabpage_2
end type
type st_21 from statictext within tabpage_2
end type
type gb_22 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_grabar_mod cb_grabar_mod
cb_anular cb_anular
pb_ok pb_ok
pb_buscar pb_buscar
em_ctto em_ctto
st_3 st_3
cb_exportar_existe_p cb_exportar_existe_p
cb_filtrar_existe_p cb_filtrar_existe_p
cb_sort_existe_p cb_sort_existe_p
dw_lista_p dw_lista_p
p_fin_p p_fin_p
em_fec_fin_p em_fec_fin_p
st_22 st_22
p_ini_p p_ini_p
em_fec_ini_p em_fec_ini_p
st_21 st_21
gb_22 gb_22
end type
type tabpage_3 from userobject within tab_1
end type
type st_4 from statictext within tabpage_3
end type
type dw_universo from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_4 st_4
dw_universo dw_universo
end type
type tab_1 from tab within w_mantenedor_cuenta_pat
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_cerrar from commandbutton within w_mantenedor_cuenta_pat
end type
end forward

global type w_mantenedor_cuenta_pat from window
integer width = 3301
integer height = 2500
boolean titlebar = true
string title = "Cuenta PAT"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctacte cb_ctacte
tab_1 tab_1
cb_cerrar cb_cerrar
end type
global w_mantenedor_cuenta_pat w_mantenedor_cuenta_pat

type variables
Long		il_row, il_row_p,il_graba,il_row_u
String	is_mod_ini,is_mod_fin
end variables

on w_mantenedor_cuenta_pat.create
this.cb_ctacte=create cb_ctacte
this.tab_1=create tab_1
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_ctacte,&
this.tab_1,&
this.cb_cerrar}
end on

on w_mantenedor_cuenta_pat.destroy
destroy(this.cb_ctacte)
destroy(this.tab_1)
destroy(this.cb_cerrar)
end on

event open;date	ldt_fecha
Long	ll_mes,ll_anno,ll_dia
gf_centrar(w_mantenedor_cuenta_pat)
tab_1.tabpage_1.dw_lista.settransobject(sqlca)
tab_1.tabpage_2.dw_lista_p.settransobject(sqlca)
tab_1.tabpage_3.dw_universo.settransobject(sqlca)
tab_1.tabpage_3.dw_universo.retrieve()
ldt_fecha		= date(gdt_fec_sistema)
il_graba		= 0
ll_dia			= day(ldt_fecha)
ll_mes		= month(ldt_fecha)
ll_anno		= year(ldt_fecha)
tab_1.tabpage_1.em_fec_ini.text		= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
tab_1.tabpage_1.em_fec_fin.text		= '05/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')

tab_1.tabpage_2.em_fec_ini_p.text	= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
tab_1.tabpage_2.em_fec_fin_p.text	= '05/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
end event

type cb_ctacte from commandbutton within w_mantenedor_cuenta_pat
integer x = 46
integer y = 2184
integer width = 453
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;SetPointer(HourGlass!)

CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if il_row>0 then
			gs_base 			= tab_1.tabpage_1.dw_lista.GetItemString(il_row, "base")
			gs_serie 			= tab_1.tabpage_1.dw_lista.GetItemString(il_row, "serie")
			gi_numero 		= tab_1.tabpage_1.dw_lista.GetItemNumber(il_row, "numero")
		end if
		
	CASE 2
		if il_row_p>0 then
			gs_base 			= tab_1.tabpage_2.dw_lista_p.GetItemString(il_row_p, "base")
			gs_serie 			= tab_1.tabpage_2.dw_lista_p.GetItemString(il_row_p, "serie")
			gi_numero 		= tab_1.tabpage_2.dw_lista_p.GetItemNumber(il_row_p, "numero")
		end if
		
	CASE 3
		if il_row_u>0 then
			gs_base 			= tab_1.tabpage_3.dw_universo.GetItemString(il_row_u, "base")
			gs_serie 			= tab_1.tabpage_3.dw_universo.GetItemString(il_row_u, "serie")
			gi_numero 		= tab_1.tabpage_3.dw_universo.GetItemNumber(il_row_u, "numero")
		end if
END CHOOSE
if not isnull(gs_base) and gi_numero>0 then
	CHOOSE CASE gs_base
		CASE "O" 	// Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" 	// Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "F" 	// Anexo Funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			Open(w_cuenta_corriente_funeraria)
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
	END CHOOSE
end if
SetPointer(Arrow!)
end event

type tab_1 from tab within w_mantenedor_cuenta_pat
event create ( )
event destroy ( )
integer x = 46
integer y = 60
integer width = 3173
integer height = 2076
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;if tab_1.SelectedTab=1 then
	tab_1.tabpage_1.em_fec_ini.setfocus()
elseif tab_1.SelectedTab=2 then
	tab_1.tabpage_2.em_fec_ini_p.setfocus()
elseif tab_1.SelectedTab=3 then
	tab_1.tabpage_3.dw_universo.setfocus()
end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3136
integer height = 1948
long backcolor = 67108864
string text = " Cargar Pagos (PAT)"
long tabtextcolor = 33554432
string picturename = "DosEdit5!"
long picturemaskcolor = 536870912
cb_mostrar cb_mostrar
cb_exportar_existe cb_exportar_existe
cb_filtrar_existe cb_filtrar_existe
cb_sort_existe cb_sort_existe
rb_16_al_fm rb_16_al_fm
rb_6_al_15 rb_6_al_15
rb_1_al_5 rb_1_al_5
cb_grabar cb_grabar
p_fin p_fin
em_fec_fin em_fec_fin
st_2 st_2
p_ini p_ini
em_fec_ini em_fec_ini
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_1.create
this.cb_mostrar=create cb_mostrar
this.cb_exportar_existe=create cb_exportar_existe
this.cb_filtrar_existe=create cb_filtrar_existe
this.cb_sort_existe=create cb_sort_existe
this.rb_16_al_fm=create rb_16_al_fm
this.rb_6_al_15=create rb_6_al_15
this.rb_1_al_5=create rb_1_al_5
this.cb_grabar=create cb_grabar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_mostrar,&
this.cb_exportar_existe,&
this.cb_filtrar_existe,&
this.cb_sort_existe,&
this.rb_16_al_fm,&
this.rb_6_al_15,&
this.rb_1_al_5,&
this.cb_grabar,&
this.p_fin,&
this.em_fec_fin,&
this.st_2,&
this.p_ini,&
this.em_fec_ini,&
this.st_1,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.cb_mostrar)
destroy(this.cb_exportar_existe)
destroy(this.cb_filtrar_existe)
destroy(this.cb_sort_existe)
destroy(this.rb_16_al_fm)
destroy(this.rb_6_al_15)
destroy(this.rb_1_al_5)
destroy(this.cb_grabar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_mostrar from commandbutton within tabpage_1
integer x = 18
integer y = 1804
integer width = 315
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Datetime	ldt_fecha_ini, ldt_fecha_fin,ldt_fec_venc_cred,ldt_fec_venc_mant
Long		ll_tot_reg,ll_indi,ll_numero,ll_rut,ll_monto_cred,ll_monto_mant,ll_count
String	ls_base,ls_serie,ls_estado_pago_cup

dw_lista.reset()
ldt_fecha_ini		= datetime(date(tab_1.tabpage_1.em_fec_ini.text),time('00:00:00'))
ldt_fecha_fin		= datetime(date(tab_1.tabpage_1.em_fec_fin.text),time('23:59:59'))
IF ldt_fecha_fin < ldt_fecha_ini THEN
	messagebox("Advertencia",'La Fecha de Final debe ser Mayor a la Inicial.',stopsign!)
	tab_1.tabpage_1.em_fec_fin.setfocus()
else
	if dw_lista.retrieve(ldt_fecha_ini, ldt_fecha_fin,gd_uf_dia)=0 then
		messagebox("Advertencia","No Registra Dato")
		tab_1.tabpage_1.em_fec_fin.setfocus()
	else
		ll_tot_reg					= dw_lista.rowcount()
		if ll_tot_reg > 0 then
			dw_lista.accepttext()
			for ll_indi=1 to ll_tot_reg
				ls_base				= dw_lista.getitemstring(ll_indi,'base')
				ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
				ldt_fec_venc_cred	= dw_lista.getitemdatetime(ll_indi,'fecha_venc_credito')
				ll_rut				= dw_lista.getitemnumber(ll_indi,'rut')
				ll_monto_cred		= dw_lista.getitemnumber(ll_indi,'c_monto_cred')
				ldt_fec_venc_mant	= dw_lista.getitemdatetime(ll_indi,'fecha_venc_mant')
				ll_monto_mant		= dw_lista.getitemnumber(ll_indi,'c_monto_mant')
				if ll_monto_cred > 0 then
					SELECT	COUNT("PAT_DETALLE"."BASE")  
					INTO 		:ll_count  
					FROM 		"PAT_DETALLE"  
					WHERE  ( "PAT_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAT_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAT_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAT_DETALLE"."FECHA_VENC" = :ldt_fec_venc_cred ) AND  
							 ( "PAT_DETALLE"."TIPO_MOV" = 'E' )   
					USING		sqlca;
					if isnull(ll_count) then ll_count=0
					if ll_count=0 then
						SELECT	"CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON"  
						INTO 		:ls_estado_pago_cup  
						FROM 		"CUPONERAS",   
									"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
								 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
								 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
								 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
								 (("CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
								 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_venc_cred ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_estado_pago_cup='C' then
								dw_lista.setitem(ll_indi,'estado_reg',1)
							else
								dw_lista.setitem(ll_indi,'estado_reg',0)
							end if
						else
							dw_lista.setitem(ll_indi,'estado_reg',0)
						end if
						dw_lista.setitem(ll_indi,'c_estado_pago',ls_estado_pago_cup)
					else
						dw_lista.setitem(ll_indi,'estado_reg',1)
						dw_lista.setitem(ll_indi,'c_estado_pago','V')
					end if
				end if
				if ll_monto_mant > 0 then
					if dw_lista.getitemnumber(ll_indi,'estado_reg')=1 then
						SELECT	COUNT("PAT_DETALLE"."BASE")  
						INTO 		:ll_count  
						FROM 		"PAT_DETALLE"  
						WHERE  ( "PAT_DETALLE"."BASE" = :ls_base ) AND  
								 ( "PAT_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "PAT_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "PAT_DETALLE"."FECHA_VENC_MANT" = :ldt_fec_venc_mant ) AND  
								 ( "PAT_DETALLE"."TIPO_MOV" = 'F' )   
						USING		sqlca;
						if isnull(ll_count) then ll_count=0
						if ll_count=0 then
							SELECT	"CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON"  
							INTO 		:ls_estado_pago_cup  
							FROM 		"CUPONERAS",   
										"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
									 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
									 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
									 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
									 (("CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_venc_mant ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
									 ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_estado_pago_cup='C' then
									dw_lista.setitem(ll_indi,'estado_reg',1)
								else
									dw_lista.setitem(ll_indi,'estado_reg',0)
								end if
							else
								dw_lista.setitem(ll_indi,'estado_reg',0)
							end if
							dw_lista.setitem(ll_indi,'c_estado_pago',ls_estado_pago_cup)
						else
							dw_lista.setitem(ll_indi,'estado_reg',1)
							dw_lista.setitem(ll_indi,'c_estado_pago','V')
						end if
					end if
				end if
				if dw_lista.getitemnumber(ll_indi,'estado_reg')<>0 then
					dw_lista.setitem(ll_indi,'estado_reg',1)
				end if
			next
			dw_lista.accepttext()
		end if
	end if
end if
end event

type cb_exportar_existe from commandbutton within tabpage_1
integer x = 2802
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type cb_filtrar_existe from commandbutton within tabpage_1
integer x = 2514
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 40
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
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_sort_existe from commandbutton within tabpage_1
integer x = 2226
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type rb_16_al_fm from radiobutton within tabpage_1
integer x = 2670
integer y = 100
integer width = 407
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "del 16 a F.M."
end type

event clicked;date	ldt_fecha
Long	ll_mes,ll_anno,ll_dia,ll_day

dw_lista.reset()
if is_mod_ini='S' then
	ldt_fecha		= date(em_fec_ini.text)
elseif is_mod_fin='S' then
	ldt_fecha		= date(em_fec_fin.text)
else
	ldt_fecha		= date(gdt_fec_sistema)
end if
ll_dia				= day(ldt_fecha)
ll_mes				= month(ldt_fecha)
ll_anno				= year(ldt_fecha)
tab_1.tabpage_1.em_fec_ini.text	= '16/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
if ll_mes=1 then
	ll_day			= 31
elseif ll_mes=2 then
	if (ll_anno / 4) = int(ll_anno / 4) then
		ll_day		= 29
	else
		ll_day		= 28
	end if
elseif ll_mes=3 then
	ll_day			= 31
elseif ll_mes=4 then
	ll_day			= 30
elseif ll_mes=5 then
	ll_day			= 31
elseif ll_mes=6 then
	ll_day			= 30
elseif ll_mes=7 then
	ll_day			= 31
elseif ll_mes=8 then
	ll_day			= 31
elseif ll_mes=9 then
	ll_day			= 30
elseif ll_mes=10 then
	ll_day			= 31
elseif ll_mes=11 then
	ll_day			= 30
elseif ll_mes=12 then
	ll_day			= 31
end if
tab_1.tabpage_1.em_fec_fin.text	= string(ll_day,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//cb_grabar.setfocus()
end event

type rb_6_al_15 from radiobutton within tabpage_1
integer x = 2167
integer y = 100
integer width = 393
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "del 6 al 15"
end type

event clicked;date	ldt_fecha
Long	ll_mes,ll_anno,ll_dia

dw_lista.reset()
if is_mod_ini='S' then
	ldt_fecha	= date(em_fec_ini.text)
elseif is_mod_fin='S' then
	ldt_fecha	= date(em_fec_fin.text)
else
	ldt_fecha	= date(gdt_fec_sistema)
end if
ll_dia			= day(ldt_fecha)
ll_mes			= month(ldt_fecha)
ll_anno			= year(ldt_fecha)
tab_1.tabpage_1.em_fec_ini.text	= '06/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
tab_1.tabpage_1.em_fec_fin.text	= '15/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//cb_grabar.setfocus()
end event

type rb_1_al_5 from radiobutton within tabpage_1
integer x = 1696
integer y = 100
integer width = 393
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "del 1 al 5"
boolean checked = true
end type

event clicked;date	ldt_fecha
Long	ll_mes,ll_anno,ll_dia

dw_lista.reset()
if is_mod_ini='S' then
	ldt_fecha	= date(em_fec_ini.text)
elseif is_mod_fin='S' then
	ldt_fecha	= date(em_fec_fin.text)
else
	ldt_fecha	= date(gdt_fec_sistema)
end if
ll_dia			= day(ldt_fecha)
ll_mes			= month(ldt_fecha)
ll_anno			= year(ldt_fecha)
tab_1.tabpage_1.em_fec_ini.text	= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
tab_1.tabpage_1.em_fec_fin.text	= '05/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//cb_grabar.setfocus()

end event

type cb_grabar from commandbutton within tabpage_1
integer x = 1102
integer y = 1804
integer width = 315
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi, ll_tot_reg,ll_numero,ll_rut,ll_valor_cred,ll_valor_mant,ll_count,ll_estado_reg,&
			ll_fila,ll_pasa_cred,ll_pasa_mant,ll_pasa_cred_p,ll_pasa_mant_p
Double	ll_monto_mant,ll_monto_cred
String	ls_base,ls_serie
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant

ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ll_fila						= dw_lista.Find("estado_reg = 0", 1, ll_tot_reg)
	if ll_fila > 0 then
		ll_pasa_cred 			= 0
		ll_pasa_mant 			= 0
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ldt_fec_venc_cred	= dw_lista.getitemdatetime(ll_indi,'fecha_venc_credito')
			ll_rut				= dw_lista.getitemnumber(ll_indi,'rut')
			ll_monto_cred		= dw_lista.getitemnumber(ll_indi,'c_monto_cred')
			ldt_fec_venc_mant	= dw_lista.getitemdatetime(ll_indi,'fecha_venc_mant')
			ll_monto_mant		= dw_lista.getitemnumber(ll_indi,'c_monto_mant')
			ll_estado_reg		= dw_lista.getitemnumber(ll_indi,'estado_reg')
			if ll_estado_reg=0 then
				if ll_monto_cred > 0 then
					ll_pasa_cred ++
					SELECT	COUNT("PAT_DETALLE"."BASE")  
					INTO 		:ll_count  
					FROM 		"PAT_DETALLE"  
					WHERE  ( "PAT_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAT_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAT_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAT_DETALLE"."FECHA_VENC" = :ldt_fec_venc_cred ) AND  
							 ( "PAT_DETALLE"."TIPO_MOV" = 'E' )   
					USING		sqlca;
					if isnull(ll_count) then ll_count=0
					if ll_count=0 then
						INSERT INTO "PAT_DETALLE"  
									( "BASE",	"SERIE",		"NUMERO",	"FECHA_VENC",			"RUT",	"MONTO_CRED",		"FECHA_VENC_MANT",	"MONTO_VENC_MANT",	"USUSARIO",	"ESTADO_REG",	"TIPO_MOV" )  
						VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fec_venc_cred,	:ll_rut,	:ll_monto_cred,	null,						0,							:gs_user,	'V',				'E' )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_pasa_cred_p ++
						else
							rollback;
							messagebox("Error Grabar","Error Grabar Pago Crédito PAT_DETALLE SQL: "+sqlca.sqlerrtext)
						end if
					end if
				end if
				if ll_monto_mant > 0 then
					ll_pasa_mant ++
					SELECT	COUNT("PAT_DETALLE"."BASE")  
					INTO 		:ll_count  
					FROM 		"PAT_DETALLE"  
					WHERE  ( "PAT_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAT_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAT_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAT_DETALLE"."FECHA_VENC" = :ldt_fec_venc_mant ) AND  
							 ( "PAT_DETALLE"."TIPO_MOV" = 'F' )   
					USING		sqlca;
					if isnull(ll_count) then ll_count=0
					if ll_count=0 then
						INSERT INTO "PAT_DETALLE"  
									( "BASE",	"SERIE",		"NUMERO",	"FECHA_VENC",			"RUT",	"MONTO_CRED",	"FECHA_VENC_MANT",	"MONTO_VENC_MANT",	"USUSARIO",	"ESTADO_REG",	"TIPO_MOV" )  
						VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fec_venc_mant,	:ll_rut,	0,					:ldt_fec_venc_mant,	:ll_monto_mant,		:gs_user,	'V',				'F' )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_pasa_mant_p ++
						else
							rollback;
							messagebox("Error Grabar","Error Grabar Pago Mantención PAT_DETALLE SQL: "+sqlca.sqlerrtext)
						end if
					end if
				end if
			end if
		next
		if ll_pasa_mant=ll_pasa_mant_p and ll_pasa_cred=ll_pasa_cred_p then
			messagebox("Grabar","Grabación Exitosa")
		end if
	else
		messagebox("Advertencia","No Registra Vencimientos de Pagos en Rango de Fecha")
	end if
end if
end event

type p_fin from picture within tabpage_1
integer x = 1527
integer y = 88
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha
long		ll_dia
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		dw_lista.reset()
		ll_dia				= long(mid(em_fec_fin.text,1,2))
		is_mod_ini			= 'N'
		is_mod_fin			= 'S'
		if ll_dia >= 1 and ll_dia <= 5 then
			rb_1_al_5.checked	= true
			rb_1_al_5.triggerevent(clicked!)
		elseif ll_dia >= 6 and ll_dia <= 15 then
			rb_6_al_15.checked	= true
			rb_6_al_15.triggerevent(clicked!)
		elseif ll_dia >= 16 and ll_dia <= 31 then
			rb_16_al_fm.checked	= true
			rb_16_al_fm.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fec_fin from editmask within tabpage_1
integer x = 1184
integer y = 88
integer width = 338
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Long	ll_dia

dw_lista.reset()
ll_dia				= long(mid(em_fec_fin.text,1,2))
is_mod_ini			= 'N'
is_mod_fin			= 'S'
if ll_dia >= 1 and ll_dia <= 5 then
	rb_1_al_5.checked	= true
	rb_1_al_5.triggerevent(clicked!)
elseif ll_dia >= 6 and ll_dia <= 15 then
	rb_6_al_15.checked	= true
	rb_6_al_15.triggerevent(clicked!)
elseif ll_dia >= 16 and ll_dia <= 31 then
	rb_16_al_fm.checked	= true
	rb_16_al_fm.triggerevent(clicked!)
end if
end event

type st_2 from statictext within tabpage_1
integer x = 1006
integer y = 100
integer width = 165
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within tabpage_1
integer x = 910
integer y = 88
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha
long 		ll_dia

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text 	= Message.StringParm
		is_mod_ini			= 'S'
		is_mod_fin			= 'N'
		ll_dia				= long(mid(em_fec_ini.text,1,2))
		if ll_dia >= 1 and ll_dia <= 5 then
			rb_1_al_5.checked	= true
			rb_1_al_5.triggerevent(clicked!)
		elseif ll_dia >= 6 and ll_dia <= 15 then
			rb_6_al_15.checked	= true
			rb_6_al_15.triggerevent(clicked!)
		elseif ll_dia >= 16 and ll_dia <= 31 then
			rb_16_al_fm.checked	= true
			rb_16_al_fm.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fec_ini from editmask within tabpage_1
integer x = 567
integer y = 88
integer width = 338
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Long	ll_dia

dw_lista.reset()
is_mod_ini			= 'S'
is_mod_fin			= 'N'
ll_dia				= long(mid(em_fec_ini.text,1,2))
if ll_dia >= 1 and ll_dia <= 5 then
	rb_1_al_5.checked	= true
	rb_1_al_5.triggerevent(clicked!)
elseif ll_dia >= 6 and ll_dia <= 15 then
	rb_6_al_15.checked	= true
	rb_6_al_15.triggerevent(clicked!)
elseif ll_dia >= 16 and ll_dia <= 31 then
	rb_16_al_fm.checked	= true
	rb_16_al_fm.triggerevent(clicked!)
end if
end event

event losefocus;em_fec_fin.setfocus()
end event

type st_1 from statictext within tabpage_1
integer x = 14
integer y = 100
integer width = 535
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista from datawindow within tabpage_1
integer x = 18
integer y = 268
integer width = 3090
integer height = 1500
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_venc_pat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanging;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event losefocus;cb_mostrar.setfocus()
end event

type gb_1 from groupbox within tabpage_1
integer x = 1650
integer y = 24
integer width = 1490
integer height = 188
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Rango"
end type

type gb_2 from groupbox within tabpage_1
integer x = 2203
integer y = 1764
integer width = 905
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3136
integer height = 1948
long backcolor = 67108864
string text = " Pagos Procesados"
long tabtextcolor = 33554432
string picturename = "Having!"
long picturemaskcolor = 536870912
cb_grabar_mod cb_grabar_mod
cb_anular cb_anular
pb_ok pb_ok
pb_buscar pb_buscar
em_ctto em_ctto
st_3 st_3
cb_exportar_existe_p cb_exportar_existe_p
cb_filtrar_existe_p cb_filtrar_existe_p
cb_sort_existe_p cb_sort_existe_p
dw_lista_p dw_lista_p
p_fin_p p_fin_p
em_fec_fin_p em_fec_fin_p
st_22 st_22
p_ini_p p_ini_p
em_fec_ini_p em_fec_ini_p
st_21 st_21
gb_22 gb_22
end type

on tabpage_2.create
this.cb_grabar_mod=create cb_grabar_mod
this.cb_anular=create cb_anular
this.pb_ok=create pb_ok
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_3=create st_3
this.cb_exportar_existe_p=create cb_exportar_existe_p
this.cb_filtrar_existe_p=create cb_filtrar_existe_p
this.cb_sort_existe_p=create cb_sort_existe_p
this.dw_lista_p=create dw_lista_p
this.p_fin_p=create p_fin_p
this.em_fec_fin_p=create em_fec_fin_p
this.st_22=create st_22
this.p_ini_p=create p_ini_p
this.em_fec_ini_p=create em_fec_ini_p
this.st_21=create st_21
this.gb_22=create gb_22
this.Control[]={this.cb_grabar_mod,&
this.cb_anular,&
this.pb_ok,&
this.pb_buscar,&
this.em_ctto,&
this.st_3,&
this.cb_exportar_existe_p,&
this.cb_filtrar_existe_p,&
this.cb_sort_existe_p,&
this.dw_lista_p,&
this.p_fin_p,&
this.em_fec_fin_p,&
this.st_22,&
this.p_ini_p,&
this.em_fec_ini_p,&
this.st_21,&
this.gb_22}
end on

on tabpage_2.destroy
destroy(this.cb_grabar_mod)
destroy(this.cb_anular)
destroy(this.pb_ok)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_3)
destroy(this.cb_exportar_existe_p)
destroy(this.cb_filtrar_existe_p)
destroy(this.cb_sort_existe_p)
destroy(this.dw_lista_p)
destroy(this.p_fin_p)
destroy(this.em_fec_fin_p)
destroy(this.st_22)
destroy(this.p_ini_p)
destroy(this.em_fec_ini_p)
destroy(this.st_21)
destroy(this.gb_22)
end on

type cb_grabar_mod from commandbutton within tabpage_2
integer x = 1184
integer y = 1808
integer width = 325
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;dw_lista_p.accepttext()
if il_graba > 0 then
	if dw_lista_p.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		il_graba	= 0
	else
		rollback;
		messagebox("Error Grabar","Error Cambiar Estado ANULADO SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_anular from commandbutton within tabpage_2
integer x = 1678
integer y = 1808
integer width = 325
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;String	ls_base,ls_serie
Long		ll_res
datetime	ldt_fecha
Double	ll_numero
if il_row_p > 0 then
	ls_base		= dw_lista_p.getitemstring(il_row_p,'base')
	ls_serie		= dw_lista_p.getitemstring(il_row_p,'serie')
	ll_numero	= dw_lista_p.getitemnumber(il_row_p,'numero')
	ldt_fecha	= dw_lista_p.getitemdatetime(il_row_p,'fecha_venc')
	ll_res		= messagebox("Anular","Está Seguro Anular PAT Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+' con Fecha Vencimiento '+string(ldt_fecha,'dd/mm/yyyy'),Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_lista_p.setitem(il_row_p,'estado_reg','A')
		if dw_lista_p.update()=1 then
			commit;
			messagebox("Grabar","Cambio de Estado ANULADO Exitoso")
		else
			rollback;
			messagebox("Error Grabar","Error Cambiar Estado ANULADO SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type pb_ok from picturebutton within tabpage_2
integer x = 1669
integer y = 52
integer width = 169
integer height = 152
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Datetime	ldt_fecha_ini, ldt_fecha_fin

dw_lista_p.reset()
ldt_fecha_ini		= datetime(date(tab_1.tabpage_2.em_fec_ini_p.text),time('00:00:00'))
ldt_fecha_fin		= datetime(date(tab_1.tabpage_2.em_fec_fin_p.text),time('23:59:59'))
IF ldt_fecha_fin < ldt_fecha_ini THEN
	messagebox("Advertencia",'La Fecha de Final debe ser Mayor a la Inicial.',stopsign!)
	tab_1.tabpage_2.em_fec_fin_p.setfocus()
else
	if dw_lista_p.retrieve(ldt_fecha_ini, ldt_fecha_fin)=0 then
		messagebox("Advertencia","No Registra Dato")
		tab_1.tabpage_2.em_fec_fin_p.setfocus()
	else
		il_graba		= 0
		tab_1.tabpage_2.dw_lista_p.setfocus()
	end if
end if
end event

type pb_buscar from picturebutton within tabpage_2
integer x = 905
integer y = 1804
integer width = 96
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
end type

event clicked;long	ll_fila,ll_tot_reg
Double	ll_numero

ll_tot_reg						= dw_lista_p.rowcount()
if ll_tot_reg > 0 then
	ll_numero					= Double(em_ctto.text)
	if ll_numero > 0 then
		ll_fila					= dw_lista_p.Find("numero = "+string(ll_numero), 1, ll_tot_reg)
		if ll_fila > 0 then
			dw_lista_p.scrolltorow(ll_fila)
			dw_lista_p.setfocus()
		else
			messagebox("Advertencia","No Existe en Lista Contrato Nº "+string(ll_numero,'###,###,###,###,###'))
			dw_lista_p.scrolltorow(1)
			em_ctto.text		= ''
			dw_lista_p.setfocus()
		end if
	end if
end if


end event

type em_ctto from editmask within tabpage_2
integer x = 443
integer y = 1804
integer width = 457
integer height = 104
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text) > 0 then pb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within tabpage_2
integer x = 14
integer y = 1828
integer width = 416
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_exportar_existe_p from commandbutton within tabpage_2
integer x = 2802
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista_p.rowcount() > 0 then
	f_DWToExcel(dw_lista_p)
end if
end event

type cb_filtrar_existe_p from commandbutton within tabpage_2
integer x = 2514
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 40
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
dw_lista_p.SETfilter(NULO)
dw_lista_p.filter()

end event

type cb_sort_existe_p from commandbutton within tabpage_2
integer x = 2226
integer y = 1816
integer width = 283
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_p.SETSORT(NULO)
dw_lista_p.SORT()

end event

type dw_lista_p from datawindow within tabpage_2
integer x = 18
integer y = 268
integer width = 3090
integer height = 1500
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_envios_realizados_pat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_p	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_p, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row_p		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_p, TRUE)
end if
end event

event itemchanged;String	ls_columna
Datetime	ldt_fecha

this.accepttext()
ls_columna		= dwo.name
if ls_columna='fecha_prox_cargo' then
	ldt_fecha	= this.getitemdatetime(row,'fecha_prox_cargo')
	if not isnull(ldt_fecha) then 
		il_graba ++
	end if
end if
end event

type p_fin_p from picture within tabpage_2
integer x = 1527
integer y = 88
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha

dw_lista_p.reset()
if f_valida_fecha(em_fec_fin_p.text)=-1 then 
	em_fec_fin_p.text=string(today(),gs_formato_fecha)
	em_fec_fin_p.setfocus()
	return
end if	
if em_fec_fin_p.text<>'00/00/0000' then
	ls_fecha = em_fec_fin_p.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini_p.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin_p.setfocus()
		return
	else	
		em_fec_fin_p.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin_p from editmask within tabpage_2
integer x = 1184
integer y = 88
integer width = 338
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista_p.reset()
end event

type st_22 from statictext within tabpage_2
integer x = 1006
integer y = 100
integer width = 165
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini_p from picture within tabpage_2
integer x = 910
integer y = 88
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha

dw_lista_p.reset()
if f_valida_fecha(em_fec_ini_p.text)=-1 then 
	em_fec_ini_p.text=string(today(),gs_formato_fecha)
	em_fec_ini_p.setfocus()
	return
end if	
if em_fec_ini_p.text<>'00/00/0000' then
	ls_fecha = em_fec_ini_p.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin_p.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini_p.setfocus()
		return
	else	
		em_fec_ini_p.text 	= Message.StringParm
	end if	
END IF
end event

type em_fec_ini_p from editmask within tabpage_2
integer x = 567
integer y = 88
integer width = 338
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista_p.reset()
end event

event losefocus;em_fec_fin_p.setfocus()
end event

type st_21 from statictext within tabpage_2
integer x = 14
integer y = 100
integer width = 539
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_22 from groupbox within tabpage_2
integer x = 2203
integer y = 1764
integer width = 905
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3136
integer height = 1948
long backcolor = 67108864
string text = "Universo"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_4 st_4
dw_universo dw_universo
end type

on tabpage_3.create
this.st_4=create st_4
this.dw_universo=create dw_universo
this.Control[]={this.st_4,&
this.dw_universo}
end on

on tabpage_3.destroy
destroy(this.st_4)
destroy(this.dw_universo)
end on

type st_4 from statictext within tabpage_3
integer x = 37
integer y = 44
integer width = 590
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado Universo PAT"
boolean focusrectangle = false
end type

type dw_universo from datawindow within tabpage_3
integer x = 18
integer y = 132
integer width = 3090
integer height = 1792
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_universo_mandato_pat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_u	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_u, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row_u	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_u, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_cuenta_pat
integer x = 2907
integer y = 2184
integer width = 311
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_cuenta_pat)
end event

