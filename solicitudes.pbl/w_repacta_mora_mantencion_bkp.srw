forward
global type w_repacta_mora_mantencion_bkp from window
end type
type st_cliente_tercero from statictext within w_repacta_mora_mantencion_bkp
end type
type cb_terceros from commandbutton within w_repacta_mora_mantencion_bkp
end type
type st_print_detalle from statictext within w_repacta_mora_mantencion_bkp
end type
type dw_print_ctto from datawindow within w_repacta_mora_mantencion_bkp
end type
type st_9 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_factor from statictext within w_repacta_mora_mantencion_bkp
end type
type st_txt_valor_cta2 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_cuota_uf2 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_cuota_peso2 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_txt_cob_adm from statictext within w_repacta_mora_mantencion_bkp
end type
type st_txt_valor_cta from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_cuota_uf from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_cuota_peso from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_interes_adm_uf from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_interes_adm_pesos from statictext within w_repacta_mora_mantencion_bkp
end type
type rb_calc_uf from radiobutton within w_repacta_mora_mantencion_bkp
end type
type rb_calc_pesos from radiobutton within w_repacta_mora_mantencion_bkp
end type
type st_6 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_dscto from statictext within w_repacta_mora_mantencion_bkp
end type
type em_descuento from editmask within w_repacta_mora_mantencion_bkp
end type
type st_val_interes_tot_total from statictext within w_repacta_mora_mantencion_bkp
end type
type st_8 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_7 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_5 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_val_interes_total from statictext within w_repacta_mora_mantencion_bkp
end type
type em_val_total from statictext within w_repacta_mora_mantencion_bkp
end type
type st_txt_total from statictext within w_repacta_mora_mantencion_bkp
end type
type st_moneda from statictext within w_repacta_mora_mantencion_bkp
end type
type em_moneda from statictext within w_repacta_mora_mantencion_bkp
end type
type st_uf_dia from statictext within w_repacta_mora_mantencion_bkp
end type
type st_monto_uf from statictext within w_repacta_mora_mantencion_bkp
end type
type st_deuda_uf from statictext within w_repacta_mora_mantencion_bkp
end type
type st_monto_en_uf from statictext within w_repacta_mora_mantencion_bkp
end type
type st_ctas_mant_pago from statictext within w_repacta_mora_mantencion_bkp
end type
type st_cta_txt from statictext within w_repacta_mora_mantencion_bkp
end type
type st_fecha_prox_pago from statictext within w_repacta_mora_mantencion_bkp
end type
type st_4 from statictext within w_repacta_mora_mantencion_bkp
end type
type cb_filtrar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type cb_ordenar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type cb_exportar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type p_fec from picture within w_repacta_mora_mantencion_bkp
end type
type em_fecha from editmask within w_repacta_mora_mantencion_bkp
end type
type st_fec_cuo from statictext within w_repacta_mora_mantencion_bkp
end type
type st_txt_real from statictext within w_repacta_mora_mantencion_bkp
end type
type cb_grabar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type st_cliente from statictext within w_repacta_mora_mantencion_bkp
end type
type em_cuotas from editmask within w_repacta_mora_mantencion_bkp
end type
type st_3 from statictext within w_repacta_mora_mantencion_bkp
end type
type st_numero from statictext within w_repacta_mora_mantencion_bkp
end type
type st_serie from statictext within w_repacta_mora_mantencion_bkp
end type
type st_base from statictext within w_repacta_mora_mantencion_bkp
end type
type st_2 from statictext within w_repacta_mora_mantencion_bkp
end type
type cb_proceso from commandbutton within w_repacta_mora_mantencion_bkp
end type
type st_1 from statictext within w_repacta_mora_mantencion_bkp
end type
type cb_cerrar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type dw_detalle from datawindow within w_repacta_mora_mantencion_bkp
end type
type em_deuda from statictext within w_repacta_mora_mantencion_bkp
end type
type em_val_interes from statictext within w_repacta_mora_mantencion_bkp
end type
type dw_lista from datawindow within w_repacta_mora_mantencion_bkp
end type
type gb_3 from groupbox within w_repacta_mora_mantencion_bkp
end type
type cb_imprimir from commandbutton within w_repacta_mora_mantencion_bkp
end type
type gb_2 from groupbox within w_repacta_mora_mantencion_bkp
end type
type cb_eliminar from commandbutton within w_repacta_mora_mantencion_bkp
end type
type gb_1 from groupbox within w_repacta_mora_mantencion_bkp
end type
end forward

global type w_repacta_mora_mantencion_bkp from window
integer width = 2592
integer height = 2116
boolean titlebar = true
string title = "Reprogramación Cuotas de Mantención en Mora"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_cliente_tercero st_cliente_tercero
cb_terceros cb_terceros
st_print_detalle st_print_detalle
dw_print_ctto dw_print_ctto
st_9 st_9
st_factor st_factor
st_txt_valor_cta2 st_txt_valor_cta2
st_val_cuota_uf2 st_val_cuota_uf2
st_val_cuota_peso2 st_val_cuota_peso2
st_txt_cob_adm st_txt_cob_adm
st_txt_valor_cta st_txt_valor_cta
st_val_cuota_uf st_val_cuota_uf
st_val_cuota_peso st_val_cuota_peso
st_val_interes_adm_uf st_val_interes_adm_uf
st_val_interes_adm_pesos st_val_interes_adm_pesos
rb_calc_uf rb_calc_uf
rb_calc_pesos rb_calc_pesos
st_6 st_6
st_dscto st_dscto
em_descuento em_descuento
st_val_interes_tot_total st_val_interes_tot_total
st_8 st_8
st_7 st_7
st_5 st_5
st_val_interes_total st_val_interes_total
em_val_total em_val_total
st_txt_total st_txt_total
st_moneda st_moneda
em_moneda em_moneda
st_uf_dia st_uf_dia
st_monto_uf st_monto_uf
st_deuda_uf st_deuda_uf
st_monto_en_uf st_monto_en_uf
st_ctas_mant_pago st_ctas_mant_pago
st_cta_txt st_cta_txt
st_fecha_prox_pago st_fecha_prox_pago
st_4 st_4
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
p_fec p_fec
em_fecha em_fecha
st_fec_cuo st_fec_cuo
st_txt_real st_txt_real
cb_grabar cb_grabar
st_cliente st_cliente
em_cuotas em_cuotas
st_3 st_3
st_numero st_numero
st_serie st_serie
st_base st_base
st_2 st_2
cb_proceso cb_proceso
st_1 st_1
cb_cerrar cb_cerrar
dw_detalle dw_detalle
em_deuda em_deuda
em_val_interes em_val_interes
dw_lista dw_lista
gb_3 gb_3
cb_imprimir cb_imprimir
gb_2 gb_2
cb_eliminar cb_eliminar
gb_1 gb_1
end type
global w_repacta_mora_mantencion_bkp w_repacta_mora_mantencion_bkp

type variables
long		il_cta_mora,ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad,il_sw=0,il_modif=0
Long		il_cta_en_mora, il_val_int_cta, il_val_int,il_monto_cuota, il_por_descto
Long		il_monto, il_tot_reg,il_deuda,il_nro_ctas,il_corr,ll_cta_mora_ini
Double	id_valor_cuota,id_gc,id_im,id_monto_uf, id_val_tasa_anual_peso, id_val_tasa_anual_uf
Double	il_deuda_tot_uf, il_cuota_uf, il_int_adm_peso, il_int_adm_uf,il_uf_inicial,il_numero,ll_num_ori
String		is_base, is_serie, is_opcion
Date		id_fecha_prox_pago, id_fecha_tope_pago, idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_grabar ()
public subroutine wf_eliminar_pie ()
end prototypes

public subroutine wf_grabar ();long		ll_val_ctas,ll_suma_cta, ll_cta_mora
Datetime	ldt_fecha_1, ldt_fecha_crea
date		ld_fecha_1, ld_fecha_crea
time		lt_hora
String	ls_base_aux,ls_barra,ls_barra_aux, ls_num
double	ld_val_cta_uf, ld_val_deuda_uf,ld_factor
cb_proceso.triggerevent(clicked!)
lt_hora			= Now()
ld_fecha_1		= date(trim(em_fecha.text))
ld_fecha_crea	= idt_fecha_hoy
ldt_fecha_1		= datetime(ld_fecha_1, lt_hora)
ldt_fecha_crea	= datetime(ld_fecha_crea, lt_hora)
ll_val_ctas		= long(st_val_cuota_peso2.text)
il_deuda			= long(long(st_val_cuota_peso2.text) * il_nro_ctas)
il_val_int			= long(st_val_interes_total.text)
ld_val_deuda_uf= il_deuda / gd_uf_dia
ld_val_cta_uf	= double(st_val_cuota_uf2.text)
ls_barra			= 'R'+is_serie+string(il_numero)+string(il_corr)
ls_num			= string(il_numero)+string(il_corr)
ll_num_ori		= il_numero
il_numero		= Double(ls_num)
ll_cta_mora		= long(st_ctas_mant_pago.text)
ll_suma_cta		= gl_ctas_pag_m + ll_cta_mora
ld_factor			= double(st_factor.text)

