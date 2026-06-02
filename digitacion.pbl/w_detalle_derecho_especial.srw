forward
global type w_detalle_derecho_especial from window
end type
type dw_detalle from datawindow within w_detalle_derecho_especial
end type
type cb_print_ctto from commandbutton within w_detalle_derecho_especial
end type
type dw_print from datawindow within w_detalle_derecho_especial
end type
type cb_filtrar from commandbutton within w_detalle_derecho_especial
end type
type cb_sort from commandbutton within w_detalle_derecho_especial
end type
type cb_exportar from commandbutton within w_detalle_derecho_especial
end type
type cb_imprimir from commandbutton within w_detalle_derecho_especial
end type
type cb_eliminar from commandbutton within w_detalle_derecho_especial
end type
type cb_nuevo from commandbutton within w_detalle_derecho_especial
end type
type cb_cerrar from commandbutton within w_detalle_derecho_especial
end type
type dw_reporte from datawindow within w_detalle_derecho_especial
end type
end forward

global type w_detalle_derecho_especial from window
integer width = 3177
integer height = 2044
boolean titlebar = true
string title = "Ingreso Derecho Especial"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_detalle dw_detalle
cb_print_ctto cb_print_ctto
dw_print dw_print
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
dw_reporte dw_reporte
end type
global w_detalle_derecho_especial w_detalle_derecho_especial

type variables
String		is_base,is_serie
Long		il_row
Double	il_numero
end variables

on w_detalle_derecho_especial.create
this.dw_detalle=create dw_detalle
this.cb_print_ctto=create cb_print_ctto
this.dw_print=create dw_print
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.dw_reporte=create dw_reporte
this.Control[]={this.dw_detalle,&
this.cb_print_ctto,&
this.dw_print,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_eliminar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.dw_reporte}
end on

on w_detalle_derecho_especial.destroy
destroy(this.dw_detalle)
destroy(this.cb_print_ctto)
destroy(this.dw_print)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.dw_reporte)
end on

event open;Long		ll_rut
String	ls_dv,ls_nombre,ls_ap_pat, ls_ap_mat,ls_estado,ls_descrip
gf_centrar(w_detalle_derecho_especial)
if gs_opera='1' or gs_opera='2' or gs_opera='3' then
	cb_nuevo.enabled			= true
	cb_eliminar.enabled		= true
	cb_print_ctto.enabled	= true
	cb_exportar.enabled		= true
else
	cb_nuevo.enabled			= false
	cb_eliminar.enabled		= false
	cb_print_ctto.enabled	= false
	cb_exportar.enabled		= false
end if
is_base 			= 'O'
is_serie			= substr(1,1,Message.StringParm)
il_numero		= Double(substr(1,2,Message.StringParm))
dw_reporte.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
SELECT	"CLIENTE"."RUT",   
			"CLIENTE"."DV",   
			"CLIENTE"."NOMBRE",   
			"CLIENTE"."A_PATERNO",   
			"CLIENTE"."A_MATERNO",
			"CADENA"."ESTADO"
INTO 		:ll_rut,   
			:ls_dv,   
			:ls_nombre,   
			:ls_ap_pat,   
			:ls_ap_mat,
			:ls_estado
FROM 		"CADENA",   
			"CLIENTE"  
WHERE	(	"CADENA"."RUT" = "CLIENTE"."RUT" ) and  
		(( "CADENA"."CODIGO" = 'O' ) AND  
		( 	"CADENA"."SERIE" = :is_serie ) AND  
		( 	"CADENA"."NUMERO" = :il_numero ) )   
USING		sqlca;
if sqlca.sqlcode=0 then
	SELECT	"ESTADO"."NOMBRE_ESTADO"  
	INTO 		:ls_descrip  
	FROM 		"ESTADO"  
	WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado ;

	dw_reporte.retrieve(is_serie,il_numero,is_base)
	dw_reporte.object.t_promesa.text				= is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
	dw_reporte.object.t_rut.text					= string(ll_rut,"###,###,###,###")+'-'+ls_dv
	dw_reporte.object.t_nombre_cliente.text	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
	dw_reporte.object.t_estado.text				= ls_descrip
end if
end event

type dw_detalle from datawindow within w_detalle_derecho_especial
boolean visible = false
integer x = 1499
integer y = 1992
integer width = 837
integer height = 432
string title = "none"
string dataobject = "dwe_cuotas_pactadas_derecho_especial"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_ctto from commandbutton within w_detalle_derecho_especial
integer x = 1125
integer y = 1824
integer width = 672
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print C&tto Derecho Especial"
end type

