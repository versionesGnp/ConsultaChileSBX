forward
global type w_evolucion_mora_cierre from window
end type
type em_ini from editmask within w_evolucion_mora_cierre
end type
type em_fin from editmask within w_evolucion_mora_cierre
end type
type dw_mora from datawindow within w_evolucion_mora_cierre
end type
type st_fondo from statictext within w_evolucion_mora_cierre
end type
type st_cuenta from statictext within w_evolucion_mora_cierre
end type
type hpb_1 from hprogressbar within w_evolucion_mora_cierre
end type
type st_porc from statictext within w_evolucion_mora_cierre
end type
type cb_filtrar from commandbutton within w_evolucion_mora_cierre
end type
type cb_ordenar from commandbutton within w_evolucion_mora_cierre
end type
type cb_cta_cte from commandbutton within w_evolucion_mora_cierre
end type
type dw_lista from datawindow within w_evolucion_mora_cierre
end type
type cb_1 from commandbutton within w_evolucion_mora_cierre
end type
type dw_parque from datawindow within w_evolucion_mora_cierre
end type
type cb_limpiar from commandbutton within w_evolucion_mora_cierre
end type
type tab_1 from tab within w_evolucion_mora_cierre
end type
type tabpage_1 from userobject within tab_1
end type
type dw_general from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_general dw_general
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tabpage_4 from userobject within tab_1
end type
type tabpage_4 from userobject within tab_1
end type
type tabpage_5 from userobject within tab_1
end type
type tabpage_5 from userobject within tab_1
end type
type tab_1 from tab within w_evolucion_mora_cierre
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type cb_exportar from commandbutton within w_evolucion_mora_cierre
end type
type cb_imprimir from commandbutton within w_evolucion_mora_cierre
end type
type dw_fecha_cierre from datawindow within w_evolucion_mora_cierre
end type
type pb_aceptar from picturebutton within w_evolucion_mora_cierre
end type
type cb_cerrar from commandbutton within w_evolucion_mora_cierre
end type
end forward

global type w_evolucion_mora_cierre from window
integer width = 5335
integer height = 2368
boolean titlebar = true
string title = "Sales Meeting"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_ini em_ini
em_fin em_fin
dw_mora dw_mora
st_fondo st_fondo
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cta_cte cb_cta_cte
dw_lista dw_lista
cb_1 cb_1
dw_parque dw_parque
cb_limpiar cb_limpiar
tab_1 tab_1
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_fecha_cierre dw_fecha_cierre
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
end type
global w_evolucion_mora_cierre w_evolucion_mora_cierre

type variables
long il_row
end variables

on w_evolucion_mora_cierre.create
this.em_ini=create em_ini
this.em_fin=create em_fin
this.dw_mora=create dw_mora
this.st_fondo=create st_fondo
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cta_cte=create cb_cta_cte
this.dw_lista=create dw_lista
this.cb_1=create cb_1
this.dw_parque=create dw_parque
this.cb_limpiar=create cb_limpiar
this.tab_1=create tab_1
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_fecha_cierre=create dw_fecha_cierre
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.Control[]={this.em_ini,&
this.em_fin,&
this.dw_mora,&
this.st_fondo,&
this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cta_cte,&
this.dw_lista,&
this.cb_1,&
this.dw_parque,&
this.cb_limpiar,&
this.tab_1,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_fecha_cierre,&
this.pb_aceptar,&
this.cb_cerrar}
end on

on w_evolucion_mora_cierre.destroy
destroy(this.em_ini)
destroy(this.em_fin)
destroy(this.dw_mora)
destroy(this.st_fondo)
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cta_cte)
destroy(this.dw_lista)
destroy(this.cb_1)
destroy(this.dw_parque)
destroy(this.cb_limpiar)
destroy(this.tab_1)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_fecha_cierre)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

event open;connect using Trans_1;
connect using Trans_2;

gf_centrar(w_evolucion_mora_cierre)