SELECT	"REPACTA_MANTENCION"."BASE"  
INTO 		:ls_base_aux  
FROM 		"REPACTA_MANTENCION"  
WHERE 	( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
			( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
			( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero ) AND
			( "REPACTA_MANTENCION"."CORRELATIVO" = :il_corr )
Using		sqlca ;
if sqlca.sqlcode=0 then
	if dw_lista.update()=1 then
		commit;
		il_sw=0
		w_detalle_repactacion_por_contrato.dw_lista.retrieve(is_base,is_serie,il_numero)
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error","Error al Grabar")
	end if
else
	INSERT INTO "REPACTA_MANTENCION"  
				( "BASE",   "SERIE",   "NUMERO",   "BASE_ORIGINAL",   "SERIE_ORIGINAL",   "NUMERO_ORIGINAL",   "FECHA_CREA",   "CORRELATIVO","TOTAL_DEUDA",   "CUOTAS_PACTADAS",   "ESTADO_PAGO",   "VALOR_CUOTA",   "FECHA_PRIMERA_CTA",   "CUOTAS_EN_MORA",   "USUARIO",   "ABONO","SALDO","RUT_CLIENTE","DV_CLIENTE","UF_DIA",		"TIPO_MONEDA","TOTAL_DEUDA_UF",	"VALOR_CUOTA_UF","INTERES_CUOTA_PESOS","INTERES_DEUDA_PESOS","POR_DESCUENTO","INTERES_ADM_PESOS",	"FACTOR_APLICADO","TOTAL_PAGADO","FECHA_ULT",	"CTA_MORA_ORIGINAL",		"CTAS_PAGADAS" )  
  	VALUES 	( 'R',   	:is_serie, :il_numero, :is_base,   			:is_serie,   		  :ll_num_ori,   		  :ldt_fecha_crea,:il_corr,		:il_deuda,   	 :il_nro_ctas,   		 'V',   				:ll_val_ctas,   	:ldt_fecha_1,   		 :gl_n_cuotas_pag,   :gs_user,    0,		0,			:gi_rut,		 :gs_dv,		  :gd_uf_dia,	:gs_moneda,		:ld_val_deuda_uf,	:ld_val_cta_uf,	:il_val_int_cta,		:il_val_int,			  :il_por_descto,:il_int_adm_peso,		:ld_factor,			0,					:ldt_fecha_1,	:gl_cta_mora_original,	0 )  
	Using	sqlca;
	if sqlca.sqlcode=0 then
		commit;
		il_tot_reg	= dw_lista.retrieve(is_base,is_serie,ll_num_ori,il_corr)
		if w_detalle_repactacion_por_contrato.dw_lista.retrieve(is_base,is_serie,ll_num_ori)>0 then w_detalle_repactacion_por_contrato.cb_pago.enabled=true
		il_sw=0
		SELECT "CADENA"."BARRA"  
		INTO :ls_barra_aux  
		FROM "CADENA"  
		WHERE ( "CADENA"."CODIGO" = 'R' ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
		Using	sqlca;
		if sqlca.sqlcode=100 then
			INSERT INTO	"CADENA"  
							( "BARRA",   "RUT",   "CODIGO",   "SERIE",   "NUMERO",   "ESTADO",   "PRINT",   "EST_CUP",   "NRO_CARTA",   "FECHA_CARTA",   "ESTADO_CARTA",   "FECHA_ACT_ESTADO",   "CUOTA_CUPON",    "FECHA_RES",   "A_DEMANDAR",   "ESTADO_CONTABLE",   "ESTADO_TITULO",   "FECHA_TITULO",   "NRO_CARTA_M",   "FECHA_CARTA_M",   "ESTADO_CARTA_M",   "FECHA_ACT_ESTADO_M",	"COBRAN_C" )  
			VALUES 		( :ls_barra, :gi_rut, 'R',   		 :is_serie, :il_numero, 'V',   		'N',   	  0,   			null,   			null,   			  0,   					:ld_fecha_crea,   	0,   					null,   			null,   			 null,   				 null,   			  null,   			  null,   			 null,   			  0,   					 null,   					null )  
			Using			sqlca;
			if sqlca.sqlcode=0 then
				if is_base='C' then
					commit;
					UPDATE "CONTRATO"  
					SET 	"ANEXO_REPACTA" = :ls_barra,   
							"CTA_REPACTA" = :ll_cta_mora,  
							"CTA_PAG_M" = :ll_suma_cta
					WHERE ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
							( "CONTRATO"."NRO_CONTRATO" = :ll_num_ori )   
					Using	sqlca ;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				elseif is_base='O' then
					UPDATE "OFERTA_V"  
					SET 	"ANEXO_REPACTA" = :ls_barra,   
							"CTA_REPACTA" = :ll_cta_mora,  
							"CTA_PAG_M" = :ll_suma_cta
					WHERE ( "OFERTA_V"."SERIE" = :is_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ll_num_ori )   
					Using	sqlca ;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				if isvalid(w_boletas_cuotas) then w_boletas_cuotas.dw_datos_bl.retrieve(is_serie,ll_num_ori)
			else
				rollback;
			end if
		end if
	else
		rollback;
		messagebox("Error","Error al Grabar")
	end if
end if
cb_imprimir.triggerevent(clicked!)
end subroutine

public subroutine wf_eliminar_pie ();Long		ll_new

dw_lista.deleterow(1)
ll_new			= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'base','R')
dw_lista.setitem(ll_new,'serie',is_serie)
dw_lista.setitem(ll_new,'numero',il_numero)
dw_lista.setitem(ll_new,'correlativo',il_corr)
dw_lista.setitem(ll_new,'base_original',is_base)
dw_lista.setitem(ll_new,'serie_original',is_serie)
dw_lista.setitem(ll_new,'numero_original',il_numero)
dw_lista.setitem(ll_new,'ctas_pagadas',0)
dw_lista.setitem(ll_new,'cuotas_pactadas',long(em_cuotas.text))
dw_lista.setitem(ll_new,'cuotas_en_mora',il_nro_ctas)
dw_lista.setitem(ll_new,'estado_pago','V')
dw_lista.setitem(ll_new,'fecha_primera_cta',date(em_fecha.text))
dw_lista.setitem(ll_new,'tipo_moneda',gs_moneda)
dw_lista.accepttext()
dw_lista.setcolumn('pie')
dw_lista.setfocus()
end subroutine

on w_repacta_mora_mantencion_bkp.create
this.st_cliente_tercero=create st_cliente_tercero
this.cb_terceros=create cb_terceros
this.st_print_detalle=create st_print_detalle
this.dw_print_ctto=create dw_print_ctto
this.st_9=create st_9
this.st_factor=create st_factor
this.st_txt_valor_cta2=create st_txt_valor_cta2
this.st_val_cuota_uf2=create st_val_cuota_uf2
this.st_val_cuota_peso2=create st_val_cuota_peso2
this.st_txt_cob_adm=create st_txt_cob_adm
this.st_txt_valor_cta=create st_txt_valor_cta
this.st_val_cuota_uf=create st_val_cuota_uf
this.st_val_cuota_peso=create st_val_cuota_peso
this.st_val_interes_adm_uf=create st_val_interes_adm_uf
this.st_val_interes_adm_pesos=create st_val_interes_adm_pesos
this.rb_calc_uf=create rb_calc_uf
this.rb_calc_pesos=create rb_calc_pesos
this.st_6=create st_6
this.st_dscto=create st_dscto
this.em_descuento=create em_descuento
this.st_val_interes_tot_total=create st_val_interes_tot_total
this.st_8=create st_8
this.st_7=create st_7
this.st_5=create st_5
this.st_val_interes_total=create st_val_interes_total
this.em_val_total=create em_val_total
this.st_txt_total=create st_txt_total
this.st_moneda=create st_moneda
this.em_moneda=create em_moneda
this.st_uf_dia=create st_uf_dia
this.st_monto_uf=create st_monto_uf
this.st_deuda_uf=create st_deuda_uf
this.st_monto_en_uf=create st_monto_en_uf
this.st_ctas_mant_pago=create st_ctas_mant_pago
this.st_cta_txt=create st_cta_txt
this.st_fecha_prox_pago=create st_fecha_prox_pago
this.st_4=create st_4
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.p_fec=create p_fec
this.em_fecha=create em_fecha
this.st_fec_cuo=create st_fec_cuo
this.st_txt_real=create st_txt_real
this.cb_grabar=create cb_grabar
this.st_cliente=create st_cliente
this.em_cuotas=create em_cuotas
this.st_3=create st_3
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.st_2=create st_2
this.cb_proceso=create cb_proceso
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.em_deuda=create em_deuda
this.em_val_interes=create em_val_interes
this.dw_lista=create dw_lista
this.gb_3=create gb_3
this.cb_imprimir=create cb_imprimir
this.gb_2=create gb_2
this.cb_eliminar=create cb_eliminar
this.gb_1=create gb_1
this.Control[]={this.st_cliente_tercero,&
this.cb_terceros,&
this.st_print_detalle,&
this.dw_print_ctto,&
this.st_9,&
this.st_factor,&
this.st_txt_valor_cta2,&
this.st_val_cuota_uf2,&
this.st_val_cuota_peso2,&
this.st_txt_cob_adm,&
this.st_txt_valor_cta,&
this.st_val_cuota_uf,&
this.st_val_cuota_peso,&
this.st_val_interes_adm_uf,&
this.st_val_interes_adm_pesos,&
this.rb_calc_uf,&
this.rb_calc_pesos,&
this.st_6,&
this.st_dscto,&
this.em_descuento,&
this.st_val_interes_tot_total,&
this.st_8,&
this.st_7,&
this.st_5,&
this.st_val_interes_total,&
this.em_val_total,&
this.st_txt_total,&
this.st_moneda,&
this.em_moneda,&
this.st_uf_dia,&
this.st_monto_uf,&
this.st_deuda_uf,&
this.st_monto_en_uf,&
this.st_ctas_mant_pago,&
this.st_cta_txt,&
this.st_fecha_prox_pago,&
this.st_4,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.p_fec,&
this.em_fecha,&
this.st_fec_cuo,&
this.st_txt_real,&
this.cb_grabar,&
this.st_cliente,&
this.em_cuotas,&
this.st_3,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.st_2,&
this.cb_proceso,&
this.st_1,&
this.cb_cerrar,&
this.dw_detalle,&
this.em_deuda,&
this.em_val_interes,&
this.dw_lista,&
this.gb_3,&
this.cb_imprimir,&
this.gb_2,&
this.cb_eliminar,&
this.gb_1}
end on

on w_repacta_mora_mantencion_bkp.destroy
destroy(this.st_cliente_tercero)
destroy(this.cb_terceros)
destroy(this.st_print_detalle)
destroy(this.dw_print_ctto)
destroy(this.st_9)
destroy(this.st_factor)
destroy(this.st_txt_valor_cta2)
destroy(this.st_val_cuota_uf2)
destroy(this.st_val_cuota_peso2)
destroy(this.st_txt_cob_adm)
destroy(this.st_txt_valor_cta)
destroy(this.st_val_cuota_uf)
destroy(this.st_val_cuota_peso)
destroy(this.st_val_interes_adm_uf)
destroy(this.st_val_interes_adm_pesos)
destroy(this.rb_calc_uf)
destroy(this.rb_calc_pesos)
destroy(this.st_6)
destroy(this.st_dscto)
destroy(this.em_descuento)
destroy(this.st_val_interes_tot_total)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_val_interes_total)
destroy(this.em_val_total)
destroy(this.st_txt_total)
destroy(this.st_moneda)
destroy(this.em_moneda)
destroy(this.st_uf_dia)
destroy(this.st_monto_uf)
destroy(this.st_deuda_uf)
destroy(this.st_monto_en_uf)
destroy(this.st_ctas_mant_pago)
destroy(this.st_cta_txt)
destroy(this.st_fecha_prox_pago)
destroy(this.st_4)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.p_fec)
destroy(this.em_fecha)
destroy(this.st_fec_cuo)
destroy(this.st_txt_real)
destroy(this.cb_grabar)
destroy(this.st_cliente)
destroy(this.em_cuotas)
destroy(this.st_3)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.st_2)
destroy(this.cb_proceso)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.em_deuda)
destroy(this.em_val_interes)
destroy(this.dw_lista)
destroy(this.gb_3)
destroy(this.cb_imprimir)
destroy(this.gb_2)
destroy(this.cb_eliminar)
destroy(this.gb_1)
end on

event open;Long		i,ll_new,ll_monto_cuota,ll_dia,ll_cta_pag, ll_interes_deuda,ll_por_descuento,ll_dia_aux,ll_mes,ll_anno, ll_dia_tope, ll_mes_tope, ll_anno_tope,ll_rut_aux,&
			ll_rut,ll_pie_peso,ll_cant_mant,ll_cant_cred,ll_calc_cuotas
Double	ld_factor_uf,ldb_pie,ldb_calc_monto
Date		ld_fecha,ld_fec_pago,ldt_fec_prox_pago
String	ls_fecha,ls_fecha_tope, ls_titulo,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,&
			ls_nombre_aux,ls_ap_pat_aux,ls_ap_mat_aux,ls_dv_aux
			
idt_fecha_hoy						= date(gdt_fec_sistema)
gf_centrar(w_repacta_mora_mantencion)
if isnull(gd_uf_dia) or gd_uf_dia=0 then
	messagebox("Advertencia","No Registra Valor U.F. de Hoy "+string(gdt_fec_sistema,"dd/mm/yyyy"))
	close(w_repacta_mora_mantencion)
else
	il_monto							= 0
	gs_moneda						= '2'
	em_fecha.text					= string(idt_fecha_hoy)
	dw_lista.dataobject			= 'dw_detalle_repacta_mantencion' //'dwe_cuotas_pactadas'
	dw_lista.settransobject(sqlca)
	dw_detalle.dataobject		= 'dwe_cuotas_pactadas'
	dw_detalle.settransobject(sqlca)
	dw_print_ctto.settransobject(sqlca)
	is_base 							= substr(1,1,Message.StringParm)
	is_serie							= substr(1,2,Message.StringParm)
	il_numero						= Double(substr(1,3,Message.StringParm))
	ll_num_ori						= il_numero
	il_monto							= Long(substr(1,4,Message.StringParm))
	st_cliente.text					= trim(substr(1,5,Message.StringParm))
	id_fecha_prox_pago			= date(substr(1,6,Message.StringParm))
	il_nro_ctas						= long(substr(1,7,Message.StringParm))
	ll_cta_mora_ini					= il_nro_ctas
	il_corr							= long(substr(1,8,Message.StringParm))
	is_opcion							= substr(1,9,Message.StringParm)
	st_base.text						= is_base
	st_serie.text						= is_serie
	st_numero.text					= string(il_numero,"###,###,###,###,###,##0")
	em_deuda.text					= string(il_monto,"###,###,###,###,###,##0")
	em_cuotas.text					= string(il_nro_ctas,"###,###,###,###,##0")
	st_ctas_mant_pago.text		= string(il_nro_ctas,"###,###,###,###,##0")
	st_fecha_prox_pago.text		= substr(1,6,Message.StringParm)
	il_tot_reg						= dw_lista.retrieve(is_base,is_serie,il_numero,il_corr)
	if il_tot_reg > 0 then
		ldb_pie						= dw_lista.getitemnumber(1,'pie')
	end if
	if isnull(ldb_pie) then ldb_pie=0
	ll_pie_peso						= round(ldb_pie * gd_uf_dia,0)