event clicked;Long		ll_nro_promesa,ll_nro_ctas,ll_dia,ll_mes,ll_anno,i,ll_new,ll_dia_aux,&
			ll_cta_pag_la,ll_cta_pag_isa,ll_cta_pag,ll_nro_derecho,ll_print_contrato,&
			ll_nro_pagare,ll_resp,ll_sw_pasa=0
Double	ld_valor_cuota
Date		ld_fecha,ld_fec_pago
String	ls_fecha,ls_moneda,ls_nombre,ls_serie_derecho,ls_serie_promesa,ls_serie_pagare,&
			ls_estado,ls_descrip

if dw_reporte.rowcount()>0 then
	ls_serie_derecho		= dw_reporte.getitemstring(il_row,'derecho_serie_p')
	ll_nro_derecho			= dw_reporte.getitemnumber(il_row,'derecho_nro_pagare') 
	SELECT	"DERECHO"."NRO_OFERTA",
				"DERECHO"."SERIE",
				"DERECHO"."PRINT_CONTRATO"
	INTO 		:ll_nro_promesa,
				:ls_serie_promesa,
				:ll_print_contrato
	FROM 		"DERECHO"  
	WHERE  ( "DERECHO"."SERIE_P" = :is_serie ) AND  
			 ( "DERECHO"."NRO_PAGARE" = :ll_nro_derecho )   
	USING		SQLCA;
	if sqlca.sqlcode=0 then
		ll_print_contrato ++
		if dw_print.retrieve(is_serie,ll_nro_derecho)>0 then 
			SELECT	"PAGARE_V"."NUMERO_P",
						"PAGARE_V"."SERIE_P"
			INTO 		:ll_nro_pagare,
						:ls_serie_pagare
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE" = :is_serie ) AND  
					 ( "PAGARE_V"."NUMERO" = :ll_nro_derecho ) AND 
					 ( "PAGARE_V"."BASE" = 'D' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_print.object.t_pagare.text	= 'P - '+ls_serie_pagare+' - '+string(ll_nro_pagare,"###,###,###,###,###")
			end if
			DO WHILE ll_sw_pasa=0
				f_Print( dw_print )
	//			dw_print.print()
				ll_nro_ctas				= dw_reporte.getitemnumber(il_row,'derecho_plazo')
				ld_fecha					= date(dw_reporte.getitemdatetime(il_row,'derecho_fecha_prim'))
				ll_dia					= day(ld_fecha)
				ll_mes					= month(ld_fecha)
				ll_anno					= year(ld_fecha)
				ld_valor_cuota			= dw_reporte.getitemnumber(il_row,'derecho_valor_cuo')
				ls_moneda				= dw_reporte.getitemstring(il_row,'derecho_moneda')
				ll_cta_pag_la			= dw_reporte.getitemnumber(il_row,'derecho_cta_pag_la')
				ll_cta_pag_isa			= dw_reporte.getitemnumber(il_row,'derecho_cta_pag_isa')
				ls_estado				= dw_reporte.getitemstring(il_row,'derecho_estado')
				ll_cta_pag				= ll_cta_pag_la + ll_cta_pag_isa
				dw_detalle.reset()
				for i=1 to ll_nro_ctas
					ll_new				= dw_detalle.insertrow(0)
					dw_detalle.setitem(ll_new,'monto',ld_valor_cuota)
					dw_detalle.setitem(ll_new,'uf',gd_uf_dia)
					dw_detalle.setitem(ll_new,'moneda',ls_moneda)
					if ll_dia > 28 and ll_mes =2 then
						ll_dia_aux		= 28
					elseif ll_dia > 30 and (ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11) then
						ll_dia_aux		= 30
					else
						ll_dia_aux		= ll_dia
					end if
					ls_fecha				= string(ll_dia_aux,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
					ld_fec_pago			= date(ls_fecha)
					dw_detalle.setitem(ll_new,'fecha',ld_fec_pago)
					ll_mes++
					if ll_mes>12 then
						ll_mes			= 1
						ll_anno++
					end if
					if i > ll_cta_pag then
						dw_detalle.setitem(ll_new,'estado','V')				
					else
						dw_detalle.setitem(ll_new,'estado','C')
					end if
				next
				gi_rut										= dw_reporte.getitemnumber(il_row,'cliente_rut')
				gs_dv											= dw_reporte.getitemstring(il_row,'cliente_dv')
				ls_nombre									= dw_reporte.getitemstring(il_row,'cliente_nombre')+' '+dw_reporte.getitemstring(il_row,'cliente_a_paterno')+' '+dw_reporte.getitemstring(il_row,'cliente_a_materno')
				dw_detalle.object.t_titulo.text		= 'Detalle Cuotas Derecho Especial Nº:   D - '+ls_serie_derecho+' - '+string(ll_nro_derecho,"###,###,###,###,##0")
				dw_detalle.object.t_titulo_1.text	= 'CLIENTE  '+string(gi_rut,"###,###,###,##0")+' - '+gs_dv+'     '+trim(ls_nombre)
				dw_detalle.object.t_titulo_2.text	= 'CONTRATO ORIGINAL:   O - '+ls_serie_promesa+ ' - '+string(ll_nro_promesa,"###,###,###,###,##0")
				SELECT	"ESTADO"."NOMBRE_ESTADO"  
				INTO 		:ls_descrip  
				FROM 		"ESTADO"  
				WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado   
				USING		sqlca;
				if sqlca.sqlcode=0 then 
					dw_detalle.object.t_titulo_3.text= 'ESTADO CONTRATO:  '+TRIM(ls_descrip)
				end if
				dw_detalle.print()
	//			dw_detalle.print()
				ll_resp	= MessageBox("Advertencia", "Imprimió Correctamente Contrato Derecho Especial", Exclamation!, YesNo!, 2)
				IF ll_resp = 1 THEN
					ll_sw_pasa++
					UPDATE	"DERECHO"  
					SET 		"PRINT_CONTRATO" = :ll_print_contrato  
					WHERE  ( "DERECHO"."SERIE_P" = :is_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :ll_nro_derecho ) AND  
							 ( "DERECHO"."BASE" = :gs_base )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				ELSE
					ll_resp=0
				END IF
			LOOP
		end if
	else
		messagebox("Advertencia","Antes de Imprimir Contrato debe Grabar Derecho Especial")
	end if
end if
end event

type dw_print from datawindow within w_detalle_derecho_especial
boolean visible = false
integer x = 722
integer y = 1988
integer width = 654
integer height = 432
string dataobject = "dw_ingreso_derecho_especial_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_filtrar from commandbutton within w_detalle_derecho_especial
integer x = 2391
integer y = 1824
integer width = 242
integer height = 100
integer taborder = 80
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
dw_reporte.SETfilter(NULO)
dw_reporte.filter()
end event

type cb_sort from commandbutton within w_detalle_derecho_especial
integer x = 2144
integer y = 1824
integer width = 242
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_reporte.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_reporte.SETSORT(NULO)
	dw_reporte.SORT()
end if
end event

type cb_exportar from commandbutton within w_detalle_derecho_especial
integer x = 1897
integer y = 1824
integer width = 242
integer height = 100
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
dw_paso	= dw_reporte
if dw_reporte.rowcount() > 0 then f_DWToExcel(dw_paso)

end event

type cb_imprimir from commandbutton within w_detalle_derecho_especial
integer x = 768
integer y = 1824
integer width = 256
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

event clicked;if dw_reporte.rowcount() > 0 then
	f_Print( dw_reporte )
end if
end event

type cb_eliminar from commandbutton within w_detalle_derecho_especial
integer x = 389
integer y = 1824
integer width = 279
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechazar"
end type

event clicked;Long		ll_resp,ll_corr, ll_fila,ll_cant, ll_est_ope,ll_est_inf,ll_cta_pag_la,ll_cta_pag_isa,ll_cta_pag
Double	ll_numero
String		ls_string,ls_obs,ls_est_reg,ls_serie
Datetime	ldt_fecha_hoy

if il_row > 0 then
	ls_est_reg	= dw_reporte.getitemstring(il_row,'derecho_estado_reg')
	if ls_est_reg='I' then
		messagebox("Advertencia","Derecho Especial Inactivo")
		cb_nuevo.setfocus()
	else
		ll_resp	= MessageBox("Advertencia", "Está seguro de Inactivar Derecho Especial Nº D-"+dw_reporte.getitemstring(il_row,'derecho_serie_p')+'-'+string(dw_reporte.getitemnumber(il_row,'derecho_nro_pagare')),Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			ll_cta_pag_la	= dw_reporte.getitemnumber(il_row,'derecho_cta_pag_la')
			ll_cta_pag_isa	= dw_reporte.getitemnumber(il_row,'derecho_cta_pag_isa')
			ll_cta_pag		= ll_cta_pag_la + ll_cta_pag_isa
			ls_serie			= dw_reporte.getitemstring(il_row,'derecho_serie_p')
			ll_numero		= dw_reporte.getitemnumber(il_row,'derecho_nro_pagare')
			if ll_cta_pag>0 then
				messagebox("Advertencia","No es posible dejar Inactivo Derecho Especial Nº D-"+dw_reporte.getitemstring(il_row,'derecho_serie_p')+'-'+string(dw_reporte.getitemnumber(il_row,'derecho_nro_pagare'))+', por tener Cuotas Pagadas')
			elseif ll_cta_pag=0 then
				dw_reporte.setitem(il_row,'derecho_estado_reg','I')
				dw_reporte.setitem(il_row,'derecho_estado','N')
				dw_reporte.accepttext()
				if dw_reporte.update()=1 then
					commit;
					UPDATE	"PAGARE_V"  
					SET 		"ESTADO" = 'N'  
					WHERE  ( "PAGARE_V"."NUMERO" = :ll_numero ) AND  
							 ( "PAGARE_V"."SERIE" = :ls_serie ) AND  
							 ( "PAGARE_V"."BASE" = 'D' )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time("00:00:00"))
					UPDATE	"CADENA"  
					SET 		"ESTADO" = 'N',
								"FECHA_RES" = :ldt_fecha_hoy
					WHERE  ( "CADENA"."CODIGO" = 'D' ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
			end if
		END IF
	end if
end if
end event

type cb_nuevo from commandbutton within w_detalle_derecho_especial
integer x = 32
integer y = 1824
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;String	ls_estado,ls_string,ls_estado_reg
Long		ll_tot_reg,ll_indi,ll_corr,ll_cod_parque,ll_sw_pasa=0

ll_tot_reg				= dw_reporte.rowcount()
if isnull(ll_tot_reg) then ll_tot_reg=0
ll_corr					= ll_tot_reg + 1
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_estado_reg	= dw_reporte.getitemstring(ll_indi,'derecho_estado_reg')
		if ls_estado_reg='A' then
			messagebox("Advertencia","No es posible Generar Otro Derecho Especial, Existe uno Activo")
			ll_sw_pasa ++
			exit
		end if
	next
end if
if ll_sw_pasa=0 then
	SELECT	"CADENA"."COD_PARQUE"  
	INTO 		:ll_cod_parque  
	FROM 		"CADENA"  
	WHERE  ( "CADENA"."CODIGO" = 'O' ) AND  
			 ( "CADENA"."SERIE" = :is_serie ) AND  
			 ( "CADENA"."NUMERO" = :il_numero )   ;

	ls_string			= is_serie+'~t'+string(il_numero)+'~t'+string(ll_corr)+'~t'+'N'+'~t'+string(ll_cod_parque)
	if isvalid(w_ingreso_derecho_especial) then close(w_ingreso_derecho_especial)
	openwithparm(w_ingreso_derecho_especial,ls_string)
end if
end event

type cb_cerrar from commandbutton within w_detalle_derecho_especial
integer x = 2857
integer y = 1824
integer width = 265
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_derecho_especial)
end event

type dw_reporte from datawindow within w_detalle_derecho_especial
integer x = 32
integer y = 28
integer width = 3090
integer height = 1760
integer taborder = 10
string dataobject = "dw_lista_derecho_especial"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut	= dw_reporte.getitemnumber(il_row,'cliente_rut')
	gs_dv		= dw_reporte.getitemstring(il_row,'cliente_dv')
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut	= dw_reporte.getitemnumber(il_row,'cliente_rut')
	gs_dv		= dw_reporte.getitemstring(il_row,'cliente_dv')
end if
end event

event doubleclicked;String		ls_serie,ls_string
Long		ll_corr
Double	ll_numero
il_row				= row
if il_row>0 then
	gi_rut			= dw_reporte.getitemnumber(il_row,'cliente_rut')
	gs_dv				= dw_reporte.getitemstring(il_row,'cliente_dv')
	ls_serie			= this.getitemstring(il_row,'derecho_serie_p')
	ll_numero		= this.getitemnumber(il_row,'derecho_nro_pagare')
	ll_corr			= this.getitemnumber(il_row,'derecho_correlativo')
	ls_string		= ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_corr)+'~t'+'M'
	openwithparm(w_ingreso_derecho_especial,ls_string)
end if
end event