dw_parque.dataobject								= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_fecha_cierre.dataobject						= 'dwe_cierre_factura'
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.insertrow(0)
dw_lista.dataobject								= 'dwe_detalle_contrato_mora'
dw_lista.settransobject(sqlca)
dw_mora.dataobject								= 'dwe_mora'
dw_mora.settransobject(sqlca)
dw_mora.insertrow(0)

end event

type em_ini from editmask within w_evolucion_mora_cierre
integer x = 1321
integer y = 2148
integer width = 521
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
string displaydata = ""
end type

type em_fin from editmask within w_evolucion_mora_cierre
integer x = 1847
integer y = 2148
integer width = 521
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
string displaydata = ""
end type

type dw_mora from datawindow within w_evolucion_mora_cierre
integer x = 1038
integer y = 20
integer width = 768
integer height = 100
integer taborder = 50
string title = "none"
string dataobject = "dwe_mora"
boolean border = false
boolean livescroll = true
end type

type st_fondo from statictext within w_evolucion_mora_cierre
boolean visible = false
integer x = 1998
integer y = 816
integer width = 1431
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_cuenta from statictext within w_evolucion_mora_cierre
boolean visible = false
integer x = 2030
integer y = 984
integer width = 1371
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
string text = "none"
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_evolucion_mora_cierre
boolean visible = false
integer x = 2030
integer y = 912
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_evolucion_mora_cierre
boolean visible = false
integer x = 2606
integer y = 840
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_evolucion_mora_cierre
integer x = 3072
integer y = 2052
integer width = 238
integer height = 80
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_evolucion_mora_cierre
integer x = 2834
integer y = 2052
integer width = 238
integer height = 80
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

type cb_cta_cte from commandbutton within w_evolucion_mora_cierre
integer x = 1326
integer y = 2048
integer width = 425
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;string	ls_base,ls_serie
long		ll_cd_estado_promesa
Double	ll_numero

if dw_lista.rowcount() > 0 then
	ls_base						= dw_lista.getitemstring(il_row,'base')
	ls_serie						= dw_lista.getitemstring(il_row,'serie')
	ll_numero					= dw_lista.getitemnumber(il_row,'numero')

	gi_numero 					= ll_numero
	gs_base						= ls_base
	gs_serie						= ls_serie
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "F"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type dw_lista from datawindow within w_evolucion_mora_cierre
integer x = 1317
integer y = 176
integer width = 3968
integer height = 1840
integer taborder = 50
string title = "none"
string dataobject = "dwe_detalle_contrato_mora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_1 from commandbutton within w_evolucion_mora_cierre
integer x = 1861
integer y = 28
integer width = 283
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;string		ls_base,ls_serie,ls_estado,ls_base_consul,ls_serie_consul,ls_fecha,ls_cod_age,ls_cod_sup
long		ll_cod_parque,ll_plazo,ll_cta_pag,ll_sum_pag_post,ll_ctas_pag_1,ll_dias_mora,&
			ll_mora_01,ll_dia_venc,ll_mes_venc,ll_ano_venc,ll_dia_01,ll_mes_01,ll_ano_01,ll_resta_ano,ll_resta_mes,ll_cuota_venc,&
			ll_cta_venta,ll_cta_mora,ll_new,ll_tot_reg,ll_rut,ll_mora,ll_mora_011
datetime	ldt_fecha_01,ldt_fecha_02,ldt_fecha_03,ldt_fecha_04,ldt_fecha_05,ldt_fecha_06,ldt_fecha_07,ldt_fecha_08,ldt_fecha_09,&
			ldt_fecha_10,ldt_fecha_11,ldt_fecha_12,ldt_fecha_13,ldt_fecha_14,ldt_fecha_15,ldt_fecha_16,ldt_fecha_17,ldt_fecha_18,&
			ldt_fecha_19,ldt_fecha_20,ldt_fecha_21,ldt_fecha_22,ldt_fecha_23,ldt_fecha_24,&
			ldt_fecha_cierre,ldt_fecha_fact,ldt_fecha_prim,ldt_fecha_res,ldt_fecha_est,ldt_fecha_ult_pago,ldt_fec_repac,ldt_fecha_venc
