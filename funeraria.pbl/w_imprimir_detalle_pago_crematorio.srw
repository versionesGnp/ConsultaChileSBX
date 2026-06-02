forward
global type w_imprimir_detalle_pago_crematorio from window
end type
type dw_seguro from datawindow within w_imprimir_detalle_pago_crematorio
end type
type dw_abono from datawindow within w_imprimir_detalle_pago_crematorio
end type
type st_help_tc_check from statictext within w_imprimir_detalle_pago_crematorio
end type
type st_help_tc from statictext within w_imprimir_detalle_pago_crematorio
end type
type st_help_ch from statictext within w_imprimir_detalle_pago_crematorio
end type
type st_saldo from statictext within w_imprimir_detalle_pago_crematorio
end type
type st_1 from statictext within w_imprimir_detalle_pago_crematorio
end type
type dw_tc_2 from datawindow within w_imprimir_detalle_pago_crematorio
end type
type dw_cheque_2 from datawindow within w_imprimir_detalle_pago_crematorio
end type
type em_dias_cheque from editmask within w_imprimir_detalle_pago_crematorio
end type
type st_16 from statictext within w_imprimir_detalle_pago_crematorio
end type
type rb_otra_fecha_ch from radiobutton within w_imprimir_detalle_pago_crematorio
end type
type rb_ch_30_dias from radiobutton within w_imprimir_detalle_pago_crematorio
end type
type rb_ch_dia from radiobutton within w_imprimir_detalle_pago_crematorio
end type
type cb_limpiar from commandbutton within w_imprimir_detalle_pago_crematorio
end type
type cbx_td from checkbox within w_imprimir_detalle_pago_crematorio
end type
type cbx_tc from checkbox within w_imprimir_detalle_pago_crematorio
end type
type cbx_ch from checkbox within w_imprimir_detalle_pago_crematorio
end type
type cbx_ef from checkbox within w_imprimir_detalle_pago_crematorio
end type
type em_cuotas_tc from editmask within w_imprimir_detalle_pago_crematorio
end type
type st_cantidad_cuotas from statictext within w_imprimir_detalle_pago_crematorio
end type
type dw_efectivo from datawindow within w_imprimir_detalle_pago_crematorio
end type
type dw_td from datawindow within w_imprimir_detalle_pago_crematorio
end type
type dw_tc from datawindow within w_imprimir_detalle_pago_crematorio
end type
type em_cheques from editmask within w_imprimir_detalle_pago_crematorio
end type
type st_cantidad_dcto from statictext within w_imprimir_detalle_pago_crematorio
end type
type dw_cheque from datawindow within w_imprimir_detalle_pago_crematorio
end type
type cb_cerrar from commandbutton within w_imprimir_detalle_pago_crematorio
end type
type cb_imprimir from commandbutton within w_imprimir_detalle_pago_crematorio
end type
type gb_cheque from groupbox within w_imprimir_detalle_pago_crematorio
end type
type ln_1 from line within w_imprimir_detalle_pago_crematorio
end type
type ln_2 from line within w_imprimir_detalle_pago_crematorio
end type
type dw_detalle from datawindow within w_imprimir_detalle_pago_crematorio
end type
type st_help_ch_check from statictext within w_imprimir_detalle_pago_crematorio
end type
end forward

global type w_imprimir_detalle_pago_crematorio from window
integer width = 3954
integer height = 2872
boolean titlebar = true
string title = "Detalle de Pago"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_seguro dw_seguro
dw_abono dw_abono
st_help_tc_check st_help_tc_check
st_help_tc st_help_tc
st_help_ch st_help_ch
st_saldo st_saldo
st_1 st_1
dw_tc_2 dw_tc_2
dw_cheque_2 dw_cheque_2
em_dias_cheque em_dias_cheque
st_16 st_16
rb_otra_fecha_ch rb_otra_fecha_ch
rb_ch_30_dias rb_ch_30_dias
rb_ch_dia rb_ch_dia
cb_limpiar cb_limpiar
cbx_td cbx_td
cbx_tc cbx_tc
cbx_ch cbx_ch
cbx_ef cbx_ef
em_cuotas_tc em_cuotas_tc
st_cantidad_cuotas st_cantidad_cuotas
dw_efectivo dw_efectivo
dw_td dw_td
dw_tc dw_tc
em_cheques em_cheques
st_cantidad_dcto st_cantidad_dcto
dw_cheque dw_cheque
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
gb_cheque gb_cheque
ln_1 ln_1
ln_2 ln_2
dw_detalle dw_detalle
st_help_ch_check st_help_ch_check
end type
global w_imprimir_detalle_pago_crematorio w_imprimir_detalle_pago_crematorio

type variables
Date	idt_fecha_hoy
Long	il_pasa_ch,il_pasa_tc
end variables

forward prototypes
public subroutine wf_cargar_tc ()
public subroutine wf_cargar_cheque ()
public function long wf_saldo_pago ()
end prototypes

public subroutine wf_cargar_tc ();Long	ll_tot_reg,ll_indi,ll_banco,ll_new
Date	ldt_fecha_vcto
dw_tc_2.reset()
ll_tot_reg			= dw_tc.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_banco			= dw_tc.getitemnumber(ll_indi,'banco')
	ldt_fecha_vcto	= date(dw_tc.getitemdatetime(ll_indi,'fecha_venc'))
	ll_new			= dw_tc_2.insertrow(0)
	dw_tc_2.setitem(ll_new,'banco',ll_banco)
	dw_tc_2.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
next
dw_tc.reset()
ll_tot_reg			= dw_tc_2.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_banco			= dw_tc_2.getitemnumber(ll_indi,'banco')
	ldt_fecha_vcto	= date(dw_tc_2.getitemdatetime(ll_indi,'fecha_venc'))
	ll_new			= dw_tc.insertrow(0)
	dw_tc.setitem(ll_new,'banco',ll_banco)
	dw_tc.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
	dw_tc.setitem(ll_new,'monto',0)
next
dw_tc.accepttext()
dw_tc.scrolltorow(1)
dw_tc.setfocus()
dw_tc.setcolumn('monto')
end subroutine

public subroutine wf_cargar_cheque ();Long	ll_tot_reg,ll_indi,ll_banco,ll_serie,ll_new
Date	ldt_fecha_vcto
dw_cheque_2.reset()
ll_tot_reg			= dw_cheque.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_banco			= dw_cheque.getitemnumber(ll_indi,'banco')
	ll_serie			= dw_cheque.getitemnumber(ll_indi,'serie')
	ldt_fecha_vcto	= date(dw_cheque.getitemdatetime(ll_indi,'fecha_venc'))
	ll_new			= dw_cheque_2.insertrow(0)
	dw_cheque_2.setitem(ll_new,'banco',ll_banco)
	dw_cheque_2.setitem(ll_new,'serie',ll_serie)
	dw_cheque_2.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
next
dw_cheque.reset()
ll_tot_reg			= dw_cheque_2.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_banco			= dw_cheque_2.getitemnumber(ll_indi,'banco')
	ll_serie			= dw_cheque_2.getitemnumber(ll_indi,'serie')
	ldt_fecha_vcto	= date(dw_cheque_2.getitemdatetime(ll_indi,'fecha_venc'))
	ll_new			= dw_cheque.insertrow(0)
	dw_cheque.setitem(ll_new,'banco',ll_banco)
	dw_cheque.setitem(ll_new,'serie',ll_serie)
	dw_cheque.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
	dw_cheque.setitem(ll_new,'monto',0)
next
dw_cheque.accepttext()
dw_cheque.scrolltorow(1)
dw_cheque.setfocus()
dw_cheque.setcolumn('monto')
end subroutine

public function long wf_saldo_pago ();Double	ll_total

ll_total	= round(dw_detalle.getitemnumber(1,'total_2') ,0)
if cbx_ef.checked=true then
	if dw_efectivo.rowcount()>0 then ll_total	= ll_total - round(dw_efectivo.getitemnumber(1,'monto'),0)
end if
if cbx_ch.checked=true then
	if dw_cheque.rowcount()>0 then ll_total = ll_total - round(dw_cheque.getitemnumber(1,'monto_total'),0)
end if
if cbx_tc.checked=true then
	if dw_tc.rowcount()>0 then ll_total	= ll_total - round(dw_tc.getitemnumber(1,'monto_total'),0)
end if
if cbx_td.checked=true then
	if dw_td.rowcount()>0 then ll_total	= ll_total - round(dw_td.getitemnumber(1,'monto'),0)
end if
st_saldo.text	= string(ll_total,"###,###,###,###,##0")
if ll_total<0 then
	messagebox("Advertencia","Saldo No debe ser Menor a CERO")
end if
Return(ll_total)

end function

on w_imprimir_detalle_pago_crematorio.create
this.dw_seguro=create dw_seguro
this.dw_abono=create dw_abono
this.st_help_tc_check=create st_help_tc_check
this.st_help_tc=create st_help_tc
this.st_help_ch=create st_help_ch
this.st_saldo=create st_saldo
this.st_1=create st_1
this.dw_tc_2=create dw_tc_2
this.dw_cheque_2=create dw_cheque_2
this.em_dias_cheque=create em_dias_cheque
this.st_16=create st_16
this.rb_otra_fecha_ch=create rb_otra_fecha_ch
this.rb_ch_30_dias=create rb_ch_30_dias
this.rb_ch_dia=create rb_ch_dia
this.cb_limpiar=create cb_limpiar
this.cbx_td=create cbx_td
this.cbx_tc=create cbx_tc
this.cbx_ch=create cbx_ch
this.cbx_ef=create cbx_ef
this.em_cuotas_tc=create em_cuotas_tc
this.st_cantidad_cuotas=create st_cantidad_cuotas
this.dw_efectivo=create dw_efectivo
this.dw_td=create dw_td
this.dw_tc=create dw_tc
this.em_cheques=create em_cheques
this.st_cantidad_dcto=create st_cantidad_dcto
this.dw_cheque=create dw_cheque
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.gb_cheque=create gb_cheque
this.ln_1=create ln_1
this.ln_2=create ln_2
this.dw_detalle=create dw_detalle
this.st_help_ch_check=create st_help_ch_check
this.Control[]={this.dw_seguro,&
this.dw_abono,&
this.st_help_tc_check,&
this.st_help_tc,&
this.st_help_ch,&
this.st_saldo,&
this.st_1,&
this.dw_tc_2,&
this.dw_cheque_2,&
this.em_dias_cheque,&
this.st_16,&
this.rb_otra_fecha_ch,&
this.rb_ch_30_dias,&
this.rb_ch_dia,&
this.cb_limpiar,&
this.cbx_td,&
this.cbx_tc,&
this.cbx_ch,&
this.cbx_ef,&
this.em_cuotas_tc,&
this.st_cantidad_cuotas,&
this.dw_efectivo,&
this.dw_td,&
this.dw_tc,&
this.em_cheques,&
this.st_cantidad_dcto,&
this.dw_cheque,&
this.cb_cerrar,&
this.cb_imprimir,&
this.gb_cheque,&
this.ln_1,&
this.ln_2,&
this.dw_detalle,&
this.st_help_ch_check}
end on

