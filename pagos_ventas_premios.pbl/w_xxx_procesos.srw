forward
global type w_xxx_procesos from window
end type
type cb_exportar from commandbutton within w_xxx_procesos
end type
type cb_ordenar from commandbutton within w_xxx_procesos
end type
type cb_cta_cte from commandbutton within w_xxx_procesos
end type
type cb_2 from commandbutton within w_xxx_procesos
end type
type dw_lista from datawindow within w_xxx_procesos
end type
type cb_1 from commandbutton within w_xxx_procesos
end type
type cb_cerrar from commandbutton within w_xxx_procesos
end type
end forward

global type w_xxx_procesos from window
integer x = 832
integer y = 360
integer width = 2487
integer height = 2196
boolean titlebar = true
string title = "Creación Archivo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_cta_cte cb_cta_cte
cb_2 cb_2
dw_lista dw_lista
cb_1 cb_1
cb_cerrar cb_cerrar
end type
global w_xxx_procesos w_xxx_procesos

type variables
Long	il_row
end variables

on w_xxx_procesos.create
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_cta_cte=create cb_cta_cte
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_exportar,&
this.cb_ordenar,&
this.cb_cta_cte,&
this.cb_2,&
this.dw_lista,&
this.cb_1,&
this.cb_cerrar}
end on

on w_xxx_procesos.destroy
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_cta_cte)
destroy(this.cb_2)
destroy(this.dw_lista)
destroy(this.cb_1)
destroy(this.cb_cerrar)
end on

event open;connect using Trans_1;
connect using Trans_2;
gf_centrar(w_xxx_procesos)

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_exportar from commandbutton within w_xxx_procesos
integer x = 1321
integer y = 1940
integer width = 238
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_xxx_procesos
integer x = 1070
integer y = 1940
integer width = 238
integer height = 104
integer taborder = 50
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

type cb_cta_cte from commandbutton within w_xxx_procesos
integer x = 32
integer y = 1940
integer width = 425
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;gs_base						= dw_lista.getitemstring(il_row,'cadena_codigo')
gs_serie						= dw_lista.getitemstring(il_row,'cadena_serie')
gi_numero 					= dw_lista.getitemnumber(il_row,'cadena_numero')
gi_rut							= dw_lista.getitemnumber(il_row,'cadena_rut')
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
END CHOOSE
end event

type cb_2 from commandbutton within w_xxx_procesos
integer x = 695
integer y = 44
integer width = 457
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Porce Ingreso"
end type

event clicked;string		ls_base,ls_serie,ls_moneda
long		ll_tot_reg,ll_indi,ll_precio
double	ldb_numero,ldb_precio,ldb_uf,ldb_monto,ldb_porce_cierre,ldb_porce_ini,ldb_valida
datetime	ldt_fec_cierre

SetPointer(HourGlass!)
dw_lista.dataobject								= 'dw_valida_poce_ingreso'
dw_lista.settransobject(sqlca)
ll_tot_reg											= dw_lista.retrieve()
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		ls_base									= dw_lista.getitemstring(ll_indi,'cadena_codigo')
		ls_serie									= dw_lista.getitemstring(ll_indi,'cadena_serie')
		ldb_numero								= dw_lista.getitemnumber(ll_indi,'cadena_numero')
		ls_moneda								= dw_lista.getitemstring(ll_indi,'pago_oferta_moneda')
		ldb_precio								= dw_lista.getitemnumber(ll_indi,'pago_oferta_precio')
		ldb_uf										= dw_lista.getitemnumber(ll_indi,'tab_uf_valor_uf')
		ldt_fec_cierre							= dw_lista.getitemdatetime(ll_indi,'oferta_v_cierre_venta')
		ldb_porce_ini							= round(dw_lista.getitemnumber(ll_indi,'oferta_v_porce_ing_cierre'),0)
		
		if ls_moneda='1' then
			ll_precio								= round(ldb_precio,0)
		elseif ls_moneda='2' then
			ll_precio								= round((ldb_precio*ldb_uf),0)
		end if
		ldb_monto								= f_monto_ingr_cierre(ls_base,ls_serie,ldb_numero,ldt_fec_cierre)
		ldb_porce_cierre						= round(((ldb_monto / ll_precio ) * 100),0)
		ldb_valida								= round(ldb_porce_ini - ldb_porce_cierre,0)		
		dw_lista.setitem(ll_indi,"porce",ldb_porce_cierre)
		dw_lista.setitem(ll_indi,"valida",ldb_valida)
		dw_lista.accepttext()
	next