//	ll_dia_tope						= day(id_fecha_prox_pago)
//	ll_mes_tope						= month(id_fecha_prox_pago)
//	ll_anno_tope					= year(id_fecha_prox_pago)
//	ll_anno_tope					= ll_anno_tope + il_nro_ctas
	
	SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
	INTO   :ll_cant_mant,														:ll_cant_cred
	FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
	WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
			( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
			(("CADENA"."CODIGO" = :is_base ) AND  
			( "CADENA"."SERIE" = :is_serie ) AND  
			( "CADENA"."NUMERO" = :il_numero ) )   ;
			
	ll_calc_cuotas					= il_nro_ctas * ll_cant_mant
	DECLARE sp_prox_pago PROCEDURE FOR sp_calcular_vencimiento( :id_fecha_prox_pago, :ll_calc_cuotas );
	EXECUTE sp_prox_pago;
	if sqlca.sqlcode=0 then
		fetch sp_prox_pago into :ldt_fec_prox_pago ;
		close sp_prox_pago;
	end if
	ls_fecha_tope					= string(ldt_fec_prox_pago,'dd/mm/yyyy')
	id_fecha_tope_pago			= date(ls_fecha_tope)
	em_val_interes.text			= string(gd_val_interes,"###,###,###,###,###,##0")
	em_deuda.text					= string(gd_val_deuda,"###,###,###,###,###,##0")
	il_monto							= (gd_val_deuda + gd_val_interes) //- ll_pie_peso  //Pie PESO
	ldb_calc_monto					= round(il_monto / gd_uf_dia,4)
	
	il_monto							= round(ldb_calc_monto * gd_uf_dia,0)
	em_val_total.text				= string(il_monto,"###,###,###,###,###,##0")
	st_monto_uf.text				= string(gd_uf_dia,"###,###,###,###,###,##0.00")
	id_monto_uf						= il_monto / gd_uf_dia
	st_deuda_uf.text				= string(id_monto_uf,"###,###,###,###,##0.00")
	st_val_interes_tot_total.text	=string(id_monto_uf,"###,###,###,##0.00")
	st_val_interes_total.text		= string(il_monto,"###,###,###,###,###,##0")
	
	if is_opcion='C' then
		cb_proceso.enabled		= false
		cb_grabar.enabled			= false
		cb_eliminar.enabled		= false
		em_cuotas.enabled		= false
		em_fecha.enabled			= false
		p_fec.enabled				= false
		em_descuento.enabled	= false
		rb_calc_pesos.enabled	= false
		rb_calc_uf.enabled		= false
	elseif is_opcion='N' then
		cb_proceso.enabled		= true
		cb_grabar.enabled			= true
		cb_eliminar.enabled		= true
		em_cuotas.enabled		= true
		em_fecha.enabled			= true
		p_fec.enabled				= true
		em_descuento.enabled	= true
		rb_calc_pesos.enabled	= true
		rb_calc_uf.enabled		= true
		cb_terceros.enabled		= true
	end if
	if is_base<>'' and not isnull(is_base) and is_serie<>'' and not isnull(is_serie) and il_numero>0 and il_corr > 0 then
		if is_opcion='C' then
			SELECT	"CLIENTE_DEUDOR_TERCERO"."RUT",
						"CLIENTE_DEUDOR_TERCERO"."DV",
						"CLIENTE_DEUDOR_TERCERO"."NOMBRE",
						"CLIENTE_DEUDOR_TERCERO"."A_PATERNO",
						"CLIENTE_DEUDOR_TERCERO"."A_MATERNO"
			INTO 		:ll_rut_aux,
						:ls_dv_aux,
						:ls_nombre_aux,
						:ls_ap_pat_aux,
						:ls_ap_mat_aux
			FROM 		"CLIENTE_DEUDOR_TERCERO"  
			WHERE  ( "CLIENTE_DEUDOR_TERCERO"."RUT_TITULAR" = :gi_rut ) AND  
					 ( "CLIENTE_DEUDOR_TERCERO"."BASE" = :is_base ) AND  
					 ( "CLIENTE_DEUDOR_TERCERO"."SERIE" = :is_serie ) AND  
					 ( "CLIENTE_DEUDOR_TERCERO"."NUMERO" = :il_numero ) AND  
					 ( "CLIENTE_DEUDOR_TERCERO"."CORRELATIVO" = :il_corr )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				cb_terceros.italic				= true
				st_cliente_tercero.text		= 'Reprograma No Titular:  '+string(ll_rut_aux,"###,###,###,###,###")+'-'+ls_dv_aux+'     '+ls_nombre_aux+' '+ls_ap_pat_aux+' '+ls_ap_mat_aux
			else
				cb_terceros.italic				= false
				st_cliente_tercero.text		= ''
			end if
		end if
		
		if il_tot_reg > 0 then
			em_deuda.text						= String(dw_lista.getitemnumber(1,'sub_total'),"###,###,###,###,##0")
			em_val_interes.text				= String(dw_lista.getitemnumber(1,'total_cobros'),"###,###,###,###,##0")
			st_val_interes_tot_total.text		= string(dw_lista.getitemnumber(1,'total_deuda_uf'),"###,###,###,###,##0.0#")
//			messagebox("",string(dw_lista.getitemnumber(1,'total_deuda_uf')) +' * '+string(dw_lista.getitemnumber(1,'uf_dia')))
			st_val_interes_total.text			= String(round(Double(dw_lista.getitemnumber(1,'total_deuda_uf')) * dw_lista.getitemnumber(1,'uf_dia'),0),'###,###,###,##0')
			em_val_total.text					= st_val_interes_total.text
//			messagebox("st_val_interes_total.text",st_val_interes_total.text)
			st_deuda_uf.text					= st_val_interes_tot_total.text
			il_int_adm_peso					= dw_lista.getitemnumber(1,'interes_adm_pesos')
			st_val_interes_adm_pesos.text	= string(il_int_adm_peso,"###,###,###,###,###,##0")
			il_corr								= dw_lista.getitemnumber(1,'correlativo')
			st_val_interes_adm_uf.text		= string((il_int_adm_peso / dw_lista.getitemnumber(1,'uf_dia')),"###,###,###,###,##0.00")
			ll_por_descuento					= dw_lista.getitemnumber(1,'por_descuento')
			em_descuento.text				= string(ll_por_descuento,"##0")
			ll_interes_deuda					= dw_lista.getitemnumber(1,'interes_deuda_pesos')
			il_nro_ctas							= dw_lista.getitemnumber(1,'cuotas_pactadas')
			ll_cta_pag							= dw_lista.getitemnumber(1,'ctas_pagadas')
			ld_fecha								= date(dw_lista.getitemdatetime(1,'fecha_primera_cta'))
			st_ctas_mant_pago.text			= string(dw_lista.getitemnumber(1,'cuotas_en_mora'),"###,###,###,###,##0")
			em_fecha.text						= string(ld_fecha)
			em_cuotas.text						= string(il_nro_ctas,"###,###,###,###,##0")
			ll_monto_cuota						= dw_lista.getitemnumber(1,'valor_cuota')
			ll_dia									= day(ld_fecha)
			ll_mes								= month(ld_fecha)
			ll_anno								= year(ld_fecha)
			ld_factor_uf							= double(dw_lista.getitemnumber(1,'factor_aplicado'))
			st_factor.text						= string(ld_factor_uf,"###,##0.0000000")
			st_val_cuota_peso.text			= string(long(st_val_interes_total.text) + long(st_val_interes_adm_pesos.text),"###,###,###,###,##0")
			st_val_cuota_uf.text				= string(double(st_val_interes_tot_total.text) + double(st_val_interes_adm_uf.text),"###,###,###,###,##0.00")
			st_val_cuota_peso2.text			= string(ll_monto_cuota,"###,###,##0")
			st_val_cuota_uf2.text				= string(ll_monto_cuota / dw_lista.getitemnumber(1,'uf_dia'),"###,###,##0.0000")
			
			if gs_moneda = '1' then
				em_moneda.text				= 'PESO'
				rb_calc_pesos.checked		= true
				rb_calc_uf.checked			= false
			elseif gs_moneda = '2' then
				em_moneda.text				= 'U.F.'
				rb_calc_pesos.checked		= false
				rb_calc_uf.checked			= true
			end if
			for i=1 to il_nro_ctas
				ll_new							= dw_detalle.insertrow(0)
				dw_detalle.setitem(ll_new,'monto',long(st_val_cuota_peso2.text))
				dw_detalle.setitem(ll_new,'uf',gd_uf_dia)
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
			SELECT	"REPACTA_MANTENCION"."RUT_CLIENTE",   
						"REPACTA_MANTENCION"."DV_CLIENTE"  
			INTO 		:ll_rut,   
						:ls_dv  
			FROM 		"REPACTA_MANTENCION"  
			WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
					 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
					 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero ) AND  
					 ( "REPACTA_MANTENCION"."CORRELATIVO" = :il_corr )   
			USING		sqlca;
			SELECT	"CLIENTE"."NOMBRE",   
						"CLIENTE"."A_PATERNO",   
						"CLIENTE"."A_MATERNO"  
			INTO 		:ls_nom,   
						:ls_ap_pat,   
						:ls_ap_mat  
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   ;
	
			dw_detalle.object.t_titulo.text		= 'Detalle Cuotas Repactación Nº:   R - '+is_serie+' - '+string(il_numero,"###,###,###,###,###")+'-'+string(il_corr,"###,###,###,###,###")
			dw_detalle.object.t_titulo_1.text	= 'CLIENTE  '+string(ll_rut,"###,###,###,##0")+' - '+ls_dv+'     '+ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
			dw_detalle.object.t_titulo_2.text	= 'CONTRATO ORIGINAL:   '+is_base+' - '+is_serie+ ' - '+string(il_numero,"###,###,###,###,##0")
			dw_detalle.object.t_titulo_3.text	= ls_titulo
		else
			il_cta_en_mora			= long(substr(1,7,Message.StringParm))
			dw_lista.insertrow(0)
			dw_lista.setitem(1,'base','R')
			dw_lista.setitem(1,'serie',is_serie)
			dw_lista.setitem(1,'numero',il_numero)
			dw_lista.setitem(1,'correlativo',il_corr)
			dw_lista.setitem(1,'base_original',is_base)
			dw_lista.setitem(1,'serie_original',is_serie)
			dw_lista.setitem(1,'numero_original',il_numero)
			dw_lista.setitem(1,'ctas_pagadas',0)
			dw_lista.setitem(1,'cuotas_pactadas',il_nro_ctas)
			dw_lista.setitem(1,'cuotas_en_mora',il_nro_ctas)
			dw_lista.setitem(1,'estado_pago','V')
			dw_lista.setitem(1,'fecha_primera_cta',idt_fecha_hoy)
			dw_lista.setitem(1,'tipo_moneda',gs_moneda)
			if gs_moneda = '1' then
				em_moneda.text				= 'PESO'
				rb_calc_pesos.checked		= true
				rb_calc_uf.checked			= false
			elseif gs_moneda = '2' then
				em_moneda.text				= 'U.F.'
				rb_calc_pesos.checked		= false
				rb_calc_uf.checked			= true
			end if
		end if
		if trim(gs_opera)='1' and is_opcion='N' then
			cb_grabar.enabled					= true
			cb_imprimir.enabled				= true
		elseif trim(gs_opera)<>'1' and is_opcion='N' then
			cb_grabar.enabled					= false
			cb_imprimir.enabled				= false
		end if
		if trim(gs_opera)='1' then
			st_print_detalle.enabled			= true
		elseif trim(gs_opera)<>'1' then
			st_print_detalle.enabled			= false
			cb_imprimir.enabled				= false
		end if
		if gs_depto='I' then cb_imprimir.enabled = true
	else
		messagebox("Advertencia","No Registra Dato Contrato "+is_base+' - '+is_serie+' - '+string(il_numero,"###,###,###,###,##0"))
		close(w_repacta_mora_mantencion)
	end if
	gs_ventana									= 'w_repacta_mora_mantencion'
	f_valida_objeto()
