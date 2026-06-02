forward
global type w_ingreso_derecho_especial from window
end type
type cb_nuevo from commandbutton within w_ingreso_derecho_especial
end type
type cb_pagare from commandbutton within w_ingreso_derecho_especial
end type
type dw_detalle from datawindow within w_ingreso_derecho_especial
end type
type dw_print from datawindow within w_ingreso_derecho_especial
end type
type dw_cliente from datawindow within w_ingreso_derecho_especial
end type
type cb_imprimir from commandbutton within w_ingreso_derecho_especial
end type
type cb_grabar from commandbutton within w_ingreso_derecho_especial
end type
type cb_cerrar from commandbutton within w_ingreso_derecho_especial
end type
type dw_derecho from datawindow within w_ingreso_derecho_especial
end type
end forward

global type w_ingreso_derecho_especial from window
integer width = 3625
integer height = 2124
boolean titlebar = true
string title = "Ingresar Derecho Especial"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_nuevo cb_nuevo
cb_pagare cb_pagare
dw_detalle dw_detalle
dw_print dw_print
dw_cliente dw_cliente
cb_imprimir cb_imprimir
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_derecho dw_derecho
end type
global w_ingreso_derecho_especial w_ingreso_derecho_especial

type variables
String	is_serie,is_opcion,is_base='D'
Long		il_corr,il_cod_parque
Double	il_numero,il_nro_derecho
end variables

forward prototypes
public function long wf_valida_todo ()
public subroutine wf_imprimir_contrato ()
public function boolean f_cadena (integer ai_modo)
end prototypes

