forward
global type w_revision_promesas_bkp from window
end type
type hpb_1 from hprogressbar within w_revision_promesas_bkp
end type
type st_fondo from statictext within w_revision_promesas_bkp
end type
type st_porc from statictext within w_revision_promesas_bkp
end type
type cb_ctacte from commandbutton within w_revision_promesas_bkp
end type
type em_desde from editmask within w_revision_promesas_bkp
end type
type pb_procesar from picturebutton within w_revision_promesas_bkp
end type
type p_2 from picture within w_revision_promesas_bkp
end type
type p_1 from picture within w_revision_promesas_bkp
end type
type em_final from editmask within w_revision_promesas_bkp
end type
type st_2 from statictext within w_revision_promesas_bkp
end type
type st_1 from statictext within w_revision_promesas_bkp
end type
type st_16 from statictext within w_revision_promesas_bkp
end type
type dw_parque from datawindow within w_revision_promesas_bkp
end type
type cb_cerrar from commandbutton within w_revision_promesas_bkp
end type
type dw_lista from datawindow within w_revision_promesas_bkp
end type
type cb_filtrar from commandbutton within w_revision_promesas_bkp
end type
type cb_imprimir from commandbutton within w_revision_promesas_bkp
end type
type cb_ordenar from commandbutton within w_revision_promesas_bkp
end type
type cb_exportar from commandbutton within w_revision_promesas_bkp
end type
type gb_1 from groupbox within w_revision_promesas_bkp
end type
end forward

global type w_revision_promesas_bkp from window
integer width = 3227
integer height = 2016
boolean titlebar = true
string title = "Revisión Promesas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
cb_ctacte cb_ctacte
em_desde em_desde
pb_procesar pb_procesar
p_2 p_2
p_1 p_1
em_final em_final
st_2 st_2
st_1 st_1
st_16 st_16
dw_parque dw_parque
cb_cerrar cb_cerrar
dw_lista dw_lista
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_exportar cb_exportar
gb_1 gb_1
end type
global w_revision_promesas_bkp w_revision_promesas_bkp

type variables
Long	il_parque,il_row
end variables

on w_revision_promesas_bkp.create
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
this.cb_ctacte=create cb_ctacte
this.em_desde=create em_desde
this.pb_procesar=create pb_procesar
this.p_2=create p_2
this.p_1=create p_1
this.em_final=create em_final
this.st_2=create st_2
this.st_1=create st_1
this.st_16=create st_16
this.dw_parque=create dw_parque
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.gb_1=create gb_1
this.Control[]={this.hpb_1,&
this.st_fondo,&
this.st_porc,&
this.cb_ctacte,&
this.em_desde,&
this.pb_procesar,&
this.p_2,&
this.p_1,&
this.em_final,&
this.st_2,&
this.st_1,&
this.st_16,&
this.dw_parque,&
this.cb_cerrar,&
this.dw_lista,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_exportar,&
this.gb_1}
end on

on w_revision_promesas_bkp.destroy
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
destroy(this.cb_ctacte)
destroy(this.em_desde)
destroy(this.pb_procesar)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.gb_1)
end on

event open;Long	ll_cod_parque

gf_centrar(w_revision_promesas)
dw_lista.settransobject(sqlca)
em_desde.text		= string(today())
em_final.text		= string(today())
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_cod_parque)
st_fondo.visible	= false
hpb_1.visible 		= false
st_porc.visible 	= false
dw_parque.accepttext()
end event

type hpb_1 from hprogressbar within w_revision_promesas_bkp
boolean visible = false
integer x = 914
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_revision_promesas_bkp
boolean visible = false
integer x = 882
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porc from statictext within w_revision_promesas_bkp
boolean visible = false
integer x = 1454
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_ctacte from commandbutton within w_revision_promesas_bkp
integer x = 1143
integer y = 1784
integer width = 407
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_numero,ll_rut
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
	gs_serie		= dw_lista.getitemstring(il_row,'cadena_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'cadena_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'cadena_rut')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type em_desde from editmask within w_revision_promesas_bkp
integer x = 361
integer y = 36
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type pb_procesar from picturebutton within w_revision_promesas_bkp
integer x = 2231
integer y = 20
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
Datetime	ldt_fecha,ldt_fecha_prim
Long		ll_tot_reg,ll_indi,ll_tot_porc,ll_tot_porc_aux,ll_capacidad,ll_dias,ll_nro_cuotas
String	ls_age,ls_tipo_venta,ls_uso,ls_tipo_sepultura,ls_area,ls_moneda,ls_tipo_const
Double	ldb_porce_age,ldb_uf_dia,ldb_precio_lista,lld_factor,lld_saldo_finan