end if
end event

event close;setnull(gi_rut_tercero)
end event

type st_cliente_tercero from statictext within w_repacta_mora_mantencion_bkp
integer x = 55
integer y = 232
integer width = 2455
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean focusrectangle = false
end type

type cb_terceros from commandbutton within w_repacta_mora_mantencion_bkp
integer x = 1915
integer y = 1036
integer width = 567
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar NO &Titular (3º)"
end type

event clicked;string	ls_string

Setnull(gi_rut_tercero)
//ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(gi_rut)+'~t'+string(il_corr)+'~t'+is_opcion
//openwithparm(w_ingreso_deudores_terceros,ls_string)
if cb_terceros.italic=false then
	ls_string	= 'N'+'~t'+string(il_corr)
else
	ls_string	= 'M'+'~t'+string(il_corr)
end if
openwithparm(w_ingreso_cliente_tercero,ls_string)
end event

type st_print_detalle from statictext within w_repacta_mora_mantencion_bkp
integer x = 69
integer y = 1876
integer width = 713
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long backcolor = 79741120
string text = "Imprimir Detalle Vcto."
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;Double	ll_numero
String	ls_base
if dw_detalle.rowcount() > 0 then
	ll_numero	= dw_lista.getitemnumber(1,'numero')
	if ll_numero>0 and not isnull(ll_numero) then
		SELECT "REPACTA_MANTENCION"."BASE"  
		INTO :ls_base  
		FROM "REPACTA_MANTENCION"  
		WHERE "REPACTA_MANTENCION"."NUMERO" = :ll_numero   
		Using	sqlca;
		if sqlca.sqlcode=0 then
			f_Print( dw_detalle )
		else
			messagebox("Advertencia","Reprogramación Inexistente debe Grabar antes de Imprimir")
		end if
	end if
else
	messagebox("Advertencia","No registra datos")
end if
end event

type dw_print_ctto from datawindow within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 366
integer y = 2008
integer width = 558
integer height = 388
integer taborder = 90
string dataobject = "dw_print_promesa_conce"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_repacta_mora_mantencion_bkp
integer x = 928
integer y = 1868
integer width = 471
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Factor Aplicado:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_factor from statictext within w_repacta_mora_mantencion_bkp
integer x = 1413
integer y = 1868
integer width = 658
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_txt_valor_cta2 from statictext within w_repacta_mora_mantencion_bkp
integer x = 1650
integer y = 1516
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Valor Cuota"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_val_cuota_uf2 from statictext within w_repacta_mora_mantencion_bkp
integer x = 1650
integer y = 1604
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_val_cuota_peso2 from statictext within w_repacta_mora_mantencion_bkp
integer x = 1650
integer y = 1720
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_txt_cob_adm from statictext within w_repacta_mora_mantencion_bkp
integer x = 745
integer y = 1516
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Gastos Adm."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_txt_valor_cta from statictext within w_repacta_mora_mantencion_bkp
integer x = 1198
integer y = 1516
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Total Reprog."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_val_cuota_uf from statictext within w_repacta_mora_mantencion_bkp
integer x = 1198
integer y = 1604
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_val_cuota_peso from statictext within w_repacta_mora_mantencion_bkp
integer x = 1198
integer y = 1720
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_val_interes_adm_uf from statictext within w_repacta_mora_mantencion_bkp
integer x = 745
integer y = 1604
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_val_interes_adm_pesos from statictext within w_repacta_mora_mantencion_bkp
integer x = 745
integer y = 1720
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_calc_uf from radiobutton within w_repacta_mora_mantencion_bkp
integer x = 101
integer y = 400
integer width = 549
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Calculo por U.F."
boolean checked = true
end type

event clicked;if rb_calc_uf.checked=true then
	gs_moneda 		= '2'
	em_moneda.text	= 'U.F.'
	dw_lista.setitem(1,'tipo_moneda',gs_moneda)
end if
end event

type rb_calc_pesos from radiobutton within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 82
integer y = 392
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Calculo en Pesos"
end type

event clicked;if rb_calc_pesos.checked=true then
	gs_moneda 		= '1'
	em_moneda.text	= 'PESO'
	dw_lista.setitem(1,'tipo_moneda',gs_moneda)
end if
end event

type st_6 from statictext within w_repacta_mora_mantencion_bkp
integer x = 2043
integer y = 524
integer width = 78
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "%"
boolean focusrectangle = false
end type

type st_dscto from statictext within w_repacta_mora_mantencion_bkp
integer x = 1413
integer y = 520
integer width = 334
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Descuento"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_descuento from editmask within w_repacta_mora_mantencion_bkp
integer x = 1765
integer y = 508
integer width = 261
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31457278
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

event modified;il_por_descto	= long(this.text)
if il_por_descto< 0 then 
	messagebox("Advertencia","% no debe ser menor a 0")
	this.text		= '0'
	il_por_descto	= 0
elseif il_por_descto>100 then 
	messagebox("Advertencia","% no debe ser mayor a 100")
	this.text		= '100'
	il_por_descto	= 100
end if

end event