double	ldb_tot_porc,ldb_tot_porc_aux,ll_numero,ll_numero_consul

dw_lista.reset()
tab_1.tabpage_1.dw_general.reset()
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
ll_cod_parque														= dw_parque.getitemnumber(1,'parque')
ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'fecha_cierre')
ll_mora																= dw_mora.getitemnumber(1,'mora')
tab_1.tabpage_1.dw_general.object.usuario.text			= gs_user

em_ini.text															= string(gdt_fec_sistema)
SetPointer(HourGlass!)
if not isnull(ll_mora) and ll_mora>0 and not isnull(ldt_fecha_cierre) then
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_01  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" <= :ldt_fecha_cierre
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_01) then
			tab_1.tabpage_1.dw_general.object.mes_01_t.text		= string(ldt_fecha_01,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_02  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_01
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_02) then
			tab_1.tabpage_1.dw_general.object.mes_02_t.text		= string(ldt_fecha_02,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_03  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_02
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_03) then
			tab_1.tabpage_1.dw_general.object.mes_03_t.text		= string(ldt_fecha_03,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_04  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_03
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_04) then
			tab_1.tabpage_1.dw_general.object.mes_04_t.text		= string(ldt_fecha_04,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_05  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_04
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_05) then
			tab_1.tabpage_1.dw_general.object.mes_05_t.text		= string(ldt_fecha_05,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_06  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_05
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_06) then
			tab_1.tabpage_1.dw_general.object.mes_06_t.text		= string(ldt_fecha_06,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_07  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_06
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_07) then
			tab_1.tabpage_1.dw_general.object.mes_07_t.text		= string(ldt_fecha_07,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_08  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_07
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_08) then
			tab_1.tabpage_1.dw_general.object.mes_08_t.text		= string(ldt_fecha_08,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_09  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_08
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_09) then
			tab_1.tabpage_1.dw_general.object.mes_09_t.text		= string(ldt_fecha_09,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_10  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_09
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_10) then
			tab_1.tabpage_1.dw_general.object.mes_10_t.text		= string(ldt_fecha_10,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_11  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_10
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_11) then
			tab_1.tabpage_1.dw_general.object.mes_11_t.text		= string(ldt_fecha_11,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_12  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_11
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_12) then
			tab_1.tabpage_1.dw_general.object.mes_12_t.text		= string(ldt_fecha_12,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_13  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_12
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_13) then
			tab_1.tabpage_1.dw_general.object.mes_13_t.text		= string(ldt_fecha_13,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_14  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_13
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_14) then
			tab_1.tabpage_1.dw_general.object.mes_14_t.text		= string(ldt_fecha_14,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_15  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_14
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_15) then
			tab_1.tabpage_1.dw_general.object.mes_15_t.text		= string(ldt_fecha_15,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_16  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_15
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_16) then
			tab_1.tabpage_1.dw_general.object.mes_16_t.text		= string(ldt_fecha_16,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_17  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_16
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_17) then
			tab_1.tabpage_1.dw_general.object.mes_17_t.text		= string(ldt_fecha_17,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_18  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_17
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_18) then
			tab_1.tabpage_1.dw_general.object.mes_18_t.text		= string(ldt_fecha_18,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_19  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_18
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_19) then
			tab_1.tabpage_1.dw_general.object.mes_19_t.text		= string(ldt_fecha_19,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_20  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_19
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_20) then
			tab_1.tabpage_1.dw_general.object.mes_20_t.text		= string(ldt_fecha_20,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_21  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_20
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_21) then
			tab_1.tabpage_1.dw_general.object.mes_21_t.text		= string(ldt_fecha_21,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_22  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_21
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_22) then
			tab_1.tabpage_1.dw_general.object.mes_22_t.text		= string(ldt_fecha_22,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_23  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_22
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_23) then
			tab_1.tabpage_1.dw_general.object.mes_23_t.text		= string(ldt_fecha_23,'dd/mm/yy')
		end if
	end if
	SELECT DISTINCT MAX("FACTURA_OFERTA"."FECHA_CIERRE")
	INTO	:ldt_fecha_24  
	FROM	"FACTURA_OFERTA"  
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_23
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_24) then
			tab_1.tabpage_1.dw_general.object.mes_24_t.text		= string(ldt_fecha_24,'dd/mm/yy')
		end if
	end if
	
	st_fondo.visible																		= true
	st_cuenta.visible																		= true
	hpb_1.visible 																			= true
	st_porc.visible 																		= true
	ldb_tot_porc																			= 0
	ldb_tot_porc_aux																		= 0			
	hpb_1.Position																			= ldb_tot_porc
	
	SELECT	COUNT("BASE")
	INTO		:ll_tot_reg
   FROM		"VISTA_PERSISTENCIA"  
   WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_24 ) AND  
        		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_01 ) AND
				( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) 
	USING		sqlca;	
	
	DECLARE x1 CURSOR FOR	
	SELECT	"BASE",		"SERIE",		"NUMERO",	"FECHA_CIERRE",	"FECHA_PRIM",		"NRO_CUOTAS",	"CTAS_PAG_S",	"ESTADO",	"COD_PARQUE",		"FECHA_RES",	"CAD_BASE",			"CAD_SERIE",		"CAD_CONTRATO",	"RUT",	"COD_AGE",	"COD_SUP"	  
   FROM		"VISTA_PERSISTENCIA"  
   WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_24 ) AND  
        		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_01 ) AND
				( "VISTA_PERSISTENCIA"."MORA_CRED" > 1) and    
				( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) 
	USING		sqlca;			
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_fact,	:ldt_fecha_prim,	:ll_plazo,	:ll_cta_pag,	:ls_estado,	:ll_cod_parque,	:ldt_fecha_res,	:ls_base_consul,	:ls_serie_consul,	:ll_numero_consul, :ll_rut,	:ls_cod_age,	:ls_cod_sup;	
			if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 then
				ll_new																= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"base",ls_base)   
				dw_lista.setitem(ll_new,"serie",ls_serie)   
				dw_lista.setitem(ll_new,"numero",ll_numero)
				dw_lista.setitem(ll_new,"rut",ll_rut)
				dw_lista.setitem(ll_new,"base_consul",ls_base_consul)   
				dw_lista.setitem(ll_new,"serie_consul",ls_serie_consul)   
				dw_lista.setitem(ll_new,"numero_consul",ll_numero_consul)
				dw_lista.setitem(ll_new,"fecha_prim",ldt_fecha_prim)
				dw_lista.setitem(ll_new,"fecha_fact",ldt_fecha_fact)
				dw_lista.setitem(ll_new,"cod_age",ls_cod_age)
				dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
				
				
				
				if ls_estado= 'P' then
					if ldt_fecha_01 < ldt_fecha_res then
						SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE") 
						INTO		:ldt_fecha_est 
						FROM 		"FACTURA_OFERTA"  
						WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul ) AND  
									( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
									( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
									( "FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_01 ) AND  
									( "FACTURA_OFERTA"."ESTADO" = 'S' )
						USING		Trans_1;
						if Trans_1.sqlcode = 0 then
							if not isnull(ldt_fecha_est) then
								ldt_fecha_est										= ldt_fecha_est
							end if
						end if
						SELECT	"FACTURA_OFERTA"."ESTADO_CADENA"  
						INTO		:ls_estado  
						FROM 		"FACTURA_OFERTA"  
						WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul) AND  
									( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
									( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
									( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fecha_est ) AND  
									( "FACTURA_OFERTA"."ESTADO" = 'S' )
						USING		Trans_1;
						if Trans_1.sqlcode = 0 then
							if not isnull(ls_estado) and ls_estado <> '' then
								ls_estado											= ls_estado
							else
								ls_estado											= ls_estado
							end if
						else
							ls_estado												= ls_estado
						end if
					else
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado  
						FROM		"CADENA"  
						WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
									( "CADENA"."SERIE" = :ls_serie_consul ) AND  
									( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
									( "CADENA"."COD_PARQUE" = :ll_cod_parque )
						USING		Trans_1;
						if Trans_1.sqlcode = 0 then
							if not isnull(ls_estado) and ls_estado <> '' then
								ls_estado											= ls_estado
							else
								ls_estado											= ls_estado
							end if
						else
							ls_estado												= ls_estado
						end if
					end if
				else
					SELECT	"CADENA"."ESTADO"  
					INTO 		:ls_estado  
					FROM		"CADENA"  
					WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
								( "CADENA"."SERIE" = :ls_serie_consul ) AND  
								( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
								( "CADENA"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ls_estado) and ls_estado <> '' then
							ls_estado												= ls_estado
						else
							ls_estado												= ls_estado
						end if
					else
						ls_estado													= ls_estado
					end if
				end if
				SELECT	sum("INGRESO"."CUOTAS_PAG")  
				INTO		:ll_sum_pag_post  
				FROM		"CADENA",	"INGRESO"  
				WHERE		( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
							( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
							( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
							( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
							( "CADENA"."SERIE" = :ls_serie_consul ) AND  
							( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
							( "INGRESO"."TIPO_MOV" = 'E' ) and
							( "INGRESO"."FECHA_PAGO" > :ldt_fecha_01 ) and
							( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					if not isnull(ll_sum_pag_post) and ll_sum_pag_post>0 then
						ll_sum_pag_post											= ll_sum_pag_post
					else
						ll_sum_pag_post											= 0
					end if
				else
					ll_sum_pag_post												= 0
				end if
				
/*REPACTA*/	SELECT	MAX("SOL_REPACTA_CVTA"."FECVTA_1_VCTO")
				INTO		:ldt_fec_repac  
				FROM 		"SOL_REPACTA_CVTA"
				WHERE		"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
							"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
							"SOL_REPACTA_CVTA"."NUMERO" = :ll_numero_consul AND
							"SOL_REPACTA_CVTA"."FECHA_INFOR" >= :ldt_fecha_01
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					if not isnull(ldt_fec_repac) then
						SELECT	"SOL_REPACTA_CVTA"."FECVTA_1_VCTO"
						INTO		:ldt_fecha_prim  
						FROM 		"SOL_REPACTA_CVTA"
						WHERE		"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
									"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
									"SOL_REPACTA_CVTA"."NUMERO" = :ll_numero_consul AND
									"SOL_REPACTA_CVTA"."FECVTA_1_VCTO" = :ldt_fec_repac
						USING		Trans_1;
						if Trans_1.sqlcode = 0 then
							if not isnull(ldt_fecha_prim) then
								ldt_fecha_prim										= ldt_fecha_prim
							end if
						end if
					end if
				end if
				ll_ctas_pag_1														= ll_cta_pag - ll_sum_pag_post
				select	to_char(add_months( to_date(:ldt_fecha_prim), :ll_ctas_pag_1 ),'dd/mm/yyyy')  
				INTO		:ls_fecha
				from 		dual;
				ldt_fecha_venc	= datetime(date(string(ls_fecha)),time('00:00:00'))
				ll_dias_mora														= DaysAfter(date(ldt_fecha_venc), date(ldt_fecha_01)) 
				if ll_dias_mora <= 5 then
					ll_mora_01														= 0
				else
					ll_dia_venc														= day(date(ldt_fecha_prim))
					ll_mes_venc														= month(date(ldt_fecha_prim))
					ll_ano_venc														= year(date(ldt_fecha_prim))
					ll_dia_01														= day(date(ldt_fecha_01))
					ll_mes_01														= month(date(ldt_fecha_01))
					ll_ano_01														= year(date(ldt_fecha_01))
					ll_resta_ano													= ll_ano_01 - ll_ano_venc
					ll_resta_ano													= ll_resta_ano * 12
					ll_resta_mes													= ll_mes_01 - ll_mes_venc
					ll_cuota_venc													= ll_resta_ano + ll_resta_mes 
					if ll_dia_01 > ll_dia_venc then 
						ll_cuota_venc  	                             	= ll_cuota_venc + 1 
					end if 
					if ll_cuota_venc < 0 then 
						ll_cuota_venc                          			= 0 
					end if												
					if ll_cuota_venc > ll_plazo then 
						ll_cuota_venc                              		= ll_plazo 
					end if 
					ll_mora_01														= ll_cuota_venc - ll_ctas_pag_1 
					if ll_mora_01 <= 0 then 
						ll_mora_01													= 0 
					end if
				end if
				
				ll_mora_011	 		= f_mora_credito_tot(ls_base_consul,ls_serie_consul,ll_numero_consul,ldt_fecha_01)	
				
				
				ll_cta_venta														= 0
				ll_cta_mora															= 0
				if ls_estado <> 'P' then
					ll_cta_venta													= 1
					if ll_mora_01 >= ll_mora then
						ll_cta_mora													= 1
					else
						ll_cta_mora													= 0
					end if
				else
					ll_cta_venta													= 0
				end if
				//dw_lista.setitem(ll_new,"fec_cierre_01",ldt_fecha_01)	
				dw_lista.setitem(ll_new,"mora_01",ll_mora_01)
				//dw_lista.setitem(ll_new,"cta_vta_01",ll_cta_venta)
				//dw_lista.setitem(ll_new,"cta_mora_01",ll_cta_mora)
				dw_lista.setitem(ll_new,"prueba",ll_mora_011)
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ll_numero);setnull(ls_base_consul);setnull(ls_serie_consul);setnull(ll_numero_consul)
			if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text																= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux															= ldb_tot_porc
				end if
				ldb_tot_porc																	= (ll_new / ll_tot_reg) * 100
				hpb_1.Position 																= ldb_tot_porc
				st_cuenta.text 																= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_new,'###,###,###')+' ( '+string((ll_new*100)/ll_tot_reg,'#0.##')+'% )'
		LOOP
	else
		messagebox("Advertencia","No registra Datos")
	end if
	close x1;
end if
SetPointer(Arrow!)
st_fondo.visible																				= false
st_cuenta.visible																				= false
hpb_1.visible 																					= false
st_porc.visible 																				= false

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
em_fin.text																						= string(gdt_fec_sistema)
end event

type dw_parque from datawindow within w_evolucion_mora_cierre
integer x = 3502
integer y = 52
integer width = 878
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//dw_premio_caja.reset()
//dw_premio_mejor.reset()
////pb_aceptar.triggerevent(clicked!)
end event

type cb_limpiar from commandbutton within w_evolucion_mora_cierre
integer x = 3547
integer y = 2052
integer width = 238
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;//string	ls_nulo
//
//Setnull(ls_nulo)
//tab_1.tabpage_1.dw_general.reset()
//tab_1.tabpage_2.dw_produccion.reset()
//tab_1.tabpage_3.dw_dotacion.reset()
//tab_1.tabpage_4.dw_productividad.reset()
//tab_1.tabpage_5.dw_morosidad.reset()
//dw_fecha_cierre.reset()
//dw_fecha_cierre.insertrow(0)
//w_sales_meeting.triggerevent(open!)
end event

type tab_1 from tab within w_evolucion_mora_cierre
event create ( )
event destroy ( )
integer y = 180
integer width = 1285
integer height = 1796
integer taborder = 40
integer textsize = -8
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
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;//em_agente.text						= ''
//if tab_1.selectedtab=1 then
//	if tab_1.tabpage_1.dw_general.rowcount() > 0 then
//		st_promesa.enabled		= true
//		em_agente.enabled			= true
//		pb_buscar.enabled			= true
//	end if
//
//elseif tab_1.selectedtab=2 then
//	if tab_1.tabpage_2.dw_produccion.rowcount() > 0 then
//		st_promesa.enabled		= true
//		em_agente.enabled			= true
//		pb_buscar.enabled			= true
//	end if
//
//elseif tab_1.selectedtab=3 then
//	if tab_1.tabpage_3.dw_dotacion.rowcount() > 0 then 
//		st_promesa.enabled		= false
//		em_agente.enabled			= false
//		pb_buscar.enabled			= false
//	end if
//elseif tab_1.selectedtab=4 then
//	if tab_1.tabpage_4.dw_productividad.rowcount() > 0 then
//		st_promesa.enabled		= true
//		em_agente.enabled			= true
//		pb_buscar.enabled			= true
//	end if
//elseif tab_1.selectedtab=5 then
//	if tab_1.tabpage_5.dw_morosidad.rowcount() > 0 then
//		st_promesa.enabled		= true
//		em_agente.enabled			= true
//		pb_buscar.enabled			= true
//	end if
//end if
//
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1248
integer height = 1676
long backcolor = 67108864
string text = "Tabla General"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_general dw_general
end type

on tabpage_1.create
this.dw_general=create dw_general
this.Control[]={this.dw_general}
end on

on tabpage_1.destroy
destroy(this.dw_general)
end on

type dw_general from datawindow within tabpage_1
integer x = 5
integer y = 12
integer width = 4041
integer height = 1668
integer taborder = 30
string title = "none"
string dataobject = "dwe_evol_mora_general"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1248
integer height = 1676
long backcolor = 67108864
string text = "Períodos Comparativos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1248
integer height = 1676
long backcolor = 67108864
string text = "Gráficos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1248
integer height = 1676
long backcolor = 67108864
string text = "Porcentaje Mora"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 1248
integer height = 1676
long backcolor = 67108864
string text = "Ventas Facturadas"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type cb_exportar from commandbutton within w_evolucion_mora_cierre
integer x = 3310
integer y = 2052
integer width = 238
integer height = 80
integer taborder = 90
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

type cb_imprimir from commandbutton within w_evolucion_mora_cierre
integer x = 41
integer y = 2048
integer width = 302
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//if tab_1.selectedtab=1 then
//	if tab_1.tabpage_1.dw_general.rowcount() > 0 then f_printdlg(tab_1.tabpage_1.dw_general,gstr_print,w_sales_meeting)
//elseif tab_1.selectedtab=2 then
//	if tab_1.tabpage_2.dw_produccion.rowcount() > 0 then f_printdlg(tab_1.tabpage_2.dw_produccion,gstr_print,w_sales_meeting)
//elseif tab_1.selectedtab=3 then
//	if tab_1.tabpage_3.dw_dotacion.rowcount() > 0 then f_printdlg(tab_1.tabpage_3.dw_dotacion,gstr_print,w_sales_meeting)
//elseif tab_1.selectedtab=4 then
//	if tab_1.tabpage_4.dw_productividad.rowcount() > 0 then f_printdlg(tab_1.tabpage_4.dw_productividad,gstr_print,w_sales_meeting)
//elseif tab_1.selectedtab=5 then
//	if tab_1.tabpage_5.dw_morosidad.rowcount() > 0 then f_printdlg(tab_1.tabpage_5.dw_morosidad,gstr_print,w_sales_meeting)
//end if
end event

type dw_fecha_cierre from datawindow within w_evolucion_mora_cierre
integer x = 41
integer y = 16
integer width = 955
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_cierre_factura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////this.accepttext()
////messagebox("Inicial - final", string(this.getitemdatetime(1,'cierre_ventas_1'),'dd/mm/yyyy')+'  /  '+string(this.getitemdatetime(1,'cierre_ventas'),'dd/mm/yyyy'))
//tab_1.tabpage_1.dw_general.reset()
//tab_1.tabpage_2.dw_produccion.reset()
//tab_1.tabpage_3.dw_dotacion.reset()
//tab_1.tabpage_4.dw_productividad.reset()
//tab_1.tabpage_5.dw_morosidad.reset()
//
end event

type pb_aceptar from picturebutton within w_evolucion_mora_cierre
integer x = 4407
integer y = 44
integer width = 133
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

type cb_cerrar from commandbutton within w_evolucion_mora_cierre
integer x = 4983
integer y = 2048
integer width = 302
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_evolucion_mora_cierre)
end event