SetPointer(HourGlass!)
ld_fecha_ini								= date(em_desde.text)
ld_fecha_fin								= date(em_final.text)
dw_parque.accepttext()
il_parque									= dw_parque.getitemnumber(1,'cod_parque')
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if il_parque>0 then
		ll_tot_porc							= 0
		ll_tot_porc_aux					= 0			
		ll_tot_reg	= dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
		hpb_1.Position						= ll_tot_porc
		if ll_tot_reg>0 then
			st_fondo.visible				= true
			hpb_1.visible 					= true
			st_porc.visible 				= true
			for ll_indi=1 to ll_tot_reg
				ls_age						= dw_lista.getitemstring(ll_indi,'oferta_v_cod_age')
				ls_tipo_venta				= dw_lista.getitemstring(ll_indi,'oferta_v_tipo_venta')
				ls_uso						= dw_lista.getitemstring(ll_indi,'oferta_v_uso')
				ls_tipo_sepultura			= dw_lista.getitemstring(ll_indi,'oferta_v_tipo_sepult')
				ls_area						= dw_lista.getitemstring(ll_indi,'pago_oferta_area')
				ll_capacidad				= dw_lista.getitemnumber(ll_indi,'pago_oferta_capacidad')
				ls_moneda					= dw_lista.getitemstring(ll_indi,'pago_oferta_moneda')
				ldb_uf_dia					= dw_lista.getitemnumber(ll_indi,'pago_oferta_uf_dia')
				ls_tipo_const				= dw_lista.getitemstring(ll_indi,'oferta_v_tipo_cons')
				ldt_fecha					= dw_lista.getitemdatetime(ll_indi,'oferta_v_fecha')
				ldt_fecha_prim				= dw_lista.getitemdatetime(ll_indi,'pago_oferta_fecha_prim')
				ll_dias						= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
				ldb_porce_age				= f_buscar_porce_agente( ls_age , ls_tipo_venta , ls_uso , ls_tipo_sepultura , ls_area , ll_capacidad )
				dw_lista.setitem(ll_indi,'porce_venta_lista',ldb_porce_age)
				ldb_precio_lista			= ROUND(f_valida_precio_revision(  ls_tipo_sepultura ,  ls_area , ll_capacidad , ls_uso , ls_moneda , ldb_uf_dia , ls_tipo_const , il_parque ),0)
				dw_lista.setitem(ll_indi,'precio_lista',ldb_precio_lista)
				ll_nro_cuotas				= dw_lista.getitemnumber(ll_indi,'pago_oferta_nro_cuotas')
				lld_saldo_finan			= double(dw_lista.getitemnumber(ll_indi,'saldo_financiar'))
				if isnull(lld_saldo_finan) then lld_saldo_finan=0
				SELECT	"FACTORES"."FACTOR"  
				INTO 		:lld_factor  
				FROM 		"FACTORES"  
				WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
						 ( :ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
						 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
						 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
						 ( "FACTORES"."MONEDA" = :ls_moneda )
				USING		sqlca;
				
				if sqlca.sqlcode=0 then
					if lld_factor = 0 or isnull(lld_factor) then
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor 
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
								 									FROM 		"FACTORES" 
																	WHERE  ( "FACTORES"."BASE" = 'O' ) AND 
																			 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
					end if
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= round((lld_factor * lld_saldo_finan),4)
						dw_lista.setitem(ll_indi,'dif_dias',ll_dias)
						dw_lista.setitem(ll_indi,'factor_cuota',lld_factor)
						dw_lista.setitem(ll_indi,'valor_cuota_lista',lld_saldo_finan)
					end if
				else
					if ll_nro_cuotas=1 then
						lld_saldo_finan	= dw_lista.getitemnumber(ll_indi,'precio_uf')
						lld_factor			= 0
						dw_lista.setitem(ll_indi,'dif_dias',ll_dias)
						dw_lista.setitem(ll_indi,'factor_cuota',lld_factor)
						dw_lista.setitem(ll_indi,'valor_cuota_lista',lld_saldo_finan)
					else
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor 
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
								 									FROM 		"FACTORES" 
																	WHERE  ( "FACTORES"."BASE" = 'O' ) AND 
																			 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
						if lld_factor > 0 and lld_saldo_finan > 0 then
							lld_saldo_finan = round((lld_factor * lld_saldo_finan),4)
							dw_lista.setitem(ll_indi,'dif_dias',ll_dias)
							dw_lista.setitem(ll_indi,'factor_cuota',lld_factor)
							dw_lista.setitem(ll_indi,'valor_cuota_lista',lld_saldo_finan)
						end if
					end if
				end if
				
				
				
				dw_lista.scrolltorow(ll_indi)
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text			= string(ll_tot_porc)+" %"
					ll_tot_porc_aux		= ll_tot_porc
				end if
				ll_tot_porc					= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 			= ll_tot_porc
			next
			dw_lista.accepttext()
			st_fondo.visible				= false
			hpb_1.visible 					= false
			st_porc.visible 				= false
			dw_lista.scrolltorow(1)
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
	end if
end if
SetPointer(Arrow!)
end event

type p_2 from picture within w_revision_promesas_bkp
integer x = 1294
integer y = 36
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type p_1 from picture within w_revision_promesas_bkp
integer x = 704
integer y = 36
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_final from editmask within w_revision_promesas_bkp
integer x = 951
integer y = 36
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_revision_promesas_bkp
integer x = 795
integer y = 52
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 700
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

type st_1 from statictext within w_revision_promesas_bkp
integer x = 41
integer y = 52
integer width = 320
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
boolean focusrectangle = false
end type

type st_16 from statictext within w_revision_promesas_bkp
integer x = 1408
integer y = 56
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_revision_promesas_bkp
integer x = 1591
integer y = 32
integer width = 594
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_parque.accepttext()
il_parque	= dw_parque.getitemnumber(1,'cod_parque')
end event

type cb_cerrar from commandbutton within w_revision_promesas_bkp
integer x = 2853
integer y = 1784
integer width = 334
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_revision_promesas)
end event

type dw_lista from datawindow within w_revision_promesas_bkp
integer x = 27
integer y = 164
integer width = 3159
integer height = 1576
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_revision_promesas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_filtrar from commandbutton within w_revision_promesas_bkp
event ue_mousemove pbm_mousemove
integer x = 306
integer y = 1788
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_imprimir from commandbutton within w_revision_promesas_bkp
event ue_mousemove pbm_mousemove
integer x = 850
integer y = 1788
integer width = 247
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_ordenar from commandbutton within w_revision_promesas_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1788
integer width = 247
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_revision_promesas_bkp
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 1788
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type gb_1 from groupbox within w_revision_promesas_bkp
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1740
integer width = 1088
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