type st_val_interes_tot_total from statictext within w_repacta_mora_mantencion_bkp
integer x = 293
integer y = 1604
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_repacta_mora_mantencion_bkp
integer x = 64
integer y = 1620
integer width = 215
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "U.F."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_repacta_mora_mantencion_bkp
integer x = 64
integer y = 1740
integer width = 215
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "PESO"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_repacta_mora_mantencion_bkp
integer x = 293
integer y = 1516
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Deuda en Mora"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_val_interes_total from statictext within w_repacta_mora_mantencion_bkp
integer x = 293
integer y = 1720
integer width = 448
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_val_total from statictext within w_repacta_mora_mantencion_bkp
integer x = 2053
integer y = 796
integer width = 434
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_txt_total from statictext within w_repacta_mora_mantencion_bkp
integer x = 1842
integer y = 812
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total $"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_moneda from statictext within w_repacta_mora_mantencion_bkp
integer x = 87
integer y = 908
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Moneda"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_moneda from statictext within w_repacta_mora_mantencion_bkp
integer x = 366
integer y = 892
integer width = 402
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_uf_dia from statictext within w_repacta_mora_mantencion_bkp
integer x = 901
integer y = 904
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Valor UF día"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_monto_uf from statictext within w_repacta_mora_mantencion_bkp
integer x = 1193
integer y = 892
integer width = 462
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_deuda_uf from statictext within w_repacta_mora_mantencion_bkp
integer x = 2053
integer y = 892
integer width = 434
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_monto_en_uf from statictext within w_repacta_mora_mantencion_bkp
integer x = 1733
integer y = 904
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Deuda en UF"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ctas_mant_pago from statictext within w_repacta_mora_mantencion_bkp
integer x = 2203
integer y = 160
integer width = 311
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_cta_txt from statictext within w_repacta_mora_mantencion_bkp
integer x = 1673
integer y = 164
integer width = 526
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cta.Mant.a Repactar"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_fecha_prox_pago from statictext within w_repacta_mora_mantencion_bkp
integer x = 2203
integer y = 60
integer width = 347
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_4 from statictext within w_repacta_mora_mantencion_bkp
integer x = 1710
integer y = 64
integer width = 489
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Vcto. Cta."
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 658
integer y = 1816
integer width = 306
integer height = 92
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_ordenar from commandbutton within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 347
integer y = 1816
integer width = 306
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_exportar from commandbutton within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 37
integer y = 1816
integer width = 306
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type p_fec from picture within w_repacta_mora_mantencion_bkp
integer x = 1193
integer y = 508
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;date	ld_fecha
ld_fecha	= date(em_fecha.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_fecha.text	= string(idt_fecha_hoy,gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_fecha.text	= string(date(Message.StringParm))
END IF
Date	ld_fecha_ing
ld_fecha_ing	= date(em_fecha.text)
ld_fecha			= RelativeDate(idt_fecha_hoy, 40)
if ld_fecha_ing > ld_fecha then
	messagebox("Advertencia","Fecha Tope es: "+string(ld_fecha,"dd/mm/yyyy"))
	em_fecha.text	= string(ld_fecha)
end if

end event

type em_fecha from editmask within w_repacta_mora_mantencion_bkp
integer x = 741
integer y = 508
integer width = 443
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31457278
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date	ld_fecha, ld_fecha_ing

ld_fecha_ing	= date(em_fecha.text)
ld_fecha			= RelativeDate(idt_fecha_hoy, 40)
if ld_fecha_ing > ld_fecha then
	messagebox("Advertencia","Fecha Tope es: "+string(ld_fecha,"dd/mm/yyyy"))
	em_fecha.text	= string(ld_fecha)
end if
end event

type st_fec_cuo from statictext within w_repacta_mora_mantencion_bkp
integer x = 91
integer y = 520
integer width = 631
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Fecha Pago 1ª Cuota"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_txt_real from statictext within w_repacta_mora_mantencion_bkp
integer x = 777
integer y = 812
integer width = 393
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Cobros $"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_repacta_mora_mantencion_bkp
integer x = 2149
integer y = 1512
integer width = 334
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Grabar"
end type

event clicked;long		ll_val_ctas,ll_suma_cta, ll_cta_mora,ll_rut,ll_tot_renta,ll_grupo_f,ll_rut_aux,ll_plazo,ll_cod_parque,ll_count_vig,ll_est_resp=0,ll_rut_cont=0,ll_cta_pag_mant
Datetime	ldt_fecha_1, ldt_fecha_crea,ldt_fec_nac,ldt_fec_ing,ldt_fec_cob,ldt_fecha_prim,ldt_fec_venc_mant
date		ld_fecha_1, ld_fecha_crea,ldt_fecha_ult,ldt_fecha_pie
time		lt_hora
String	ls_base_aux,ls_barra,ls_barra_aux, ls_num,ls_nom,ls_ap_pat,ls_ap_mat,ls_dir_p,ls_pob,ls_sec,ls_com,ls_ciu,ls_fono_p,ls_sexo,ls_est_civ,&
			ls_dom_c,ls_fono_c,ls_dv,ls_est_cob,ls_glosa_cob,ls_es_deudor='S',	ls_estado_deudor,ls_tipo='I',ls_est_titular='A',ls_dv_aux,ls_base='R',&
			ls_moneda,ls_estado_cadena
double	ld_val_cta_uf, ld_val_deuda_uf,ld_factor,ldb_valor_cuota,ldb_valor_cuota_mant,ldb_pie,ldb_sub_total,ldb_total_cobros

connect using trans_1;
connect using trans_2;
//cb_proceso.triggerevent(clicked!)
if st_val_interes_tot_total.text='' or st_val_interes_adm_uf.text='' or &
	st_val_cuota_uf.text='' or st_val_cuota_uf2.text='' then
	messagebox("Advertencia","Antes de Grabar debe Procesar")
else
	ldb_pie			= dw_lista.getitemnumber(1,'pie')
	ldt_fecha_pie	= date(dw_lista.getitemdatetime(1,'fecha_pie'))
	if isnull(ldb_pie) then ldb_pie=0
	if isnull(ldt_fecha_pie) then ldt_fecha_pie=date('01/01/1900')
	if ldb_pie = 0 and isnull(ldt_fecha_pie) then
		messagebox("Advertencia","Debe Ingresar Fecha Pie")
		dw_lista.Setcolumn('fecha_pie')
	elseif ldb_pie > 0 and ldt_fecha_pie=date('01/01/1900') then
		messagebox("Advertencia","Debe Ingresar Pie")
		dw_lista.Setcolumn('pie')
	else
		lt_hora				= Now()
		ld_fecha_1			= date(trim(em_fecha.text))
		ld_fecha_crea		= idt_fecha_hoy
		ldt_fecha_1			= datetime(ld_fecha_1, lt_hora)
		ldt_fecha_crea		= datetime(ld_fecha_crea, lt_hora)
		ll_val_ctas			= long(st_val_cuota_peso2.text)
		il_deuda				= long(long(st_val_cuota_peso2.text) * il_nro_ctas)
		il_val_int				= long(st_val_interes_total.text)
		ld_val_deuda_uf	=round(Long(em_val_total.text) / gd_uf_dia,4)	//		round(il_deuda / gd_uf_dia,4)
		ld_val_cta_uf		= double(st_val_cuota_uf2.text)
		ls_barra				= 'R'+is_serie+string(il_numero)+string(il_corr)
		ls_num				= string(il_numero)+string(il_corr)
		ll_num_ori			= il_numero
		il_numero			= Double(ls_num)
		ll_cta_mora			= long(st_ctas_mant_pago.text)
		ld_factor				= double(st_factor.text)
		is_base				= trim(st_base.text)
		ldt_fecha_ult		= date(dw_detalle.getitemdatetime(dw_detalle.rowcount(),'fecha'))
		gl_n_cuotas_pag	= long(st_ctas_mant_pago.text)
		ldb_sub_total		= Double(em_deuda.text)
		ldb_total_cobros	= Double(em_val_interes.text)
		
		CHOOSE CASE is_base
			CASE 'O'
				//gl_cod_parque
				SELECT	"CADENA"."COD_PARQUE",	"OFERTA_V"."CTA_PAG_M"  
				INTO 		:gl_cod_parque,
							:ll_cta_pag_mant
				FROM 	"CADENA",   
							"OFERTA_V",   
							"PAGO_OFERTA"  
				WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						 (("CADENA"."CODIGO" = :is_base ) AND  
						 ( "CADENA"."SERIE" = :is_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_num_ori ) )  
				USING		sqlca;
	
			CASE 'C'
				SELECT	"CADENA"."COD_PARQUE",	"CONTRATO"."CTA_PAG_M"  
				INTO 		:gl_cod_parque,
							:ll_cta_pag_mant
				FROM 	"CADENA",   
							"CONTRATO"  
				WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						 (("CADENA"."CODIGO" = :is_base ) AND  
						 ( "CADENA"."SERIE" = :is_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_num_ori ) )   
				USING		sqlca;
		END CHOOSE
		SELECT	"REPACTA_MANTENCION"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"REPACTA_MANTENCION"  
		WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
				 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
				 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero ) AND
				 ( "REPACTA_MANTENCION"."CORRELATIVO" = :il_corr )
		Using		sqlca ;
		if sqlca.sqlcode=0 then
			dw_lista.setitem(1,'rut_cliente',gi_rut)
			dw_lista.setitem(1,'dv_cliente',gs_dv)
			dw_lista.accepttext()
			if dw_lista.update()=1 then
				commit;
				il_sw=0
				if isvalid(w_detalle_repactacion_por_contrato) then w_detalle_repactacion_por_contrato.dw_lista.retrieve(is_base,is_serie,il_numero)
				messagebox("Grabar","Grabación Exitosa")
			else
				rollback;
				messagebox("Error","Error al Grabar")
			end if
		else
			if isnull(ll_cta_pag_mant) or ll_cta_pag_mant < 0 then ll_cta_pag_mant=0
			ll_suma_cta		= ll_cta_pag_mant + ll_cta_mora
			if cb_terceros.italic=true then
				SELECT	"CLIENTE_DEUDOR_TERCERO"."RUT",
							"CLIENTE_DEUDOR_TERCERO"."DV"  
				INTO 		:ll_rut_aux,
							:ls_dv_aux
				FROM 		"CLIENTE_DEUDOR_TERCERO"  
				WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT_TITULAR" = :gi_rut   
				USING		sqlca;
				if sqlca.sqlcode=0 then 
					gi_rut		= ll_rut_aux
					gs_dv		= ls_dv_aux
				end if
			end if
			if gi_rut_tercero > 0 and not isnull(gi_rut_tercero) then
				INSERT INTO "REPACTA_MANTENCION"  
							( "BASE",   "SERIE",   "NUMERO",   "BASE_ORIGINAL",   "SERIE_ORIGINAL",   "NUMERO_ORIGINAL",   "FECHA_CREA",   "CORRELATIVO",	"TOTAL_DEUDA",   "CUOTAS_PACTADAS",   "ESTADO_PAGO",   "VALOR_CUOTA",   "FECHA_PRIMERA_CTA",   "CUOTAS_EN_MORA",   "USUARIO",   "ABONO",	"SALDO",	"RUT_CLIENTE",				"DV_CLIENTE",	"UF_DIA",	"TIPO_MONEDA",	"TOTAL_DEUDA_UF",	"VALOR_CUOTA_UF",	"INTERES_CUOTA_PESOS",	"INTERES_DEUDA_PESOS",	"POR_DESCUENTO",	"INTERES_ADM_PESOS",	"FACTOR_APLICADO",	"TOTAL_PAGADO",	"FECHA_ULT",		"CTA_MORA_ORIGINAL",		"CANT_PRINT",	"CTAS_PAGADAS","CTAS_PAG_M_ORIGINAL","VALOR_PRESENTE_PESOS","VALOR_GTOS_ADM_PESOS","VALOR_MORA_CTA_PESOS","VALOR_SALDO_INSOLUTO","TIPO_REPROG",	"PIE",	"FECHA_PIE",	"SUB_TOTAL",	"TOTAL_COBROS")  
				VALUES 	( 'R',   	:is_serie, :il_numero, :is_base,   			:is_serie,   			:ll_num_ori,   	  :ldt_fecha_crea,:il_corr,		:il_deuda,   	  :il_nro_ctas,   	  'V',   			 :ll_val_ctas,   	:ldt_fecha_1,   		  :gl_n_cuotas_pag,   :gs_user,    0,			0,			:gi_rut_tercero,			:gs_dv,			:gd_uf_dia,	:gs_moneda,		:ld_val_deuda_uf,	:ld_val_cta_uf,	:il_val_int_cta,			:il_val_int,				:il_por_descto,	:il_int_adm_peso,		:ld_factor,				0,						:ldt_fecha_ult,	:gl_cta_mora_original,	1,					0,					:gl_ctas_pag_m,		 0,							0,							  0,							 0,							'R',	:ldb_pie,	:ldt_fecha_pie,	:ldb_sub_total,	:ldb_total_cobros)  
				Using	sqlca;
			else
				INSERT INTO "REPACTA_MANTENCION"  
							( "BASE",   "SERIE",   "NUMERO",   "BASE_ORIGINAL",   "SERIE_ORIGINAL",   "NUMERO_ORIGINAL",   "FECHA_CREA",   "CORRELATIVO",	"TOTAL_DEUDA",   "CUOTAS_PACTADAS",   "ESTADO_PAGO",   "VALOR_CUOTA",   "FECHA_PRIMERA_CTA",   "CUOTAS_EN_MORA",   "USUARIO",   "ABONO",	"SALDO",	"RUT_CLIENTE",	"DV_CLIENTE",	"UF_DIA",	"TIPO_MONEDA",	"TOTAL_DEUDA_UF",	"VALOR_CUOTA_UF",	"INTERES_CUOTA_PESOS",	"INTERES_DEUDA_PESOS",	"POR_DESCUENTO",	"INTERES_ADM_PESOS",	"FACTOR_APLICADO",	"TOTAL_PAGADO",	"FECHA_ULT",		"CTA_MORA_ORIGINAL",		"CANT_PRINT",	"CTAS_PAGADAS","CTAS_PAG_M_ORIGINAL","VALOR_PRESENTE_PESOS","VALOR_GTOS_ADM_PESOS","VALOR_MORA_CTA_PESOS","VALOR_SALDO_INSOLUTO","TIPO_REPROG",	"PIE",	"FECHA_PIE",	"SUB_TOTAL",	"TOTAL_COBROS")  
				VALUES 	( 'R',   	:is_serie, :il_numero, :is_base,   			:is_serie,   			:ll_num_ori,   	  :ldt_fecha_crea,:il_corr,		:il_deuda,   	  :il_nro_ctas,   	  'V',   			 :ll_val_ctas,   	:ldt_fecha_1,   		  :gl_n_cuotas_pag,   :gs_user,    0,			0,			:gi_rut,			:gs_dv,			:gd_uf_dia,	:gs_moneda,		:ld_val_deuda_uf,	:ld_val_cta_uf,	:il_val_int_cta,			:il_val_int,				:il_por_descto,	:il_int_adm_peso,		:ld_factor,				0,						:ldt_fecha_ult,	:gl_cta_mora_original,	1,					0,					:gl_ctas_pag_m,		 0,							0,							  0,							 0,							'R',	:ldb_pie,	:ldt_fecha_pie,	:ldb_sub_total,	:ldb_total_cobros)  
				Using	sqlca;
			end if
			if sqlca.sqlcode=0 then
				commit;
				il_tot_reg	= dw_lista.retrieve(is_base,is_serie,ll_num_ori,il_corr)
				if isvalid(w_detalle_repactacion_por_contrato) then
					if w_detalle_repactacion_por_contrato.dw_lista.retrieve(is_base,is_serie,ll_num_ori)>0 then w_detalle_repactacion_por_contrato.cb_pago.enabled=true
				end if
				il_sw			= 0
				SELECT 	"CADENA"."BARRA"  
				INTO 		:ls_barra_aux  
				FROM 	"CADENA"  
				WHERE ( "CADENA"."CODIGO" = 'R' ) AND  
						( "CADENA"."SERIE" = :is_serie ) AND  
						( "CADENA"."NUMERO" = :il_numero )   
				Using	sqlca;
				if sqlca.sqlcode=100 then
					if gi_rut_tercero>0 then
						INSERT INTO	"CADENA"  
										( "BARRA",   "RUT",   			"CODIGO",   "SERIE",   "NUMERO",   "ESTADO",   "PRINT",   "EST_CUP",   "NRO_CARTA",   "FECHA_CARTA",   "ESTADO_CARTA",   "FECHA_ACT_ESTADO",   "CUOTA_CUPON",    "FECHA_RES",   "A_DEMANDAR",   "ESTADO_CONTABLE",   "ESTADO_TITULO",   "FECHA_TITULO",   "NRO_CARTA_M",   "FECHA_CARTA_M",   "ESTADO_CARTA_M",   "FECHA_ACT_ESTADO_M",	"COBRAN_C",	"COD_PARQUE" )  
						VALUES 		( :ls_barra, :gi_rut_tercero, 'R',   		 :is_serie, :il_numero, 'V',   		'N',   	  0,   			null,   			null,   				0,   					:ld_fecha_crea,   	0,   					null,   			null,   			 null,   				 null,   				null,   				null,   			 null,   			  0,   					 null,   					null,			:gl_cod_parque )  
						Using			sqlca;
					else
						INSERT INTO	"CADENA"  
										( "BARRA",   "RUT",   "CODIGO",   "SERIE",   "NUMERO",   "ESTADO",   "PRINT",   "EST_CUP",   "NRO_CARTA",   "FECHA_CARTA",   "ESTADO_CARTA",   "FECHA_ACT_ESTADO",   "CUOTA_CUPON",    "FECHA_RES",   "A_DEMANDAR",   "ESTADO_CONTABLE",   "ESTADO_TITULO",   "FECHA_TITULO",   "NRO_CARTA_M",   "FECHA_CARTA_M",   "ESTADO_CARTA_M",   "FECHA_ACT_ESTADO_M",	"COBRAN_C",	"COD_PARQUE" )  
						VALUES 		( :ls_barra, :gi_rut, 'R',   		 :is_serie, :il_numero, 'V',   		'N',   	  0,   			null,   			null,   				0,   					:ld_fecha_crea,   	0,   					null,   			null,   			 null,   				 null,   				null,   				null,   			 null,   			  0,   					 null,   					null,			:gl_cod_parque )  
						Using			sqlca;
					end if
					if sqlca.sqlcode=0 then
						commit;
						if is_base='C' then
							UPDATE 	"CONTRATO"  
							SET 		"ANEXO_REPACTA" = :ls_barra,   
										"CTA_REPACTA" = :ll_cta_mora,  
										"CTA_PAG_M" = :ll_suma_cta
							WHERE (  "CONTRATO"."SERIE_C" = :is_serie ) AND  
									( 	"CONTRATO"."NRO_CONTRATO" = :ll_num_ori )   
							Using	sqlca ;
							if sqlca.sqlcode=0 then
								commit;
								DECLARE sp_mod_cadena_mora_c PROCEDURE FOR sp_nuevo_cadena_mora('C',:is_serie,:ll_num_ori,'M');
								EXECUTE sp_mod_cadena_mora_c;
							else
								rollback;
							end if
						elseif is_base='O' then
							UPDATE "OFERTA_V"  
							SET 		"ANEXO_REPACTA" = :ls_barra,   
										"CTA_REPACTA" = :ll_cta_mora,  
										"CTA_PAG_M" = :ll_suma_cta
							WHERE ( "OFERTA_V"."SERIE" = :is_serie ) AND  
									  ( "OFERTA_V"."NRO_OFERTA" = :ll_num_ori )   
							Using	sqlca ;
							if sqlca.sqlcode=0 then
								commit;
								DECLARE sp_mod_cadena_mora_o PROCEDURE FOR sp_nuevo_cadena_mora('O',:is_serie,:ll_num_ori,'M');
								EXECUTE sp_mod_cadena_mora_o;
							else
								rollback;
							end if
						end if
						DECLARE sp_anular_cupones_ori PROCEDURE FOR SP_ANULAR_CUP_CTTO_ORI_REPRO( :is_base, :is_serie, :ll_num_ori, :gl_cta_mora_original );
						EXECUTE sp_anular_cupones_ori;
						if isvalid(w_boletas_cuotas) then w_boletas_cuotas.dw_datos_bl.retrieve(is_serie,ll_num_ori)
						if gi_rut_tercero>0 then
							ll_rut					= gi_rut_tercero
						else
							ll_rut					= gi_rut
						end if
						ll_plazo					= il_nro_ctas
						ldb_valor_cuota		= ll_val_ctas
						ldt_fecha_prim			= ldt_fecha_1
						Setnull(ldt_fec_venc_mant)
						ldb_valor_cuota_mant	= 0
						SELECT	"CLIENTE"."DV"  
						INTO 		:ls_dv  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   ;
						ll_cod_parque			= gl_cod_parque
						ls_moneda				= gs_moneda
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 	"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :is_serie ) AND  
								 ( "CADENA"."NUMERO" = :il_numero )   
						USING		sqlca;
						if ls_estado_cadena='V' then
							SELECT	"CUPONERAS"."NUMERO"  
							INTO 		:ll_count_vig  
							FROM 	"CUPONERAS"  
							WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS"."SERIE" = :is_serie ) AND  
									 ( "CUPONERAS"."NUMERO" = :il_numero ) AND  
									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=100 then
								DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:is_serie,:il_numero,'N');
								EXECUTE sp_nuevo_cadena_mora;
								
								DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :ls_base, :is_serie, :il_numero, :ll_plazo, :gs_user, :ll_rut, :ld_val_cta_uf, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
								EXECUTE sp_proc_genera_cuponera;
							else
								DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:is_serie,:il_numero,'M');
								EXECUTE sp_nuevo_cadena_mora1;
							end if
						end if
					else
						rollback;
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
			else
				rollback;
				messagebox("Error","Error al Grabar")
			end if
		end if
		cb_imprimir.triggerevent(clicked!)
	end if