public function long wf_valida_todo ();Long		ll_pasa=0
Long		ll_plazo,ll_nro_derecho,ll_nro_promesa
Double	ll_precio,ll_tasa,ll_valor_cuota,ll_pie,ll_valor_cta
String	ls_estado,ls_moneda,ls_serie_derecho,ls_serie_promesa,ls_forma_pago
Date		ld_fecha,ld_fecha_prim,ld_fecha_ult,ld_fecha_pie
ls_estado			= dw_derecho.getitemstring(1,'estado_reg')
ld_fecha				= date(dw_derecho.getitemdatetime(1,'fecha'))
ll_plazo				= dw_derecho.getitemnumber(1,'plazo')
ll_precio			= dw_derecho.getitemnumber(1,'kapital')
ls_moneda			= dw_derecho.getitemstring(1,'moneda')
ll_pie				= dw_derecho.getitemnumber(1,'pie')
ll_tasa				= dw_derecho.getitemnumber(1,'tasa')
ll_valor_cta		= dw_derecho.getitemnumber(1,'valor_cuo')
ld_fecha_prim		= date(dw_derecho.getitemdatetime(1,'fecha_prim'))
ld_fecha_ult		= date(dw_derecho.getitemdatetime(1,'fecha_ult'))
ld_fecha_pie		= date(dw_derecho.getitemdatetime(1,'fecha_pie'))
ll_nro_derecho		= dw_derecho.getitemnumber(1,'nro_pagare')
ls_serie_derecho	= dw_derecho.getitemstring(1,'serie_p')
ll_nro_promesa		= dw_derecho.getitemnumber(1,'nro_oferta')
ls_serie_promesa	= dw_derecho.getitemstring(1,'serie')
ls_forma_pago		= dw_derecho.getitemstring(1,'forma_pago')
if isnull(ls_estado) or ls_estado='' then
	messagebox("Advertencia","Estado Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('estado')
	ll_pasa ++
elseif isnull(ld_fecha) then
	messagebox("Advertencia","Fecha Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha')
	ll_pasa ++
elseif isnull(ld_fecha_pie) then
	messagebox("Advertencia","Fecha Pie Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha_pie')
	ll_pasa ++
elseif isnull(ll_plazo) or ll_plazo=0 then
	messagebox("Advertencia","Plazo Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('plazo')
	ll_pasa ++
elseif isnull(ll_precio) or ll_precio=0 then
	messagebox("Advertencia","Precio Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('kapital')
	ll_pasa ++
elseif isnull(ls_moneda) or ls_moneda='' then
	messagebox("Advertencia","Moneda Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('moneda')
	ll_pasa ++
elseif isnull(ls_forma_pago) or ls_forma_pago='' then
	messagebox("Advertencia","Forma de Pago Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('forma_pago')
	ll_pasa ++
elseif isnull(ll_pie) or ll_pie<0 then
	messagebox("Advertencia","Pie Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('pie')
	ll_pasa ++
elseif isnull(ll_tasa) or ll_tasa=0 then
	messagebox("Advertencia","Tasa Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('tasa')
	ll_pasa ++
elseif isnull(ll_valor_cta) then
	messagebox("Advertencia","Valor Cuota Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('valor_cuo')
	ll_pasa ++
elseif isnull(ld_fecha_prim) then
	messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha_prim')
	ll_pasa ++
elseif isnull(ld_fecha_ult) then
	messagebox("Advertencia","Fecha Ultimo Vencimiento Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha_ult')
	ll_pasa ++
elseif isnull(ll_nro_derecho) or ll_nro_derecho=0 then
	messagebox("Advertencia","Número Derecho Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('nro_pagare')
	ll_pasa ++
elseif isnull(ls_serie_derecho) or ls_serie_derecho='' then
	messagebox("Advertencia","Serie Derecho Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('serie_p')
	ll_pasa ++
elseif isnull(ll_nro_promesa) or ll_nro_promesa=0 then
	messagebox("Advertencia","Número Promesa Inválido")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('nro_oferta')
	ll_pasa ++
elseif isnull(ls_serie_promesa) or ls_serie_promesa='' then
	messagebox("Advertencia","Serie Promesa Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('serie')
	ll_pasa ++
end if
Return ll_pasa
end function

public subroutine wf_imprimir_contrato ();Long		ll_nro_ctas,ll_dia,ll_mes,ll_anno,i,ll_new,ll_dia_aux,ll_print_contrato,&
			ll_cta_pag_la,ll_cta_pag_isa,ll_cta_pag,ll_resp,ll_nro_pagare,ll_sw_pasa=0
Double	ld_valor_cuota,ll_numero,ll_nro_promesa
Date		ld_fecha,ld_fec_pago
String	ls_fecha,ls_moneda,ls_nombre,ls_estado,ls_descrip,ls_serie_pagare

if dw_derecho.rowcount()>0 then
	if is_opcion='M' then
		ll_numero					= il_numero
	elseif is_opcion='N' then
		ll_numero					= il_nro_derecho
	end if
	SELECT	"DERECHO"."PRINT_CONTRATO"  
	INTO 		:ll_print_contrato  
	FROM 		"DERECHO"  
	WHERE  ( "DERECHO"."SERIE_P" = :is_serie ) AND  
			 ( "DERECHO"."NRO_PAGARE" = :ll_numero ) AND 
			 ( "DERECHO"."BASE" = :gs_base )  
	USING		SQLCA;
	if sqlca.sqlcode=0 then
		ll_print_contrato++
		if dw_print.retrieve(is_serie,ll_numero)>0 then 
			SELECT	"PAGARE_V"."NUMERO_P",
						"PAGARE_V"."SERIE_P"
			INTO 		:ll_nro_pagare,
						:ls_serie_pagare
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE" = :is_serie ) AND  
					 ( "PAGARE_V"."NUMERO" = :ll_numero ) AND 
					 ( "PAGARE_V"."BASE" = 'D' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_print.object.t_pagare.text	= 'P - '+ls_serie_pagare+' - '+string(ll_nro_pagare,"###,###,###,###,###")
			end if
			f_Print( dw_print )
			DO WHILE ll_sw_pasa=0
	//			dw_print.print()
				ll_nro_ctas				= dw_derecho.getitemnumber(1,'plazo')
				ld_fecha					= date(dw_derecho.getitemdatetime(1,'fecha_prim'))
				ll_dia					= day(ld_fecha)
				ll_mes					= month(ld_fecha)
				ll_anno					= year(ld_fecha)
				ld_valor_cuota			= dw_derecho.getitemnumber(1,'valor_cuo')
				ls_moneda				= dw_derecho.getitemstring(1,'moneda')
				ll_cta_pag_la			= dw_derecho.getitemnumber(1,'cta_pag_la')
				ll_cta_pag_isa			= dw_derecho.getitemnumber(1,'cta_pag_isa')
				ll_cta_pag				= ll_cta_pag_la + ll_cta_pag_isa
				ls_estado				= dw_derecho.getitemstring(1,'estado')
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
				dw_detalle.object.t_titulo.text	= 'Detalle Cuotas Derecho Especial Nº:   D - '+is_serie+' - '+string(il_nro_derecho,"###,###,###,###,##0")
				ls_nombre	= dw_cliente.getitemstring(1,'nombre')+' '+dw_cliente.getitemstring(1,'a_paterno')+' '+dw_cliente.getitemstring(1,'a_materno')
				dw_detalle.object.t_titulo_1.text= 'CLIENTE  '+string(gi_rut,"###,###,###,##0")+' - '+gs_dv+'     '+trim(ls_nombre)
				dw_detalle.object.t_titulo_2.text= 'CONTRATO ORIGINAL:   '+gs_base+' - '+gs_serie+ ' - '+string(gi_numero,"###,###,###,###,##0")
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
							 ( "DERECHO"."NRO_PAGARE" = :ll_numero ) AND  
							 ( "DERECHO"."BASE" = :gs_base )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
//						cb_cerrar.triggerevent(clicked!)
					else
						rollback;
					end if
				ELSE
					ll_resp=0
				END IF
			LOOP
		end if
	end if
end if
end subroutine

public function boolean f_cadena (integer ai_modo);string 	ls_barra
Datetime	ldt_fecha

ls_barra		= 'D' + gs_serie + String(il_nro_derecho)
Setnull(ldt_fecha)

IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO "CADENA"
	("BARRA",	"RUT",  "CODIGO", 	"SERIE", 	"NUMERO", 			"ESTADO", "PRINT",	"EST_CUP",	"NRO_CARTA",	"FECHA_CARTA",	"ESTADO_CARTA",	"FECHA_ACT_ESTADO",	"CUOTA_CUPON",	"FECHA_RES",	"A_DEMANDAR",	"ESTADO_CONTABLE",	"ESTADO_TITULO",	"FECHA_TITULO",	"NRO_CARTA_M",	"FECHA_CARTA_M",	"ESTADO_CARTA_M",	"FECHA_ACT_ESTADO_M", "COBRAN_C",	"COD_PARQUE")
	VALUES 
	(:ls_barra, :gi_rut,	:is_base,	:is_serie,	:il_nro_derecho,	'V',		 'N',			'0',			'SC',				:ldt_fecha,		'0',					:ldt_fecha,				0,					:ldt_fecha,		'0',				'A',						'N',					:ldt_fecha,			'SC',				:ldt_fecha,			'0', 					:ldt_fecha,				 '',				:il_cod_parque);
	RETURN (SQLCA.SQLCode <> -1)
ELSE
	// Update
//	UPDATE "CADENA"  
//   SET "RUT" = :gi_rut  
//   WHERE ( "CADENA"."CODIGO" = :gs_base ) AND  
//         ( "CADENA"."SERIE" = :gs_serie ) AND  
//         ( "CADENA"."NUMERO" = :gi_numero )   ;
	RETURN (true)
END IF
end function

on w_ingreso_derecho_especial.create
this.cb_nuevo=create cb_nuevo
this.cb_pagare=create cb_pagare
this.dw_detalle=create dw_detalle
this.dw_print=create dw_print
this.dw_cliente=create dw_cliente
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_derecho=create dw_derecho
this.Control[]={this.cb_nuevo,&
this.cb_pagare,&
this.dw_detalle,&
this.dw_print,&
this.dw_cliente,&
this.cb_imprimir,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_derecho}
end on

on w_ingreso_derecho_especial.destroy
destroy(this.cb_nuevo)
destroy(this.cb_pagare)
destroy(this.dw_detalle)
destroy(this.dw_print)
destroy(this.dw_cliente)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_derecho)
end on

event open;Long		ll_new,ll_plazo_rev,ll_cod_parque_rev,ll_rut,ll_resp
String	ls_serie_pagare,ls_base_aux,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,&
			ls_base_asoc,ls_serie_asoc,ls_base_contrato,ls_serie_contrato
Datetime	ldt_fecha,ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,&
			ldb_valor_cuota_rev,ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,&
			ldb_int_uf,ll_nro_pagare,ll_numero_asoc,ll_nro

gf_centrar(w_ingreso_derecho_especial)
is_serie 						= substr(1,1,Message.StringParm)
il_numero					= Double(substr(1,2,Message.StringParm))
il_corr						= Long(substr(1,3,Message.StringParm))
il_nro_derecho				= Double(string(il_numero))//+string(il_corr))
is_opcion						= substr(1,4,Message.StringParm)
il_cod_parque				= Long(substr(1,5,Message.StringParm))
dw_derecho.settransobject(sqlca)
dw_cliente.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_cliente.retrieve(gi_rut)
if is_opcion='M' then
	if dw_derecho.retrieve(is_serie,il_numero)>0 then
		if dw_derecho.getitemstring(1,'estado_reg')='I' then 
			cb_pagare.enabled	= false
		else
			cb_pagare.enabled	= true
		end if
		dw_derecho.enabled	= false
		cb_grabar.enabled		= false
		cb_nuevo.enabled		= false
		SELECT	"PAGARE_V"."NUMERO_P",
					"PAGARE_V"."SERIE_P"
		INTO 		:ll_nro_pagare,
					:ls_serie_pagare
		FROM 		"PAGARE_V"  
		WHERE  ( "PAGARE_V"."SERIE" = :is_serie ) AND  
				 ( "PAGARE_V"."NUMERO" = :il_numero ) AND 
				 ( "PAGARE_V"."BASE" = :is_base )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			cb_pagare.italic	= true
			dw_derecho.object.t_serie_pagare.text	= ls_serie_pagare
			dw_derecho.object.t_nro_pagare.text		= string(ll_nro_pagare,"###,###,###,###,###")
		else
			cb_pagare.italic	= false
		end if
		cb_imprimir.setfocus()
	else
		messagebox("Advertencia","No Registra Dato")
		cb_cerrar.triggerevent(clicked!)
	end if
elseif is_opcion='N' then
	dw_derecho.reset()
	ll_new					= dw_derecho.insertrow(0)
	ldt_fecha				= datetime(today(),time('00:00:00'))
	dw_derecho.scrolltorow(ll_new)
	dw_derecho.enabled	= true
	cb_grabar.enabled		= true
	cb_nuevo.enabled		= true
	dw_derecho.setitem(ll_new,'serie_p',is_serie)
	dw_derecho.setitem(ll_new,'nro_pagare',il_nro_derecho)
	dw_derecho.setitem(ll_new,'serie',is_serie)
	dw_derecho.setitem(ll_new,'nro_oferta',il_numero)
	dw_derecho.setitem(ll_new,'fecha',ldt_fecha)
	dw_derecho.setitem(ll_new,'base',gs_base)
	dw_derecho.setitem(ll_new,'estado_reg','A')
	dw_derecho.setitem(ll_new,'rut',gi_rut)
	dw_derecho.setitem(ll_new,'moneda','2')
	dw_derecho.setitem(ll_new,'usuario',gs_user)
	dw_derecho.setitem(ll_new,'cta_pag_la',0)
	dw_derecho.setitem(ll_new,'cta_pag_isa',0)
	dw_derecho.setitem(ll_new,'correlativo',il_corr)
	dw_derecho.setitem(ll_new,'estado','V')
	dw_derecho.setitem(ll_new,'print_contrato',0)
	dw_derecho.setitem(ll_new,'plazo',0)
	dw_derecho.setitem(ll_new,'kapital',0)
	dw_derecho.setitem(ll_new,'pie',0)
	dw_derecho.setitem(ll_new,'tasa',0)
	dw_derecho.setitem(ll_new,'valor_cuo',0)
	dw_derecho.accepttext()
	////
	SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE",	"REVISION_CONTRATOS"."SERIE",	"REVISION_CONTRATOS"."NUMERO"
	INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
	FROM 		"REVISION_CONTRATOS"  
	WHERE  ( "REVISION_CONTRATOS"."BASE_ASOC" = 'O' ) AND  
			 ( "REVISION_CONTRATOS"."SERIE_ASOC" = :is_serie ) AND  
			 ( "REVISION_CONTRATOS"."NUMERO_ASOC" = :il_numero ) AND
			 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"CADENA"."CODIGO"  
		INTO 		:ls_base_aux  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = 'D' ) AND  
				 ( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
				 ( "CADENA"."NUMERO" = :ll_numero_asoc )   
		USING		sqlca;
		if sqlca.sqlcode=100 then
			dw_derecho.SetItem(1,'serie_p',ls_serie_asoc)
			dw_derecho.SetItem(1,'nro_pagare',ll_numero_asoc)
			dw_derecho.SetItem(1,'base','O')
			dw_derecho.SetItem(1,'serie',is_serie)
			dw_derecho.SetItem(1,'nro_oferta',il_numero)
			dw_derecho.SetItem(1,'fecha',ldt_fecha_ctto_rev)
			dw_derecho.SetItem(1,'moneda',ls_moneda_rev)
			dw_derecho.SetItem(1,'forma_pago',ls_forma_pago_rev)
			dw_derecho.SetItem(1,'pie',ldb_pie_rev)
			dw_derecho.SetItem(1,'plazo',ll_plazo_rev)
			dw_derecho.SetItem(1,'valor_cuo',ldb_valor_cuota_rev)
			dw_derecho.SetItem(1,'kapital',ldb_precio_ctto_rev)
			dw_derecho.SetItem(1,'fecha_prim',ldt_fecha_prim_rev)
//			dw_derecho.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
			SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
			INTO 		:ldb_int_peso,								:ldb_int_uf
			FROM 		"INTERES_CUOTAS"  
			WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if dw_derecho.getitemstring(1,'forma_pago')='1' then
					ldb_int_peso	= 0
					ldb_int_uf		= 0
				end if
				if ls_moneda_rev='1' then //peso
					dw_derecho.setitem(1,'tasa',ldb_int_peso)
				elseif ls_moneda_rev='2' then //UF
					dw_derecho.setitem(1,'tasa',ldb_int_uf)
				end if
			end if
			ls_base_contrato 					= dw_derecho.getitemstring(1,'base')
			ls_serie_contrato 				= dw_derecho.getitemstring(1,'serie')
			ll_nro								= dw_derecho.getitemnumber(1,'nro_oferta')
			if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
				dw_derecho.getchild('serie',idw_detalle)
				idw_detalle.settransobject(sqlca)
				idw_detalle.retrieve(ls_base_contrato)
			end if
			if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
				SELECT	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"
				WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
						  ("CADENA"."SERIE" = :ls_serie_contrato) and
						  ("CADENA"."NUMERO" = :ll_nro) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if gi_rut = ll_rut then
						cb_grabar.enabled	= true
					else
						ll_resp	= messagebox("Advertencia","Derecho Especial Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
									  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
									  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
									  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
						if ll_resp=1 then
							cb_grabar.enabled	= true
						else
							cb_grabar.enabled	= false
						end if
					end if
				else
					MessageBox("Derecho Especial" , "No Existe el Contrato Asociado")	
					cb_grabar.enabled	= false
				end if
			end if
		end if
	end if
	////
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha')
end if
dw_derecho.accepttext()
end event

type cb_nuevo from commandbutton within w_ingreso_derecho_especial
integer x = 2098
integer y = 1900
integer width = 581
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Nuevo Cliente"
end type

event clicked;openwithparm(w_ingreso_cliente_derecho_especial,'N') 
end event

type cb_pagare from commandbutton within w_ingreso_derecho_especial
integer x = 603
integer y = 1900
integer width = 512
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Pagaré"
end type

event clicked;string		ls_numero,ls_serie,ls_string
Double	ll_nro_aux,ll_numero
if is_opcion='M' then
	ll_numero					= il_numero
elseif is_opcion='N' then
	ll_numero					= il_nro_derecho
end if
ls_numero 	= string(ll_numero)
if not isnull(is_serie) and is_serie<>'' and ll_numero>0 then
	SELECT	"DERECHO"."NRO_OFERTA"  
	INTO 		:ll_nro_aux  
	FROM 		"DERECHO"  
	WHERE  ( "DERECHO"."SERIE_P" = :is_serie ) AND  
			 ( "DERECHO"."NRO_PAGARE" = :ll_numero )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_string 	= is_serie+'~t'+ls_numero+'~t'+'N'+'~t'+'D'
		OpenWithParm(w_ver_pagare_digitacion,ls_string)
	else
		messagebox("Advertencia","Antes de Ingresar Pagaré debe Grabar Derecho Especial")
		cb_grabar.setfocus()
	end if
end if
end event

type dw_detalle from datawindow within w_ingreso_derecho_especial
boolean visible = false
integer x = 1042
integer y = 1940
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_cuotas_pactadas_derecho_especial"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print from datawindow within w_ingreso_derecho_especial
boolean visible = false
integer x = 526
integer y = 1924
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_ingreso_derecho_especial_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cliente from datawindow within w_ingreso_derecho_especial
integer x = 46
integer y = 4
integer width = 3538
integer height = 244
string title = "none"
string dataobject = "dw_datos_del_cliente_derecho_especial"
boolean border = false
boolean livescroll = true
end type

type cb_imprimir from commandbutton within w_ingreso_derecho_especial
integer x = 1385
integer y = 1900
integer width = 443
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Contrato"
end type

event clicked;Long		ll_print_contrato,ll_nro_ctas,ll_dia,ll_mes,ll_anno,i,ll_new,ll_dia_aux,ll_resp,&
			ll_cta_pag_la,ll_cta_pag_isa,ll_cta_pag,ll_numero,ll_nro_pagare,ll_sw_pasa=0
Double	ld_valor_cuota
Date		ld_fecha,ld_fec_pago
String	ls_fecha,ls_moneda,ls_nombre,ls_serie_pagare,ls_estado,ls_descrip

if dw_derecho.rowcount()>0 then
	if is_opcion='M' then
		ll_numero					= il_numero
	elseif is_opcion='N' then
		ll_numero					= il_nro_derecho
	end if
	SELECT	"DERECHO"."PRINT_CONTRATO"  
	INTO 		:ll_print_contrato  
	FROM 		"DERECHO"  
	WHERE  ( "DERECHO"."SERIE_P" = :is_serie ) AND  
			 ( "DERECHO"."NRO_PAGARE" = :ll_numero )  AND 
			 ( "DERECHO"."BASE" = :gs_base )
	USING		SQLCA;
	if sqlca.sqlcode=0 then
		if dw_print.retrieve(is_serie,ll_numero)>0 then 
			SELECT	"PAGARE_V"."NUMERO_P",
						"PAGARE_V"."SERIE_P"
			INTO 		:ll_nro_pagare,
						:ls_serie_pagare
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE" = :is_serie ) AND  
					 ( "PAGARE_V"."NUMERO" = :ll_numero ) AND 
					 ( "PAGARE_V"."BASE" = 'D' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_print.object.t_pagare.text	= 'P - '+ls_serie_pagare+' - '+string(ll_nro_pagare,"###,###,###,###,###")
			end if
			ll_print_contrato ++
			DO WHILE ll_sw_pasa=0
				f_Print( dw_print )
	//			dw_print.print()
				ll_nro_ctas				= dw_derecho.getitemnumber(1,'plazo')
				ld_fecha					= date(dw_derecho.getitemdatetime(1,'fecha_prim'))
				ll_dia					= day(ld_fecha)
				ll_mes					= month(ld_fecha)
				ll_anno					= year(ld_fecha)
				ld_valor_cuota			= dw_derecho.getitemnumber(1,'valor_cuo')
				ls_moneda				= dw_derecho.getitemstring(1,'moneda')
				ll_cta_pag_la			= dw_derecho.getitemnumber(1,'cta_pag_la')
				ll_cta_pag_isa			= dw_derecho.getitemnumber(1,'cta_pag_isa')
				ll_cta_pag				= ll_cta_pag_la + ll_cta_pag_isa
				ls_estado				= dw_derecho.getitemstring(1,'estado')
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
				dw_detalle.object.t_titulo.text	= 'Detalle Cuotas Derecho Especial Nº:   D - '+is_serie+' - '+string(il_nro_derecho,"###,###,###,###,##0")
				ls_nombre	= dw_cliente.getitemstring(1,'nombre')+' '+dw_cliente.getitemstring(1,'a_paterno')+' '+dw_cliente.getitemstring(1,'a_materno')
				dw_detalle.object.t_titulo_1.text= 'CLIENTE  '+string(gi_rut,"###,###,###,##0")+' - '+gs_dv+'     '+trim(ls_nombre)
				dw_detalle.object.t_titulo_2.text= 'CONTRATO ORIGINAL:   '+gs_base+' - '+gs_serie+ ' - '+string(gi_numero,"###,###,###,###,##0")
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
							 ( "DERECHO"."NRO_PAGARE" = :ll_numero ) AND  
							 ( "DERECHO"."BASE" = :gs_base )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						cb_cerrar.triggerevent(clicked!)
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

type cb_grabar from commandbutton within w_ingreso_derecho_especial
integer x = 41
integer y = 1900
integer width = 293
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_numero,ls_serie,ls_string
Double	ll_nro_aux,ll_numero
Long		ll_resp
dw_derecho.accepttext()
if wf_valida_todo()=0 then
	if cb_pagare.italic=false then
		if dw_derecho.update()=1 then
			if is_opcion='N' then
				// Insert cadena
				IF Not(f_cadena(0)) THEN
					MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
					rollback using SQLCA;
					RETURN
				END IF
			END IF
			Commit using SQLCA;
			messagebox("Grabar","Grabación Exitosa")
			UPDATE	"CLIENTE"  
			SET 		"ESTADO_COBRANZA" = '0'   
			WHERE 	"CLIENTE"."RUT" = :gi_rut   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			commit;
			if isvalid(w_detalle_derecho_especial) then
				w_detalle_derecho_especial.dw_reporte.retrieve(gs_serie,gi_numero,is_base)
			end if
			IF MessageBox("Ingresar Pagaré", "No Existe Pagaré Asociado, desea Ingresarlo", Question!, YesNo!, 2) = 1 THEN
				if is_opcion='M' then
					ll_numero	= il_numero
				elseif is_opcion='N' then
					ll_numero	= il_nro_derecho
				end if
				ls_numero 		= string(ll_numero)
				if not isnull(is_serie) and is_serie<>'' and ll_numero>0 then
					ls_string 	= is_serie+'~t'+ls_numero+'~t'+'N'+'~t'+'D'
					OpenWithParm(w_ver_pagare_digitacion,ls_string)
				end if
			else
				wf_imprimir_contrato()
				cb_cerrar.triggerevent(clicked!)
			end if
		else
			rollback;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	elseif cb_pagare.italic=true then
		if dw_derecho.update()=1 then
//			if is_opcion='N' then
//				// Insert cadena
//				IF Not(f_cadena(0)) THEN
//					MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
//					rollback using SQLCA;
//					RETURN
//				END IF
//			END IF
			Commit using SQLCA;
			messagebox("Grabar","Grabación Exitosa")
			UPDATE	"CLIENTE"  
			SET 		"ESTADO_COBRANZA" = '0'   
			WHERE 	"CLIENTE"."RUT" = :gi_rut   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			commit;
			if isvalid(w_detalle_derecho_especial) then
				w_detalle_derecho_especial.dw_reporte.retrieve(gs_serie,gi_numero,is_base)
			end if
			wf_imprimir_contrato()
		else
			rollback;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_derecho_especial
integer x = 3259
integer y = 1900
integer width = 293
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_derecho_especial)
end event

type dw_derecho from datawindow within w_ingreso_derecho_especial
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 280
integer width = 3534
integer height = 1600
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_derecho_especial"
boolean border = false
end type

event ue_mousemove;string	ls_columna
ls_columna	= dwo.name
if ls_columna='fecha' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= true
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='moneda' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= true
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='plazo' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= true
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='kapital' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= true
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='pie' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= true
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='tasa' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= true
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='valor_cuo' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= true
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='fecha_prim' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= true
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='fecha_ult' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= true
elseif ls_columna='fecha_pie' then
	dw_derecho.object.t_fecha_pie.visible		= true
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
elseif ls_columna='forma_pago' then
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= true
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
Else
	dw_derecho.object.t_fecha_pie.visible		= false
	dw_derecho.object.t_forma_pago.visible		= false
	dw_derecho.object.t_fecha_ctto.visible		= false
	dw_derecho.object.t_moneda.visible			= false
	dw_derecho.object.t_nro_ctas.visible		= false
	dw_derecho.object.t_precio.visible			= false
	dw_derecho.object.t_pie.visible				= false
	dw_derecho.object.t_tasa.visible				= false
	dw_derecho.object.t_valor_cuota.visible	= false
	dw_derecho.object.t_fecha_prim.visible		= false
	dw_derecho.object.t_fecha_ult.visible		= false
end if
end event

event clicked;String	ls_columna,ls_fecha
Datetime	ldt_fecha_prim
Long		ll_nro_cuotas
dw_derecho.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		ls_fecha		= string(date(dw_derecho.getitemdatetime(1,'fecha')))
		if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_derecho.setitem(1,'fecha',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha	= trim(Message.StringParm)
			dw_derecho.setitem(1,'fecha',date(ls_fecha))
		END IF
		dw_derecho.setcolumn('fecha')

	CASE 'p_2'
		ls_fecha		= string(date(dw_derecho.getitemdatetime(1,'fecha_prim')))
		if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_derecho.setitem(1,'fecha_prim',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha	= trim(Message.StringParm)
			dw_derecho.setitem(1,'fecha_prim',date(ls_fecha))
		END IF
		dw_derecho.setcolumn('fecha_prim')
		dw_derecho.accepttext()
		ldt_fecha_prim	= dw_derecho.getitemdatetime(1,'fecha_prim')
		ll_nro_cuotas	= dw_derecho.getitemnumber(1,'plazo')
		if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
			ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
			if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
				dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
			end if
		end if

	CASE 'p_3'
		ls_fecha		= string(date(dw_derecho.getitemdatetime(1,'fecha_ult')))
		if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_derecho.setitem(1,'fecha_ult',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha	= trim(Message.StringParm)
			dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
		END IF
		dw_derecho.setcolumn('fecha_ult')
		
	CASE 'p_4'
		ls_fecha		= string(date(dw_derecho.getitemdatetime(1,'fecha_pie')))
		if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_derecho.setitem(1,'fecha_pie',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha	= trim(Message.StringParm)
			dw_derecho.setitem(1,'fecha_pie',date(ls_fecha))
		END IF
		dw_derecho.setcolumn('fecha_pie')
END CHOOSE
dw_derecho.accepttext()
end event

event itemchanged;
Datetime	ldt_fecha_prim
String	ls_columna,ls_fecha,ls_moneda
Long		ll_nro_cuotas
Double	lld_valor_cuo,lld_pie,lld_tasa,lld_kapital
dw_derecho.accepttext()
ls_columna	= dwo.name

if ls_columna= 'fecha_prim' then
	ldt_fecha_prim	= dw_derecho.getitemdatetime(1,'fecha_prim')
	ll_nro_cuotas	= dw_derecho.getitemnumber(1,'plazo')
	if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
		ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
		if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
			dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
		end if
	end if
elseif ls_columna='plazo' then
	if dw_derecho.getitemnumber(1,'plazo')>1 then
		dw_derecho.setitem(1,'moneda','2')
		dw_derecho.setitem(1,'forma_pago','2')
	elseif dw_derecho.getitemnumber(1,'plazo')=1 then
		dw_derecho.setitem(1,'forma_pago','1')
		dw_derecho.setitem(1,'moneda','1')
		dw_derecho.setitem(1,'tasa',0)
	end if
elseif ls_columna='kapital' then
	lld_kapital				= double(dw_derecho.getitemnumber(1,'kapital'))
	ll_nro_cuotas			= dw_derecho.getitemnumber(1,'plazo')
	if lld_kapital>0 and ll_nro_cuotas=1 then
		dw_derecho.setitem(1,'valor_cuo',lld_kapital)
		dw_derecho.setitem(1,'pie',lld_kapital)
	end if
elseif ls_columna='moneda' then
	ls_moneda				= dw_derecho.getitemstring(1,'moneda')
	
	lld_valor_cuo			= double(dw_derecho.getitemnumber(1,'valor_cuo'))
	lld_pie					= double(dw_derecho.getitemnumber(1,'pie'))
	lld_tasa					= double(dw_derecho.getitemnumber(1,'tasa'))
	lld_valor_cuo			= double(dw_derecho.getitemnumber(1,'valor_cuo'))
	lld_kapital				= double(dw_derecho.getitemnumber(1,'kapital'))
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			if lld_valor_cuo<500 then
				if lld_valor_cuo>0 then dw_derecho.setitem(1,'valor_cuo',long(round((lld_valor_cuo * gd_uf_dia),2)))
				if lld_pie>0 then dw_derecho.setitem(1,'pie',long(round((lld_pie * gd_uf_dia),2)))
				if lld_tasa>0 then dw_derecho.setitem(1,'tasa',long(round((lld_tasa * gd_uf_dia),2)))
				if lld_valor_cuo>0 then dw_derecho.setitem(1,'valor_cuo',long(round((lld_valor_cuo * gd_uf_dia),2)))
				if lld_kapital>0 then dw_derecho.setitem(1,'kapital',long(round((lld_kapital * gd_uf_dia),2)))
			end if
		elseif ls_moneda='2' then //uf
			if lld_valor_cuo>=500 then
				if lld_valor_cuo>0 then dw_derecho.setitem(1,'valor_cuo',(lld_valor_cuo / gd_uf_dia))
				if lld_pie>0 then dw_derecho.setitem(1,'pie',(lld_pie / gd_uf_dia))
				if lld_tasa>0 then dw_derecho.setitem(1,'tasa',(lld_tasa / gd_uf_dia))
				if lld_valor_cuo>0 then dw_derecho.setitem(1,'valor_cuo',(lld_valor_cuo / gd_uf_dia))
				if lld_kapital>0 then dw_derecho.setitem(1,'kapital',(lld_kapital / gd_uf_dia))
			end if
		end if
	end if
end if
dw_derecho.accepttext()
end event

