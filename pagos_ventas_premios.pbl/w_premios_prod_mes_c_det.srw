forward
global type w_premios_prod_mes_c_det from window
end type
type cb_cta_cte from commandbutton within w_premios_prod_mes_c_det
end type
type cb_imprimir from commandbutton within w_premios_prod_mes_c_det
end type
type cb_cerrar from commandbutton within w_premios_prod_mes_c_det
end type
type dw_detalle from datawindow within w_premios_prod_mes_c_det
end type
end forward

global type w_premios_prod_mes_c_det from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Detalle Producción por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_premios_prod_mes_c_det w_premios_prod_mes_c_det

type variables
long il_row
end variables

on w_premios_prod_mes_c_det.create
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_premios_prod_mes_c_det.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_codigo,ls_base,ls_serie,ls_clasif_vta,ls_fecha_producc
long		ll_tot_reg,ll_indi
datetime	ldt_fecha,ldt_fecha_producc,ldt_cierre_vta,ldt_fecha_uf
double	ldb_numero,ldb_valor_uf

gf_centrar(w_premios_prod_mes_c_det)
dw_detalle.dataobject = 'dw_premios_prod_mes_c'
dw_detalle.settransobject(sqlca)
ldt_fecha											= datetime((date(substr(1,1,Message.StringParm))),time('00:00:00'))
ls_codigo											= substr(1,2,Message.StringParm)
ll_tot_reg											= dw_detalle.retrieve(ldt_fecha,ls_codigo)
if ll_tot_reg>0 then
	dw_detalle.Object.usuario.text 			= gs_user
	for ll_indi = 1 to ll_tot_reg
		ls_base										= dw_detalle.getitemstring(ll_indi,'cadena_codigo')
		ls_serie										= dw_detalle.getitemstring(ll_indi,'oferta_v_serie')
		ldb_numero									= dw_detalle.getitemnumber(ll_indi,'oferta_v_nro_oferta')
		ldt_cierre_vta								= dw_detalle.getitemdatetime(ll_indi,'oferta_v_cierre_venta')
		if ls_base='O' then
			SELECT	"CLASIFICA_VENTA","FECHA_PRODUCC"  
    		INTO		:ls_clasif_vta, :ldt_fecha_producc  
    		FROM		"OFERTA_V"  
   		WHERE		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
         			( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_clasif_vta) or ls_clasif_vta<>'' then
					ls_clasif_vta					= ls_clasif_vta
					ls_fecha_producc				= string(ldt_fecha_producc,'dd/mm/yyyy')
					if ls_clasif_vta='C' then
						ldt_fecha_uf				= ldt_fecha_producc
					else
						ldt_fecha_uf				= ldt_cierre_vta
					end if
				else
					ls_clasif_vta					= ''
				end if
			else
				ls_clasif_vta						= ''
			end if
		elseif ls_base='A' then
			ls_clasif_vta							= ''
			ls_fecha_producc						= ''
			ldt_fecha_uf							= ldt_cierre_vta
		elseif ls_base='L' then
			ls_clasif_vta							= ''
			ls_fecha_producc						= ''
			ldt_fecha_uf							= ldt_cierre_vta
		end if
		SELECT	"TAB_UF"."VALOR_UF"  
    	INTO		:ldb_valor_uf  
    	FROM		"TAB_UF"  
   	WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_uf
		USING		sqlca;
		dw_detalle.setitem(ll_indi,'c_clasif_vta',ls_clasif_vta)
		dw_detalle.setitem(ll_indi,'c_fec_producc',ls_fecha_producc)
		dw_detalle.setitem(ll_indi,'c_valor_uf',ldb_valor_uf)
		dw_detalle.accepttext()
	next
else
	messagebox("Advertencia","No registra dato")
	close(w_premios_prod_mes_c_det)
end if
end event

type cb_cta_cte from commandbutton within w_premios_prod_mes_c_det
integer x = 41
integer y = 1656
integer width = 425
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

dw_detalle.accepttext()
if dw_detalle.rowcount() > 0 then
	if il_row>0 then
		gs_base				= dw_detalle.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_detalle.getitemstring(il_row,'oferta_v_serie')
		gi_numero			= dw_detalle.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut				= dw_detalle.getitemnumber(il_row,'cadena_rut')
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
	end if
end if
end event

type cb_imprimir from commandbutton within w_premios_prod_mes_c_det
integer x = 2651
integer y = 1656
integer width = 315
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_res

if dw_detalle.rowcount() > 0 then
	ll_res			= MessageBox("Imprimir", "Desea Imprimir el Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_detalle )
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_cerrar from commandbutton within w_premios_prod_mes_c_det
integer x = 2971
integer y = 1656
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_prod_mes_c_det)
end event

type dw_detalle from datawindow within w_premios_prod_mes_c_det
integer x = 37
integer y = 36
integer width = 3259
integer height = 1580
integer taborder = 10
string title = "none"
string dataobject = "dw_premios_prod_mes_c"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