on w_imprimir_detalle_pago_crematorio.destroy
destroy(this.dw_seguro)
destroy(this.dw_abono)
destroy(this.st_help_tc_check)
destroy(this.st_help_tc)
destroy(this.st_help_ch)
destroy(this.st_saldo)
destroy(this.st_1)
destroy(this.dw_tc_2)
destroy(this.dw_cheque_2)
destroy(this.em_dias_cheque)
destroy(this.st_16)
destroy(this.rb_otra_fecha_ch)
destroy(this.rb_ch_30_dias)
destroy(this.rb_ch_dia)
destroy(this.cb_limpiar)
destroy(this.cbx_td)
destroy(this.cbx_tc)
destroy(this.cbx_ch)
destroy(this.cbx_ef)
destroy(this.em_cuotas_tc)
destroy(this.st_cantidad_cuotas)
destroy(this.dw_efectivo)
destroy(this.dw_td)
destroy(this.dw_tc)
destroy(this.em_cheques)
destroy(this.st_cantidad_dcto)
destroy(this.dw_cheque)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.gb_cheque)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.dw_detalle)
destroy(this.st_help_ch_check)
end on

event open;Long		ll_tot_reg,ll_count,ll_indi,ll_new,ll_cod_seguro,ll_fila,ll_monto_seg,ll_suma_seg,ll_monto_uni,ll_cant,ll_count_l=0,ll_count_s=0
String	ls_tipo_cob,ls_nom,ls_ap_pat,ls_ap_mat,ls_dv,ls_cod_otro
Double	ll_suma_monto_otros,ll_suma_cuota,ll_monto_abono,ll_suma_descuento,ll_iva_f,ll_iva_p,ll_iva_r

idt_fecha_hoy								= date(gdt_fec_sistema)
gf_centrar(w_imprimir_detalle_pago_crematorio)
dw_detalle.settransobject(sqlca)
dw_abono.settransobject(sqlca)
dw_efectivo.settransobject(sqlca)
dw_td.settransobject(sqlca)
dw_cheque.settransobject(sqlca)
dw_cheque_2.settransobject(sqlca)
dw_tc.settransobject(sqlca)
dw_tc_2.settransobject(sqlca)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve(gs_base,gs_serie, gi_numero)
if dw_abono.retrieve(gs_base,gs_serie,gi_numero) > 0 then
	dw_detalle.object.t_104.visible		= true
	dw_detalle.object.t_105.visible		= true
	dw_detalle.object.t_abono.visible	= true
	ll_monto_abono						= dw_abono.getitemnumber(1,'c_sum_saldo')
	dw_detalle.object.t_abono.text		= string(ll_monto_abono,'###,###,###,###,##0.0###')
else
	dw_detalle.object.t_104.visible		= false
	dw_detalle.object.t_105.visible		= false
	dw_detalle.object.t_abono.visible	= false
end if
il_pasa_ch									= 0
il_pasa_tc									= 0
st_help_ch.visible							= false
st_help_tc.visible							= false
st_help_ch_check.visible					= false
st_help_tc_check.visible					= false
dw_efectivo.visible							= false
dw_td.visible								= false
dw_cheque.visible							= false
dw_tc.visible								= false
st_cantidad_dcto.visible					= false
em_cheques.visible						= false
st_cantidad_cuotas.visible				= false
em_cuotas_tc.visible						= false
gb_cheque.visible							= false
rb_ch_dia.visible							= false
rb_ch_30_dias.visible						= false
rb_otra_fecha_ch.visible					= false
st_16.visible									= false
em_dias_cheque.visible					= false
rb_ch_dia.checked							= true
SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:gs_nombre_usuario  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
Using		sqlca;
if isvalid(w_repacta_funeraria) then
	ll_tot_reg								= w_repacta_funeraria.dw_detalle_ci.rowcount()
	if ll_tot_reg>0 then
		ll_count 								= w_repacta_funeraria.dw_detalle_ci.Find("monto = 0 and monto_uf = 0",1, ll_tot_reg)
		if ll_count > 0 then
			messagebox("Advertencia","Debe Ingresar Correctamente Detalle de Pago")
			w_repacta_funeraria.dw_detalle_ci.setfocus()
			w_repacta_funeraria.dw_detalle_ci.scrolltorow(ll_count)
			w_repacta_funeraria.dw_detalle_ci.setcolumn('monto')
			w_repacta_funeraria.dw_detalle_ci.setfocus()
		else
			ll_new							= dw_detalle.insertrow(0)
			dw_detalle.scrolltorow(ll_new)
			if gs_rezago<>'S' then
				SELECT	"CLIENTE"."NOMBRE",   
							"CLIENTE"."A_PATERNO",   
							"CLIENTE"."A_MATERNO",
							"CLIENTE"."DV"
				INTO 		:ls_nom,   
							:ls_ap_pat,   
							:ls_ap_mat,
							:ls_dv
				FROM 	"CLIENTE"  
				WHERE 	"CLIENTE"."RUT" = :gi_rut   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nom					= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
					dw_detalle.setitem(ll_new,'nombre',ls_nom)
					dw_detalle.setitem(ll_new,'rut',gi_rut)
					dw_detalle.setitem(ll_new,'dv',ls_dv)
				end if
			end if
			ll_count = w_repacta_funeraria.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'U'",1, ll_tot_reg)
			if ll_count > 0 then
				dw_detalle.setitem(ll_new,'cuotas_a_pagar',w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_count,'cantidad'))
				dw_detalle.setitem(ll_new,'valor_cuota',w_repacta_funeraria.dw_datos_ci.getitemnumber(1,'c_valor_cuota_pesos'))
				DECLARE x2 CURSOR FOR  
				SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO"  
				FROM 	"SEGURO_ASOCIADOS"  
				WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING	sqlca;
				open x2;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						fetch x2 into :ll_cod_seguro;
						if not isnull(ll_cod_seguro) then
							ll_fila		= w_repacta_funeraria.dw_detalle_ci.Find("tipo_cob = '"+string(ll_cod_seguro)+"'",1,  w_repacta_funeraria.dw_detalle_ci.RowCount())
							if ll_fila > 0 then
								ll_monto_seg	= w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_fila,'c_total_linea')
//								ll_monto_uni	= w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_fila,'monto')
//								ll_cant			= w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
//								ll_monto_seg	= ll_monto_uni * ll_cant
								ll_suma_seg		= ll_suma_seg + ll_monto_seg
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x2;
				dw_detalle.setitem(ll_new,'otros_cobros',ll_suma_seg)
				dw_detalle.accepttext()
			else
				dw_detalle.setitem(ll_new,'cuotas_a_pagar',0)
				dw_detalle.setitem(ll_new,'valor_cuota',0)
				dw_detalle.setitem(ll_new,'otros_cobros',0)
			end if
			dw_detalle.setitem(ll_new,'base',gs_base)
			dw_detalle.setitem(ll_new,'serie',gs_serie)
			dw_detalle.setitem(ll_new,'numero',gi_numero)
			dw_detalle.setitem(ll_new,'uf_dia',gd_uf_dia)
			ll_count = w_repacta_funeraria.dw_detalle_ci.Find("tipo_cob = 'F'",1, ll_tot_reg)
			if ll_count > 0 then
				dw_detalle.setitem(ll_new,'cuotas_a_pagar_mant',w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_count,'cantidad'))
				dw_detalle.setitem(ll_new,'valor_cuota_mant',w_repacta_funeraria.dw_datos_ci.getitemnumber(1,'c_valor_cuota_mantencion_pesos'))
			else
				dw_detalle.setitem(ll_new,'cuotas_a_pagar_mant',0)
				dw_detalle.setitem(ll_new,'valor_cuota_mant',0)
			end if
			
			dw_detalle.setitem(ll_new,'forma_pago_ef',1)
			dw_detalle.setitem(ll_new,'forma_pago_ch',1)
			dw_detalle.setitem(ll_new,'forma_pago_tc',1)
			dw_detalle.setitem(ll_new,'forma_pago_td',1)
			dw_detalle.setitem(ll_new,'estado_cuota',1)
			dw_detalle.setitem(ll_new,'estado_mantencion',1)
			dw_detalle.setitem(ll_new,'estado_liberador',1)
			dw_detalle.setitem(ll_new,'reprog_mantencion',1)
			dw_detalle.setitem(ll_new,'estado_rezago',1)
			dw_detalle.setitem(ll_new,'usuario',gs_nombre_usuario)
			dw_detalle.setitem(ll_new,'total_cuota',0)
			dw_detalle.setitem(ll_new,'total_cuota_pie',0)
			dw_detalle.setitem(ll_new,'total_cuota_mantencion',0)
			dw_detalle.setitem(ll_new,'otros_pagos',0)
			dw_detalle.setitem(ll_new,'gastos_cob',0)
			dw_detalle.setitem(ll_new,'intereses',0)
			dw_detalle.setitem(ll_new,'desct_mora_cred_int',0)
			dw_detalle.setitem(ll_new,'desct_mora_mant_int',0)
			dw_detalle.setitem(ll_new,'desct_mora_cred_gc',0)
			dw_detalle.setitem(ll_new,'desct_mora_mant_gc',0)
			dw_detalle.setitem(ll_new,'descuento',0)
			dw_detalle.setitem(ll_new,'derecho_sepulta',0)
			dw_detalle.accepttext()
			dw_detalle.setitem(ll_new,'cod_parque', w_repacta_funeraria.dw_datos_ci.getitemnumber(1,'cadena_cod_parque'))
			if w_repacta_funeraria.dw_gastos_ci.getitemnumber(1,'incluir_gastos') = 1 then
				dw_detalle.setitem(ll_new,'gastos_cob', w_repacta_funeraria.dw_gastos_ci.getitemnumber(1,'gastos_cob'))
				dw_detalle.setitem(ll_new,'intereses', w_repacta_funeraria.dw_gastos_ci.getitemnumber(1,'mora'))
			end if
			dw_detalle.accepttext()
			if gs_base='L' and gi_numero>0 then dw_detalle.setitem(ll_new,'estado_liberador',0)
			if gs_base='R' and gi_numero>0 then dw_detalle.setitem(ll_new,'reprog_mantencion',0)
			if gi_numero=0 then dw_detalle.setitem(ll_new,'estado_rezago',0)
			ll_suma_monto_otros	= 0