end if
disconnect using trans_1;
disconnect using trans_2;
end event

type st_cliente from statictext within w_repacta_mora_mantencion_bkp
integer x = 55
integer y = 132
integer width = 1614
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusrectangle = false
end type

type em_cuotas from editmask within w_repacta_mora_mantencion_bkp
integer x = 1765
integer y = 380
integer width = 261
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31457278
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########"
end type

event modified;Long		ll_mora

il_nro_ctas	= long(this.text)
ll_mora		= long(st_ctas_mant_pago.text)
if this.text<>'' then
	if il_nro_ctas<2 then
		messagebox("Advertencia","La Reprogramación deben ser entre 2 a 15 cuotas o 18 - 24 - 30 - 36")
		il_nro_ctas	= 2
		this.text		= string(il_nro_ctas)
	elseif  (il_nro_ctas < 2) or (il_nro_ctas > 15 and il_nro_ctas < 18) or (il_nro_ctas > 18 and il_nro_ctas < 24) or (il_nro_ctas > 24 and il_nro_ctas < 30) or &
			(il_nro_ctas > 30 and il_nro_ctas < 36) or (il_nro_ctas > 36 ) then
		messagebox("Advertencia","La Reprogramación deben ser entre 2 a 15 cuotas o 18 - 24 - 30 - 36")
		il_nro_ctas	= 15
		this.text		= string(il_nro_ctas)
		cb_proceso.triggerevent(clicked!)
		il_modif ++
	else
		cb_proceso.triggerevent(clicked!)
		il_modif ++
	end if
end if

end event

type st_3 from statictext within w_repacta_mora_mantencion_bkp
integer x = 1074
integer y = 388
integer width = 672
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Nº de Cuotas a Pactar"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_numero from statictext within w_repacta_mora_mantencion_bkp
integer x = 946
integer y = 24
integer width = 635
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16776960
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_repacta_mora_mantencion_bkp
integer x = 818
integer y = 24
integer width = 123
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16776960
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_repacta_mora_mantencion_bkp
integer x = 690
integer y = 24
integer width = 123
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16776960
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_repacta_mora_mantencion_bkp
integer x = 27
integer y = 40
integer width = 631
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "CONTRATO ORIGINAL"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_proceso from commandbutton within w_repacta_mora_mantencion_bkp
integer x = 2149
integer y = 508
integer width = 334
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Procesar"
end type

event clicked;String	ls_string, ls_fecha,ls_titulo,ls_fecha_tope 
Date		ld_fecha, ld_fecha_hoy,ld_fec_pago,ld_fecha_tope_pago,ldt_fec_prox_pago
long 		i,ll_cuotas, ll_mes,ll_dia_aux,ll_new,ll_cuotas_div, ll_val_cta_inicial,ll_mora_mant,ll_dias_mora_mant,ll_dia, ll_anno, ll_monto, ll_suma_interes_peso, ll_suma_interes_uf,&
			ll_dias,ll_ctas_pag_m,ll_dia_tope, ll_mes_tope, ll_anno_tope,ll_factor_gc_peso,ll_cant_mant_mas,ll_mant_venc_peso,ll_pie_peso,&
			ll_cant_mant,ll_cant_cred
double	ld_total,ll_total, ld_int_cta,ld_tot_deuda_uf,ll_cuota_sin_int,ll_monto_cta,ld_resul, ld_val_int_uf, ld_int_cta_uf,ld_factor_peso, ld_factor_uf ,ld_interes_uf, ld_factor_gc,&
			ld_valor_cuota_m,ld_tasa_uf,ldb_pie,ldb_calc_monto
Datetime	ldt_fecha_venc_mant

dw_lista.accepttext()
if cb_terceros.italic=false then
	if il_modif = 0 then
		messagebox("Advertencia","Recuerde antes de Grabar Reprogramación, ingresar Nuevo Deudor si Procede")
	end if