else
	messagebox("Advertencia","No Registra Datos")
end if
end event

type dw_lista from datawindow within w_xxx_procesos
integer x = 37
integer y = 216
integer width = 2386
integer height = 1684
integer taborder = 20
string title = "none"
string dataobject = "dw_valida_poce_ingreso"
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

type cb_1 from commandbutton within w_xxx_procesos
integer x = 73
integer y = 48
integer width = 599
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modifica Beneficiario"
end type

event clicked;string		ls_base,ls_serie,ls_tipo_benef,ls_max_benef,ls_benef
long		ll_cta_rut,ll_contador,ll_num,ll_graba=0,ll_cta
double	ldb_numero


SELECT	count("BASE")
INTO		:ll_cta
FROM		"VISTA_BENEF_DUPLICADOS"  
WHERE 	"VISTA_BENEF_DUPLICADOS"."DUPLIC" >= 2
USING	sqlca;
if isnull(ll_cta) then ll_cta=0

DECLARE x1 CURSOR FOR
SELECT	"BASE",	"SERIE",	"NRO_OFERTA",   "TIPO_BENEFICIARIO"
FROM		"VISTA_BENEF_DUPLICADOS"  
WHERE 	"VISTA_BENEF_DUPLICADOS"."DUPLIC" >= 2
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,:ls_tipo_benef;
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
			SELECT	count("RUT"),max("CONTADOR_2")    
   			INTO 		:ll_cta_rut, :ll_contador
    			FROM		"CO_PROP"  
   			WHERE	"CO_PROP"."BASE" = :ls_base AND  
         				"CO_PROP"."SERIE" = :ls_serie AND  
         				"CO_PROP"."NRO_OFERTA" = :ldb_numero AND  
         				"CO_PROP"."TIPO_BENEFICIARIO" = :ls_tipo_benef
			USING	Trans_1;
			if isnull(ll_cta_rut) then ll_cta_rut=0
			if isnull(ll_contador) then ll_contador=0
			if ll_cta_rut>=2 then
				SELECT	max("TIPO_BENEFICIARIO" )    
				INTO 		:ls_max_benef
				FROM		"CO_PROP"  
				WHERE	( "CO_PROP"."BASE" = :ls_base ) AND  
							( "CO_PROP"."SERIE" = :ls_serie ) AND  
							( "CO_PROP"."NRO_OFERTA" = :ldb_numero)
				USING	Trans_1;
				if isnull(ls_max_benef) then ls_max_benef=''
				if not isnull(ls_max_benef) then
					ll_num						= long(mid(ls_max_benef,6,1))
					if ll_num>0 then
						ll_num++
						ls_benef					= 'BENEF'+string(ll_num)
						if not isnull(ls_benef) then
							UPDATE "CO_PROP"  
     						SET 		"TIPO_BENEFICIARIO" = :ls_benef  
   							WHERE	"CO_PROP"."BASE" = :ls_base AND  
										"CO_PROP"."SERIE" = :ls_serie AND  
										"CO_PROP"."NRO_OFERTA" = :ldb_numero AND  
										"CO_PROP"."TIPO_BENEFICIARIO" = :ls_tipo_benef AND  
										"CO_PROP"."CONTADOR_2" = :ll_contador
							USING	Trans_2;
							if Trans_2.sqlcode = 0 then
								commit using Trans_2;
								ll_graba++
							else
								rollback using Trans_2;
								messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+Trans_2.sqlerrtext)
							end if
						end if
					end if
				end if
			end if
		end if
		setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ls_tipo_benef);setnull(ll_num);setnull(ls_benef);setnull(ls_max_benef)
	LOOP
end if
close x1;
messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cta,'###,###,##0')+' registros grabados con exito~r~n'+&
										'y '+string(ll_graba,'###,###,##0')+' registros con problemas.',information!)


end event

type cb_cerrar from commandbutton within w_xxx_procesos
integer x = 2121
integer y = 1940
integer width = 302
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_xxx_procesos)
end event