//			ll_suma_cuota			= dw_detalle.getitemnumber(1,'total_cuota')
			if isnull(ll_suma_cuota) then ll_suma_cuota=0
			if isnull(ll_suma_descuento) then ll_suma_descuento=0
			dw_detalle.setitem(ll_new,'monto_otro',0)
			dw_detalle.setitem(ll_new,'monto_otro2',0)
			dw_detalle.setitem(ll_new,'monto_otro3',0)
			dw_detalle.setitem(ll_new,'monto_otro4',0)
			dw_detalle.setitem(ll_new,'monto_otro5',0)
			dw_detalle.setitem(ll_new,'monto_otro6',0)
			dw_detalle.setitem(ll_new,'monto_otro7',0)
			dw_detalle.setitem(ll_new,'monto_otro8',0)
			dw_detalle.setitem(ll_new,'monto_otro9',0)
			dw_detalle.setitem(ll_new,'monto_otro10',0)
			
			dw_detalle.setitem(ll_new,'monto_dscto',0)
			dw_detalle.setitem(ll_new,'monto_dscto2',0)
			dw_detalle.setitem(ll_new,'monto_dscto3',0)
			dw_detalle.setitem(ll_new,'monto_dscto4',0)
			dw_detalle.setitem(ll_new,'monto_dscto5',0)
			dw_detalle.setitem(ll_new,'monto_dscto6',0)
			dw_detalle.setitem(ll_new,'monto_dscto7',0)
			dw_detalle.setitem(ll_new,'monto_dscto8',0)
			dw_detalle.setitem(ll_new,'monto_dscto9',0)
			dw_detalle.setitem(ll_new,'monto_dscto10',0)
			dw_detalle.accepttext()
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob	= w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob')
				CHOOSE CASE ls_tipo_cob
					CASE 'A','Q'
						dw_detalle.setitem(ll_new,'estado_cuota',0)
						dw_detalle.setitem(ll_new,'total_cuota_pie',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
					CASE 'F'
						dw_detalle.setitem(ll_new,'estado_mantencion',0)
						dw_detalle.setitem(ll_new,'total_cuota_mantencion',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
					CASE 'E','U'
						dw_detalle.setitem(ll_new,'estado_cuota',0)
						ll_suma_cuota	= ll_suma_cuota + round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0)
						dw_detalle.setitem(ll_new,'total_cuota',ll_suma_cuota)
					CASE 'L'
						ll_count_l ++
						ll_suma_monto_otros	= ll_suma_monto_otros + round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0)
						if ll_count_l = 1 then
							dw_detalle.setitem(ll_new,'cod_pago_otro',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 2 then
							dw_detalle.setitem(ll_new,'cod_pago_otro2',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro2',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 3 then
							dw_detalle.setitem(ll_new,'cod_pago_otro3',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro3',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 4 then
							dw_detalle.setitem(ll_new,'cod_pago_otro4',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro4',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 5 then
							dw_detalle.setitem(ll_new,'cod_pago_otro5',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro5',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 6 then
							dw_detalle.setitem(ll_new,'cod_pago_otro6',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro6',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 7 then
							dw_detalle.setitem(ll_new,'cod_pago_otro7',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro7',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 8 then
							dw_detalle.setitem(ll_new,'cod_pago_otro8',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro8',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 9 then
							dw_detalle.setitem(ll_new,'cod_pago_otro9',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro9',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_l = 10 then
							dw_detalle.setitem(ll_new,'cod_pago_otro10',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_otro10',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						end if
					CASE 'M'
						dw_detalle.setitem(ll_new,'derecho_sepulta',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
					CASE 'S'
//						dw_detalle.setitem(ll_new,'cod_desc_otro',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
//						dw_detalle.setitem(ll_new,'descuento',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						ll_count_s ++
						if ll_count_s = 1 then
							dw_detalle.setitem(ll_new,'cod_desc_otro',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 2 then
							dw_detalle.setitem(ll_new,'cod_desc_otro2',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto2',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 3 then
							dw_detalle.setitem(ll_new,'cod_desc_otro3',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto3',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 4 then
							dw_detalle.setitem(ll_new,'cod_desc_otro4',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto4',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 5 then
							dw_detalle.setitem(ll_new,'cod_desc_otro5',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto5',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 6 then
							dw_detalle.setitem(ll_new,'cod_desc_otro6',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto6',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 7 then
							dw_detalle.setitem(ll_new,'cod_desc_otro7',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto7',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 8 then
							dw_detalle.setitem(ll_new,'cod_desc_otro8',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto8',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 9 then
							dw_detalle.setitem(ll_new,'cod_desc_otro9',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto9',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						elseif ll_count_s = 10 then
							dw_detalle.setitem(ll_new,'cod_desc_otro10',w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro'))
							dw_detalle.setitem(ll_new,'monto_dscto10',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
						end if

//						if ls_cod_otro = '102' then
//							dw_detalle.setitem(ll_new,'desct_mora_cred_int',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
//						elseif	ls_cod_otro = '118' then
//							dw_detalle.setitem(ll_new,'desct_mora_cred_gc',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
//						elseif	ls_cod_otro = '130' then
//							dw_detalle.setitem(ll_new,'desct_mora_mant_int',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
//						elseif	ls_cod_otro = '133' then
//							dw_detalle.setitem(ll_new,'desct_mora_mant_gc',round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0))
//						else
						ll_suma_descuento	= ll_suma_descuento + round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0)
						dw_detalle.setitem(ll_new,'descuento',ll_suma_descuento)
//						end if
					CASE 'K'
						dw_detalle.setitem(ll_new,'estado_cuota',0)
						ll_suma_cuota	= ll_suma_cuota + round(w_repacta_funeraria.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea'),0)
						dw_detalle.setitem(ll_new,'total_cuota',ll_suma_cuota)
				END CHOOSE
			next
			dw_detalle.setitem(ll_new,'otros_pagos',ll_suma_monto_otros)
			dw_detalle.accepttext()
			if today() <> date(gdt_fec_sistema) then
				messagebox("Advertencia","Debe Revisar Fecha del Computador NO Corresponde al día de Hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
			end if
		end if
	else
		messagebox("Advertencia","Debe Ingresar Detalle de Pago")
		cb_cerrar.triggerevent(clicked!)
	end if	
end if
end event

event mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type dw_seguro from datawindow within w_imprimir_detalle_pago_crematorio
integer x = 2880
integer y = 28
integer width = 1019
integer height = 2616
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type dw_abono from datawindow within w_imprimir_detalle_pago_crematorio
integer x = 562
integer y = 1684
integer width = 526
integer height = 80
integer taborder = 20
string title = "none"
string dataobject = "dw_suma_monto_abono_por_ctto_ctacte"
boolean border = false
boolean livescroll = true
end type

type st_help_tc_check from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1079
integer y = 344
integer width = 1029
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Recuerde ingresar Valor a pagar con TC en fila Nº 1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type st_help_tc from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1573
integer y = 2644
integer width = 1189
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Debe Ingresar Valor Total a pagar con TC en fila Nº 1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type st_help_ch from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 160
integer y = 2644
integer width = 1198
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Debe Ingresar Valor Total a pagar con CH en fila Nº 1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type st_saldo from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 2245
integer y = 1864
integer width = 530
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type st_1 from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1966
integer y = 1876
integer width = 261
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SALDO"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type dw_tc_2 from datawindow within w_imprimir_detalle_pago_crematorio
boolean visible = false
integer x = 1833
integer y = 2876
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_lista_detalle_pago_tc_2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cheque_2 from datawindow within w_imprimir_detalle_pago_crematorio
boolean visible = false
integer x = 549
integer y = 2860
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_lista_detalle_pago_cheque_2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_dias_cheque from editmask within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1271
integer y = 1868
integer width = 187
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event modified;if this.text<>'' and not isnull(this.text) then
	if long(this.text)>50 then
		messagebox("Advertencia","Excedió en Días para el Primer Pago")
		this.text	= ''
	elseif long(this.text)<=0 then
		messagebox("Advertencia","Número Día inválido")
		this.text	= ''
	else
		if dw_cheque.rowcount()>0 and long(em_cheques.text)>0 then
			em_cheques.triggerevent(modified!)
		end if
	end if
	wf_saldo_pago()
	em_cheques.setfocus()
end if
end event

type st_16 from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1088
integer y = 1884
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Días"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type rb_otra_fecha_ch from radiobutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 718
integer y = 1876
integer width = 357
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otra Fecha"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;dw_cheque.reset()
em_cheques.enabled		= true
em_dias_cheque.text		= ''
em_cheques.text			= ''
em_dias_cheque.visible	= true
em_dias_cheque.enabled	= true
wf_saldo_pago()
em_dias_cheque.setfocus()

end event

type rb_ch_30_dias from radiobutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 352
integer y = 1876
integer width = 306
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "a 30 días"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;dw_cheque.reset()
em_cheques.text			= ''
em_dias_cheque.enabled	= false
em_cheques.text			= ''
wf_saldo_pago()
em_cheques.setfocus()

end event

type rb_ch_dia from radiobutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 69
integer y = 1876
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al día"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;dw_cheque.reset()
em_dias_cheque.text		= ''
em_cheques.text			= ''
em_dias_cheque.enabled	= false
wf_saldo_pago()
em_cheques.setfocus()

end event

type cb_limpiar from commandbutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1216
integer y = 2668
integer width = 270
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;cbx_ef.checked=false
cbx_ch.checked=false
cbx_tc.checked=false
cbx_td.checked=false
cbx_ef.triggerevent(clicked!)
cbx_ch.triggerevent(clicked!)
cbx_tc.triggerevent(clicked!)
cbx_td.triggerevent(clicked!)
end event

type cbx_td from checkbox within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 2254
integer y = 284
integer width = 421
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tarjeta Debito"
end type

event ue_mousemove;st_help_ch_check.visible	= false
st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_tc_check.visible	= false
end event

event clicked;Long		ll_new
Double	ll_suma=0,ll_td

dw_td.reset()
if this.checked=true then
	if dw_cheque.rowcount()>0 then
		ll_suma			= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
	end if
	if dw_efectivo.rowcount()>0 then
		ll_suma			= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
	end if
	if dw_tc.rowcount()>0 then
		ll_suma			= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
	end if
	ll_td					= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
	dw_td.visible	= true
	ll_new			= dw_td.insertrow(0)
	dw_td.setitem(1,'monto',ll_td)
	dw_td.setitem(1,'fecha_venc',idt_fecha_hoy)
	dw_detalle.setitem(1,'forma_pago_td',0)
	dw_td.setfocus()
	if ll_td<=0 then 
		messagebox("Advertencia","No es posible Ingresar Pago Tarjeta Débito, Monto a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
	//	messagebox("Advertencia","No es posible Ingresar Pago Tarjeta Débito, Monto a Cancelar es US$ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
		dw_detalle.setitem(1,'forma_pago_td',1)
	end if
	wf_saldo_pago()
else
	dw_td.visible		= false
	dw_detalle.setitem(1,'forma_pago_td',1)
end if
dw_detalle.accepttext()
end event

type cbx_tc from checkbox within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1504
integer y = 284
integer width = 448
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tarjeta Crédito"
end type

event ue_mousemove;st_help_tc_check.visible	= true
st_help_ch_check.visible	= false
st_help_ch.visible			= false
st_help_tc.visible			= false
end event

event clicked;Long		ll_new
Double	ll_tc,ll_suma=0

dw_tc.reset()
if this.checked=true then
	if dw_efectivo.rowcount()>0 then
		ll_suma							= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
	end if
	if dw_td.rowcount()>0 then
		ll_suma							= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
	end if
	if dw_cheque.rowcount()>0 then
		ll_suma							= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
	end if
	ll_tc									= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
	em_cuotas_tc.text				= ''
	dw_tc.enabled					= false
	dw_tc.visible					= true
	st_cantidad_cuotas.visible	= true
	em_cuotas_tc.visible			= true
	dw_detalle.setitem(1,'forma_pago_tc',0)
	ll_new							= dw_tc.insertrow(0)
	em_cuotas_tc.setfocus()
	if ll_tc<=0 then
		messagebox("Advertencia","No es posible Ingresar Pago Tarjeta Crédito, Monto a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
//		messagebox("Advertencia","No es posible Ingresar Pago Tarjeta Crédito, Monto a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
		dw_detalle.setitem(1,'forma_pago_tc',1)
	end if
else
	dw_tc.visible						= false
	st_cantidad_cuotas.visible		= false
	em_cuotas_tc.visible				= false
	dw_detalle.setitem(1,'forma_pago_tc',1)
end if
dw_detalle.accepttext()
end event

type cbx_ch from checkbox within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1033
integer y = 284
integer width = 398
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cheque"
end type

event ue_mousemove;st_help_ch_check.visible	= true
st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_tc_check.visible	= false
end event

event clicked;Long		ll_new
Double	ll_cheque,ll_suma=0

dw_cheque.reset()
if this.checked=true then
	if dw_efectivo.rowcount()>0 then
		ll_suma						= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
	end if
	if dw_td.rowcount()>0 then
		ll_suma						= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
	end if
	if dw_tc.rowcount()>0 then
		ll_suma						= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
	end if
	ll_cheque						= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
	em_cheques.text				= ''
	dw_cheque.visible				= true
	st_cantidad_dcto.visible	= true
	em_cheques.visible			= true
	gb_cheque.visible				= true
	rb_ch_dia.visible				= true
	rb_ch_30_dias.visible		= true
	rb_otra_fecha_ch.visible	= true
	st_16.visible					= true
	em_dias_cheque.visible		= true
	dw_cheque.enabled				= false
	dw_detalle.setitem(1,'forma_pago_ch',0)
	ll_new							= dw_cheque.insertrow(0)
	em_cheques.setfocus()
	if ll_cheque<=0 then
		messagebox("Advertencia","No es posible Ingresar Pago Cheque, Monto a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
//		messagebox("Advertencia","No es posible Ingresar Pago Cheque, Monto a Cancelar es US$ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,###"))
		dw_detalle.setitem(1,'forma_pago_ch',1)
	end if
else
	dw_cheque.visible				= false
	st_cantidad_dcto.visible	= false
	em_cheques.visible			= false
	gb_cheque.visible				= false
	rb_ch_dia.visible				= false
	rb_ch_30_dias.visible		= false
	rb_otra_fecha_ch.visible	= false
	st_16.visible					= false
	em_dias_cheque.visible		= false
	dw_detalle.setitem(1,'forma_pago_ch',1)
end if
dw_detalle.accepttext()
end event

type cbx_ef from checkbox within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 503
integer y = 284
integer width = 402
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Efectivo"
end type

event ue_mousemove;st_help_ch_check.visible	= false
st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_tc_check.visible	= false
end event

event clicked;Long		ll_new
Double	ll_suma=0,ll_efectivo
dw_efectivo.reset()
if this.checked=true then
	if dw_cheque.rowcount()>0 then
		ll_suma				= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
	end if
	if dw_td.rowcount()>0 then
		ll_suma				= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
	end if
	if dw_tc.rowcount()>0 then
		ll_suma				= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
	end if
	ll_efectivo				= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
	dw_efectivo.visible	= true
	dw_detalle.setitem(1,'forma_pago_ef',0)
	ll_new					= dw_efectivo.insertrow(0)
	dw_efectivo.setitem(1,'monto',ll_efectivo)
	dw_efectivo.setfocus()
	if ll_efectivo<=0 then 
		messagebox("Advertencia","No es posible Ingresar Pago Efectivo, Monto a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,##0.0###"))
	//	messagebox("Advertencia","No es posible Ingresar Pago Efectivo, Monto a Cancelar es US$ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,###,##0.0###"))
		dw_detalle.setitem(1,'forma_pago_ef',1)
	end if
	wf_saldo_pago()
else
	dw_efectivo.visible	= false
	dw_detalle.setitem(1,'forma_pago_ef',1)
end if
dw_detalle.accepttext()
end event

type em_cuotas_tc from editmask within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 2446
integer y = 1992
integer width = 242
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= true
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event modified;Long		ll_cant,ll_indi,ll_new,ll_day,ll_month,ll_year,ll_suma
Date		ld_fecha_vcto
String	ls_fecha

dw_tc.reset()
if long(this.text)>0 then
	if dw_efectivo.rowcount()>0 then
		ll_suma							= ll_suma + dw_efectivo.getitemnumber(1,'monto')
	end if
	if dw_td.rowcount()>0 then
		ll_suma							= ll_suma + dw_td.getitemnumber(1,'monto')
	end if
	if dw_cheque.rowcount()>0 then
		ll_suma							= ll_suma + dw_cheque.getitemnumber(1,'monto_total')
	end if
	if ll_suma >= dw_detalle.getitemnumber(1,'total_2') then
		messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
		em_cuotas_tc.text				= ''
	else
		ll_cant							= long(em_cuotas_tc.text)
		ld_fecha_vcto					= idt_fecha_hoy
		if ll_cant<=0 or ll_cant>36 then
			messagebox("Advertencia","Error Cantidad de Cuotas, debe estar Entre 1 a 36")
			em_cuotas_tc.setfocus()
		else
			dw_tc.enabled				= true
			for ll_indi=1 to ll_cant
				ll_new					= dw_tc.insertrow(0)
				dw_tc.setitem(ll_indi,'item',ll_indi)
				dw_tc.setitem(ll_indi,'fecha_venc',ld_fecha_vcto)
				ll_day					= day(idt_fecha_hoy)
				ll_month					= month(ld_fecha_vcto)
				ll_year					= year(ld_fecha_vcto)
				if (ll_month=1  and ll_day>=28)  then ll_day=28
				if (ll_month=2  and ll_day>=31)  then ll_day=31
				if (ll_month=3  and ll_day>=30)  then ll_day=30
				if (ll_month=4  and ll_day>=31)  then ll_day=31
				if (ll_month=5  and ll_day>=30)  then ll_day=30
				if (ll_month=6  and ll_day>=31)  then ll_day=31
				if (ll_month=7  and ll_day>=31)  then ll_day=31
				if (ll_month=8  and ll_day>=30)  then ll_day=30
				if (ll_month=9  and ll_day>=31)  then ll_day=31
				if (ll_month=10 and ll_day>=30)  then ll_day=30
				if (ll_month=11 and ll_day>=31)  then ll_day=31
				if (ll_month=12 and ll_day>=31)  then ll_day=31
				ll_month	++
				if ll_month>12 then
					ll_year ++
					ll_month				= 1
				end if
				ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
				ld_fecha_vcto			= date(ls_fecha)
			next
			dw_tc.accepttext()
			dw_tc.setfocus()
			dw_tc.scrolltorow(1)
			dw_tc.setcolumn('banco')
		end if
	end if
	wf_saldo_pago()
end if
end event

type st_cantidad_cuotas from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 2057
integer y = 2004
integer width = 384
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad Cuotas:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= true
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type dw_efectivo from datawindow within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_dwnmousemove
integer x = 27
integer y = 1640
integer width = 517
integer height = 172
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_detalle_pago_ef"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event itemchanged;String	ls_columna
Long		ll_new,ll_efectivo,ll_suma

dw_efectivo.accepttext()
ls_columna			= dw_efectivo.GetColumnName ( )

CHOOSE CASE ls_columna
	CASE 'monto'
		if dw_efectivo.getitemnumber(1,'monto') > dw_detalle.getitemnumber(1,'total_2') then
			messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
			dw_efectivo.reset()
			ll_new	= dw_efectivo.insertrow(0)
			dw_efectivo.setfocus()
		else
			if dw_cheque.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
			end if
			if dw_td.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
			end if
			if dw_tc.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
			end if
			ll_efectivo					= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
			if ll_efectivo<=0 then 
				messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
				dw_efectivo.reset()
				ll_new	= dw_efectivo.insertrow(0)
				dw_efectivo.setfocus()
			end if
		end if
		wf_saldo_pago()
END CHOOSE
end event

type dw_td from datawindow within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_dwnmousemove
integer x = 1134
integer y = 1644
integer width = 1673
integer height = 180
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_detalle_pago_td"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event itemchanged;String	ls_columna
Long		ll_new,ll_td,ll_suma

dw_td.accepttext()
ls_columna			= dw_td.GetColumnName ( )

CHOOSE CASE ls_columna
	CASE 'monto'
		if dw_td.getitemnumber(1,'monto') > dw_detalle.getitemnumber(1,'total_2') then
			messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
			dw_td.reset()
			ll_new	= dw_td.insertrow(0)
			dw_td.setfocus()
		else
			if dw_cheque.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
			end if
			if dw_efectivo.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
			end if
			if dw_tc.rowcount()>0 then
				ll_suma					= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
			end if
			ll_td					= round((dw_detalle.getitemnumber(1,'total_2') - ll_suma),0)
			if ll_td<=0 then 
				messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
				dw_td.reset()
				ll_new	= dw_td.insertrow(0)
				dw_td.setfocus()
			end if
		end if
		wf_saldo_pago()
END CHOOSE
end event

type dw_tc from datawindow within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1563
integer y = 1988
integer width = 1211
integer height = 648
integer taborder = 90
string title = "none"
string dataobject = "dw_lista_detalle_pago_tc"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= true
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event itemchanged;string	ls_columna,ls_fecha
Long		ll_indi,ll_cant,ll_day,ll_month,ll_year,ll_banco,&
			ll_tot_reg,ll_new
Double	ll_monto_ch,ll_monto_ef,ll_monto_tc,ll_monto_td,ll_total_pagar,ll_suma=0,ll_monto,ll_monto_cuota,&
			ll_suma_monto,ll_resto
Date		ld_fecha_vcto,ldt_fecha_vcto
dw_tc.accepttext()
ls_columna		= dw_tc.GetColumnName ( )
CHOOSE CASE ls_columna
	CASE 'monto'
		ll_total_pagar	= round(dw_detalle.getitemnumber(1,'total_2'),0)
		ll_monto_ch		= dw_tc.getitemnumber(this.getrow(),'monto')
		if dw_efectivo.rowcount()>0 then
			ll_suma		= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
		end if
		if ll_monto_ch > ll_total_pagar then
		//	messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar US$ "+string(ll_total_pagar,"###,###,###,##0.0###"))
			messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(ll_total_pagar,"###,###,###,##0"))
			wf_cargar_tc()
		else
			if dw_td.rowcount()>0 then
				ll_suma	= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
			end if
			if dw_cheque.rowcount()>0 then
				ll_suma	= ll_suma + round(dw_cheque.getitemnumber(1,'monto_total'),0)
			end if
			ll_suma		= ll_suma + ll_monto_ch
			if ll_suma > ll_total_pagar then
		//		messagebox("Advertencia","Error Ingreso Monto, la Suma de la Forma de Pago No debe ser Mayor al Total a Cancelar US$ "+string(ll_total_pagar,"###,###,###,##0.0###"))
				messagebox("Advertencia","Error Ingreso Monto, la Suma de la Forma de Pago No debe ser Mayor al Total a Cancelar $ "+string(ll_total_pagar,"###,###,###,##0"))
				wf_cargar_tc()
			else
				if this.getrow() = 1 and il_pasa_tc=0 then
					ll_suma_monto		= 0
					il_pasa_tc ++
					if cbx_ef.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_efectivo.getitemnumber(1,'monto'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					if cbx_ch.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_cheque.getitemnumber(1,'monto_total'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					if cbx_td.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_td.getitemnumber(1,'monto'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					ll_cant			= dw_tc.rowcount()
					setnull(ll_monto);setnull(ll_monto_cuota)
					ll_monto			= dw_tc.getitemnumber(this.getrow(),'monto')
					if (ll_suma_monto + ll_monto) > dw_detalle.getitemnumber(1,'total_2') then
		//				messagebox("Advertencia","Recuerde Monto Total a Pagar en Cheque No debe exceder de US$ " +string((dw_detalle.getitemnumber(1,'total_2') - (ll_suma_monto + ll_monto)),"###,###,###,###,###,##0.0###")+' US$')
						messagebox("Advertencia","Recuerde Monto Total a Pagar en Cheque No debe exceder de $ " +string((round(dw_detalle.getitemnumber(1,'total_2'),0) - (ll_suma_monto + ll_monto)),"###,###,###,###,###,##0.0###")+' US$')
						wf_cargar_tc()
					else
						dw_tc_2.reset()
						ll_tot_reg			= dw_tc.rowcount()
						ll_monto_cuota		= round(ll_monto / long(em_cuotas_tc.text),0)
						for ll_indi=1 to ll_tot_reg
							ll_banco			= dw_tc.getitemnumber(ll_indi,'banco')
							ldt_fecha_vcto	= date(dw_tc.getitemdatetime(ll_indi,'fecha_venc'))
							ll_new			= dw_tc_2.insertrow(0)
							dw_tc_2.setitem(ll_new,'banco',ll_banco)
							dw_tc_2.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
						next
						dw_tc.reset()
						ll_tot_reg			= dw_tc_2.rowcount()
						for ll_indi=1 to ll_tot_reg
							ll_banco			= dw_tc_2.getitemnumber(ll_indi,'banco')
							ldt_fecha_vcto	= date(dw_tc_2.getitemdatetime(ll_indi,'fecha_venc'))
							ll_new			= dw_tc.insertrow(0)
							dw_tc.setitem(ll_new,'banco', ll_banco)
							dw_tc.setitem(ll_new,'fecha_venc', ldt_fecha_vcto)
							dw_tc.setitem(ll_new,'monto', ll_monto_cuota )
						next
						if (ll_monto_cuota * long(em_cuotas_tc.text)) <> ll_monto then
							ll_resto			= ll_monto - ((ll_monto_cuota * long(em_cuotas_tc.text)))
							dw_tc.setitem(ll_tot_reg,'monto', ll_monto_cuota + ll_resto )
						end if
						dw_tc.accepttext()
					end if
				end if
			end if
		end if
		wf_saldo_pago()
		
	CASE 'banco'
		if row=1 then
			ll_cant					= dw_tc.rowcount()
			ll_banco					= dw_tc.getitemnumber(1,'banco')
			if ll_cant>1 then
				for ll_indi=1 to ll_cant
					dw_tc.setitem(ll_indi,'banco',ll_banco)
				next
				this.accepttext()
			end if
		end if
	
	CASE 'fecha_venc'
		if dw_tc.getrow() = 1 then
			ll_cant					= dw_tc.rowcount()
			if ll_cant>1 then
				ld_fecha_vcto		= date(dw_tc.getitemdatetime(1,'fecha_venc'))
				for ll_indi=1 to ll_cant
					dw_tc.setitem(ll_indi,'item',ll_indi)
					dw_tc.setitem(ll_indi,'fecha_venc',ld_fecha_vcto)
					ll_day					= day(ld_fecha_vcto)
					ll_month					= month(ld_fecha_vcto)
					ll_year					= year(ld_fecha_vcto)
					if (ll_month=1  and ll_day>=28)  then ll_day=28
					if (ll_month=2  and ll_day>=31)  then ll_day=31
					if (ll_month=3  and ll_day>=30)  then ll_day=30
					if (ll_month=4  and ll_day>=31)  then ll_day=31
					if (ll_month=5  and ll_day>=30)  then ll_day=30
					if (ll_month=6  and ll_day>=31)  then ll_day=31
					if (ll_month=7  and ll_day>=31)  then ll_day=31
					if (ll_month=8  and ll_day>=30)  then ll_day=30
					if (ll_month=9  and ll_day>=31)  then ll_day=31
					if (ll_month=10 and ll_day>=30)  then ll_day=30
					if (ll_month=11 and ll_day>=31)  then ll_day=31
					if (ll_month=12 and ll_day>=31)  then ll_day=31
					ll_month	++
					if ll_month>12 then
						ll_year ++
						ll_month				= 1
					end if
					ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
					ld_fecha_vcto			= date(ls_fecha)
				next
				dw_tc.accepttext()
			end if
		end if
END CHOOSE

end event

type em_cheques from editmask within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 1161
integer y = 1992
integer width = 242
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
end type

event ue_mousemove;st_help_ch.visible	= true
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event modified;Long		ll_cant,ll_indi,ll_new,ll_day,ll_month,ll_year,ll_suma
Date		ld_fecha_vcto
String	ls_fecha

dw_cheque.reset()
if long(this.text)>0 then
	if dw_efectivo.rowcount()>0 then
		ll_suma						= ll_suma + dw_efectivo.getitemnumber(1,'monto')
	end if
	if dw_td.rowcount()>0 then
		ll_suma						= ll_suma + dw_td.getitemnumber(1,'monto')
	end if
	if dw_tc.rowcount()>0 then
		ll_suma						= ll_suma + dw_tc.getitemnumber(1,'monto_total')
	end if
	if ll_suma>=dw_detalle.getitemnumber(1,'total_2') then
		messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(dw_detalle.getitemnumber(1,'total_2'),"###,###,###,##0"))
		em_cheques.text			= ''
	else
		if rb_otra_fecha_ch.checked=true and (long(em_dias_cheque.text)=0 or isnull(em_dias_cheque.text) or em_dias_cheque.text='') then
			messagebox("Advertencia","Debe Ingresar Cantidad de Días Vencimiento Primer Cheque")
			em_dias_cheque.setfocus()
		else
			ll_cant						= long(em_cheques.text)
			if ll_cant<=0 or ll_cant>30 then
				messagebox("Advertencia","Error Cantidad de Cheques, debe ser entre 1 a 30 Cheque(s)")
				dw_cheque.enabled		= false
				em_cheques.setfocus()
			else
				dw_cheque.enabled		= true
				if rb_ch_dia.checked=true then
					ld_fecha_vcto		= idt_fecha_hoy
				elseif rb_ch_30_dias.checked=true then
					ld_fecha_vcto		= RelativeDate(idt_fecha_hoy, 30)
				elseif rb_otra_fecha_ch.checked=true then
					ld_fecha_vcto		= RelativeDate(idt_fecha_hoy, long(em_dias_cheque.text))
				end if
				for ll_indi=1 to ll_cant
					ll_new			= dw_cheque.insertrow(0)
					dw_cheque.setitem(ll_indi,'item',ll_indi)
					dw_cheque.setitem(ll_indi,'fecha_venc',ld_fecha_vcto)
					ll_day					= day(idt_fecha_hoy)
					ll_month					= month(ld_fecha_vcto)
					ll_year					= year(ld_fecha_vcto)
					if (ll_month=1  and ll_day>=28)  then ll_day=28
					if (ll_month=2  and ll_day>=31)  then ll_day=31
					if (ll_month=3  and ll_day>=30)  then ll_day=30
					if (ll_month=4  and ll_day>=31)  then ll_day=31
					if (ll_month=5  and ll_day>=30)  then ll_day=30
					if (ll_month=6  and ll_day>=31)  then ll_day=31
					if (ll_month=7  and ll_day>=31)  then ll_day=31
					if (ll_month=8  and ll_day>=30)  then ll_day=30
					if (ll_month=9  and ll_day>=31)  then ll_day=31
					if (ll_month=10 and ll_day>=30)  then ll_day=30
					if (ll_month=11 and ll_day>=31)  then ll_day=31
					if (ll_month=12 and ll_day>=31)  then ll_day=31
					ll_month	++
					if ll_month>12 then
						ll_year ++
						ll_month				= 1
					end if
					ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
					ld_fecha_vcto			= date(ls_fecha)
				next
				dw_cheque.accepttext()
				dw_cheque.setfocus()
				dw_cheque.setcolumn('banco')
			end if
		end if
	end if
	wf_saldo_pago()
end if
end event

type st_cantidad_dcto from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 695
integer y = 2004
integer width = 462
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad Cheque:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible	= true
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type dw_cheque from datawindow within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 1988
integer width = 1454
integer height = 648
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_detalle_pago_cheque"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help_ch.visible	= true
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event itemchanged;string	ls_columna,ls_fecha
Long		ll_indi,ll_cant,ll_day,ll_month,ll_year,ll_banco,ll_serie,&
			ll_tot_reg,ll_new
Date		ld_fecha_vcto,ldt_fecha_vcto
Double	ll_monto_ch,ll_monto_ef,ll_monto_tc,ll_monto_td,ll_total_pagar,ll_suma=0,&
			ll_monto,ll_monto_cuota,ll_suma_monto,ll_resto

dw_cheque.accepttext()
ls_columna		= dw_cheque.GetColumnName ( )
CHOOSE CASE ls_columna
	CASE 'monto'
		ll_total_pagar	= round(dw_detalle.getitemnumber(1,'total_2'),0)
		ll_monto_ch		= round(dw_cheque.getitemnumber(this.getrow(),'monto'),0)
		if dw_efectivo.rowcount()>0 then
			ll_suma		= ll_suma + round(dw_efectivo.getitemnumber(1,'monto'),0)
		end if
		if ll_monto_ch > ll_total_pagar then
			//messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar US$ "+string(ll_total_pagar,"###,###,###,##0.0###"))
			messagebox("Advertencia","Error Ingreso Monto, no debe ser Mayor al Total a Cancelar $ "+string(ll_total_pagar,"###,###,###,##0"))
			wf_cargar_cheque()
//			dw_cheque.setitem(1,'monto',0)
		else
			if dw_td.rowcount()>0 then
				ll_suma	= ll_suma + round(dw_td.getitemnumber(1,'monto'),0)
			end if
			if dw_tc.rowcount()>0 then
				ll_suma	= ll_suma + round(dw_tc.getitemnumber(1,'monto_total'),0)
			end if
			ll_suma		= ll_suma + ll_monto_ch
			if ll_suma > ll_total_pagar then
				//messagebox("Advertencia","Error Ingreso Monto, la Suma de la Forma de Pago No debe ser Mayor al Total a Cancelar US$ "+string(ll_total_pagar,"###,###,###,##0.0###"))
				messagebox("Advertencia","Error Ingreso Monto, la Suma de la Forma de Pago No debe ser Mayor al Total a Cancelar $ "+string(ll_total_pagar,"###,###,###,##0"))
				wf_cargar_cheque()
				dw_cheque.setfocus()
				dw_cheque.scrolltorow(row)
				dw_cheque.setcolumn('monto')
			else
				if this.getrow() = 1 and il_pasa_ch=0 then
					ll_suma_monto		= 0
					il_pasa_ch ++
					if cbx_ef.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_efectivo.getitemnumber(1,'monto'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					if cbx_tc.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_tc.getitemnumber(1,'monto_total'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					if cbx_td.checked=true then
						ll_suma_monto	= ll_suma_monto + round(dw_td.getitemnumber(1,'monto'),0)
						if isnull(ll_suma_monto) then ll_suma_monto=0
					end if
					ll_cant			= dw_cheque.rowcount()
					setnull(ll_monto);setnull(ll_monto_cuota)
					ll_monto			= dw_cheque.getitemnumber(this.getrow(),'monto')
					if (ll_suma_monto + ll_monto) > dw_detalle.getitemnumber(1,'total_2') then
//						messagebox("Advertencia","Recuerde Monto Total a Pagar en Cheque No debe exceder de US$ " +string((dw_detalle.getitemnumber(1,'total_2') - (ll_suma_monto + ll_monto)),"###,###,###,###,###,##0.0###")+' US$')
						messagebox("Advertencia","Recuerde Monto Total a Pagar en Cheque No debe exceder de $ " +string((round(dw_detalle.getitemnumber(1,'total_2'),0) - (ll_suma_monto + ll_monto)),"###,###,###,###,###,##0")+' US$')
						wf_cargar_cheque()
					else
						dw_cheque_2.reset()
						ll_tot_reg			= dw_cheque.rowcount()
						ll_monto_cuota		= round(ll_monto / long(em_cheques.text),0)
						for ll_indi=1 to ll_tot_reg
							ll_banco			= dw_cheque.getitemnumber(ll_indi,'banco')
							ll_serie			= dw_cheque.getitemnumber(ll_indi,'serie')
							ldt_fecha_vcto	= date(dw_cheque.getitemdatetime(ll_indi,'fecha_venc'))
							ll_new			= dw_cheque_2.insertrow(0)
							dw_cheque_2.setitem(ll_new,'banco',ll_banco)
							dw_cheque_2.setitem(ll_new,'serie',ll_serie)
							dw_cheque_2.setitem(ll_new,'fecha_venc',ldt_fecha_vcto)
						next
						dw_cheque.reset()
						ll_tot_reg			= dw_cheque_2.rowcount()
						for ll_indi=1 to ll_tot_reg
							ll_banco			= dw_cheque_2.getitemnumber(ll_indi,'banco')
							ll_serie			= dw_cheque_2.getitemnumber(ll_indi,'serie')
							ldt_fecha_vcto	= date(dw_cheque_2.getitemdatetime(ll_indi,'fecha_venc'))
							ll_new			= dw_cheque.insertrow(0)
							dw_cheque.setitem(ll_new,'banco', ll_banco)
							dw_cheque.setitem(ll_new,'serie', ll_serie)
							dw_cheque.setitem(ll_new,'fecha_venc', ldt_fecha_vcto)
							dw_cheque.setitem(ll_new,'monto', ll_monto_cuota )
						next
						if (ll_monto_cuota * long(em_cheques.text)) <> ll_monto then
							ll_resto			= ll_monto - ((ll_monto_cuota * long(em_cheques.text)))
							dw_cheque.setitem(ll_tot_reg,'monto', ll_monto_cuota + ll_resto )
						end if
						dw_cheque.accepttext()
					end if
				end if
			end if
		end if
		wf_saldo_pago()
		
	CASE 'banco'
		if row=1 then
			ll_cant					= dw_cheque.rowcount()
			ll_banco					= dw_cheque.getitemnumber(1,'banco')
			if ll_cant>1 then
				for ll_indi=1 to ll_cant
					dw_cheque.setitem(ll_indi,'banco',ll_banco)
				next
				this.accepttext()
			end if
		end if
	
	CASE 'serie'
		if row=1 then
			ll_cant					= dw_cheque.rowcount()
			ll_serie					= dw_cheque.getitemnumber(1,'serie')
			if ll_cant>1 then
				for ll_indi=1 to ll_cant
					dw_cheque.setitem(ll_indi,'serie',ll_serie)
					ll_serie ++
				next
				this.accepttext()
			end if
		end if
		
	CASE 'fecha_venc'
		if dw_cheque.getrow() = 1 then
			ll_cant					= dw_cheque.rowcount()
			if ll_cant>1 then
				ld_fecha_vcto		= date(dw_cheque.getitemdatetime(1,'fecha_venc'))
				for ll_indi=1 to ll_cant
					dw_cheque.setitem(ll_indi,'item',ll_indi)
					dw_cheque.setitem(ll_indi,'fecha_venc',ld_fecha_vcto)
					ll_day					= day(ld_fecha_vcto)
					ll_month					= month(ld_fecha_vcto)
					ll_year					= year(ld_fecha_vcto)
					if (ll_month=1  and ll_day>=28)  then ll_day=28
					if (ll_month=2  and ll_day>=31)  then ll_day=31
					if (ll_month=3  and ll_day>=30)  then ll_day=30
					if (ll_month=4  and ll_day>=31)  then ll_day=31
					if (ll_month=5  and ll_day>=30)  then ll_day=30
					if (ll_month=6  and ll_day>=31)  then ll_day=31
					if (ll_month=7  and ll_day>=31)  then ll_day=31
					if (ll_month=8  and ll_day>=30)  then ll_day=30
					if (ll_month=9  and ll_day>=31)  then ll_day=31
					if (ll_month=10 and ll_day>=30)  then ll_day=30
					if (ll_month=11 and ll_day>=31)  then ll_day=31
					if (ll_month=12 and ll_day>=31)  then ll_day=31
					ll_month	++
					if ll_month>12 then
						ll_year ++
						ll_month				= 1
					end if
					ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
					ld_fecha_vcto			= date(ls_fecha)
				next
				dw_cheque.accepttext()
			end if
		end if
END CHOOSE

end event

type cb_cerrar from commandbutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 3589
integer y = 2668
integer width = 311
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;close(w_imprimir_detalle_pago_crematorio)
end event

type cb_imprimir from commandbutton within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 2668
integer width = 270
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event clicked;Long		ll_error=0,ll_tot_reg,ll_indi,ll_banco,ll_serie,ll_item,ll_nro_cheques
Date		ldt_fecha_vcto
String	ls_descrip
Double	ll_total_a_pagar,ll_suma,ll_monto

if dw_detalle.rowcount()>0 then 
	if cbx_ef.checked=false and cbx_ch.checked=false and cbx_tc.checked=false and cbx_td.checked=false then
		messagebox("Advertencia","Debe Seleccionar FORMA DE PAGO")
	else
	//	ll_total_a_pagar	= dw_detalle.getitemnumber(1,'total_2')
		ll_total_a_pagar	= round(dw_detalle.getitemnumber(1,'total_2'),0)
		if cbx_ef.checked=true then
			ll_suma	= ll_suma + dw_efectivo.getitemnumber(1,'monto')
		end if
		if cbx_td.checked=true then
			ll_suma	= ll_suma + dw_td.getitemnumber(1,'monto')
		end if
		if cbx_ch.checked=true then
			ll_suma	= ll_suma + dw_cheque.getitemnumber(1,'monto_total')
		end if
		if cbx_tc.checked=true then
			ll_suma	= ll_suma + dw_tc.getitemnumber(1,'monto_total')
		end if
		if ll_suma = ll_total_a_pagar then
			if cbx_ef.checked=true and ll_error=0 then
				ll_monto	= dw_efectivo.getitemnumber(1,'monto')
				if ll_monto=0 or isnull(ll_monto) then
					messagebox("Advertencia Pago Efectivo","Debe Ingresar Monto en Detalle Efectivo")
					ll_error ++
					dw_efectivo.setfocus()
				end if
			end if
			if cbx_ch.checked=true and ll_error=0 then
				ll_tot_reg			= dw_cheque.rowcount()
				for ll_indi=1 to ll_tot_reg
					ll_banco			= dw_cheque.getitemnumber(ll_indi,'banco')
					ll_serie			= dw_cheque.getitemnumber(ll_indi,'serie')
					ldt_fecha_vcto	= date(dw_cheque.getitemdatetime(ll_indi,'fecha_venc'))
					ll_monto			= dw_cheque.getitemnumber(ll_indi,'monto')
					if ll_banco=0 or isnull(ll_banco) then
						messagebox("Advertencia Pago Cheque","Debe Ingresar Banco en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_cheque.setfocus()
						dw_cheque.scrolltorow(ll_indi)
						dw_cheque.setcolumn('banco')
					elseif ll_serie=0 or isnull(ll_serie) then
						messagebox("Advertencia Pago Cheque","Debe Ingresar Serie Cheque en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_cheque.setfocus()
						dw_cheque.scrolltorow(ll_indi)
						dw_cheque.setcolumn('serie')
					elseif isnull(ldt_fecha_vcto) then
						messagebox("Advertencia Pago Cheque","Debe Ingresar Fecha Vencimiento en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_cheque.setfocus()
						dw_cheque.scrolltorow(ll_indi)
						dw_cheque.setcolumn('fecha_venc')
					elseif ll_monto=0 or isnull(ll_monto) then
						messagebox("Advertencia Pago Cheque","Debe Ingresar Monto Cheque en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_cheque.setfocus()
						dw_cheque.scrolltorow(ll_indi)
						dw_cheque.setcolumn('monto')
					end if
				next
			end if
			if cbx_tc.checked=true and ll_error=0 then
				ll_tot_reg			= dw_tc.rowcount()
				for ll_indi=1 to ll_tot_reg
					ll_banco			= dw_tc.getitemnumber(ll_indi,'banco')
					ldt_fecha_vcto	= date(dw_tc.getitemdatetime(ll_indi,'fecha_venc'))
					ll_monto			= dw_tc.getitemnumber(ll_indi,'monto')
					if ll_banco=0 or isnull(ll_banco) then
						messagebox("Advertencia Pago Tarjeta Crédito","Debe Ingresar Banco en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_tc.setfocus()
						dw_tc.scrolltorow(ll_indi)
						dw_tc.setcolumn('banco')
					elseif isnull(ldt_fecha_vcto) then
						messagebox("Advertencia Pago Tarjeta Crédito","Debe Ingresar Fecha Vencimiento en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_tc.setfocus()
						dw_tc.scrolltorow(ll_indi)
						dw_tc.setcolumn('fecha_venc')
					elseif ll_monto=0 or isnull(ll_monto) then
						messagebox("Advertencia Pago Tarjeta Crédito","Debe Ingresar Monto Cuota en Item Nº "+string(ll_indi))
						exit
						ll_error ++
						dw_tc.setfocus()
						dw_tc.scrolltorow(ll_indi)
						dw_tc.setcolumn('monto')
					end if
				next
			end if
			if cbx_td.checked=true and ll_error=0 then
				ll_banco			= dw_td.getitemnumber(1,'banco')
				ldt_fecha_vcto	= date(dw_td.getitemdatetime(1,'fecha_venc'))
				ll_monto			= dw_td.getitemnumber(1,'monto')
				if ll_banco=0 or isnull(ll_banco) then
					messagebox("Advertencia Pago Tarjeta Débito","Debe Ingresar Banco")
					ll_error ++
					dw_td.setfocus()
					dw_td.scrolltorow(ll_indi)
					dw_td.setcolumn('banco')
				elseif ll_monto=0 or isnull(ll_monto) then
					messagebox("Advertencia Pago Tarjeta Débito","Debe Ingresar Monto")
					ll_error ++
					dw_td.setfocus()
					dw_td.scrolltorow(ll_indi)
					dw_td.setcolumn('monto')
				elseif isnull(ldt_fecha_vcto) then
					messagebox("Advertencia Pago Tarjeta Débito","Debe Ingresar Fecha Vencimiento")
					ll_error ++
					dw_td.setfocus()
					dw_td.scrolltorow(ll_indi)
					dw_td.setcolumn('fecha_venc')
				end if
			end if
			if ll_error = 0 then 
//				Limpiar objetos
				dw_detalle.object.t_99.visible					= false
				dw_detalle.object.t_229.visible					= false
				dw_detalle.object.t_230.visible					= false
				dw_detalle.object.t_monto_ef.visible			= false
				dw_detalle.object.t_219.visible					= false
				dw_detalle.object.t_banco_3.visible			= false
				dw_detalle.object.t_214.visible					= false
				dw_detalle.object.t_213.visible					= false
				dw_detalle.object.t_215.visible					= false
				dw_detalle.object.t_216.visible					= false
				dw_detalle.object.t_220.visible					= false
				dw_detalle.object.t_monto_td.visible			= false
				dw_detalle.object.t_fecha_td.visible			= false
				dw_detalle.object.t_211.visible					= false
				dw_detalle.object.t_banco_1.visible			= false
				dw_detalle.object.t_22.visible					= false
				dw_detalle.object.t_23.visible					= false
				dw_detalle.object.t_24.visible					= false
				dw_detalle.object.t_25.visible					= false
				dw_detalle.object.t_26.visible					= false
				dw_detalle.object.t_97.visible					= false
				dw_detalle.object.t_total_cheque.visible		= false
				dw_detalle.object.r_1.visible					= false
				ll_item												= 27
				for ll_indi=1 to 30
					if ll_indi<=30 then
						dw_detalle.Modify("t_"+string(ll_item)+".visible=false")
						dw_detalle.Modify("t_serie_"+string(ll_indi)+".visible=false")
						dw_detalle.Modify("t_monto_"+string(ll_indi)+".visible=false")
						dw_detalle.Modify("t_fecha_"+string(ll_indi)+".visible=false")
					end if
					ll_item ++
				next
				dw_detalle.object.t_212.visible					= false
				dw_detalle.object.t_banco_2.visible			= false
				dw_detalle.object.t_58.visible					= false
				dw_detalle.object.t_57.visible					= false
				dw_detalle.object.t_59.visible					= false
				dw_detalle.object.t_60.visible					= false
				dw_detalle.object.t_98.visible					= false
				dw_detalle.object.t_total_tc.visible				= false
				dw_detalle.object.r_2.visible					= false
				ll_item												= 61
				for ll_indi=1 to 36
					if ll_indi<=36 then
						dw_detalle.Modify("t_"+string(ll_item)+".visible=false")
						dw_detalle.Modify("t_monto_tc_"+string(ll_indi)+".visible=false")
						dw_detalle.Modify("t_fecha_tc_"+string(ll_indi)+".visible=false")
					end if
					ll_item ++
				next
				//Fin Limpiar objetos
				if cbx_ef.checked=true then //Cargar Efectivo
					ll_monto	= dw_efectivo.getitemnumber(1,'monto')
					if ll_monto>0 then
						dw_detalle.object.t_229.visible			= true
						dw_detalle.object.t_230.visible			= true
						dw_detalle.object.t_monto_ef.visible	= true
						dw_detalle.Modify("t_monto_ef.Text='"+string(ll_monto,'###,###,###,###,##0')+"'")
					end if
				end if
				if cbx_td.checked=true and ll_error=0 then //Tarjeta Debito
					ll_banco			= dw_td.getitemnumber(1,'banco')
					ldt_fecha_vcto	= date(dw_td.getitemdatetime(1,'fecha_venc'))
					ll_monto			= dw_td.getitemnumber(1,'monto')
					if ll_monto>0 then
						dw_detalle.object.t_219.visible			= true
						dw_detalle.object.t_banco_3.visible	= true
						dw_detalle.object.t_214.visible			= true
						dw_detalle.object.t_213.visible			= true
						dw_detalle.object.t_215.visible			= true
						dw_detalle.object.t_216.visible			= true
						dw_detalle.object.t_220.visible			= true
						dw_detalle.object.t_monto_td.visible	= true
						dw_detalle.object.t_fecha_td.visible	= true
						dw_detalle.Modify("t_monto_td.Text='"+string(ll_monto,'###,###,###,###,##0.0###')+"'")
						SELECT	"BANCOS"."DESCRIPCION_PRINT"  
						INTO 		:ls_descrip  
						FROM 	"BANCOS"  
						WHERE 	"BANCOS"."COD_BANCO" = :ll_banco   ;
						dw_detalle.Modify("t_banco_3.Text='"+ls_descrip+"'")
						dw_detalle.Modify("t_fecha_td.Text='"+string(ldt_fecha_vcto,'dd/mm/yyyy')+"'")
					end if
				end if
				
				if cbx_ch.checked=true and ll_error=0 then //Cheque
					ll_tot_reg										= dw_cheque.rowcount()
					ll_nro_cheques									= long(trim(em_cheques.text))
					if ll_nro_cheques > 0 then
						dw_detalle.object.t_211.visible				= true
						dw_detalle.object.t_banco_1.visible		= true
						dw_detalle.object.t_22.visible				= true
						dw_detalle.object.t_23.visible				= true
						dw_detalle.object.t_24.visible				= true
						dw_detalle.object.t_25.visible				= true
						dw_detalle.object.t_26.visible				= true
						dw_detalle.object.t_97.visible				= true
						dw_detalle.object.r_1.visible				= true
						dw_detalle.object.t_total_cheque.visible	= true
						dw_detalle.object.t_99.visible				= true
						if rb_ch_dia.checked=true then
							dw_detalle.object.t_99.text				= '1º Vencimiento al día'
						elseif rb_ch_30_dias.checked=true then
							dw_detalle.object.t_99.text				= '1º Vencimiento a 30 días'
						elseif rb_otra_fecha_ch.checked=true then
							if long(em_dias_cheque.text)=1 then
								dw_detalle.object.t_99.text			= '1º Vencimiento a '+trim(em_dias_cheque.text)+' día'
							else
								dw_detalle.object.t_99.text			= '1º Vencimiento a '+trim(em_dias_cheque.text)+' días'
							end if
						end if
						dw_detalle.Modify("t_total_cheque.Text='"+string(dw_cheque.getitemnumber(1,'monto_total'),"###,###,###,###,##0.0###")+"'")
						ll_banco										= dw_cheque.getitemnumber(1,'banco')
						SELECT	"BANCOS"."DESCRIPCION_PRINT"  
						INTO 		:ls_descrip  
						FROM 		"BANCOS"  
						WHERE 	"BANCOS"."COD_BANCO" = :ll_banco   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_detalle.Modify("t_banco_1.Text='"+ls_descrip+"'")
						else
							dw_detalle.Modify("t_banco_1.Text='XXX'")
						end if
						ll_item										= 27
						for ll_indi=1 to ll_tot_reg
							ll_serie									= dw_cheque.getitemnumber(ll_indi,'serie')
							ldt_fecha_vcto							= date(dw_cheque.getitemdatetime(ll_indi,'fecha_venc'))
							ll_monto									= dw_cheque.getitemnumber(ll_indi,'monto')
							if ll_monto>0 then
								dw_detalle.Modify("t_"+string(ll_item)+".visible=true")
								dw_detalle.Modify("t_serie_"+string(ll_indi)+".visible=true")
								dw_detalle.Modify("t_monto_"+string(ll_indi)+".visible=true")
								dw_detalle.Modify("t_fecha_"+string(ll_indi)+".visible=true")
								dw_detalle.Modify("t_monto_"+string(ll_indi)+".text='"+string(ll_monto,"###,###,###,###,##0.0###")+"'")
								dw_detalle.Modify("t_serie_"+string(ll_indi)+".text='"+string(ll_serie)+"'")
								dw_detalle.Modify("t_fecha_"+string(ll_indi)+".text='"+string(ldt_fecha_vcto,'dd/mm/yyyy')+"'")
							end if
							ll_item ++
						next
					else
						messagebox("Advertencia","No a Ingresado Cantidad Cheques")
						return;
					end if 		
				end if
				
				if cbx_tc.checked=true and ll_error=0 then //TC
					ll_tot_reg									= dw_tc.rowcount()
					dw_detalle.object.t_212.visible			= true
					dw_detalle.object.t_banco_2.visible	= true
					dw_detalle.object.t_58.visible			= true
					dw_detalle.object.t_57.visible			= true
					dw_detalle.object.t_59.visible			= true
					dw_detalle.object.t_60.visible			= true
					dw_detalle.object.t_98.visible			= true
					dw_detalle.object.r_2.visible			= true
					dw_detalle.object.t_total_tc.visible	= true
					dw_detalle.Modify("t_total_tc.Text='"+string(dw_tc.getitemnumber(1,'monto_total'),"###,###,###,###,##0.0###")+"'")
					ll_banco											= dw_tc.getitemnumber(1,'banco')
					SELECT	"BANCOS"."DESCRIPCION_PRINT"  
					INTO 		:ls_descrip  
					FROM 		"BANCOS"  
					WHERE 	"BANCOS"."COD_BANCO" = :ll_banco   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_detalle.Modify("t_banco_2.Text='"+ls_descrip+"'")
					else
						dw_detalle.Modify("t_banco_2.Text='XXX'")
					end if
					ll_item											= 61
					for ll_indi=1 to ll_tot_reg
						ldt_fecha_vcto								= date(dw_tc.getitemdatetime(ll_indi,'fecha_venc'))
						ll_monto										= dw_tc.getitemnumber(ll_indi,'monto')
						if ll_monto>0 then
							dw_detalle.Modify("t_"+string(ll_item)+".visible=true")
							dw_detalle.Modify("t_monto_tc_"+string(ll_indi)+".visible=true")
							dw_detalle.Modify("t_fecha_tc_"+string(ll_indi)+".visible=true")
							dw_detalle.Modify("t_monto_tc_"+string(ll_indi)+".text='"+string(ll_monto,"###,###,###,###,##0.0###")+"'")
							dw_detalle.Modify("t_fecha_tc_"+string(ll_indi)+".text='"+string(ldt_fecha_vcto,"dd/mm/yyyy")+"'")
						end if
						ll_item ++
					next
				end if
				f_Print( dw_detalle )
			end if
		else
			messagebox("Advertencia","Existe Diferencia en la Forma de Pago, debe Pagar US$ "+string(ll_total_a_pagar,"###,###,###,###,##0.0###")+ ' y lleva detallado US$ '+string(ll_suma,"###,###,###,###,##0.0###"))
		end if
	end if
end if
end event

type gb_cheque from groupbox within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1816
integer width = 1454
integer height = 164
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1º Cheque"
end type

event ue_mousemove;st_help_ch.visible	= false
st_help_tc.visible	= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

type ln_1 from line within w_imprimir_detalle_pago_crematorio
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2834
integer beginy = 40
integer endx = 2834
integer endy = 2648
end type

type ln_2 from line within w_imprimir_detalle_pago_crematorio
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2843
integer beginy = 40
integer endx = 2843
integer endy = 2648
end type

type dw_detalle from datawindow within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_dwnmousemove
integer x = 27
integer y = 16
integer width = 2793
integer height = 1620
boolean enabled = false
string title = "none"
string dataobject = "dw_imprimir_detalle_pago_crematorio"
boolean border = false
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

event itemchanged;Long		ll_new,ll_est_ef,ll_est_ch,ll_est_tc,ll_est_td
String	ls_columna

dw_detalle.accepttext()
ls_columna									= dw_detalle.GetColumnName ( )
CHOOSE CASE ls_columna
	CASE 'forma_pago_ef'
		ll_est_ef							= dw_detalle.getitemnumber(1,'forma_pago_ef')
		dw_efectivo.reset()
		if ll_est_ef=0 then
			dw_efectivo.visible			= true
			ll_new							= dw_efectivo.insertrow(0)
			dw_efectivo.setfocus()
		else
			dw_efectivo.visible			= false
		end if
	CASE 'forma_pago_ch'
		ll_est_ch							= dw_detalle.getitemnumber(1,'forma_pago_ch')
		dw_cheque.reset()
		em_cheques.text					= ''
		if ll_est_ef=0 then
			dw_cheque.visible				= true
			st_cantidad_dcto.visible	= true
			em_cheques.visible			= true
			ll_new							= dw_cheque.insertrow(0)
			dw_cheque.setfocus()
		else
			dw_cheque.visible				= false
			st_cantidad_dcto.visible	= false
			em_cheques.visible			= false
		end if
	CASE 'forma_pago_tc'
		ll_est_tc							= dw_detalle.getitemnumber(1,'forma_pago_tc')
		dw_tc.reset()
		em_cuotas_tc.text					= ''
		if ll_est_ef=0 then
			dw_tc.visible					= true
			st_cantidad_cuotas.visible	= true
			em_cuotas_tc.visible			= true
			ll_new							= dw_tc.insertrow(0)
			dw_tc.setfocus()
		else
			dw_tc.visible					= false
			st_cantidad_cuotas.visible	= false
			em_cuotas_tc.visible			= false
		end if
	CASE 'forma_pago_td'
		ll_est_td							= dw_detalle.getitemnumber(1,'forma_pago_td')
		dw_td.reset()
		if ll_est_ef=0 then
			dw_td.visible					= true
			ll_new							= dw_td.insertrow(0)
			dw_td.setfocus()
		else
			dw_td.visible					= false
		end if
END CHOOSE
end event

type st_help_ch_check from statictext within w_imprimir_detalle_pago_crematorio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 608
integer y = 344
integer width = 1029
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Recuerde ingresar Valor a pagar con CH en fila Nº 1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_ch.visible			= false
st_help_tc.visible			= false
st_help_ch_check.visible	= false
st_help_tc_check.visible	= false
end event