end if
gl_n_cuotas_pag 				= 0 
gs_moneda						= '2'
ld_fecha_tope_pago			= id_fecha_tope_pago
il_nro_ctas						= long(em_cuotas.text)
ld_fecha							= date(em_fecha.text)
il_por_descto					= long(em_descuento.text)
ld_fecha_hoy					= ld_fecha //idt_fecha_hoy
ldb_pie							= dw_lista.getitemnumber(1,'pie')
if isnull(ldb_pie) then ldb_pie=0
ll_pie_peso						= round(ldb_pie * gd_uf_dia,0)
if ((il_nro_ctas > 1 and il_nro_ctas <= 15) or (il_nro_ctas=18 or il_nro_ctas=24 or il_nro_ctas=30 or il_nro_ctas=36)) and not isnull(ld_fecha) and il_por_descto>=0 and il_por_descto<=100 then
//if il_nro_ctas > 1 and not isnull(ld_fecha) and il_por_descto>=0 and il_por_descto<=100 then
	dw_detalle.reset()
	SELECT	"TASA"."TASA_INT_UF"  
	INTO 		:ld_tasa_uf  
	FROM 		"TASA"  
	WHERE 	"TASA"."LOOK" = 1   
	USING		sqlca;
	
	SELECT 	"INTERES_CUOTAS"."FACTOR_PESOS",   "INTERES_CUOTAS"."FACTOR_UF"  ,	"INTERES_CUOTAS"."INTERES_UF"	,	"INTERES_CUOTAS"."FACTOR_GC",	"INTERES_CUOTAS"."FACTOR_GC_PESO"
	INTO 		:ld_factor_peso,   					  :ld_factor_uf  ,						:ld_interes_uf		, 					:ld_factor_gc,						:ll_factor_gc_peso
	FROM 	"INTERES_CUOTAS"  
	WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :il_nro_ctas   
	USING		sqlca;
	st_factor.text					= string(ld_factor_uf)
	if il_nro_ctas > 0 and em_fecha.text<>'00/00/0000' and not isnull(ld_fecha) then
		if is_base='C' then
			SELECT	"CONTRATO"."VALOR_CUOTA_M",	"CONTRATO"."CTA_PAG_M",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."DIAS_MORA_MANT",	"CADENA_MORA"."FECHA_VENC_MANT"  
			INTO 		:ld_valor_cuota_m,				:ll_ctas_pag_m,			:ll_mora_mant,					:ll_dias_mora_mant,					:ldt_fecha_venc_mant  
			FROM 		"CONTRATO",	
						"CADENA",   
						"CADENA_MORA"  
			WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
					 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
					 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
					 ( "CONTRATO"."NRO_CONTRATO" = :il_numero ) )   
			USING		sqlca;

		elseif is_base='O' then
			SELECT	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."DIAS_MORA_MANT",	"CADENA_MORA"."FECHA_VENC_MANT",	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_M"  
			INTO 		:ll_mora_mant,					:ll_dias_mora_mant,					:ldt_fecha_venc_mant,				:ld_valor_cuota_m,				:ll_ctas_pag_m  
			FROM 	"CADENA",	"CADENA_MORA",	"OFERTA_V",	"PAGO_OFERTA"  
			WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :is_serie ) AND  
					 ( "CADENA"."NUMERO" = :il_numero ) )   
			USING		sqlca;
		end if
		IF gs_rezago <> "S" THEN	 
			id_valor_cuota 			= Round(ld_valor_cuota_m * gd_uf_dia, 0)
			ii_dmora 				= ll_dias_mora_mant
			IF ii_dmora > 5 THEN 
				ii_mora_cobro 		= ii_dmora 
				id_im 					= gf_int_mora(ld_tasa_uf, ii_mora_cobro, id_valor_cuota)
				IF ii_dmora > 30 THEN 
					id_gc 				= id_valor_cuota * ld_factor_gc //005 // PASA DE .1 A .05 10/1/2000
					ii_inc_gastos 	= 1
				END IF
			ELSE
				id_gc 					= 0
				id_im 					= 0
				ii_mora_cobro		= 0
				ii_inc_gastos		= 0
			END IF
		ELSE
			id_valor_cuota 			= 0
			ii_dmora 				= 0
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 			= 0
			ii_inc_gastos 			= 0
		END IF
		SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
		INTO   :ll_cant_mant,														:ll_cant_cred
		FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
		WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
				( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
				(("CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero ) )   ;
		ll_cuotas_div				= ll_cuotas / ll_cant_mant	//12
		
		ii_cantidad 					= ll_mora_mant
		ll_dia							= day(ld_fecha_hoy)
		ll_mes						= month(ld_fecha_hoy)
		ll_anno						= year(ld_fecha_hoy)
		for i=1 to il_nro_ctas
			if ll_dia > 28 and ll_mes =2 then
				ll_dia_aux			= 28
			elseif ll_dia > 30 and (ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11) then
				ll_dia_aux			= 30
			else
				ll_dia_aux			= ll_dia
			end if
			ls_fecha					= string(ll_dia_aux,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			ld_fec_pago				= date(ls_fecha)
			ll_mes++
			if ll_mes>12 then
				ll_mes				= 1
				ll_anno++
			end if
		next
	//	ld_fecha_ini				= ld_fecha
//		if ld_fecha_ini <= ld_fecha_tope_pago then
		if ld_fec_pago >= ld_fecha_tope_pago then
//			do while ld_fecha_ini <= ld_fecha_tope_pago
			do while ld_fec_pago >= ld_fecha_tope_pago
				DECLARE sp_prox_pago PROCEDURE FOR sp_calcular_vencimiento( :ld_fec_pago, :ll_cant_mant );
				EXECUTE sp_prox_pago;
				if sqlca.sqlcode=0 then
					fetch sp_prox_pago into :ldt_fec_prox_pago ;
					close sp_prox_pago;
					if not isnull(ldt_fec_prox_pago) then
						ld_fecha_tope_pago 	= ldt_fec_prox_pago
						ii_cantidad++
						ll_cant_mant_mas++
					end if
				end if
				
//				if ll_ctas_pag_m > 0 then
//					ll_count_mant := ll_ctas_pag_m + 1;
//					ll_cal_ctas_mant := (ll_ctas_pag_m * ll_cant_mant) - ll_cant_mant;
//					ldt_venc_mant1 := add_months(ldt_fec_venc_mant, ll_cal_ctas_mant );
//					ldt_venc_mant2 := add_months(ldt_venc_mant1, ll_cant_mant );
//				else
//					ll_count_mant := 1;
//					ldt_venc_mant2 := ldt_venc_mant1;
//				end if;
			loop

//			ll_cant_mant_mas++
//			ii_cantidad++
//			ll_dia_tope				= day(ld_fecha_tope_pago)
//			ll_mes_tope				= month(ld_fecha_tope_pago)
//			ll_anno_tope			= year(ld_fecha_tope_pago)
//			ll_anno_tope			= ll_anno_tope + 1
//			ls_fecha_tope			= string(ll_dia_tope,'00')+'/'+string(ll_mes_tope,'00')+'/'+string(ll_anno_tope,'0000')
//			ld_fecha_tope_pago	= date(ls_fecha_tope)
//			if ld_fec_pago >= ld_fecha_tope_pago then 
//				ii_cantidad++
//				ll_cant_mant_mas++
//				ll_anno_tope			= ll_anno_tope + 2
//				ls_fecha_tope			= string(ll_dia_tope,'00')+'/'+string(ll_mes_tope,'00')+'/'+string(ll_anno_tope,'0000')
//				ld_fecha_tope_pago	= date(ls_fecha_tope)
//				if ld_fec_pago >= ld_fecha_tope_pago then 
//					ii_cantidad++
//					ll_cant_mant_mas++
//					ll_anno_tope			= ll_anno_tope + 3
//					ls_fecha_tope			= string(ll_dia_tope,'00')+'/'+string(ll_mes_tope,'00')+'/'+string(ll_anno_tope,'0000')
//					ld_fecha_tope_pago	= date(ls_fecha_tope)
//					if ld_fec_pago >= ld_fecha_tope_pago then 
//						ii_cantidad++
//						ll_cant_mant_mas++
//					end if
//				end if
//			end if
		end if
		st_ctas_mant_pago.text	= string(ii_cantidad,"###,###,###,###,##0")
		if ll_cant_mant_mas>0 then
			ll_mant_venc_peso	= round(((ll_cant_mant_mas * ld_valor_cuota_m) * gd_uf_dia),0)
		end if
		if isnull(ll_mant_venc_peso) then ll_mant_venc_peso=0
		il_monto								= (gd_val_deuda + gd_val_interes + ll_mant_venc_peso) - ll_pie_peso
		ldb_calc_monto						= round(il_monto / gd_uf_dia,2)
		il_monto								= round(ldb_calc_monto * gd_uf_dia,0)
		
		id_monto_uf							= round(il_monto / gd_uf_dia,2)
//		em_val_total.text					= string(il_monto,'###,###,###,##0')
		il_uf_inicial							= round(il_monto / gd_uf_dia,2)
		st_deuda_uf.text					= string(id_monto_uf ,"###,###,###,###,##0.00")
		em_val_total.text					= string(round(id_monto_uf * gd_uf_dia,0),"###,###,###,###,##0")
		st_val_interes_tot_total.text		= string(id_monto_uf,"###,###,###,###,##0.00")
		st_val_interes_total.text			= string(il_monto,"###,###,###,###,##0")
		il_monto_cuota						= il_monto / il_nro_ctas
		if gs_moneda = '1' then //peso
			il_val_int_cta					= ll_factor_gc_peso
			ld_int_cta_uf					= il_val_int_cta / gd_uf_dia
			il_val_int							= (il_val_int_cta * il_nro_ctas) + gd_val_interes
			ld_val_int_uf					= gd_val_interes / gd_uf_dia
			st_val_interes_tot_total.text	= string(ld_val_int_uf ,"###,###,###,###,##0.00")
			ld_total							= ((ld_total + il_val_int) - gd_val_interes)
		elseif gs_moneda = '2' then //uf
			il_val_int_cta					= ld_factor_gc * gd_uf_dia //005 * gd_uf_dia
			ld_int_cta_uf					= il_val_int_cta / gd_uf_dia
			il_val_int							= (il_val_int_cta * il_nro_ctas) + gd_val_interes
			ld_val_int_uf					= gd_val_interes / gd_uf_dia
			ld_total							= ((ld_total + il_val_int) - gd_val_interes)
		end if
		il_int_adm_peso					= il_val_int_cta * il_nro_ctas
		il_int_adm_uf						= il_int_adm_peso / gd_uf_dia
		st_val_interes_adm_pesos.text	= string(il_int_adm_peso,"###,###,###,###,##0")
		st_val_interes_adm_uf.text		= string(il_int_adm_uf,"###,###,###,###,##0.00")
		il_deuda								= ld_total
		ll_dia									= day(ld_fecha_hoy)
		ll_mes								= month(ld_fecha_hoy)
		ll_anno								= year(ld_fecha_hoy)
		if gs_moneda='1' then
	//		ll_val_cta_inicial				= ((gd_val_deuda + gd_val_interes + il_int_adm_peso) / il_nro_ctas)
	//		ll_monto_cta					= round(((ll_val_cta_inicial * ld_factor_peso) + ll_val_cta_inicial),0)
	//		st_val_cuota_peso.text		= string(ll_monto_cta,"###,###,###,###,##0")
	//		st_val_cuota_uf.text			= string((ll_monto_cta / gd_uf_dia),"###,###,###,##0.00")
		elseif gs_moneda='2' then
			ll_val_cta_inicial				= ((gd_val_deuda + gd_val_interes + il_int_adm_peso) / il_nro_ctas)
			ll_monto_cta					= id_monto_uf * ld_factor_uf
			st_val_cuota_peso.text		= string(ll_monto_cta,"###,###,###,###,##0")
			st_val_cuota_uf.text			= string((ll_monto_cta / gd_uf_dia),"###,###,###,##0.0000")	
		end if
		st_val_cuota_peso.text			= string((il_int_adm_peso + il_monto),"###,###,###,###,##0")
		st_val_cuota_uf.text				= string((il_int_adm_peso + il_monto)/gd_uf_dia,"###,###,###,###,##0.00")
		st_val_cuota_peso2.text			= string(long(st_val_cuota_peso.text) * ld_factor_uf,"###,###,##0")
		st_val_cuota_uf2.text				= string(long(st_val_cuota_peso2.text) / gd_uf_dia,"###,###,##0.0000")
		for i=1 to il_nro_ctas
			ll_new							= dw_detalle.insertrow(0)
			dw_detalle.setitem(ll_new,'monto',long(st_val_cuota_peso2.text))
			dw_detalle.setitem(ll_new,'uf',gd_uf_dia)
			if ll_dia > 28 and ll_mes =2 then
				ll_dia_aux					= 28
			elseif ll_dia > 30 and (ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11) then
				ll_dia_aux					= 30
			else
				ll_dia_aux					= ll_dia
			end if
			ls_fecha							= string(ll_dia_aux,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			ld_fec_pago						= date(ls_fecha)
			dw_detalle.setitem(ll_new,'fecha',ld_fec_pago)
			ll_mes++
			if ll_mes>12 then
				ll_mes						= 1
				ll_anno++
			end if
			dw_detalle.setitem(ll_new,'estado','V')
		next
		if il_modif = 0 then
			il_uf_inicial								= round(il_monto / gd_uf_dia,2)
		end if
		if dw_detalle.rowcount() > 0 then
			il_monto_cuota							= dw_detalle.getitemnumber(1,'monto')
			ld_tot_deuda_uf						= ((il_monto_cuota * il_nro_ctas) / gd_uf_dia)
			dw_lista.setitem(1,'total_deuda_uf',ld_tot_deuda_uf)
			dw_detalle.object.t_titulo.text		= 'Detalle Cuotas Repactación Nº:   R - '+is_serie+' - '+string(il_numero,"###,###,###,###,###")+'-'+string(il_corr,"###,###,###,###,###")
			dw_detalle.object.t_titulo_1.text	= 'CLIENTE  '+string(gi_rut,"###,###,###,##0")+' - '+gs_dv+'     '+trim(st_cliente.text)
			dw_detalle.object.t_titulo_2.text	= 'CONTRATO ORIGINAL:   '+is_base+' - '+is_serie+ ' - '+string(il_numero,"###,###,###,###,##0")
			dw_detalle.object.t_titulo_3.text	= ls_titulo
		end if
		if dw_lista.rowcount() > 0 then
			dw_lista.setitem(1,'valor_cuota',il_monto_cuota)
			il_cuota_uf		=  il_monto_cuota / gd_uf_dia
			dw_lista.setitem(1,'valor_cuota_uf',il_cuota_uf)
			il_deuda			= il_monto_cuota * il_nro_ctas
			dw_lista.setitem(1,'total_deuda',il_deuda)
			dw_lista.setitem(1,'cuotas_pactadas',il_nro_ctas)
			dw_lista.setitem(1,'fecha_primera_cta',ld_fecha)
			il_sw					= 1
		end if
	else
		messagebox("Advertencia","Falta ingresar Datos")
		em_cuotas.setfocus()
	end if
else
	if il_nro_ctas=0 then 
		messagebox("Advertencia","Falta Ingresar Cuotas a Pactar")
		em_cuotas.setfocus()
	elseif il_nro_ctas<2 then
		messagebox("Advertencia","La Reprogramación deben ser entre 2 a 15 cuotas o 18 - 24 - 30 - 36")
		em_cuotas.setfocus()
	elseif  (il_nro_ctas < 2) or (il_nro_ctas > 15 and il_nro_ctas < 18) or (il_nro_ctas > 18 and il_nro_ctas < 24) or (il_nro_ctas > 24 and il_nro_ctas < 30) or &
			(il_nro_ctas > 30 and il_nro_ctas < 36) or (il_nro_ctas > 36 ) then
		messagebox("Advertencia","La Reprogramación deben ser entre 2 a 15 cuotas o 18 - 24 - 30 - 36")
		em_cuotas.setfocus()
	elseif il_por_descto<0 then
		messagebox("Advertencia","Rango Descuento Inválido (0 a 100)")
		em_descuento.setfocus()
	elseif isnull(ld_fecha) then
		messagebox("Advertencia","Fecha Pago 1º Cuota Inválida")
		em_fecha.setfocus()
	end if
end if
end event

type st_1 from statictext within w_repacta_mora_mantencion_bkp
integer x = 69
integer y = 812
integer width = 270
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sub Total $"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_repacta_mora_mantencion_bkp
integer x = 2149
integer y = 1836
integer width = 334
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
end type

event clicked;long	ll_resp, ll_cant_print
if trim(gs_opera)='1' then
	if il_sw=1 then
		ll_resp = MessageBox("Modificación", "Desea Grabar los Cambios",Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			wf_grabar()
		end if
		close(w_repacta_mora_mantencion)
	else
		if isvalid(w_boletas_cuotas) then w_boletas_cuotas.cb_repactar.triggerevent(clicked!)
		close(w_repacta_mora_mantencion)
	end if
else
	if isvalid(w_boletas_cuotas) then w_boletas_cuotas.cb_repactar.triggerevent(clicked!)
	close(w_repacta_mora_mantencion)
end if
end event

type dw_detalle from datawindow within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 1234
integer y = 1152
integer width = 869
integer height = 696
string dataobject = "dwe_cuotas_pactadas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type em_deuda from statictext within w_repacta_mora_mantencion_bkp
integer x = 366
integer y = 796
integer width = 402
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_val_interes from statictext within w_repacta_mora_mantencion_bkp
integer x = 1193
integer y = 796
integer width = 462
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_repacta_mora_mantencion_bkp
integer x = 55
integer y = 1020
integer width = 2446
integer height = 316
string dataobject = "dw_detalle_repacta_mantencion"
boolean hscrollbar = true
boolean border = false
end type

event clicked;String		ls_fecha,ls_columna
date		ldt_fecha_dia,ldt_fecha_pie,ldt_fecha_ctto,ldt_fecha_ini,ldt_fecha_fin,ldt_nulo
Double	ldb_pie

Setnull(ldt_nulo)
ls_columna					= dwo.name
ldt_fecha_dia				= date(gdt_fec_sistema)
if ls_columna='p_1' then
	ldb_pie					= dw_lista.getitemnumber(1,'pie')
	if ldb_pie > 0 and not isnull(ldb_pie) then
		ls_fecha					= string(date(dw_lista.getitemdatetime(1,'fecha_pie')))
		if isnull(ls_fecha) then ls_fecha = string(ldt_fecha_dia,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_lista.setitem(1,'fecha_pie',datetime(string(ldt_fecha_dia,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_lista.setitem(1,'fecha_pie',date(ls_fecha))
		END IF
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_pie')
		ldt_fecha_pie	= date(dw_lista.getitemdatetime(1,'fecha_pie'))
		ldt_fecha_ctto	= date(dw_lista.getitemdatetime(1,'fecha_crea'))
		if not isnull(ldt_fecha_pie) then
			ldt_fecha_ini	= RelativeDate(ldt_fecha_ctto, -90)
			ldt_fecha_fin	= RelativeDate(ldt_fecha_ctto, 90)
			if ldt_fecha_pie < ldt_fecha_ini and ldt_fecha_pie > ldt_fecha_fin then
				messagebox("Advertencia","Fecha Pie Inválida o Fuera del Plazo permitido")
				dw_lista.Setitem(1,'fecha_pie',ldt_nulo)
				dw_lista.accepttext()
			end if
		end if
	else
		messagebox("Advertencia","Debe Ingresar Pie")
	end if
end if
end event

event itemchanged;String		ls_columna
date		ldt_fecha_pie,ldt_fecha_ctto,ldt_fecha_ini,ldt_fecha_fin,ldt_nulo
Double	ldb_pie,ldb_nulo

this.accepttext()
Setnull(ldt_nulo);Setnull(ldb_nulo)
ls_columna			= dwo.name
if ls_columna='fecha_pie' then
	ldt_fecha_pie	= date(data)
	ldt_fecha_ctto	= date(dw_lista.getitemdatetime(1,'fecha_crea'))
	if not isnull(ldt_fecha_pie) then
		ldt_fecha_ini	= RelativeDate(ldt_fecha_ctto, -90)
		ldt_fecha_fin	= RelativeDate(ldt_fecha_ctto, 90)
		if ldt_fecha_pie < ldt_fecha_ini and ldt_fecha_pie > ldt_fecha_fin then
			messagebox("Advertencia","Fecha Pie Inválida o Fuera del Plazo permitido")
			dw_lista.Setitem(1,'fecha_pie',ldt_nulo)
			dw_lista.accepttext()
		end if
	end if
elseif ls_columna='pie' then
	ldb_pie			= Double(data)
	if ldb_pie >= il_uf_inicial then //id_monto_uf then
		messagebox("Advertencia","Pie No debe ser Superior al Monto Adeudado")
		dw_lista.Setitem(1,'pie',0)
		dw_lista.accepttext()
	else
		il_modif ++
		if ldb_pie=0 or isnull(ldb_pie) then
			dw_lista.Setitem(1,'fecha_pie',ldt_nulo)
			dw_lista.accepttext()
			cb_proceso.triggerevent(clicked!)
		elseif ldb_pie>500 then
			messagebox("Advertencia","Recuerde Pie debe ser Ingresado en U.F.")
			dw_lista.Setitem(1,'pie',ldb_nulo)
			dw_lista.accepttext()
		elseif il_modif > 0 then
			cb_proceso.triggerevent(clicked!)
		end if
	end if
end if
end event

type gb_3 from groupbox within w_repacta_mora_mantencion_bkp
integer x = 59
integer y = 688
integer width = 2496
integer height = 688
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Deuda Actual"
end type

type cb_imprimir from commandbutton within w_repacta_mora_mantencion_bkp
integer x = 2149
integer y = 1608
integer width = 334
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Ctto"
end type

event clicked;long		ll_corr, ll_cont_print , ll_resp=0, ll_cod_parque
String		ls_base_ori, ls_serie_ori
Double	ll_ctto
if dw_detalle.rowcount() > 0 then
	ls_base_ori		= trim(st_base.text)
	ls_serie_ori		= trim(st_serie.text)
	ll_ctto				= Double(st_numero.text)
	il_numero		= dw_lista.getitemnumber(1,'numero')
	SELECT sum("REPACTA_MANTENCION"."CANT_PRINT")
   INTO :ll_cont_print  
   FROM "REPACTA_MANTENCION"  
   WHERE ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :ls_base_ori ) AND  
         ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :ls_serie_ori ) AND  
         ( "REPACTA_MANTENCION"."NUMERO" = :il_numero )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_cont_print>0 then
			ll_resp	= messagebox("Advertencia","Contrato ya Impreso, desea imprimir nuevamente",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				ll_cont_print ++
			else
				ll_resp=0
			end if
		elseif ll_cont_print=0 then
			ll_cont_print	= 1
			ll_resp	= messagebox("Advertencia","Imprimir Contrato",Exclamation!,YesNo!,2)
			if ll_resp <> 1 then ll_resp=0
		elseif isnull(ll_cont_print) then
			messagebox("Advertencia","Debe Grabar antes de Imprimir Contrato")
			ll_resp	= 2
		end if
	else
		messagebox("Advertencia","Debe Grabar antes de Imprimir Contrato")
		ll_resp	= 2
	end if 
	if ll_resp=1 then
		SELECT	"CADENA"."COD_PARQUE"  
		INTO 		:ll_cod_parque  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base_ori ) AND  
				 ( "CADENA"."SERIE" = :ls_serie_ori ) AND  
				 ( "CADENA"."NUMERO" = :ll_ctto )   
		USING		sqlca;
		if isnull(ll_cod_parque) or ll_cod_parque=0 then ll_cod_parque = 1

		if is_base='C' and (ll_cod_parque=1 or ll_cod_parque=102) then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_stgo_todos'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_stgo_todos_tercero'
			end if
		elseif is_base='C' and gs_conexion="Parque La Foresta" then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_serena_todos'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_serena_todos_tercero'
			end if
		elseif is_base='O' and gs_conexion="Parque La Foresta" and ll_num_ori >= 4251 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_serena_mayor_4251'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_serena_mayor_4251_3'
			end if
		elseif is_base='O' and gs_conexion="Parque La Foresta" and ll_num_ori < 4251 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_serena_menor_4251'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_serena_menor_4251_3'
			end if
		elseif is_base='O' and (ll_cod_parque=1 or ll_cod_parque=102) and ll_num_ori >= 21506 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_stgo_mayor_21506'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_stgo_mayor_21506_3'
			end if
		elseif is_base='O' and (ll_cod_parque=1 or ll_cod_parque=102) and ll_num_ori < 21506 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_stgo_menor_21506'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_o_stgo_menor_21506_3'
			end if
		elseif is_base='C' and ll_cod_parque = 103 then
			if w_repacta_mora_mantencion.cb_terceros.italic = false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_parque_santiago'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_parque_santiago'
			end if
		elseif is_base = 'O' and ll_cod_parque = 103 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_promesa_stgo'
			else
				dw_print_ctto.dataobject	= 'dw_print_promesa_stgo'
			end if
		elseif is_base='C' and ll_cod_parque = 801 then
			if w_repacta_mora_mantencion.cb_terceros.italic = false then
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_parque_conce'
			else
				dw_print_ctto.dataobject	= 'dw_print_contrato_c_parque_conce'
			end if
		elseif is_base = 'O' and ll_cod_parque = 801 then
			if w_repacta_mora_mantencion.cb_terceros.italic=false then
				dw_print_ctto.dataobject	= 'dw_print_promesa_conce'
			else
				dw_print_ctto.dataobject	= 'dw_print_promesa_conce'
			end if
		end if
		dw_print_ctto.settransobject(sqlca)
		if dw_print_ctto.retrieve(ls_base_ori,ls_serie_ori,il_numero)=0 then //ll_num_ori
			messagebox("Advertencia","Debe Grabar antes de Imprimir Contrato")
		else
			if f_printdlg2(dw_print_ctto,gstr_print,w_repacta_mora_mantencion)=0 then
				dw_print_ctto.print()
				dw_detalle.print()
				dw_detalle.print()
				UPDATE "REPACTA_MANTENCION"  
				SET "CANT_PRINT" = :ll_cont_print  
				WHERE ( "REPACTA_MANTENCION"."BASE" = 'R' ) AND  
						( "REPACTA_MANTENCION"."SERIE" = :is_serie ) AND  
						( "REPACTA_MANTENCION"."NUMERO" = :il_numero )   
				Using	sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				cb_cerrar.triggerevent(clicked!)
			else
				close(w_repacta_mora_mantencion)
			end if
		end if
	elseif ll_resp=0 then
		cb_cerrar.triggerevent(clicked!)
	end if
end if
end event

type gb_2 from groupbox within w_repacta_mora_mantencion_bkp
integer x = 37
integer y = 1408
integer width = 2496
integer height = 572
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Valores Reprogramación"
end type

type cb_eliminar from commandbutton within w_repacta_mora_mantencion_bkp
boolean visible = false
integer x = 2149
integer y = 1608
integer width = 334
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Eliminar"
end type

event clicked;string	ls_base_aux
integer	ll_resp
Long		ll_count_reg
Date		ld_fecha

if dw_lista.rowcount()>0 then
	ld_fecha	= idt_fecha_hoy
	SELECT	"REPACTA_MANTENCION"."BASE"  
	INTO 		:ls_base_aux  
	FROM 		"REPACTA_MANTENCION"  
	WHERE 	( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
				( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
				( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero )   
	Using		sqlca ;
	if sqlca.sqlcode=0 then
		ll_resp = MessageBox("Eliminar", "Está Seguro Eliminar Repactación Nº "+'R-'+is_serie+'-'+string(il_numero,"###,###,###,###,###"), &
				Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			SELECT	sum("REPACTA_MANTENCION_DETALLE"."CORRELATIVO")
			INTO 		:ll_count_reg
			FROM 		"REPACTA_MANTENCION_DETALLE"  
			WHERE  ( "REPACTA_MANTENCION_DETALLE"."BASE" = 'R' ) AND  
					 ( "REPACTA_MANTENCION_DETALLE"."SERIE" = :is_serie ) AND  
					 ( "REPACTA_MANTENCION_DETALLE"."NUMERO" = :il_numero )   
			Using	sqlca ;
			if sqlca.sqlcode=0 then
				if ll_count_reg>0 then
					messagebox("Advertencia","No Puede Eliminar Repactación, ya existen cuotas pagadas")
				else
					UPDATE "REPACTA_MANTENCION"
					SET    "ESTADO_PAGO" = 'N'
					WHERE ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
							( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
							( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero )   
					Using	sqlca ;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE "CADENA"
						SET    "ESTADO" = 'N',
								 "FECHA_RES" = :ld_fecha
						WHERE ( "CADENA"."CODIGO" = 'R' ) AND  
								( "CADENA"."SERIE" = :is_serie ) AND  
								( "CADENA"."NUMERO" = :il_numero )   
						Using	sqlca ;
						if sqlca.sqlcode=0 then
							commit;
							messagebox("Eliminar","Repactación  R - "+is_serie+' - '+string(il_numero,"###,###,###,###,##0")+"  Eliminada")
						else
							rollback;
						end if
						dw_lista.reset()
						dw_detalle.reset()
						em_cuotas.text	= ''
						em_fecha.text	= string(idt_fecha_hoy)
					else
						rollback;
					end if
				end if
			end if
		END IF
	end if
end if
end event

type gb_1 from groupbox within w_repacta_mora_mantencion_bkp
integer x = 37
integer y = 284
integer width = 2496
integer height = 372
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
string text = "Ingrese Datos"
end type

