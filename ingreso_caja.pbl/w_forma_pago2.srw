forward
global type w_forma_pago2 from window
end type
type dw_multiproducto from datawindow within w_forma_pago2
end type
type cbx_credito from checkbox within w_forma_pago2
end type
type st_fuera_plazo from statictext within w_forma_pago2
end type
type sle_1 from uo_convierte_numero within w_forma_pago2
end type
type dw_factura from datawindow within w_forma_pago2
end type
type dw_boleta from datawindow within w_forma_pago2
end type
type st_abono_ini from statictext within w_forma_pago2
end type
type dw_abono from datawindow within w_forma_pago2
end type
type dw_print_cupones from datawindow within w_forma_pago2
end type
type em_saldo from editmask within w_forma_pago2
end type
type st_19 from statictext within w_forma_pago2
end type
type pb_limpiar from picturebutton within w_forma_pago2
end type
type st_fecha_pago from statictext within w_forma_pago2
end type
type st_8 from statictext within w_forma_pago2
end type
type st_rezago from statictext within w_forma_pago2
end type
type st_7 from statictext within w_forma_pago2
end type
type st_folio from statictext within w_forma_pago2
end type
type st_tipo_cobro from statictext within w_forma_pago2
end type
type st_2 from statictext within w_forma_pago2
end type
type st_1 from statictext within w_forma_pago2
end type
type st_correlativo_tarcred from statictext within w_forma_pago2
end type
type pb_salir from picturebutton within w_forma_pago2
end type
type pb_grabar from picturebutton within w_forma_pago2
end type
type st_eliminar_tarjeta_cred from statictext within w_forma_pago2
end type
type st_insertar_tar_cred from statictext within w_forma_pago2
end type
type st_correlativo_cheque from statictext within w_forma_pago2
end type
type st_eliminar_cheque from statictext within w_forma_pago2
end type
type st_insertar_cheque from statictext within w_forma_pago2
end type
type cbx_tarjeta_debito from checkbox within w_forma_pago2
end type
type dw_impresion from datawindow within w_forma_pago2
end type
type sle_efectivo from editmask within w_forma_pago2
end type
type cbx_cheque from checkbox within w_forma_pago2
end type
type cbx_efectivo from checkbox within w_forma_pago2
end type
type st_6 from statictext within w_forma_pago2
end type
type st_41 from statictext within w_forma_pago2
end type
type st_saldo from statictext within w_forma_pago2
end type
type st_5 from statictext within w_forma_pago2
end type
type st_4 from statictext within w_forma_pago2
end type
type sle_vuelto from singlelineedit within w_forma_pago2
end type
type sle_paga_con from singlelineedit within w_forma_pago2
end type
type st_3 from statictext within w_forma_pago2
end type
type st_total from statictext within w_forma_pago2
end type
type gb_1 from groupbox within w_forma_pago2
end type
type cbx_tarjeta_credito from checkbox within w_forma_pago2
end type
type gb_11 from groupbox within w_forma_pago2
end type
type tab_1 from tab within w_forma_pago2
end type
type tabpage_cheque from userobject within tab_1
end type
type st_9 from statictext within tabpage_cheque
end type
type st_18 from statictext within tabpage_cheque
end type
type dw_empresa_2 from datawindow within tabpage_cheque
end type
type st_17 from statictext within tabpage_cheque
end type
type st_16 from statictext within tabpage_cheque
end type
type em_dias_cheque from editmask within tabpage_cheque
end type
type rb_otra_fecha_ch from radiobutton within tabpage_cheque
end type
type st_15 from statictext within tabpage_cheque
end type
type rb_ch_30_dias from radiobutton within tabpage_cheque
end type
type rb_ch_dia from radiobutton within tabpage_cheque
end type
type st_titulo_cheque from statictext within tabpage_cheque
end type
type em_cantidad_1 from editmask within tabpage_cheque
end type
type dw_detalle_pago_1 from datawindow within tabpage_cheque
end type
type gb_5 from groupbox within tabpage_cheque
end type
type dw_empresa_1 from datawindow within tabpage_cheque
end type
type tabpage_cheque from userobject within tab_1
st_9 st_9
st_18 st_18
dw_empresa_2 dw_empresa_2
st_17 st_17
st_16 st_16
em_dias_cheque em_dias_cheque
rb_otra_fecha_ch rb_otra_fecha_ch
st_15 st_15
rb_ch_30_dias rb_ch_30_dias
rb_ch_dia rb_ch_dia
st_titulo_cheque st_titulo_cheque
em_cantidad_1 em_cantidad_1
dw_detalle_pago_1 dw_detalle_pago_1
gb_5 gb_5
dw_empresa_1 dw_empresa_1
end type
type tabpage_credito from userobject within tab_1
end type
type st_10 from statictext within tabpage_credito
end type
type rb_empresa_2 from radiobutton within tabpage_credito
end type
type rb_empresa_1 from radiobutton within tabpage_credito
end type
type st_22 from statictext within tabpage_credito
end type
type rb_tienda_ctdo from radiobutton within tabpage_credito
end type
type st_21 from statictext within tabpage_credito
end type
type rb_tienda_cred from radiobutton within tabpage_credito
end type
type st_20 from statictext within tabpage_credito
end type
type rb_comer from radiobutton within tabpage_credito
end type
type rb_prom from radiobutton within tabpage_credito
end type
type rb_cred from radiobutton within tabpage_credito
end type
type st_titulo_credito from statictext within tabpage_credito
end type
type em_cantidad_tarjetacred_1 from editmask within tabpage_credito
end type
type dw_detalle_pago_tarjetacred_1 from datawindow within tabpage_credito
end type
type gb_2 from groupbox within tabpage_credito
end type
type tabpage_credito from userobject within tab_1
st_10 st_10
rb_empresa_2 rb_empresa_2
rb_empresa_1 rb_empresa_1
st_22 st_22
rb_tienda_ctdo rb_tienda_ctdo
st_21 st_21
rb_tienda_cred rb_tienda_cred
st_20 st_20
rb_comer rb_comer
rb_prom rb_prom
rb_cred rb_cred
st_titulo_credito st_titulo_credito
em_cantidad_tarjetacred_1 em_cantidad_tarjetacred_1
dw_detalle_pago_tarjetacred_1 dw_detalle_pago_tarjetacred_1
gb_2 gb_2
end type
type tabpage_debito from userobject within tab_1
end type
type st_11 from statictext within tabpage_debito
end type
type rb_empresa_4 from radiobutton within tabpage_debito
end type
type rb_empresa_3 from radiobutton within tabpage_debito
end type
type st_222 from statictext within tabpage_debito
end type
type st_titulo_debito from statictext within tabpage_debito
end type
type dw_detalle_pago_tarjetadebito_1 from datawindow within tabpage_debito
end type
type tabpage_debito from userobject within tab_1
st_11 st_11
rb_empresa_4 rb_empresa_4
rb_empresa_3 rb_empresa_3
st_222 st_222
st_titulo_debito st_titulo_debito
dw_detalle_pago_tarjetadebito_1 dw_detalle_pago_tarjetadebito_1
end type
type tab_1 from tab within w_forma_pago2
tabpage_cheque tabpage_cheque
tabpage_credito tabpage_credito
tabpage_debito tabpage_debito
end type
type gb_4 from groupbox within w_forma_pago2
end type
end forward

global type w_forma_pago2 from window
integer x = 1074
integer y = 484
integer width = 3282
integer height = 2960
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 79741120
dw_multiproducto dw_multiproducto
cbx_credito cbx_credito
st_fuera_plazo st_fuera_plazo
sle_1 sle_1
dw_factura dw_factura
dw_boleta dw_boleta
st_abono_ini st_abono_ini
dw_abono dw_abono
dw_print_cupones dw_print_cupones
em_saldo em_saldo
st_19 st_19
pb_limpiar pb_limpiar
st_fecha_pago st_fecha_pago
st_8 st_8
st_rezago st_rezago
st_7 st_7
st_folio st_folio
st_tipo_cobro st_tipo_cobro
st_2 st_2
st_1 st_1
st_correlativo_tarcred st_correlativo_tarcred
pb_salir pb_salir
pb_grabar pb_grabar
st_eliminar_tarjeta_cred st_eliminar_tarjeta_cred
st_insertar_tar_cred st_insertar_tar_cred
st_correlativo_cheque st_correlativo_cheque
st_eliminar_cheque st_eliminar_cheque
st_insertar_cheque st_insertar_cheque
cbx_tarjeta_debito cbx_tarjeta_debito
dw_impresion dw_impresion
sle_efectivo sle_efectivo
cbx_cheque cbx_cheque
cbx_efectivo cbx_efectivo
st_6 st_6
st_41 st_41
st_saldo st_saldo
st_5 st_5
st_4 st_4
sle_vuelto sle_vuelto
sle_paga_con sle_paga_con
st_3 st_3
st_total st_total
gb_1 gb_1
cbx_tarjeta_credito cbx_tarjeta_credito
gb_11 gb_11
tab_1 tab_1
gb_4 gb_4
end type
global w_forma_pago2 w_forma_pago2

type variables
long		il_sw_pasa_cheque=0,il_sw_pasa_credito=0,il_valor_cheque,il_valor_credito,il_valor_debito,il_tab_forma_pago,il_codigo_pago_credito,il_nro_folio_aux,&
			il_row_cheque,il_row_credito,il_row_debito,il_monto_total,il_monto_total_aux,il_abono,il_count_e,il_count_f,il_count_a,il_count_l,il_count_m
String		is_tipo_cob_aux,is_opcion,is_proximo_pago,is_reingreso='N'
Date		idt_fecha_hoy
Double	idb_iva,il_max_folio_new
DataWindowChild 	dwch_empresa2
end variables

forward prototypes
public subroutine wf_valida_opciones_pago ()
public subroutine wf_mover_dw ()
public subroutine wf_dw_tienda ()
public subroutine wf_dw_tienda_contado ()
public subroutine wf_dw_credito ()
public function string wf_valida_todo ()
public subroutine wf_grabar_traspaso_empresa (string as_tipo_cobro, long al_n_cuotas, long al_folio, long al_otro_folio, string as_otro_tipo_cobro)
public subroutine wf_limpiar_ventana_anterior_ingreso ()
public function integer f_inicializa_ingreso (string as_tipo_cob)
public function integer f_ingresar_doc (long al_n_cheque, long al_cod_banco, double ld_monto, datetime ad_fecha_venc, string as_cod_pago, long al_n_cheques, long al_cod_tarjeta_credito, long al_nro_cuotas_credito, string as_cod_autoriza_credito, long al_tipo_tarjeta_credito, long al_cod_tarjeta_debito, string as_cod_autoriza_debito, long al_cod_banco_debito)
public subroutine wf_recalcular_valores ()
public subroutine wf_grabar_trans_abono_ok ()
public function long f_actualizar_saldo ()
public function integer f_actualizar_mov (string as_tipo_mov, long al_monto, long al_nro_cuotas)
public function integer f_ingresar_ingre (long al_folio, string as_tipo_mov, double ad_monto, integer ai_cuotas_pag)
public subroutine wf_cargar_factura_electronica (string as_cuota, string as_cuota_mant, string as_doc, string as_paga_con, double abd_uf, long al_fila)
public subroutine wf_cargar_boleta_electronica (string as_cuota, string as_cuota_mant, string as_doc, string as_paga_con, double abd_uf, long al_fila)
public subroutine wf_actualizar_benef_mantencion (long al_cod_beneficio, long al_cod_benef_detalle, string as_base, string as_serie, long al_numero, string as_tipo_cob, long al_folio, datetime adt_fecha_pago)
public function string wf_imprimir_delect (double al_folio)
public function integer f_actualizar_mov_h (string as_tipo_mov, long al_monto, long al_nro_cuotas, string as_base, string as_serie, double al_numero)
public subroutine wf_desactiva_descuento ()
public subroutine wf_cargar_dscto_mp (string as_tipo_cob_dscto, string as_tipo_otro_dscto, double al_monto_dscto, long al_tot_reg_hijo, long al_cod_mp)
end prototypes

public subroutine wf_valida_opciones_pago ();Long	ll_efectivo,ll_cheque,ll_credito,ll_debito,ll_total_cheque,ll_total_credito,&
		ll_total_debito,ll_abono,ll_saldo,ll_total_efectivo,ll_total

if cbx_efectivo.checked=false then
	ll_efectivo					= long(trim(sle_efectivo.text))
	if ll_efectivo>0 then
		ll_total_efectivo		= long(em_saldo.text) + ll_efectivo
		em_saldo.text			= string(ll_total_efectivo,"###,###,###,##0")
		sle_efectivo.text		= '0'
	end if
end if
if cbx_credito.checked=false then
	ll_efectivo					= long(trim(sle_efectivo.text))
	if ll_efectivo>0 then
		ll_total_efectivo			= long(em_saldo.text) + ll_efectivo
		em_saldo.text			= string(ll_total_efectivo,"###,###,###,##0")
		sle_efectivo.text		= '0'
	end if
end if
if cbx_cheque.checked=false then
	ll_cheque					= long(trim(st_saldo.text))
	if tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 and ll_cheque>0 then
		ll_total_cheque		= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(1,'c_total_2')
		if ll_total_cheque>0 then
			ll_saldo				= long(em_saldo.text) + ll_total_cheque
			em_saldo.text		= string(ll_saldo,"###,###,###,##0")
			ll_abono				= long(st_saldo.text) - ll_total_cheque
			st_saldo.text		= string(ll_abono,"###,###,###,##0")
		end if
	end if
end if
if cbx_tarjeta_credito.checked=false then
	ll_credito					= long(trim(st_saldo.text))
	if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 and ll_credito>0 then
		ll_total_credito	= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.getitemnumber(1,'c_total_2')
		if ll_total_credito>0 then
			ll_saldo				= long(em_saldo.text) + ll_total_credito
			em_saldo.text		= string(ll_saldo,"###,###,###,##0")
			ll_abono				= long(st_saldo.text) - ll_total_credito
			st_saldo.text		= string(ll_abono,"###,###,###,##0")
		end if
	end if
end if
if cbx_tarjeta_debito.checked=false then
	ll_debito					= long(trim(st_saldo.text))
	if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.rowcount()>0 and ll_debito>0 then
		ll_total_debito		= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.getitemnumber(1,'c_total_2')
		if ll_total_debito>0 then
			ll_saldo				= long(em_saldo.text) + ll_total_debito
			em_saldo.text		= string(ll_saldo,"###,###,###,##0")
			ll_abono				= long(st_saldo.text) - ll_total_debito
			st_saldo.text		= string(ll_abono,"###,###,###,##0")
		end if
	end if
end if
if cbx_efectivo.checked=true and cbx_cheque.checked=false and cbx_tarjeta_credito.checked=false and &
	cbx_tarjeta_debito.checked=false then
	em_saldo.text			= '0'
	ll_total					= long(st_total.text)
	sle_efectivo.text		= string(ll_total,"###,###,###,##0")
end if
	
end subroutine

public subroutine wf_mover_dw ();tab_1.tabpage_cheque.dw_detalle_pago_1.x						= 18
tab_1.tabpage_cheque.dw_detalle_pago_1.y						= 100
tab_1.tabpage_cheque.dw_detalle_pago_1.width					= 2633
tab_1.tabpage_cheque.dw_detalle_pago_1.height					= 500
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.x			= 18
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.y			= 100
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.width	= 2633
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.height	= 560
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.x		= 18
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.y		= 100
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.width	= 2633
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.height	= 560

end subroutine

public subroutine wf_dw_tienda ();DataWindowChild	dwch_tipo_tarjeta
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetChild('tipo_tarjeta_credito', dwch_tipo_tarjeta)
dwch_tipo_tarjeta.SetTransObject(SQLCA)
dwch_tipo_tarjeta.Retrieve(901,999,'N')

end subroutine

public subroutine wf_dw_tienda_contado ();DataWindowChild	dwch_tipo_tarjeta
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetChild('tipo_tarjeta_credito', dwch_tipo_tarjeta)
dwch_tipo_tarjeta.SetTransObject(SQLCA)
dwch_tipo_tarjeta.Retrieve(901,999,'S')

end subroutine

public subroutine wf_dw_credito ();DataWindowChild	dwch_tipo_tarjeta
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetChild('tipo_tarjeta_credito', dwch_tipo_tarjeta)
dwch_tipo_tarjeta.SetTransObject(SQLCA)
dwch_tipo_tarjeta.Retrieve(1,900,'N')

end subroutine

public function string wf_valida_todo ();Long		ll_sw_pasa=0,ll_nro_cheque,ll_banco,ll_monto,ll_sub,ll_banco_aux,ll_nro_cheque_aux,ll_count
Long		ll_cantidad_cheques,ll_cantidad_cuotas,ll_tot_reg_cheques,ll_tot_reg_cuotas,&
			ll_indi,ll_cod_tarjeta,ll_tipo_tarjeta,ll_saldo,ll_efectivo,ll_suma,ll_diferencia
DateTime	ldt_fecha
String	ls_autoriza,ls_traspaso
tab_1.tabpage_cheque.dw_detalle_pago_1.accepttext()
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.accepttext()
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.accepttext()
// Cheched=False
if cbx_efectivo.checked=false then
	sle_efectivo.enabled												= false
else
	if long(sle_efectivo.text)<0 then
		messagebox("Advertencia","Error Monto Efectivo no debe ser Negativo")
		ll_sw_pasa ++
	elseif long(sle_efectivo.text)=0 then
//		sle_efectivo.enabled											= false
	end if
end if
if ll_sw_pasa=0 then
	if cbx_cheque.checked=false then
		st_insertar_cheque.enabled									= false
		st_eliminar_cheque.enabled 								= false
		st_correlativo_cheque.enabled 								= false
		tab_1.tabpage_cheque.em_cantidad_1.enabled 		= false
		tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
		tab_1.tabpage_cheque.dw_detalle_pago_1.enabled 	= false
	else
		ll_cantidad_cheques											= long(tab_1.tabpage_cheque.em_cantidad_1.text)
		ll_tot_reg_cheques											= tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()
//		if tab_1.tabpage_cheque.rb_cheque.checked=true and tab_1.tabpage_cheque.dw_detalle_pago_2.rowcount()>0 then
//			ll_cantidad_cheques ++
//		end if

		if ll_cantidad_cheques <> ll_tot_reg_cheques then
			messagebox("Advertencia","Error Cantidad de Cheques No Válida con el Detalle")
			tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
			ll_sw_pasa ++
		else
			for ll_indi=1 to ll_tot_reg_cheques
				ldt_fecha		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemdatetime(ll_indi, 'fecha_venc')
				ll_nro_cheque	= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "n_cheque")
				ll_banco			= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "cod_banco")
				ll_monto			= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "monto")
				ls_traspaso		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemString(ll_indi, "traspaso_pago")
//					if ls_traspaso<>'AI' and ls_traspaso<>'IA' then
					if isnull(ldt_fecha) then
						messagebox("Advertencia Error Detalle de Cheques","Error en Fila Nº "+string(ll_indi) +' Fecha Inválida')
						tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_indi)
						tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
						tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('fecha_venc')
						ll_sw_pasa ++
						Exit
					elseif isnull(ll_nro_cheque) or ll_nro_cheque <= 0 then
						messagebox("Advertencia Error Detalle de Cheques","Error en Fila Nº "+string(ll_indi) +' Serie Cheque Inválido')
						tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_indi)
						tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
						tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('n_cheque')
						ll_sw_pasa ++
						Exit
					elseif isnull(ll_banco) or ll_banco <= 0 then
						messagebox("Advertencia Error Detalle de Cheques","Error en Fila Nº "+string(ll_indi) +' Código Banco Inválido')
						tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_indi)
						tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
						tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('cod_banco')
						ll_sw_pasa ++
						Exit
					elseif isnull(ll_monto) or ll_monto <= 0 then
						messagebox("Advertencia Error Detalle de Cheques","Error en Fila Nº "+string(ll_indi) +' Valor Cheque Inválido')
						tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_indi)
						tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
						tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('monto')
						ll_sw_pasa ++
						Exit
					end if
//					end if
			next
			if ll_tot_reg_cheques>0 then
				for ll_indi=1 to ll_tot_reg_cheques
					ll_banco						= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(ll_indi,'cod_banco')
					ll_nro_cheque				= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(ll_indi,'n_cheque')
					for ll_sub=1 to ll_tot_reg_cheques
						ll_banco_aux			= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(ll_sub,'cod_banco')
						ll_nro_cheque_aux		= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(ll_sub,'n_cheque')
						if ll_banco=ll_banco_aux and ll_nro_cheque=ll_nro_cheque_aux then ll_count ++
						if ll_count>1 then
							messagebox("Advertencia","Error Detalle de Cheque, Duplicado Serie Nº "+string(ll_nro_cheque)+", Fila Nº "+string(ll_sub))
							tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
							tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_sub)
							tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('n_cheque')
							ll_sw_pasa ++
							ll_indi	= ll_tot_reg_cheques
							exit
						end if
					next
					ll_count	= 0
				next
			end if
		end if
	end if
	if ll_sw_pasa=0 then
		if cbx_tarjeta_credito.checked=false then
			st_insertar_tar_cred.enabled												= false
			st_eliminar_tarjeta_cred.enabled 											= false
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled 		= false
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.enabled 	= false
		else
			ll_cantidad_cuotas																= long(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text)
			ll_tot_reg_cuotas																= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()
//			if tab_1.tabpage_credito.rb_credito.checked=true and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.rowcount()>0 then
//				ll_cantidad_cuotas ++
//			end if
			if ll_cantidad_cuotas <> ll_tot_reg_cuotas then
				messagebox("Advertencia Error Detalle Tarjeta Crédito","Error Cantidad de Cuotas No Válida con el Detalle")
				ll_sw_pasa ++
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
			else
				for ll_indi=1 to ll_tot_reg_cuotas
					ldt_fecha				= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemdatetime(ll_indi, 'fecha_venc')
					ll_banco 				= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, "cod_banco")
					ll_monto				= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, "monto")
					ll_cod_tarjeta		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, 'cod_tarjeta_credito')
					ll_tipo_tarjeta		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, 'tipo_tarjeta_credito')
					ls_autoriza			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemString(ll_indi, 'cod_autorizacion_credito')
					ls_traspaso			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemString(ll_indi, "traspaso_pago")
//					if ls_traspaso<>'AI' and ls_traspaso<>'IA' then
						if isnull(ldt_fecha) then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Fecha Inválida')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('fecha_venc')
							ll_sw_pasa ++
							Exit
						elseif isnull(ll_banco) or ll_banco<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Código Banco Inválido')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('cod_banco')
							ll_sw_pasa ++
							Exit
						elseif isnull(ll_monto) or ll_monto <= 0 then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Valor Cuota Inválida')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('monto')
							ll_sw_pasa ++
							Exit
						elseif isnull(ll_cod_tarjeta) or ll_cod_tarjeta<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Número Tarjeta Inválida')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('cod_tarjeta_credito')
							ll_sw_pasa ++
							Exit
						elseif isnull(ll_tipo_tarjeta) or ll_tipo_tarjeta<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Tipo Tarjeta Inválida')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('tipo_tarjeta_credito')
							ll_sw_pasa ++
							Exit
						elseif isnull(ls_autoriza) or ls_autoriza='' then
							messagebox("Advertencia Error Detalle Tarjeta Crédito","Error en Fila Nº "+string(ll_indi) +' Autorización Inválida')
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('cod_autorizacion_credito')
							ll_sw_pasa ++
							Exit
						end if
//					end if
				next
			end if
		end if
		if ll_sw_pasa=0 then
			if cbx_tarjeta_debito.checked=false then
				tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.reset()
				tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.enabled 		= false
			else
				if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.rowcount() = 1 then
					ldt_fecha			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemdatetime(1, 'fecha_venc')
					ll_cod_tarjeta 	= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, "cod_tarjeta_debito")
					ls_autoriza		= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemString(1, "cod_autorizacion_debito")
					ll_banco			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, 'cod_banco_debito')
					ll_monto			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, 'monto')
					ls_traspaso		= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemString(1, "traspaso_pago")
//					if ls_traspaso<>'AI' and ls_traspaso<>'IA' then
						if isnull(ldt_fecha) then
							messagebox("Advertencia Error Detalle Tarjeta Débito","Error Fecha Inválida")
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('fecha_venc')
							ll_sw_pasa ++
						elseif isnull(ll_cod_tarjeta) or ll_cod_tarjeta<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Débito","Error Número Tarjeta Inválida")
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_tarjeta_debito')
							ll_sw_pasa ++
						elseif isnull(ls_autoriza) or ls_autoriza = '' then
							messagebox("Advertencia Error Detalle Tarjeta Débito","Error Código Autorización Inválido")
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_autorizacion_debito')
							ll_sw_pasa ++
						elseif isnull(ll_banco) or ll_banco<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Débito","Error Código Banco Inválido")
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_banco_debito')
							ll_sw_pasa ++
						elseif isnull(ll_monto) or ll_monto<=0 then
							messagebox("Advertencia Error Detalle Tarjeta Débito","Error Monto Inválido")
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('monto')
							ll_sw_pasa ++
						end if
//					end if
				end if
			end if
	//		if ll_sw_pasa =0 then f_actualizar_saldo()
		end if
	end if
end if
if ll_sw_pasa=0 then
//	wf_recalcular_valores()
	ll_saldo			= long(st_saldo.text)
	ll_efectivo		= long(sle_efectivo.text)
	ll_suma			= ll_saldo + ll_efectivo
	ll_diferencia		= gd_total - ll_suma
	if ll_suma = gd_total then
		return 'S'
	else
		if ll_diferencia=1 then
			messagebox("Advertencia","Revisar detalle de Pago, existe diferencia de  "+string(ll_diferencia,"###,###,###,###,###")+'  peso')
		else
			messagebox("Advertencia","Revisar detalle de Pago, existe diferencia de  "+string(ll_diferencia,"###,###,###,###,###")+'  pesos')
		end if
		return 'N'
	end if
else
	return 'N'
end if
end function

public subroutine wf_grabar_traspaso_empresa (string as_tipo_cobro, long al_n_cuotas, long al_folio, long al_otro_folio, string as_otro_tipo_cobro);//String	ls_doc,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_ciudad,ls_comuna,&
//			ls_fono,ls_base,ls_serie,ls_dver
//Long		ll_row,ll_monto_ef,net,ll_rut,ll_numero,ll_rut_aux,ll_res,ll_cuotas_pag,ll_anno,&
//			ll_cta_pag_m,ll_anno_m,net_2
//Date		ld_fecha
//datetime	ldt_fecha_pago
//
//DataWindowChild dwch_encabezado, dwch_detalle_ci, dwch_doc_cob
//if isvalid(w_ingreso) then
//	ls_dver			= gf_obtener_dv(gi_rut)
//	ll_monto_ef 	= long(sle_efectivo.text)
//	if as_tipo_cobro="CI" then
//		ll_res = MessageBox("Advertencia", "Se Imprime C.I. (COMPROBANTE DE INGRESO), Folio Nº: "+string(al_folio,"###,###,###,###,###")+" está preparada la Impresora!!!", &
//					Exclamation!, YesNo!, 2)
//		IF ll_res = 1 THEN
//			dw_impresion.DataObject	= 'd_rep_ci_traspaso_1'
//			dw_impresion.GetChild('d_rep_detalle_ci', dwch_detalle_ci)
//			dwch_detalle_ci.SetTransObject(SQLCA)
//			dwch_detalle_ci.Retrieve(al_folio)
//			dw_impresion.GetChild('d_rep_ci_docu', dwch_doc_cob)
//			dwch_doc_cob.SetTransObject(SQLCA)
//			dwch_doc_cob.Retrieve(al_folio)
//			dw_impresion.SetTransObject(SQLCA)
//			ll_row = w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='I'", 1, w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.RowCount() )
//			IF ll_row > 0 THEN
//				if w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.rowcount() > 0 then
//					select  sysdate into :fechasys from tasa;
//					CHOOSE CASE gs_base
//						CASE 'O'//Promesa
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'L'//Liberador
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'P'//Pagare
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pagare_plazo") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pagare_plazo") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'D'// Derecho
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "derecho_plazo") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "derecho_plazo") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//					END CHOOSE
//				end if
//				IF gs_rezago = "S" THEN 
//					if isnull(gs_nombre_completo) or gs_nombre_completo='' then Open(w_ingresar_nombre)
//					ls_doc	= gs_contrato_rezago
//				ELSE
//					ls_doc	= (gs_base+gs_serie+String(gi_numero))
//				END IF
//				if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" and gs_rezago = "S" then
//					dw_impresion.Retrieve(al_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,al_otro_folio,as_otro_tipo_cobro)
//				elseif gs_rezago <> "S" then
//					dw_impresion.Retrieve(al_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,al_otro_folio,as_otro_tipo_cobro)
//				end if
//				/////////////// Imprimir
//				if dw_impresion.rowcount()>0 then
//					IF PrintSetup() <> -1 THEN
////						if tab_1.tabpage_cheque.dw_detalle_pago_2.rowcount()>0 then
////							tab_1.tabpage_cheque.dw_detalle_pago_2.update()
////						end if
////						if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.rowcount()>0 then
////							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.update()
////						end if
////						if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.rowcount()>0 then
////							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.update()
////						end if
////						dw_impresion.Print()
//					END IF
//					Net		= MessageBox("Imprimir Documento", "Imprimió correctamente el documento " + as_tipo_cobro +" Nº " +String(al_folio) +" ?", Exclamation!, YesNo!, 2)
//				end if
//				// imprimir BL
//				if as_otro_tipo_cobro="BL" and net=1 then
//					ll_res = MessageBox("Advertencia", "Se Imprime B.L. (BOLETA), Folio Nº: "+string(al_folio,"###,###,###,###,###")+" está preparada la Impresora!!!", &
//								Exclamation!, YesNo!, 2)
//					IF ll_res = 1 THEN
//						dw_impresion.DataObject	= 'd_rep_bl_traspaso'
//						dw_impresion.GetChild('d_rep_detalle_bl', dwch_detalle_ci)
//						dwch_detalle_ci.SetTransObject(SQLCA)
//						dwch_detalle_ci.Retrieve(al_folio)
//						dw_impresion.GetChild('d_rep_bl_docu', dwch_doc_cob)
//						dwch_doc_cob.SetTransObject(SQLCA)
//						dwch_doc_cob.Retrieve(al_folio)
//						dw_impresion.SetTransObject(SQLCA)
//						ll_row = w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.Find("tipo_cob='F' or tipo_cob='N' or tipo_cob='M'", 1, w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.RowCount() )
//						IF ll_row > 0 THEN
//							if w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.rowcount() > 0 then
//								CHOOSE CASE gs_base
//									CASE 'O'//Promesa
//										if gd_fecha_prox_pago=date('01/01/1900') then
//											dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//											string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "c_prox_pago_anno") - 1) +&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										else
//											ll_anno			= year( date(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.getitemdatetime(1,'oferta_v_fecha_m') ))
//											ll_cta_pag_m	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, 'oferta_v_cta_pag_m')
//											ll_anno_m		= ll_anno + ll_cta_pag_m
//											dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//											string(al_n_cuotas+ll_anno_m - 1) +&
//											'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										end if
//									CASE 'C'//Contratos
//										if gd_fecha_prox_pago=date('01/01/1900') then
//											dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//											string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "c_prox_pago_anno") - 1)+&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										else
//											ll_anno			= year( date(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.getitemdatetime(1,'contrato_fecha_m') ))
//											ll_cta_pag_m	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, 'contrato_cta_pag_m')
//											ll_anno_m		= ll_anno + ll_cta_pag_m
//											dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//											string(al_n_cuotas+ll_anno_m - 1)+&
//											'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										end if
//									CASE 'R'//Repactacion cuota de mantencion
//										if gd_fecha_prox_pago=date('01/01/1900') then
//											dw_impresion.object.cuota.text	= 'Cuota N° '+&
//											string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "ctas_pagadas"))+&
//											' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "cuotas_pactadas") )+&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										else
//											dw_impresion.object.cuota.text	= 'Cuota N° '+&
//											string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "ctas_pagadas"))+&
//											' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "cuotas_pactadas") )+&
//											'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//											'        hora('+string(fechasys,"hh:mm")+')'
//										end if
//								END CHOOSE
//							end if
//							IF gs_rezago = "S" THEN 
//								if isnull(gs_nombre_completo) or gs_nombre_completo='' then Open(w_ingresar_nombre)
//								ls_doc	= gs_contrato_rezago
//							ELSE
//								ls_doc 	= (gs_base+gs_serie+String(gi_numero))
//							END IF
//							if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" and gs_rezago = "S" then
//								dw_impresion.Retrieve(al_otro_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,0)
//							elseif gs_rezago <> "S" then
//								dw_impresion.Retrieve(al_otro_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,0)
//							end if
//							if dw_impresion.rowcount()>0 then
//								IF PrintSetup() <> -1 THEN
////									if tab_1.tabpage_cheque.dw_detalle_pago_2.rowcount()>0 then
////										tab_1.tabpage_cheque.dw_detalle_pago_2.update()
////									end if
////									if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.rowcount()>0 then
////										tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.update()
////									end if
////									if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.rowcount()>0 then
////										tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.update()
////									end if
////									dw_impresion.Print()
//								END IF
//								Net_2		= MessageBox("Imprimir Documento", "Imprimió correctamente el documento " + as_tipo_cobro +" Nº " +String(al_folio) +" ?", Exclamation!, YesNo!, 2)
//							end if
//						end if
//					end if
//				end if
//				IF Net = 1 and net_2 = 1 THEN 
//					Commit using sqlca;
//					//Sale de la ventana
//					IF gs_rezago = "S" THEN 
//						ll_rut 			= long(substr(1,1,gs_string_cli_rezago))
//						ls_dv				= substr(1,2,gs_string_cli_rezago)
//						ls_nombre		= substr(1,3,gs_string_cli_rezago)
//						ls_ap_pat		= substr(1,4,gs_string_cli_rezago)
//						ls_ap_mat		= substr(1,5,gs_string_cli_rezago)
//						ls_direc			= substr(1,6,gs_string_cli_rezago)
//						ls_ciudad		= substr(1,7,gs_string_cli_rezago)
//						ls_comuna		= substr(1,8,gs_string_cli_rezago)
//						ls_fono			= substr(1,9,gs_string_cli_rezago)
//						ls_base			= substr(1,10,gs_string_cli_rezago)
//						ls_serie			= substr(1,11,gs_string_cli_rezago)
//						ll_numero		= long(substr(1,12,gs_string_cli_rezago))
//						ld_fecha			= idt_fecha_hoy
//						ldt_fecha_pago	= datetime(date(fechasys),time('00:00:00'))
//						SELECT 	"CLIENTE_REZAGO"."RUT"  
//						INTO 		:ll_rut_aux  
//						FROM 		"CLIENTE_REZAGO"  
//						WHERE 	"CLIENTE_REZAGO"."RUT" = :ll_rut   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							UPDATE	"CLIENTE_REZAGO"  
//							SET 		"RUT" = :ll_rut,   
//										"BASE" = :ls_base,   
//										"SERIE" = :ls_serie,   
//										"NUMERO" = :ll_numero,   
//										"NOMBRE" = :ls_nombre,   
//										"AP_PATERNO" = :ls_ap_pat,   
//										"AP_MATERNO" = :ls_ap_mat,   
//										"DIRECCION_PART" = :ls_direc,   
//										"COMUNA_PART" = :ls_comuna,   
//										"CIUDAD_PART" = :ls_ciudad,   
//										"TELEFONO_PART" = :ls_fono,   
//										"FECHA_CREA" = :ld_fecha,   
//										"USUARIO" = :gs_user,   
//										"DV" = :ls_dv,   
//										"COD_PAGO" = :gs_tipo_cobro,   
//										"FOLIO" = :gl_folio,   
//										"FECHA_PAGO" = :ldt_fecha_pago,   
//										"ESTADO" = 'A',   
//										"CAJA" = :gs_caja   
//							WHERE 	"CLIENTE_REZAGO"."RUT" = :ll_rut   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//	
//						elseif sqlca.sqlcode=100 then
//							INSERT INTO "CLIENTE_REZAGO"  
//									 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		 "FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO")  
//							VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero, :ls_nombre, :ls_ap_pat,   	 :ls_ap_mat,     :ls_direc,   		 :ls_comuna,   	:ls_ciudad,   	  :ls_fono,   		   :ld_fecha,   	 :gs_user,    :ls_dv, 	:gs_tipo_cobro, :gl_folio,	:gs_caja,'A',			:ldt_fecha_pago)  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//								messagebox("Error","Error al Grabar Cliente Rezago SQL: "+SQLCA.SQLErrText )
//							end if	
//						end if
//					end if
//					f_inicializa_ingreso(gs_tipo_cobro)
//					wf_limpiar_ventana_anterior_ingreso()
//				ELSE
//					Rollback using sqlca;
//					wf_limpiar_ventana_anterior_ingreso()
//				END IF
//			end if
//		end if
//		
//	// SEGUNDA OPCION
//	elseif as_tipo_cobro="BL" then
//		ll_res = MessageBox("Advertencia", "Se Imprime B.L. (BOLETA), Folio Nº: "+string(al_folio,"###,###,###,###,###")+" está preparada la Impresora!!!", &
//								Exclamation!, YesNo!, 2)
//		IF ll_res = 1 THEN
//			dw_impresion.DataObject	= 'd_rep_bl_traspaso_1'
//		end if
//		dw_impresion.GetChild('d_rep_detalle_bl', dwch_detalle_ci)
//		dwch_detalle_ci.SetTransObject(SQLCA)
//		dwch_detalle_ci.Retrieve(al_folio)
//		dw_impresion.GetChild('d_rep_bl_docu', dwch_doc_cob)
//		dwch_doc_cob.SetTransObject(SQLCA)
//		dwch_doc_cob.Retrieve(al_folio)
//		dw_impresion.SetTransObject(SQLCA)
//		ll_row = w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.Find("tipo_cob='F' or tipo_cob='N' or tipo_cob='M'", 1, w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.RowCount() )
//		IF ll_row > 0 THEN
//			if w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.rowcount() > 0 then
//				CHOOSE CASE gs_base
//					CASE 'O'//Promesa
//						if gd_fecha_prox_pago=date('01/01/1900') then
//							dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//							string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "c_prox_pago_anno") - 1) +&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						else
//							ll_anno			= year( date(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.getitemdatetime(1,'oferta_v_fecha_m') ))
//							ll_cta_pag_m	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, 'oferta_v_cta_pag_m')
//							ll_anno_m		= ll_anno + ll_cta_pag_m
//							dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//							string(al_n_cuotas+ll_anno_m - 1) +&
//							'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						end if
//					CASE 'C'//Contratos
//						if gd_fecha_prox_pago=date('01/01/1900') then
//							dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//							string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "c_prox_pago_anno") - 1)+&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						else
//							ll_anno			= year( date(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.getitemdatetime(1,'contrato_fecha_m') ))
//							ll_cta_pag_m	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, 'contrato_cta_pag_m')
//							ll_anno_m		= ll_anno + ll_cta_pag_m
//							dw_impresion.object.cuota.text	= 'Última Cta.Mant.Anual Pagada Año '+&
//							string(al_n_cuotas+ll_anno_m - 1)+&
//							'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						end if
//					CASE 'R'//Repactacion cuota de mantencion
//						if gd_fecha_prox_pago=date('01/01/1900') then
//							dw_impresion.object.cuota.text	= 'Cuota N° '+&
//							string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "ctas_pagadas"))+&
//							' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "cuotas_pactadas") )+&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						else
//							dw_impresion.object.cuota.text	= 'Cuota N° '+&
//							string(al_n_cuotas+w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "ctas_pagadas"))+&
//							' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "cuotas_pactadas") )+&
//							'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//							'        hora('+string(fechasys,"hh:mm")+')'
//						end if
//				END CHOOSE
//			end if
//			IF gs_rezago = "S" THEN 
//				if isnull(gs_nombre_completo) or gs_nombre_completo='' then Open(w_ingresar_nombre)
//				ls_doc	= gs_contrato_rezago
//			ELSE
//				ls_doc 	= (gs_base+gs_serie+String(gi_numero))
//			END IF
//			if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" and gs_rezago = "S" then
//				dw_impresion.Retrieve(al_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,al_otro_folio,as_otro_tipo_cobro)
//			elseif gs_rezago <> "S" then
//				dw_impresion.Retrieve(al_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,al_otro_folio,as_otro_tipo_cobro)
//			end if
//			if dw_impresion.rowcount()>0 then
//				IF PrintSetup() <> -1 THEN
////					if tab_1.tabpage_cheque.dw_detalle_pago_2.rowcount()>0 then
////						tab_1.tabpage_cheque.dw_detalle_pago_2.update()
////					end if
////					if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.rowcount()>0 then
////						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.update()
////					end if
////					if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.rowcount()>0 then
////						tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.update()
////					end if
////					dw_impresion.Print()
//				END IF
//				Net							= MessageBox("Imprimir Documento", "Imprimió correctamente el documento " + as_tipo_cobro +" Nº " +String(al_folio) +" ?", Exclamation!, YesNo!, 2)
//			end if
//		end if
//		if as_otro_tipo_cobro="CI" and net=1 then
//			ll_res 							= MessageBox("Advertencia", "Se Imprime C.I. (COMPROBANTE DE INGRESO), Folio Nº: "+string(al_folio,"###,###,###,###,###")+" está preparada la Impresora!!!", &
//						Exclamation!, YesNo!, 2)
//			IF ll_res = 1 THEN
//				dw_impresion.DataObject	= 'd_rep_ci_traspaso_2' //d_rep_ci
//			end if
//			dw_impresion.GetChild('d_rep_detalle_ci', dwch_detalle_ci)
//			dwch_detalle_ci.SetTransObject(SQLCA)
//			dwch_detalle_ci.Retrieve(al_folio)
//			dw_impresion.GetChild('d_rep_ci_docu', dwch_doc_cob)
//			dwch_doc_cob.SetTransObject(SQLCA)
//			dwch_doc_cob.Retrieve(al_folio)
//			dw_impresion.SetTransObject(SQLCA)
//			ll_row = w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='I'", 1, w_ingreso.tab_ingreso.tp_traspaso.dw_detalle_ci_2.RowCount() )
//			IF ll_row > 0 THEN
//				if w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.rowcount() > 0 then
//					select  sysdate into :fechasys from tasa;
//					CHOOSE CASE gs_base
//						CASE 'O'//Promesa
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'L'//Liberador
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'P'//Pagare
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pagare_plazo") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "pagare_plazo") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//						CASE 'D'// Derecho
//							ll_cuotas_pag	= w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "oferta_v_cta_pag_s")
//							ll_cuotas_pag	= ll_cuotas_pag + al_n_cuotas
//							if gd_fecha_prox_pago=date('01/01/1900') then
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "derecho_plazo") )+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							else
//								dw_impresion.object.cuota.text	= 'Cuota N° '+&
//								string(ll_cuotas_pag)+' de '+string(w_ingreso.tab_ingreso.tp_traspaso.dw_datos_ci_2.GetItemNumber(1, "derecho_plazo") )+&
//								'        Fecha Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
//								'        hora('+string(fechasys,"hh:mm")+')'
//							end if
//					END CHOOSE
//				end if
//				IF gs_rezago = "S" THEN 
//					if isnull(gs_nombre_completo) or gs_nombre_completo='' then Open(w_ingresar_nombre)
//					ls_doc	= gs_contrato_rezago
//				ELSE
//					ls_doc	= (gs_base+gs_serie+String(gi_numero))
//				END IF
//				if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" and gs_rezago = "S" then
//					dw_impresion.Retrieve(al_otro_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,0,al_folio,as_otro_tipo_cobro)
//				elseif gs_rezago <> "S" then
//					dw_impresion.Retrieve(al_otro_folio,ls_doc,gi_rut,ls_dver,gs_nombre_completo,Date(gd_hoy),gd_uf,0,al_folio,as_otro_tipo_cobro)
//				end if
//				/////////////// Imprimir
//				if dw_impresion.rowcount()>0 then
//					IF PrintSetup() <> -1 THEN
////						if tab_1.tabpage_cheque.dw_detalle_pago_2.rowcount()>0 then
////							tab_1.tabpage_cheque.dw_detalle_pago_2.update()
////						end if
////						if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.rowcount()>0 then
////							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_2.update()
////						end if
////						if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.rowcount()>0 then
////							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_2.update()
////						end if
////						dw_impresion.Print()
//					END IF
//					Net_2		= MessageBox("Imprimir Documento", "Imprimió correctamente el documento " + as_tipo_cobro +" Nº " +String(al_folio) +" ?", Exclamation!, YesNo!, 2)
//				end if
//			end if
//			IF Net = 1 and net_2 = 1 THEN 
//				Commit using sqlca;
//				//Sale de la ventana
//				IF gs_rezago = "S" THEN 
//					ll_rut 			= long(substr(1,1,gs_string_cli_rezago))
//					ls_dv				= substr(1,2,gs_string_cli_rezago)
//					ls_nombre		= substr(1,3,gs_string_cli_rezago)
//					ls_ap_pat		= substr(1,4,gs_string_cli_rezago)
//					ls_ap_mat		= substr(1,5,gs_string_cli_rezago)
//					ls_direc			= substr(1,6,gs_string_cli_rezago)
//					ls_ciudad		= substr(1,7,gs_string_cli_rezago)
//					ls_comuna		= substr(1,8,gs_string_cli_rezago)
//					ls_fono			= substr(1,9,gs_string_cli_rezago)
//					ls_base			= substr(1,10,gs_string_cli_rezago)
//					ls_serie			= substr(1,11,gs_string_cli_rezago)
//					ll_numero		= long(substr(1,12,gs_string_cli_rezago))
//					ld_fecha			= idt_fecha_hoy
//					ldt_fecha_pago	= datetime(date(fechasys),time('00:00:00'))
//					SELECT 	"CLIENTE_REZAGO"."RUT"  
//					INTO 		:ll_rut_aux  
//					FROM 		"CLIENTE_REZAGO"  
//					WHERE 	"CLIENTE_REZAGO"."RUT" = :ll_rut   
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						UPDATE	"CLIENTE_REZAGO"  
//						SET 		"RUT" = :ll_rut,   
//									"BASE" = :ls_base,   
//									"SERIE" = :ls_serie,   
//									"NUMERO" = :ll_numero,   
//									"NOMBRE" = :ls_nombre,   
//									"AP_PATERNO" = :ls_ap_pat,   
//									"AP_MATERNO" = :ls_ap_mat,   
//									"DIRECCION_PART" = :ls_direc,   
//									"COMUNA_PART" = :ls_comuna,   
//									"CIUDAD_PART" = :ls_ciudad,   
//									"TELEFONO_PART" = :ls_fono,   
//									"FECHA_CREA" = :ld_fecha,   
//									"USUARIO" = :gs_user,   
//									"DV" = :ls_dv,   
//									"COD_PAGO" = :gs_tipo_cobro,   
//									"FOLIO" = :gl_folio,   
//									"FECHA_PAGO" = :ldt_fecha_pago,   
//									"ESTADO" = 'A',   
//									"CAJA" = :gs_caja   
//						WHERE 	"CLIENTE_REZAGO"."RUT" = :ll_rut   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
//
//					elseif sqlca.sqlcode=100 then
//						INSERT INTO "CLIENTE_REZAGO"  
//								 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		 "FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO")  
//						VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero, :ls_nombre, :ls_ap_pat,   	 :ls_ap_mat,     :ls_direc,   		 :ls_comuna,   	:ls_ciudad,   	  :ls_fono,   		   :ld_fecha,   	 :gs_user,    :ls_dv, 	:gs_tipo_cobro, :gl_folio,	:gs_caja,'A',			:ldt_fecha_pago)  
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//							messagebox("Error","Error al Grabar Cliente Rezago SQL: "+SQLCA.SQLErrText )
//						end if	
//					end if
//				end if
//				f_inicializa_ingreso(gs_tipo_cobro)
//				wf_limpiar_ventana_anterior_ingreso()
//			ELSE
//				Rollback using sqlca;
//				wf_limpiar_ventana_anterior_ingreso()
//			END IF
//		end if
//	end if
//end if
end subroutine

public subroutine wf_limpiar_ventana_anterior_ingreso ();if isvalid(w_ingreso2) then
	CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
		CASE 1 //Cupón
			w_ingreso2.wf_limpiar_opciones() 
			w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.setfocus()
		CASE 2 //Comprobante Ingreso
			w_ingreso2.wf_limpiar_opciones()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rs_a_paterno", "")
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rs_a_materno", "")
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rs_nombre", "")
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rn_contrato","")
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rl_rut","")
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetItem(1,"rs_bs","")
//			setnull(il_cantidad_malo)
			w_ingreso2.tab_ingreso.tp_ci.cb_ci_insertar.Enabled 						= FALSE
			w_ingreso2.tab_ingreso.tp_ci.cb_ci_borrar_item.Enabled 				= FALSE
			w_ingreso2.tab_ingreso.tp_ci.cb_ingresar_pago_ci.Enabled 			= FALSE
			w_ingreso2.tab_ingreso.tp_ci.sle_numero_ci.Enabled 					= FALSE
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.enabled			= true
			w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.visible								= false
			w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.visible							= false
			w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked								= false
			w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked							= false
			//setnull(gs_base);setnull(gs_serie);setnull(gi_numero)
			gs_filtro																				= ''
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Reset()
			w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.Reset()
			w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.Reset()
			w_ingreso2.tab_ingreso.tp_ci.sle_numero_ci.text 							= ""
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.reset()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.insertrow(0)
			w_ingreso2.dw_encabezado_ingreso_cupon.Reset()
			w_ingreso2.dw_detalle_pago_cupon2.Reset()
			w_ingreso2.dw_dias_mora.Reset()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.enabled			= true
			w_ingreso2.tab_ingreso.tp_ci.cbx_sin_mora_ci.checked					= false
			w_ingreso2.tab_ingreso.tp_ci.cbx_sin_gastos_ci.checked				= false
			w_ingreso2.tab_ingreso.tp_ci.cbx_sin_mora_ci.enabled					= false
			w_ingreso2.tab_ingreso.tp_ci.cbx_sin_gastos_ci.enabled					= false
			w_ingreso2.st_aviso_ap.visible													= false
			//wf_limpiar_opciones()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setfocus()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setcolumn('rl_rut')
			Setnull(gs_grabar_pie)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setfocus()
		CASE 3 //Boletas
			w_ingreso2.wf_limpiar_opciones()
			w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setfocus()
//		CASE 4 //Boleta Reprog.Cta.Mant.
//			w_ingreso2.wf_limpiar_opciones()
//			w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.setfocus()
//		CASE 5 //Pago Traspaso a Empresa
//			w_ingreso2.wf_limpiar_opciones()
//			w_ingreso2.tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.setfocus()
	END CHOOSE
end if
end subroutine

public function integer f_inicializa_ingreso (string as_tipo_cob);CHOOSE CASE as_tipo_cob
	CASE "CU"
		w_ingreso2.tab_ingreso.tp_cupon.cb_limpiar_cupon.triggerevent(clicked!)
	CASE "CI"
		w_ingreso2.tab_ingreso.tp_ci.cb_ci_borrar.triggerevent(clicked!)
	CASE "FE","FA","BE","BA"
		w_ingreso2.tab_ingreso.tp_boletas.cb_bl_borrar.triggerevent(clicked!)
END CHOOSE
w_ingreso2.dw_encabezado_ingreso_cupon.Reset()
RETURN 0
end function

public function integer f_ingresar_doc (long al_n_cheque, long al_cod_banco, double ld_monto, datetime ad_fecha_venc, string as_cod_pago, long al_n_cheques, long al_cod_tarjeta_credito, long al_nro_cuotas_credito, string as_cod_autoriza_credito, long al_tipo_tarjeta_credito, long al_cod_tarjeta_debito, string as_cod_autoriza_debito, long al_cod_banco_debito);String		ls_traspaso,ls_hora,ls_cod_emp,ls_tipo_cob_aux,ls_estado_ch,ls_tipo_cob,ls_fecha_pago_palabra,ls_nro_contrato,ls_paga_con,ls_vuelto,ls_proximo_pago,&
			ls_monto_total_palabra,ls_pago_ef, ls_pago_ch, ls_pago_tc, ls_pago_td,ls_reingreso,ls_tipo_cob_cu,ls_mov_det,ls_tipo_doc_h,ls_sociedad,ls_llave_ctto_mp
Long		ll_pago_cred,ll_hora_pago,ll_minuto_pago,ll_cod_parque,ll_sum_ef,ll_sum_ch,ll_count_ch,ll_sum_tc,ll_count_tc,ll_sum_td,ll_tot_reg_mp,ll_fila_mov_mp,ll_indi_mp
Double	ld_factor,ll_total,ll_monto_total_h,ll_val_det_h,ll_cupon_h
Datetime	ldt_fecha_hora

if gs_reingreso_ci = 'S' then 
	ls_reingreso					= gs_reingreso_ci
elseif gs_reingreso_be = 'S' then 
	ls_reingreso					= gs_reingreso_be
else
	ls_reingreso					= 'N'
end if
ll_total							= long(st_total.text)
ls_tipo_cob_cu					= 'CU'
gs_tipo_cobro					= trim(st_tipo_cobro.text)
gd_hoy 							= Datetime(idt_fecha_hoy)
SELECT sysdate INTO :ldt_fecha_hora FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ls_hora							= string(ldt_fecha_hora,"hh:mm")
ll_hora_pago					= long(mid(ls_hora,1,2))
ll_minuto_pago					= long(mid(ls_hora,4,2))
if gs_base='F' then			//or gs_base='G' or gs_base='V'
	gs_tipo_cobro_aux			= 'BA'
	ls_sociedad					= 'CL04'
end if
if gs_tipo_cobro_aux = 'BA' then
	ls_sociedad					= 'CL04'
else
	if gs_conexion = 'Parque El Prado' then 
		ls_sociedad				= 'CL02'
	else
		ls_sociedad				= 'CL03'
	end if
	
end if
//if isvalid(w_ingreso2) then
//	if w_ingreso2.tab_ingreso.SelectedTab=5 then ls_traspaso='S'
//end if
if tab_1.tabpage_credito.rb_cred.checked = true then
	ll_pago_cred				= 1
elseif tab_1.tabpage_credito.rb_prom.checked = true then
	ll_pago_cred				= 2
elseif tab_1.tabpage_credito.rb_comer.checked = true then
	ll_pago_cred				= 3
elseif tab_1.tabpage_credito.rb_tienda_cred.checked = true then
	ll_pago_cred				= 4
elseif tab_1.tabpage_credito.rb_tienda_ctdo.checked = true then
	ll_pago_cred				= 5
end if
if gs_base='F' then
	ls_tipo_cob_aux			= 'FA'
else
	ls_tipo_cob_aux			= st_tipo_cobro.text
end if
if as_cod_pago='CH' then 
	if tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '1' or &
		tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '2' or &
		tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '6' then //Administradora
//		ls_tipo_cob_aux		= st_tipo_cobro.text	//'BL'
	else // Inmobiliaria
		if st_tipo_cobro.text='CU' then
			if gs_empresa = 'Santiago' then
				if gs_base='C' or gs_base='R' then
//					ls_tipo_cob_aux	= 'BL'
				else
//					ls_tipo_cob_aux	= 'CU'
				end if
			else
//				ls_tipo_cob_aux		= 'CU'
			end if
		else
//			ls_tipo_cob_aux			= 'CI'
		end if
	end if
end if
if as_cod_pago='TC' then 
	if tab_1.tabpage_credito.rb_empresa_1.checked=true then
		ls_cod_emp						= mid(trim(tab_1.tabpage_credito.rb_empresa_1.text),1,1)
	elseif tab_1.tabpage_credito.rb_empresa_2.checked=true then
		ls_cod_emp						= mid(trim(tab_1.tabpage_credito.rb_empresa_2.text),1,1)
	else
		ls_cod_emp						= '0'
	end if
	if ls_cod_emp='A' then
//		ls_tipo_cob_aux				= 'BL'
	else
		if st_tipo_cobro.text='CU' then
			if gs_empresa = 'Santiago' then
				if gs_base='C' or gs_base='R' then
//					ls_tipo_cob_aux	= 'BL'
				else
//					ls_tipo_cob_aux	= 'CU'
				end if
			else
//				ls_tipo_cob_aux		= 'CU'
			end if
		else
//			ls_tipo_cob_aux			= 'CI'
		end if
	end if
end if
if as_cod_pago='TD' then
	if tab_1.tabpage_debito.rb_empresa_3.checked=true then
		ls_cod_emp						= mid(trim(tab_1.tabpage_debito.rb_empresa_3.text),1,1)
	elseif tab_1.tabpage_debito.rb_empresa_4.checked=true then
		ls_cod_emp						= mid(trim(tab_1.tabpage_debito.rb_empresa_4.text),1,1)
	else
		ls_cod_emp						= '0'
	end if
	if ls_cod_emp='A' then
//		ls_tipo_cob_aux				= 'BL'
	else
		if st_tipo_cobro.text='CU' then
			if gs_empresa = 'Santiago' then
				if gs_base='C' or gs_base='R' then
//					ls_tipo_cob_aux	= 'BL'
				else
//					ls_tipo_cob_aux	= 'CU'
				end if
			else
//				ls_tipo_cob_aux		= 'CU'
			end if
		else
//			ls_tipo_cob_aux			= 'CI'
		end if
	end if
end if
if as_cod_pago='EF' then
	if gs_base='F' then
		ls_tipo_cob_aux				= 'FA'
	else
		if gs_base <> 'V' then ls_tipo_cob_aux = gs_tipo_cobro
	end if
	if st_tipo_cobro.text='CU' and gs_empresa = 'Santiago' then
		if gs_base='C' or gs_base='R' then
//			ls_tipo_cob_aux			= 'BL'
		end if
	end if
end if
if isnull(ls_tipo_cob_aux) or ls_tipo_cob_aux='' then
	if gs_base='F' then
		ls_tipo_cob_aux				= 'FA'
	else
		if gs_base <> 'V' then ls_tipo_cob_aux = gs_tipo_cobro
	end if
end if
if as_cod_pago='EF' or as_cod_pago='TC' or as_cod_pago='TD' then
	ls_estado_ch	= 'C'
elseif as_cod_pago='CH' then
	ls_estado_ch	= 'V'
end if
SELECT		"CADENA"."COD_PARQUE"  
INTO 			:ll_cod_parque  
FROM 		"CADENA"  
WHERE     ( "CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero )   
USING		sqlca;
if sqlca.sqlcode <> 0 then
	SELECT	DISTINCT "CLIENTE_REZAGO"."COD_PARQUE"  
	INTO 		:ll_cod_parque  
	FROM 	"CLIENTE_REZAGO"  
	WHERE ( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
			  ( "CLIENTE_REZAGO"."COD_PARQUE" > 0 )
	USING	sqlca;
	if isnull(ll_cod_parque) or ll_cod_parque=0 then ll_cod_parque = gl_cod_parque_rezago
end if
if il_max_folio_new = 0 and gl_folio=0 then
	SELECT 	MAX("INGRESO_NEWSING"."FOLIO")
	INTO 		:il_max_folio_new  
	FROM 	"INGRESO_NEWSING"  
	WHERE ( "INGRESO_NEWSING"."TIPO_COB" = :gs_tipo_cobro ) 
	USING	sqlca;
	if isnull(il_max_folio_new) or il_max_folio_new=0 then il_max_folio_new=0
	il_max_folio_new ++
end if
if gs_tipo_cobro='CU' then
//	ls_tipo_cob		= 'BE'
	if gs_base='B' then
		SELECT		"FACTURAS_CADENA"."COD_PARQUE"  
		INTO 			:ll_cod_parque  
		FROM 		"FACTURAS_CADENA"  
		WHERE     ( "FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
					  ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
					  ( "FACTURAS_CADENA"."NUMERO" = :gi_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO	"FACTURAS_DOCUMENTOS"  
						 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH")  
			VALUES 	 ( :gl_folio, :ls_tipo_cob,		:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch)
			USING		sqlca ;
		end if
	else
		if gl_folio > 0 then
			INSERT INTO	"DOC_COB"  
						 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  "FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
			VALUES 	 ( :gl_folio, 	:ls_tipo_cob,	:al_n_cheque,	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
			USING			sqlca	;
			
			INSERT INTO	"DOCUMENTOS"  
						 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON"	)  
			VALUES 	 ( :gl_folio, 	:ls_tipo_cob,	:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ld_monto,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio)
			USING		sqlca ;
			
		else
			INSERT INTO	"DOCUMENTOS_NEWSING"  
						 ( "FOLIO"  , 			"TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"		)  
			VALUES 	 ( :il_max_folio_new, 	:gs_tipo_cobro,		:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ld_monto,		:ls_reingreso)
			USING		sqlca ;
		end if
	end if
else
	if gs_base='B' then
		SELECT		"FACTURAS_CADENA"."COD_PARQUE"  
		INTO 			:ll_cod_parque  
		FROM 		"FACTURAS_CADENA"  
		WHERE     ( "FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
					  ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
					  ( "FACTURAS_CADENA"."NUMERO" = :gi_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO	"FACTURAS_DOCUMENTOS"  
						 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH")  
			VALUES 	 ( :gl_folio, :gs_tipo_cobro,	:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch)
			USING		sqlca ;
		end if;
	else
		if gl_folio > 0 then
			if gs_base='M' then
				INSERT INTO	"DOC_COB"  
							 ( "FOLIO"  , "TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  "FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
				VALUES 	 ( :gl_folio, 'CX',					:al_n_cheque,	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
				USING			sqlca	;
				
				INSERT INTO	"DOCUMENTOS"  
							 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",	"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON")  
				VALUES 	 ( :gl_folio, 'CX',					:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ld_monto,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio)
				USING		sqlca ;
			else
				INSERT INTO	"DOC_COB"  
							 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  "FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
				VALUES 	 ( :gl_folio, :gs_tipo_cobro,	:al_n_cheque,	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
				USING			sqlca	;
				
				INSERT INTO	"DOCUMENTOS"  
							 ( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",	"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON")  
				VALUES 	 ( :gl_folio, :gs_tipo_cobro,	:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ld_monto,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio)
				USING		sqlca ;
			end if
			if gs_base='M' then
				ls_llave_ctto_mp					= gs_base+gs_serie+string(gi_numero)		
				ll_tot_reg_mp						= dw_multiproducto.rowcount()
				ll_fila_mov_mp						= dw_multiproducto.find( "tipo_mov = 'E'", 1, ll_tot_reg_mp )
				if ll_fila_mov_mp > 0 then
					for ll_indi_mp=ll_fila_mov_mp to ll_tot_reg_mp
						ls_mov_det					= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
						if ls_mov_det='E' then
							ll_monto_total_h		= dw_multiproducto.getitemnumber(ll_indi_mp,'c_sum_porctto_peso')		//'totalcto')
							ll_val_det_h				= round((ll_monto_total_h * ld_monto) / ll_total,0)
							ll_cupon_h				= dw_multiproducto.getitemnumber(ll_indi_mp,'nro_cupon')
							ls_tipo_doc_h			= dw_multiproducto.getitemstring(ll_indi_mp,'tipodoc')
							if ls_tipo_doc_h='CI' then
								INSERT INTO	"DOC_COB"  
											 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
								VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
								USING		sqlca	;
								
								INSERT INTO	"DOCUMENTOS"  
											 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
								VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,		:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
								USING		sqlca ;
							elseif ls_tipo_doc_h <> 'CI' then
								INSERT INTO	"DOC_COB"  
											 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
								VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
								USING		sqlca	;
								
								INSERT INTO	"DOCUMENTOS"  
											 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
								VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,				:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
								USING		sqlca ;
								
								INSERT INTO	"DOCUMENTOS_NEWSING"  
											 ( "FOLIO"  , 	"TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"		)  
								VALUES 	 ( :ll_cupon_h, 	'CU',					:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ll_val_det_h,		:ls_reingreso)
								USING		sqlca ;
							end if
						end if
					next
				else
					ll_fila_mov_mp	= dw_multiproducto.find( "tipo_mov='A'", 1, ll_tot_reg_mp)
					if ll_fila_mov_mp > 0 then
						for ll_indi_mp=ll_fila_mov_mp to ll_tot_reg_mp
							ls_mov_det					= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
							if ls_mov_det='A' then
								ll_monto_total_h		= dw_multiproducto.getitemnumber(ll_indi_mp,'c_sum_porctto_peso')		//'totalcto')
								ll_val_det_h				= round((ll_monto_total_h * ld_monto) / ll_total,0)
								ll_cupon_h				= dw_multiproducto.getitemnumber(ll_indi_mp,'nro_cupon')
								ls_tipo_doc_h			= dw_multiproducto.getitemstring(ll_indi_mp,'tipodoc')
								if ls_tipo_doc_h='CI' then
									INSERT INTO	"DOC_COB"  
												 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
									VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
									USING		sqlca	;
									
									INSERT INTO	"DOCUMENTOS"  
												 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",		"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
									VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,		:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,				:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
									USING		sqlca ;
								elseif ls_tipo_doc_h <> 'CI' then

									INSERT INTO	"DOC_COB"  
												 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
									VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
									USING		sqlca	;
									
									INSERT INTO	"DOCUMENTOS"  
												 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
									VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,				:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
									USING		sqlca ;
									
									INSERT INTO	"DOCUMENTOS_NEWSING"  
												 ( "FOLIO"  , 	"TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"		)  
									VALUES 	 ( :ll_cupon_h, 	'CU',					:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ll_val_det_h,		:ls_reingreso)
									USING		sqlca ;
								end if
							end if
						next
					else
						ll_fila_mov_mp	= dw_multiproducto.find( "tipo_mov='F'", 1, ll_tot_reg_mp)
						if ll_fila_mov_mp > 0 then
							for ll_indi_mp=ll_fila_mov_mp to ll_tot_reg_mp
								ls_mov_det				= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
								if ls_mov_det='F' then
									ll_monto_total_h		= dw_multiproducto.getitemnumber(ll_indi_mp,'c_sum_porctto_peso')		//'totalcto')
									ll_val_det_h				= round((ll_monto_total_h * ld_monto) / ll_total,0)
									ll_cupon_h				= dw_multiproducto.getitemnumber(ll_indi_mp,'nro_cupon')
									ls_tipo_doc_h			= dw_multiproducto.getitemstring(ll_indi_mp,'tipodoc')
									if ls_tipo_doc_h='CI' then
										INSERT INTO	"DOC_COB"  
													 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
										VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
										USING		sqlca	;
										
										INSERT INTO	"DOCUMENTOS"  
													 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
										VALUES 	 ( :gl_folio, 		:ls_tipo_doc_h,	:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,				:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
										USING		sqlca ;
									elseif ls_tipo_doc_h <> 'CI' then
										INSERT INTO	"DOC_COB"  
													 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPASO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
										VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque,	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc,	:as_cod_pago , :al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,	:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux)
										USING		sqlca	;
										
										INSERT INTO	"DOCUMENTOS"  
													 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",		"MONTO_UF",		"REINGRESO",	"SOCIEDAD",	"TIPO_COB_ORIGINAL",	"NRO_CUPON",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
										VALUES 	 ( :ll_cupon_h, 'CU',				:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,						:ll_val_det_h,		:ls_reingreso,	:ls_sociedad,	:gs_tipo_cobro,				:gl_folio,				:ls_llave_ctto_mp,		'CX',					:gl_folio,			:gd_hoy)
										USING		sqlca ;
										
										INSERT INTO	"DOCUMENTOS_NEWSING"  
													 ( "FOLIO"  , 	"TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,		"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"		)  
										VALUES 	 ( :ll_cupon_h, 	'CU',					:al_n_cheque, 	:al_cod_banco , 	:ll_val_det_h, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ll_val_det_h,		:ls_reingreso)
										USING		sqlca ;
									end if
								end if
							next
//						else
//							if gs_rezago='S' then
//								DECLARE x1 CURSOR FOR  
//								SELECT 	"MPPRODUCTO"."CODIGOMP", 	"MPPRODUCTO"."PORCENTAJEPIE", 	"MPPRODUCTODET"."BASE", 	"MPPRODUCTODET"."PORCSUBTOTALIMP"  
//								FROM 	"MPPRODUCTO",   "MPPRODUCTODET"  
//								WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
//											( "MPPRODUCTO"."CODIGOMP" = 1 )  ;	
//								open x1;
//								QUE HACER ACA
//								
//								close x1;
//							end if
							
						end if
					end if
				end if
			end if
		else
			INSERT INTO	"DOCUMENTOS_NEWSING"  
						 ( "FOLIO"  , 			"TIPO_COB"    , 	"N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_CH",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"		)  
			VALUES 	 ( :il_max_folio_new, 	:gs_tipo_cobro,		:al_n_cheque, 	:al_cod_banco , 	:ld_monto, 	:ad_fecha_venc, 	:as_cod_pago, 	:al_n_cheques , 	:gs_rezago, :gd_hoy     , 	:gs_caja,			:al_cod_tarjeta_credito,			:al_nro_cuotas_credito,		:as_cod_autoriza_credito,			:al_tipo_tarjeta_credito,			:al_cod_tarjeta_debito,		:as_cod_autoriza_debito,			:al_cod_banco_debito,	:ls_traspaso,			:ll_pago_cred,								:ll_hora_pago,		:ll_minuto_pago,	:ls_cod_emp,				:gs_tipo_cobro_aux,	:ls_estado_ch,		:gd_hoy,					:ld_monto,		:ls_reingreso)
			USING		sqlca ;
		end if
	end if
end if
commit;
RETURN 0
end function

public subroutine wf_recalcular_valores ();Long 	ll_efectivo=0, ll_saldo,id_saldo,id_resto,ll_valor,ll_abono

ll_saldo					= il_abono
tab_1.tabpage_cheque.dw_detalle_pago_1.accepttext()
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.accepttext()
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.accepttext()
if cbx_cheque.Checked=true AND tab_1.tabpage_cheque.dw_detalle_pago_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + ROUND(tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1 , "c_total"),0)
end if
if cbx_tarjeta_debito.Checked=true AND tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + ROUND(tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1 , "c_total"),0)
end if
if cbx_tarjeta_credito.Checked=true AND tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + ROUND(tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1 , "c_total"),0)
end if
st_saldo.text			= String(ll_saldo, "###,###,###,###,##0")
ll_efectivo 			= long(sle_efectivo.text)
id_resto					= gd_total - (ll_saldo + ll_efectivo)
em_saldo.text			= string(id_resto, "###,###,###,###,##0")
//if cbx_efectivo.Checked=true and ll_efectivo > 0 THEN
//	ll_abono				= long(st_saldo.text)
//	ll_valor				= gd_total - (ll_abono + ll_efectivo)
//	em_saldo.text		= string(ll_saldo,"###,###,###,###,##0")
//end if
end subroutine

public subroutine wf_grabar_trans_abono_ok ();Long	ll_count_1,ll_count_2

SELECT 	Count("ABONO_CTA_CTE"."BASE")
INTO		:ll_count_1
FROM		"ABONO_CTA_CTE"
WHERE  ( "ABONO_CTA_CTE"."BASE" = :gs_base ) AND  
		 ( "ABONO_CTA_CTE"."SERIE" = :gs_serie ) AND  
		 ( "ABONO_CTA_CTE"."NUMERO" = :gi_numero ) AND  
		 ( "ABONO_CTA_CTE"."TIPO_COB" = :gs_tipo_cobro ) AND  
		 ( "ABONO_CTA_CTE"."FOLIO" = :gl_folio ) AND  
		 ( "ABONO_CTA_CTE"."ESTADO_REG" = 'P' ) 
USING		sqlca;
if ll_count_1 > 0 then
	UPDATE	"ABONO_CTA_CTE"  
	SET 		"SW_ESTADO_TRANS" = 3  
	WHERE  ( "ABONO_CTA_CTE"."BASE" = :gs_base ) AND  
			 ( "ABONO_CTA_CTE"."SERIE" = :gs_serie ) AND  
			 ( "ABONO_CTA_CTE"."NUMERO" = :gi_numero ) AND  
			 ( "ABONO_CTA_CTE"."TIPO_COB" = :gs_tipo_cobro ) AND  
			 ( "ABONO_CTA_CTE"."FOLIO" = :gl_folio ) AND  
			 ( "ABONO_CTA_CTE"."ESTADO_REG" = 'P' )   
	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	//	messagebox("Error Grabar","Error Actualizar Estado Trans ABONO SQL: "+sqlca.sqlerrtext)
//	end if
end if

SELECT	Count("ABONO_CTA_CTE"."BASE")
INTO		:ll_count_2
FROM		"ABONO_CTA_CTE"
WHERE  ( "ABONO_CTA_CTE"."BASE" = :gs_base ) AND  
		 ( "ABONO_CTA_CTE"."SERIE" = :gs_serie ) AND  
		 ( "ABONO_CTA_CTE"."NUMERO" = :gi_numero ) AND  
		 ( "ABONO_CTA_CTE"."TIPO_COB_OCUPA" = :gs_tipo_cobro ) AND  
		 ( "ABONO_CTA_CTE"."FOLIO_OCUPA" = :gl_folio ) AND  
		 ( "ABONO_CTA_CTE"."ESTADO_REG" = 'O' )   
USING		sqlca;
if ll_count_2 > 0 then
	UPDATE	"ABONO_CTA_CTE"  
	SET 		"SW_ESTADO_TRANS" = 3  
	WHERE  ( "ABONO_CTA_CTE"."BASE" = :gs_base ) AND  
			 ( "ABONO_CTA_CTE"."SERIE" = :gs_serie ) AND  
			 ( "ABONO_CTA_CTE"."NUMERO" = :gi_numero ) AND  
			 ( "ABONO_CTA_CTE"."TIPO_COB_OCUPA" = :gs_tipo_cobro ) AND  
			 ( "ABONO_CTA_CTE"."FOLIO_OCUPA" = :gl_folio ) AND  
			 ( "ABONO_CTA_CTE"."ESTADO_REG" = 'O' )   
	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	//	messagebox("Error Grabar","Error Actualizar Estado Trans ABONO SQL: "+sqlca.sqlerrtext)
//	end if
end if
end subroutine

public function long f_actualizar_saldo ();double ll_efectivo=0, ll_saldo=0,id_saldo,ll_abono,ll_monto_saldo

gs_tipo_cobro			= trim(st_tipo_cobro.text)
st_saldo.text			= '0'
sle_efectivo.text		= '0'
IF cbx_cheque.Checked=true AND tab_1.tabpage_cheque.dw_detalle_pago_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1 , "c_total")
END IF
IF cbx_tarjeta_debito.Checked=true AND tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1 , "c_total")
END IF
IF cbx_tarjeta_credito.Checked=true AND tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.RowCount() > 0 THEN
	ll_saldo				= ll_saldo + tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1 , "c_total")
END IF
IF cbx_efectivo.Checked=true THEN
	ll_efectivo 		= gd_total - ll_saldo
END IF
st_saldo.text			= String(ll_saldo, "###,###,###,###,##0")
if cbx_efectivo.checked=true and (cbx_cheque.checked=true or cbx_tarjeta_credito.checked=true or cbx_tarjeta_debito.checked=true) then
	sle_efectivo.text	= string(ll_efectivo,"###,###,###,###,##0")
end if
if (long(st_saldo.text) + long(sle_efectivo.text)) = long(st_total.text) then
	em_saldo.text		= '0'
else
//	gd_total
	ll_abono				= long(st_saldo.text)
	ll_monto_saldo		= long(em_saldo.text)
end if
// Cheched=True
if cbx_efectivo.checked=True and long(sle_efectivo.text) <= 0 then
	messagebox("Advertencia","Monto Efectivo debe ser Mayor a 0")
	sle_efectivo.setfocus()
elseif cbx_cheque.checked=true and tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount() = 0 then
	messagebox("Advertencia","debe Ingresar Detalle de Cheques")
	tab_1.tabpage_cheque.em_cantidad_1.setfocus()
elseif cbx_tarjeta_credito.checked=True and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount() = 0 then
	messagebox("Advertencia","debe Ingresar Detalle de Cuotas")
	tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
elseif cbx_tarjeta_debito.checked=True and tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.rowcount() = 0 then
	messagebox("Advertencia","debe Ingresar Detalle de Pago")
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
end if
id_saldo					= ((long(sle_efectivo.text) + long(st_saldo.text)) - long(st_total.text))
IF id_saldo = 0 then
	RETURN 0
ELSE
	RETURN 1
END IF
end function

public function integer f_actualizar_mov (string as_tipo_mov, long al_monto, long al_nro_cuotas);LONG		ll_CTA_PAG_S, ll_ultimo_folio, ll_total_cuotas,ll_abono,ll_total_pie_pagado, ll_total_pagado,&
			ll_folio,ll_cuotas_pag_pie,ll_count_reg,ll_ctas_pag_isa,ll_fila,ll_ctas_pag_la,ll_plazo
Datetime	ldt_fecha_hoy
String		ls_tipo_cob,ls_tipo_caja

gs_tipo_cobro	= trim(st_tipo_cobro.text)
gd_hoy 			= Datetime(idt_fecha_hoy)

IF gs_rezago = "S" THEN
	RETURN 1
END IF
SELECT  	"CODIGO_CAJAS"."TIPO_CAJA"  
INTO    	:ls_tipo_caja
FROM    	"CODIGO_CAJAS"  
WHERE 	"CODIGO_CAJAS"."COD_CAJA" = :gs_caja   ;
if ls_tipo_caja='P' then
	if (gs_base='O' or gs_base='U' or gs_base='L' or gs_base='A' or gs_base='M') and (as_tipo_mov='A' or as_tipo_mov='Q') then
		ls_tipo_cob		= trim(st_tipo_cobro.text)
		ll_folio			= long(trim(st_folio.text))
		ldt_fecha_hoy	= datetime(date(idt_fecha_hoy),time('00:00:00'))
	end if
	CHOOSE CASE gs_base
		CASE "O","U","M" // OFERTAS
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"OFERTA_V"."TOT_PAGADO",   
								"OFERTA_V"."CTA_PAG_S"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							 ( "OFERTA_V"."BASE" = :gs_base );    
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado		= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base )
					USING		sqlca;
	
				CASE "L"	
					// Otros, no modifica valores
	
				CASE "A","Q"
					SELECT	"OFERTA_V"."TOT_PAGADO",   
								"OFERTA_V"."ULT_FOLIO",   
								"PAGO_OFERTA"."CTAS_PAGADAS_PIE",
								"PAGO_OFERTA"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"OFERTA_V",   
								"PAGO_OFERTA",   
								"CADENA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :gs_base ) AND  
							 ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."BASE" = :gs_base ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"OFERTA_V"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							 ( "OFERTA_V"."BASE" = :gs_base )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
					INTO 		:ll_count_reg  
					FROM 	"DETALLE_PAGO_PIE"  
					WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
							 ( "DETALLE_PAGO_PIE"."SERIE" = :gs_serie ) AND  
							 ( "DETALLE_PAGO_PIE"."NUMERO" = :gi_numero ) AND  
							 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
					USING		sqlca;
					if ll_count_reg>0 then
						ll_cuotas_pag_pie	= ll_count_reg
					end if
					UPDATE	"PAGO_OFERTA"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado  
					WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
								( "PAGO_OFERTA"."BASE" = :gs_base ) AND  
							 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
							 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie
				CASE "F"
					SELECT	"OFERTA_V"."TOT_PAGADO_M",   
								"OFERTA_V"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base );    
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO_M" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							 ( "OFERTA_V"."BASE" = :gs_base )
					USING		sqlca;
	
				CASE "M"
					// no hace nada
					
				CASE "N" //Abono mantención
					SELECT	"OFERTA_V"."ABONO_M", "OFERTA_V"."TOT_PAGADO_M"   
					INTO 		:ll_abono, :ll_total_pagado   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono
	
					UPDATE	"OFERTA_V"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO_M" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base ) 
					USING		sqlca;
					
				CASE "I" // Abono cuota
					SELECT	"OFERTA_V"."ABONO_C", "OFERTA_V"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base );    
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
					
					UPDATE 	"OFERTA_V"  
					SET 		"ABONO_C" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base )
					USING		sqlca;
	
				CASE "K"
					SELECT	"OFERTA_V"."TOT_PAGADO", "OFERTA_V"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base );    
	
					SELECT	"PAGO_OFERTA"."NRO_CUOTAS"
					INTO 		:ll_total_cuotas
					FROM 		"PAGO_OFERTA"
					WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
							 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
							 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio ) and
							  ( "PAGO_OFERTA"."BASE" = :gs_base );    
	
					ll_CTA_PAG_S 		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
							  ( "OFERTA_V"."BASE" = :gs_base )
					USING		sqlca;
	
				CASE "S" //Modificar
					if gs_codigo_otro='101'  then
						IF gs_tipo_cobro = "BL"  THEN
							SELECT	"OFERTA_V"."TOT_PAGADO_M",
										"OFERTA_V"."ULT_FOLIO"
							INTO 		:ll_total_pagado, 
										:ll_ultimo_folio   
							FROM 		"OFERTA_V"  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
									  ( "OFERTA_V"."BASE" = :gs_base );    
	
							ll_total_pagado	= ll_total_pagado + al_monto 
							UPDATE	"OFERTA_V"
							SET 		"TOT_PAGADO_M" = :ll_total_pagado  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
									  ( "OFERTA_V"."BASE" = :gs_base )
							USING		sqlca;
	
						ELSE	
							SELECT	"OFERTA_V"."TOT_PAGADO",
										"OFERTA_V"."ULT_FOLIO"
							INTO 		:ll_total_pagado, 
										:ll_ultimo_folio   
							FROM 		"OFERTA_V"  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
									  ( "OFERTA_V"."BASE" = :gs_base );    
		
							ll_total_pagado	= ll_total_pagado + al_monto 
		
							UPDATE	"OFERTA_V"
							SET 		"TOT_PAGADO" = :ll_total_pagado  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) and
									  ( "OFERTA_V"."BASE" = :gs_base )
							USING		sqlca;
	
						END IF
					end if
			END CHOOSE
	
		CASE "C" // CONTRATOS ISA
			CHOOSE CASE as_tipo_mov
				CASE "E"	
					// No se da este caso
				CASE "L"	
					// Otros, no modifica valores
				CASE "A"
					// No se da este caso
				CASE "F"
					SELECT	"CONTRATO"."TOT_PAGADO",   
								"CONTRATO"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
	
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"CONTRATO"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )
					USING		sqlca;
	
				CASE "M"
					// no hace nada
				CASE "N" //Abono mantención
					SELECT	"CONTRATO"."ABONO_M", "CONTRATO"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado   
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono
	
					UPDATE	"CONTRATO"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )
					USING		sqlca;
	
				CASE "I" // Abono cuota
					// NO SE DA ESTA OPCION
				CASE "K"
					//NO SE DA ESTA OPCION
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"CONTRATO"."TOT_PAGADO"
						INTO 		:ll_total_pagado 
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"CONTRATO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "L" // LIBERADOR
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
								"ANEXO_LIBERADOR"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO UTILIZADA
				CASE "A","Q"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
								"ANEXO_LIBERADOR"."ULT_FOLIO",   
								"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",
								"PAGO_LIBERADOR"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"ANEXO_LIBERADOR",   
								"PAGO_LIBERADOR",   
								"CADENA"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = 'L' ) AND  
							 ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"ANEXO_LIBERADOR"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PAGO_LIBERADOR"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
							 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					// ,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie  
					CASE "F"
					// NO EXISTE OPCION
				CASE "M"
					// NO EXISTE OPCION
				CASE "N" //Abono mantención
					// NO EXISTE OPCION				
				CASE "I" // Abono cuota
					SELECT	"ANEXO_LIBERADOR"."ABONO_M", "ANEXO_LIBERADOR"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
					
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
					
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
					USING		sqlca;
					
				CASE "K"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO", "ANEXO_LIBERADOR"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
					
					SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS"
					INTO 		:ll_total_cuotas
					FROM 		"PAGO_LIBERADOR"
					WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
							 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
					
					ll_CTA_PAG_S		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
					USING		sqlca;
					
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
									"ANEXO_LIBERADOR"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"ANEXO_LIBERADOR"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"ANEXO_LIBERADOR"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "F","G","V" // FUNERARIA/crematorio/Servicio
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
								"PRODUCTO_ANEXO"."CUOTAS_PAG",
								"PRODUCTO_PAGO"."PLAZO"
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S,
								:ll_plazo
					FROM 	"PRODUCTO_ANEXO" ,	"PRODUCTO_PAGO" 
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) AND  
								( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"PRODUCTO_ANEXO"  
					SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
								"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )
					USING		sqlca;
					
	//				if ll_plazo = 1 and as_tipo_mov = 'E' then
	//					UPDATE 	"CADENA"  
	//					SET 		"ESTADO" = 'C'  
	//					WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
	//								( "CADENA"."SERIE" = :gs_serie ) AND  
	//								( "CADENA"."NUMERO" = :gi_numero )   
	//					USING	sqlca;
	//
	//				end if
				CASE "L"	
					// OPCION NO UTILIZADA
	//				SELECT 	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
	//							"PRODUCTO_ANEXO"."CUOTAS_PAG",   
	//							"PRODUCTO_PAGO"."PLAZO"  
	//				INTO 		:ll_total_pagado,   
	//							:ll_CTA_PAG_S,   
	//							:ll_plazo  
	//				FROM 	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO"  
	//				WHERE ( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
	//							( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
	//							( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
	//							( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
	//							(( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
	//							( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )   ;
	//
	//				if isnull(ll_CTA_PAG_S) then ll_CTA_PAG_S = 0
	//				if ll_CTA_PAG_S = 0 then al_nro_cuotas = 1
	//				ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
	//				ll_total_pagado 	= al_monto + ll_total_pagado
	//				if ll_CTA_PAG_S > ll_plazo then ll_CTA_PAG_S = ll_plazo
	//				
	//				UPDATE	"PRODUCTO_ANEXO"  
	//				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
	//							"TOTAL_PAGADO" = :ll_total_pagado  
	//				WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
	//						 	( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )
	//				USING	sqlca;
					
				CASE "A","Q"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
								"PRODUCTO_ANEXO"."ULT_FOLIO",   
								"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",
								"PRODUCTO_PAGO"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 	"PRODUCTO_ANEXO",   
								"PRODUCTO_PAGO",   
								"CADENA"  
					WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
							 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
							 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
							 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
							 ( "CADENA"."CODIGO" = :gs_base ) AND  
							 ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero  )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"PRODUCTO_ANEXO"
					SET 		"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )
					USING	sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PRODUCTO_PAGO"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  	( "PRODUCTO_PAGO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND  
								( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//	"CTAS_PIE_PAGADAS" = :ll_cuotas_pag_pie  
					CASE "F"
					// NO EXISTE OPCION
				CASE "M"
					// NO EXISTE OPCION
				CASE "N" //Abono mantención
					// NO EXISTE OPCION				
				CASE "I" // Abono cuota
					// NO EXISTE OPCION	
					
				CASE "K"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO", 	"PRODUCTO_ANEXO"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 									:ll_ultimo_folio   
					FROM 	"PRODUCTO_ANEXO"  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
					
					SELECT	"PRODUCTO_PAGO"."PLAZO"
					INTO 		:ll_total_cuotas
					FROM 	"PRODUCTO_PAGO"
					WHERE  	( "PRODUCTO_PAGO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND  
								( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
					
					ll_CTA_PAG_S		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"PRODUCTO_ANEXO"  
					SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
								"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )
					USING		sqlca;
					
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
									"PRODUCTO_ANEXO"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 	"PRODUCTO_ANEXO"  
						WHERE  	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
									( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"PRODUCTO_ANEXO"
						SET 		"TOTAL_PAGADO" = :ll_total_pagado  
						WHERE  	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
									( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "P" // PAGARE
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"PAGARE"."TOT_PAGADO",   
								"PAGARE"."CTA_PAG_LA"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 	"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"PAGARE"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO EXISTE
				CASE "A","Q"
					SELECT	"PAGARE"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
	
					UPDATE	"PAGARE"
					SET 		"TOT_PAGADO" = :ll_total_pagado ,
								"PIE_PAGADO" = :al_monto 
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
				 
				CASE "F"
					// OPCION NO EXISTE
				CASE "M"
					// OPCION NO EXISTE
				CASE "N" //Abono mantención
					// OPCION NO EXISTE				
				CASE "I" // Abono cuota
					SELECT	"PAGARE"."ABONO_PAG", "PAGARE"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
							 
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
	
					UPDATE	"PAGARE"  
					SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "K"
					SELECT	"PAGARE"."TOT_PAGADO", 	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_ISA",	"PAGARE"."CTA_PAG_LA"
					INTO 		:ll_total_pagado, 				:ll_total_cuotas,		:ll_ctas_pag_isa,				:ll_CTA_PAG_S
					FROM 	"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
					
					ll_CTA_PAG_S		= ll_total_cuotas	//al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					UPDATE 	"PAGARE"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"PAGARE"."TOT_PAGADO"
						INTO 		:ll_total_pagado
						FROM 		"PAGARE"  
						WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
		
						ll_total_pagado	= ll_total_pagado + al_monto 
		
						UPDATE	"PAGARE"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "D" // DERECHO 
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"DERECHO"."TOT_PAGADO",   
								"DERECHO"."CTA_PAG_LA"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"DERECHO"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO EXISTE
				CASE "A","Q"
					SELECT	"DERECHO"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 	"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
	
					UPDATE	"DERECHO"
					SET 		"TOT_PAGADO" = :ll_total_pagado ,
								"PIE_PAGADO" = :al_monto 
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "F"
					// OPCION NO EXISTE
				CASE "M"
					// OPCION NO EXISTE
				CASE "N" //Abono mantención
					// OPCION NO EXISTE				
				CASE "I" // Abono cuota
					SELECT	"DERECHO"."ABONO_PAG", "DERECHO"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
	
					UPDATE	"DERECHO"  
					SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
					
				CASE "K"
					SELECT	"DERECHO"."TOT_PAGADO", 	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_ISA",	"DERECHO"."CTA_PAG_LA"
					INTO 		:ll_total_pagado, 					:ll_total_cuotas,		:ll_ctas_pag_isa,					:ll_ctas_pag_la
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
					
					ll_CTA_PAG_S		= ll_total_cuotas		//ll_total_cuotas - (ll_ctas_pag_isa + ll_ctas_pag_la)
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"DERECHO"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero )
					USING		sqlca;
	
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"DERECHO"."TOT_PAGADO"
						INTO 		:ll_total_pagado
						FROM 		"DERECHO"  
						WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
								 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
		
						ll_total_pagado	= ll_total_pagado + al_monto 
		
						UPDATE	"DERECHO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
								 ( "DERECHO"."NRO_PAGARE" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "A"
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
								"ANEXO_AUMENTO"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"ANEXO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"ANEXO_AUMENTO"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
					USING		sqlca;		
					
				CASE "A","Q"
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
								"ANEXO_AUMENTO"."ULT_FOLIO",   
								"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",
								"PAGO_AUMENTO"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"ANEXO_AUMENTO",   
								"PAGO_AUMENTO",   
								"CADENA"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = 'A' ) AND  
							 ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"ANEXO_AUMENTO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PAGO_AUMENTO"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
							 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie  
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
									"ANEXO_AUMENTO"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"ANEXO_AUMENTO"  
						WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"ANEXO_AUMENTO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
			
		CASE "R" // Reprogramación de Contratos de Mantención
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",
								"REPACTA_MANTENCION"."TOTAL_PAGADO"  
					INTO 		:ll_CTA_PAG_S, 	:ll_total_pagado  
					FROM 		"REPACTA_MANTENCION"  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;				
	
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"REPACTA_MANTENCION"  
					SET 		"REPACTA_MANTENCION"."CTAS_PAGADAS" = :ll_CTA_PAG_S,   
								"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )
					USING		sqlca;
	
				CASE "L"	
					// Otros, no modifica valores
				CASE "S"
					IF (gs_tipo_cobro = "BL" and gs_codigo_otro='101') THEN
						SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
						INTO 		:ll_total_pagado  
						FROM 		"REPACTA_MANTENCION"  
						WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;				
						
						ll_total_pagado	= ll_total_pagado + al_monto 
	
						UPDATE	"REPACTA_MANTENCION"
						SET 		"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
						WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )
						USING		sqlca;
	
					END IF
			END CHOOSE
	END CHOOSE
end if
RETURN 0
end function

public function integer f_ingresar_ingre (long al_folio, string as_tipo_mov, double ad_monto, integer ai_cuotas_pag);String		ls_codigo_otro,ls_uso,ls_base,ls_serie,ls_tipo_mov,ls_moneda,ls_traspaso='N',ls_descrip_serv,ls_descrip_detalle,ls_descrip_deta_final,ls_tipo_cob,ls_rezago_sap,&
			ls_moneda_sap,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direcc,ls_numero_part,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_fono_p,ls_fono_c,ls_celular,&
			ls_direc_part,ls_telefono_part,ls_nro_cliente_sap,ls_fecha_pago_palabra,ls_nro_contrato,ls_paga_con,ls_vuelto,ls_monto_total_palabra,ls_pago_ef,ls_tipo_cob_h,&
			ls_pago_ch,ls_pago_tc,ls_pago_td,ls_prox_pago_reg,ls_reingreso,ls_sociedad,ls_tipo_cob_cu,ls_ctto,ls_tipo_ctto,ls_base_h,ls_serie_h,ls_tipo_mov_h,ls_moneda_h,&
			ls_ctto_h,ls_cod_desc_h,ls_base_mpdet,ls_tipo_doc,ls_moneda_ctto,ls_cod_pago,ls_llave_ctto_mp,ls_ctto_det_h,ls_tipo_mov_det_h
Datetime	ldt_fecha_serv,ldt_fecha_sap,ldt_fecha_ant,ldt_fecha_hoy
Long		ll_cod_seguro,ll_monto,ll_count,ll_plazo, ll_ctas_pag, ll_cod_servicio,ll_cod_detalle, ll_detalle_final,ll_cod_parque,ll_ctas_pag_s_sap,ll_count_ctto_sap,&
			ll_count_rez,ll_sum_ef, ll_sum_ch, ll_count_ch, ll_sum_tc, ll_count_tc, ll_sum_td,ll_fila_serv,ll_fila_e,ll_cod_servicio_f,ll_tot_reg_m,ll_indi_m,ll_cant_h,ll_cod_parque_ctto,&
			ll_fila_det,ll_item,ll_fila,ll_fila_mov,ll_indi_det_mp
Double	ldb_prima,ldb_val_cuota,ldb_valor_producto,ldb_porce_pago,ll_numero,ldb_monto_sap,ll_numero_h,ldb_monto_uf_h,ldb_monto_peso_h,ldb_monto_total_uf_h,&
			ldb_monto_total_peso_h,ll_cupon_h,ll_cupon_m,ll_total_iva,ll_total_cto,ll_neto,ll_exento,ll_monto_det,ll_porce_desc,ll_monto_desc,ll_pos_det,ll_folio,ldb_acum_pie,&
			ldb_iva_acum,ldb_porc_pie_mp, ldb_precio_mp,ldb_precio_mpdet, ldb_iva_mpdet, ldb_porc_pie_mp_det, ldb_porcsubtotimp_mpdet,ldb_precio_uni_ctto,ld_monto,&
			ldb_pie_uni_ctto,ldb_iva_p,ll_total_ctto,ll_total_pago_ctto,ll_max_folio_new,ll_tot_porctto,ll_total_iva_det_h,ll_suma_iva_h,ll_neto_det_h,ll_exento_det_h

gd_hoy							= Datetime(idt_fecha_hoy)	
ldt_fecha_hoy					= gd_hoy
gs_tipo_cobro					= trim(st_tipo_cobro.text)
//if gs_base='M' then
//	ls_cod_pago					= 'CX'
//end if
ls_tipo_cob						= gs_tipo_cobro
ls_tipo_cob_cu					= 'CU'
ldt_fecha_serv					= gd_hoy
ll_folio							= al_folio
if gs_reingreso_ci = 'S' then 
	ls_reingreso					= gs_reingreso_ci
elseif gs_reingreso_be = 'S' then 
	ls_reingreso					= gs_reingreso_be
else
	ls_reingreso					= 'N'
end if
//if gs_base='M' then
//	if gs_rezago='S' and (as_tipo_mov='E' or as_tipo_mov='F' or as_tipo_mov='A') then
//		if gl_sw_mp = 0 and gl_codigo_mp > 0 then
//			
//			ll_fila_mov								= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob='A' or tipo_cob='E' or tipo_cob='F'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//			if ll_fila_mov > 0 then
//				if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
//					ld_monto							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila_mov,'monto')
//				elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
//					ld_monto							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila_mov,'monto_uf')
//				end if
//			end if
//			ldb_acum_pie							= 0
//			ldb_iva_acum							= 0
//			ll_item									= 0
//			DECLARE x3 CURSOR FOR  
//			SELECT 	"MPPRODUCTO"."PORCENTAJEPIE",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO",   	"MPPRODUCTODET"."IVA",   	"MPPRODUCTODET"."PORCENTAJEPIE" ,   	"MPPRODUCTODET"."PORCSUBTOTALIMP" 
//			FROM 	"MPPRODUCTO",   	"MPPRODUCTODET"  
//			WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
//						( "MPPRODUCTO"."CODIGOMP" = :gl_codigo_mp )   
//			USING	sqlca;
//			open x3;
//			if sqlca.sqlcode=0 then
//				do while sqlca.sqlcode=0
//					fetch x3 into :ldb_porc_pie_mp, :ldb_precio_mp,	:ls_base_mpdet, :ldb_precio_mpdet, :ldb_iva_mpdet, :ldb_porc_pie_mp_det, :ldb_porcsubtotimp_mpdet;
//					if not isnull(ls_base_mpdet) then
//						if gs_rezago='S' then
//							if gs_conexion	 = "Parque El Prado" then
//								ls_ctto				= ls_base_mpdet+'G'+string(0)
//							elseif gs_conexion	= "Parque La Foresta" then
//								ls_ctto				= ls_base_mpdet+'N'+string(0)
//							end if
//							ll_fila						= dw_multiproducto.insertrow(0)
//							ll_item ++
//							dw_multiproducto.setitem(ll_fila,'item',ll_item)
//							dw_multiproducto.setitem(ll_fila,'contrato',ls_ctto)
//							dw_multiproducto.setitem(ll_fila,'rut',gi_rut)
//							dw_multiproducto.setitem(ll_fila,'cantidad',1)
//							dw_multiproducto.setitem(ll_fila,'tipo_mov',as_tipo_mov)
//							dw_multiproducto.setitem(ll_fila,'mpbase','M')
//							dw_multiproducto.setitem(ll_fila,'mpserie','G')
//							dw_multiproducto.setitem(ll_fila,'mpnumero',0)
//							dw_multiproducto.setitem(ll_fila,'nufdia',gd_uf)
//							
//							
//							if ((ls_base_mpdet='O' or ls_base_mpdet='U') and (ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='U' or ls_tipo_cob='Q')) then
//								dw_multiproducto.setitem(ll_fila,'tipodoc','CI')
//							else
//								dw_multiproducto.setitem(ll_fila,'tipodoc','BA')
//							end if
//						end if
//						
//						if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
//							ldb_precio_uni_ctto	= round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),0)
//							dw_multiproducto.setitem(ll_fila,'montoitem',ldb_precio_uni_ctto)
//							dw_multiproducto.setitem(ll_fila,'totalitem',ldb_precio_uni_ctto)
//							
//							dw_multiproducto.setitem(ll_fila,'monto_uf',round(ldb_precio_uni_ctto / gd_uf,4))
//							dw_multiproducto.setitem(ll_fila,'total_uf',round(ldb_precio_uni_ctto / gd_uf,4))
//							dw_multiproducto.setitem(ll_fila,'moneda','1')
//							dw_multiproducto.setitem(ll_fila,'tipomoneda','PESO')
//						elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
//							ldb_precio_uni_ctto	= round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),4)
//							dw_multiproducto.setitem(ll_fila,'monto_uf',ldb_precio_uni_ctto)
//							dw_multiproducto.setitem(ll_fila,'total_uf',ldb_precio_uni_ctto)
//							
//							dw_multiproducto.setitem(ll_fila,'montoitem',round(ldb_precio_uni_ctto * gd_uf,0))
//							dw_multiproducto.setitem(ll_fila,'totalitem',round(ldb_precio_uni_ctto * gd_uf,0))
//							dw_multiproducto.setitem(ll_fila,'moneda','2')
//							dw_multiproducto.setitem(ll_fila,'tipomoneda','UF')
//						end if
//						ldb_pie_uni_ctto			= ldb_precio_uni_ctto		//round(((ldb_precio_uni_ctto * ldb_porc_pie_mp_det) / 100),4)
//						ldb_acum_pie				= ldb_acum_pie + ldb_pie_uni_ctto
//						if ldb_iva_mpdet > 0 then
//							if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
//								ldb_iva_p 			= round(ldb_pie_uni_ctto * (idb_iva - 1),0)
//								dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto + ldb_iva_p)
//								dw_multiproducto.setitem(ll_fila,'totaliva',ldb_iva_p)
//							elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
//								ldb_iva_p 			= round(ldb_pie_uni_ctto * (idb_iva - 1),4)
//								dw_multiproducto.setitem(ll_fila,'totalcto',round(round((ldb_precio_uni_ctto + ldb_iva_p),4) * gd_uf,0))
//								dw_multiproducto.setitem(ll_fila,'totaliva',round(ldb_iva_p * gd_uf,0))
//							end if
//							ldb_iva_acum			= ldb_iva_acum + ldb_iva_p
//						else
//							dw_multiproducto.setitem(ll_fila,'totaliva',0)
//							if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
//								dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto)
//							elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
//								dw_multiproducto.setitem(ll_fila,'totalcto',round(ldb_precio_uni_ctto * gd_uf,0))
//							end if
//						end if
//						dw_multiproducto.accepttext()
//						ls_tipo_doc					= dw_multiproducto.getitemstring(ll_fila,'tipodoc')
//						ll_total_ctto					= dw_multiproducto.getitemnumber(ll_fila,'totalcto')
//						ls_moneda_ctto			= dw_multiproducto.getitemstring(ll_fila,'moneda')
//						ls_dv							= '0'
//						if ls_moneda_ctto='1' then
//							ll_total_pago_ctto		= ll_total_ctto
//						else
//							ll_total_pago_ctto		= round((ll_total_ctto / gd_uf),4)
//						end if
//						dw_multiproducto.setitem(ll_fila,'mpnro_cupon',ll_folio)
//						if ls_tipo_doc='CI' then
//							ll_max_folio_new		= ll_folio
//							f_crear_folio_web_mp(1, ll_max_folio_new, ls_base_mpdet, 'G', ll_max_folio_new, ll_max_folio_new, ldt_fecha_hoy, 'V', ls_tipo_cob, ls_tipo_doc, ll_max_folio_new, ldt_fecha_hoy, ll_total_pago_ctto, ll_total_ctto, 0, 0, 1, ls_dv, 'M', 'G', 0, ls_moneda_ctto, gs_user, gs_caja, ll_max_folio_new)
//						else
//							select id_cuponeras_web.nextval into :ll_max_folio_new from dual;
////											ll_folio_elect			= f_crear_folio_web_mp(1, :ll_max_folio_new, :ls_base_mpdet,'G',:ll_max_folio_new,:ll_max_folio_new,:ldt_fecha_hoy,'V',:ls_tipo_cob,:ls_tipo_doc, :ll_max_folio_new,:ldt_fecha_hoy,:ll_total_pago_ctto,:ll_total_ctto,0,0,1,:ls_dv,'M','G',0,:ls_moneda_ctto,:gs_user,:gs_caja,:ll_max_folio_new)
//							f_crear_folio_web_mp(1, ll_max_folio_new, ls_base_mpdet, 'G', ll_max_folio_new, ll_max_folio_new, ldt_fecha_hoy, 'V', ls_tipo_cob, ls_tipo_doc, ll_max_folio_new, ldt_fecha_hoy, ll_total_pago_ctto, ll_total_ctto, 0, 0, 1, ls_dv, 'M', 'G', 0, ls_moneda_ctto, gs_user, gs_caja, ll_max_folio_new)
//						end if
//					end if
//					if ldb_iva_p > 0 then
//						if gs_rezago='S' then
////										ll_fila						= dw_detalle_ci.insertrow(0)
//							if gs_conexion	 = "Parque El Prado" then
//								ls_ctto				= ls_base_mpdet+'G'+string(0)
//							elseif gs_conexion	= "Parque La Foresta" then
//								ls_ctto				= ls_base_mpdet+'N'+string(0)
//							end if
//							ll_fila						= dw_multiproducto.insertrow(0)
//							ll_item ++
//							dw_multiproducto.setitem(ll_fila,'item',ll_item)
//							dw_multiproducto.setitem(ll_fila,'contrato',ls_ctto)
//							dw_multiproducto.setitem(ll_fila,'rut',gi_rut)
//							dw_multiproducto.setitem(ll_fila,'cantidad',1)
//							dw_multiproducto.setitem(ll_fila,'mpbase','M')
//							dw_multiproducto.setitem(ll_fila,'mpserie','G')
//							dw_multiproducto.setitem(ll_fila,'mpnumero',0)
//							dw_multiproducto.setitem(ll_fila,'tipo_mov','V')
////										dw_multiproducto.setitem(ll_fila,'mpnro_cupon'
////										dw_multiproducto.setitem(ll_fila,'nro_cupon'
//							if ((ls_base_mpdet='O' or ls_base_mpdet='U') and (ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='U' or ls_tipo_cob='Q')) then
//								dw_multiproducto.setitem(ll_fila,'tipodoc','CI')
//							else
//								dw_multiproducto.setitem(ll_fila,'tipodoc','BA')
//							end if
//							if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
//								dw_multiproducto.setitem(ll_fila,'montoitem',round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),0))
//								dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto + ldb_iva_p)
//								ldb_precio_uni_ctto	= round(ldb_iva_p,0)
//								dw_multiproducto.setitem(ll_fila,'montoitem',ldb_precio_uni_ctto)
//								dw_multiproducto.setitem(ll_fila,'totalitem',ldb_precio_uni_ctto)
//								dw_multiproducto.setitem(ll_fila,'monto_uf',round(ldb_precio_uni_ctto / gd_uf,4))
//								dw_multiproducto.setitem(ll_fila,'total_uf',round(ldb_precio_uni_ctto / gd_uf,4))
//								dw_multiproducto.setitem(ll_fila,'moneda','1')
//								dw_multiproducto.setitem(ll_fila,'tipomoneda','PESO')
//								dw_multiproducto.setitem(ll_fila,'totaliva',ldb_iva_acum)
//								
//							elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
//								dw_multiproducto.setitem(ll_fila,'montoitem',round(round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),4) * gd_uf,0) )
//								dw_multiproducto.setitem(ll_fila,'totalcto',round(round((ldb_precio_uni_ctto + ldb_iva_p),4) * gd_uf,0))
//								ldb_precio_uni_ctto	= round(ldb_iva_p,4)
//								dw_multiproducto.setitem(ll_fila,'monto_uf',ldb_precio_uni_ctto)
//								dw_multiproducto.setitem(ll_fila,'total_uf',ldb_precio_uni_ctto)
//								dw_multiproducto.setitem(ll_fila,'montoitem',round(ldb_precio_uni_ctto * gd_uf,0))
//								dw_multiproducto.setitem(ll_fila,'totalitem',round(ldb_precio_uni_ctto * gd_uf,0))
//								dw_multiproducto.setitem(ll_fila,'moneda','2')
//								dw_multiproducto.setitem(ll_fila,'tipomoneda','UF')
//								dw_multiproducto.setitem(ll_fila,'totaliva', round(ldb_iva_acum * gd_uf,0))
//							end if
//							dw_multiproducto.setitem(ll_fila,'nufdia',gd_uf)
//							
//						end if
//					end if
//					setnull(ls_base_mpdet)
//					ldb_iva_p	= 0
//				loop
//			end if
//			close x3;
//		end if
//	elseif gs_rezago<>'S' and (as_tipo_mov='E' or as_tipo_mov='F' or as_tipo_mov='A') then
//		ls_ctto					= gs_base+gs_serie+string(gi_numero)
//		ls_tipo_ctto				= 'DET'
//		ll_tot_reg_m			= dw_multiproducto.retrieve(ls_ctto,as_tipo_mov,gi_rut,ai_cuotas_pag,ls_tipo_ctto)
//		
//	end if
//end if
if gs_base='F' then			//or gs_base='G' or gs_base='V'
	gs_tipo_cobro_aux			= 'BA'
	ls_sociedad					= 'CL04'
	if isvalid(w_ingreso2) then
		ll_fila_serv				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("(tipo_cob = 'E' or tipo_cob='A') and cod_servicio > 0",1,w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
		if ll_fila_serv > 0 and (as_tipo_mov='E' or as_tipo_mov='A') then
			if gs_rezago <> 'S' then
				ll_cod_servicio	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_serv,'cod_servicio')
			else
				ll_cod_servicio	= 0
				if gs_rezago =  'S' then
					SELECT 	"REVISION_CONTRATOS"."CODIGO_SERVICIO"  
					INTO 		:ll_cod_servicio  
					FROM 	"REVISION_CONTRATOS"  
					WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
								( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
								( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )  
					USING	Trans_3;
					if Trans_3.sqlcode<>0 then ll_cod_servicio=300
				end if
			end if
		else
			ll_cod_servicio		= 0
			if gs_rezago =  'S' then
				SELECT 	"REVISION_CONTRATOS"."CODIGO_SERVICIO"  
				INTO 		:ll_cod_servicio  
				FROM 	"REVISION_CONTRATOS"  
				WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
							( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
							( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )  
				USING	Trans_3;
				if Trans_3.sqlcode<>0 then ll_cod_servicio=300
			end if
		end if
		
	end if
elseif gs_base='G' or gs_base='V' then
	if isvalid(w_ingreso2) then
		if gs_rezago='S' then
			ll_fila_serv				= 0
		else
			CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
				CASE 1 //Cupón
			
				CASE 2 //Comprobante Ingreso
					ll_fila_serv		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' and cod_servicio > 0",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
					ll_plazo			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
					ll_cod_servicio	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'producto_pago_codigo_servicio')
				CASE 3 //Boleta
					ll_fila_serv		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'E' and cod_servicio > 0",1,w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
					ll_plazo			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber(1,'producto_pago_plazo')
					ll_cod_servicio	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber(1,'producto_pago_codigo_servicio')
				CASE 4 //Factura EXENTA
					
				CASE 5 //Comprobante Factura
			END CHOOSE
			
		end if
		if ll_fila_serv > 0 and (as_tipo_mov='E' or as_tipo_mov='A') then
			if gs_rezago =  'S' then
				SELECT 	"REVISION_CONTRATOS"."CODIGO_SERVICIO"  
				INTO 		:ll_cod_servicio  
				FROM 	"REVISION_CONTRATOS"  
				WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
							( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
							( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )  
				USING	Trans_3;
				if Trans_3.sqlcode<>0 then ll_cod_servicio=300
			end if
			if gs_tipo_cobro<>'CI' and gs_base='G' then 
				if ad_monto = 1 and as_tipo_mov='E' then
					gs_tipo_cobro		= 'BE'
				else
					gs_tipo_cobro		= 'BA'
				end if
				if ll_cod_servicio=345 or ll_cod_servicio=371 then gs_tipo_cobro	= 'FA'
				if ll_cod_servicio=400 or ll_cod_servicio=401 or ll_cod_servicio=402 or ll_cod_servicio=403 then gs_tipo_cobro	= 'BE'
			end if
//			if gs_tipo_cobro<>'CI' and gs_base='V' then gs_tipo_cobro	= 'BA'
			ls_tipo_cob					= gs_tipo_cobro
		else
//			ll_cod_servicio				= 0
			if ll_cod_servicio=0 then
				SELECT 	"REVISION_CONTRATOS"."CODIGO_SERVICIO"  
				INTO 		:ll_cod_servicio  
				FROM 	"REVISION_CONTRATOS"  
				WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
							( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
							( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )   
				USING	Trans_3 ;
				if Trans_3.sqlcode<>0 then ll_cod_servicio=300
							
			end if
			if gs_tipo_cobro<>'CI' and gs_base <> 'V' then 
				if ad_monto = 1 and as_tipo_mov='E' then
					gs_tipo_cobro		= 'BE'
				else
					gs_tipo_cobro		= 'BA'
				end if
			end if
			if ll_cod_servicio=345 or ll_cod_servicio=371 then 
				if isvalid(w_ingreso2) then
					CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
						CASE 2 //Comprobante Ingreso
							gs_tipo_cobro		= 'CI'
						CASE 3 //Boleta
							ll_fila_e	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find(" tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q' or tipo_cob='K' ",1,w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
							if ll_fila_e > 0 then
								gs_tipo_cobro	= 'FA'
							else
								gs_tipo_cobro	= 'BA'
							end if
					END CHOOSE
				end if
			end if
			if ll_cod_servicio=400 or ll_cod_servicio=401 or ll_cod_servicio=402 or ll_cod_servicio=403 then 
				if isvalid(w_ingreso2) then
					CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
						CASE 2 //Comprobante Ingreso
							gs_tipo_cobro		= 'CI'
						CASE 3 //Boleta
							ll_fila_e	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find(" tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q' or tipo_cob='K' ",1,w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
							if ll_fila_e > 0 then
								gs_tipo_cobro	= 'BE'
							else
								gs_tipo_cobro	= 'BE'
							end if
					END CHOOSE
				end if
			end if
			ls_tipo_cob					= gs_tipo_cobro
		end if
		if gs_base='G' and (gs_serie='I' or gs_serie='N' or gs_serie='X') then
			gs_tipo_cobro_aux		= 'BE'
		elseif gs_base='G' and (gs_serie='E' ) then
			gs_tipo_cobro_aux		= 'BA'
		end if
//		if gs_base='V' then
//			SELECT 	"CS_CABECERA"."TIPO_COB_AUX"  
//			INTO 		:gs_tipo_cobro_aux  
//			FROM 	"CS_CABECERA"  
//			WHERE 	( "CS_CABECERA"."BASE" = :gs_base ) AND  
//						( "CS_CABECERA"."SERIE" = :gs_serie ) AND  
//						( "CS_CABECERA"."NUMERO" = :gi_numero )   ;
//
//		end if
	end if
	if as_tipo_mov='L' OR as_tipo_mov='S' then 
		
		if gs_base='F' then
			CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
				CASE 1 //Cupón
			
				CASE 2 //Comprobante Ingreso
					ll_cod_servicio_f	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'producto_pago_codigo_servicio')
				CASE 3 //Boleta
					ll_cod_servicio_f	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber(1,'producto_pago_codigo_servicio')
				CASE 4 //Factura EXENTA
					
				CASE 5 //Comprobante Factura
			END CHOOSE
			if ll_cod_servicio_f > 0 and (ll_cod_servicio_f >= 670 and ll_cod_servicio_f <= 674) then
				UPDATE 	"PRODUCTO_GESTION_SERVICIO"  
				SET 		"TIPO_COB_PAGO" = :gs_codigo_otro,   
							"FOLIO_PAGO" = :il_max_folio_new,   
							"FECHA_PAGO" = :gd_hoy  
				WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
							( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
							( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND  
							( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" = 2 ) AND  
							( "PRODUCTO_GESTION_SERVICIO"."CORRELATIVO" = 	(	SELECT 	MIN("PRODUCTO_GESTION_SERVICIO"."CORRELATIVO") 
																										FROM 	"PRODUCTO_GESTION_SERVICIO" 
																										WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND 
																													( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND 
																													( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND 
																													( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND 
																													( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" = 2 ) ) )   ;

			end if
		end if
		
		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:gs_tipo_cobro_aux  
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :gs_codigo_otro ) AND  
					(( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro ) OR ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'CU' )) AND
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) //AND
	//																	( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' )
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			if gs_tipo_cobro_aux <> gs_tipo_cobro_aux2 and not isnull(gs_tipo_cobro_aux2) then gs_tipo_cobro_aux = gs_tipo_cobro_aux2
		end if
		
	end if
end if
if gs_tipo_cobro_aux = 'BA' then
	ls_sociedad					= 'CL04'
else
	if gs_conexion = 'Parque El Prado' then 
		ls_sociedad				= 'CL02'
	else
		ls_sociedad				= 'CL03'
	end if
	
end if
//if il_max_folio_new = 0 and gl_folio=0 then
//	SELECT 	MAX("INGRESO_NEWSING_CABECERA"."FOLIO")
//	INTO 		:il_max_folio_new  
//	FROM 	"INGRESO_NEWSING_CABECERA"  
//	WHERE ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :gs_tipo_cobro )
//	USING	sqlca;
//	if isnull(il_max_folio_new) or il_max_folio_new=0 then il_max_folio_new=0
//	il_max_folio_new ++
//end if
if isvalid(w_ingreso2) then
	ldt_fecha_ant				= datetime(date(w_ingreso2.em_fecha_ant.text),time('00:00:00'))
end if
if as_tipo_mov='L' OR as_tipo_mov='S' then 
	ls_codigo_otro				= gs_codigo_otro
else
	ls_codigo_otro				= '0'
end if
if gs_rezago <> 'S' then
	SELECT	Count("SAP_CADENA"."BASE")
	INTO 		:ll_count_ctto_sap  
	FROM 	"CADENA", 	"SAP_CADENA"  
	WHERE 	( "CADENA"."CODIGO" = "SAP_CADENA"."BASE" ) and  
				( "CADENA"."SERIE" = "SAP_CADENA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "SAP_CADENA"."NUMERO" ) and  
				( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
				( "CADENA"."NUMERO" = :gi_numero ) AND  
				( "SAP_CADENA"."TIPO_DEUDA" = 'C' ) AND  
				( "SAP_CADENA"."NRO_CONTRATO_SAP" is not null )   ;
	if ll_count_ctto_sap = 0 then
		SELECT 	Count("CLIENTE_REZAGO"."BASE"  )
		INTO 		:ll_count_rez  
		FROM 	"CLIENTE_REZAGO"  
		WHERE ( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
					( "CLIENTE_REZAGO"."BASE" = :gs_base ) AND  
					( "CLIENTE_REZAGO"."SERIE" = :gs_serie ) AND  
					( "CLIENTE_REZAGO"."NUMERO" = :gi_numero ) AND  
					( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND  
					( "CLIENTE_REZAGO"."FOLIO" = :al_folio ) AND  
					( "CLIENTE_REZAGO"."FECHA_PAGO" = :gd_hoy )   ;
		if isnull(ll_count_rez) or ll_count_rez=0 then ll_count_rez=0
		if ll_count_rez = 0 then
			SELECT 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",   	"CLIENTE"."A_PATERNO",   	"CLIENTE"."A_MATERNO",   	"TIPO_VIA"."DESCRIPCION",   	"CLIENTE"."DIRECCION_P",   	"CLIENTE"."NUMERO_PARTICULAR",   	"CLIENTE"."DEPTO_PARTICULAR",   	"CLIENTE"."BLOCK_PARTICULAR",   	"CLIENTE"."COMUNA",   	"CLIENTE"."CIUDAD",   	"CLIENTE"."FONO_P",   	"CLIENTE"."FONO_C",   	"CLIENTE"."CELULAR",	"NRO_CLIENTE_SAP"  ,	"FECHA_SAP"
			INTO 		:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_tipo_via,   						:ls_direcc,   							:ls_numero_part,   							:ls_depto,   									:ls_block,   									:ls_comuna,   				:ls_ciudad,   				:ls_fono_p,   				:ls_fono_c,   				:ls_celular,					:ls_nro_cliente_sap,		:ldt_fecha_sap
			FROM 	"CADENA",   "CLIENTE",   	"TIPO_VIA"  
			WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
						( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
						( ( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero ) )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ls_direcc) then ls_direcc='-'
				if isnull(ls_numero_part) then ls_numero_part='-'
				ls_direc_part			= ls_tipo_via+ ' '+ls_direcc+' N° '+ls_numero_part+' D: '+ls_depto+' B: '+ls_block
				if not isnull(ls_fono_p) and ls_fono_p <> '0' and ls_fono_p <> '-' then 
					ls_telefono_part	= ls_fono_p
				elseif not isnull(ls_fono_c) and ls_fono_c <> '0' and ls_fono_c <> '-' then 
					ls_telefono_part	= ls_fono_c
				else
					ls_telefono_part	= ls_celular
				end if
			end if
			if al_folio > 0 then
				INSERT INTO	"CLIENTE_REZAGO"  
							( "RUT", 		"BASE", 		"SERIE",  	"NUMERO", 		"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   "TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   "FOLIO",   	"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"FECHA_TRASPASO_REZAGO",   	"USUARIO_GENERA_TRASPASO",   	"COD_PARQUE",   	"MONEDA",   	"ESTADO_SAP",   	"ESTADO_SAP_CONTRATO",   	"NRO_CLIENTE_SAP",   	"FECHA_SAP" )  
				VALUES 	( :gi_rut,   	:gs_base,   	:gs_serie,   	:gi_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc_part,   			:ls_comuna,   			:ls_ciudad,   		:ls_telefono_part,   	:gd_hoy,   			:gs_user,   		:ls_dv,   	:ls_tipo_cob,   	:al_folio,   	:gd_hoy,   			'A',   				:gs_caja,   	null,   									null,   										:ll_cod_parque,   	:ls_moneda,   	0,   					0,   									:ls_nro_cliente_sap,   	:ldt_fecha_sap )  
				USING	sqlca;
			else
				INSERT INTO	"CLIENTE_REZAGO"  
							( "RUT", 		"BASE", 		"SERIE",  	"NUMERO", 		"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   "TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   				"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"FECHA_TRASPASO_REZAGO",   	"USUARIO_GENERA_TRASPASO",   	"COD_PARQUE",   	"MONEDA",   	"ESTADO_SAP",   	"ESTADO_SAP_CONTRATO",   	"NRO_CLIENTE_SAP",   	"FECHA_SAP" )  
				VALUES 	( :gi_rut,   	:gs_base,   	:gs_serie,   	:gi_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc_part,   			:ls_comuna,   			:ls_ciudad,   		:ls_telefono_part,   	:gd_hoy,   			:gs_user,   		:ls_dv,   	:gs_tipo_cobro,   	:il_max_folio_new,   	:gd_hoy,   			'A',   				:gs_caja,   	null,   									null,   										:ll_cod_parque,   	:ls_moneda,   	0,   					0,   									:ls_nro_cliente_sap,   	:ldt_fecha_sap )  
				USING	sqlca;
			end if
			ls_rezago_sap				= 'S'
		end if
	end if
end if
if gs_base='B' then
	ls_tipo_cob							= gs_tipo_cobro
	SELECT		"FACTURAS_CADENA"."COD_PARQUE"  
	INTO 			:ll_cod_parque  
	FROM 		"FACTURAS_CADENA"  
	WHERE     ( "FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
				  ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
				  ( "FACTURAS_CADENA"."NUMERO" = :gi_numero )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO	"FACTURAS_INGRESO"  
					 (	"FOLIO"    , 		"TIPO_COB"   , 	"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO", 	"VALOR_UF", 	"PAGO_HIST", 	"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE")  
		VALUES 	 (	:al_folio,			:ls_tipo_cob, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 			:gs_rezago,	:gd_uf    ,   		'A'      ,			:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque)
		USING			sqlca	;	
	end if
else
	SELECT		"CADENA"."COD_PARQUE"  
	INTO 			:ll_cod_parque  
	FROM 		"CADENA"  
	WHERE     ( "CADENA"."CODIGO" = :gs_base ) AND  
				  ( "CADENA"."SERIE" = :gs_serie ) AND  
				  ( "CADENA"."NUMERO" = :gi_numero )   
	USING		sqlca;
	if sqlca.sqlcode <> 0 then
		SELECT	DISTINCT "CLIENTE_REZAGO"."COD_PARQUE"  
		INTO 		:ll_cod_parque  
		FROM 	"CLIENTE_REZAGO"  
		WHERE ( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
				  ( "CLIENTE_REZAGO"."COD_PARQUE" > 0 )
		USING	sqlca;
		if isnull(ll_cod_parque) or ll_cod_parque=0 then ll_cod_parque = gl_cod_parque_rezago
	end if
	
	if gs_base='O' or gs_base='U' or gs_base='M' then
		SELECT	"OFERTA_V"."USO"  
		INTO 		:ls_uso  
		FROM 	"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
				 (("OFERTA_V"."SERIE" = :gs_serie ) AND  
				 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
				 ( "CADENA"."CODIGO" = :gs_base )  ) //O  
		USING		sqlca;
	end if
	if gs_tipo_cobro_aux = 'BE' and gs_base='G' then
		if ll_cod_servicio > 0 then
			if gs_tipo_cobro<>'CI' then 
				if ad_monto = 1 then		//and as_tipo_mov='E'
					gs_tipo_cobro		= 'BE'
				else
					gs_tipo_cobro		= 'BA'
				end if
				if (ll_cod_servicio=345 or ll_cod_servicio=371) and ll_fila_serv > 0 then gs_tipo_cobro = 'FA'
				if (ll_cod_servicio=400 or ll_cod_servicio=401 or ll_cod_servicio=402 or ll_cod_servicio=403) and ll_fila_serv > 0 then gs_tipo_cobro = 'BE'
			end if
			ls_tipo_cob		= gs_tipo_cobro	
		else
			if gs_tipo_cobro<>'CI' then 
				if ad_monto = 1  then		//and as_tipo_mov='E'
					gs_tipo_cobro		= 'BE'
				else
					gs_tipo_cobro		= 'BA'
				end if
				if (ll_cod_servicio=345 or ll_cod_servicio=371) and ll_fila_serv > 0 then gs_tipo_cobro = 'FA'
				if (ll_cod_servicio=400 or ll_cod_servicio=401 or ll_cod_servicio=402 or ll_cod_servicio=403) and ll_fila_serv > 0 then gs_tipo_cobro = 'BE'
//				if ll_cod_servicio=345 or ll_cod_servicio=371 then gs_tipo_cobro	= 'FA'
			end if
			ls_tipo_cob		= gs_tipo_cobro	
		end if
		ll_cod_parque		= 142
	end if
	if cbx_cheque.checked = true then ldt_fecha_serv = tab_1.tabpage_cheque.dw_detalle_pago_1.getitemdatetime(1,'fecha_venc')
	// NO agregar tipo_mov<>'Q' que descuadra facturacion, Pie de Reconocimiento no debe sumar cuotas pagadas
	if as_tipo_mov<>'F' and as_tipo_mov<>'E' and as_tipo_mov<>'K' and as_tipo_mov<>'U' then ai_cuotas_pag=0
	
	ls_rezago_sap		= f_retorna_rezago_sap(gs_rezago,gs_base,gs_serie,gi_numero,as_tipo_mov)
	if isnull(ls_rezago_sap) or ls_rezago_sap='' or len(ls_rezago_sap)=0 then ls_rezago_sap = gs_rezago
	
	ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(gs_base,gs_serie,gi_numero,as_tipo_mov,ls_rezago_sap)
	if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
	ll_ctas_pag_s_sap = ll_ctas_pag_s_sap + ai_cuotas_pag
	if al_folio > 0 then
		ldb_monto_sap		= f_retornar_monto_sap(gs_base, gs_serie, gi_numero, gs_rezago, ls_tipo_cob, al_folio, gd_hoy, as_tipo_mov,ad_monto,gd_uf, ls_codigo_otro,ai_cuotas_pag)
		if isnull(ldb_monto_sap) then ldb_monto_sap=0
		
		ls_moneda_sap		= f_retornar_moneda_sap(gs_base, gs_serie, gi_numero, gs_rezago, ls_tipo_cob, al_folio, gd_hoy, as_tipo_mov,ad_monto,gd_uf, ls_codigo_otro)
		if isnull(ls_moneda_sap) then ls_moneda_sap='2'
	else
		ldb_monto_sap		= f_retornar_monto_sap(gs_base, gs_serie, gi_numero, gs_rezago, gs_tipo_cobro, il_max_folio_new, gd_hoy, as_tipo_mov,ad_monto,gd_uf, ls_codigo_otro,ai_cuotas_pag)
		if isnull(ldb_monto_sap) then ldb_monto_sap=0
		
		ls_moneda_sap		= f_retornar_moneda_sap(gs_base, gs_serie, gi_numero, gs_rezago, gs_tipo_cobro, il_max_folio_new, gd_hoy, as_tipo_mov,ad_monto,gd_uf, ls_codigo_otro)
		if isnull(ls_moneda_sap) then ls_moneda_sap='2'
	end if
	
	if as_tipo_mov<>'E' and as_tipo_mov<>'U' and as_tipo_mov<>'K' and as_tipo_mov<>'F' and as_tipo_mov<>'A' and as_tipo_mov<>'Q' then ll_ctas_pag=0
	if gs_rezago = 'S' then 
		if gs_tipo_cobro = 'CU' then
			if al_folio > 0 then
				INSERT INTO	"INGRE"  
							 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
				VALUES 	 ( 	:al_folio,			:ls_tipo_cob, 		:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 		:gs_rezago, 	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
				USING		sqlca	;
				
				INSERT INTO	"INGRESO"  
							 (	"FOLIO"    , 		"TIPO_COB"   , 	"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
				VALUES 	 (	:al_folio,			:ls_tipo_cob, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
				USING		sqlca	;	
			else
				if as_tipo_mov='F' or as_tipo_mov='E' then
					is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
				end if
				INSERT INTO	"INGRESO_NEWSING"  
							 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
				VALUES  	 (	:il_max_folio_new,	:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie,	0, 					:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
				USING		sqlca	;	
			end if
		else
			if gs_base='M' then
				if al_folio > 0 then
					INSERT INTO	"INGRE"  
								 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
					VALUES 	 ( 	:al_folio,			'CX', 					:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
					USING		sqlca	;
					
					INSERT INTO	"INGRESO"  
								 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
					VALUES 	 (	:al_folio,			'CX', 					:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
					USING			sqlca	;	
					
					if gs_base='M'  then		//and (as_tipo_mov='E' or as_tipo_mov='A' or as_tipo_mov='F')
						ls_llave_ctto_mp					= gs_base+gs_serie+string('0')
						ll_tot_reg_m						= dw_multiproducto.rowcount()
						if as_tipo_mov='E' or as_tipo_mov='A' or as_tipo_mov='F' then
							for ll_indi_m=1 to ll_tot_reg_m
								ls_ctto_h						= dw_multiproducto.getitemstring(ll_indi_m,'contrato')
								ls_base_h					= mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),1,1)
								ls_serie_h					= mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),2,1)
								ll_numero_h					= Double(mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),3))
								ls_tipo_mov_h				= dw_multiproducto.getitemstring(ll_indi_m,'tipo_mov')
								ll_cant_h						= dw_multiproducto.getitemnumber(ll_indi_m,'cantidad')
								ldb_monto_uf_h			= Double(dw_multiproducto.getitemnumber(ll_indi_m,'monto_uf'))
								ldb_monto_total_uf_h		= Double(dw_multiproducto.getitemnumber(ll_indi_m,'total_uf'))
								ldb_monto_peso_h		= Double(round(dw_multiproducto.getitemnumber(ll_indi_m,'montoitem'),0))
								ldb_monto_total_peso_h	= Double(round(dw_multiproducto.getitemnumber(ll_indi_m,'totalitem'),0))
								ls_moneda_h				= dw_multiproducto.getitemstring(ll_indi_m,'moneda')
								ll_cupon_h					= dw_multiproducto.getitemnumber(ll_indi_m,'nro_cupon')		//cupon ctto hijo
								ll_cupon_m					= dw_multiproducto.getitemnumber(ll_indi_m,'mpnro_cupon')	//cupon ctto madre
								ls_tipo_cob_h				= dw_multiproducto.getitemstring(ll_indi_m,'tipodoc')
								ll_total_iva					= dw_multiproducto.getitemnumber(ll_indi_m,'totaliva')
								ll_total_cto					= dw_multiproducto.getitemnumber(ll_indi_m,'totalcto')
								ll_tot_porctto				= round(dw_multiproducto.getitemnumber(ll_indi_m,'c_sum_porctto_peso'),0)
								
								ls_rezago_sap				= f_retorna_rezago_sap(gs_rezago,ls_base_h,ls_serie_h,ll_numero_h,ls_tipo_mov_h)
								if isnull(ls_rezago_sap) or ls_rezago_sap='' or len(ls_rezago_sap)=0 then ls_rezago_sap = gs_rezago
								
								ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(ls_base_h,ls_serie_h,ll_numero_h,ls_tipo_mov_h,ls_rezago_sap)
								if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
								ll_ctas_pag_s_sap = ll_ctas_pag_s_sap + ll_cant_h
	
									ldb_monto_sap		= f_retornar_monto_sap(ls_base_h, ls_serie_h, ll_numero_h, gs_rezago, ls_tipo_cob_h, al_folio, gd_hoy, ls_tipo_mov_h,ldb_monto_total_peso_h,gd_uf, '0',ll_cant_h)
									if isnull(ldb_monto_sap) then ldb_monto_sap=0
									
									ls_moneda_sap		= f_retornar_moneda_sap(ls_base_h, ls_serie_h, ll_numero_h, gs_rezago, ls_tipo_cob_h, al_folio, gd_hoy, ls_tipo_mov_h,ldb_monto_total_peso_h,gd_uf, '0')
									if isnull(ls_moneda_sap) then ls_moneda_sap='2'
									
								if ls_tipo_mov_h<>'E' and ls_tipo_mov_h<>'F' then ll_cant_h=0
								if ls_tipo_cob_h='CI' then
									// Se reemplaza ll_cupon_h por al_folio
									INSERT INTO	"INGRE"  
												 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
									VALUES 	 ( 	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		:ls_tipo_mov_h,	:ldb_monto_total_peso_h,	:ll_cant_h, 				:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
									USING		sqlca	;
									
									INSERT INTO	"INGRESO"  
												 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP" )  
									VALUES 	 (	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
									USING			sqlca	;
									
									if ls_tipo_mov_h = 'G'  then
										ls_cod_desc_h		= '102'
										ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='170' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'mora_cred')
											ll_porce_desc	= ll_monto_det / ad_monto
											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'J'  then
										ls_cod_desc_h		= '118'
										ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='171' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'gasto_cred')
											ll_porce_desc	= ll_monto_det / ad_monto
											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'P'  then
										ls_cod_desc_h		= '130'
										ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='172' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'mora_mant')
											ll_porce_desc	= ll_monto_det / ad_monto
											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'E'  then
										ls_cod_desc_h			= '131'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='173' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'E'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'F'  then
										ls_cod_desc_h			= '132'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='174' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'F'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'R'  then
										ls_cod_desc_h			= '133'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='175' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'R'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = '4'  then
										ls_cod_desc_h			= '149'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='177' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = '4'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = '6'  then
										ls_cod_desc_h			= '150'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='178' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = '6'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'A'  then
										ls_cod_desc_h			= '160'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='179' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'A'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									elseif ls_tipo_mov_h = 'S'  then
										ls_cod_desc_h			= '144'
										ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='144' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
										if ll_fila_det > 0 then
											ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='144' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
											if ll_pos_det > 0 then
												ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
												ll_porce_desc	= ll_monto_det / ad_monto
												ll_monto_desc	= round(((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1,0)
												if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
											end if
										end if
										if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
									end if
									if ll_monto_desc < 0 then
										INSERT INTO	"INGRE"  
													 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 			"CUOTAS_PAG", 	"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
										VALUES 	 ( 	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		'S',				:ll_monto_desc,	0, 						:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_cod_desc_h,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
										USING		sqlca	;
										
										INSERT INTO	"INGRESO"  
													 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 			"CUOTAS_PAG", 	"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
										VALUES 	 (	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		'S' ,				:ll_monto_desc, 	0, 						:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_cod_desc_h,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	0,							:ll_monto_desc,	'1',						:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
										USING			sqlca	;
									end if
								else
								
									INSERT INTO	"INGRE"  
												 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
									VALUES 	 ( 	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h,	:ldb_monto_total_peso_h,	:ll_cant_h, 				:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:ll_cupon_h)
									USING		sqlca	;
									
									INSERT INTO	"INGRESO"  
												 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
									VALUES 	 (	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
									USING		sqlca	;	
									
									INSERT INTO	"INGRESO_NEWSING"  
												 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   "VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",		"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
									VALUES 	 (	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  :gd_uf    ,   	'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,		:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
									USING		sqlca	;	
									if ls_tipo_cob_h='BA' or ls_tipo_cob_h='FA' then
										ll_neto		= 0
										ll_exento		= 0
									elseif ls_tipo_cob_h='BE' or ls_tipo_cob_h='FE' then
										ll_neto		= 0
										ll_exento		= 0
									end if
									if as_tipo_mov='E' or as_tipo_mov='A' or as_tipo_mov='F' then
										if ls_base_h='G' then 
											ll_cod_parque_ctto		= 150
										elseif ls_base_h='F' then
											ll_cod_parque_ctto		= 142
										else
											ll_cod_parque_ctto		= ll_cod_parque
										end if
										if gs_rezago='S' then
											SELECT DISTINCT to_char("CLIENTE_REZAGO"."BASE"  || ''  || "CLIENTE_REZAGO"."SERIE" || '' || to_char("CLIENTE_REZAGO"."NUMERO") )
											INTO 		:ls_ctto_h
											FROM 	"CLIENTE_REZAGO"  
											WHERE 	( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
														( "CLIENTE_REZAGO"."COD_PAGO" = 'CU' OR "CLIENTE_REZAGO"."COD_PAGO" =  :ls_tipo_cob_h ) AND  
														( "CLIENTE_REZAGO"."FOLIO" = :ll_cupon_h )   ;
		//									ll_neto							= round(ll_total_iva / (idb_iva - 1),0)
		//									ll_exento							= ll_tot_porctto - (ll_neto + ll_total_iva)		 //	ll_tot_porctto - (ll_neto + gl_valor_iva)
											ll_neto							= round(ll_tot_porctto / idb_iva,0)
											ll_total_iva						= Round(ll_neto * (idb_iva - 1),0)
											ll_exento							= 0
										else
											ll_neto							= round(ll_total_iva / (idb_iva - 1),0)
											ll_exento							= ll_tot_porctto - (ll_neto + ll_total_iva)			//ll_tot_porctto - (ll_neto + gl_valor_iva)
										end if
										ls_fecha_pago_palabra			= f_retorna_fecha_palabra(date(gd_hoy))
										ls_monto_total_palabra			= sle_1.uo_convertir_numero(string(long(ll_tot_porctto)))
										
										for ll_indi_det_mp=1 to ll_tot_reg_m
											ls_ctto_det_h					= dw_multiproducto.getitemstring(ll_indi_det_mp,'contrato')
											ls_tipo_mov_det_h				= dw_multiproducto.getitemstring(ll_indi_det_mp,'tipo_mov')
											ll_total_iva_det_h				= dw_multiproducto.getitemnumber(ll_indi_det_mp,'totalitem')
											if ls_ctto_h = ls_ctto_det_h and (ls_tipo_mov_det_h='D' or ls_tipo_mov_det_h='X' or ls_tipo_mov_det_h='V') then
												ll_suma_iva_h				= ll_suma_iva_h + ll_total_iva_det_h
											end if
										next
										ll_neto_det_h						= round(ll_suma_iva_h  / (idb_iva - 1),0)
										ll_exento_det_h					= ll_tot_porctto - (ll_neto_det_h + ll_suma_iva_h)	
										if ll_exento_det_h < 0 then ll_exento_det_h=0
										
										INSERT INTO "INGRESO_NEWSING_CABECERA"  
													( "TIPO_COB",	"FOLIO",			"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE", 		"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",					"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 					"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",				"EXENTO",				"IVA",					"TOTAL",				"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
										VALUES 	( 'CU', 			:ll_cupon_h, 	:gd_hoy,				:ls_fecha_pago_palabra, 	:ll_cod_parque_ctto, 	:ls_ctto_h, 				:gd_uf,		:gs_caja, 		:gs_user, 		to_char(:ll_tot_porctto),		'0',				:is_proximo_pago, 	:ls_monto_total_palabra, 		to_char(:ll_tot_porctto),	'0',					'0',					'0',					:gi_rut,				:gs_rezago,		:ll_neto_det_h,		:ll_exento_det_h,		:ll_suma_iva_h,	:ll_tot_porctto,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
										USING	sqlca;
									end if
								end if
							next
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
				else
					if as_tipo_mov='F' or as_tipo_mov='E' then
						is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
					end if
					INSERT INTO	"INGRESO_NEWSING"  
								 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   "VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
					VALUES 	 (	:il_max_folio_new,	'CX', 					:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 			:gs_rezago,  :gd_uf    ,   	'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
					USING		sqlca	;	
				end if
			else
				if al_folio > 0 then
					INSERT INTO	"INGRE"  
								 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
					VALUES 	 ( 	:al_folio,			:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
					USING		sqlca	;
					
					INSERT INTO	"INGRESO"  
								 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
					VALUES 	 (	:al_folio,			:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
					USING			sqlca	;	
				else
					if as_tipo_mov='F' or as_tipo_mov='E' then
						is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
					end if
					INSERT INTO	"INGRESO_NEWSING"  
								 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   "VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
					VALUES 	 (	:il_max_folio_new,	:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	0, 					:gs_caja  , 			:gs_rezago,  :gd_uf    ,   	'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
					USING		sqlca	;	
				end if
			end if
		end if
	else
		if gs_tipo_cobro = 'CU' then
			if al_folio > 0 then
				INSERT INTO	"INGRE"  
							 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 				"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
				VALUES 	 ( 	:al_folio,			:ls_tipo_cob, 		:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 				:gi_numero, 	:gs_caja  , 		:gs_rezago, 	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
				USING		sqlca	;
				
				INSERT INTO	"INGRESO"  
							 (	"FOLIO"    , 		"TIPO_COB"   , 	"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
				VALUES 	 (	:al_folio,			:ls_tipo_cob, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
				USING		sqlca	;	
			else
				if as_tipo_mov='F' or as_tipo_mov='E' then
					is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
				end if
				INSERT INTO	"INGRESO_NEWSING"  
							 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 				"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
				VALUES  	 (	:il_max_folio_new,	:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 				:gi_numero, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
				USING		sqlca	;	
			end if
		else
			if al_folio > 0 then
				if gs_base='M'  then		//and (as_tipo_mov='E' or as_tipo_mov='A' or as_tipo_mov='F')
					ls_llave_ctto_mp					= gs_base+gs_serie+string(gi_numero)
					ll_tot_reg_m						= dw_multiproducto.rowcount()
					INSERT INTO	"INGRE"  
								 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
					VALUES 	 ( 	:al_folio,			'CX', 					:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
					USING		sqlca	;
					//gs_tipo_cobro
					INSERT INTO	"INGRESO"  
								 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
					VALUES 	 (	:al_folio,			'CX', 					:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero,		:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
					USING			sqlca	;	
					if as_tipo_mov='E' or as_tipo_mov='A' or as_tipo_mov='F' then
						for ll_indi_m=1 to ll_tot_reg_m
							ls_ctto_h						= dw_multiproducto.getitemstring(ll_indi_m,'contrato')
							ls_base_h					= mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),1,1)
							ls_serie_h					= mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),2,1)
							ll_numero_h					= Double(mid(dw_multiproducto.getitemstring(ll_indi_m,'contrato'),3))
							ls_tipo_mov_h				= dw_multiproducto.getitemstring(ll_indi_m,'tipo_mov')
							ll_cant_h						= dw_multiproducto.getitemnumber(ll_indi_m,'cantidad')
							ldb_monto_uf_h			= Double(dw_multiproducto.getitemnumber(ll_indi_m,'monto_uf'))
							ldb_monto_total_uf_h		= Double(dw_multiproducto.getitemnumber(ll_indi_m,'total_uf'))
							ldb_monto_peso_h		= Double(dw_multiproducto.getitemnumber(ll_indi_m,'montoitem'))
							ldb_monto_total_peso_h	= Double(dw_multiproducto.getitemnumber(ll_indi_m,'totalitem'))
							ls_moneda_h				= dw_multiproducto.getitemstring(ll_indi_m,'moneda')
							ll_cupon_h					= dw_multiproducto.getitemnumber(ll_indi_m,'nro_cupon')		//cupon ctto hijo
							ll_cupon_m					= dw_multiproducto.getitemnumber(ll_indi_m,'mpnro_cupon')	//cupon ctto madre
							ls_tipo_cob_h				= dw_multiproducto.getitemstring(ll_indi_m,'tipodoc')
							ll_total_iva					= dw_multiproducto.getitemnumber(ll_indi_m,'totaliva')
							ll_total_cto					= dw_multiproducto.getitemnumber(ll_indi_m,'totalcto')
							ll_tot_porctto				= dw_multiproducto.getitemnumber(ll_indi_m,'c_sum_porctto_peso')
							ls_cod_desc_h				= dw_multiproducto.getitemstring(ll_indi_m,'cod_otro_dscto')
							ll_monto_desc				= dw_multiproducto.getitemnumber(ll_indi_m,'totalitem')
							if isnull(ls_cod_desc_h) then ls_cod_desc_h='0'
							ls_rezago_sap				= f_retorna_rezago_sap(gs_rezago,ls_base_h,ls_serie_h,ll_numero_h,ls_tipo_mov_h)
							if isnull(ls_rezago_sap) or ls_rezago_sap='' or len(ls_rezago_sap)=0 then ls_rezago_sap = gs_rezago
							
							ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(ls_base_h,ls_serie_h,ll_numero_h,ls_tipo_mov_h,ls_rezago_sap)
							if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
							ll_ctas_pag_s_sap = ll_ctas_pag_s_sap + ll_cant_h

								ldb_monto_sap		= f_retornar_monto_sap(ls_base_h, ls_serie_h, ll_numero_h, gs_rezago, ls_tipo_cob_h, al_folio, gd_hoy, ls_tipo_mov_h,ldb_monto_total_peso_h,gd_uf, '0',ll_cant_h)
								if isnull(ldb_monto_sap) then ldb_monto_sap=0
								
								ls_moneda_sap		= f_retornar_moneda_sap(ls_base_h, ls_serie_h, ll_numero_h, gs_rezago, ls_tipo_cob_h, al_folio, gd_hoy, ls_tipo_mov_h,ldb_monto_total_peso_h,gd_uf, '0')
								if isnull(ls_moneda_sap) then ls_moneda_sap='2'
								
							if ls_tipo_mov_h<>'E' and ls_tipo_mov_h<>'F' then ll_cant_h=0
							if ls_tipo_cob_h = 'CI' then
								if ls_tipo_mov_h<>'S' or ls_codigo_otro<>'0' then
									INSERT INTO	"INGRE"  
												 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
									VALUES 	 ( 	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		:ls_tipo_mov_h,	:ldb_monto_total_peso_h,	:ll_cant_h, 				:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
									USING		sqlca	;
									
									INSERT INTO	"INGRESO"  
												 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
									VALUES 	 (	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
									USING			sqlca	;
								end if
								if ls_tipo_mov_h = 'G'  then
									ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='170' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h		= '102'
//										ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'mora_cred')
//										ll_porce_desc	= ll_monto_det / ad_monto
//										ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'J'  then

									ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='171' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h		= '118'
//										ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'gasto_cred')
//										ll_porce_desc	= ll_monto_det / ad_monto
//										ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'P'  then
									
									ll_fila_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='172' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h		= '130'
//										ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'mora_mant')
//										ll_porce_desc	= ll_monto_det / ad_monto
//										ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'E'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='173' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '131'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'E'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'F'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='174' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '132'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'F'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'R'  then									
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='175' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '133'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'R'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = '4'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='177' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '149'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = '4'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = '6'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='178' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '150'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = '6'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'A'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='179' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '160'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'A'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= ((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1
//										end if
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								elseif ls_tipo_mov_h = 'S'  then
									ll_fila_det				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='144' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									if ll_fila_det > 0 then
										ls_cod_desc_h			= '144'
//										ll_pos_det			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'S' and tipo_cob_otro='144' ",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
//										if ll_pos_det > 0 then
//											ll_monto_det	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_pos_det,'monto')
//											ll_porce_desc	= ll_monto_det / ad_monto
//											ll_monto_desc	= round(((ldb_monto_total_peso_h * ll_porce_desc) / 100) * -1,0)
//											if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
//										end if
										ls_cod_desc_h		= dw_multiproducto.getitemstring(ll_indi_m,'cod_otro_dscto')
//									else
//										ls_cod_desc_h		= dw_multiproducto.getitemstring(ll_indi_m,'cod_otro_dscto')
//										ll_monto_desc		= dw_multiproducto.getitemnumber(ll_indi_m,'totalitem')
										// revisar bien descuentos
									end if
									if ll_monto_desc >= 0 or isnull(ll_monto_desc) then ll_monto_desc=0
								end if
								if ll_monto_desc < 0 then
									INSERT INTO	"INGRE"  
												 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 			"CUOTAS_PAG", 	"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
									VALUES 	 ( 	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		'S',				:ll_monto_desc,	0, 						:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_cod_desc_h,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
									USING		sqlca	;
									
									INSERT INTO	"INGRESO"  
												 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 			"CUOTAS_PAG", 	"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
									VALUES 	 (	:al_folio,			:ls_tipo_cob_h, 	:gd_hoy     , 		'S' ,				:ll_monto_desc, 	0, 						:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_cod_desc_h,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	0,							:ll_monto_desc,	'1',						:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
									USING			sqlca	;
								end if
							else

								INSERT INTO	"INGRE"  
											 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 		"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
								VALUES 	 ( 	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h,	:ldb_monto_total_peso_h,	:ll_cant_h, 				:ls_serie_h, 		:ll_numero_h, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_cod_desc_h,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
								USING		sqlca	;
								
								INSERT INTO	"INGRESO"  
											 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT",		"CTTO_MP",				"TIPO_COB_MP",	"FOLIO_MP",	"FECHA_PAGO_MP")  
								VALUES 	 (	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_cod_desc_h,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:ll_cupon_h,			:ls_tipo_cob_h,				:ldt_fecha_ant,		:ls_llave_ctto_mp,		'CX',					:al_folio,			:gd_hoy)
								USING		sqlca	;	
								
								INSERT INTO	"INGRESO_NEWSING"  
											 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",		"MONTO" , 						"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   "VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",		"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
								VALUES 	 (	:ll_cupon_h,		'CU', 					:gd_hoy     , 		:ls_tipo_mov_h ,	:ldb_monto_total_peso_h, 	:ll_cant_h, 				:ls_serie_h, 	:ll_numero_h, 	:gs_caja  , 			:gs_rezago,  :gd_uf    ,   	'A'      ,				:ls_base_h , 		:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_cod_desc_h,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,		:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
								USING		sqlca	;	
								if ls_tipo_cob_h='BA' or ls_tipo_cob_h='FA' then
									ll_neto		= 0
									ll_exento		= 0
								elseif ls_tipo_cob_h='BE' or ls_tipo_cob_h='FE' then
									ll_neto		= 0
									ll_exento		= 0
								end if
								if ls_tipo_mov_h='E' or ls_tipo_mov_h='A' or ls_tipo_mov_h='F' then
									if ls_base_h='G' then 
										ll_cod_parque_ctto		= 150
									elseif ls_base_h='F' then
										ll_cod_parque_ctto		= 142
									else
										ll_cod_parque_ctto		= ll_cod_parque
									end if
									if gs_rezago='S' then
										SELECT DISTINCT to_char("CLIENTE_REZAGO"."BASE"  || ''  || "CLIENTE_REZAGO"."SERIE" || '' || to_char("CLIENTE_REZAGO"."NUMERO") )
										INTO 		:ls_ctto_h
										FROM 	"CLIENTE_REZAGO"  
										WHERE 	( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
													( "CLIENTE_REZAGO"."COD_PAGO" = 'CU' OR "CLIENTE_REZAGO"."COD_PAGO" =  :ls_tipo_cob_h ) AND  
													( "CLIENTE_REZAGO"."FOLIO" = :ll_cupon_h )   ;
										ll_neto							= round(ll_tot_porctto / idb_iva,0)
										ll_total_iva						= Round(ll_neto * (idb_iva - 1),0)
										ll_exento							= 0
									else
										ll_neto							= round(ll_total_iva / (idb_iva - 1),0)
										ll_exento							= ll_tot_porctto - (ll_neto + ll_total_iva)
									end if
									if ll_exento<0 then ll_exento	= 0
									ls_fecha_pago_palabra			= f_retorna_fecha_palabra(date(gd_hoy))
									ls_monto_total_palabra			= sle_1.uo_convertir_numero(string(long(ll_tot_porctto)))
									
									for ll_indi_det_mp=1 to ll_tot_reg_m
										ls_ctto_det_h					= dw_multiproducto.getitemstring(ll_indi_det_mp,'contrato')
										ls_tipo_mov_det_h				= dw_multiproducto.getitemstring(ll_indi_det_mp,'tipo_mov')
										ll_total_iva_det_h				= dw_multiproducto.getitemnumber(ll_indi_det_mp,'totalitem')
										if ls_ctto_h = ls_ctto_det_h and (ls_tipo_mov_det_h='D' or ls_tipo_mov_det_h='X' or ls_tipo_mov_det_h='V') then
											ll_suma_iva_h				= ll_suma_iva_h + ll_total_iva_det_h
										end if
									next
									ll_neto_det_h						= round(ll_suma_iva_h  / (idb_iva - 1),0)
									ll_exento_det_h					= ll_tot_porctto - (ll_neto_det_h + ll_suma_iva_h)	
									if ll_exento_det_h < 0 then ll_exento_det_h=0
									INSERT INTO "INGRESO_NEWSING_CABECERA"  
												( "TIPO_COB",	"FOLIO",			"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE", 		"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",				"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 					"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",				"EXENTO",				"IVA",					"TOTAL",			"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
									VALUES 	( 'CU', 			:ll_cupon_h, 	:gd_hoy,				:ls_fecha_pago_palabra, 	:ll_cod_parque_ctto, 	:ls_ctto_h, 				:gd_uf,		:gs_caja, 		:gs_user, 		to_char(:ll_tot_porctto),	'0',				:is_proximo_pago, 	:ls_monto_total_palabra, 		to_char(:ll_tot_porctto),	'0',					'0',					'0',					:gi_rut,				:gs_rezago,		:ll_neto_det_h,		:ll_exento_det_h,		:ll_suma_iva_h,	:ll_tot_porctto,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
									USING	sqlca;
								end if
							end if
						next
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				else
					INSERT INTO	"INGRE"  
								 (	"FOLIO"    ,		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV", 	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 				"CONTRATO",	"COD_CAJA", 	"REZAGO",  		"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  ,			"USUARIO", "PAGO_EXTERNO",		"LUGAR_EXTERNO",	"AUX", 			"VIENE_DE",		"CODIGO_OTRO" ,		"SERVIPAG", 		"TRASPASO_E",	"COD_PARQUE",	"FECHA_ANT",	"NRO_CUPON")  
					VALUES 	 ( 	:al_folio,			:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov,	:ad_monto,	:ai_cuotas_pag, 		:gs_serie, 				:gi_numero, 	:gs_caja  , 		:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user , 	' '           , 				'interno'      , 			' '  , 				:ls_sociedad,	:ls_codigo_otro,		:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:ldt_fecha_ant,	:al_folio)
					USING		sqlca	;
					
					INSERT INTO	"INGRESO"  
								 (	"FOLIO"    , 		"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",	"REINGRESO",	"CODIGO_SERVICIO",		"NRO_CUPON",		"TIPO_COB_ORIGINAL",	"FECHA_ANT")  
					VALUES 	 (	:al_folio,			:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 			:gs_rezago,  	:gd_uf    ,   		'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,	:ls_reingreso,	:ll_cod_servicio,			:al_folio,				:gs_tipo_cobro,				:ldt_fecha_ant)
					USING			sqlca	;	
					
				end if
			else
				if as_tipo_mov='F' or as_tipo_mov='E' then
					is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
				end if
				INSERT INTO	"INGRESO_NEWSING"  
							 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   "VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP",		"REINGRESO",	"CODIGO_SERVICIO",		"FECHA_ANT")  
				VALUES 	 (	:il_max_folio_new,	:gs_tipo_cobro, 	:gd_hoy     , 		:as_tipo_mov ,	:ad_monto, 	:ai_cuotas_pag, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 			:gs_rezago,  :gd_uf    ,   	'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			:ls_sociedad,	:ls_codigo_otro,	:ldt_fecha_serv,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap,		:ls_reingreso,	:ll_cod_servicio,			:ldt_fecha_ant)
				USING		sqlca	;	
			end if
		end if
	end if
end if
commit;
RETURN 0
end function

public subroutine wf_cargar_factura_electronica (string as_cuota, string as_cuota_mant, string as_doc, string as_paga_con, double abd_uf, long al_fila);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_total_iva,&
			ll_suma_total,ll_corre,ll_sub_total,ll_mora,ll_gasto_cob,ll_sumar_todo,ll_sum_dscto,ls_sum_monto,ll_count_reg,ll_reg_cred,ll_plazo,ll_row,ll_count_reg_seg,&
			ll_cod_seguro,ll_monto_seguro,ll_suma_seguro,ll_otros,ll_min_boleta,ll_grupo,ll_pos,ll_cero=0,ll_cupon,ll_res2,ll_count_benef
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_tipo_codigo,ls_rut_empresa,ls_monto_desc,ls_cod_pago,&
			ls_cuota,ls_moneda,ls_moneda_ctto,ls_base_rezago,ls_serie_rezago,ls_nombre_rez,ls_ap_pat_rez,ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,&
			ls_nom_comp_rez,ls_ruta_elect,ls_nombre_archivo2,ls_fallecido,ls_rut_fallecido,ls_ctto
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_pago,ldt_fecha_prim
Double	ldb_prima,ldb_uf_pago,ldb_iva_factura,ll_monto_uf,ll_numero_rezago,ll_total_neto
SaveAsType TipoArchivo

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

dw_factura.reset()
ls_indica_serv		= '3'
//idb_iva	
ldt_fecha_pago		= datetime(date(st_fecha_pago.text),time('00:00:00'))
if gs_base='B' then
	SELECT	"FACTURAS_CADENA"."COD_PARQUE"
	INTO 		:ll_cod_parque
	FROM 	"FACTURAS_CADENA"
	WHERE ( "FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
			  ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
			  ( "FACTURAS_CADENA"."NUMERO" = :gi_numero )  
	USING	sqlca;
else
	SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
	INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant
	FROM 	"CADENA",	"CADENA_MORA"  
	WHERE ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			  (("CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING	sqlca;
end if
if sqlca.sqlcode = 100 then
	ls_base_rezago		= mid(gs_contrato_rezago,1,1)
	ls_serie_rezago	= mid(gs_contrato_rezago,3,1)
	ll_numero_rezago	= Double(mid(gs_contrato_rezago,5))
	SELECT	"CLIENTE_REZAGO"."COD_PARQUE",
				"CLIENTE_REZAGO"."NOMBRE", 
				"CLIENTE_REZAGO"."AP_PATERNO",   
				"CLIENTE_REZAGO"."AP_MATERNO",   
				"CIUDAD"."SIGLA_CIUDAD",   
				"COMUNA"."COMUNA",
				"CLIENTE_REZAGO"."DIRECCION_PART"
	INTO		:ll_cod_parque,
				:ls_nombre_rez,
				:ls_ap_pat_rez,
				:ls_ap_mat_rez,
				:ls_ciudad_rez,
				:ls_comuna_rez,
				:ls_direc_rez
	FROM 	"CIUDAD",	"CLIENTE_REZAGO",	"COMUNA"  
	WHERE ( "CLIENTE_REZAGO"."COMUNA_PART" = "COMUNA"."CODIGO_COMUNA" ) and  
			  ( "CLIENTE_REZAGO"."CIUDAD_PART" = "CIUDAD"."CODIGO_CIUDAD" ) and  
			  ( "CLIENTE_REZAGO"."BASE" = :ls_base_rezago ) AND  
			  ( "CLIENTE_REZAGO"."SERIE" = :ls_serie_rezago ) AND  
			  ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero_rezago ) AND  
			  ( "CLIENTE_REZAGO"."COD_PAGO" = :gs_tipo_cobro ) AND  
			  ( "CLIENTE_REZAGO"."FOLIO" = :gl_folio ) AND  
			  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago )   ;
	if isnull(ls_nombre_rez) then ls_nombre_rez=''
	if isnull(ls_ap_pat_rez) then ls_ap_pat_rez=''
	if isnull(ls_ap_mat_rez) then ls_ap_mat_rez=''
	if isnull(ls_ciudad_rez) then ls_ciudad_rez=''
	if isnull(ls_comuna_rez) then ls_comuna_rez=''
	if isnull(ls_direc_rez) then ls_direc_rez=''

	ls_nombre_rez			= UPPER(ls_nombre_rez)
	ls_ap_pat_rez			= UPPER(ls_ap_pat_rez)
	ls_ap_mat_rez			= UPPER(ls_ap_mat_rez)
	ls_ciudad_rez			= UPPER(ls_ciudad_rez)
	ls_comuna_rez			= UPPER(ls_comuna_rez)
	ls_direc_rez				= UPPER(ls_direc_rez)
	
	ls_nom_comp_rez		= ls_nombre_rez+' '+ls_ap_pat_rez+' '+ls_ap_mat_rez
	if len(ls_nom_comp_rez) > 40 then
		ls_nom_comp_rez	= mid(ls_nom_comp_rez,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	if len(ls_direc_rez) > 70 then
		ls_direc_rez			= mid(ls_direc_rez,1,70)
	end if
	ldt_fec_venc_cred		= datetime(date(gdt_fec_sistema),time('00:00:00'))
end if
CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
	CASE 1   //Cuponera
		ll_tot_reg				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount()
		ls_cuota					= as_cuota
	CASE 3	// Factura
		ll_tot_reg				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.rowcount()
		if ll_tot_reg > 0 then
			ll_reg_cred			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
			if ll_reg_cred > 0 then
				ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.GetItemNumber(ll_reg_cred, "cantidad") 
				CHOOSE CASE gs_base
					CASE 'F','G','V'	//Funeraria/CREMATORIO
						if w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.rowcount() > 0 then
							if gd_fecha_prox_pago=date('01/01/1900') then
								ls_cuota						= 'Cuota N° '+&
								string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
								' de '+string(w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_pago_plazo") )+&
								'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
							else
								if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_anexo_cuotas_pag")>=w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_pago_plazo") then
									ls_cuota					= 'Cuota N° '+&
									string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
									' de '+string(w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_pago_plazo") )+&
									'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
								else
									ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemdatetime(1, "producto_pago_fecha_prim")
									ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_anexo_cuotas_pag")
									gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
									ls_cuota					= 'Cuota N° '+&
									string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
									' de '+string(w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.GetItemNumber(1, "producto_pago_plazo") )+&
									'  Fecha Prox. Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
									'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
								end if
							end if
						else
							ls_cuota							= ''
						end if
				END CHOOSE
			end if
		end if
		
	CASE 4	// factura Servipac
		if gs_base='F' or gs_base='G' or gs_base='V' then
			SELECT	"PRODUCTO_PAGO"."FECHA_PRIM",	"PRODUCTO_ANEXO"."CUOTAS_PAG",	"PRODUCTO_PAGO"."PLAZO"  
			INTO 		:ldt_fecha_prim,							:ll_ctas_pag,									:ll_plazo  
			FROM 	"CADENA",   
						"PRODUCTO_ANEXO",   
						"PRODUCTO_PAGO"  
			WHERE ( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
					( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
					( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
					( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
					( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
					( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
					( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
					( ( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) )   ;
			if gd_fecha_prox_pago=date('01/01/1900') then
				ls_cuota						= 'Cuota N° '+string(ll_can_cta_cred+ll_ctas_pag)+' de '+string(ll_plazo )+'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
			else
				if ll_can_cta_cred+ll_ctas_pag >= ll_plazo then
					ls_cuota					= 'Cuota N° '+string(ll_can_cta_cred+ll_ctas_pag)+' de '+string(ll_plazo )+'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
					ls_cuota					= 'Cuota N° '+string(ll_can_cta_cred+ll_ctas_pag)+' de '+string(ll_plazo )+'  Fecha Prox. Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
					'  hora('+string(gdt_fec_sistema,"hh:mm")+')'
				end if
			end if
		end if
END CHOOSE

SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA_OFICINA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
INTO 		:ls_direc_origen,								:ls_comuna_origen,									:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elect
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
ls_direc_origen			= UPPER(trim(ls_direc_origen))
if len(ls_direc_origen) > 70 then
	ls_direc_origen		= mid(ls_direc_origen,1,70)
end if
ls_comuna_origen		= UPPER(ls_comuna_origen)
ls_ciudad_origen		= UPPER(ls_ciudad_origen)
if gs_rezago ='S' then
	ll_pos					= Pos(gs_nombre_completo, 'Telé')
	if ll_pos > 0 then
		ls_nom			= trim(mid(gs_nombre_completo,1, (ll_pos - 1)))
	else
		ls_nom			= trim(gs_nombre_completo)
	end if
	ls_dv					= gf_obtener_dv(gi_rut)
else
	if gs_base='B' then
		SELECT	"FACTURAS_CLIENTE_EXENTAS"."DV",	"FACTURAS_CLIENTE_EXENTAS"."NOMBRE",		"FACTURAS_CLIENTE_EXENTAS"."A_PATERNO",	"FACTURAS_CLIENTE_EXENTAS"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"FACTURAS_CLIENTE_EXENTAS"."DIRECCION_P",	"FACTURAS_CLIENTE_EXENTAS"."NUMERO_PARTICULAR",	"FACTURAS_CLIENTE_EXENTAS"."DEPTO_PARTICULAR",	"FACTURAS_CLIENTE_EXENTAS"."BLOCK_PARTICULAR",	"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"FACTURAS_CLIENTE_EXENTAS"."CELULAR",	"FACTURAS_CLIENTE_EXENTAS"."FONO_P",	"FACTURAS_CLIENTE_EXENTAS"."EMAIL"
		INTO		:ls_dv,											:ls_nom,														:ls_ap_pat,													:ls_ap_mat,													:ls_tipo_via,							:ls_direc,														:ls_nro,																	:ls_depto,																:ls_block,																:ls_comuna,					:ls_ciudad,						:ls_celular,												:ls_fono_part,											:ls_email
		FROM 	"CIUDAD",	"FACTURAS_CLIENTE_EXENTAS",	"COMUNA",	"TIPO_VIA"  
		WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "FACTURAS_CLIENTE_EXENTAS"."CIUDAD" ) and  
				  ( "COMUNA"."CODIGO_COMUNA" = "FACTURAS_CLIENTE_EXENTAS"."COMUNA" ) and  
				  ( "FACTURAS_CLIENTE_EXENTAS"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
				  (("FACTURAS_CLIENTE_EXENTAS"."RUT" = :gi_rut ) ) 
		USING	sqlca;
	else
		SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",		"CLIENTE"."BLOCK_PARTICULAR",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P",	"CLIENTE"."EMAIL"
		INTO		:ls_dv,				:ls_nom,						:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via,							:ls_direc,							:ls_nro,										:ls_depto,									:ls_block,									:ls_comuna,					:ls_ciudad,						:ls_celular,					:ls_fono_part,			:ls_email
		FROM 	"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
		WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
				  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE"."COMUNA" ) and  
				  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
				  (("CLIENTE"."RUT" = :gi_rut ) ) 
		USING	sqlca;
	end if
end if
if sqlca.sqlcode=0 then
	ls_comuna		= UPPER(ls_comuna)
	if len(ls_comuna) > 20 then
		ls_comuna	= trim(mid(ls_comuna,1,20))
	end if
	ls_ciudad			= UPPER(ls_ciudad)
	if len(ls_ciudad) > 20 then
		ls_ciudad		= trim(mid(ls_ciudad,1,20))
	end if
	if isnull(ls_celular) or ls_celular='-' or len(ls_celular)=0 or ls_celular='*' then
		ls_celular	= ''
	end if
	if isnull(ls_fono_part) or ls_fono_part='-' or ls_fono_part='*' or len(ls_fono_part)=0 then
		ls_fono_part	= ''
	end if
	if ls_celular <> '' and ls_fono_part <> '' then
		ls_contacto	= 'Cel.: '+ls_celular+' - FP.: '+ls_fono_part
	elseif ls_celular <> '' and ls_fono_part = '' then
		ls_contacto	= 'Cel.: '+ls_celular
	elseif ls_celular = '' and ls_fono_part <> '' then
		ls_contacto	= 'FP: '+ls_fono_part
	elseif ls_fono_part = '' and ls_celular = '' then
		ls_contacto	= 'S/F'
	end if
	ls_rut				= string(gi_rut)+'-'+ls_dv
	if isnull(ls_nom) or ls_nom= '' or ls_nom=' ' or ls_nom='-' or ls_nom='*' then
		ls_nom		= ''
	end if
	if isnull(ls_ap_pat) or ls_ap_pat= '' or ls_ap_pat=' ' or ls_ap_pat='-' or ls_ap_pat='*' then
		ls_ap_pat	= ''
	end if
	if isnull(ls_ap_mat) or ls_ap_mat= '' or ls_ap_mat=' ' or ls_ap_mat='-' or ls_ap_mat='*' then
		ls_ap_mat	= ''
	end if
	ls_nom_comp	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	if len(ls_nom_comp) > 40 then
		ls_nom			= mid(ls_nom_comp,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	
	if isnull(ls_tipo_via) or ls_tipo_via= '' or ls_tipo_via=' ' or ls_tipo_via='-' or ls_tipo_via='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_direc) or ls_direc= '' or ls_direc=' ' or ls_direc='-' or ls_direc='*' then
		ls_direc		= ''
	end if
	if isnull(ls_nro) or ls_nro= '' or ls_nro=' ' or ls_nro='-' or ls_nro='*' then
		ls_nro			= ''
	end if
	if isnull(ls_depto) or ls_depto= '' or ls_depto=' ' or ls_depto='-' or ls_depto='*' then
		ls_depto		= ''
	end if
	if isnull(ls_block) or ls_block= '' or ls_block=' ' or ls_block='-' or ls_block='*' then
		ls_block		= ''
	end if
	if isnull(ls_comuna) or ls_comuna= '' or ls_comuna=' ' or ls_comuna='-' or ls_comuna='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_ciudad) or ls_ciudad= '' or ls_ciudad=' ' or ls_ciudad='-' or ls_ciudad='*' then
		ls_tipo_via	= ''
	end if
	ls_direc_comp	= ls_tipo_via+' '+ls_direc
	if ls_nro <> '' then
		ls_direc_comp	= ls_direc_comp+' N° '+ls_nro
	end if
	if ls_depto <> '' then
		ls_direc_comp	= ls_direc_comp+' Dpto.'+ls_depto
	end if
	if ls_block <> '' then
		ls_direc_comp	= ls_direc_comp+' Block '+ls_block
	end if
	if len(ls_direc_comp) > 70 then
		ls_direc_comp	= mid(ls_direc_comp,1,70)
	end if
else
	ls_nom_comp	= '-'
	ls_direc_comp	= '-'
end if
//if w_ingreso2.tab_ingreso.SelectedTab = 1 then
//	if gs_base='F' then
//		ls_tipo_dte		= '33'
//	else
//		ls_tipo_dte		= '34'
//	end if
////	SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
////	INTO 		:ll_min_boleta
////	FROM 	"ELECTRONICA_FB",   
////				"ELECTRONICA_FB_DETALLE"  
////	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
////			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
////			  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
////			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
////			  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
////			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )  ;
//
//	SELECT	"ELECTRONICA_FB"."GRUPO"  
//	INTO 		:ll_grupo  
//	FROM 	"ELECTRONICA_FB"  
//	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
//	 		  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
//			  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
//
//	UPDATE		"ELECTRONICA_FB_DETALLE"  
//	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
//					"RUT" = :gi_rut,   
//					"ESTADO_REG" = 'P',   
//					"DV" = :gs_dv,   
//					"NOMBRE_CLIENTE" = :ls_nom_comp, 
//					"USUARIO_CREA" = :gs_user,
//					"BASE"  = :gs_base,
//					"SERIE" = :gs_serie,
//					"NUMERO" = :gi_numero,
//					"IP_EQUIPO" = :gs_tcp_ip
//	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
//				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
//				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
//				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = (  SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
//																							FROM 	"ELECTRONICA_FB",   
//																										"ELECTRONICA_FB_DETALLE"  
//																							WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
//																									  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
//																									  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
//																									  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
//																									  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
//																									  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
//																									  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )            ) ) AND  
//				  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   
//	USING		sqlca;		  
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	end if
//	
//	SELECT	"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO"
//	INTO 		:ll_min_boleta
//	FROM 	"ELECTRONICA_FB",   
//				"ELECTRONICA_FB_DETALLE"  
//	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
//			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
//			  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
//			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  //'BE'
//			  ( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
//			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
//			  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
//			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )  ;
//			  
//	gl_folio				= ll_min_boleta
//
//elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then
//	if w_ingreso2.tab_ingreso.tp_ci.cbx_manual_ci.checked=true then
//		ls_tipo_dte		= '35'
//	elseif w_ingreso2.tab_ingreso.tp_ci.cbx_manual_ci.checked=false then
//		if w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked=true then
//			ls_tipo_dte	= '39'
//		elseif w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked=true then
//			ls_tipo_dte	= '41'
//		end if
//	end if
//elseif w_ingreso2.tab_ingreso.SelectedTab = 4 then
//	if w_ingreso2.tab_ingreso.tp_boletas.cbx_manual_factura.checked=true then
//		ls_tipo_dte		= '30'
//	else
//		if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked=true then
//			ls_tipo_dte	= '33'
//		elseif w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
//			ls_tipo_dte	= '34'
//		end if
//	end if
//elseif  w_ingreso2.tab_ingreso.SelectedTab = 5 then
//	ls_tipo_dte			= '34'
//end if
SELECT 	"ELECTRONICA_FB_TIPO"."TIPO_DTE"  
INTO 		:ls_tipo_dte  
FROM 	"ELECTRONICA_FB_TIPO"  
WHERE 	"ELECTRONICA_FB_TIPO"."TIPO_DOCUMENTO" = :gs_tipo_cobro   
USING	sqlca;
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= '<ENCABEZADO>'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Impresora'+Space(21)+' | '
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_tipo_dte) then ls_tipo_dte=''
ls_string_boleta	= 'Tipo DTE'+Space(22)+' | '+ls_tipo_dte
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Folio'+Space(25)+' | '+string(gl_folio)
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(st_fecha_pago.text),'dd-mm-yyyy')
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)

ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_direc_comp) then ls_direc_comp=''
ls_string_boleta	= 'Direccion Origen'+Space(14)+' | '+ls_direc_origen
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_comuna) then ls_comuna=''
ls_string_boleta	= 'Comuna Origen'+Space(17)+' | '+ls_comuna_origen
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_ciudad) then ls_ciudad=''
ls_string_boleta	= 'Ciudad Origen'+Space(17)+' | '+ls_ciudad_origen
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)

ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_rut) then ls_rut=''
ls_string_boleta	= 'Rut Receptor'+Space(18)+' | '+ls_rut
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Codigo Interno Receptor'+Space(7)+' | '+string(gi_rut)
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
if isnull(ls_nom_comp) then ls_nom_comp=''
ls_string_boleta	= 'Razon Social Receptor'+Space(9)+' | '+ls_nom_comp
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Contacto Receptor'+Space(13)+' | '+ls_contacto
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if isnull(ls_contacto) then ls_contacto='S/F'
if gs_rezago='S' then
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_direc_comp) then ls_direc_comp=''
	ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_rez
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_comuna) then ls_comuna=''
	ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna_rez
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_ciudad) then ls_ciudad=''
	ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad_rez
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
else
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_direc_comp) then ls_direc_comp=''
	ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_comp
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_comuna) then ls_comuna=''
	ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	if isnull(ls_ciudad) then ls_ciudad=''
	ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
end if
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Giro del Receptor'+Space(13)+' | '+'CLIENTE'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	ll_sumar_todo		= round(w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'c_total_pago_cuota'),0)
	ll_sum_dscto		= 0
	ll_sumar_todo		= round(ll_sumar_todo - ll_sum_dscto,0)
	ll_total_neto			= round(ll_sumar_todo / idb_iva,0)
	ll_total_iva			= round(ll_sumar_todo - ll_total_neto,0)
	ll_suma_total		= ll_total_neto + ll_total_iva
	ll_sub_total			= ll_total_neto
elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then
	//
elseif w_ingreso2.tab_ingreso.SelectedTab = 4 then
	if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked=true then
		ll_total_neto			= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_total_neto'),0)
		if gs_rezago='S' then
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_todo_uf'),0)
			ll_sum_dscto	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_dscto_uf'),0)
			if ll_sumar_todo=0 or isnull(ll_sumar_todo) then
				ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_todo'),0)
				ll_sum_dscto	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_dscto'),0)
			end if
		else
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_todo'),0)
			ll_sum_dscto	= round(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_sumar_dscto'),0)
		end if
		ll_sumar_todo		= round(ll_sumar_todo - ll_sum_dscto,0)
		ll_total_neto			= round(ll_sumar_todo / idb_iva,0)
		ll_total_iva			= round(ll_sumar_todo - ll_total_neto,0)
		ll_suma_total		= ll_total_neto + ll_total_iva
	elseif w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
		ll_total_neto		= gd_total
		ll_sub_total		= gd_total
		ll_total_iva		= 0
		ll_suma_total	= gd_total
	end if

elseif w_ingreso2.tab_ingreso.SelectedTab = 5 then
	ll_row					= w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getrow()
	ll_sumar_todo		= round(w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getitemnumber(ll_row,'monto_cuota'),0)
	ll_total_neto			= round(ll_sumar_todo / idb_iva,0)
	ll_sum_dscto		= ll_sumar_todo - ll_total_neto
	ll_total_iva			= ll_sum_dscto
	ll_suma_total		= ll_sumar_todo
end if
if w_ingreso2.tab_ingreso.SelectedTab = 4 then
	if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked=true then
		ll_sub_total		= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(1,'c_subtotal_neto')
	elseif w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
		ll_sub_total		= gd_total
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 5 then
	ll_sub_total			= ll_total_neto
end if
ll_new_reg				= dw_factura.insertrow(0)
if ll_total_neto <> ll_sub_total then
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '		//+string(ll_sub_total)
else
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '		//+string(ll_total_neto)
end if
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(ll_total_neto)
else
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '
end if
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'IVA'+Space(27)+' | '		//+string(ll_total_iva)
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(ll_total_neto,'###########0')		//string(ll_suma_total,'###########0')
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(ll_total_neto))		//ll_suma_total
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)

ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'IP Equipo'+Space(20)+'  | '+gs_tcp_ip
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Direccion Emisor'+Space(13)+'  | '+'Estado 360 Piso 2'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Comuna Emisor'+Space(16)+'  | '+'Santiago'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'Ciudad Emisor'+Space(16)+'  | '+'Santiago'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if  gs_base <> 'B' then
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'x Cuota Credito'+Space(14)+'  | '+ls_cuota
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'x Cuota Mantencion'+Space(11)+'  | '+as_cuota_mant
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
end if
ll_new_reg			= dw_factura.insertrow(0)
if gs_rezago='S' then
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+ls_base_rezago+ls_serie_rezago+string(ll_numero_rezago)
else
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+as_doc
end if
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'x Paga en Efectivo'+Space(11)+'  | '+as_paga_con
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'x U.F. dia'+Space(19)+'  | '+string(abd_uf,'###,###,###,##0.0###')
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg			= dw_factura.insertrow(0)
ls_string_boleta	= 'x Caja'+Space(23)+'  | '+gs_caja
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if gs_base='B' then
	DECLARE 	x01 CURSOR FOR  
	SELECT 		"FACTURAS_DOCUMENTOS"."COD_PAGO",   
					sum( "FACTURAS_DOCUMENTOS"."MONTO") as MONTO,
					Count("FACTURAS_DOCUMENTOS"."COD_PAGO")  
	FROM			"FACTURAS_DOCUMENTOS"  
	WHERE 	  ( "FACTURAS_DOCUMENTOS"."TIPO_COB" = :gs_tipo_cobro ) AND  
				  ( "FACTURAS_DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
				  ( "FACTURAS_DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago )   
	GROUP BY   "FACTURAS_DOCUMENTOS"."COD_PAGO"  
	ORDER BY   "FACTURAS_DOCUMENTOS"."COD_PAGO" ASC 
	USING		sqlca;
	open x01;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x01 into :ls_cod_pago, :ls_sum_monto,:ll_count_reg;
			if not isnull(ls_cod_pago) and not isnull(ls_sum_monto) and not isnull(ll_count_reg) then
				choose case ls_cod_pago
					case 'EF'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Efectivo'+Space(13)+'  | '+string(ls_sum_monto,'###,###,###,##0')		//+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'CH'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'TC'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Tarjeta Credito'+Space(6)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'TD'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Tarjeta Debito'+Space(7)+'  | '+string(ls_sum_monto,'###,###,###,##0')		//+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end choose
				Setnull(ls_cod_pago);Setnull(ls_sum_monto);Setnull(ll_count_reg)
			end if
		loop
	end if
	close x01;
else
	DECLARE 	x1 CURSOR FOR  
	SELECT 		"DOCUMENTOS"."COD_PAGO",   
					sum( "DOCUMENTOS"."MONTO") as MONTO,
					Count("DOCUMENTOS"."COD_PAGO")  
	FROM			"DOCUMENTOS"  
	WHERE 	  ( "DOCUMENTOS"."TIPO_COB" = :gs_tipo_cobro ) AND  
				  ( "DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
				  ( "DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago )   
	GROUP BY   "DOCUMENTOS"."COD_PAGO"  
	ORDER BY   "DOCUMENTOS"."COD_PAGO" ASC 
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x1 into :ls_cod_pago, :ls_sum_monto,:ll_count_reg;
			if not isnull(ls_cod_pago) and not isnull(ls_sum_monto) and not isnull(ll_count_reg) then
				choose case ls_cod_pago
					case 'EF'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Efectivo'+Space(13)+'  | '+string(ls_sum_monto,'###,###,###,##0')		//+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'CH'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'TC'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Tarjeta Credito'+Space(6)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					case 'TD'
						ll_new_reg			= dw_factura.insertrow(0)
						ls_string_boleta	= 'x Total Tarjeta Debito'+Space(7)+'  | '+string(ls_sum_monto,'###,###,###,##0')		//+' ('+string(ll_count_reg)+')'
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end choose
				Setnull(ls_cod_pago);Setnull(ls_sum_monto);Setnull(ll_count_reg)
			end if
		loop
	end if
	close x1;
end if
ll_new_reg						= dw_factura.insertrow(0)
ls_string_boleta				= '<DETALLE>'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
ll_new_reg						= dw_factura.insertrow(0)
ls_string_boleta				= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Descripcion Adicional al Item | Cantidad | Precio Unitario Item | Monto Item | x Monto UF'
dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	ll_corre					= 1
	ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemstring(al_fila,'cuponeras_detalle_tipo_mov')
	if ls_tipo_cob <> 'S' then
		ls_tipo_cob_otro	= '0'
		ll_cantidad			= 1
		ll_monto				= ll_total_neto
		ll_total				= round(ll_cantidad * ll_monto,0)
		SELECT		"TIPO_COBRO"."DESCRIPCION"  
		INTO 			:ls_descrip_cobro  
		FROM 		"TIPO_COBRO"  
		WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
					  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
		USING		sqlca;

		SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
		INTO 			:ls_descrip_otro  
		FROM 		"CUENTA_CONTABLE_OTROS"  
		WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
		USING		sqlca;

		ls_descrip_cobro		= UPPER(ls_descrip_cobro)
		if isnull(ls_tipo_cob) then ls_tipo_cob=''
		if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
		if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
		if ls_tipo_cob = 'S' then
			ls_monto_desc		= string(ll_monto)
			ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
			ll_total				= 0
		else
			ls_monto_desc		= '0'
		end if
		ll_monto_uf				= round(ll_monto / abd_uf,4)
		if ls_tipo_cob = 'L' then
			ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		else
			ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		end if
		if not isnull(ls_string_boleta) then
			ll_new_reg			= dw_factura.insertrow(0)
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		end if
	end if
	ll_otros						= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_otros_cobros')
	if ll_otros > 0 then
		DECLARE x11 CURSOR FOR  
		SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
					"SEGURO_ASOCIADOS"."MONTO_PRIMA",
					"SEGURO_ASOCIADOS"."MONEDA"
		FROM 	"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
		USING	sqlca;
		open x11;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x11 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto;
				if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
					if ls_moneda_ctto = '1' then
						ll_total_neto			= round(ldb_prima,0)
					elseif ls_moneda_ctto = '2' then
						ll_total_neto			= round(ldb_prima * abd_uf,0)
					end if
					ll_corre ++
					ls_tipo_cob				= String(ll_cod_seguro)
					ls_tipo_cob_otro		= '0'
					ll_cantidad				= 1
					ll_monto					= ll_total_neto
					ll_total					= round(ll_cantidad * ll_monto,0)
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
					ls_monto_desc			= '0'
					ll_monto_uf				= round(ll_monto / abd_uf,4)
					ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					ll_new_reg				= dw_factura.insertrow(0)
					dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end if
				setnull(ll_cod_seguro)
			loop
		end if
		close x11;
	end if
	ll_mora						= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_interes_mora')
	ll_gasto_cob					= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_gasto_cobranza')
	if ll_mora > 0 then
		ll_corre ++
		ls_tipo_cob				= 'G'
		ls_descrip_cobro		= 'MORA'
		ls_descrip_otro			= ''
		ll_cantidad				= 1
		ls_monto_desc			= '0'
		ll_monto_uf				= round(ll_mora / abd_uf,4)
		ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		ll_new_reg				= dw_factura.insertrow(0)
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	end if
	if ll_gasto_cob > 0 then
		ll_corre ++
		ls_tipo_cob				= 'J'
		ls_descrip_cobro		= 'GASTO COBRANZA'
		ll_cantidad				= 1
		ls_descrip_otro			= ''
		ls_monto_desc			= '0'
		ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
		ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		ll_new_reg				= dw_factura.insertrow(0)
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	ll_tot_reg						= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
	if ll_tot_reg>0 then
		ll_corre						= 0
		for ll_indi=1 to ll_tot_reg
			ll_corre ++
			ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob <> 'S' then//
				ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
				ll_cantidad			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'cantidad')
				if w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked=true then
					//ll_monto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_neto')
					ll_monto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
				elseif w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked=true then
					ll_monto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
				end if
				ll_total				= round(ll_cantidad * ll_monto,0)
				if gs_base = 'F' or gs_base='G' or gs_base='V' then
//					ls_tipo_cob_otro	= '0'
					ll_cantidad			= 1
//					ll_monto				= ll_total_neto
					ll_total				= round(ll_cantidad * ll_monto,0)
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   AND
									"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro
					USING		sqlca;
					
					SELECT 		Count("PRODUCTO_BENEFICIARIO"."NOMBRE")
					INTO 			:ll_count_benef  
					FROM 		"PRODUCTO_BENEFICIARIO"  
					WHERE 	( "PRODUCTO_BENEFICIARIO"."BASE" = :gs_base ) AND  
								( "PRODUCTO_BENEFICIARIO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_BENEFICIARIO"."NUMERO" = :gi_numero )   
					USING	sqlca;
					if ll_count_benef = 1 then
						SELECT 		to_char("PRODUCTO_BENEFICIARIO"."NOMBRE"||' '||"PRODUCTO_BENEFICIARIO"."A_PATERNO"||' '||"PRODUCTO_BENEFICIARIO"."A_MATERNO") as nombre_benef,   
										to_char("PRODUCTO_BENEFICIARIO"."RUT")||'-'||"PRODUCTO_BENEFICIARIO"."DV",   
										"PRODUCTO_BENEFICIARIO"."BASE"|| "PRODUCTO_BENEFICIARIO"."SERIE" ||to_char("PRODUCTO_BENEFICIARIO"."NUMERO") as ctto,   
										count("PRODUCTO_BENEFICIARIO"."BASE")  
						INTO			:ls_fallecido,
										:ls_rut_fallecido,
										:ls_ctto
						FROM 		"PRODUCTO_BENEFICIARIO"  
						WHERE 	( "PRODUCTO_BENEFICIARIO"."BASE" = :gs_base ) AND  ( "PRODUCTO_BENEFICIARIO"."SERIE" = :gs_serie ) AND  	( "PRODUCTO_BENEFICIARIO"."NUMERO" = :gi_numero )   
						GROUP BY "PRODUCTO_BENEFICIARIO"."NOMBRE",   	"PRODUCTO_BENEFICIARIO"."A_PATERNO",   "PRODUCTO_BENEFICIARIO"."A_MATERNO",   "PRODUCTO_BENEFICIARIO"."RUT",   "PRODUCTO_BENEFICIARIO"."DV",   "PRODUCTO_BENEFICIARIO"."BASE",   "PRODUCTO_BENEFICIARIO"."SERIE",   "PRODUCTO_BENEFICIARIO"."NUMERO"  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if isnull(ls_fallecido) then ls_fallecido='-'
							if isnull(ls_rut_fallecido) then ls_rut_fallecido='-'
							if isnull(ls_ctto) then ls_ctto='-'
							ls_descrip_otro	= ls_descrip_otro + ', Serv.FUN. Sr(a) '+ls_fallecido+' '+'Rut '+ls_rut_fallecido+' Ctto. '+ls_ctto
						end if
					end if
				else
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro AND
									"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro
					USING		sqlca;
				end if
				ls_descrip_cobro		= UPPER(ls_descrip_cobro)
				if isnull(ls_tipo_cob) then ls_tipo_cob=''
				if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
				if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
				if ls_tipo_cob = 'S' then
					ls_monto_desc		= string(ll_monto)
					ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
					ll_total				= 0
				else
					ls_monto_desc		= '0'
				end if
				ll_monto_uf				= round(ll_monto / abd_uf,4)
				if ls_tipo_cob = 'L' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				end if
				if not isnull(ls_string_boleta) then
					ll_new_reg			= dw_factura.insertrow(0)
					dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end if
			end if	//
		next
		ll_mora						= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'mora')
		ll_gasto_cob					= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'gastos_cob')
		if ll_mora > 0 then
			ll_corre ++
			ls_tipo_cob				= 'G'
			ls_descrip_cobro		= 'MORA'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_mora / abd_uf,4)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_factura.insertrow(0)
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		end if
		if ll_gasto_cob > 0 then
			ll_corre ++
			ls_tipo_cob				= 'J'
			ls_descrip_cobro		= 'GASTO COBRANZA'
			ll_cantidad				= 1
			ls_descrip_otro			= ''
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_factura.insertrow(0)
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		end if
		
		ll_reg								= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'L' or tipo_cob = 'S'", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			Setnull(ll_corre)
			ll_corre						= 0  
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob')
				if ls_tipo_cob = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
					ll_cantidad			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'cantidad')
					ll_monto				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'monto')
					ll_total				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
					USING		sqlca;
			
					ls_descrip_cobro		= UPPER(ls_descrip_cobro)
					if isnull(ls_tipo_cob) then ls_tipo_cob=''
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
					if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
					if ls_tipo_cob = 'S' then
						ls_tipo_codigo		= 'D'
						ll_total				= ll_total * -1
					end if
					if ls_tipo_cob_otro <> '0' then
						ls_descrip_cobro	= UPPER(ls_descrip_otro)
					end if
					ls_string_boleta		= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_factura.insertrow(0)
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					end if
				end if
			next
		end if	//
	end if		
	
	
elseif w_ingreso2.tab_ingreso.SelectedTab = 4 then
	ll_tot_reg						= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.rowcount()
	if ll_tot_reg>0 then
		ll_corre						= 0
		for ll_indi=1 to ll_tot_reg
			ll_corre ++
			ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob <> 'S' then//
				ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
				ll_cantidad			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'cantidad')
				if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked=true then
					ll_monto			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'c_monto_neto')
				elseif w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
					ll_monto			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'c_total_linea')
				end if
				ll_total				= round(ll_cantidad * ll_monto,0)
				SELECT		"TIPO_COBRO"."DESCRIPCION"  
				INTO 			:ls_descrip_cobro  
				FROM 		"TIPO_COBRO"  
				WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
							  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
				USING		sqlca;
		
				SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
				INTO 			:ls_descrip_otro  
				FROM 		"CUENTA_CONTABLE_OTROS"  
				WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro AND
								"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro
				USING		sqlca;
		
				ls_descrip_cobro		= UPPER(ls_descrip_cobro)
				if isnull(ls_tipo_cob) then ls_tipo_cob=''
				if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
				if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
				if ls_tipo_cob = 'S' then
					ls_monto_desc		= string(ll_monto)
					ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
					ll_total				= 0
				else
					ls_monto_desc		= '0'
				end if
				ll_monto_uf				= round(ll_monto / abd_uf,4)
				if ls_tipo_cob = 'L' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				end if
				if not isnull(ls_string_boleta) then
					ll_new_reg			= dw_factura.insertrow(0)
					dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end if
			end if	//
		next
		ll_mora						= w_ingreso2.tab_ingreso.tp_boletas.dw_gastos_bl.getitemnumber(1,'mora')
		ll_gasto_cob					= w_ingreso2.tab_ingreso.tp_boletas.dw_gastos_bl.getitemnumber(1,'gastos_cob')
		if ll_mora > 0 then
			ll_corre ++
			ls_tipo_cob				= 'G'
			ls_descrip_cobro		= 'MORA'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_mora / abd_uf,4)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_factura.insertrow(0)
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		end if
		if ll_gasto_cob > 0 then
			ll_corre ++
			ls_tipo_cob				= 'J'
			ls_descrip_cobro		= 'GASTO COBRANZA'
			ll_cantidad				= 1
			ls_descrip_otro			= ''
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_factura.insertrow(0)
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		end if
		
		ll_reg								= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.Find("tipo_cob = 'L' or tipo_cob = 'S'", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			Setnull(ll_corre)
			ll_corre						= 0  
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
				if ls_tipo_cob = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
					ll_cantidad			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'cantidad')
					ll_monto				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'monto')
					ll_total				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemnumber(ll_indi,'c_total_linea')
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
					USING		sqlca;
			
					ls_descrip_cobro		= UPPER(ls_descrip_cobro)
					if isnull(ls_tipo_cob) then ls_tipo_cob=''
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
					if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
					if ls_tipo_cob = 'S' then
						ls_tipo_codigo		= 'D'
						ll_total				= ll_total * -1
					end if
					if ls_tipo_cob_otro <> '0' then
						ls_descrip_cobro	= UPPER(ls_descrip_otro)
					end if
					ls_string_boleta		= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_factura.insertrow(0)
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					end if
				end if
			next
		end if	//
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 5 then
	ll_corre					= 0
	ll_corre ++
	ll_row						= w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getrow()
	ll_sumar_todo			= round(w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getitemnumber(ll_row,'monto_cuota'),0)
	ldt_fecha_pago			= w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getitemdatetime(ll_row,'fecha_pago')
	
	SELECT "TAB_UF"."VALOR_UF"  INTO :ldb_uf_pago  FROM "TAB_UF"  WHERE "TAB_UF"."FECHA_UF" = :ldt_fecha_pago   ;
	
	ll_suma_seguro		= 0
	ll_cantidad				= 1
	ll_gasto_cob				= round(w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getitemnumber(ll_row,'gasto_cob'),0)
	ll_mora					= round(w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getitemnumber(ll_row,'interes'),0)
	ll_monto					= round(ll_sumar_todo / idb_iva,0)
	ll_total					= ll_monto
	SELECT 	COUNT("SEGURO_ASOCIADOS"."MONTO_PRIMA")
	INTO		:ll_count_reg_seg
	FROM		"SEGURO_ASOCIADOS"  
	WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
			( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
			( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
			( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
			( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
	if ll_count_reg_seg > 0 then
		DECLARE x2 CURSOR FOR  
		SELECT 	"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
					"SEGURO_ASOCIADOS"."COD_SEGURO",   
					"SEGURO_ASOCIADOS"."MONEDA"  
		FROM		"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) 
		USING	sqlca;
		open x2;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x2 into :ldb_prima, :ll_cod_seguro, :ls_moneda;
				if ldb_prima > 0 and not isnull(ldb_prima) and not isnull(ll_cod_seguro) then
					ls_tipo_cob				= string(ll_cod_seguro)
					if ls_moneda ='2' then
						ll_monto_seguro	= round(ldb_prima * ldb_uf_pago,0)
					else
						ll_monto_seguro	= round(ldb_prima,0)
					end if
					if ll_monto_seguro > 0 then
						SELECT		"TIPO_COBRO"."DESCRIPCION"  
						INTO 			:ls_descrip_cobro  
						FROM 		"TIPO_COBRO"  
						WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
									  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
						USING		sqlca;
				
						SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
						INTO 			:ls_descrip_otro  
						FROM 		"CUENTA_CONTABLE_OTROS"  
						WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
						USING		sqlca;
				
						ls_descrip_cobro		= UPPER(ls_descrip_cobro)
						if isnull(ls_tipo_cob) then ls_tipo_cob=''
						if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
						if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
						ll_monto_uf			= round(ll_monto / abd_uf,4)
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
						if not isnull(ls_string_boleta) then
							ll_new_reg			= dw_factura.insertrow(0)
							dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
						end if
					end if
					ll_suma_seguro		= ll_suma_seguro + ll_monto_seguro
				end if
				Setnull(ldb_prima);Setnull(ll_cod_seguro)
			loop
		end if
		close x2;
		ll_total									= ll_total - ll_suma_seguro
		if ll_total < 0 or isnull(ll_total) then ll_total=0
		ll_monto									= ll_total
	end if
	ll_monto_uf				= round(ll_monto / abd_uf,4)
	ll_new_reg				= dw_factura.insertrow(0)
	ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+'E'+' | '+'CUOTA'+' | '+''+' | '+'1'+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	
	if ll_mora > 0 then
		ll_corre ++
		ls_tipo_cob				= 'G'
		ls_descrip_cobro		= 'MORA'
		ls_descrip_otro			= ''
		ll_cantidad				= 1
		ls_monto_desc			= '0'
		ll_monto_uf				= round(ll_mora / abd_uf,4)
		ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		ll_new_reg				= dw_factura.insertrow(0)
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	end if
	if ll_gasto_cob > 0 then
		ll_corre ++
		ls_tipo_cob				= 'J'
		ls_descrip_cobro		= 'GASTO COBRANZA'
		ll_cantidad				= 1
		ls_descrip_otro			= ''
		ls_monto_desc			= '0'
		ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
		ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
		ll_new_reg				= dw_factura.insertrow(0)
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	end if
end if

//ls_nombre_archivo	= 'C:\prueba_be\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//ls_nombre_archivo		= '\\Boleta_elect\LA-FLORIDA-PROD\InFUD\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//ls_nombre_archivo		= '\\Boleta_elect\InFud-la florida\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'

ls_nombre_archivo		= ls_ruta_elect+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
ls_nombre_archivo2		= 'C:\mod_cp\consulta\Boletas_Electronicas\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
 
TipoArchivo 					= Text!
ll_res							= dw_factura.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) // EncodingUTF8!)
ll_res2						= dw_factura.SaveAs( ls_nombre_archivo2,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) // EncodingUTF8!)
If ll_res < 0  Then
	MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
End If	
ldb_iva_factura				= idb_iva   //(idb_iva - 1) * 100
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	ll_cupon 					= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.GetItemNumber(al_fila, "cuponeras_detalle_nro_cupon")
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
					"RUT" = :gi_rut,   
					"ESTADO_REG" = 'G',   
					"DV" = :ls_dv,   
					"NOMBRE_CLIENTE" = :ls_nom,   
					"MONTO_AFECTO" = :ll_total_neto,   
					"MONTO_EXENTO" = :ll_cero,   
					"MONTO_IVA" = :ll_total_iva,   
					"MONTO_TOTAL" = :ll_suma_total,   
					"USUARIO_CREA" = :gs_user,   
					"BASE" = :gs_base,   
					"SERIE" = :gs_serie,   
					"NUMERO" = :gi_numero,
					"COD_CAJA" = :gs_caja,
					"TIPO_DTE" = :ls_tipo_dte ,
					"ESTADO_DOCUMENTO" = '' ,
					"TASA_IVA" = ((:idb_iva - 1) * 100),
					"TIPO_DOC_ASOC" = :gs_tipo_cobro,
					"FOLIO_ASOC" = :ll_cupon
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																			FROM 	  "ELECTRONICA_FB" 
																			WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																						( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																						( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) ) ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND
				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
				  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
				  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )
	USING		sqlca;
else
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
					"RUT" = :gi_rut,   
					"ESTADO_REG" = 'G',   
					"DV" = :ls_dv,   
					"NOMBRE_CLIENTE" = :ls_nom,   
					"MONTO_AFECTO" = :ll_total_neto,   
					"MONTO_EXENTO" = :ll_cero,   
					"MONTO_IVA" = :ll_total_iva,   
					"MONTO_TOTAL" = :ll_suma_total,   
					"USUARIO_CREA" = :gs_user,   
					"BASE" = :gs_base,   
					"SERIE" = :gs_serie,   
					"NUMERO" = :gi_numero,
					"COD_CAJA" = :gs_caja,
					"TIPO_DTE" = :ls_tipo_dte ,
					"ESTADO_DOCUMENTO" = '' ,
					"TASA_IVA" = ((:idb_iva - 1) * 100)
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																			FROM 	  "ELECTRONICA_FB" 
																			WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																						( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																						( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) ) ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND
				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
				  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
				  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )
	USING		sqlca;
end if
//if sqlca.sqlcode=0 then
//	commit;
//	
//else
//	rollback;
//end if 
end subroutine

public subroutine wf_cargar_boleta_electronica (string as_cuota, string as_cuota_mant, string as_doc, string as_paga_con, double abd_uf, long al_fila);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_mora,ll_gasto_cob,ll_corre,&
			ls_sum_monto,ll_count_reg,ll_min_boleta,ll_grupo,ll_otros,ll_cod_seguro,ll_total_neto,ll_pos,ll_cero=0,ll_sumar_todo,ll_sum_dscto,&
			ll_total_iva,ll_suma_total,ll_sub_total,ll_rut_rez,ll_cupon,ll_con_paga,ll_vuelto,ll_efectivo,ll_mora_mant,ll_gasto_mant,ll_res2
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_rut_empresa,ls_monto_desc,ls_tipo_codigo,ls_cod_pago,&
			ls_cuota,ls_moneda_ctto,ls_base_rezago,ls_serie_rezago,ls_nombre_rez,ls_ap_pat_rez,ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,&
			ls_nom_comp_rez,ls_nom_rez,ls_ruta_elect,ls_dv_rez,ls_tip_cob,ls_moneda,ls_con_paga,ls_vuelto,ls_efectivo,ls_nombre_archivo2
Double	ldb_prima,ldb_iva_factura,ll_monto_uf,ldb_prima_uf,ll_numero_rezago
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant, ldt_fecha_pago
SaveAsType TipoArchivo

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
dw_boleta.reset()
ls_indica_serv		= '3'
ldt_fecha_pago		= datetime(date(st_fecha_pago.text),time('00:00:00'))
SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant
FROM 	"CADENA",	"CADENA_MORA"  
WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
		  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
		  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
		  (("CADENA"."CODIGO" = :gs_base ) AND  
		  ( "CADENA"."SERIE" = :gs_serie ) AND  
		  ( "CADENA"."NUMERO" = :gi_numero ) )  
USING	sqlca;
if sqlca.sqlcode = 100 then
	ls_base_rezago		= mid(gs_contrato_rezago,1,1)
	ls_serie_rezago	= mid(gs_contrato_rezago,3,1)
	ll_numero_rezago	= Double(mid(gs_contrato_rezago,5))
	SELECT	"CLIENTE_REZAGO"."COD_PARQUE",
				"CLIENTE_REZAGO"."NOMBRE", 
				"CLIENTE_REZAGO"."AP_PATERNO",   
				"CLIENTE_REZAGO"."AP_MATERNO",   
				"CIUDAD"."SIGLA_CIUDAD",   
				"COMUNA"."COMUNA",
				"CLIENTE_REZAGO"."DIRECCION_PART",
				"CLIENTE_REZAGO"."TELEFONO_PART",
				"CLIENTE_REZAGO"."RUT",
				"CLIENTE_REZAGO"."DV"
	INTO		:ll_cod_parque,
				:ls_nombre_rez,
				:ls_ap_pat_rez,
				:ls_ap_mat_rez,
				:ls_ciudad_rez,
				:ls_comuna_rez,
				:ls_direc_rez,
				:ls_contacto,
				:ll_rut_rez,
				:ls_dv_rez
	FROM 	"CIUDAD",	"CLIENTE_REZAGO",	"COMUNA"  
	WHERE ( "CLIENTE_REZAGO"."COMUNA_PART" = "COMUNA"."CODIGO_COMUNA" ) and  
			  ( "CLIENTE_REZAGO"."CIUDAD_PART" = "CIUDAD"."CODIGO_CIUDAD" ) and  
			  ( "CLIENTE_REZAGO"."BASE" = :ls_base_rezago ) AND  
			  ( "CLIENTE_REZAGO"."SERIE" = :ls_serie_rezago ) AND  
			  ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero_rezago ) AND  
			  ( "CLIENTE_REZAGO"."COD_PAGO" = :gs_tipo_cobro ) AND  
			  ( "CLIENTE_REZAGO"."FOLIO" = :gl_folio ) AND  
			  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago )   ;
	if isnull(ls_nombre_rez) then ls_nombre_rez=''
	if isnull(ls_ap_pat_rez) then ls_ap_pat_rez=''
	if isnull(ls_ap_mat_rez) then ls_ap_mat_rez=''
	if isnull(ls_ciudad_rez) then ls_ciudad_rez=''
	if isnull(ls_comuna_rez) then ls_comuna_rez=''
	if isnull(ls_direc_rez) then ls_direc_rez=''

	ls_nombre_rez			= UPPER(ls_nombre_rez)
	ls_ap_pat_rez			= UPPER(ls_ap_pat_rez)
	ls_ap_mat_rez			= UPPER(ls_ap_mat_rez)
	ls_ciudad_rez			= UPPER(ls_ciudad_rez)
	ls_comuna_rez			= UPPER(ls_comuna_rez)
	ls_direc_rez				= UPPER(ls_direc_rez)
	
	ls_nom_comp_rez		= trim(ls_nombre_rez+' '+ls_ap_pat_rez+' '+ls_ap_mat_rez)
	if len(ls_nom_comp_rez) > 40 then
		ls_nom_comp_rez	= mid(ls_nom_comp_rez,1,40)
	end if
//	if len(ls_nom_comp) > 40 then
//		ls_nom_comp	= mid(ls_nom_comp,1,40)
//	end if
	if len(ls_direc_rez) > 70 then
		ls_direc_rez			= mid(ls_direc_rez,1,70)
	end if
	if len(ls_contacto) > 20 then
		ls_contacto	= mid(ls_contacto,1,20)
	end if
	ldt_fec_venc_cred		= datetime(date(gdt_fec_sistema),time('00:00:00'))
end if
if w_ingreso2.tab_ingreso.SelectedTab = 3 and w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked=true then
	SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA_OFICINA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
	INTO 		:ls_direc_origen,								:ls_comuna_origen,									:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elect
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 99   ;
else
	SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA_OFICINA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
	INTO 		:ls_direc_origen,								:ls_comuna_origen,									:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elect
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
end if
ls_direc_origen			= UPPER(trim(ls_direc_origen))
if len(ls_direc_origen) > 70 then
	ls_direc_origen		= mid(ls_direc_origen,1,70)
end if
ls_comuna_origen		= UPPER(ls_comuna_origen)
ls_ciudad_origen		= UPPER(ls_ciudad_origen)

SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",		"CLIENTE"."BLOCK_PARTICULAR",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P",	"CLIENTE"."EMAIL"
INTO		:ls_dv,				:ls_nom,						:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via,							:ls_direc,							:ls_nro,										:ls_depto,									:ls_block,									:ls_comuna,					:ls_ciudad,						:ls_celular,					:ls_fono_part,			:ls_email
FROM 	"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
		  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE"."COMUNA" ) and  
		  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
		  (("CLIENTE"."RUT" = :gi_rut ) ) 
USING	sqlca;
if sqlca.sqlcode=0 then
	ls_ciudad			= UPPER(ls_ciudad)
	if isnull(ls_celular) or ls_celular='-' or len(ls_celular)=0 or ls_celular='*' then
		ls_celular	= ''
	end if
	if isnull(ls_fono_part) or ls_fono_part='-' or len(ls_fono_part)=0 or ls_fono_part='*' then
		ls_fono_part	= ''
	end if
	if ls_celular <> '' and ls_fono_part <> '' then
		ls_contacto	= 'Cel.: '+ls_celular+' - FP.: '+ls_fono_part
	elseif ls_celular <> '' and ls_fono_part = '' then
		ls_contacto	= 'Cel.: '+ls_celular
	elseif ls_celular = '' and ls_fono_part <> '' then
		ls_contacto	= 'FP.: '+ls_fono_part
	elseif ls_fono_part = '' and ls_celular = '' then
		ls_contacto	= 'S/T'
	end if
	if len(ls_contacto) > 20 then
		ls_contacto	= mid(ls_contacto,1,20)
	end if
	ls_rut				= string(gi_rut)+'-'+ls_dv
	if isnull(ls_nom) or ls_nom= '' or ls_nom=' ' or ls_nom='-' or ls_nom='*' then
		ls_nom		= ''
	end if
	if isnull(ls_ap_pat) or ls_ap_pat= '' or ls_ap_pat=' ' or ls_ap_pat='-' or ls_ap_pat='*' then
		ls_ap_pat	= ''
	end if
	if isnull(ls_ap_mat) or ls_ap_mat= '' or ls_ap_mat=' ' or ls_ap_mat='-' or ls_ap_mat='*' then
		ls_ap_mat	= ''
	end if
	if gs_rezago ='S' then
		ls_nom_comp	= ls_nom_comp_rez
	else
		ls_nom_comp	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	end if
	ls_nom			= ls_nom_comp
	ls_nom_comp	= ls_nom_comp
	if len(ls_nom_comp) > 40 then
		ls_nom		= mid(ls_nom_comp,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	
	if isnull(ls_tipo_via) or ls_tipo_via= '' or ls_tipo_via=' ' or ls_tipo_via='-' or ls_tipo_via='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_direc) or ls_direc= '' or ls_direc=' ' or ls_direc='-' or ls_direc='*' then
		ls_direc		= ''
	end if
	if isnull(ls_nro) or ls_nro= '' or ls_nro=' ' or ls_nro='-' or ls_nro='*' then
		ls_nro			= ''
	end if
	if isnull(ls_depto) or ls_depto= '' or ls_depto=' ' or ls_depto='-' or ls_depto='*' then
		ls_depto		= ''
	end if
	if isnull(ls_block) or ls_block= '' or ls_block=' ' or ls_block='-' or ls_block='*' then
		ls_block		= ''
	end if
	if isnull(ls_comuna) or ls_comuna= '' or ls_comuna=' ' or ls_comuna='-' or ls_comuna='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_ciudad) or ls_ciudad= '' or ls_ciudad=' ' or ls_ciudad='-' or ls_ciudad='*' then
		ls_tipo_via	= ''
	end if
	ls_direc_comp	= ls_tipo_via+' '+ls_direc
	if ls_nro <> '' then
		ls_direc_comp	= ls_direc_comp+' N° '+ls_nro
	end if
	if ls_depto <> '' then
		ls_direc_comp	= ls_direc_comp+' Dpto.'+ls_depto
	end if
	if ls_block <> '' then
		ls_direc_comp	= ls_direc_comp+' Block '+ls_block
	end if
	if len(ls_direc_comp) > 70 then
		ls_direc_comp	= mid(ls_direc_comp,1,70)
	end if
else
	ll_pos					= Pos(gs_nombre_completo, 'Telé')
	if ll_pos > 0 then
		ls_nom			= trim(mid(gs_nombre_completo,1, (ll_pos - 1) ))
	else
		ls_nom			= trim(gs_nombre_completo)
	end if
	ls_dv					= gf_obtener_dv(gi_rut)
	ls_nom_comp	= ls_nom_comp_rez
	ls_nom			= ls_nom_comp
	ls_nom_comp	= ls_nom_comp
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom		= mid(ls_nom_comp,1,40)
	end if
	ls_direc_comp	= ls_direc_rez
	if len(ls_direc_comp) > 70 then
		ls_direc_comp	= mid(ls_direc_comp,1,70)
	end if
	if isnull(ls_ciudad_rez) then ls_ciudad_rez=''
	if isnull(ls_comuna_rez) then ls_comuna_rez=''
	ls_comuna			= ls_comuna_rez
	ls_ciudad				= ls_ciudad_rez
	ls_rut					= string(ll_rut_rez)+'-'+ls_dv_rez
end if
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
	INTO 		:ls_rut_empresa
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
	
	ls_tipo_dte		= '41'
	if gs_tipo_cobro='CU' then
		ls_tip_cob	= 'BE'
	else
		ls_tip_cob	= gs_tipo_cobro
	end if
	ll_cupon 			= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.GetItemNumber(al_fila, "cuponeras_detalle_nro_cupon")
elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then
	ls_tip_cob		= gs_tipo_cobro
	if w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked=true then
		ls_tipo_dte	= '38'
	elseif w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked=true then
		ls_tipo_dte	= '38'
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	ls_tip_cob		= gs_tipo_cobro
	if w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked=true then
		ls_tipo_dte	= '39'
		SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
		INTO 		:ls_rut_empresa
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 99   ;
	elseif w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked=true then
		ls_tipo_dte	= '41'
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 4 then
	ls_tip_cob		= gs_tipo_cobro
	if w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked=true then
		ls_tipo_dte	= '33'
	elseif w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked=true then
		ls_tipo_dte	= '34'
	end if
end if
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= '<ENCABEZADO>'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_tipo_dte) then ls_tipo_dte=''
ls_string_boleta	= 'Tipo DTE'+Space(22)+' | '+ls_tipo_dte
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Folio'+Space(25)+' | '+string(gl_folio)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(st_fecha_pago.text),'dd-mm-yyyy')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_indica_serv) then ls_indica_serv=''
ls_string_boleta	= 'Indicador Servicio'+Space(12)+' | '+ls_indica_serv
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Fecha Vencimiento'+Space(13)+' | '+string(ldt_fec_venc_cred,'dd-mm-yyyy')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_direc_origen) then ls_direc_origen=''
ls_string_boleta	= 'Direccion Origen'+Space(14)+' | '+ls_direc_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_comuna_origen) then ls_comuna_origen=''
ls_string_boleta	= 'Comuna Origen'+Space(17)+' | '+ls_comuna_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_ciudad_origen) then ls_ciudad_origen=''
ls_string_boleta	= 'Ciudad Origen'+Space(17)+' | '+ls_ciudad_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Id. Adicional Receptor'+Space(8)+' | '+string(gi_rut)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_rut) then ls_rut=''
ls_string_boleta	= 'Rut Receptor'+Space(18)+' | '+ls_rut
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Codigo Interno Receptor'+Space(7)+' | '+string(gi_rut)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_nom_comp) then ls_nom_comp=''
ls_string_boleta	= 'Razon Social Receptor'+Space(9)+' | '+ls_nom_comp
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_contacto) then ls_contacto='S/T'
ls_string_boleta	= 'Contacto Receptor'+Space(13)+' | '+ls_contacto
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_direc_comp) then ls_direc_comp=''
	ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_comp
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	if isnull(ls_comuna) then ls_comuna=''
	ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	if isnull(ls_ciudad) then ls_ciudad=''
	ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked=true then
	ll_total_neto			= round(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(1,'c_total_neto'),0)
	if gs_rezago='S' then
		if w_ingreso2.tab_ingreso.SelectedTab = 2 then
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'c_total'),0)
		elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total'),0)
		end if
	else
		if w_ingreso2.tab_ingreso.SelectedTab = 2 then
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'c_total'),0)
		elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
			ll_sumar_todo	= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total'),0)
		end if
	end if
	ll_total_neto			= round(ll_sumar_todo / idb_iva,0)
	ll_total_iva			= round(ll_sumar_todo - ll_total_neto,0)
	ll_suma_total		= ll_total_neto + ll_total_iva
	ll_new_reg			= dw_boleta.insertrow(0)
	if ll_total_neto <> ll_sub_total then
		ls_string_boleta	= 'Monto Neto'+Space(20)+' | '+string(ll_total_neto)		// ll_sub_total
	else
		ls_string_boleta	= 'Monto Neto'+Space(20)+' | '+string(ll_total_neto)
	end if
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'IVA'+Space(27)+' | '+string(ll_total_iva)
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(ll_suma_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(ll_suma_total))
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
elseif w_ingreso2.tab_ingreso.SelectedTab = 1 then
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	gd_total				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'c_total_pago_cuota')
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(gd_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'IVA'+Space(27)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(gd_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(gd_total))
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
else
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(gd_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'IVA'+Space(27)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(gd_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(gd_total))
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
end if

ll_new_reg			= dw_boleta.insertrow(0)
if w_ingreso2.tab_ingreso.SelectedTab = 2 then
	ll_tot_filas			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
	ll_reg					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
	if ll_reg>0 and gs_rezago <> "S" then 
		if w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.rowcount() > 0 then
			ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg, "cantidad") 
		end if
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	ll_tot_filas			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
	ll_reg					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
	if ll_reg>0 and gs_rezago <> "S" then 
		if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
			ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(ll_reg, "cantidad") 
		end if
	end if
end if
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	ll_tot_reg				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount()
	ls_cuota					= as_cuota
else
	CHOOSE CASE gs_base
		CASE 'O','U','M'	//Promesa
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1		= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s") >= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") then
						ls_obs_1	= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )
					else
						ll_ctas_pag				= ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )
					end if
				end if
			else
				ls_obs_1		= ''
			end if
		CASE 'R'	//Reprog.Mant
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
		CASE 'L'	//Liberador
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
		CASE 'F','G','V'	//Funeraria/Crematorio
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
		CASE 'P'	//Pagare
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
		CASE 'D'	// Derecho
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
			
		CASE 'A'	// Aumento
			if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
				if gd_fecha_prox_pago=date('01/01/1900') then
					ls_obs_1						= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") then
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )
					else
						ll_ctas_pag				= ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m")
						ls_obs_1					= 'Cuota N° '+string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )
					end if
				end if
			else
				ls_obs_1							= ''
			end if
	END CHOOSE
end if
if len(ls_obs_1) > 70 then
	ls_obs_1				= mid(ls_obs_1,1,70)
end if
ls_string_boleta		= 'Observaciones 1'+Space(14)+'  | '+ls_obs_1
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'IP Equipo'+Space(20)+'  | '+trim(gs_tcp_ip)	
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Direccion Emisor'+Space(13)+'  | '+'Estado 360 Piso 2'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Comuna Emisor'+Space(16)+'  | '+'Santiago'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Ciudad Emisor'+Space(16)+'  | '+'Santiago'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)

ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Cuota Credito'+Space(14)+'  | '+as_cuota
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Cuota Mantencion'+Space(11)+'  | '+as_cuota_mant
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
if gs_rezago='S' then
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+ls_base_rezago+ls_serie_rezago+string(ll_numero_rezago)
else
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+as_doc
end if
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ll_con_paga				= long(trim(sle_paga_con.text))
ll_vuelto					= long(trim(sle_vuelto.text))
ll_efectivo				= long( trim(sle_efectivo.text))
if ll_efectivo=0 or isnull(ll_efectivo) then
	ll_efectivo			= 0
	ls_efectivo			= string(ll_efectivo,'###,###,###,##0')
else
	ls_efectivo			= string(ll_efectivo,'###,###,###,##0')
end if

if ll_con_paga=0 or isnull(ll_con_paga) then
	ll_con_paga			= 0
	ls_con_paga			= string(ll_con_paga,'###,###,###,##0')
else
	ls_con_paga			= string(ll_con_paga,'###,###,###,##0')
end if

if ll_vuelto=0 or isnull(ll_vuelto) then
	ll_vuelto				= 0
	ls_vuelto				= string(ll_vuelto,'###,###,###,##0')
else
	ls_vuelto				= string(ll_vuelto,'###,###,###,##0')
end if
if ll_efectivo > 0 then
	as_paga_con		= ls_efectivo+' Paga con '+ls_con_paga+' Vuelto '+ls_vuelto
else
	as_paga_con		= ''
end if
ls_string_boleta		= 'x Paga en Efectivo'+Space(11)+'  | '+ as_paga_con
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x U.F. dia'+Space(19)+'  | '+string(abd_uf,'###,###,###,##0.0###')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Caja'+Space(23)+'  | '+gs_caja
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if gs_tipo_cobro='CU' then
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'N'
else
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'S'
end if
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if gs_tipo_cobro='CU' then
	ls_tip_cob	= 'BE'
else
	ls_tip_cob	= gs_tipo_cobro
end if
DECLARE 	x1 CURSOR FOR  
SELECT "DOCUMENTOS"."COD_PAGO",     sum("DOCUMENTOS"."MONTO"),     count("DOCUMENTOS"."COD_PAGO")  
FROM "DOCUMENTOS"  
WHERE ( "DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
         ( "DOCUMENTOS"."TIPO_COB" = :ls_tip_cob ) AND  
         ( "DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago )   
GROUP BY "DOCUMENTOS"."COD_PAGO"  
ORDER BY "DOCUMENTOS"."COD_PAGO" ASC   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x1 into :ls_cod_pago, :ls_sum_monto,	 :ll_count_reg;
		if not isnull(ls_cod_pago) then
			choose case ls_cod_pago
				case 'EF'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Efectivo'+Space(13)+'  | '+string(ls_sum_monto,'###,###,###,##0')	
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					
				case 'CH'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					
				case 'TC'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Tarjeta Credito'+Space(6)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					
				case 'TD'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Tarjeta Debito'+Space(7)+'  | '+string(ls_sum_monto,'###,###,###,##0')	
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			end choose
		end if
		Setnull(ls_cod_pago);Setnull(ls_sum_monto)
		dw_boleta.accepttext()
	loop
end if
close x1;
ll_new_reg						= dw_boleta.insertrow(0)
ls_string_boleta				= '<DETALLE>'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg						= dw_boleta.insertrow(0)
ls_string_boleta				= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Descripcion Adicional al Item | Cantidad | Precio Unitario Item | Monto Item | x Monto UF'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	if al_fila > 0 then
		ll_tot_reg				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount()
		ll_corre					= 0
		ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemstring(al_fila,'cuponeras_detalle_tipo_mov')
		if ls_tipo_cob <> 'S' then
			ls_tipo_cob_otro	= '0'
			ll_cantidad			= 1
			ll_monto				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_cuota_peso')
			ll_monto_uf			= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_cuota_contrato')
			
			SELECT	"PAGO_OFERTA"."MONEDA"  
			INTO 		:ls_moneda  
			FROM 	"OFERTA_V",   "PAGO_OFERTA"  
			WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( ( "PAGO_OFERTA"."BASE" = :gs_base ) AND  
						( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
			UNION   
			SELECT 	"PAGARE"."MONEDA"  
			FROM 	"PAGARE"  
			WHERE 	( "PAGARE"."BASE" = :gs_base ) AND  
						( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						( "PAGARE"."NRO_PAGARE" = :gi_numero )   
			UNION   
			SELECT 	"DERECHO"."MONEDA"  
			FROM 	"DERECHO"  
			WHERE	 ( "DERECHO"."BASE" = :gs_base ) AND  
						( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						( "DERECHO"."NRO_PAGARE" = :gi_numero )   
			UNION   
			SELECT 	"PAGO_LIBERADOR"."MONEDA"  
			FROM 	"ANEXO_LIBERADOR",   "PAGO_LIBERADOR"  
			WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
						( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
						( ( "ANEXO_LIBERADOR"."BASE_LIBERADOR" = :gs_base ) AND  
						( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
			UNION   
			SELECT 	"PAGO_AUMENTO"."MONEDA"  
			FROM 	"ANEXO_AUMENTO",  "PAGO_AUMENTO"  
			WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						( ( "PAGO_AUMENTO"."BASE" = :gs_base ) AND  
						( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) )   
			UNION   
			SELECT 	"PRODUCTO_PAGO"."MONEDA"  
			FROM 	"PRODUCTO_ANEXO",   "PRODUCTO_PAGO"  
			WHERE 	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
						( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
						( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
						( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
						( ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
						( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
						( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ls_moneda='1' then
					ll_monto_uf		= round(ll_monto_uf / abd_uf,4)
				end if
			end if

			ll_total				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'c_total_pago_cuota')
			ll_corre ++
			SELECT		"TIPO_COBRO"."DESCRIPCION"  
			INTO 			:ls_descrip_cobro  
			FROM 		"TIPO_COBRO"  
			WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
						  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
			USING		sqlca;
	
			SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
			INTO 			:ls_descrip_otro  
			FROM 		"CUENTA_CONTABLE_OTROS"  
			WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
			USING		sqlca;
	
			ls_descrip_cobro		= UPPER(ls_descrip_cobro)
			ls_descrip_otro			= UPPER(ls_descrip_otro)
			if isnull(ls_tipo_cob) then ls_tipo_cob=''
			if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
			if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
			if ls_tipo_cob = 'S' then
				ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
				ls_monto_desc		= string(ll_monto)
				ll_total				= 0
			else
				ls_monto_desc		= '0'
			end if
			if ls_tipo_cob = 'L' then
				ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			else
				ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			end if
			if not isnull(ls_string_boleta) then
				ll_new_reg			= dw_boleta.insertrow(0)
				dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			end if
		end if
		
		ll_otros						= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_otros_cobros')
		if ll_otros > 0 then
			DECLARE x11 CURSOR FOR  
			SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
						"SEGURO_ASOCIADOS"."MONTO_PRIMA",
						"SEGURO_ASOCIADOS"."MONEDA"
			FROM 	"SEGURO_ASOCIADOS"  
			WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
					  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
					  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
					  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
			USING	sqlca;
			open x11;
			if sqlca.sqlcode=0 then
				do while sqlca.sqlcode=0
					fetch x11 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto;
					if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
						if ls_moneda_ctto = '1' then
							ll_total_neto			= round(ldb_prima,0)
						elseif ls_moneda_ctto = '2' then
							ll_total_neto			= round(ldb_prima * abd_uf,0)
						end if
						ll_corre ++
						ls_tipo_cob				= String(ll_cod_seguro)
						ls_tipo_cob_otro		= '0'
						ll_cantidad				= 1
						ll_monto					= ll_total_neto
						ll_total					= round(ll_cantidad * ll_monto,0)
						if ls_moneda_ctto = '1' then
							ll_monto_uf		= round(ll_monto / abd_uf,4)
						elseif ls_moneda_ctto = '2' then
							ll_monto_uf		= ll_monto
						end if
						SELECT		"TIPO_COBRO"."DESCRIPCION"  
						INTO 			:ls_descrip_cobro  
						FROM 		"TIPO_COBRO"  
						WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
									  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
						USING		sqlca;
						ls_monto_desc			= '0'
						ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,##0.0###')
						ll_new_reg				= dw_boleta.insertrow(0)
						dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					end if
					setnull(ll_cod_seguro)
				loop
			end if
			close x11;
		end if
		ll_mora						= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_interes_mora')
		ll_gasto_cob					= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'cuponeras_detalle_monto_gasto_cobranza')
		if ll_mora > 0 then
			ll_corre ++
			if ls_tipo_cob='E' then
				ls_tipo_cob			= 'G'
				ls_descrip_cobro	= 'MORA CREDITO'
			elseif ls_tipo_cob='F' then
				ls_tipo_cob			= 'P'
				ls_descrip_cobro	= 'MORA MANT.'
			end if
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_mora / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+ls_monto_desc+' | '+string(ll_mora)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if
		if ll_gasto_cob > 0 then
			ll_corre ++
			if ls_tipo_cob='E' then
				ls_tipo_cob				= 'J'
				ls_descrip_cobro		= 'GASTO COB. CRED.'
			elseif ls_tipo_cob='F' then
				ls_tipo_cob				= 'R'
				ls_descrip_cobro		= 'GASTO COB. MANT.'
			end if
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+ls_monto_desc+' | '+string(ll_gasto_cob)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if

	end if
	
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	ll_tot_reg			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
	ll_corre				= 0
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_tipo_cob			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob <> 'S' then
				ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
				ll_cantidad			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'cantidad')
				if gs_rezago='S' then
					ll_monto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
					ll_monto			= round(ll_monto / ll_cantidad,0)
				else
					ll_monto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'monto')
				end if
				ll_total				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
				if isnull(ll_monto) then ll_monto=ll_total
				ll_corre ++
				SELECT		"TIPO_COBRO"."DESCRIPCION"  
				INTO 			:ls_descrip_cobro  
				FROM 		"TIPO_COBRO"  
				WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
							  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
				USING		sqlca;
		
				SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
				INTO 			:ls_descrip_otro  
				FROM 		"CUENTA_CONTABLE_OTROS"  
				WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
				USING		sqlca;
		
				ls_descrip_cobro		= UPPER(ls_descrip_cobro)
				ls_descrip_otro			= UPPER(ls_descrip_otro)
				if isnull(ls_tipo_cob) then ls_tipo_cob=''
				if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
				if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
				if ls_tipo_cob = 'S' then
					ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
					ls_monto_desc		= string(ll_monto)
					ll_total				= 0
				else
					ls_monto_desc		= '0'
				end if
				ll_monto_uf				= round(ll_monto / abd_uf,4)
				if ls_tipo_cob = 'L' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
				end if
				if not isnull(ls_string_boleta) then
					ll_new_reg			= dw_boleta.insertrow(0)
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				end if
			end if
		next
		ll_mora						= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'mora_cred'),0)
		ll_gasto_cob					= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'gasto_cred'),0)
		
		ll_mora_mant				= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'mora_mant'),0)
		ll_gasto_mant				= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'gasto_mant'),0)
		if ll_mora > 0 then
			ll_corre ++
			ls_tipo_cob				= 'G'
			ls_descrip_cobro		= 'MORA CREDITO'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_mora / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+ls_monto_desc+' | '+string(ll_mora)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+string(ll_mora)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg			= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if
		if ll_mora_mant > 0 then
			ll_corre ++
			ls_tipo_cob				= 'P'
			ls_descrip_cobro		= 'MORA MANT.'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_mora_mant / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora)+' | '+ls_monto_desc+' | '+string(ll_mora)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_mora_mant)+' | '+string(ll_mora_mant)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg			= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if

		if ll_gasto_cob > 0 then
			ll_corre ++
			ls_tipo_cob				= 'J'
			ls_descrip_cobro		= 'GASTO COBRANZA'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_gasto_cob / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+ls_monto_desc+' | '+string(ll_gasto_cob)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if
		if ll_gasto_mant > 0 then
			ll_corre ++
			ls_tipo_cob				= 'R'
			ls_descrip_cobro		= 'GASTO COB. MANT.'
			ls_descrip_otro			= ''
			ll_cantidad				= 1
			ls_monto_desc			= '0'
			ll_monto_uf				= round(ll_gasto_mant / abd_uf,4)
			//ls_string_boleta		= string(ll_indi)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+ls_monto_desc+' | '+string(ll_gasto_cob)
			ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_mant)+' | '+string(ll_gasto_mant)+' | '+string(ll_monto_uf,'###,###,##0.0###')
			ll_new_reg				= dw_boleta.insertrow(0)
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
		end if
		//ll_reg								= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'L' or tipo_cob = 'S'", 1, ll_tot_reg)	//
		ll_reg								= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'S'", 1, ll_tot_reg)
		if ll_reg > 0 then
			Setnull(ll_corre)
			ll_corre						= 0
			ll_new_reg					= dw_boleta.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			ll_new_reg					= dw_boleta.insertrow(0)
			ls_string_boleta			= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo'
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob')
				if ls_tipo_cob = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
					ll_cantidad			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'cantidad')
					ll_monto				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'monto')
					ll_total				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
					USING		sqlca;
			
					ls_descrip_cobro		= UPPER(ls_descrip_cobro)
					if isnull(ls_tipo_cob) then ls_tipo_cob=''
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
					if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
					if ls_tipo_cob = 'S' then
						ls_tipo_codigo		= 'D'
						ll_total				= ll_total * -1
					end if
					if ls_tipo_cob_otro <> '0' then
						ls_descrip_cobro	= UPPER(ls_descrip_otro)
					end if
					ls_string_boleta		= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_boleta.insertrow(0)
						dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					end if
				end if
			next
		end if
	end if
	
elseif w_ingreso2.tab_ingreso.SelectedTab = 4 then
	// No Hay Factura Electronica
end if
//ls_nombre_archivo		= '\\Boleta_elect\LA-FLORIDA-PROD\InFUD\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//ls_nombre_archivo		= '\\Boleta_elect\InFud-la florida\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
 ls_nombre_archivo		= ls_ruta_elect+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
 ls_nombre_archivo2		= 'C:\mod_cp\consulta\Boletas_Electronicas\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//ls_nombre_archivo		= 'C:\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
TipoArchivo 					= Text!
ll_res							= dw_boleta.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)  
ll_res2						= dw_boleta.SaveAs( ls_nombre_archivo2,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
If ll_res < 0  Then
	MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
End If	
ldb_iva_factura				= 0
//messagebox("rut+tipo_cob+folio",ls_rut_empresa+'+'+ls_tip_cob+'+'+string(gl_folio))
if w_ingreso2.tab_ingreso.SelectedTab = 1 then
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
					"RUT" = :gi_rut,   
					"ESTADO_REG" = 'G',   
					"DV" = :ls_dv,   
					"NOMBRE_CLIENTE" = :ls_nom,   
					"MONTO_AFECTO" = :ll_cero,   
					"MONTO_EXENTO" = :gd_total,   
					"MONTO_IVA" = :ll_cero,   
					"MONTO_TOTAL" = :gd_total,   
					"USUARIO_CREA" = :gs_user,   
					"BASE" = :gs_base,   
					"SERIE" = :gs_serie,   
					"NUMERO" = :gi_numero,
					"COD_CAJA" = :gs_caja,
					"TIPO_DTE" = :ls_tipo_dte ,
					"ESTADO_DOCUMENTO" = '' ,
					"TASA_IVA" = ((:idb_iva - 1) * 100),
					"TIPO_DOC_ASOC" = :gs_tipo_cobro,
					"FOLIO_ASOC" = :ll_cupon
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																			FROM 	  "ELECTRONICA_FB" 
																			WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																						( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																						( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) ) ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
			  	  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
	USING		sqlca;
else
	if w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked=true then
		UPDATE		"ELECTRONICA_FB_DETALLE"  
		SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
						"RUT" = :gi_rut,   
						"ESTADO_REG" = 'G',   
						"DV" = :ls_dv,   
						"NOMBRE_CLIENTE" = :ls_nom,   
						"MONTO_AFECTO" = :ll_total_neto,   
						"MONTO_EXENTO" = :ll_cero,   
						"MONTO_IVA" = :ll_total_iva,   
						"MONTO_TOTAL" = :ll_suma_total,   
						"USUARIO_CREA" = :gs_user,   
						"BASE" = :gs_base,   
						"SERIE" = :gs_serie,   
						"NUMERO" = :gi_numero,
						"COD_CAJA" = :gs_caja,
						"TIPO_DTE" = :ls_tipo_dte ,
						"ESTADO_DOCUMENTO" = '' ,
						"TASA_IVA" = ((:idb_iva - 1) * 100)
		WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																				FROM 	  "ELECTRONICA_FB" 
																				WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																							( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																							( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) ) ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
						( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
						( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
					  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
		USING		sqlca;
	else
		UPDATE		"ELECTRONICA_FB_DETALLE"  
		SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
						"RUT" = :gi_rut,   
						"ESTADO_REG" = 'G',   
						"DV" = :ls_dv,   
						"NOMBRE_CLIENTE" = :ls_nom,   
						"MONTO_AFECTO" = :ll_cero,   
						"MONTO_EXENTO" = :gd_total,   
						"MONTO_IVA" = :ll_cero,   
						"MONTO_TOTAL" = :gd_total,   
						"USUARIO_CREA" = :gs_user,   
						"BASE" = :gs_base,   
						"SERIE" = :gs_serie,   
						"NUMERO" = :gi_numero,
						"COD_CAJA" = :gs_caja,
						"TIPO_DTE" = :ls_tipo_dte ,
						"ESTADO_DOCUMENTO" = '' ,
						"TASA_IVA" = ((:idb_iva - 1) * 100)
		WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																				FROM 	  "ELECTRONICA_FB" 
																				WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																							( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																							( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) ) ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
						( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
						( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
					  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
		USING		sqlca;
	end if
end if
if sqlca.sqlcode=0 then
//	commit;
	UPDATE	"CUPONERAS_DETALLE"  
	SET 		"ESTADO_PAGO_CUPON" = 'C',
   				"TIPO_COB_PAGO" = :ls_tip_cob,
				"FOLIO_PAGO" = :gl_folio,
				"FECHA_PAGO" = :ldt_fecha_pago
	WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
			 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
			 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
			 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
			 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_cupon ) 
	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	end if;
else
//	rollback;
end if 
end subroutine

public subroutine wf_actualizar_benef_mantencion (long al_cod_beneficio, long al_cod_benef_detalle, string as_base, string as_serie, long al_numero, string as_tipo_cob, long al_folio, datetime adt_fecha_pago);
UPDATE 	"TIPO_PROMOCION_ASOCIADOS"  
SET 		"ESTADO" = 'G',   
			"FECHA_USO" = :adt_fecha_pago,   
			"TIPO_COB" = :as_tipo_cob,   
			"FOLIO" = :al_folio,   
			"COD_CAJA" = :gs_caja,   
			"USUARIO_MODIFICA" = :gs_user,   
			"FECHA_MODIFICA" = :gdt_fec_sistema  
WHERE ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :as_base ) AND  
		  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :as_serie ) AND  
		  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :al_numero ) AND  
		  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :al_cod_beneficio ) AND  
		  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = :al_cod_benef_detalle ) AND
		  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" =  'P' )
USING	sqlca;
//if sqlca.sqlcode=0 then
//	commit;
//else
//	rollback;
//end if

end subroutine

public function string wf_imprimir_delect (double al_folio);String		ls_resul,ls_tipo_mant,ls_string_mant,ls_doc,ls_base_rez,ls_serie_rez,ls_tipo_cupon,ls_razon_social,ls_rut_empresa
Long		ll_tot_filas,ll_reg,ll_reg_cred,ll_can_cta_cred,ll_ctas_pag,ll_cant_cred,ll_n_cuotas,ll_calc_cuotas,ll_cant_mant,ll_mes_mant,ll_day_mant,ll_anno_mant,&
			ll_estado_mora_mant,ll_year_mant,ll_cta_pag_m,Net,ll_cod_parque
datetime	ldt_fecha_prim,ldt_fecha_prox_pago_mant,ldt_fecha_pago
Double	ll_numero_rez,ll_monto_ef,ll_paga_con,ll_vuelto

SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", 	"ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
INTO   	:ll_cant_mant,                              							:ll_cant_cred
FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
		( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
		(("CADENA"."CODIGO" = :gs_base ) AND  
		( "CADENA"."SERIE" = :gs_serie ) AND  
		( "CADENA"."NUMERO" = :gi_numero ) )   ;
ll_paga_con						= long(sle_paga_con.text)
ll_vuelto							= long(sle_vuelto.text)
ls_tipo_cupon					= 'CU'		//trim(st_tipo_cobro.text)
if gs_conexion = 'Parque El Prado' then 
	if gs_tipo_cobro_aux = 'BA' then
		ll_cod_parque			= 142
	else
		ll_cod_parque			= 1
	end if
else
	if gs_tipo_cobro_aux = 'BA' then
		ll_cod_parque			= 142
	else
		ll_cod_parque			= 11
	end if
end if
SELECT 	"MEMBRETE_EMPRESA"."EMPRESA",  	"MEMBRETE_EMPRESA"."RUT"  
INTO 		:ls_razon_social,   							:ls_rut_empresa  
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;

DataWindowChild dwch_encabezado, dwch_detalle_ci, dwch_doc_cob
	dw_impresion.DataObject	= 'd_rep_cu_form_2' //'d_rep_ci'
	dw_impresion.SetTransObject(SQLCA)
	
ll_monto_ef 					= long(sle_efectivo.text)
ll_tot_filas					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
ll_reg							= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
if ll_reg>0 and gs_rezago <> "S" then //if ls_tipo_pago = 'E' OR ls_tipo_pago = 'K' then
	if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
		ll_reg_cred			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
		ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(ll_reg_cred, "cantidad") 
		CHOOSE CASE gs_base
			CASE 'O','U','M'	//Promesa
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s") >= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "pago_oferta_fecha_prim")
						ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s")) * ll_cant_cred ) //+ ll_cant_cred
						DECLARE x31 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x31;
						FETCH x31 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'R'	//Reprog.Mant
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "fecha_primera_cta")
						ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas")) * ll_cant_cred) 	//+ ll_cant_cred
						DECLARE x32 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x32;
						FETCH x32 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "ctas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "cuotas_pactadas") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'L'	//Liberador
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "pago_liberador_fecha_prim")
						ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m")) * ll_cant_cred ) 	//+ ll_cant_cred
						DECLARE x33 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x33;
						FETCH x33 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'F','G','V'	//Funeraria
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "producto_pago_fecha_prim")
						ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag")) * ll_cant_cred ) 	//+ ll_cant_cred
						DECLARE x34 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x34;
						FETCH x34 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "producto_pago_plazo") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'P'	//Pagare
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "pagare_fecha_prim")
						ll_ctas_pag				= ((ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")) * ll_cant_cred ) 	//+ ll_cant_cred
						DECLARE x35 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x35;
						FETCH x35 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pagare_plazo") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'D'	// Derecho
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "derecho_fecha_prim")
						ll_ctas_pag				=(( ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas")) * ll_cant_cred ) 	//+ ll_cant_cred
						DECLARE x36 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x36;
						FETCH x36 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_cuotas_pagadas"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "derecho_plazo") )+&
						'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
			CASE 'A'	// Aumento
				if gd_fecha_prox_pago=date('01/01/1900') then
					dw_impresion.object.cuota.text	= 'Cuota N° '+&
					string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
					' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
					'  ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") then
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
						'  ('+string(gdt_fec_sistema,"hh:mm")+')'
					else
						ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "pago_aumento_fecha_prim")
						ll_ctas_pag				=(( ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m")) * ll_cant_cred ) 	//+ ll_cant_cred
						DECLARE x37 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
						execute x37;
						FETCH x37 into :gd_fecha_prox_pago ;
//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
						dw_impresion.object.cuota.text	= 'Cuota N° '+&
						string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
						' de '+string(w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
						' Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
						' ('+string(gdt_fec_sistema,"hh:mm")+')'
					end if
				end if
		END CHOOSE
	end if
end if
ll_tot_filas	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
ll_reg			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'F'", 1, ll_tot_filas)
if ll_reg > 0 and gs_rezago <> "S" then //if ls_tipo_pago = 'F' then
	if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
		ll_can_cta_cred	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(ll_reg, "cantidad") 
		ll_n_cuotas		= ll_can_cta_cred		// verificar
		CHOOSE CASE gs_base
			CASE 'O','U','M'	//Promesa
				if gd_fecha_prox_pago=date('01/01/1900') or gd_fecha_prox_pago=date('00/00/0000') then
					dw_impresion.object.cuota_mant.text	= 'Mant.Pag.Año '+&
					string(ll_n_cuotas+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_prox_pago_anno") - 1) +&
					' ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					ldt_fecha_prox_pago_mant	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "c_fecha_prox_pago_mant")
					ll_calc_cuotas					= (ll_n_cuotas * ll_cant_mant) 
					DECLARE x41 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prox_pago_mant, :ll_calc_cuotas);
					execute x41;
					FETCH x41 into :gd_fecha_prox_pago ;
					
					ll_calc_cuotas					= ll_cant_mant * -1
					DECLARE x40 PROCEDURE FOR sp_fecha_venc_cupon(:gd_fecha_prox_pago, :ll_calc_cuotas);
					execute x40;
					FETCH x40 into :ldt_fecha_pago ;
					
					//-- JUAN
					ll_mes_mant		= month(gd_fecha_prox_pago)
					ll_day_mant			= day(gd_fecha_prox_pago)
					ll_anno_mant		= year(gd_fecha_prox_pago)
					SELECT 	"CADENA"."ESTADO_MORA_MANTENCION"  
					INTO 		:ll_estado_mora_mant  
					FROM 	"CADENA"  
					WHERE 	"CADENA"."CODIGO" = :gs_base AND  
								"CADENA"."SERIE" = :gs_serie AND  
								"CADENA"."NUMERO" = :gi_numero
					USING	sqlca;
					if ll_estado_mora_mant = 2 then
						ls_tipo_mant			= 'Anual'
						ll_year_mant			= ll_anno_mant -1
					elseif ll_estado_mora_mant	= 1 then
						ls_tipo_mant			= 'Semestral'
						if  ll_mes_mant <=6 then
							ll_year_mant		= ll_anno_mant - 1
						else
							ll_year_mant		= ll_anno_mant
						end if												
					end if
				//--	
					ll_cta_pag_m	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemnumber(1,'oferta_v_cta_pag_m')
					
					ls_string_mant	= 'Mant.Pag.Año '+	string(ll_year_mant) + ' F.Prox.Pago: '+string(gd_fecha_prox_pago ,"dd/mm/yyyy" )+' ('+string(gdt_fec_sistema,"hh:mm")+')'
					if isnull(ls_string_mant) then ls_string_mant=''
					dw_impresion.object.cuota_mant.text		= ls_string_mant
				end if
			CASE 'C'//Contratos
				if gd_fecha_prox_pago=date('01/01/1900') or gd_fecha_prox_pago=date('00/00/0000') then
					dw_impresion.object.cuota_mant.text	= 'Mant.Pag.Año '+&
					string(ll_n_cuotas+w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemNumber(1, "c_prox_pago_anno") - 1)+&
					' ('+string(gdt_fec_sistema,"hh:mm")+')'
				else
					ldt_fecha_prox_pago_mant	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.GetItemdatetime(1, "c_fecha_prox_pago_mant")
					ll_calc_cuotas					= (ll_n_cuotas * ll_cant_mant)
					DECLARE x43 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prox_pago_mant, :ll_calc_cuotas);
					execute x43;
					FETCH x43 into :gd_fecha_prox_pago ;
					
					ll_calc_cuotas					= ll_cant_mant * -1
					DECLARE x42 PROCEDURE FOR sp_fecha_venc_cupon(:gd_fecha_prox_pago, :ll_calc_cuotas);
					execute x42;
					FETCH x42 into :ldt_fecha_pago ;
					
					//-- JUAN
					ll_mes_mant		= month(gd_fecha_prox_pago)
					ll_day_mant			= day(gd_fecha_prox_pago)
					ll_anno_mant		= year(gd_fecha_prox_pago)
					SELECT 	"CADENA"."ESTADO_MORA_MANTENCION"  
					INTO 		:ll_estado_mora_mant  
					FROM 	"CADENA"  
					WHERE 	"CADENA"."CODIGO" = :gs_base AND  
								"CADENA"."SERIE" = :gs_serie AND  
								"CADENA"."NUMERO" = :gi_numero
					USING	sqlca;
					if ll_estado_mora_mant = 2 then
						ls_tipo_mant			= 'Anual'
						ll_year_mant			= ll_anno_mant -1
					elseif ll_estado_mora_mant	= 1 then
						ls_tipo_mant			= 'Semestral'
						if  ll_mes_mant <=6 then
							ll_year_mant		= ll_anno_mant - 1
						else
							ll_year_mant		= ll_anno_mant
						end if												
					end if	
					//--
					ls_string_mant	= 'Mant.Pag.Año '+	string(ll_year_mant) +&
					' F.Prox.Pago: '+string(gd_fecha_prox_pago ,"dd/mm/yyyy" )+' ('+string(gdt_fec_sistema,"hh:mm")+')'
					dw_impresion.object.cuota_mant.text		= ls_string_mant	
				end if
		END CHOOSE
	end if
end if
IF gs_rezago = "S" THEN 
//	setnull(gs_nombre_completo);setnull(gs_contrato_rezago);setnull(gs_string_cli_rezago)
//	Open(w_ingresar_nombre)

	IF gs_nombre_completo = "" or isnull(gs_nombre_completo) THEN
		Rollback using sqlca;
		OpenWithParm(w_observacion_no_grabar_comprobante,'N')
		Close(w_forma_pago2)
	END IF
	ls_doc					= gs_contrato_rezago
	ls_base_rez				= mid(gs_contrato_rezago,1,1)
	ls_serie_rez				= mid(gs_contrato_rezago,3,1)
	ll_numero_rez			= Double(mid(gs_contrato_rezago,5))
ELSE
	ls_doc	= (gs_base+gs_serie+String(gi_numero))
END IF

dw_impresion.object.t_razon_social.text		= ls_razon_social
dw_impresion.object.t_rut.text					= ls_rut_empresa

if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" then
	dw_impresion.Retrieve(al_folio,ls_doc,gi_rut,gf_obtener_dv(gi_rut),gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,ll_paga_con,ll_vuelto,ls_tipo_cupon)
//	dw_impresion.Retrieve(gl_folio,ls_doc,gi_rut,gf_obtener_dv(gi_rut),gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,ll_paga_con,ll_vuelto,gs_tipo_cobro)
end if

//dw_impresion.Print()
//dw_impresion.Print()
Net							= 1	//MessageBox("Imprimir Documento", "Imprimió correctamente el documento " + ls_tipo_cupon +" Nº " +String(al_folio) +" ?", Exclamation!, YesNo!, 2)
if net = 1 then
	ls_resul					= 'S'
else
	
end if
Return ls_resul
end function

public function integer f_actualizar_mov_h (string as_tipo_mov, long al_monto, long al_nro_cuotas, string as_base, string as_serie, double al_numero);LONG		ll_CTA_PAG_S, ll_ultimo_folio, ll_total_cuotas,ll_abono,ll_total_pie_pagado, ll_total_pagado,&
			ll_folio,ll_cuotas_pag_pie,ll_count_reg,ll_ctas_pag_isa,ll_fila,ll_ctas_pag_la,ll_plazo
Datetime	ldt_fecha_hoy
String		ls_tipo_cob,ls_tipo_caja

gs_tipo_cobro	= trim(st_tipo_cobro.text)
gd_hoy 			= Datetime(idt_fecha_hoy)

IF gs_rezago = "S" THEN
	RETURN 1
END IF
SELECT  	"CODIGO_CAJAS"."TIPO_CAJA"  
INTO    	:ls_tipo_caja
FROM    	"CODIGO_CAJAS"  
WHERE 	"CODIGO_CAJAS"."COD_CAJA" = :gs_caja   ;
if ls_tipo_caja='P' then
	if (as_base='O' or as_base='U' or as_base='L' or as_base='A' or as_base='M') and (as_tipo_mov='A' or as_tipo_mov='Q') then
		ls_tipo_cob		= trim(st_tipo_cobro.text)
		ll_folio			= long(trim(st_folio.text))
		ldt_fecha_hoy	= datetime(date(idt_fecha_hoy),time('00:00:00'))
	end if
	CHOOSE CASE as_base
		CASE "O","U","M" // OFERTAS
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"OFERTA_V"."TOT_PAGADO",   
								"OFERTA_V"."CTA_PAG_S"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							 ( "OFERTA_V"."BASE" = :as_base );    
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado		= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base )
					USING		sqlca;
	
				CASE "L"	
					// Otros, no modifica valores
	
				CASE "A","Q"
					SELECT	"OFERTA_V"."TOT_PAGADO",   
								"OFERTA_V"."ULT_FOLIO",   
								"PAGO_OFERTA"."CTAS_PAGADAS_PIE",
								"PAGO_OFERTA"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"OFERTA_V",   
								"PAGO_OFERTA",   
								"CADENA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							  ( "OFERTA_V"."BASE" = :as_base ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"OFERTA_V"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							 ( "OFERTA_V"."BASE" = :as_base )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")  
					INTO 		:ll_count_reg  
					FROM 	"DETALLE_PAGO_PIE"  
					WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :as_base ) AND  
							 ( "DETALLE_PAGO_PIE"."SERIE" = :as_serie ) AND  
							 ( "DETALLE_PAGO_PIE"."NUMERO" = :al_numero ) AND  
							 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
					USING		sqlca;
					if ll_count_reg>0 then
						ll_cuotas_pag_pie	= ll_count_reg
					end if
					UPDATE	"PAGO_OFERTA"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado  
					WHERE  ( "PAGO_OFERTA"."SERIE" = :as_serie ) AND  
							 ( "PAGO_OFERTA"."NRO_OFERTA" = :al_numero ) AND  
							 ( "PAGO_OFERTA"."BASE" = :as_base ) AND  
							 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie
				CASE "F"
					SELECT	"OFERTA_V"."TOT_PAGADO_M",   
								"OFERTA_V"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base );    
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO_M" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							 ( "OFERTA_V"."BASE" = :as_base )
					USING		sqlca;
	
				CASE "M"
					// no hace nada
					
				CASE "N" //Abono mantención
					SELECT	"OFERTA_V"."ABONO_M", "OFERTA_V"."TOT_PAGADO_M"   
					INTO 		:ll_abono, :ll_total_pagado   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono
	
					UPDATE	"OFERTA_V"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO_M" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base ) 
					USING		sqlca;
					
				CASE "I" // Abono cuota
					SELECT	"OFERTA_V"."ABONO_C", "OFERTA_V"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base );    
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
					
					UPDATE 	"OFERTA_V"  
					SET 		"ABONO_C" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base )
					USING		sqlca;
	
				CASE "K"
					SELECT	"OFERTA_V"."TOT_PAGADO", "OFERTA_V"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base );    
	
					SELECT	"PAGO_OFERTA"."NRO_CUOTAS"
					INTO 		:ll_total_cuotas
					FROM 		"PAGO_OFERTA"
					WHERE  ( "PAGO_OFERTA"."SERIE" = :as_serie ) AND  
							 ( "PAGO_OFERTA"."NRO_OFERTA" = :al_numero ) AND  
							 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio ) and
							  ( "PAGO_OFERTA"."BASE" = :as_base );    
	
					ll_CTA_PAG_S 		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"OFERTA_V"  
					SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
							  ( "OFERTA_V"."BASE" = :as_base )
					USING		sqlca;
	
				CASE "S" //Modificar
					if gs_codigo_otro='101'  then
						IF gs_tipo_cobro = "BL"  THEN
							SELECT	"OFERTA_V"."TOT_PAGADO_M",
										"OFERTA_V"."ULT_FOLIO"
							INTO 		:ll_total_pagado, 
										:ll_ultimo_folio   
							FROM 		"OFERTA_V"  
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
									  ( "OFERTA_V"."BASE" = :as_base );    
	
							ll_total_pagado	= ll_total_pagado + al_monto 
							UPDATE	"OFERTA_V"
							SET 		"TOT_PAGADO_M" = :ll_total_pagado  
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
									  ( "OFERTA_V"."BASE" = :as_base )
							USING		sqlca;
	
						ELSE	
							SELECT	"OFERTA_V"."TOT_PAGADO",
										"OFERTA_V"."ULT_FOLIO"
							INTO 		:ll_total_pagado, 
										:ll_ultimo_folio   
							FROM 		"OFERTA_V"  
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
									  ( "OFERTA_V"."BASE" = :as_base );    
		
							ll_total_pagado	= ll_total_pagado + al_monto 
		
							UPDATE	"OFERTA_V"
							SET 		"TOT_PAGADO" = :ll_total_pagado  
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) and
									  ( "OFERTA_V"."BASE" = :as_base )
							USING		sqlca;
	
						END IF
					end if
			END CHOOSE
	
		CASE "C" // CONTRATOS ISA
			CHOOSE CASE as_tipo_mov
				CASE "E"	
					// No se da este caso
				CASE "L"	
					// Otros, no modifica valores
				CASE "A"
					// No se da este caso
				CASE "F"
					SELECT	"CONTRATO"."TOT_PAGADO",   
								"CONTRATO"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
	
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"CONTRATO"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero )
					USING		sqlca;
	
				CASE "M"
					// no hace nada
				CASE "N" //Abono mantención
					SELECT	"CONTRATO"."ABONO_M", "CONTRATO"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado   
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono
	
					UPDATE	"CONTRATO"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero )
					USING		sqlca;
	
				CASE "I" // Abono cuota
					// NO SE DA ESTA OPCION
				CASE "K"
					//NO SE DA ESTA OPCION
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"CONTRATO"."TOT_PAGADO"
						INTO 		:ll_total_pagado 
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"CONTRATO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "L" // LIBERADOR
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
								"ANEXO_LIBERADOR"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO UTILIZADA
				CASE "A","Q"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
								"ANEXO_LIBERADOR"."ULT_FOLIO",   
								"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",
								"PAGO_LIBERADOR"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"ANEXO_LIBERADOR",   
								"PAGO_LIBERADOR",   
								"CADENA"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = 'L' ) AND  
							 ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"ANEXO_LIBERADOR"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PAGO_LIBERADOR"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :al_numero ) AND  
							 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					// ,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie  
					CASE "F"
					// NO EXISTE OPCION
				CASE "M"
					// NO EXISTE OPCION
				CASE "N" //Abono mantención
					// NO EXISTE OPCION				
				CASE "I" // Abono cuota
					SELECT	"ANEXO_LIBERADOR"."ABONO_M", "ANEXO_LIBERADOR"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
					
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
					
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
					USING		sqlca;
					
				CASE "K"
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO", "ANEXO_LIBERADOR"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
					
					SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS"
					INTO 		:ll_total_cuotas
					FROM 		"PAGO_LIBERADOR"
					WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :al_numero ) AND  
							 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
					
					ll_CTA_PAG_S		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
					USING		sqlca;
					
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
									"ANEXO_LIBERADOR"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"ANEXO_LIBERADOR"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"ANEXO_LIBERADOR"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "F","G","V" // FUNERARIA/crematorio/Servicio
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
								"PRODUCTO_ANEXO"."CUOTAS_PAG",
								"PRODUCTO_PAGO"."PLAZO"
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S,
								:ll_plazo
					FROM 	"PRODUCTO_ANEXO" ,	"PRODUCTO_PAGO" 
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) AND  
								( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"PRODUCTO_ANEXO"  
					SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
								"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
					USING		sqlca;
					
	//				if ll_plazo = 1 and as_tipo_mov = 'E' then
	//					UPDATE 	"CADENA"  
	//					SET 		"ESTADO" = 'C'  
	//					WHERE 	( "CADENA"."CODIGO" = :as_base ) AND  
	//								( "CADENA"."SERIE" = :as_serie ) AND  
	//								( "CADENA"."NUMERO" = :al_numero )   
	//					USING	sqlca;
	//
	//				end if
				CASE "L"	
					// OPCION NO UTILIZADA
	//				SELECT 	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
	//							"PRODUCTO_ANEXO"."CUOTAS_PAG",   
	//							"PRODUCTO_PAGO"."PLAZO"  
	//				INTO 		:ll_total_pagado,   
	//							:ll_CTA_PAG_S,   
	//							:ll_plazo  
	//				FROM 	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO"  
	//				WHERE ( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
	//							( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
	//							( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
	//							( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
	//							(( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
	//							( "PRODUCTO_ANEXO"."NUMERO" = :al_numero ) )   ;
	//
	//				if isnull(ll_CTA_PAG_S) then ll_CTA_PAG_S = 0
	//				if ll_CTA_PAG_S = 0 then al_nro_cuotas = 1
	//				ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
	//				ll_total_pagado 	= al_monto + ll_total_pagado
	//				if ll_CTA_PAG_S > ll_plazo then ll_CTA_PAG_S = ll_plazo
	//				
	//				UPDATE	"PRODUCTO_ANEXO"  
	//				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
	//							"TOTAL_PAGADO" = :ll_total_pagado  
	//				WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
	//						 	( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
	//				USING	sqlca;
					
				CASE "A","Q"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
								"PRODUCTO_ANEXO"."ULT_FOLIO",   
								"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",
								"PRODUCTO_PAGO"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 	"PRODUCTO_ANEXO",   
								"PRODUCTO_PAGO",   
								"CADENA"  
					WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
							 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
							 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
							 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
							 ( "CADENA"."CODIGO" = :as_base ) AND  
							 ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero  )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"PRODUCTO_ANEXO"
					SET 		"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
					USING	sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PRODUCTO_PAGO"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  	( "PRODUCTO_PAGO"."BASE" = :as_base ) AND  
								( "PRODUCTO_PAGO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_PAGO"."NUMERO" = :al_numero ) AND  
								( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//	"CTAS_PIE_PAGADAS" = :ll_cuotas_pag_pie  
					CASE "F"
					// NO EXISTE OPCION
				CASE "M"
					// NO EXISTE OPCION
				CASE "N" //Abono mantención
					// NO EXISTE OPCION				
				CASE "I" // Abono cuota
					// NO EXISTE OPCION	
					
				CASE "K"
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO", 	"PRODUCTO_ANEXO"."ULT_FOLIO"   
					INTO 		:ll_total_pagado, 									:ll_ultimo_folio   
					FROM 	"PRODUCTO_ANEXO"  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
					
					SELECT	"PRODUCTO_PAGO"."PLAZO"
					INTO 		:ll_total_cuotas
					FROM 	"PRODUCTO_PAGO"
					WHERE  	( "PRODUCTO_PAGO"."BASE" = :as_base ) AND  
								( "PRODUCTO_PAGO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_PAGO"."NUMERO" = :al_numero ) AND  
								( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
					
					ll_CTA_PAG_S		= ll_total_cuotas
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"PRODUCTO_ANEXO"  
					SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
								"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  	( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
								( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
					USING		sqlca;
					
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
									"PRODUCTO_ANEXO"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 	"PRODUCTO_ANEXO"  
						WHERE  	( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
									( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"PRODUCTO_ANEXO"
						SET 		"TOTAL_PAGADO" = :ll_total_pagado  
						WHERE  	( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
									( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
									( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "P" // PAGARE
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"PAGARE"."TOT_PAGADO",   
								"PAGARE"."CTA_PAG_LA"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 	"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"PAGARE"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO EXISTE
				CASE "A","Q"
					SELECT	"PAGARE"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
	
					UPDATE	"PAGARE"
					SET 		"TOT_PAGADO" = :ll_total_pagado ,
								"PIE_PAGADO" = :al_monto 
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
				 
				CASE "F"
					// OPCION NO EXISTE
				CASE "M"
					// OPCION NO EXISTE
				CASE "N" //Abono mantención
					// OPCION NO EXISTE				
				CASE "I" // Abono cuota
					SELECT	"PAGARE"."ABONO_PAG", "PAGARE"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
							 
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
	
					UPDATE	"PAGARE"  
					SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "K"
					SELECT	"PAGARE"."TOT_PAGADO", 	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_ISA",	"PAGARE"."CTA_PAG_LA"
					INTO 		:ll_total_pagado, 				:ll_total_cuotas,		:ll_ctas_pag_isa,				:ll_CTA_PAG_S
					FROM 	"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
					
					ll_CTA_PAG_S		= ll_total_cuotas	//al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					UPDATE 	"PAGARE"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"PAGARE"."TOT_PAGADO"
						INTO 		:ll_total_pagado
						FROM 		"PAGARE"  
						WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
		
						ll_total_pagado	= ll_total_pagado + al_monto 
		
						UPDATE	"PAGARE"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "D" // DERECHO 
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"DERECHO"."TOT_PAGADO",   
								"DERECHO"."CTA_PAG_LA"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"DERECHO"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "L"	
					// OPCION NO EXISTE
				CASE "A","Q"
					SELECT	"DERECHO"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 	"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
	
					UPDATE	"DERECHO"
					SET 		"TOT_PAGADO" = :ll_total_pagado ,
								"PIE_PAGADO" = :al_monto 
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "F"
					// OPCION NO EXISTE
				CASE "M"
					// OPCION NO EXISTE
				CASE "N" //Abono mantención
					// OPCION NO EXISTE				
				CASE "I" // Abono cuota
					SELECT	"DERECHO"."ABONO_PAG", "DERECHO"."TOT_PAGADO"   
					INTO 		:ll_abono, :ll_total_pagado
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
	
					ll_total_pagado	= al_monto + ll_total_pagado
					ll_abono 			= al_monto + ll_abono 
	
					UPDATE	"DERECHO"  
					SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
					
				CASE "K"
					SELECT	"DERECHO"."TOT_PAGADO", 	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_ISA",	"DERECHO"."CTA_PAG_LA"
					INTO 		:ll_total_pagado, 					:ll_total_cuotas,		:ll_ctas_pag_isa,					:ll_ctas_pag_la
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
					
					ll_CTA_PAG_S		= ll_total_cuotas		//ll_total_cuotas - (ll_ctas_pag_isa + ll_ctas_pag_la)
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"DERECHO"  
					SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero )
					USING		sqlca;
	
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"DERECHO"."TOT_PAGADO"
						INTO 		:ll_total_pagado
						FROM 		"DERECHO"  
						WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
								 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
		
						ll_total_pagado	= ll_total_pagado + al_monto 
		
						UPDATE	"DERECHO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
								 ( "DERECHO"."NRO_PAGARE" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
	
		CASE "A"
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
								"ANEXO_AUMENTO"."CTA_PAG_M"  
					INTO 		:ll_total_pagado,   
								:ll_CTA_PAG_S  
					FROM 		"ANEXO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
					
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
	
					UPDATE	"ANEXO_AUMENTO"  
					SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
								"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
					USING		sqlca;		
					
				CASE "A","Q"
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
								"ANEXO_AUMENTO"."ULT_FOLIO",   
								"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",
								"PAGO_AUMENTO"."PIE_PAGADO"
					INTO 		:ll_total_pagado,   
								:ll_ultimo_folio,   
								:ll_cuotas_pag_pie,
								:ll_total_pie_pagado
					FROM 		"ANEXO_AUMENTO",   
								"PAGO_AUMENTO",   
								"CADENA"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = 'A' ) AND  
							 ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero ) )   
					Using		sqlca;
					if isnull(ll_total_pagado) then ll_total_pagado=0
					if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
					if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
					if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
					ll_total_pagado		= al_monto + ll_total_pagado
					UPDATE	"ANEXO_AUMENTO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
					USING		sqlca;
					
					ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_nro_cuotas
					ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
					UPDATE	"PAGO_AUMENTO"  
					SET 		"PIE_PAGADO" = :ll_total_pie_pagado
					WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :al_numero ) AND  
							 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio )
					USING		sqlca;
					//,  "CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie  
				CASE "S"
					if gs_codigo_otro='101' then
						SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
									"ANEXO_AUMENTO"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"ANEXO_AUMENTO"  
						WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
						
						ll_total_pagado	= ll_total_pagado + al_monto 
						
						UPDATE	"ANEXO_AUMENTO"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
						USING		sqlca;
	
					end if
			END CHOOSE
			
		CASE "R" // Reprogramación de Contratos de Mantención
			CHOOSE CASE as_tipo_mov
				CASE "E"	,"U"
					SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",
								"REPACTA_MANTENCION"."TOTAL_PAGADO"  
					INTO 		:ll_CTA_PAG_S, 	:ll_total_pagado  
					FROM 		"REPACTA_MANTENCION"  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;				
	
					ll_CTA_PAG_S		= al_nro_cuotas + ll_CTA_PAG_S
					ll_total_pagado 	= al_monto + ll_total_pagado
					
					UPDATE	"REPACTA_MANTENCION"  
					SET 		"REPACTA_MANTENCION"."CTAS_PAGADAS" = :ll_CTA_PAG_S,   
								"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )
					USING		sqlca;
	
				CASE "L"	
					// Otros, no modifica valores
				CASE "S"
					IF (gs_tipo_cobro = "BL" and gs_codigo_otro='101') THEN
						SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
						INTO 		:ll_total_pagado  
						FROM 		"REPACTA_MANTENCION"  
						WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;				
						
						ll_total_pagado	= ll_total_pagado + al_monto 
	
						UPDATE	"REPACTA_MANTENCION"
						SET 		"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
						WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )
						USING		sqlca;
	
					END IF
			END CHOOSE
	END CHOOSE
end if
RETURN 0
end function

public subroutine wf_desactiva_descuento ();INTEGER li_cero, li_contador, li_fila_E_CI , li_fila_F_BE, LI_TRAMO
STRING LS_APLICA

integer li_existe
li_existe = 0 
LI_TRAMO = 0

SELECT B.CODIGO_TRAMO
INTO 
	 :LI_TRAMO
FROM 
	 CADENA A
JOIN 
	 WEB_DESCUENTOS_DETALLE B 
	 ON A.CODIGO = B.BASE
	 AND A.SERIE = B.SERIE
	 AND A.NUMERO = B.NUMERO
	 AND A.CODIGO_TRAMO = B.CODIGO_TRAMO
JOIN 
	 WEB_DESCUENTOS_TRAMO C
	 ON C.CODIGO_TRAMO = B.CODIGO_TRAMO
WHERE 
	 C.ESTADO = 'A'
	 AND B.ESTADO_REG = 'V'
	 AND A.NUMERO = :gi_numero
	 AND A.SERIE = :gs_serie
	 AND A.CODIGO = :gs_base
USING SQLCA;


IF LI_TRAMO >0 THEN
		// vhfb - termino - desactivacion descuento mensajes
		
		UPDATE  WEB_DESCUENTOS_DETALLE SET ESTADO_REG = 'I'
		where 
		base =:gs_base AND 
		serie = :gs_serie AND 
		numero = :gi_numero AND 
		CODIGO_TRAMO = :LI_TRAMO AND 
		FECHA_VIG_FIN > SYSDATE
		USING		sqlca;
		
		IF SQLCA.SQLCode = 0 OR SQLCA.SQLCode = 100 THEN
			 COMMIT USING SQLCA;
			 //MessageBox("Info", "Registro insertado y confirmado en BD.")
		ELSE
			 ROLLBACK USING SQLCA;
			 MessageBox("Error", "Error al desactivar mensaje, Error : " + String(SQLCA.SQLCode) + "~r~n" + SQLCA.SQLErrText)
		END IF
	END IF 
			
//	end if 
	gs_aplica_a = ''
	gd_descuento = 0		
//end if  														
// vhfb - termino - desactivacion descuento web























end subroutine

public subroutine wf_cargar_dscto_mp (string as_tipo_cob_dscto, string as_tipo_otro_dscto, double al_monto_dscto, long al_tot_reg_hijo, long al_cod_mp);String		ls_dscto_h,ls_contrato_hijo,ls_base_hijo,ls_tipo_mov_hijo,ls_base_mp_hijo,ls_serie_mp_hijo,ls_tipo_doc_hijo,ls_base_mp,ls_mov_mp
Long		ll_indi_hijo,ll_new_dscto_hijo,ll_fila_restar_mp,ll_fila_recal_iva_mp,ll_tot_reg_mp,ll_indi_mp
Double	ll_rut_hijo,ll_tot_pago_hijo,ll_tot_pago_total,ll_numero_mp_hijo,ll_cupon_mp_hijo,ll_cupon_hijo,ldb_uf_hijo,ll_calc_porc_hijo,ll_porc_dscto_asig,ll_monto_dscto,&
			ll_cod_mp,ldb_precio_mp,ldb_precio_det_mp,ll_monto_tot_mp,ll_resta_val_mp,ll_recal_iva_mp,ll_iva_reg_mp,ll_suma_iva

if as_tipo_cob_dscto = 'S' and as_tipo_otro_dscto='170' then	//MORA CREDITO M.PROD "G"  / IVA "V"
	ls_dscto_h						= '102'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='G' then
				DECLARE	cod_mp1 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp1 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp1;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='G' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='V' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='171' then //GASTO COB. CREDITO M.PROD "J"  / IVA "X"
	ls_dscto_h		= '118'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='J' then
				DECLARE	cod_mp2 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp2;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp2 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp2;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='J' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='X' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='172' then //MORA MANTENCION M.PROD "P"  / IVA "V"
	ls_dscto_h		= '130'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='P' then
				DECLARE	cod_mp3 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp3;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp3 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp3;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='P' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='V' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='173' then //PROMOCION CREDITO M.PROD "E" / IVA "D"
	ls_dscto_h		= '131'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='E' then
				DECLARE	cod_mp4 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp4;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp4 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp4;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),0)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='E' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='D' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='174' then //PROMOCION MANTENCION M.PROD "F" / IVA "D"
	ls_dscto_h		= '132'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='F' then
				DECLARE	cod_mp5 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp5;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp5 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp5;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='F' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='D' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='175' then //GASTO COB. MANTENCION M.PROD "R"  / IVA "X"
	ls_dscto_h		= '133'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='R' then
				DECLARE	cod_mp6 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp6;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp6 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp6;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='R' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='X' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='177' then //DSCTO - DESG. CRED. M.PROD (4-SEG.) "4"
	ls_dscto_h		= '149'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='4' then
				DECLARE	cod_mp7 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp7;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp7 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp7;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='178' then //DSCTO GTO.ADMIN.CRED.M.PROD (6-GAST.ADM) "6"
	ls_dscto_h		= '150'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='6' then
				DECLARE	cod_mp8 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp8;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp8 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp8;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
elseif as_tipo_cob_dscto='S' and as_tipo_otro_dscto='179' then //DSCTO PROMOCION PIE M.PROD "A" / IVA "D"
	ls_dscto_h		= '160'
	if al_tot_reg_hijo > 0 then
		for ll_indi_hijo = 1 to al_tot_reg_hijo
			ls_contrato_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'contrato')
			ll_rut_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'rut')
			ls_base_hijo				= mid(ls_contrato_hijo,1,1)
			ll_tot_pago_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_sum_porctto_peso')
			ll_tot_pago_total		= dw_multiproducto.getitemnumber(ll_indi_hijo,'c_tot_peso')
			ls_tipo_mov_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipo_mov')
			ls_base_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpbase')
			ls_serie_mp_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'mpserie')
			ll_numero_mp_hijo	= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnumero')
			ll_cupon_mp_hijo		= dw_multiproducto.getitemnumber(ll_indi_hijo,'mpnro_cupon')
			ll_cupon_hijo			= dw_multiproducto.getitemnumber(ll_indi_hijo,'nro_cupon')
			ls_tipo_doc_hijo		= dw_multiproducto.getitemstring(ll_indi_hijo,'tipodoc')
			ldb_uf_hijo				= dw_multiproducto.getitemnumber(ll_indi_hijo,'nufdia')
			if ls_tipo_mov_hijo='A' then
				DECLARE	cod_mp9 CURSOR FOR  
				SELECT 		"MPPRODUCTO"."CODIGOMP",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO"  
    				FROM 		"MPPRODUCTO",   	"MPPRODUCTODET"  
   				WHERE 		( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" )  AND 
								"MPPRODUCTO"."CODIGOMP" = :al_cod_mp
				ORDER BY 	"MPPRODUCTODET"."BASE" ASC  
				USING		sqlca;
				open 		cod_mp9;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch cod_mp9 into :ll_cod_mp, :ldb_precio_mp, :ls_base_mp, :ldb_precio_det_mp ;
						if ls_base_hijo = ls_base_mp then
							ll_calc_porc_hijo	= round(((ldb_precio_det_mp / ldb_precio_mp) * 100),0)
							exit;
						end if
					LOOP
				end if
				close cod_mp9;
//				ll_calc_porc_hijo	= round(((ll_tot_pago_hijo / ll_tot_pago_total) * 100),2)
				ll_porc_dscto_asig	= round(((al_monto_dscto * ll_calc_porc_hijo) / 100),0)
				ll_new_dscto_hijo	= dw_multiproducto.insertrow(0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'item',ll_new_dscto_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'contrato',ls_contrato_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'rut',ll_rut_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipo_mov','S')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cantidad',1)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'monto_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'total_uf',round(ll_porc_dscto_asig / gd_uf,4))
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'montoitem',ll_porc_dscto_asig)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalitem',ll_porc_dscto_asig)
				
				ll_fila_restar_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='A' ",1,al_tot_reg_hijo)
				if ll_fila_restar_mp > 0 then
					ll_monto_tot_mp		= dw_multiproducto.getitemnumber(ll_fila_restar_mp,'totalitem')
					ll_resta_val_mp		= round(ll_monto_tot_mp + ll_porc_dscto_asig,0)
					ll_recal_iva_mp			= round(ll_resta_val_mp * (idb_iva - 1),0)
					if ll_recal_iva_mp > 0 then
						ll_fila_recal_iva_mp	= dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mp+"' and tipo_mov='D' ",1,al_tot_reg_hijo)
						if ll_fila_recal_iva_mp > 0 then
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'montoitem',ll_recal_iva_mp)
							dw_multiproducto.setitem(ll_fila_recal_iva_mp,'totalitem',ll_recal_iva_mp)
						end if
					end if
				end if
				
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'moneda','1')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipomoneda','PESO')
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpbase',ls_base_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpserie',ls_serie_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnumero',ll_numero_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'mpnro_cupon',ll_cupon_mp_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nro_cupon',ll_cupon_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'tipodoc',ls_tipo_doc_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'nufdia',ldb_uf_hijo)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totaliva',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'totalcto',0)
				dw_multiproducto.setitem(ll_new_dscto_hijo ,'cod_otro_dscto',ls_dscto_h)
				
			end if
			
		next
	end if
end if			
ll_tot_reg_mp				= dw_multiproducto.rowcount()
for ll_indi_mp=1 to ll_tot_reg_mp
	ls_mov_mp				= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
	if ls_mov_mp='D' or ls_mov_mp='V' or ls_mov_mp='X' then
		ll_iva_reg_mp		= dw_multiproducto.getitemnumber(ll_indi_mp,'montoitem')
		ll_suma_iva			= ll_suma_iva + ll_iva_reg_mp
	end if
next
if ll_suma_iva > 0 then
	ll_tot_reg_mp			= dw_multiproducto.rowcount()
	for ll_indi_mp=1 to ll_tot_reg_mp
		ll_iva_reg_mp	= dw_multiproducto.setitem(ll_indi_mp,'totaliva',ll_suma_iva)
	next
end if
string newsort
newsort = "contrato as"
dw_multiproducto.SetSort(newsort)
dw_multiproducto.Sort( )

end subroutine

on w_forma_pago2.create
this.dw_multiproducto=create dw_multiproducto
this.cbx_credito=create cbx_credito
this.st_fuera_plazo=create st_fuera_plazo
this.sle_1=create sle_1
this.dw_factura=create dw_factura
this.dw_boleta=create dw_boleta
this.st_abono_ini=create st_abono_ini
this.dw_abono=create dw_abono
this.dw_print_cupones=create dw_print_cupones
this.em_saldo=create em_saldo
this.st_19=create st_19
this.pb_limpiar=create pb_limpiar
this.st_fecha_pago=create st_fecha_pago
this.st_8=create st_8
this.st_rezago=create st_rezago
this.st_7=create st_7
this.st_folio=create st_folio
this.st_tipo_cobro=create st_tipo_cobro
this.st_2=create st_2
this.st_1=create st_1
this.st_correlativo_tarcred=create st_correlativo_tarcred
this.pb_salir=create pb_salir
this.pb_grabar=create pb_grabar
this.st_eliminar_tarjeta_cred=create st_eliminar_tarjeta_cred
this.st_insertar_tar_cred=create st_insertar_tar_cred
this.st_correlativo_cheque=create st_correlativo_cheque
this.st_eliminar_cheque=create st_eliminar_cheque
this.st_insertar_cheque=create st_insertar_cheque
this.cbx_tarjeta_debito=create cbx_tarjeta_debito
this.dw_impresion=create dw_impresion
this.sle_efectivo=create sle_efectivo
this.cbx_cheque=create cbx_cheque
this.cbx_efectivo=create cbx_efectivo
this.st_6=create st_6
this.st_41=create st_41
this.st_saldo=create st_saldo
this.st_5=create st_5
this.st_4=create st_4
this.sle_vuelto=create sle_vuelto
this.sle_paga_con=create sle_paga_con
this.st_3=create st_3
this.st_total=create st_total
this.gb_1=create gb_1
this.cbx_tarjeta_credito=create cbx_tarjeta_credito
this.gb_11=create gb_11
this.tab_1=create tab_1
this.gb_4=create gb_4
this.Control[]={this.dw_multiproducto,&
this.cbx_credito,&
this.st_fuera_plazo,&
this.sle_1,&
this.dw_factura,&
this.dw_boleta,&
this.st_abono_ini,&
this.dw_abono,&
this.dw_print_cupones,&
this.em_saldo,&
this.st_19,&
this.pb_limpiar,&
this.st_fecha_pago,&
this.st_8,&
this.st_rezago,&
this.st_7,&
this.st_folio,&
this.st_tipo_cobro,&
this.st_2,&
this.st_1,&
this.st_correlativo_tarcred,&
this.pb_salir,&
this.pb_grabar,&
this.st_eliminar_tarjeta_cred,&
this.st_insertar_tar_cred,&
this.st_correlativo_cheque,&
this.st_eliminar_cheque,&
this.st_insertar_cheque,&
this.cbx_tarjeta_debito,&
this.dw_impresion,&
this.sle_efectivo,&
this.cbx_cheque,&
this.cbx_efectivo,&
this.st_6,&
this.st_41,&
this.st_saldo,&
this.st_5,&
this.st_4,&
this.sle_vuelto,&
this.sle_paga_con,&
this.st_3,&
this.st_total,&
this.gb_1,&
this.cbx_tarjeta_credito,&
this.gb_11,&
this.tab_1,&
this.gb_4}
end on

on w_forma_pago2.destroy
destroy(this.dw_multiproducto)
destroy(this.cbx_credito)
destroy(this.st_fuera_plazo)
destroy(this.sle_1)
destroy(this.dw_factura)
destroy(this.dw_boleta)
destroy(this.st_abono_ini)
destroy(this.dw_abono)
destroy(this.dw_print_cupones)
destroy(this.em_saldo)
destroy(this.st_19)
destroy(this.pb_limpiar)
destroy(this.st_fecha_pago)
destroy(this.st_8)
destroy(this.st_rezago)
destroy(this.st_7)
destroy(this.st_folio)
destroy(this.st_tipo_cobro)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_correlativo_tarcred)
destroy(this.pb_salir)
destroy(this.pb_grabar)
destroy(this.st_eliminar_tarjeta_cred)
destroy(this.st_insertar_tar_cred)
destroy(this.st_correlativo_cheque)
destroy(this.st_eliminar_cheque)
destroy(this.st_insertar_cheque)
destroy(this.cbx_tarjeta_debito)
destroy(this.dw_impresion)
destroy(this.sle_efectivo)
destroy(this.cbx_cheque)
destroy(this.cbx_efectivo)
destroy(this.st_6)
destroy(this.st_41)
destroy(this.st_saldo)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_vuelto)
destroy(this.sle_paga_con)
destroy(this.st_3)
destroy(this.st_total)
destroy(this.gb_1)
destroy(this.cbx_tarjeta_credito)
destroy(this.gb_11)
destroy(this.tab_1)
destroy(this.gb_4)
end on

event open;Long		ll_codigo,ll_cta_inicial,ll_cuota_final,ll_cod_parque,ll_min_boleta,ll_tot_reg_ing,ll_fila,ll_cta_pag,ll_fila_mov,ll_item,ll_tot_reg_m,ai_cuotas_pag,ll_tot_reg_mp,ll_tot_reg_det,ll_indi_mp,ll_indi_det,&
			ll_tot_reg_dscto,ll_fila_dscto,ll_indi_dscto,ll_cod_mp,ll_tot_reg_hijo,ll_indi_hijo,ll_new_dscto_hijo
String		ls_vigente,ls_codigo_empresa,ls_descrip,ls_parque_des,ls_cod_mov,ls_ctto,ls_tipo_ctto,ls_base_mpdet,as_tipo_mov,ls_tipo_cob,ls_tipo_doc,ls_moneda_ctto,ls_dv,ls_base,ls_base_det,ls_moneda_det,&
			ls_tipo_cob_dscto,ls_tipo_otro_dscto,ls_dscto_h,ls_contrato_hijo,ls_base_hijo,ls_tipo_mov_hijo,ls_base_mp_hijo,ls_serie_mp_hijo,ls_tipo_doc_hijo
Double	ld_monto,ldb_acum_pie,ldb_iva_acum,ldb_porc_pie_mp,ldb_precio_mp,ldb_precio_mpdet,ldb_iva_mpdet,ldb_porc_pie_mp_det,ldb_porcsubtotimp_mpdet,ldb_precio_uni_ctto,ldb_pie_uni_ctto,&
			ldb_iva_p,ll_total_ctto,ll_total_pago_ctto,ll_max_folio_new,ldb_iva,ldb_total,ll_cupon_mp,ll_monto_dscto,ll_tot_pago_hijo,ll_tot_pago_total,ll_calc_porc_hijo,ll_porc_dscto_asig,ll_rut_hijo,&
			ll_numero_mp_hijo,ll_cupon_mp_hijo,ll_cupon_hijo,ldb_uf_hijo
Datetime	ldt_fecha_hoy
DataWindowChild 	dwch, dwch_credito, dwch_debito, dwch_tipo_tarjeta

gw_frame = w_principal
gs_usuario	= gs_user

//Connect using Trans_1;
//Connect using Trans_2;
//Connect using Trans_3;
idt_fecha_hoy												= gd_fecha_pago_plazo		//date(gdt_fec_sistema)
st_saldo.text												= ''
il_max_folio_new											= 0
is_reingreso													= 'N'
pb_grabar.enabled										= true
SELECT	"TASA"."IVA"  INTO :idb_iva  FROM 	"TASA"  WHERE "TASA"."LOOK" = 1   ;
if idt_fecha_hoy <> today() then
	messagebox("Advertencia","Recuerde Fecha de Sistema: "+string(idt_fecha_hoy,"dd/mm/yyyy")+" es distinta al de su PC: "+string(today(),"dd/mm/yyyy")+", FECHA A UTILIZAR ES: "+string(idt_fecha_hoy,"dd/mm/yyyy"))
end if
idt_fecha_hoy												= date(w_ingreso2.st_fecha.text)
st_tipo_cobro.text											= gs_tipo_cobro
il_tab_forma_pago											= w_ingreso2.tab_ingreso.SelectedTab
if gs_depto='C' then 
	st_6.text													= 'Monto EF./CR.$ :'
	cbx_credito.visible										= true
else
	st_6.text													= 'Monto Efectivo $ :'
	cbx_credito.visible										= false
end if
dw_boleta.settransobject(sqlca)
dw_factura.settransobject(sqlca)
ls_parque_des	= UPPER(gs_empresa)
SELECT	"COD_PARQ"."CODIGO"  
INTO 		:ll_cod_parque  
FROM 	"COD_PARQ"  
WHERE 	"COD_PARQ"."NOMBRE" = :ls_parque_des   ;

DECLARE	cod_emp CURSOR FOR  
SELECT 		"TIPO_TARJETA_EMPRESA"."CODIGO",   
				"TIPO_TARJETA_EMPRESA"."DESCRIPCION"  
FROM 		"TIPO_TARJETA_EMPRESA"  
WHERE		"TIPO_TARJETA_EMPRESA"."COD_PARQUE" = :ll_cod_parque
ORDER BY 	"TIPO_TARJETA_EMPRESA"."DESCRIPCION" ASC  
USING		sqlca;
open cod_emp;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch cod_emp into :ls_codigo_empresa, :ls_descrip;
		tab_1.tabpage_credito.rb_empresa_1.text	= ls_codigo_empresa+'-'+ls_descrip
		tab_1.tabpage_debito.rb_empresa_3.text	= ls_codigo_empresa+'-'+ls_descrip
		fetch cod_emp into :ls_codigo_empresa, :ls_descrip;
		tab_1.tabpage_credito.rb_empresa_2.text	= ls_codigo_empresa+'-'+ls_descrip
		tab_1.tabpage_debito.rb_empresa_4.text	= ls_codigo_empresa+'-'+ls_descrip
		exit;
	LOOP
end if
close cod_emp;
if gs_tipo_cobro='BL' then
	tab_1.tabpage_cheque.st_titulo_cheque.text	= 'Detalle Pago en Cheque Administradora'
	tab_1.tabpage_credito.st_titulo_credito.text		= 'Detalle Pago en Cuota Administradora'
	tab_1.tabpage_debito.st_titulo_debito.text		= 'Detalle Pago Tarjeta Débito Administradora'
else
	tab_1.tabpage_cheque.st_titulo_cheque.text	= 'Detalle Pago en Cheque Inmobiliaria'
	tab_1.tabpage_credito.st_titulo_credito.text		= 'Detalle Pago en Cuota Inmobiliaria'
	tab_1.tabpage_debito.st_titulo_debito.text		= 'Detalle Pago Tarjeta Débito Inmobiliaria'
end if

Long		ll_grupo
String		ls_tip_cob,ls_rut_empresa
Datetime	ldt_fecha_pago=DATETIME(DATE(gdt_fec_sistema),TIME('00:00:00'))
if gs_tipo_cobro='CU' then
	SELECT	"CADENA"."COD_PARQUE"
	INTO 		:ll_cod_parque
	FROM 	"CADENA",	"CADENA_MORA"  
	WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
			  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
			  (("CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
		INTO 		:ls_rut_empresa
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ls_tip_cob			= 'BE'
			SELECT	"ELECTRONICA_FB"."GRUPO"  
			INTO 		:ll_grupo  
			FROM 	"ELECTRONICA_FB"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
					  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
					  
					  
			UPDATE		"ELECTRONICA_FB_DETALLE"  
			SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
							"RUT" = :gi_rut,   
							"ESTADO_REG" = 'P',   
							"DV" = :gs_dv,   
							"USUARIO_CREA" = :gs_user,
							"BASE"  = :gs_base,
							"SERIE" = :gs_serie,
							"NUMERO" = :gi_numero,
							"IP_EQUIPO" = :gs_tcp_ip
			WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
						  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = (  	SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
																									FROM 	"ELECTRONICA_FB",   
																												"ELECTRONICA_FB_DETALLE"  
																									WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
																											  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
																											  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
																												( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																											  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  //'BE'
																											  ( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																											  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )       ) ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   
			USING		sqlca;		  
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			
			SELECT	"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO"
			INTO 		:ll_min_boleta
			FROM 	"ELECTRONICA_FB",   
						"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  //'BE'
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
						( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )  ;
					  
			gl_folio											= ll_min_boleta
			gs_tipo_cobro									= ls_tip_cob
//			st_tipo_cobro.text								= gs_tipo_cobro
		end if
	end if
end if

st_folio.text													= string(gl_folio,"###,###,###,###,###,##0")
sle_paga_con.enabled									= false
sle_vuelto.enabled											= false
if gs_rezago='S' then
	st_rezago.text											= 'Si'
else
	st_rezago.text											= 'No'
end if
st_fecha_pago.text										= w_ingreso2.st_fecha.text
//st_fecha_pago.text										= string(date(fechasys))
if w_ingreso2.st_fuera_plazo.visible = true then
	is_opcion													= 'FP'
	if not isnull(gs_base) and not isnull(gs_serie) and not isnull(gi_numero) then
		if gs_rezago='S' then
			w_forma_pago2.title								= 'Forma de Pago  << FUERA DE PLAZO  >>     Contrato Nº '+gs_base+' - '+gs_serie+' - '+string(gi_numero,"###,###,###,###,##0")+'  en Rezago'
		else
			w_forma_pago2.title								= 'Forma de Pago  << FUERA DE PLAZO  >>      Contrato Nº '+gs_base+' - '+gs_serie+' - '+string(gi_numero,"###,###,###,###,##0")
		end if
	else
		w_forma_pago2.title									= 'Forma de Pago  << FUERA DE PLAZO  >> '
	end if
else
	if not isnull(gs_base) and not isnull(gs_serie) and not isnull(gi_numero) then
		if gs_rezago='S' then
			w_forma_pago2.title								= 'Forma de Pago       Contrato Nº '+gs_base+' - '+gs_serie+' - '+string(gi_numero,"###,###,###,###,##0")+'  en Rezago'
		else
			w_forma_pago2.title								= 'Forma de Pago       Contrato Nº '+gs_base+' - '+gs_serie+' - '+string(gi_numero,"###,###,###,###,##0")
		end if
	else
		w_forma_pago2.title									= 'Forma de Pago'
	end if
end if

gf_centrar(w_forma_pago2)
//DDW Banco pago con CH 1
dw_abono.settransobject(sqlca)
if dw_abono.retrieve(gl_folio,gs_tipo_cobro) > 0 then
	il_abono				= dw_abono.getitemnumber(1,'c_sum_abono')
	if isnull(il_abono) then il_abono=0
	st_saldo.text		= string(il_abono,'###,###,###,###,##0')
	st_abono_ini.text	= "Abono Utilizado $ "+string(il_abono,'###,###,###,###,##0')
else
	il_abono				= 0
	st_saldo.text		= string(il_abono,'###,###,###,###,##0')
	st_abono_ini.text	= ""
end if
tab_1.tabpage_cheque.dw_detalle_pago_1.GetChild('cod_banco', dwch)
dwch.SetTransObject(SQLCA)
dwch.Retrieve()
//DDW Banco pago con TC 1
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetChild('cod_banco', dwch_credito)
dwch_credito.SetTransObject(SQLCA)
dwch_credito.Retrieve()
//DDW tipo tarjeta pago con TC 1
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetChild('tipo_tarjeta_credito', dwch_tipo_tarjeta)
dwch_tipo_tarjeta.SetTransObject(SQLCA)
dwch_tipo_tarjeta.Retrieve(1,900,'N')
//DDW Banco pago con TD 1
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetChild('cod_banco_debito', dwch_debito)
dwch_debito.SetTransObject(SQLCA)
dw_print_cupones.SetTransObject(SQLCA)
dwch_debito.Retrieve()
tab_1.tabpage_cheque.dw_detalle_pago_1.SetTransObject(SQLCA)
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetTransObject(SQLCA)
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetTransObject(SQLCA)
tab_1.tabpage_cheque.dw_empresa_1.SetTransObject(SQLCA)
tab_1.tabpage_cheque.dw_empresa_2.SetTransObject(SQLCA)
dw_multiproducto.SetTransObject(SQLCA)
ll_tot_reg_ing					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
if (gs_base='M' and ll_tot_reg_ing > 0) or (gl_sw_mp = 0 and gl_codigo_mp > 0 and ll_tot_reg_ing > 0) then
	ll_fila							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'E' ",1,ll_tot_reg_ing)
	if ll_fila=0 then
		ll_fila						= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'A' ",1,ll_tot_reg_ing)
		if ll_fila=0 then
			ll_fila					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob = 'F' ",1,ll_tot_reg_ing)
			if ll_fila=0 then
				ls_cod_mov		= 'F'
			else
				ll_cta_pag		=  w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
				ls_cod_mov		= ''
			end if
		else
			ls_cod_mov			= 'A'
			ll_cta_pag			=  w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
		end if
	else
		ls_cod_mov				= 'E'
		ll_cta_pag				=  w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
	end if
	if ls_cod_mov='E' or ls_cod_mov='F' or ls_cod_mov='A' then
		ls_ctto					= gs_base+gs_serie+string(gi_numero)
		ls_tipo_ctto				= 'DET'
		if dw_multiproducto.retrieve(ls_ctto,ls_cod_mov,gi_rut,ll_cta_pag,ls_tipo_ctto)=0 then
			if gs_base='M' or (gs_rezago = 'S' and gl_sw_mp = 0 and gl_codigo_mp > 0) then
				ll_fila_mov										= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob='A' or tipo_cob='E' or tipo_cob='F'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
				
				if gs_rezago='S' and ll_fila_mov > 0 then //(as_tipo_mov='E' or as_tipo_mov='F' or as_tipo_mov='A') then
					if gl_sw_mp = 0 and gl_codigo_mp > 0 then
						as_tipo_mov							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_fila_mov,'tipo_cob')
						ls_tipo_cob								= as_tipo_mov
						ai_cuotas_pag							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila_mov,'cantidad')
						ll_fila_mov								= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob='A' or tipo_cob='E' or tipo_cob='F'",1,w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
						if ll_fila_mov > 0 then
							ls_moneda_det						= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_fila_mov,'moneda')
							if ls_moneda_det='P' then
//							if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
								ld_monto							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila_mov,'monto')
							//elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
							elseif  ls_moneda_det='U' then
								ld_monto							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila_mov,'monto_uf')
							end if
						end if
						ldb_acum_pie							= 0
						ldb_iva_acum							= 0
						ll_item									= 0
						DECLARE x3 CURSOR FOR  
						SELECT 	"MPPRODUCTO"."PORCENTAJEPIE",  	"MPPRODUCTO"."PRECIO",   	"MPPRODUCTODET"."BASE",   	"MPPRODUCTODET"."PRECIO",   	"MPPRODUCTODET"."IVA",   	"MPPRODUCTODET"."PORCENTAJEPIE" ,   	"MPPRODUCTODET"."PORCSUBTOTALIMP" 
						FROM 	"MPPRODUCTO",   	"MPPRODUCTODET"  
						WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
									( "MPPRODUCTO"."CODIGOMP" = :gl_codigo_mp )   
						USING	Trans_2;
						open x3;
						if Trans_2.sqlcode=0 then
							do while Trans_2.sqlcode=0
								fetch x3 into :ldb_porc_pie_mp, :ldb_precio_mp,	:ls_base_mpdet, :ldb_precio_mpdet, :ldb_iva_mpdet, :ldb_porc_pie_mp_det, :ldb_porcsubtotimp_mpdet;
								if not isnull(ls_base_mpdet) then
									if gs_rezago='S' then
										if gs_conexion	 = "Parque El Prado" then
											ls_ctto				= ls_base_mpdet+'G'+string(0)
										elseif gs_conexion	= "Parque La Foresta" then
											ls_ctto				= ls_base_mpdet+'N'+string(0)
										end if
										ll_fila						= dw_multiproducto.insertrow(0)
										ll_item ++
										dw_multiproducto.setitem(ll_fila,'item',ll_item)
										dw_multiproducto.setitem(ll_fila,'contrato',ls_ctto)
										dw_multiproducto.setitem(ll_fila,'rut',gi_rut)
										dw_multiproducto.setitem(ll_fila,'cantidad',1)
										dw_multiproducto.setitem(ll_fila,'tipo_mov',as_tipo_mov)
										dw_multiproducto.setitem(ll_fila,'mpbase','M')
										dw_multiproducto.setitem(ll_fila,'mpserie','G')
										dw_multiproducto.setitem(ll_fila,'mpnumero',0)
										dw_multiproducto.setitem(ll_fila,'nufdia',gd_uf)
										
										if ((ls_base_mpdet='O' or ls_base_mpdet='U') and (ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='U' or ls_tipo_cob='Q')) then
											dw_multiproducto.setitem(ll_fila,'tipodoc','CI')
										else
											dw_multiproducto.setitem(ll_fila,'tipodoc','BA')
										end if
									end if
									
									if ls_moneda_det='P' then		//if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
										ldb_precio_uni_ctto	= round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),0)
										dw_multiproducto.setitem(ll_fila,'montoitem',ldb_precio_uni_ctto)
										dw_multiproducto.setitem(ll_fila,'totalitem',ldb_precio_uni_ctto)
										
										dw_multiproducto.setitem(ll_fila,'monto_uf',round(ldb_precio_uni_ctto / gd_uf,4))
										dw_multiproducto.setitem(ll_fila,'total_uf',round(ldb_precio_uni_ctto / gd_uf,4))
										dw_multiproducto.setitem(ll_fila,'moneda','1')
										dw_multiproducto.setitem(ll_fila,'tipomoneda','PESO')
									elseif ls_moneda_det='U' then		//elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
										ldb_precio_uni_ctto	= round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),4)
										dw_multiproducto.setitem(ll_fila,'monto_uf',ldb_precio_uni_ctto)
										dw_multiproducto.setitem(ll_fila,'total_uf',ldb_precio_uni_ctto)
										
										dw_multiproducto.setitem(ll_fila,'montoitem',round(ldb_precio_uni_ctto * gd_uf,0))
										dw_multiproducto.setitem(ll_fila,'totalitem',round(ldb_precio_uni_ctto * gd_uf,0))
										dw_multiproducto.setitem(ll_fila,'moneda','2')
										dw_multiproducto.setitem(ll_fila,'tipomoneda','UF')
									end if
									ldb_pie_uni_ctto			= ldb_precio_uni_ctto		//round(((ldb_precio_uni_ctto * ldb_porc_pie_mp_det) / 100),4)
									ldb_acum_pie				= ldb_acum_pie + ldb_pie_uni_ctto
									if ldb_iva_mpdet > 0 then
										if ls_moneda_det='P' then		//if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
											ldb_iva_p 			= round(ldb_pie_uni_ctto * (idb_iva - 1),0)
											dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto + ldb_iva_p)
											dw_multiproducto.setitem(ll_fila,'totaliva',ldb_iva_p)
										elseif ls_moneda_det='U' then		//elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
											ldb_iva_p 			= round(ldb_pie_uni_ctto * (idb_iva - 1),4)
											dw_multiproducto.setitem(ll_fila,'totalcto',round(round((ldb_precio_uni_ctto + ldb_iva_p),4) * gd_uf,0))
											dw_multiproducto.setitem(ll_fila,'totaliva',round(ldb_iva_p * gd_uf,0))
										end if
										ldb_iva_acum			= ldb_iva_acum + ldb_iva_p
									else
										dw_multiproducto.setitem(ll_fila,'totaliva',0)
										if ls_moneda_det='P' then			//if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
											dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto)
										elseif ls_moneda_det='U' then		//elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
											dw_multiproducto.setitem(ll_fila,'totalcto',round(ldb_precio_uni_ctto * gd_uf,0))
										end if
									end if
									dw_multiproducto.accepttext()
									ls_tipo_doc					= dw_multiproducto.getitemstring(ll_fila,'tipodoc')
									ll_total_ctto					= dw_multiproducto.getitemnumber(ll_fila,'totalcto')
									ls_moneda_ctto			= dw_multiproducto.getitemstring(ll_fila,'moneda')
									ls_dv							= '0'
									if ls_moneda_ctto='1' then
										ll_total_pago_ctto		= ll_total_ctto
									else
										ll_total_pago_ctto		= round((ll_total_ctto / gd_uf),4)
									end if
									dw_multiproducto.setitem(ll_fila,'mpnro_cupon',gl_folio)
									if ls_tipo_doc = 'CI' then
										ll_max_folio_new		= gl_folio
										dw_multiproducto.setitem(ll_fila,'nro_cupon',ll_max_folio_new)
										f_crear_folio_web_mp(1, ll_max_folio_new, ls_base_mpdet, 'G', ll_max_folio_new, ll_max_folio_new, ldt_fecha_hoy, 'V', ls_tipo_cob, ls_tipo_doc, ll_max_folio_new, ldt_fecha_hoy, ll_total_pago_ctto, ll_total_ctto, 0, 0, 1, ls_dv, 'M', 'G', 0, ls_moneda_ctto, gs_user, gs_caja, ll_max_folio_new)
									else
										select id_cuponeras_web.nextval into :ll_max_folio_new from dual;
										dw_multiproducto.setitem(ll_fila,'nro_cupon',ll_max_folio_new)
			//											ll_folio_elect			= f_crear_folio_web_mp(1, :ll_max_folio_new, :ls_base_mpdet,'G',:ll_max_folio_new,:ll_max_folio_new,:ldt_fecha_hoy,'V',:ls_tipo_cob,:ls_tipo_doc, :ll_max_folio_new,:ldt_fecha_hoy,:ll_total_pago_ctto,:ll_total_ctto,0,0,1,:ls_dv,'M','G',0,:ls_moneda_ctto,:gs_user,:gs_caja,:ll_max_folio_new)
										f_crear_folio_web_mp(1, ll_max_folio_new, ls_base_mpdet, 'G', ll_max_folio_new, ll_max_folio_new, ldt_fecha_hoy, 'V', ls_tipo_cob, ls_tipo_doc, ll_max_folio_new, ldt_fecha_hoy, ll_total_pago_ctto, ll_total_ctto, 0, 0, 1, ls_dv, 'M', 'G', 0, ls_moneda_ctto, gs_user, gs_caja, ll_max_folio_new)
									end if
								end if
								if ldb_iva_p > 0 then
									if gs_rezago='S' then
			//										ll_fila						= dw_detalle_ci.insertrow(0)
										if gs_conexion	 = "Parque El Prado" then
											ls_ctto				= ls_base_mpdet+'G'+string(0)
										elseif gs_conexion	= "Parque La Foresta" then
											ls_ctto				= ls_base_mpdet+'N'+string(0)
										end if
										ll_fila						= dw_multiproducto.insertrow(0)
										ll_item ++
										dw_multiproducto.setitem(ll_fila,'item',ll_item)
										dw_multiproducto.setitem(ll_fila,'contrato',ls_ctto)
										dw_multiproducto.setitem(ll_fila,'nro_cupon',ll_max_folio_new)
										dw_multiproducto.setitem(ll_fila,'rut',gi_rut)
										dw_multiproducto.setitem(ll_fila,'cantidad',1)
										dw_multiproducto.setitem(ll_fila,'mpbase','M')
										dw_multiproducto.setitem(ll_fila,'mpserie','G')
										dw_multiproducto.setitem(ll_fila,'mpnumero',0)
										dw_multiproducto.setitem(ll_fila,'tipo_mov','D')
			//										dw_multiproducto.setitem(ll_fila,'mpnro_cupon'
			//										dw_multiproducto.setitem(ll_fila,'nro_cupon'
										if ((ls_base_mpdet='O' or ls_base_mpdet='U') and (ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='U' or ls_tipo_cob='Q')) then
											dw_multiproducto.setitem(ll_fila,'tipodoc','CI')
										else
											dw_multiproducto.setitem(ll_fila,'tipodoc','BA')
										end if
										if ls_moneda_det='P' then			//if w_ingreso2.tab_ingreso.tp_ci.rb_ci_peso.checked=true then
											dw_multiproducto.setitem(ll_fila,'montoitem',round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),0))
											dw_multiproducto.setitem(ll_fila,'totalcto',ldb_precio_uni_ctto + ldb_iva_p)
											ldb_precio_uni_ctto	= round(ldb_iva_p,0)
											dw_multiproducto.setitem(ll_fila,'montoitem',ldb_precio_uni_ctto)
											dw_multiproducto.setitem(ll_fila,'totalitem',ldb_precio_uni_ctto)
											dw_multiproducto.setitem(ll_fila,'monto_uf',round(ldb_precio_uni_ctto / gd_uf,4))
											dw_multiproducto.setitem(ll_fila,'total_uf',round(ldb_precio_uni_ctto / gd_uf,4))
											dw_multiproducto.setitem(ll_fila,'moneda','1')
											dw_multiproducto.setitem(ll_fila,'tipomoneda','PESO')
											dw_multiproducto.setitem(ll_fila,'totaliva',ldb_iva_acum)
											
										elseif ls_moneda_det='U' then		//elseif w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
											dw_multiproducto.setitem(ll_fila,'montoitem',round(round(((ld_monto * ldb_porcsubtotimp_mpdet) / 100),4) * gd_uf,0) )
											dw_multiproducto.setitem(ll_fila,'totalcto',round(round((ldb_precio_uni_ctto + ldb_iva_p),4) * gd_uf,0))
											ldb_precio_uni_ctto	= round(ldb_iva_p,4)
											dw_multiproducto.setitem(ll_fila,'monto_uf',ldb_precio_uni_ctto)
											dw_multiproducto.setitem(ll_fila,'total_uf',ldb_precio_uni_ctto)
											dw_multiproducto.setitem(ll_fila,'montoitem',round(ldb_precio_uni_ctto * gd_uf,0))
											dw_multiproducto.setitem(ll_fila,'totalitem',round(ldb_precio_uni_ctto * gd_uf,0))
											dw_multiproducto.setitem(ll_fila,'moneda','2')
											dw_multiproducto.setitem(ll_fila,'tipomoneda','UF')
											dw_multiproducto.setitem(ll_fila,'totaliva', round(ldb_iva_acum * gd_uf,0))
										end if
										dw_multiproducto.setitem(ll_fila,'nufdia',gd_uf)
										
									end if
								end if
								setnull(ls_base_mpdet)
								ldb_iva_p	= 0
							loop
						end if
						close x3;
					end if
//				elseif gs_rezago<>'S' and (as_tipo_mov='E' or as_tipo_mov='F' or as_tipo_mov='A') then
//					ls_ctto					= gs_base+gs_serie+string(gi_numero)
//					ls_tipo_ctto				= 'DET'
//					ll_tot_reg_m			= dw_multiproducto.retrieve(ls_ctto,as_tipo_mov,gi_rut,ai_cuotas_pag,ls_tipo_ctto)
					
				end if
			else
				ll_tot_reg_dscto								= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
				if ll_tot_reg_dscto > 0 then
					ll_fila_dscto									= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob='S'",1,ll_tot_reg_dscto)
					ll_cod_mp									= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'cadena_codigomp')
					if ll_fila_dscto > 0 then
						ll_tot_reg_hijo							= dw_multiproducto.rowcount()
						for ll_indi_dscto=ll_fila_dscto to ll_tot_reg_dscto
							ls_tipo_cob_dscto					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi_dscto,'tipo_cob')
							ls_tipo_otro_dscto					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi_dscto,'tipo_cob_otro')
							ll_monto_dscto						= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_indi_dscto,'c_total_linea')
							wf_cargar_dscto_mp(ls_tipo_cob_dscto, ls_tipo_otro_dscto, ll_monto_dscto, ll_tot_reg_hijo,ll_cod_mp)
						next
					end if
				end if
			end if
		else
			ll_tot_reg_dscto								= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
			if ll_tot_reg_dscto > 0 then
				ll_fila_dscto									= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.find("tipo_cob='S'",1,ll_tot_reg_dscto)
				ll_cod_mp									= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'cadena_codigomp')
				if ll_fila_dscto > 0 then
					ll_tot_reg_hijo							= dw_multiproducto.rowcount()
					for ll_indi_dscto=ll_fila_dscto to ll_tot_reg_dscto
						ls_tipo_cob_dscto					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi_dscto,'tipo_cob')
						ls_tipo_otro_dscto					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi_dscto,'tipo_cob_otro')
						ll_monto_dscto						= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_indi_dscto,'c_total_linea')
						wf_cargar_dscto_mp(ls_tipo_cob_dscto, ls_tipo_otro_dscto, ll_monto_dscto, ll_tot_reg_hijo,ll_cod_mp)
					next
				end if
			end if
		end if
	end if
	
//	ll_tot_reg_mp		= w_ingreso2.dw_multiproducto.rowcount()
//	ll_tot_reg_det		= dw_multiproducto.rowcount()
//	if ll_tot_reg_mp > 0 then
//		ls_base			= mid(w_ingreso2.dw_multiproducto.getitemstring(1,'contrato'),1,1)
//		ldb_iva			= w_ingreso2.dw_multiproducto.getitemnumber(1,'totaliva')
//		ldb_total			= w_ingreso2.dw_multiproducto.getitemnumber(1,'totalcto')
//		ll_cupon_mp	= w_ingreso2.dw_multiproducto.getitemnumber(1,'mpnro_cupon')
//		for ll_indi_det=1 to ll_tot_reg_det
//			dw_multiproducto.setitem(ll_indi_det,'totaliva',ldb_iva)
//			dw_multiproducto.setitem(ll_indi_det,'totalcto',ldb_total)
//			dw_multiproducto.setitem(ll_indi_det,'mpnro_cupon',ll_cupon_mp)
//			if ls_base = ls_base_det then
//				
//			end if
//		next
//	end if 
end if

tab_1.tabpage_cheque.dw_empresa_1.insertrow(0)
tab_1.tabpage_cheque.dw_empresa_2.insertrow(0)
cbx_efectivo.checked															= false
sle_efectivo.enabled															= false
cbx_cheque.checked															= false
st_insertar_cheque.enabled													= false
st_eliminar_cheque.enabled 												= false
st_correlativo_cheque.enabled 												= false
tab_1.tabpage_cheque.em_cantidad_1.enabled 						= false
tab_1.tabpage_cheque.dw_detalle_pago_1.enabled 					= false
//cbx_tarjeta_credito.checked												= false
st_insertar_tar_cred.enabled												= false
st_eliminar_tarjeta_cred.enabled 											= false
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled 		= false                       
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.enabled 	= false
//cbx_tarjeta_debito.checked												= false
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.enabled	= false
st_total.text 																		= string(gd_total, "###,###,###,###,###")
em_saldo.text 																	= string(gd_total - il_abono, "###,###,###,###,###")
tab_1.tabpage_cheque.enabled												= false
tab_1.tabpage_cheque.em_cantidad_1.enabled						= false
tab_1.tabpage_credito.enabled												= false
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled			= false
tab_1.tabpage_debito.enabled												= false
tab_1.tabpage_cheque.dw_empresa_1.enabled						= false
tab_1.tabpage_cheque.dw_empresa_2.enabled						= false
//if il_tab_forma_pago=5 then 
//	tab_1.tabpage_cheque.st_17.visible									= true
//	tab_1.tabpage_cheque.dw_empresa_1.visible						= true
//	tab_1.tabpage_cheque.st_18.visible									= true
//	tab_1.tabpage_cheque.dw_empresa_2.visible						= true
//else
//	tab_1.tabpage_cheque.st_17.visible									= false
//	tab_1.tabpage_cheque.dw_empresa_1.visible						= false
//	tab_1.tabpage_cheque.dw_empresa_2.visible						= false
//	tab_1.tabpage_cheque.st_18.visible									= false
//end if
DECLARE		x1 CURSOR FOR  
SELECT 		"TIPO_COMISION_TARJETA_CREDITO"."CODIGO",   
				"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
				"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL",   
				"TIPO_COMISION_TARJETA_CREDITO"."VIGENTE"  
FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ll_codigo,:ll_cta_inicial,:ll_cuota_final,:ls_vigente;
		if ll_codigo>0 then
			if ll_codigo=1 then
				tab_1.tabpage_credito.rb_cred.text					= 'Créd.('+string(ll_cta_inicial)+'-'+string(ll_cuota_final)+')'
				if ls_vigente='S' then
					tab_1.tabpage_credito.rb_cred.enabled			= true
				else
					tab_1.tabpage_credito.rb_cred.enabled			= false
				end if
			elseif ll_codigo=2 then
				tab_1.tabpage_credito.rb_prom.text					= '('+string(ll_cta_inicial)+'-'+string(ll_cuota_final)+') S/Int.'
				if ls_vigente='S' then
					tab_1.tabpage_credito.rb_prom.enabled			= true
				else
					tab_1.tabpage_credito.rb_prom.enabled			= false
				end if
			elseif ll_codigo=3 then
				tab_1.tabpage_credito.rb_comer.text					= 'Com.('+string(ll_cta_inicial)+'-'+string(ll_cuota_final)+')'
				if ls_vigente='S' then
					tab_1.tabpage_credito.rb_comer.enabled		= true
				else
					tab_1.tabpage_credito.rb_comer.enabled		= false
				end if
			elseif ll_codigo=4 then
				tab_1.tabpage_credito.rb_tienda_cred.text			= 'Tt.('+string(ll_cta_inicial)+'-'+string(ll_cuota_final)+')'
				if ls_vigente='S' then
					tab_1.tabpage_credito.rb_tienda_cred.enabled	= true
				else
					tab_1.tabpage_credito.rb_tienda_cred.enabled	= false
				end if
			elseif ll_codigo=5 then
				tab_1.tabpage_credito.rb_tienda_ctdo.text			= 'Tt.('+string(ll_cta_inicial)+'-'+string(ll_cuota_final)+') S/Int.'
				if ls_vigente='S' then
					tab_1.tabpage_credito.rb_tienda_ctdo.enabled	= true
				else
					tab_1.tabpage_credito.rb_tienda_ctdo.enabled	= false
				end if
			end if
		end if
	LOOP
end if
close x1;
if tab_1.tabpage_credito.rb_cred.enabled=true then
	tab_1.tabpage_credito.rb_cred.checked							= true
elseif tab_1.tabpage_credito.rb_prom.enabled=true then
	tab_1.tabpage_credito.rb_prom.checked							= true
elseif tab_1.tabpage_credito.rb_comer.enabled=true then
	tab_1.tabpage_credito.rb_comer.checked						= true
end if	
//f_actualizar_saldo()
end event

event close;Long		ll_count,ll_count2,ll_tot_reg,ll_indi,ll_sw_suma
Datetime	ldt_fecha_pago
Double	ll_det_cupon_1,ll_cupon_mp,ll_cupon_det
String		ls_tipo_cob

ldt_fecha_pago		= datetime(date(st_fecha_pago.text),time('00:00:00'))
SELECT 		Count("INGRESO"."FOLIO")
INTO 			:ll_count  
FROM 		"INGRESO"  
WHERE 	( "INGRESO"."FOLIO" = :gl_folio ) AND  
			( "INGRESO"."TIPO_COB" = :gs_tipo_cobro ) AND  
			( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago )   
USING		sqlca;
if ll_count = 0 or isnull(ll_count) then
	SELECT		Count("CLIENTE_REZAGO"."BASE")
	INTO 			:ll_count2  
	FROM 		"CLIENTE_REZAGO"  
	WHERE 	( "CLIENTE_REZAGO"."COD_PAGO" = :gs_tipo_cobro ) AND  
				( "CLIENTE_REZAGO"."FOLIO" = :gl_folio ) AND  
				( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago )   
	USING		sqlca;
	if ll_count2 = 0 or isnull(ll_count2) then
//		w_ingreso2.wf_limpiar_boleta_electronica(gl_folio)
	end if
end if
ll_tot_reg			= dw_multiproducto.rowcount()
if gs_base='M' and ll_tot_reg > 0 then
	SELECT 	Count("INGRESO"."TIPO_COB"  )
	INTO 		:ll_count  
	FROM 	"INGRESO"  
	WHERE 	( "INGRESO"."FOLIO" = :gl_folio ) AND  
				( "INGRESO"."TIPO_COB" = 'CX' ) AND  
				( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago )   ;
	if isnull(ll_count) then ll_count=0
	if ll_count > 0 then
		ll_sw_suma				= 0
		ll_det_cupon_1			= 0
		for ll_indi=1 to ll_tot_reg
			ll_sw_suma ++
			ll_cupon_mp		= dw_multiproducto.getitemnumber(ll_indi,'mpnro_cupon')
			ll_cupon_det		= dw_multiproducto.getitemnumber(ll_indi,'nro_cupon')
			ls_tipo_cob			= dw_multiproducto.getitemstring(ll_indi,'tipodoc')
			if ll_sw_suma = 1 then
				UPDATE 	"CUPONERAS_DETALLE_WEB"  
				SET 		"ESTADO_PAGO_CUPON" = 'A'  
				WHERE 	( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_cupon_mp ) AND  
							( "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = :ls_tipo_cob OR "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = 'CX' ) AND  
							( "CUPONERAS_DETALLE_WEB"."RUT" = :gi_rut ) AND  
							( "CUPONERAS_DETALLE_WEB"."FECHA_PAGO" = :ldt_fecha_pago )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
			if ll_cupon_det <> ll_det_cupon_1 then
				UPDATE 	"CUPONERAS_DETALLE_WEB"  
				SET 		"ESTADO_PAGO_CUPON" = 'A'  
				WHERE 	( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_cupon_det ) AND  
							( "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = :ls_tipo_cob ) AND  
							( "CUPONERAS_DETALLE_WEB"."RUT" = :gi_rut ) AND  
							( "CUPONERAS_DETALLE_WEB"."FECHA_PAGO" = :ldt_fecha_pago )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				ll_det_cupon_1	= ll_cupon_det
			end if
		next
	end if
end if
//Disconnect using Trans_1;
//Disconnect using Trans_2;
//Disconnect using Trans_3;
end event

event mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true

end event

type dw_multiproducto from datawindow within w_forma_pago2
integer x = 59
integer y = 2160
integer width = 3131
integer height = 648
string title = "none"
string dataobject = "d_arch_mul_cajnomina_presencial"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_credito from checkbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 727
integer y = 204
integer width = 439
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "CREDITO"
end type

event clicked;Long	ll_saldo, ll_efectivo,id_resto,ll_total
sle_efectivo.Enabled 			= cbx_efectivo.Checked
sle_paga_con.text				= ''
sle_vuelto.text					= ''
IF cbx_credito.Checked=true THEN
	sle_paga_con.enabled	= true
	sle_vuelto.enabled			= true
	if cbx_efectivo.checked=false and trim(em_saldo.text) = trim(st_total.text) and cbx_cheque.checked=false and &
		cbx_tarjeta_credito.checked=false and cbx_tarjeta_debito.checked=false and cbx_credito.checked=true then
		ll_efectivo				= long(em_saldo.text)
		em_saldo.text			= '0'
		sle_efectivo.text		= string(ll_efectivo,"###,###,###,##0")
	else
		ll_efectivo				= long(sle_efectivo.text)
		ll_total					= long(st_total.text)
		if ll_efectivo = ll_total then
			em_saldo.text		= string(ll_total - il_abono,"###,###,###,##0")
			sle_efectivo.text	= '0'
		end if
	end if
	sle_paga_con.text			= string(ll_efectivo,"###,###,###,##0")
	sle_paga_con.setfocus()
ELSE
	sle_paga_con.enabled		= false
	sle_vuelto.enabled				= false
	wf_valida_opciones_pago()
	if cbx_tarjeta_debito.checked=true then
		tab_1.SelectedTab															= 3
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
	elseif cbx_tarjeta_credito.checked=true then
		tab_1.SelectedTab															= 2
		tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
	elseif cbx_efectivo.checked=true then
		sle_efectivo.setfocus()
	elseif cbx_credito.checked=true then
		sle_efectivo.setfocus()
	elseif cbx_cheque.checked=true then
		tab_1.SelectedTab															= 1
		tab_1.tabpage_cheque.em_cantidad_1.setfocus()
	end if
END IF
end event

type st_fuera_plazo from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 946
integer y = 116
integer width = 1134
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 22282239
string text = "Ingreso Caja <<  Fuera de Plazo  >>"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_fuera_plazo.visible								= false
end event

type sle_1 from uo_convierte_numero within w_forma_pago2
boolean visible = false
integer x = 2551
integer y = 2236
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type dw_factura from datawindow within w_forma_pago2
boolean visible = false
integer x = 1701
integer y = 2276
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_factura_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_boleta from datawindow within w_forma_pago2
boolean visible = false
integer x = 942
integer y = 2276
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_boleta_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_abono_ini from statictext within w_forma_pago2
integer x = 795
integer y = 188
integer width = 1193
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 81324524
string text = "Abono Utilizado $ "
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_abono from datawindow within w_forma_pago2
boolean visible = false
integer x = 279
integer y = 2260
integer width = 571
integer height = 600
string title = "none"
string dataobject = "dw_suma_total_abono_ocupado_pago"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_cupones from datawindow within w_forma_pago2
boolean visible = false
integer x = 3392
integer y = 1904
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_print_cupones_pagados_vertical_menor4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_saldo from editmask within w_forma_pago2
integer x = 2560
integer y = 316
integer width = 594
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean border = false
alignment alignment = right!
boolean displayonly = true
string mask = "##,###,##0"
end type

type st_19 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2139
integer y = 320
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Saldo :"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type pb_limpiar from picturebutton within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2656
integer y = 1964
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
string picturename = "trash.bmp"
string disabledname = "trash_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;//Setnull(il_nro_folio_aux);Setnull(is_tipo_cob_aux)
if dw_abono.retrieve(gl_folio,gs_tipo_cobro) > 0 then
	il_abono				= dw_abono.getitemnumber(1,'c_sum_abono')
	if isnull(il_abono) then il_abono=0
	st_saldo.text		= string(il_abono,'###,###,###,###,##0')
	st_abono_ini.text	= "Abono Utilizado $ "+string(il_abono,'###,###,###,###,##0')
else
	il_abono				= 0
	st_saldo.text		= string(il_abono,'###,###,###,###,##0')
	st_abono_ini.text	= ""
end if
tab_1.tabpage_credito.rb_empresa_1.checked							= false
tab_1.tabpage_credito.rb_empresa_2.checked							= false
tab_1.tabpage_debito.rb_empresa_3.checked							= false
tab_1.tabpage_debito.rb_empresa_4.checked							= false
cbx_efectivo.checked															= false
sle_efectivo.enabled															= false
cbx_cheque.checked															= false
st_insertar_cheque.enabled													= false
st_eliminar_cheque.enabled 												= false
st_correlativo_cheque.enabled 												= false
tab_1.tabpage_cheque.em_cantidad_1.enabled 						= false
tab_1.tabpage_cheque.dw_detalle_pago_1.enabled 					= false
cbx_tarjeta_credito.checked													= false
//cbx_tarjeta_credito.enabled												= false
st_insertar_tar_cred.enabled												= false
st_eliminar_tarjeta_cred.enabled 											= false
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled 		= false                       
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.enabled 	= false
cbx_tarjeta_debito.checked													= false
//cbx_tarjeta_debito.enabled 												= false
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.enabled	= false
st_total.text 																		= string(gd_total, "###,###,###,###,###")
em_saldo.text 																	= string(gd_total - il_abono, "###,###,###,###,###")
//st_saldo.text																	= '0'
sle_efectivo.text																= '0'
tab_1.tabpage_cheque.enabled												= false
tab_1.tabpage_cheque.em_cantidad_1.enabled						= false
tab_1.tabpage_credito.enabled												= false
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled			= false
tab_1.tabpage_debito.enabled												= false
tab_1.tabpage_cheque.dw_empresa_1.enabled						= false
tab_1.tabpage_cheque.dw_empresa_2.enabled						= false
tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
dw_multiproducto.reset()
tab_1.tabpage_cheque.em_dias_cheque.text							= ''
tab_1.tabpage_cheque.em_cantidad_1.text								= ''
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text				= ''
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.reset()
sle_paga_con.text																= ''
sle_vuelto.text																	= ''
tab_1.SelectedTab																= 1
tab_1.tabpage_cheque.dw_empresa_1.reset()
tab_1.tabpage_cheque.dw_empresa_2.reset()

tab_1.tabpage_cheque.dw_empresa_1.insertrow(0)
tab_1.tabpage_cheque.dw_empresa_2.insertrow(0)
il_monto_total 																	= il_monto_total_aux //long(st_total.text)
//il_monto_total_aux															= long(st_total.text)

end event

type st_fecha_pago from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1728
integer y = 32
integer width = 357
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_8 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1426
integer y = 44
integer width = 297
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Fecha Pago:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_rezago from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1243
integer y = 32
integer width = 165
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_7 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1024
integer y = 44
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Rezago:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_folio from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 640
integer y = 32
integer width = 357
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_tipo_cobro from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 297
integer y = 32
integer width = 165
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_2 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 44
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Tipo Cobro"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_1 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 503
integer y = 44
integer width = 133
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Folio:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_correlativo_tarcred from statictext within w_forma_pago2
boolean visible = false
integer x = 2729
integer y = 1300
integer width = 485
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Numerar Registros"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long 		ll_banco, ll_n_cheque,i,ll_monto,ll_tot_reg,ll_cod_tarjeta,ll_tipo_tarjeta,&
			ll_cantidad,ll_total,ll_monto_cuota,ll_saldo,ll_efectivo,ll_val_real,ll_valor_final
string 	ls_n_cheque,ls_autoriza

tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.AcceptText()
ll_tot_reg	= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.RowCount()
ll_cantidad	= long(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text)
IF ll_tot_reg > 1 THEN
	ll_banco 			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1, "cod_banco")
	ll_total				= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1, "monto")
	ll_cod_tarjeta		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1, 'cod_tarjeta_credito')
	ll_tipo_tarjeta	= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1, 'tipo_tarjeta_credito')
	ls_autoriza			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemString(1, 'cod_autorizacion_credito')
	il_valor_credito	= ll_total
	ll_monto_cuota 	= truncate(ll_total / ll_cantidad, 0)
	ll_val_real			= ll_monto_cuota * ll_cantidad
	ll_valor_final		= ll_total - ll_val_real
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"monto", ll_monto_cuota)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"cod_banco",ll_banco)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"nro_cuotas_credito", 1)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"cod_tarjeta_credito",ll_cod_tarjeta)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"tipo_tarjeta_credito",ll_tipo_tarjeta)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(1,"cod_autorizacion_credito",ls_autoriza)
	FOR i = 2 TO ll_tot_reg
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"cod_banco",ll_banco)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"nro_cuotas_credito", i)
		if ll_valor_final>0 and i=ll_tot_reg then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"monto",ll_monto_cuota + ll_valor_final)
		else
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"monto",ll_monto_cuota)
		end if
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"cod_tarjeta_credito",ll_cod_tarjeta)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"tipo_tarjeta_credito",ll_tipo_tarjeta)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(i,"cod_autorizacion_credito",ls_autoriza)
	NEXT
END IF
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.AcceptText()
wf_recalcular_valores()
end event

type pb_salir from picturebutton within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2994
integer y = 1968
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;Close(w_forma_pago2)
end event

type pb_grabar from picturebutton within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2318
integer y = 1968
integer width = 155
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;double		ll_monto_ef,ldb_monto_uf,ll_max_cupon,ll_ok_boleta,ll_neto_def,ll_exento_def
datetime 	ld_hoy, ld_vencimiento,ldt_fecha_pago,ldt_fecha_prim,ldt_fecha_venc_min_e,ldt_fecha_venc,ldt_fecha_prox_pago_mant,ldt_fec_prox_venc_mant,&
				ldt_fec_prox_venc_cred,ldt_fec_vcto_mant,ldt_fec_venc,ldt_fec_vcto_cred
Date			ld_fecha,ld_fecha_venc,ld_fecha_hoy
long 			ll_monto, ll_n_cheque, ll_cant_cheques, ll_cod_banco, ll_n_cuotas, ll_n_cuotas_pag,ll_n_cupon, ll_rut, ll_cta_pag_s, ll_total_pagado,job,ll_res_ajuste,&
				ll_tot_reg,ll_indi,Net, ret,	ll_sw_cheques=0,ll_nro_cuota,ll_cod_tarjeta,ll_tipo_tarjeta,ll_rut_all_exentoux,ll_pasa_vali=0,ll_folio,ll_paga_con,ll_largo,ll_digito,&
				ll_vuelto,ll_monto_pagado,ll_reg,ll_tot_filas,	ll_can_cta_cred,ll_reg_cred,ll_ctas_pag,dia,mes,ano,ll_cta_pag_m,ll_count_reg,ll_num_cupon_reg,&
				ll_pasa_cupon=0,ll_nro_cuponera,ll_count_vig,ll_nro_cuotas_cred,ll_nro_cuotas_mant,ll_monto_cred,ll_monto_mant,ll_estado_reg,ll_monto_cred_int,&
				ll_monto_cred_gc,ll_monto_mant_gc,ll_monto_mant_int,ll_n_cupon_cred,ll_n_cupon_mant,ll_monto_mora,ll_monto_gasto,ll_sum_cuotas_cred,&
				ll_sum_monto_cred,ll_sum_cuotas_mant,ll_sum_monto_mant,ll_can_cta_mant,ll_reg_mant,ll_monto_cta,ll_monto_int,ll_monto_gc,ll_tot_fila_cupon,&
				ll_fila_cupon,ll_cant_reg,ll_count_bol,ll_cod_parque,ll_cod_parque_aux,ll_fila,ll_cta_pag_cred,ll_plazo_cred,ll_total_cupon,ll_cant_mant,ll_cant_cred,&
				ll_calc_cuotas,ll_grupo,ll_min_boleta,ll_count_existe,ll_mes_mant,ll_day_mant,ll_anno_mant,ll_estado_mora_mant,ll_year_mant,ll_sum_ef,ll_sum_ch,&
				ll_count_ch,ll_sum_tc,ll_count_tc,ll_sum_td,ll_total,ll_neto,ll_exento,ll_iva,ls_res,ll_cod_beneficio, ll_cod_benef_detalle,ll_cod_parque_rez,&
				ll_ctas_pagadas,ll_reg_prox,ll_tot_reg_dw,ll_cant,ll_cuponera,ll_ctas_pag_m,ll_codigo_parque,ll_fila_f,ll_fila_d,ll_monto_f,ll_fila_dscto,ll_dscto_f,ll_fila_iva,&
				ll_fila_l,ll_fila_4,ll_fila_6,ll_monto_4,ll_monto_6,ll_fila_ea,ll_fila_ajuste_dif,ll_ajuste_dif_f,ll_count_reg_folio,ll_res,ll_plazo,ll_cod_parque_ctto,&
				ll_count_serv,ll_tot_reg_mp,ll_indi_mp,ll_cuotas_h,ll_folio_be
string 		ls_tipo_pago, ls_doc,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_ciudad,ls_comuna,ls_fono,ls_cuota,ls_cuota_mant,ls_paga_con,ls_string_mant,&
				ls_base,ls_serie,ls_autoriza,ls_tipo_cobro,ls_tipo_mov,ls_tipo_mov_reg,ls_nulo,ls_pasa,ls_tcp_ip,ls_fono_p,ls_fono_c,ls_fono_pc,ls_fono_cc,ls_fono_pa,&
				ls_fono_ca,ls_tipo_mov_p,ls_rut_empresa,ls_tip_cob,ls_nom,ls_moneda,ls_cliente_sap,ls_total,ls_digito,ls_pasa_ajuste,ls_tipo_mant,ls_base_rez,&
				ls_serie_rez,ls_valida_ef,ls_fecha_pago_palabra,ls_monto_total_palabra,ls_nro_contrato,ls_vuelto,ls_pago_ef,ls_pago_ch,ls_pago_tc,ls_pago_td,ls_ok_boleta,&
				email_de,ls_email_para,ls_asunto,ls_texto,ls_pada_benef,ls_mov_prox,ls_string_e,ls_string_f,ls_string_a,ls_string_l,ls_string_m,ls_tipo_movi,ls_cod_otro,&
				ls_no_pasa_ba,ls_ok_print,ls_base_rezago,ls_nom_caj,ls_tipo_mov_h,ls_ctto_h,ls_base_h,ls_serie_h,ls_cod_pago,lsURL,ls_XRL
Double		ll_numero,ll_suma_total,ll_numero_rez,ll_numero_h,ll_monto_h
String			ls_tot_pag_pal,ls_razon_social,ls_nombre_rez,ls_ap_paterno_rez,ls_ap_materno_rez,ls_direccion_part_rez,ls_comuna_part_rez,ls_ciudad_part_rez,&
				ls_telefono_rez,ls_dv_rez,ls_moneda_rez,ls_tipo_cob_cu
				
Boolean		lb_generado

DataWindowChild dwch_encabezado, dwch_detalle_ci, dwch_doc_cob
SetPointer ( Cross! )
Setnull(ls_nulo)
ls_no_pasa_ba		= 'S'
ls_valida_ef			= 'S'
ls_pasa_ajuste		= 'S'
ls_ok_print			= 'N'
ls_tipo_cob_cu		= 'CU'
if w_ingreso2.tab_ingreso.SelectedTab = 2 then
	if cbx_efectivo.checked = False and w_ingreso2.tab_ingreso.tp_ci.cbx_paga_ef.checked = true then
		messagebox("Advertencia","Para realizar AJUSTE MONEDA, debe Seleccionar Pago con EFECTIVO")
		ls_valida_ef	= 'N'
	end if
elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
	if cbx_efectivo.checked = False and w_ingreso2.tab_ingreso.tp_be.cbx_paga_ef_be.checked = true then
		messagebox("Advertencia","Para realizar AJUSTE MONEDA, debe Seleccionar Pago con EFECTIVO")
		ls_valida_ef	= 'N'
	end if
end if
if ls_valida_ef = 'S' then
	ls_pasa			= 'S'
	SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
	fechasys			= datetime(date(idt_fecha_hoy),time('00:00:00'))
	ldt_fecha_pago	= datetime(date(idt_fecha_hoy),time('00:00:00'))
	gs_tipo_cobro	= trim(st_tipo_cobro.text)
//	if gs_base='M' then
//		ls_cod_pago		= 'CX'
//	else
		ls_cod_pago		= gs_tipo_cobro
//	end if
	//if gd_uf_dia=0 or isnull(gd_uf_dia) then
		ld_fecha 		= Date(st_fecha_pago.text)
		SELECT 	"TAB_UF"."VALOR_UF"  
		INTO 		:gd_uf_dia
		FROM 	"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha
		using		sqlca;
		if sqlca.sqlcode=0 then
			gd_uf		= gd_uf_dia
		else
			messagebox("Advertencia","Valor U.F. del día "+string(ld_fecha,"dd/mm/yyyy")+' No está Registrada')
			ls_pasa	= 'N'
		end if
	//end if
	if ls_pasa='S' then
		if isvalid(w_ingreso2) then
			if wf_valida_todo()='S' then
				if cbx_efectivo.checked=false and cbx_tarjeta_credito.checked=false and &
					cbx_cheque.checked=false and cbx_tarjeta_debito.checked=false and &
					cbx_credito.checked=false then
					messagebox("Advertencia","Debe Seleccionar Opción de Pago")
					cbx_efectivo.setfocus()
				else
					ll_monto_ef 						= long(sle_efectivo.text)
					if cbx_efectivo.checked=true and ll_monto_ef=0 then
						messagebox("Advertencia","Tiene Seleccionado Pago con Efectivo, debe ingresar Monto")
						sle_efectivo.setfocus()
						ll_pasa_vali ++
						sle_paga_con.text			= ''
						sle_vuelto.text				= ''
					elseif cbx_credito.checked=true and ll_monto_ef=0 then
						messagebox("Advertencia","Tiene Seleccionado Pago con Credito, debe ingresar Monto")
						sle_efectivo.setfocus()
						ll_pasa_vali ++
						sle_paga_con.text			= ''
						sle_vuelto.text				= ''
					elseif cbx_efectivo.checked=true and ll_monto_ef>0 then
						ll_paga_con					= long(sle_paga_con.text)
						ll_vuelto						= long(sle_vuelto.text)
						if ll_paga_con <= 0 or isnull(ll_paga_con) then
							messagebox("Advertencia","Tiene Seleccionado Pago con Efectivo, debe ingresar Paga Con")
							sle_paga_con.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						elseif ll_paga_con < ll_monto_ef then
							messagebox("Advertencia","Tiene Seleccionado Pago con Efectivo, debe ingresar Paga Con Mayor al Monto Efectivo")
							sle_paga_con.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						elseif ll_vuelto < 0 or isnull(ll_vuelto) then
							messagebox("Advertencia","Tiene Seleccionado Pago con Efectivo, debe ingresar Vuelto")
							sle_vuelto.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						end if
					elseif cbx_credito.checked=true and ll_monto_ef>0 then
						ll_paga_con					= long(sle_paga_con.text)
						ll_vuelto						= long(sle_vuelto.text)
						if ll_paga_con <= 0 or isnull(ll_paga_con) then
							messagebox("Advertencia","Tiene Seleccionado Pago con Crédito, debe ingresar Paga Con")
							sle_paga_con.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						elseif ll_paga_con < ll_monto_ef then
							messagebox("Advertencia","Tiene Seleccionado Pago con Crédito, debe ingresar Paga Con Mayor al Monto Efectivo")
							sle_paga_con.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						elseif ll_vuelto < 0 or isnull(ll_vuelto) then
							messagebox("Advertencia","Tiene Seleccionado Pago con Crédito, debe ingresar Vuelto")
							sle_vuelto.setfocus()
							ll_pasa_vali ++
							sle_paga_con.text		= ''
							sle_vuelto.text			= ''
						end if
					elseif cbx_cheque.checked=true and tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()=0 then
						messagebox("Advertencia","Tiene Seleccionado Pago con Cheque, debe ingresar Detalle")
						tab_1.SelectedTab			= 1
						tab_1.tabpage_cheque.em_cantidad_1.setfocus()
						ll_pasa_vali ++
					elseif cbx_tarjeta_credito.checked=true and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()=0 then
						messagebox("Advertencia","Tiene Seleccionado Pago con Tarjeta Crédito, debe ingresar Detalle")
						tab_1.SelectedTab			= 2
						tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
						ll_pasa_vali ++
					elseif cbx_cheque.checked=true and tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 then
						ll_tot_reg					= tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ld_fecha_venc		= date(tab_1.tabpage_cheque.dw_detalle_pago_1.getitemdatetime(ll_indi,'fecha_venc'))
								if ld_fecha_venc < idt_fecha_hoy then
									messagebox("Advertencia","Error Fecha Vencimiento Pago con Cheque Invádida Fila "+string(ll_indi)+", Debe ser Mayor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
									tab_1.SelectedTab	= 1
									tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
									tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(ll_indi)
									tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('fecha_venc')
									ll_pasa_vali ++
									exit
								end if
							next
						end if
					elseif cbx_tarjeta_credito.checked=true and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
						ll_tot_reg					= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ld_fecha_venc		= date(tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.getitemdatetime(ll_indi,'fecha_venc'))
								if ld_fecha_venc < idt_fecha_hoy then
									messagebox("Advertencia","Error Fecha Vencimiento Pago con Tarjeta Crédito Invádida Fila "+string(ll_indi)+", Debe ser Mayor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
									tab_1.SelectedTab				= 2
									tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
									tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(ll_indi)
									tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('fecha_venc')
									ll_pasa_vali ++
									exit
								end if
							next
						end if	
					elseif cbx_tarjeta_debito.checked = true and tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.rowcount()>0 then
						if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.getitemnumber(1,'monto')=0 then
							messagebox("Advertencia","Tiene Seleccionado Pago con Tarjeta Dédito, debe ingresar Detalle")
							tab_1.SelectedTab			= 3
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
							tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_tarjeta_debito')
							ll_pasa_vali ++
						else
							ld_fecha_venc				= date(tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.getitemdatetime(1,'fecha_venc'))
							if ld_fecha_venc < idt_fecha_hoy then
								messagebox("Advertencia","Error Fecha Vencimiento Pago con Tarjeta Crédito Invádida Fila 1, Debe ser Mayor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
								tab_1.SelectedTab		= 3
								tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
								tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(1)
								tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('fecha_venc')
								ll_pasa_vali ++
							end if
						end if
					end if
					if ll_pasa_vali=0 then
						ld_hoy 							= datetime(String(idt_fecha_hoy, "dd/mm/yyyy 00:00:00"))
						gd_hoy 							= datetime(String(idt_fecha_hoy, "dd/mm/yyyy 00:00:00"))
						ll_monto_ef 						= long(sle_efectivo.text)
						ll_paga_con						= long(sle_paga_con.text)
						ll_vuelto							= long(sle_vuelto.text)
						
						ls_total							= string(ll_monto_ef)
						ll_largo							= len(ls_total)
						ls_digito							= mid(ls_total,ll_largo ,1)
						ll_digito							= long(ls_digito)
						if ll_digito > 0 then
							ll_res_ajuste				= messagebox("Advertencia","No se Aplicó Ajuste Sencillo, desea Continuar la Grabación",Exclamation!,YesNo!,2)
							if ll_res_ajuste=2 then
								ls_pasa_ajuste			= 'N'
								pb_salir.triggerevent(clicked!)
							end if
						end if
						if ls_pasa_ajuste = 'S' then
							IF gs_rezago <> "S" THEN
								ll_rut 						= gi_rut	
								SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
								INTO   	:ll_cant_mant,                              						:ll_cant_cred
								FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
								WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
										( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
										(("CADENA"."CODIGO" = :gs_base ) AND  
										( "CADENA"."SERIE" = :gs_serie ) AND  
										( "CADENA"."NUMERO" = :gi_numero ) )   ;
		
		//						gi_rut 						= ll_rut
							END IF
							Net 								= 1
							if ls_cod_pago <> 'CI' and ls_cod_pago <> 'CX' then
//								Net 							= MessageBox("Actualizar Pago", "Desea Actualizar Documento " + gs_tipo_cobro, Exclamation!, YesNo!, 2)
								MessageBox("Actualizar Pago", "Se Actualizará Documento " + ls_cod_pago)	//, Exclamation!, YesNo!, 2)
							else
//								Net 							= MessageBox("Actualizar Pago", "Desea Actualizar Documento " + gs_tipo_cobro+'-'+string(gl_folio), Exclamation!, YesNo!, 2)
								MessageBox("Actualizar Pago", "Se Actualizará Documento " + ls_cod_pago+'-'+string(gl_folio))	//, Exclamation!, YesNo!, 2)
							end if
							IF Net = 1 THEN 
								pb_grabar.enabled		= false
								// scrip valida folio interno 15/11/2022 MM
								if il_max_folio_new = 0 and gl_folio=0 then
									ll_tot_reg_dw			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
									if ll_tot_reg_dw > 0 then
										ls_string_e			= "tipo_cob = 'E' or tipo_cob='U' or tipo_cob='K'"
										il_count_e			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find(ls_string_e, 1, ll_tot_reg_dw)
										ls_string_f			= "tipo_cob = 'F'"
										il_count_f			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find(ls_string_f, 1, ll_tot_reg_dw)
										ls_string_a			= "tipo_cob = 'A' or tipo_cob='Q'"
										il_count_a			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find(ls_string_a, 1, ll_tot_reg_dw)
										ls_string_l			= "tipo_cob = 'L'"
										il_count_l			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find(ls_string_l, 1, ll_tot_reg_dw)
										ls_string_m			= "tipo_cob = 'M'"
										il_count_m			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find(ls_string_m, 1, ll_tot_reg_dw)
										if il_count_e > 0 then
											ls_tipo_movi		= 'E'
											ll_monto_cta	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'subtotal')
											ll_monto_mora	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'mora_cred')
											ll_monto_gasto	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'gasto_cred')
											ll_cant			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(il_count_e,'cantidad' )
										elseif il_count_f > 0 then
											ls_tipo_movi		= 'F'
											ll_monto_cta	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'subtotal')
											ll_monto_mora	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'mora_mant')
											ll_monto_gasto	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'gasto_mant')
											ll_cant			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(il_count_f,'cantidad' )
											if gs_rezago <> 'S' then
												if gs_base='O' or gs_base='U' or gs_base='M' then
													ll_ctas_pag_m	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber( 1, 'oferta_v_cta_pag_m')
												elseif gs_base='C' then
													ll_ctas_pag_m	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber( 1, 'contrato_cta_pag_m')
												end if
											else
												ll_ctas_pag_m		= 0
											end if
											ll_cant			= ll_cant + ll_ctas_pag_m
										elseif il_count_a > 0 then
											ls_tipo_movi		= 'A'
											ll_monto_cta	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'subtotal')
											ll_cant			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(il_count_a,'cantidad' )
										elseif il_count_m > 0 then
											ls_tipo_movi		= 'M'
											ll_monto_cta	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'subtotal')
											ll_cant			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(il_count_m,'cantidad' )
										elseif il_count_l > 0 then
											ls_tipo_movi		= 'L'
											ll_monto_cta	= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber( 1, 'subtotal')
											ll_cant			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(il_count_l,'cantidad' )
										end if
										if gs_rezago <> 'S' and (ls_tipo_movi='E' or ls_tipo_movi='F') then
											SELECT 	MIN("CUPONERAS_DETALLE"."NRO_CUPON" ) ,		"CUPONERAS_DETALLE"."NRO_CUPONERA"
											INTO 		:il_max_folio_new ,										:ll_cuponera
											FROM 	"CUPONERAS",  	"CUPONERAS_DETALLE"  
											WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
														( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
														( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
														( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
														( ( "CUPONERAS"."BASE" = :gs_base ) AND  
														( "CUPONERAS"."SERIE" = :gs_serie ) AND  
														( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
														( "CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  
														  "CUPONERAS"."ESTADO_CUPONERA" = 'C' ) AND  
														  "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' AND  
														  "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_movi )  
											GROUP BY "CUPONERAS_DETALLE"."NRO_CUPONERA";
											if il_count_e > 0 or il_count_f > 0 then
												if il_max_folio_new = 0 or isnull(il_max_folio_new) then
													if ls_tipo_movi = 'E' then
														messagebox("Advertencia","No Registra Folio Cupon Asociado al Pago, solicitar Generar Cupón de Crédito")
													elseif ls_tipo_movi = 'F' then
														
														SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPONERA")
														INTO 		:ll_cuponera
														FROM 	"CUPONERAS",  	"CUPONERAS_DETALLE"  
														WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
																	( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
																	( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
																	( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
																	( ( "CUPONERAS"."BASE" = :gs_base ) AND  
																	( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																	( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
																	( "CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  
																	  "CUPONERAS"."ESTADO_CUPONERA" = 'C' )  )  
														GROUP BY "CUPONERAS_DETALLE"."NRO_CUPONERA" ;
														
														
														SELECT 	"CADENA_MORA"."FECHA_VENC_CRED",   	"CADENA_MORA"."FECHA_VENC_MANT"  
														INTO 		:ldt_fec_vcto_cred,   								:ldt_fec_vcto_mant  
														FROM 	"CADENA_MORA"  
														WHERE ( "CADENA_MORA"."BASE" = :gs_base ) AND ( "CADENA_MORA"."SERIE" = :gs_serie ) AND ( "CADENA_MORA"."NUMERO" = :gi_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															if il_count_e > 0 then
																ldt_fec_venc		= ldt_fec_vcto_cred
															elseif il_count_f > 0 then
																ldt_fec_venc		= ldt_fec_vcto_mant
															else
																ldt_fec_venc		= gd_hoy
															end if
															
															SELECT 	max("CUPONERAS_DETALLE"."NRO_CUPON")  
															INTO 		:ll_max_cupon  
															FROM 	"CUPONERAS_DETALLE"  ;
															if isnull(ll_max_cupon) then ll_max_cupon=0
															
															
															ll_max_cupon		= ll_max_cupon + 1 
															il_max_folio_new	= ll_max_cupon
															
															INSERT INTO "CUPONERAS_DETALLE"  
																		( "BASE",  	"SERIE",   	"NUMERO",   	"NRO_CUPON",   		"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
															VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:il_max_folio_new,   	:gi_rut,	:ll_cant,   			:ldt_fec_venc,		'V',   								:ls_tipo_movi,   null,   					null,   				null,   				:ll_monto_cta,   						:ll_monto_cta,   				:ll_monto_mora,   					:ll_monto_gasto,   					:ll_cuponera,   			:ls_dv,   0 ,						1 )  
															USING	sqlca;
//															if sqlca.sqlcode=0 then
//																commit;
//															else
//																rollback;
//															end if
														end if
													end if
												end if
											else
												
												SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPONERA")
												INTO 		:ll_cuponera
												FROM 	"CUPONERAS",  	"CUPONERAS_DETALLE"  
												WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
															( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
															( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
															( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
															( ( "CUPONERAS"."BASE" = :gs_base ) AND  
															( "CUPONERAS"."SERIE" = :gs_serie ) AND  
															( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
															( "CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  
															  "CUPONERAS"."ESTADO_CUPONERA" = 'C' )  )  
												GROUP BY "CUPONERAS_DETALLE"."NRO_CUPONERA" ;
												
												SELECT 	"CADENA_MORA"."FECHA_VENC_CRED",   	"CADENA_MORA"."FECHA_VENC_MANT"  
												INTO 		:ldt_fec_vcto_cred,   								:ldt_fec_vcto_mant  
												FROM 	"CADENA_MORA"  
												WHERE ( "CADENA_MORA"."BASE" = :gs_base ) AND ( "CADENA_MORA"."SERIE" = :gs_serie ) AND ( "CADENA_MORA"."NUMERO" = :gi_numero )   
												USING	sqlca;
												if sqlca.sqlcode=0 then
													if il_count_e > 0 then
														ldt_fec_venc		= ldt_fec_vcto_cred
													elseif il_count_f > 0 then
														ldt_fec_venc		= ldt_fec_vcto_mant
													else
														ldt_fec_venc		= gd_hoy
													end if
													SELECT 	max("CUPONERAS_DETALLE"."NRO_CUPON")  
													INTO 		:ll_max_cupon  
													FROM 	"CUPONERAS_DETALLE"  ;
													
													ll_max_cupon		= ll_max_cupon + 1 
													il_max_folio_new	= ll_max_cupon
													
													INSERT INTO "CUPONERAS_DETALLE"  
																( "BASE",  	"SERIE",   	"NUMERO",   	"NRO_CUPON",   		"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
													VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:il_max_folio_new,   	:gi_rut,	:ll_cant,   			:ldt_fec_venc,		'V',   								:ls_tipo_movi,   null,   					null,   				null,   				:ll_monto_cta,   						:ll_monto_cta,   				:ll_monto_mora,   					:ll_monto_gasto,   					:ll_cuponera,   			:ls_dv,   0 ,						1 )  
													USING	sqlca;
												end if

											end if
										else // il_count_a > 0 or il_count_l > 0 or il_count_m > 0 then
											select id_cuponeras_web.nextval into :il_max_folio_new from dual;
//											
											
											ls_base_rezago			= gs_base
											if isnull(ls_base_rezago) or ls_base_rezago='' then ls_base_rezago='O'
											INSERT INTO "CUPONERAS_DETALLE_WEB"  
														( "BASE",  			"SERIE",   	"NUMERO",   	"NRO_CUPON",   		"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   		"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA")  
											VALUES 	( :ls_base_rezago,	:gs_serie,   :gi_numero,   	:il_max_folio_new,   	:gi_rut,  	1,   					:gd_hoy,   			'C',   								:ls_tipo_movi,	:gs_tipo_cob,   			:il_max_folio_new,   	:gd_hoy,  			:ll_monto_cta,   						:ll_total_pagado,   			:ll_monto_mora,   					:ll_monto_gasto,   					1,   						:gs_dv,   :gs_moneda,   			'0',   										'0',   					:gs_user) 
											USING	sqlca;
										end if
									end if
								end if
								if ls_cod_pago <> 'CI' and ls_cod_pago <> 'CX' and il_max_folio_new > 0 then
									SELECT	Count("INGRESO_NEWSING_CABECERA"."TIPO_COB")  
									INTO 		:ll_count_reg_folio  
									FROM 	"INGRESO_NEWSING_CABECERA"  
									WHERE 	(( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = 'CU' )) AND  
												( "INGRESO_NEWSING_CABECERA"."FOLIO" = :il_max_folio_new ) AND  
												( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :gd_hoy )   ;
									if ll_count_reg_folio > 0 then

										DELETE FROM "INGRESO_NEWSING_CABECERA"  
										WHERE 	(( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = 'CU' )) AND  
													( "INGRESO_NEWSING_CABECERA"."FOLIO" = :il_max_folio_new ) AND  
													( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :gd_hoy )   
										USING	sqlca;
//										if sqlca.sqlcode=0 then
//											commit;
//										else
//											rollback;
//										end if
										
										DELETE FROM "INGRESO_NEWSING"  
										WHERE 	(( "INGRESO_NEWSING"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING"."TIPO_COB" = 'CU' )) AND  
													( "INGRESO_NEWSING"."FOLIO" = :il_max_folio_new ) AND  
													( "INGRESO_NEWSING"."FECHA_PAGO" = :gd_hoy )   
										USING	sqlca;
										
										DELETE FROM "DOCUMENTOS_NEWSING"  
										WHERE 	(( "DOCUMENTOS_NEWSING"."TIPO_COB" = :ls_cod_pago ) OR ( "DOCUMENTOS_NEWSING"."TIPO_COB" = 'CU' )) AND  
													( "DOCUMENTOS_NEWSING"."FOLIO" = :il_max_folio_new ) AND  
													( "DOCUMENTOS_NEWSING"."FECHA_PAGO" = :gd_hoy )   
										USING	sqlca;
									end if
								end if
								// Fin scrip valida folio interno 15/11/2022 MM
								ls_fecha_pago_palabra		= f_retorna_fecha_palabra(date(gd_hoy))
								ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(st_total.text)))
								ls_nro_contrato					= gs_base+gs_serie+string(gi_numero)
								ls_paga_con						= sle_paga_con.text
								ls_vuelto							= sle_vuelto.text
								ll_sum_ef						= long(sle_efectivo.text)
								if tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount() > 0 then
									ll_sum_ch					= tab_1.tabpage_cheque.dw_detalle_pago_1.getitemnumber(1,'c_total')
									ll_count_ch					= long(tab_1.tabpage_cheque.em_cantidad_1.text)
								end if
								if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount() > 0 then
									ll_sum_tc					= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.getitemnumber(1,'c_total')
									ll_count_tc					= long(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text)
								end if
								if tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.rowcount() > 0 then
									ll_sum_td					= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.getitemnumber(1,'c_total')
								end if
								if isnull(ll_sum_ef) 	then ll_sum_ef=0
								if isnull(ll_sum_ch) 	then ll_sum_ch=0
								if isnull(ll_count_ch) 	then ll_count_ch=0
								if isnull(ll_sum_tc) 	then ll_sum_tc=0
								if isnull(ll_count_tc) 	then ll_count_tc=0
								if isnull(ll_sum_td) 	then ll_sum_td=0
								if ll_sum_ef > 0 then
									ls_pago_ef								= string(ll_sum_ef,'###,###,###,###,##0')
								end if
								if ll_sum_ch > 0 then
									ls_pago_ch								= string(ll_sum_ch,'###,###,###,###,##0')+' ('+string(ll_count_ch,'###,##0')+')'
								end if
								if ll_sum_tc > 0 then
									ls_pago_tc								= string(ll_sum_tc,'###,###,###,###,##0')+' ('+string(ll_count_tc,'###,##0')+')'
								end if
								if ll_sum_td > 0 then
									ls_pago_td								= string(ll_sum_td,'###,###,###,###,##0')
								end if
								
								ll_tot_filas									= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
								if ll_tot_filas > 0 then
									ll_reg_prox								= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'F' or tipo_cob ='E'", 1, ll_tot_filas)
									if ll_reg_prox > 0 then
										ls_mov_prox						= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_reg_prox,'tipo_cob')
										ll_ctas_pagadas					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_reg_prox,'cantidad')
										if ls_mov_prox='F' or ls_mov_prox='E' then
											if ls_mov_prox='E' then
												ll_can_cta_cred				= f_retorna_ctas_pag_sap(gs_base, gs_serie, gi_numero,ls_mov_prox,gs_rezago)
											elseif ls_mov_prox='F' then
												ll_can_cta_mant			= f_retorna_ctas_pag_m(gs_base, gs_serie, gi_numero)
											end if
											
											is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ll_ctas_pagadas,ls_mov_prox )
										end if
									end if
								end if
								
								if ls_cod_pago='BA' or ls_cod_pago='FA' then
									if gl_valor_iva > 0 then
										ll_fila_ajuste_dif				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'S' and (tipo_cob_otro='3' or tipo_cob_otro='72') ", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
										if ll_fila_ajuste_dif > 0 then
											ll_ajuste_dif_f				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_ajuste_dif,'c_total_linea')
											if ll_ajuste_dif_f < 0 then ll_ajuste_dif_f=0
										end if
										ll_total							= long(st_total.text)
										ll_neto							= round(ll_total - gl_valor_iva ,0)
										ll_iva								= round(gl_valor_iva,0)
										ll_exento							= 0
										ll_total							= ll_neto + ll_iva
										if isvalid(w_ingreso2) then
											ll_fila_f 						= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'F'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
											if ll_fila_f > 0 then
												ll_fila_d 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'D'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
												if ll_fila_d = 0 then
													ll_monto_f			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_f,'c_total_linea')
													ll_fila_dscto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'S' and tipo_cob_otro='132'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
													ll_exento				= gl_iva_exento_f		//ll_monto_f 
													ll_neto				= round((ll_total - gl_valor_iva) - ll_exento  ,0)
													if ll_fila_dscto > 0 then
														ll_dscto_f		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_dscto,'c_total_linea')
														ll_exento			= gl_iva_exento_f	+ ll_dscto_f	//ll_monto_f + ll_dscto_f
														ll_neto			= round((ll_total - gl_valor_iva) - ll_exento  ,0)
														if ll_neto < 0 then
															ll_exento		= ll_exento + ll_neto
															ll_neto		= 0
														end if
													end if
													if ll_ajuste_dif_f > 0 then
														ll_exento			= ll_exento + ll_ajuste_dif_f
														ll_neto			= ll_neto - ll_ajuste_dif_f
													end if
												else
													if gl_iva_exento_f > 0 then
														ll_fila_dscto		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'S' and tipo_cob_otro='132'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
														if ll_fila_dscto > 0 then
															ll_dscto_f			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_dscto,'c_total_linea')
//															gl_iva_exento_f		= gl_iva_exento_f + ll_dscto_f
														end if
														ll_total			= long(st_total.text)
														ll_neto			= round(ll_total - (gl_valor_iva + gl_iva_exento_f),0)
														ll_iva				= round(gl_valor_iva,0)
														ll_exento			= gl_iva_exento_f
//														ll_total			= ll_neto + ll_iva + ll_exento
														if ll_ajuste_dif_f > 0 then
															ll_exento			= ll_exento + ll_ajuste_dif_f
															ll_neto			= ll_neto - ll_ajuste_dif_f
														end if
													end if
												end if
											end if
											ll_fila_f 						= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'E'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
											if ll_fila_f > 0 then
												ll_fila_4 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = '4'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
												ll_fila_6 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = '6'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
												ll_fila_d 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'D'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
												if ll_fila_d = 0 then
													ll_monto_f			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_f,'c_total_linea')
													ll_fila_dscto			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'S' and tipo_cob_otro='131'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
													if ll_fila_4 > 0 then
														ll_monto_4		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_4,'c_total_linea')
													end if
													if ll_fila_6 > 0 then
														ll_monto_6		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_6,'c_total_linea')
													end if
													if isnull(ll_monto_4) then ll_monto_4=0
													if isnull(ll_monto_6) then ll_monto_6=0

													ll_neto				= round(gl_valor_iva / (idb_iva - 1),0)
													ll_exento				= ll_total - (ll_neto + gl_valor_iva)
														if ll_neto < 0 then
															ll_exento		= ll_exento + ll_neto
															ll_neto		= 0
														end if
//													end if
												else
													if ll_fila_4 > 0 then
														ll_monto_4		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_4,'c_total_linea')
													end if
													if ll_fila_6 > 0 then
														ll_monto_6		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_6,'c_total_linea')
													end if
													if isnull(ll_monto_4) then ll_monto_4=0
													if isnull(ll_monto_6) then ll_monto_6=0
													ll_exento				= ll_monto_4 + ll_monto_6
													ll_neto				= round((ll_total - gl_valor_iva) - ll_exento  ,0)
												end if
												ll_neto_def				= round(gl_valor_iva / (idb_iva - 1),0)
												ll_exento_def			= round(ll_total - (gl_valor_iva + ll_neto_def),0)
												if ll_neto_def <> ll_neto then ll_neto=ll_neto_def
												if ll_exento_def <> ll_exento then ll_exento=ll_exento_def
											end if
										end if
									else
										ll_fila_f 						= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = 'E'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
										if ll_fila_f > 0 then
											ll_fila_4 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = '4'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
											ll_fila_6 					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find( "tipo_cob = '6'", 1,  w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount())
											
											if ll_fila_4 > 0 then
												ll_monto_4		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_4,'c_total_linea')
											end if
											if ll_fila_6 > 0 then
												ll_monto_6		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_6,'c_total_linea')
											end if
											if isnull(ll_monto_4) then ll_monto_4=0
											if isnull(ll_monto_6) then ll_monto_6=0
											ll_total				= long(st_total.text)
											ll_exento				= ll_monto_4 + ll_monto_6
											ll_neto				= round(((ll_total - ll_exento) / idb_iva )  ,0)
											ll_iva					= round(ll_neto * (idb_iva - 1),0)
										else
											if ls_cod_pago = 'BA' or ls_cod_pago = 'FA' then
												ll_total			= long(st_total.text)
												ll_neto			= round(ll_total / (idb_iva ),0)
												ll_iva				= round(ll_neto * (idb_iva - 1),0)
												ll_exento			= 0
											else
												ll_total			= long(st_total.text)
												ll_exento			= ll_total
											end if
										end if
									end if
								else
										ll_neto						= 0
										ll_iva							= 0
										ll_total						= long(st_total.text)
										ll_exento						= ll_total
//									end if
								end if
								if ll_cod_parque=0 or isnull(ll_cod_parque) then
									if gl_cod_parque > 0 then
										ll_cod_parque				= gl_cod_parque
									else
										if gs_conexion = 'Parque El Prado' then 
											ll_cod_parque			= 1
										else
											ll_cod_parque			= 11
										end if
									end if
								end if	
								if isnull(ls_fecha_pago_palabra) then ls_fecha_pago_palabra = '-'
						
								SELECT	"CADENA"."COD_PARQUE"
								INTO 		:ll_cod_parque
								FROM 	"CADENA",	"CADENA_MORA"  
								WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
										  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
										  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
										  (("CADENA"."CODIGO" = :gs_base ) AND  
										  ( "CADENA"."SERIE" = :gs_serie ) AND  
										  ( "CADENA"."NUMERO" = :gi_numero ) )  
								USING	sqlca;
								if sqlca.sqlcode <> 0 then
									if gs_rezago = 'S' then
										setnull(gs_nombre_completo);setnull(gs_contrato_rezago);setnull(gs_string_cli_rezago)
										Open(w_ingresar_nombre)
										if gs_rezago='S' and gs_contrato_rezago<>'0' and gs_contrato_rezago<>'' then	
											if (isnull(gs_contrato_rezago) or gs_contrato_rezago='' or gs_contrato_rezago='0') and gi_numero = 0 then
													SELECT 	  "CLIENTE_REZAGO"."BASE",   	"CLIENTE_REZAGO"."SERIE",   	"CLIENTE_REZAGO"."NUMERO",   "CLIENTE_REZAGO"."NOMBRE",   "CLIENTE_REZAGO"."AP_PATERNO",   "CLIENTE_REZAGO"."AP_MATERNO",   "CLIENTE_REZAGO"."DIRECCION_PART",  "CLIENTE_REZAGO"."COMUNA_PART",   "CLIENTE_REZAGO"."CIUDAD_PART",  "CLIENTE_REZAGO"."TELEFONO_PART",   "CLIENTE_REZAGO"."DV",  "CLIENTE_REZAGO"."COD_PARQUE",   "CLIENTE_REZAGO"."MONEDA"
													INTO    	  :ls_base_rez,                			:ls_serie_rez,                 		:ll_numero_rez,               			:ls_nombre_rez,              		 :ls_ap_paterno_rez,               			  :ls_ap_materno_rez,               			:ls_direccion_part_rez,               			:ls_comuna_part_rez,               			:ls_ciudad_part_rez,               			:ls_telefono_rez,                    				  :ls_dv_rez,               		:ll_cod_parque_rez,               			  :ls_moneda_rez
													FROM 	  "CLIENTE_REZAGO"  
													WHERE 	( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
															 	( "CLIENTE_REZAGO"."FECHA_PAGO" = ( 	SELECT MAX("CLIENTE_REZAGO"."FECHA_PAGO") 
																														FROM "CLIENTE_REZAGO" 
																														WHERE "CLIENTE_REZAGO"."RUT" = :gi_rut ) )   
													USING	sqlca;
													if sqlca.sqlcode=0 then
														gl_cod_parque_rezago	= ll_cod_parque_rez
														gs_string_cli_rezago		= string(gi_rut)+'~t'+ls_dv_rez+'~t'+ls_nombre_rez+'~t'+ls_ap_paterno_rez+'~t'+ls_ap_materno_rez+'~t'+&
																						   ls_direccion_part_rez+'~t'+ls_ciudad_part_rez+'~t'+ls_comuna_part_rez+'~t'+ls_telefono_rez+'~t'+ls_base_rez+'~t'+ls_serie_rez+'~t'+&
																						   string(ll_numero_rez)+'~t'+string(ll_cod_parque_rez)+'~t'+ls_moneda_rez
														gs_nombre_completo 	= ls_nombre_rez+' '+ls_ap_paterno_rez+' '+ls_ap_materno_rez + " Teléfono: " +ls_telefono_rez
														gs_contrato_rezago 		= ls_base_rez+'-'+ls_serie_rez+'-'+string(ll_numero_rez,"###,###,###,###")
														gs_moneda_rezago		= ls_moneda_rez
													end if
//												end if
											end if
											if (gi_numero = 0 or isnull(gi_numero)) then
												gs_base						= mid(gs_contrato_rezago,1,1)
												gs_serie						= mid(gs_contrato_rezago,3,1)
												gi_numero					= double(mid(gs_contrato_rezago,5))
											end if
											ls_nro_contrato 				= gs_base+gs_serie+string(gi_numero)	//+' (R)'
										else
											ls_nro_contrato 				= gs_base+gs_serie+string(gi_numero)
										end if
										if gs_rezago='S' and gs_contrato_rezago<>'0' and gs_contrato_rezago<>'' then	
											SELECT 	"CLIENTE_REZAGO"."COD_PARQUE"  
											INTO 		:ll_cod_parque  
											FROM 	"CLIENTE_REZAGO"  
											WHERE 	(( "CLIENTE_REZAGO"."COD_PAGO" = :ls_cod_pago ) OR ( "CLIENTE_REZAGO"."COD_PAGO" = 'CU' )) AND  
														( "CLIENTE_REZAGO"."FOLIO" = :il_max_folio_new ) AND  
														( "CLIENTE_REZAGO"."FECHA_PAGO" = :gd_hoy )   ;
										else
											ls_nro_contrato					= gs_contrato_rezago
										end if
									end if
								end if
								if gs_rezago='S' then	
									if (gi_numero = 0 or isnull(gi_numero)) then
										gs_base						= mid(gs_contrato_rezago,1,1)
										gs_serie						= mid(gs_contrato_rezago,3,1)
										gi_numero					= double(mid(gs_contrato_rezago,5))
									end if
									ls_nro_contrato 				= gs_base+gs_serie+string(gi_numero)	//+' (R)'
								else
									ls_nro_contrato 				= gs_base+gs_serie+string(gi_numero)
								end if
								if isnull(ls_nro_contrato) or ls_nro_contrato='' then ls_nro_contrato	= '-'
								if isnull(ls_paga_con) or ls_paga_con='' then ls_paga_con = '0'
								if isnull(ls_vuelto) or ls_vuelto='' then ls_vuelto = '0'
								if isnull(is_proximo_pago) or is_proximo_pago='' then is_proximo_pago = 'N/A'
								if isnull(ls_monto_total_palabra) or ls_monto_total_palabra='' then ls_monto_total_palabra = '-'
								if isnull(ls_pago_ef) or ls_pago_ef='' then ls_pago_ef = '0'
								if isnull(ls_pago_ch) or ls_pago_ch='' then ls_pago_ch = '0'
								if isnull(ls_pago_tc) or ls_pago_tc='' then ls_pago_tc = '0'
								if isnull(ls_pago_td) or ls_pago_td='' then ls_pago_td = '0'
								if isnull(ll_neto) then ll_neto = 0
								if isnull(ll_exento) then ll_exento = 0
								if isnull(ll_iva) then ll_iva = 0
								if isnull(ll_total) then ll_total = 0
								if gs_rezago='S' and (gs_contrato_rezago='0' or gs_contrato_rezago='') then
									ls_no_pasa_ba 		= 'N'
								end if
								if ll_iva > 0 then
									if round(ll_neto * (idb_iva - 1),0) >= (ll_iva - 3) and round(ll_neto * (idb_iva - 1),0) <= (ll_iva + 3) then
										ll_exento 			= ll_total - (ll_neto + ll_iva)
									else
										ll_neto 				= round(ll_iva / idb_iva,0)
										ll_exento 			= ll_total - (ll_neto + ll_iva)
									end if
									if ll_exento < 0 then
										if ll_exento < 0 and ll_exento > -10 then
											ll_exento 		= 0
										else
											ll_neto 			= round((ll_total / idb_iva),0)
											ll_iva 				= round(ll_neto * (idb_iva - 1),0)
											ll_exento 		= 0
										end if;
									end if
								end if
								if il_max_folio_new > 0 and ls_no_pasa_ba = 'S' then
									if ls_cod_pago = 'BA' or ls_cod_pago = 'FA' then 
										if gs_base='F' or gs_base='G' or gs_base='V' then
											if gs_base='F' or (gs_base='G' and gs_serie='E') then
												ll_codigo_parque	= 99
												gs_tipo_cobro_aux = 'BA'
											elseif gs_base='G' and (gs_serie='I' or gs_serie='N') then
												ll_codigo_parque	= 142		//150
												gs_tipo_cobro_aux = 'BE'
											elseif gs_base='V' then
												ll_codigo_parque	= 99
//												gs_tipo_cobro_aux = 'BA'
											end if
										else
											ll_fila_iva 				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'D' or tipo_cob = 'V' or tipo_cob = 'X'", 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
											if ll_fila_iva = 0 then
//												ll_codigo_parque	= 99
												if gs_tipo_cobro_aux = 'BA' then
													ll_fila_ea			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'E' or tipo_cob = 'A' ", 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
													if ll_fila_ea > 0 and gs_base <> 'L' then
														messagebox("Advertencia","Para este Pago, debe Generar Boleta Exenta")
														ls_no_pasa_ba	= 'N'
													elseif ll_fila_ea > 0 and gs_base = 'L' then
														messagebox("Advertencia","Para este Pago, debe Ingresar Item IVA")
														ls_no_pasa_ba	= 'N'
													else
														ll_fila_l 			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'L' and tipo_cob_otro <> '76' and tipo_cob_otro <> '3' ", 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
														if ll_fila_l > 0 then
															ls_cod_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_fila_l,'tipo_cob_otro')
															SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
															INTO 		:gs_tipo_cobro_aux  
															FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
															WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_otro ) AND  
																		(( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cod_pago ) OR ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'CU' )) AND
																		( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) //AND
	//																	( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' )
															USING	sqlca;
															if sqlca.sqlcode<>0 then
																if gs_tipo_cobro_aux <> gs_tipo_cobro_aux2 and not isnull(gs_tipo_cobro_aux2) then 
																	gs_tipo_cobro_aux = gs_tipo_cobro_aux2
																end if
															end if
														end if
														if gs_tipo_cobro_aux = 'BA' and ll_fila_l > 0 then
															ll_codigo_parque	= 99
														else
															ll_codigo_parque	= ll_cod_parque
														end if
													end if
													
												else
													ll_codigo_parque		= ll_cod_parque
												end if
											else
												if gs_rezago='S' and gs_base='L' then gs_tipo_cobro_aux = 'BE'
												ll_codigo_parque			= ll_cod_parque
											end if
										end if
										if ls_no_pasa_ba = 'S' then
											if gs_base='G' and (gs_serie='I' or gs_serie='N') then
												ll_cod_parque_ctto	= 150
											else
												ll_cod_parque_ctto	= ll_codigo_parque
											end if
											if ll_neto <> round(ll_iva / (idb_iva - 1),0) then
												ll_neto			= round(ll_iva / (idb_iva - 1),0)
												ll_exento			= ll_total - (ll_neto + ll_iva)
												if ll_exento < 0 then ll_exento=0
											end if

											INSERT INTO "INGRESO_NEWSING_CABECERA"  
														( "TIPO_COB",		"FOLIO",					"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE", 		"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",	"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 	"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",		"EXENTO",		"IVA",		"TOTAL",		"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
											VALUES 	( :ls_cod_pago, 	:il_max_folio_new, 	:gd_hoy,				:ls_fecha_pago_palabra, 	:ll_cod_parque_ctto, 	:ls_nro_contrato, 		:gd_uf,		:gs_caja, 		:gs_user, 		:ls_paga_con,	:ls_vuelto,	:is_proximo_pago, 	:ls_monto_total_palabra, 		:ls_pago_ef,	:ls_pago_ch,	:ls_pago_tc,		:ls_pago_td,		:gi_rut,				:gs_rezago,		:ll_neto,		:ll_exento,		:ll_iva,	:ll_total,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										end if
									else
										if gs_base='F' then gs_tipo_cobro_aux = 'BA'
										if gs_base <> 'V' and gs_base <> 'F'  then gs_tipo_cobro_aux = gs_tipo_cobro
										if gs_base='G' and (gs_serie='I' or gs_serie='N' or gs_serie = 'X') then
											ll_cod_parque_ctto	= 150
										else
											ll_cod_parque_ctto	= ll_cod_parque
										end if
										if ll_neto <> round(ll_iva / (idb_iva - 1),0) then
											ll_neto			= round(ll_iva / (idb_iva - 1),0)
											ll_exento			= ll_total - (ll_neto + ll_iva)
											if ll_exento < 0 then ll_exento=0
										end if
										INSERT INTO "INGRESO_NEWSING_CABECERA"  
													( "TIPO_COB",		"FOLIO",					"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE", 		"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",	"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 	"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",		"EXENTO",		"IVA",		"TOTAL",		"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
										VALUES 	( :ls_cod_pago, 	:il_max_folio_new, 	:gd_hoy,				:ls_fecha_pago_palabra, 	:ll_cod_parque_ctto, 	:ls_nro_contrato, 		:gd_uf,		:gs_caja, 		:gs_user, 		:ls_paga_con,	:ls_vuelto,	:is_proximo_pago, 	:ls_monto_total_palabra, 		:ls_pago_ef,	:ls_pago_ch,	:ls_pago_tc,		:ls_pago_td,		:gi_rut,				:gs_rezago,		:ll_neto,		:ll_exento,		:ll_iva,	:ll_total,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
								
								if ls_no_pasa_ba = 'S' then
									//////////////////Fin Validacion
									// Insertar Efectivo
									IF cbx_efectivo.Checked THEN	// and gs_base <> 'B' 
										f_ingresar_doc(999, 999, ll_monto_ef, Datetime(idt_fecha_hoy), 'EF', 999,0,0,'0',0,0,'0',0)
									END IF
									// Insertar Credito
									IF cbx_credito.Checked THEN	// and gs_base <> 'B' 
										f_ingresar_doc(994, 994, ll_monto_ef, Datetime(idt_fecha_hoy), 'CR', 994,0,0,'0',0,0,'0',0)
									END IF
									// Insertar cheques
									IF cbx_cheque.Checked  THEN	//and gs_base <> 'B' 
										ll_cant_cheques		= long(tab_1.tabpage_cheque.em_cantidad_1.text)
										ll_tot_reg				= ll_cant_cheques
										FOR ll_indi = 1 TO ll_tot_reg
											ll_monto 				= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "monto")
											ll_n_cheque 		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "n_cheque") 
											ll_cod_banco 		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(ll_indi, "cod_banco") 
											ld_vencimiento 		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemDateTime(ll_indi, "fecha_venc")
											f_ingresar_doc(ll_n_cheque, ll_cod_banco, ll_monto, ld_vencimiento, 'CH', ll_cant_cheques,0,0,'0',0,0,'0',0)
										NEXT
									END IF
									// Insertar Tarjeta Credito
									IF cbx_tarjeta_credito.Checked  THEN	// and gs_base <> 'B'
										ll_cant_cheques		= long(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text)
										ll_tot_reg				= ll_cant_cheques
										FOR ll_indi = 1 TO ll_tot_reg
											ld_vencimiento 		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemDateTime(ll_indi, "fecha_venc")
											ll_nro_cuota			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, "nro_cuotas_credito")
											ll_cod_banco 		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, "cod_banco")
											ll_monto				= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, "monto")
											ll_cod_tarjeta		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, 'cod_tarjeta_credito')
											ll_tipo_tarjeta		= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(ll_indi, 'tipo_tarjeta_credito')
											ls_autoriza			= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemString(ll_indi, 'cod_autorizacion_credito')
											f_ingresar_doc(999, ll_cod_banco, ll_monto, ld_vencimiento, 'TC', 999,ll_cod_tarjeta,ll_nro_cuota,ls_autoriza,ll_tipo_tarjeta,0,'0',0)
										NEXT
									END IF
									// Insertar Tarjeta Debito
									IF cbx_tarjeta_debito.Checked  THEN	//and gs_base <> 'B'
										ll_monto 					= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, "monto")
										ll_cod_banco 			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, "cod_banco_debito") 
										ld_vencimiento 			= datetime(date(tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemDateTime(1, "fecha_venc")))
										ll_cod_tarjeta			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemNumber(1, 'cod_tarjeta_debito')
										ls_autoriza				= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.GetItemString(1, 'cod_autorizacion_debito')
										f_ingresar_doc(999, 999, ll_monto, ld_vencimiento, 'TD', 999,0,0,'0',0,ll_cod_tarjeta,ls_autoriza,ll_cod_banco)
									END IF
									// Insertar instancia de Ingreso e Ingre
									CHOOSE CASE ls_cod_pago
										CASE "CU"
											// Inicio Grabar CUPON
											ll_n_cuotas 						= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.RowCount()
											for ll_indi=1 to ll_n_cuotas
												ll_estado_reg				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'estado_reg')
												if ll_estado_reg = 0 then
													ls_tipo_mov				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
													ll_nro_cuotas_cred	= 1
													ll_nro_cuotas_mant	= 1
													ll_monto_cred			= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_cuota_peso')
													ll_monto_mant			= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_cuota_peso')
													ll_monto_cred_int		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_interes_mora')
													ll_monto_cred_gc		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_gasto_cobranza')
													ll_monto_mant_int		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_interes_mora')
													ll_monto_mant_gc		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_monto_gasto_cobranza')
													ll_n_cupon				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.GetItemNumber(ll_indi,'cuponeras_detalle_nro_cupon')	
													if ls_tipo_mov='E' then
														f_ingresar_ingre(gl_folio, ls_tipo_mov, ll_monto_cred, ll_nro_cuotas_cred)		//ll_n_cupon
													elseif ls_tipo_mov='F' then
														f_ingresar_ingre(gl_folio, ls_tipo_mov, ll_monto_mant, ll_nro_cuotas_mant)	// ll_n_cupon
													end if
													if ll_monto_cred_int > 0 or ll_monto_mant_int > 0 then
														if ll_monto_cred_int > 0 then
															ll_monto_mora	= ll_monto_cred_int
														else
															ll_monto_mora	= ll_monto_mant_int
														end if
														f_ingresar_ingre(gl_folio, 'G', ll_monto_mora, 0)		//ll_n_cupon
													end if
													if ll_monto_cred_gc > 0 or ll_monto_mant_gc > 0 then
														if ll_monto_cred_gc > 0 then
															ll_monto_gasto	= ll_monto_cred_gc
														else
															ll_monto_gasto	= ll_monto_mant_gc
														end if
														f_ingresar_ingre(gl_folio, 'J', ll_monto_gasto, 0)		//ll_n_cupon
													end if
												
													SELECT	"CADENA"."COD_PARQUE"
													INTO 		:ll_cod_parque
													FROM 	"CADENA",	"CADENA_MORA"  
													WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
															  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
															  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
															  (("CADENA"."CODIGO" = :gs_base ) AND  
															  ( "CADENA"."SERIE" = :gs_serie ) AND  
															  ( "CADENA"."NUMERO" = :gi_numero ) )  
													USING	sqlca;
													if sqlca.sqlcode=0 then
														SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
														INTO 		:ls_rut_empresa
														FROM 	"MEMBRETE_EMPRESA"  
														WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
														USING	sqlca;
														if sqlca.sqlcode=0 then
															ls_tip_cob		= ls_cod_pago
															SELECT	"ELECTRONICA_FB"."GRUPO"  
															INTO 		:ll_grupo  
															FROM 	"ELECTRONICA_FB"  
															WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
																	  ( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																	  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
																	  
															SELECT	Count("ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO")
															INTO 		:ll_count_existe  
															FROM 	"ELECTRONICA_FB_DETALLE"  
															WHERE ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
																	( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
																	( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND  
																	( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   ;
															if ll_count_existe=0 then
																messagebox("Advertencia","Folio N° "+string(gl_folio)+' No está registrado a su Caja')
																Exit;
																ll_n_cuotas	= ll_indi + 1
															else
																SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"
																INTO		:ls_dv,				:ls_nom,						:ls_ap_pat,						:ls_ap_mat
																FROM 	"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
																WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
																		  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE"."COMUNA" ) and  
																		  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
																		  (("CLIENTE"."RUT" = :gi_rut ) ) 
																USING	sqlca;
																if isnull(ls_nom) then ls_nom=''
																if isnull(ls_ap_pat) then ls_ap_pat=''
																if isnull(ls_ap_mat) then ls_ap_mat=''
																ls_nombre			= ls_nom+ ' '+ls_ap_pat+' '+ls_ap_mat
																gs_dv					= ls_dv
																UPDATE		"ELECTRONICA_FB_DETALLE"  
																SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
																				"RUT" = :gi_rut,   
																				"ESTADO_REG" = 'P',   
																				"DV" = :gs_dv,   
																				"NOMBRE_CLIENTE" = :ls_nombre,   
																				"USUARIO_CREA" = :gs_user,
																				"BASE"  = :gs_base,
																				"SERIE" = :gs_serie,
																				"NUMERO" = :gi_numero,
																				"IP_EQUIPO" = :gs_tcp_ip
																WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
																			  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
																			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   AND
																			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																			  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio )
																USING		sqlca;													
															end if
														end if
													end if
													gl_folio ++
												end if
											next
											ll_sum_cuotas_cred		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(1,'c_sumar_cred')
											ll_sum_monto_cred		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(1,'c_sumar_monto_cred')
											ll_sum_cuotas_mant		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(1,'c_sumar_mant')
											ll_sum_monto_mant		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(1,'c_sumar_monto_mant')
											if ll_sum_cuotas_cred > 0 and ll_sum_monto_cred > 0 then
												f_actualizar_mov('E', ll_sum_monto_cred, ll_sum_cuotas_cred)
											end if
											if ll_sum_cuotas_mant>0 and ll_sum_monto_mant>0 then
												f_actualizar_mov('F', ll_sum_monto_mant, ll_sum_cuotas_mant)
											end if
											// Fin Grabar CUPON
											
										CASE "CI", "BE", "BA", "FA", "FE", "CX"
											if w_ingreso2.tab_ingreso.SelectedTab = 1 then // cupon
											elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then //Comprobante Ingreso
												ll_tot_reg					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.RowCount()
												FOR ll_indi = 1 TO ll_tot_reg
													ls_tipo_pago 			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_indi, "c_total_linea") ,0)
													ll_n_cuotas 				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_indi, "cantidad") 
													gs_codigo_otro			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemString(ll_indi, "tipo_cob_otro")
													f_ingresar_ingre(gl_folio, ls_tipo_pago , ll_monto, ll_n_cuotas)
													IF gs_rezago <> "S" THEN 
														f_actualizar_mov(ls_tipo_pago, ll_monto, ll_n_cuotas)
														
													end if
												NEXT
												if gs_base='M' then
													ll_tot_reg_mp			= dw_multiproducto.rowcount()
													if ll_tot_reg_mp > 0 then
														for ll_indi_mp=1 to ll_tot_reg_mp
															ls_tipo_mov_h	= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
															if ls_tipo_mov_h='E' or ls_tipo_mov_h='F' or ls_tipo_mov_h='A' then
																ls_ctto_h		= dw_multiproducto.getitemstring(ll_indi_mp,'contrato')
																ls_base_h	= mid(ls_ctto_h,1,1)
																ls_serie_h	= mid(ls_ctto_h,2,1)
																ll_numero_h	= Double(mid(ls_ctto_h,3))
																ll_monto_h	= dw_multiproducto.getitemnumber(ll_indi_mp,'totalitem')
																ll_cuotas_h	= dw_multiproducto.getitemnumber(ll_indi_mp,'cantidad')
																f_actualizar_mov_h( ls_tipo_mov_h , ll_monto_h, ll_cuotas_h,ls_base_h,ls_serie_h,ll_numero_h)
															end if
														next
													end if
												end if
												IF w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.GetItemNumber(1,"incluir_gastos") = 1 THEN
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.GetItemNumber(1,"gasto_cred"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "J" , ll_monto, 0)
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.GetItemNumber(1,"gasto_mant"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "R" , ll_monto, 0)
													
													ll_monto 		= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.GetItemNumber(1,"mora_cred"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "G" , ll_monto, 0)
													ll_monto 		= round(w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.GetItemNumber(1,"mora_mant"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "P" , ll_monto, 0)
												END IF
											elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then //Boleta
												
												ll_tot_reg					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.RowCount()
												FOR ll_indi = 1 TO ll_tot_reg
													ls_tipo_pago 			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemString(ll_indi, "tipo_cob")
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(ll_indi, "c_total_linea") ,0)
													ll_n_cuotas 				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(ll_indi, "cantidad") 
													gs_codigo_otro			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemString(ll_indi, "tipo_cob_otro")
													f_ingresar_ingre(gl_folio, ls_tipo_pago , ll_monto, ll_n_cuotas)
													IF gs_rezago <> "S" THEN f_actualizar_mov(ls_tipo_pago, ll_monto, ll_n_cuotas)
												NEXT
												IF w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.GetItemNumber(1,"incluir_gastos") = 1 THEN
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.GetItemNumber(1,"gasto_cred"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "J" , ll_monto, 0)
													ll_monto 					= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.GetItemNumber(1,"gasto_mant"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "R" , ll_monto, 0)
													
													ll_monto 		= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.GetItemNumber(1,"mora_cred"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "G" , ll_monto, 0)
													ll_monto 		= round(w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.GetItemNumber(1,"mora_mant"),0)
													IF ll_monto > 0 AND gs_rezago <> "S" THEN f_ingresar_ingre(gl_folio, "P" , ll_monto, 0)
												END IF
											end if
									END CHOOSE
										
									CHOOSE CASE ls_cod_pago
										CASE "BE", "BA", "FA", "FE"
											IF gs_rezago = "S" THEN 
												IF gs_nombre_completo = "" or isnull(gs_nombre_completo) THEN
													Rollback using sqlca;
												else
													ls_doc			= gs_contrato_rezago
												END IF
												if (gi_numero = 0 or isnull(gi_numero)) then
													gs_base				= mid(gs_contrato_rezago,1,1)
													gs_serie				= mid(gs_contrato_rezago,3,1)
													gi_numero			= double(mid(gs_contrato_rezago,5))
												end if
												ll_rut 				= long(substr(1,1,gs_string_cli_rezago))
												ls_dv				= substr(1,2,gs_string_cli_rezago)
												ls_nombre		= substr(1,3,gs_string_cli_rezago)
												ls_ap_pat		= substr(1,4,gs_string_cli_rezago)
												ls_ap_mat		= substr(1,5,gs_string_cli_rezago)
												ls_direc			= substr(1,6,gs_string_cli_rezago)
												ls_ciudad			= substr(1,7,gs_string_cli_rezago)
												ls_comuna		= substr(1,8,gs_string_cli_rezago)
												ls_fono			= substr(1,9,gs_string_cli_rezago)
												ls_base			= substr(1,10,gs_string_cli_rezago)
												ls_serie			= substr(1,11,gs_string_cli_rezago)
												ll_numero		= double(substr(1,12,gs_string_cli_rezago))
												ll_cod_parque	= long(substr(1,13,gs_string_cli_rezago))
												ls_moneda		=  substr(1,14,gs_string_cli_rezago)
												ld_fecha			= idt_fecha_hoy
												ls_nro_contrato	= gs_base+gs_serie+string(gi_numero)	//+' (R)'
												if ls_cod_pago = 'BA' or ls_cod_pago = 'FA' then 
													if gs_base='F' or gs_base='V' or (gs_base='G' and gs_serie='E') then
														ll_codigo_parque	= 99
													else
														ll_codigo_parque	= ll_cod_parque
													end if
													UPDATE 	  "INGRESO_NEWSING_CABECERA"  
													SET 		  "NRO_CONTRATO" = :ls_nro_contrato  
													WHERE 	(( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = 'CU' )) AND  
																( "INGRESO_NEWSING_CABECERA"."FOLIO" = :il_max_folio_new ) AND  
																( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :gd_hoy ) AND  
																( "COD_PARQUE" = :ll_codigo_parque ) AND
																( "RUT_CLIENTE" = :gi_rut ) AND 
																( "INGRESO_NEWSING_CABECERA"."COD_CAJA" = :gs_caja )   
													USING	SQLCA;
												else
													UPDATE 	  "INGRESO_NEWSING_CABECERA"  
													SET 		  "NRO_CONTRATO" = :ls_nro_contrato  
													WHERE 	(( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = 'CU' )) AND  
																( "INGRESO_NEWSING_CABECERA"."FOLIO" = :il_max_folio_new ) AND  
																( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :gd_hoy ) AND  
																( "COD_PARQUE" = :ll_cod_parque ) AND
																( "RUT_CLIENTE" = :gi_rut ) AND 
																( "INGRESO_NEWSING_CABECERA"."COD_CAJA" = :gs_caja )   
													USING	SQLCA;
												end if
												
												
												SELECT DISTINCT "CLIENTE_REZAGO"."NRO_CLIENTE_SAP"  
												INTO 			:ls_cliente_sap  
												FROM 		"CLIENTE_REZAGO"  
												WHERE 		"CLIENTE_REZAGO"."RUT" = :ll_rut
												USING		sqlca;
												if not isnull(ls_cliente_sap) and len(ls_cliente_sap) > 0 then
													if gl_folio > 0 then
														INSERT INTO "CLIENTE_REZAGO"  
																 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		"FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO",	"COD_PARQUE",	"MONEDA",		"NRO_CLIENTE_SAP",		"ESTADO_SAP",	"FECHA_SAP")  
														VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero, 	:ls_nombre,  :ls_ap_pat,   		:ls_ap_mat,     		:ls_direc,   		 		:ls_comuna,   		  :ls_ciudad,   	  	  :ls_fono,   		   		 :ld_fecha,   	 	:gs_user,    	  :ls_dv, 		:ls_cod_pago, 		:gl_folio,	:gs_caja,'A',				:ldt_fecha_pago,	:ll_cod_parque,		:ls_moneda,		:ls_cliente_sap,				1,						:gdt_fec_sistema)  
														USING		sqlca;
													else
														if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 and il_max_folio_new > 0 and not isnull(ldt_fecha_pago) and not ll_rut > 0 then
															DELETE FROM "CLIENTE_REZAGO"  
															WHERE 	( "CLIENTE_REZAGO"."RUT" = :ll_rut ) AND  
																		( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
																		( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
																		( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
																		( "CLIENTE_REZAGO"."FOLIO" = :il_max_folio_new ) AND  
																		( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
																		( "CLIENTE_REZAGO"."CAJA" = :gs_caja )  
															USING	sqlca;
														end if
														UPDATE 		"CUPONERAS_DETALLE_WEB"  
														SET 			"BASE" = :ls_base ,
																		"SERIE" = :ls_serie,
																		"NUMERO" = :ll_numero
														WHERE 		( "CUPONERAS_DETALLE_WEB"."RUT" = :ll_rut ) AND  
																		( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :il_max_folio_new ) AND  
																		( "CUPONERAS_DETALLE_WEB"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
																		( "CUPONERAS_DETALLE_WEB"."NRO_CUPONERA" = 1 )  
														USING	sqlca;

														INSERT INTO "CLIENTE_REZAGO"  
																 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		 "FOLIO",					"CAJA",	"ESTADO",	"FECHA_PAGO",	"COD_PARQUE",	"MONEDA",		"NRO_CLIENTE_SAP",		"ESTADO_SAP",	"FECHA_SAP")  
														VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero, 	:ls_nombre,  :ls_ap_pat,   		:ls_ap_mat,     		:ls_direc,   		 		:ls_comuna,   		  :ls_ciudad,   	  	  :ls_fono,   		   		 :ld_fecha,   	 	:gs_user,    	  :ls_dv, 		:ls_cod_pago, 		:il_max_folio_new,	:gs_caja,'A',				:ldt_fecha_pago,	:ll_cod_parque,		:ls_moneda,		:ls_cliente_sap,				1,						:gdt_fec_sistema)  
														USING		sqlca;
													end if
												else
													if gl_folio > 0 then
														INSERT INTO "CLIENTE_REZAGO"  
																 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   	"DV" ,		"COD_PAGO",		 "FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO",		"COD_PARQUE",	"MONEDA")  
														VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero,	:ls_nombre, :ls_ap_pat,   	 	:ls_ap_mat,     		:ls_direc,   		 		:ls_comuna,   		  :ls_ciudad,   	  	  :ls_fono,   		   		 :ld_fecha,   	 	:gs_user,    		:ls_dv, 	:ls_cod_pago, 		:gl_folio,	:gs_caja,'A',				:ldt_fecha_pago,		:ll_cod_parque,		:ls_moneda)  
														USING		sqlca;
													else
														if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 and il_max_folio_new > 0 and not isnull(ldt_fecha_pago) and ll_rut > 0 then
															DELETE FROM "CLIENTE_REZAGO"  
															WHERE 	( "CLIENTE_REZAGO"."RUT" = :ll_rut ) AND  
																		( "CLIENTE_REZAGO"."COD_PAGO" = :ls_cod_pago ) AND
																		( "CLIENTE_REZAGO"."FOLIO" = :il_max_folio_new ) AND  
																		( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
																		( "CLIENTE_REZAGO"."CAJA" = :gs_caja )  
															USING	sqlca;
														end if
														INSERT INTO "CLIENTE_REZAGO"  
																 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   	"DV" ,		"COD_PAGO",		 "FOLIO",					"CAJA",	"ESTADO",	"FECHA_PAGO",		"COD_PARQUE",	"MONEDA")  
														VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero,	:ls_nombre, :ls_ap_pat,   	 	:ls_ap_mat,     		:ls_direc,   		 		:ls_comuna,   		  :ls_ciudad,   	  	  :ls_fono,   		   		 :ld_fecha,   	 	:gs_user,    		:ls_dv, 	:ls_cod_pago, 		:il_max_folio_new,	:gs_caja,'A',				:ldt_fecha_pago,		:ll_cod_parque,		:ls_moneda)  
														USING		sqlca;
													end if
												end if
												
												if sqlca.sqlcode=0 then
	//												commit;
													UPDATE		"INGRESO_NEWSING"  
													SET 			"BASE" = :ls_base,   
																	"SERIE" = :ls_serie,
																	"COD_PARQUE" = :ll_cod_parque
													WHERE	  ( "INGRESO_NEWSING"."FOLIO" = :il_max_folio_new ) AND  
																  (( "INGRESO_NEWSING"."TIPO_COB" = :ls_cod_pago ) OR ( "INGRESO_NEWSING"."TIPO_COB" = 'CU' )) AND  
																  ( "INGRESO_NEWSING"."FECHA_PAGO" = :ldt_fecha_pago )  
													USING		sqlca;
	
													if ll_cod_parque > 0 then
														SELECT	"CD_FOLIO"."COD_PARQUE"  
														INTO 		:ll_cod_parque_aux  
														FROM 	"CD_FOLIO"  
														WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
																 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
														USING		sqlca;
														if sqlca.sqlcode=0 then
															if ll_cod_parque_aux <> ll_cod_parque then
																UPDATE	"CD_FOLIO"  
																SET 		"COD_PARQUE" = :ll_cod_parque,
																			"SERIE" = :ls_serie
																WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
																		 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																		 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
																USING	sqlca;
																if sqlca.sqlcode=0 then
//																	commit;
																	UPDATE		"CD_FOLIO_DETALLE"  
																	SET 			"COD_PARQUE" = :ll_cod_parque ,
																					"SERIE" = :ls_serie
																	WHERE 	  ( "CD_FOLIO_DETALLE"."BASE" = :ls_base ) AND  
																				  ( "CD_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND  
																				  ( "CD_FOLIO_DETALLE"."NUMERO" = :ll_numero )   
																	USING		sqlca;
	//																end if
																else
																	rollback;
																end if
															end if
														end if
													end if
												else
													rollback;
													messagebox("Error","Error al Grabar Cliente Rezago SQL: "+SQLCA.SQLErrText )
												end if
											ELSE
												ls_doc 				= (gs_base+gs_serie+String(gi_numero))
											END IF 
											Commit Using sqlca ;
											Commit Using Trans_3 ;
											// Nuevo Mirko 07/10/2019
											DECLARE sp_proc_be PROCEDURE FOR  F_XML_DTEBOX_ADEXUS(:ls_cod_pago, :il_max_folio_new, :gd_hoy, :gs_caja, :gi_rut, 'N', :gs_base, :gs_serie, :gi_numero,'1.0') ;
											
											EXECUTE sp_proc_be;
											FETCH sp_proc_be into :ll_ok_boleta ;
											ll_ok_boleta				= Double(il_max_folio_new)
											ld_fecha_hoy = Today()
											if ll_ok_boleta > 0 then
												////////////////////////////////////////////FRANCK////////////////////////////////////////////
												//GENERAR BOLETA
												Boleta boleta
												boleta.Title = Parent.Title
												boleta.sDB = 'PRADO'
												boleta.lcupon = il_max_folio_new
												boleta.sFechapago = string(Today())
												boleta.sCupon = String( boleta.lcupon )
												boleta.FolioBE = ll_ok_boleta
												
												lb_generado = boleta.generar(boleta.sDB, boleta.sFechapago, boleta.sCupon)
												
												IF NOT lb_generado THEN
													 MessageBox('Error', 'No se pudo generar la boleta. Detalle: ' + boleta.sMessage)
													 RETURN
												ELSE
													 	 SELECT "INGRESO_NEWSING_CABECERA"."FOLIO_BE"  
														 INTO 	: ll_folio_be
														 FROM 	"INGRESO_NEWSING_CABECERA"  
														 WHERE 	( "INGRESO_NEWSING_CABECERA"."FOLIO" = :il_max_folio_new ) AND  
																	( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :ld_fecha_hoy )    
														 USING	sqlca;
												END IF
												
												lsURL = boleta.GetURL( 'PDF' )
												ls_XRL = boleta.GetURL( 'PRADO', il_max_folio_new, ll_folio_be, 'PDF' )
												
												boleta.sDownloadPath = 'C:\mod_cp\consulta\'
												boleta.sPDFFilename = boleta.sCupon + '.pdf'
												
												//IMPRIMIR BOLETA
												String ls_ruta_pdf_descargado
												
												ls_ruta_pdf_descargado = boleta.DownloadPDF( boleta.sDownloadPath, boleta.sPDFFilename )
												
												IF IsNull(ls_ruta_pdf_descargado) OR ls_ruta_pdf_descargado = '' THEN
													 MessageBox('Error', 'No se pudo descargar el archivo PDF.')
													 //RETURN 
												END IF
												
												Integer li_ret
												li_ret = boleta.OpenNavigate( boleta.sDB,il_max_folio_new, ll_folio_be, boleta.sDownloadPath, boleta.sPDFFilename )
												////////////////////////////////////////////FRANCK////////////////////////////////////////////
												gl_folio				= ll_ok_boleta
//												commit using sqlca;
//												commit using Trans_3;
												UPDATE 	"FICHA_SEPULTACION_PAGO"  
												SET 		"FOLIO_BOLETA" = :ll_ok_boleta  
												WHERE ( "FICHA_SEPULTACION_PAGO"."BASE" = :gs_base ) AND  
														  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :gs_serie ) AND  
														  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :gi_numero ) AND  
														  (( "FICHA_SEPULTACION_PAGO"."TIPO_COB" = :ls_cod_pago ) OR ( "FICHA_SEPULTACION_PAGO"."TIPO_COB" = 'CU' )) AND 
														  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux )
												USING	sqlca;
//												if sqlca.sqlcode=0 then
//													commit;
//												else
//													rollback;
//												end if
												ll_tot_filas				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
												if ll_tot_filas > 0 then
													ll_reg					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'S' and tipo_cob_otro='132'", 1, ll_tot_filas)
													if ll_reg > 0 then
														ls_pada_benef	= 'S'
														DECLARE x_benef CURSOR FOR  
														SELECT 	"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO", 	"TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE"  
														FROM 	"TIPO_PROMOCION_ASOCIADOS"  
														WHERE ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :gs_base ) AND  
																  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :gs_serie ) AND  
																  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
																  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' )  AND
																  (( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 4 ) OR ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 5 ) OR ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 6 ) OR ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 7 ) OR ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 8 ) OR ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 9 ))
														USING		Trans_2;
															open x_benef;
															if Trans_2.sqlcode=0 then
																DO WHILE Trans_2.sqlcode=0
																	fetch x_benef into :ll_cod_beneficio, :ll_cod_benef_detalle;
																	if ll_cod_benef_detalle>0 then
																		if ll_cod_beneficio=4 and ll_cod_benef_detalle=5 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=4 and ll_cod_benef_detalle=7 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=5 and ll_cod_benef_detalle=1 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=6 and ll_cod_benef_detalle=10 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=6 and ll_cod_benef_detalle=11 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=7 and ll_cod_benef_detalle=1 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=7 and ll_cod_benef_detalle=2 and ls_pada_benef='S' then
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=8 and ll_cod_benef_detalle=1 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=8 and ll_cod_benef_detalle=2 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=8 and ll_cod_benef_detalle=3 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=9 and ll_cod_benef_detalle=1 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=9 and ll_cod_benef_detalle=2 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		elseif ll_cod_beneficio=9 and ll_cod_benef_detalle=3 and ls_pada_benef='S' then	
																			wf_actualizar_benef_mantencion(ll_cod_beneficio,ll_cod_benef_detalle,gs_base,gs_serie,gi_numero,ls_cod_pago,ll_ok_boleta,gd_hoy)
																			ls_pada_benef	='N'
																		end if
																	end if
																	setnull(ll_cod_benef_detalle)
																LOOP
															end if
															close x_benef;
													end if
												end if
	
												SELECT	"FICHA_SEPULTACION"."IP"
												INTO 		:ls_tcp_ip  
												FROM 	"FICHA_SEPULTACION"  
												WHERE  ( "FICHA_SEPULTACION"."BASE" = :gs_base ) AND  
														 ( "FICHA_SEPULTACION"."SERIE" = :gs_serie ) AND  
														 ( "FICHA_SEPULTACION"."NUMERO" = :gi_numero ) AND 
														 ( "FICHA_SEPULTACION"."IP" = :gs_tcp_ip )  AND
														 ( "FICHA_SEPULTACION"."FOLIO_COMPROBANTE" is null or "FICHA_SEPULTACION"."FOLIO_COMPROBANTE" = 0 )
												USING		sqlca;
												if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
													UPDATE	"FICHA_SEPULTACION"  
													SET 		"FOLIO_COMPROBANTE" = :ll_ok_boleta,
																"IP" = :ls_nulo
													WHERE 	"FICHA_SEPULTACION"."IP" = :ls_tcp_ip   
													USING	sqlca;
												else
													SELECT	"FICHA_TRASLADO"."IP"
													INTO 		:ls_tcp_ip
													FROM 	"FICHA_TRASLADO"  
													WHERE  ( "FICHA_TRASLADO"."BASE_ORIGEN" = :gs_base ) AND  
															 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :gs_serie ) AND  
															 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :gi_numero ) AND  
															 ( "FICHA_TRASLADO"."IP" = :gs_tcp_ip )   AND
															 ( "FICHA_TRASLADO"."BOLETA_NRO_ORIGEN" is null or "FICHA_TRASLADO"."BOLETA_NRO_ORIGEN" = 0 )
													USING		sqlca;
													if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
														UPDATE	"FICHA_TRASLADO"  
														SET 		"BOLETA_NRO_ORIGEN" = :ll_ok_boleta,   
																	"IP" = :ls_nulo  
														WHERE  ( "FICHA_TRASLADO"."IP" = :ls_tcp_ip ) AND  
																 ( "FICHA_TRASLADO"."BASE_ORIGEN" = :gs_base ) AND  
																 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :gs_serie ) AND  
																 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :gi_numero )   
														USING		sqlca;
													else
														SELECT	"FICHA_TRASLADO"."IP"
														INTO 		:ls_tcp_ip
														FROM 	"FICHA_TRASLADO"  
														WHERE  ( "FICHA_TRASLADO"."BASE_DESTINO" = :gs_base ) AND  
																 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :gs_serie ) AND  
																 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :gi_numero ) AND  
																 ( "FICHA_TRASLADO"."IP" = :gs_tcp_ip )   AND
																 ( "FICHA_TRASLADO"."BOLETA_NRO_DESTINO" is null or "FICHA_TRASLADO"."BOLETA_NRO_DESTINO" = 0 )
														USING		sqlca;
														if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
															UPDATE	"FICHA_TRASLADO"  
															SET 		"BOLETA_NRO_DESTINO" = :ll_ok_boleta,   
																		"IP" = :ls_nulo  
															WHERE  ( "FICHA_TRASLADO"."IP" = :ls_tcp_ip ) AND  
																	 ( "FICHA_TRASLADO"."BASE_DESTINO" = :gs_base ) AND  
																	 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :gs_serie ) AND  
																	 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :gi_numero )   
															USING		sqlca;
														end if
													end if
												end if
												if gs_base='F' or gs_base='G' or gs_base='V' then
													if gs_base='G' then
													end if
													
													UPDATE 	"REVISION_CONTRATOS"  
													SET 		"FOLIO_FA" = :ll_ok_boleta,
																"SW_ACTIVA_SERVICIO" = 0
													WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
																( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
																( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )   
													USING	sqlca;
													if sqlca.sqlcode=0 then
														SELECT 	Count("PRODUCTO_GESTION_SERVICIO"."BASE"  )
														INTO 		:ll_count_serv  
														FROM 	"PRODUCTO_GESTION_SERVICIO"  
														WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
																	( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
																	( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
																	( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' )   ;
														if isnull(ll_count_serv) then ll_count_serv=0
														if ll_count_serv > 0 then
															UPDATE 	"PRODUCTO_GESTION_SERVICIO"  
															SET 		"SW_ACTIVACION" = 0  
															WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
																		( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
																		( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
																		( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND  
																		( "PRODUCTO_GESTION_SERVICIO"."CORRELATIVO" = (	SELECT 	MIN("PRODUCTO_GESTION_SERVICIO"."CORRELATIVO"  )
																																					FROM 	"PRODUCTO_GESTION_SERVICIO"  
																																					WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
																																								( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
																																								( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
																																								( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND  
																																								( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" > 0 ) ) ) 
															USING	sqlca;
														end if
//														commit;
														INSERT INTO "PRODUCTO_INGRESO"  
																	( "BASE", 	"SERIE", 		"NUMERO", 		"TIPO_COB", 		"FOLIO", 			"FECHA_PAGO", 	"PAGO_HIST",	"MONTO",	"CAJA",		"USUARIO" )  
														VALUES 	( :gs_base,	:gs_serie,   	:gi_numero,   	:ls_cod_pago,   	:ll_ok_boleta,   	:gd_hoy,   			'A',				:ll_total,		:gs_caja,		:gs_user)  
														USING	sqlca;
													else
														rollback;
														messagebox("Error Grabar","Error Update en Tabla REVISION_CONTRATOS "+sqlca.sqlerrtext)
													end if
												end if
												if gs_rezago <> 'S' then
													DECLARE sp_actualizar_cuponeras_1 PROCEDURE FOR sp_actualizar_cuponeras_1(:gs_base,:gs_serie,:gi_numero);
													EXECUTE sp_actualizar_cuponeras_1;
													
													DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
													EXECUTE sp_nuevo_cadena_mora2;
													if gs_base='M' then
														ll_tot_reg_mp			= dw_multiproducto.rowcount()
														if ll_tot_reg_mp > 0 then
															for ll_indi_mp=1 to ll_tot_reg_mp
																ls_tipo_mov_h	= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
																if ls_tipo_mov_h='E' or ls_tipo_mov_h='F' then
																	ls_ctto_h		= dw_multiproducto.getitemstring(ll_indi_mp,'contrato')
																	ls_base_h	= mid(ls_ctto_h,1,1)
																	ls_serie_h	= mid(ls_ctto_h,2,1)
																	
																	ll_numero_h	= Double(mid(ls_ctto_h,3))
																	DECLARE sp_actualizar_cuponeras_h1 PROCEDURE FOR sp_actualizar_cuponeras_1(:ls_base_h,:ls_serie_h,:ll_numero_h);
																	EXECUTE sp_actualizar_cuponeras_h1;
																	
																	DECLARE sp_nuevo_cadena_mora_h2 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_h,:ls_serie_h,:ll_numero_h,'M');
																	EXECUTE sp_nuevo_cadena_mora_h2;
																end if
															next
														end if
													end if
												end if;
												ls_ok_print			= 'N'
												ls_ok_print			= wf_imprimir_delect(ll_ok_boleta)
												
												
												if ls_ok_print = 'S' then
													MessageBox("Grabar", "Grabación Exitosa Comprobante " + ls_cod_pago +" Nº " +String(ll_ok_boleta))	//il_max_folio_new))
													wf_desactiva_descuento()
													f_inicializa_ingreso(gs_tipo_cobro)
													wf_limpiar_ventana_anterior_ingreso()
													Close(w_forma_pago2)
												else
														MessageBox("Grabar", "Grabación Exitosa Comprobante " + ls_cod_pago +" Nº " +String(ll_ok_boleta))	//il_max_folio_new))
														wf_desactiva_descuento()
														f_inicializa_ingreso(gs_tipo_cobro)
														wf_limpiar_ventana_anterior_ingreso()
														Close(w_forma_pago2)
												end if
											else
												messagebox("Error",ls_ok_boleta)
												email_de			= 'mirkom@nuestrosparques.cl'
												ls_email_para	= 'mirkom@nuestrosparques.cl'
												ls_asunto		= 'Error XML Boleta Eletronica '+ls_cod_pago+string(il_max_folio_new)
												ls_texto			= ls_ok_boleta
												
												Rollback using sqlca;
												rollback using Trans_3;
												if il_max_folio_new > 0 then gl_folio = il_max_folio_new
												OpenWithParm(w_observacion_no_grabar_comprobante,'N')
												Close(w_forma_pago2)
											end if
											
										CASE "CI", "CX"		//,"BE","BA"
											if gs_conexion	<> "Parque Santiago" then
												dw_impresion.DataObject	= 'd_rep_ci_form_nuevo' //'d_rep_ci'
												dw_impresion.GetChild('d_rep_detalle_ci', dwch_detalle_ci)
												dwch_detalle_ci.SetTransObject(SQLCA)
												dwch_detalle_ci.Retrieve(gl_folio)
												dw_impresion.GetChild('d_rep_ci_docu', dwch_doc_cob)
												dwch_doc_cob.SetTransObject(SQLCA)
												dwch_doc_cob.Retrieve(gl_folio)
												dw_impresion.SetTransObject(SQLCA)
											else
												dw_impresion.DataObject	= 'd_rep_ci_form_nuevo'	//'d_rep_ci2'
												dw_impresion.GetChild('d_rep_detalle_ci2', dwch_detalle_ci)
												dwch_detalle_ci.SetTransObject(SQLCA)
												dwch_detalle_ci.Retrieve(gl_folio)
												dw_impresion.GetChild('d_rep_ci_docu2', dwch_doc_cob)
												dwch_doc_cob.SetTransObject(SQLCA)
												dwch_doc_cob.Retrieve(gl_folio)
												dw_impresion.SetTransObject(SQLCA)
											end if
											if w_ingreso2.tab_ingreso.SelectedTab = 1 then // cupon
											elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then //Comprobante Ingreso
												ll_tot_filas					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
												ll_reg							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
												if ll_reg>0 and gs_rezago <> "S" then //if ls_tipo_pago = 'E' OR ls_tipo_pago = 'K' then
													if w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.rowcount() > 0 then
														ll_reg_cred			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
														ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg_cred, "cantidad") 
														CHOOSE CASE gs_base
															CASE 'O','U','M'	//Promesa
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "oferta_v_cta_pag_s") >= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_oferta_nro_cuotas") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "pago_oferta_fecha_prim")
																		ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "oferta_v_cta_pag_s")) * ll_cant_cred ) //+ ll_cant_cred
																		DECLARE x31 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x31;
																		FETCH x31 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "oferta_v_cta_pag_s"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_oferta_nro_cuotas") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'R'	//Reprog.Mant
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "ctas_pagadas"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "cuotas_pactadas") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "ctas_pagadas")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "cuotas_pactadas") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "ctas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "cuotas_pactadas") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "fecha_primera_cta")
																		ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "ctas_pagadas")) * ll_cant_cred) 	//+ ll_cant_cred
																		DECLARE x32 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x32;
																		FETCH x32 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "ctas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "cuotas_pactadas") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'L'	//Liberador
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_liberador_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_liberador_nro_cuotas") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "pago_liberador_fecha_prim")
																		ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_liberador_cta_pag_m")) * ll_cant_cred ) 	//+ ll_cant_cred
																		DECLARE x33 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x33;
																		FETCH x33 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_liberador_cta_pag_m"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_liberador_nro_cuotas") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'F','G','V'	//Funeraria
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_pago_plazo") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_anexo_cuotas_pag")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_pago_plazo") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_pago_plazo") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "producto_pago_fecha_prim")
																		ll_ctas_pag				= ((ll_can_cta_cred + w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_anexo_cuotas_pag")) * ll_cant_cred ) 	//+ ll_cant_cred
																		DECLARE x34 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x34;
																		FETCH x34 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_anexo_cuotas_pag"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "producto_pago_plazo") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'P'	//Pagare
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pagare_plazo") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pagare_plazo") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pagare_plazo") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "pagare_fecha_prim")
																		ll_ctas_pag				= ((ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas")) * ll_cant_cred ) 	//+ ll_cant_cred
																		DECLARE x35 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x35;
																		FETCH x35 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pagare_plazo") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'D'	// Derecho
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "derecho_plazo") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "derecho_plazo") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "derecho_plazo") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "derecho_fecha_prim")
																		ll_ctas_pag				=(( ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas")) * ll_cant_cred ) 	//+ ll_cant_cred
																		DECLARE x36 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x36;
																		FETCH x36 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_cuotas_pagadas"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "derecho_plazo") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
															CASE 'A'	// Aumento
																if gd_fecha_prox_pago=date('01/01/1900') then
																	dw_impresion.object.cuota.text	= 'Cuota N° '+&
																	string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
																	' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	if ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_aumento_cta_pag_m")>=w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_aumento_nro_cuotas") then
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	else
																		ldt_fecha_prim			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "pago_aumento_fecha_prim")
																		ll_ctas_pag				=(( ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_aumento_cta_pag_m")) * ll_cant_cred ) 	//+ ll_cant_cred
																		DECLARE x37 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prim, :ll_ctas_pag);
																		execute x37;
																		FETCH x37 into :gd_fecha_prox_pago ;
				//														gd_fecha_prox_pago	= funcion_venc( ldt_fecha_prim , ll_ctas_pag )
																		dw_impresion.object.cuota.text	= 'Cuota N° '+&
																		string(ll_can_cta_cred+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "anexo_aumento_cta_pag_m"))+&
																		' de '+string(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "pago_aumento_nro_cuotas") )+&
																		'  Fecha Prox.Pago: '+string(gd_fecha_prox_pago,"dd/mm/yyyy")+&
																		'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	end if
																end if
														END CHOOSE
													end if
												end if
												ll_tot_filas	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
												ll_reg			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'F'", 1, ll_tot_filas)
												if ll_reg>0 and gs_rezago <> "S" then //if ls_tipo_pago = 'F' then
													if w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.rowcount() > 0 then
														ll_can_cta_cred	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg, "cantidad") 
														CHOOSE CASE gs_base
															CASE 'O','U','M'	//Promesa
																if gd_fecha_prox_pago=date('01/01/1900') or gd_fecha_prox_pago=date('00/00/0000') then
																	dw_impresion.object.cuota_mant.text	= 'Últ.Cta.Mant.Pag.Año '+&
																	string(ll_n_cuotas+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_prox_pago_anno") - 1) +&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	ldt_fecha_prox_pago_mant	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "c_fecha_prox_pago_mant")
																	ll_calc_cuotas					= (ll_n_cuotas * ll_cant_mant) 
																	DECLARE x41 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prox_pago_mant, :ll_calc_cuotas);
																	execute x41;
																	FETCH x41 into :gd_fecha_prox_pago ;
																	
																	ll_calc_cuotas					= ll_cant_mant * -1
																	DECLARE x40 PROCEDURE FOR sp_fecha_venc_cupon(:gd_fecha_prox_pago, :ll_calc_cuotas);
																	execute x40;
																	FETCH x40 into :ldt_fecha_pago ;
																	
																	//-- JUAN
																	ll_mes_mant		= month(gd_fecha_prox_pago)
																	ll_day_mant			= day(gd_fecha_prox_pago)
																	ll_anno_mant		= year(gd_fecha_prox_pago)
																	SELECT 	"CADENA"."ESTADO_MORA_MANTENCION"  
																	INTO 		:ll_estado_mora_mant  
																	FROM 	"CADENA"  
																	WHERE 	"CADENA"."CODIGO" = :gs_base AND  
																				"CADENA"."SERIE" = :gs_serie AND  
																				"CADENA"."NUMERO" = :gi_numero
																	USING	sqlca;
																	if ll_estado_mora_mant = 2 then
																		ls_tipo_mant			= 'Anual'
																		ll_year_mant			= ll_anno_mant -1
																	elseif ll_estado_mora_mant	= 1 then
																		ls_tipo_mant			= 'Semestral'
																		if  ll_mes_mant <=6 then
																			ll_year_mant		= ll_anno_mant - 1
																		else
																			ll_year_mant		= ll_anno_mant
																		end if												
																	end if
																//--	
																	ll_cta_pag_m	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemnumber(1,'oferta_v_cta_pag_m')
																	
																	ls_string_mant	= 'Mant.Pag.Año '+ string(ll_year_mant) +&
																	' F.Prox.Pago: '+string(gd_fecha_prox_pago ,"dd/mm/yyyy" )+' ('+string(gdt_fec_sistema,"hh:mm")+')'
																	dw_impresion.object.cuota_mant.text		= ls_string_mant
																end if
															CASE 'C'//Contratos
																if gd_fecha_prox_pago=date('01/01/1900') or gd_fecha_prox_pago=date('00/00/0000') then
																	dw_impresion.object.cuota_mant.text	= 'Mant.Pag.Año '+&
																	string(ll_n_cuotas+w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1, "c_prox_pago_anno") - 1)+&
																	'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																else
																	ldt_fecha_prox_pago_mant	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemdatetime(1, "c_fecha_prox_pago_mant")
																	ll_calc_cuotas					= (ll_n_cuotas * ll_cant_mant)
																	DECLARE x43 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_prox_pago_mant, :ll_calc_cuotas);
																	execute x43;
																	FETCH x43 into :gd_fecha_prox_pago ;
																	
																	ll_calc_cuotas					= ll_cant_mant * -1
																	DECLARE x42 PROCEDURE FOR sp_fecha_venc_cupon(:gd_fecha_prox_pago, :ll_calc_cuotas);
																	execute x42;
																	FETCH x42 into :ldt_fecha_pago ;
																	
																	//-- JUAN
																	ll_mes_mant		= month(gd_fecha_prox_pago)
																	ll_day_mant			= day(gd_fecha_prox_pago)
																	ll_anno_mant		= year(gd_fecha_prox_pago)
																	SELECT 	"CADENA"."ESTADO_MORA_MANTENCION"  
																	INTO 		:ll_estado_mora_mant  
																	FROM 	"CADENA"  
																	WHERE 	"CADENA"."CODIGO" = :gs_base AND  
																				"CADENA"."SERIE" = :gs_serie AND  
																				"CADENA"."NUMERO" = :gi_numero
																	USING	sqlca;
																	if ll_estado_mora_mant = 2 then
																		ls_tipo_mant			= 'Anual'
																		ll_year_mant			= ll_anno_mant -1
																	elseif ll_estado_mora_mant	= 1 then
																		ls_tipo_mant			= 'Semestral'
																		if  ll_mes_mant <=6 then
																			ll_year_mant		= ll_anno_mant - 1
																		else
																			ll_year_mant		= ll_anno_mant
																		end if												
																	end if	
																	//--
																	ls_string_mant	= 'Mant.Pag.Año '+	string(ll_year_mant) +&
																	' F.Prox.Pago: '+string(gd_fecha_prox_pago ,"dd/mm/yyyy" )+'  ('+string(gdt_fec_sistema,"hh:mm")+')'
																	dw_impresion.object.cuota_mant.text		= ls_string_mant	
																end if
														END CHOOSE
													end if
												end if
											end if
											
											IF gs_rezago = "S" THEN 
	//											setnull(gs_nombre_completo);setnull(gs_contrato_rezago);setnull(gs_string_cli_rezago)
	//											Open(w_ingresar_nombre)
	
												IF gs_nombre_completo = "" or isnull(gs_nombre_completo) THEN
													Rollback using sqlca;
													OpenWithParm(w_observacion_no_grabar_comprobante,'N')
													Close(w_forma_pago2)
												END IF
												ls_doc					= gs_contrato_rezago
												ls_base_rez				= mid(gs_contrato_rezago,1,1)
												ls_serie_rez				= mid(gs_contrato_rezago,3,1)
												ll_numero_rez			= Double(mid(gs_contrato_rezago,5))
											ELSE
												ls_doc	= (gs_base+gs_serie+String(gi_numero))
											END IF
											if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" then
												SELECT 	"ENCARGADOS"."NOMBRE"  
												INTO 		:ls_nom_caj  
												FROM 	"ENCARGADOS"  
												WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
												if mid(ls_doc,1,1) = 'M' then
													dw_impresion.Retrieve(gl_folio,ls_doc,gi_rut,gf_obtener_dv(gi_rut),gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,ll_paga_con,ll_vuelto,'CX',ls_nom_caj)
												else
													dw_impresion.Retrieve(gl_folio,ls_doc,gi_rut,gf_obtener_dv(gi_rut),gs_nombre_completo,Date(gd_hoy),gd_uf,ll_monto_ef,ll_paga_con,ll_vuelto,ls_cod_pago,ls_nom_caj)
												end if
											end if
									END CHOOSE
									if isvalid(w_forma_pago2) then
										IF ls_cod_pago <> "CU" THEN
											if dw_impresion.rowcount()>0 then
												Net 		= 1
												if ls_cod_pago = 'CI' or ls_cod_pago = 'CX' then
													IF PrintSetup() <> -1 THEN
														SELECT	"CADENA"."COD_PARQUE"
														INTO 		:ll_cod_parque
														FROM 	"CADENA",	"CADENA_MORA"  
														WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
																  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
																  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
																  (("CADENA"."CODIGO" = :gs_base ) AND  
																  ( "CADENA"."SERIE" = :gs_serie ) AND  
																  ( "CADENA"."NUMERO" = :gi_numero ) )  
														USING	sqlca;
														if sqlca.sqlcode=0 then
															if gs_base='F' or gs_base='G' or gs_base='V' then
																if gs_conexion = 'Parque El Prado' then 
																	if gs_tipo_cobro_aux = 'BA' then
																		ll_cod_parque			= 142
																	else
																		ll_cod_parque			= 1
																	end if
																else
																	if gs_tipo_cobro_aux = 'BA' then
																		ll_cod_parque			= 142
																	else
																		ll_cod_parque			= 11
																	end if
																end if
																SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
																INTO 		:ls_rut_empresa,								:ls_razon_social
																FROM 	"MEMBRETE_EMPRESA"  
																WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	dw_impresion.object.t_razon_social.text		= ls_razon_social
																	dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
																end if
															else
																SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
																INTO 		:ls_rut_empresa,								:ls_razon_social
																FROM 	"MEMBRETE_EMPRESA"  
																WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	dw_impresion.object.t_razon_social.text		= ls_razon_social
																	dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
																end if
															end if
														else
															SELECT	"CD_FOLIO"."COD_PARQUE"  
															INTO 		:ll_cod_parque  
															FROM 	"CD_FOLIO"  
															WHERE	( "CD_FOLIO"."BASE" = :ls_base_rez ) AND  
																		( "CD_FOLIO"."SERIE" = :ls_serie_rez ) AND  
																		( "CD_FOLIO"."NUMERO" = :ll_numero_rez )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																if ll_cod_parque=0 or isnull(ll_cod_parque) then
																	if gs_conexion = 'Parque El Prado' then 
																		ll_cod_parque		= 1
																	else
																		ll_cod_parque		= 11
																	end if
																end if
																if ls_base_rez='F' or ls_base_rez='G' or ls_base_rez = 'V' then
																	if gs_conexion = 'Parque El Prado' then 
																		if gs_tipo_cobro_aux = 'BA' then
																			ll_cod_parque			= 142
																		else
																			ll_cod_parque			= 1
																		end if
																	else
																		if gs_tipo_cobro_aux = 'BA' then
																			ll_cod_parque			= 142
																		else
																			ll_cod_parque			= 11
																		end if
																	end if
																	SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
																	INTO 		:ls_rut_empresa,								:ls_razon_social
																	FROM 	"MEMBRETE_EMPRESA"  
																	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
																	USING	sqlca;
																	
																	if sqlca.sqlcode=0 then
																		dw_impresion.object.t_razon_social.text		= ls_razon_social
																		dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
																	end if
																else
																	SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
																	INTO 		:ls_rut_empresa,								:ls_razon_social
																	FROM 	"MEMBRETE_EMPRESA"  
																	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
																	USING	sqlca;
																	if sqlca.sqlcode=0 then
																		dw_impresion.object.t_razon_social.text		= ls_razon_social
																		dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
																	end if
																end if
															end if
														end if
														dw_impresion.Print()
														dw_impresion.Print()
													END IF
													MessageBox("Grabar", "Grabación Exitosa Documento " + ls_cod_pago +" Nº " +String(gl_folio))
													Net 							= 1
														
												end if
												IF Net = 1 THEN 
													commit using sqlca;
													commit using Trans_3;
													if ls_cod_pago = 'CI' or ls_cod_pago='CX' then
														INSERT INTO "PRODUCTO_INGRESO"  
																	( "BASE", 	"SERIE", 		"NUMERO", 		"TIPO_COB", 		"FOLIO", 		"FECHA_PAGO", 	"PAGO_HIST",	"MONTO",	"CAJA",		"USUARIO" )  
														VALUES 	( :gs_base,	:gs_serie,   	:gi_numero,   	:ls_cod_pago,   	:gl_folio,   	:gd_hoy,   			'A',				:gd_total,	:gs_caja,		:gs_user)  
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
															messagebox("Error Grabar","Error al Insertar en Tabla PRODUCTO_INGRESO "+sqlca.sqlerrtext)
														end if
														
														SELECT	"CADENA"."COD_PARQUE"
														INTO 		:ll_cod_parque
														FROM 	"CADENA",	"CADENA_MORA"  
														WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
																  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
																  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
																  (("CADENA"."CODIGO" = :gs_base ) AND  
																  ( "CADENA"."SERIE" = :gs_serie ) AND  
																  ( "CADENA"."NUMERO" = :gi_numero ) )  
														USING	sqlca;
														if sqlca.sqlcode <> 0 then
	//														gs_contrato_rezago 	= ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
															ls_base_rez				= mid(gs_contrato_rezago,1,1)
															ls_serie_rez				= mid(gs_contrato_rezago,3,1)
															ll_numero_rez			= Double(mid(gs_contrato_rezago,5))
															SELECT	"CD_FOLIO"."COD_PARQUE"  
															INTO 		:ll_cod_parque  
															FROM 	"CD_FOLIO"  
															WHERE	( "CD_FOLIO"."BASE" = :ls_base_rez ) AND  
																		( "CD_FOLIO"."SERIE" = :ls_serie_rez ) AND  
																		( "CD_FOLIO"."NUMERO" = :ll_numero_rez )   ;
															if ll_cod_parque=0 or isnull(ll_cod_parque) then
																if gs_conexion = 'Parque El Prado' then 
																	ll_cod_parque		= 1
																else
																	ll_cod_parque		= 11
																end if
															end if			
														end if 
														SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
														INTO 		:ls_rut_empresa
														FROM 	"MEMBRETE_EMPRESA"  
														WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
										
														SELECT	"ELECTRONICA_FB"."GRUPO"  
														INTO 		:ll_grupo  
														FROM 	"ELECTRONICA_FB"  
														WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_cod_pago ) AND  
																  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
										
														UPDATE		"ELECTRONICA_FB_DETALLE"  
														SET 			"ESTADO_REG" = 'G',   
																		"MONTO_AFECTO" = 0,   
																		"MONTO_EXENTO" = :gd_total,   
																		"MONTO_IVA" = 0,   
																		"MONTO_TOTAL" = :gd_total,   
																		"USUARIO_CREA" = :gs_user,   
																		"TIPO_DTE" = '38' ,
																		"ESTADO_DOCUMENTO" = '' ,
																		"TASA_IVA" = 0
														WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																																FROM 	  "ELECTRONICA_FB" 
																																WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																																			( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																																			( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_cod_pago ) ) ) AND  
																	  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_cod_pago ) AND  
																	  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
																	  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																		( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
																	  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
														USING		sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
															messagebox("Error al Grabar CI","Error al Grabar CI - SQL "+sqlca.sqlerrtext)
														end if
														if gi_numero > 0 then
															DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
															EXECUTE sp_nuevo_cadena_mora;
															if gs_base='M' then
																ll_tot_reg_mp			= dw_multiproducto.rowcount()
																if ll_tot_reg_mp > 0 then
																	for ll_indi_mp=1 to ll_tot_reg_mp
																		ls_tipo_mov_h	= dw_multiproducto.getitemstring(ll_indi_mp,'tipo_mov')
																		if ls_tipo_mov_h='E' or ls_tipo_mov_h='F' then
																			ls_ctto_h		= dw_multiproducto.getitemstring(ll_indi_mp,'contrato')
																			ls_base_h	= mid(ls_ctto_h,1,1)
																			ls_serie_h	= mid(ls_ctto_h,2,1)
																			ll_numero_h	= Double(mid(ls_ctto_h,3))
																			DECLARE sp_nuevo_cadena_mora_h3 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_h,:ls_serie_h,:ll_numero_h,'M');
																			EXECUTE sp_nuevo_cadena_mora_h3;
																			
																			DECLARE sp_actualizar_cuponeras_h3 PROCEDURE FOR sp_actualizar_cuponeras_1(:ls_base_h,:ls_serie_h,:ll_numero_h);
																			EXECUTE sp_actualizar_cuponeras_h3;
																		end if
																	next
																end if
															end if
														end if
													end if 
													w_ingreso2.dw_detalle_pago_cupon2.setSort("cuponeras_detalle_nro_cupon A")
													w_ingreso2.dw_detalle_pago_cupon2.sort()
													Commit using sqlca;
													
													
													wf_grabar_trans_abono_ok()
													SELECT	"FICHA_SEPULTACION"."IP"
													INTO 		:ls_tcp_ip  
													FROM 	"FICHA_SEPULTACION"  
													WHERE  ( "FICHA_SEPULTACION"."BASE" = :gs_base ) AND  
															 ( "FICHA_SEPULTACION"."SERIE" = :gs_serie ) AND  
															 ( "FICHA_SEPULTACION"."NUMERO" = :gi_numero ) AND 
															 ( "FICHA_SEPULTACION"."IP" = :gs_tcp_ip )  AND
															 ( "FICHA_SEPULTACION"."FOLIO_COMPROBANTE" is null or "FICHA_SEPULTACION"."FOLIO_COMPROBANTE" = 0 )
													USING		sqlca;
													if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
														UPDATE	"FICHA_SEPULTACION"  
														SET 		"FOLIO_COMPROBANTE" = :gl_folio,
																	"IP" = :ls_nulo
														WHERE 	"FICHA_SEPULTACION"."IP" = :ls_tcp_ip   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
														end if
													else
														SELECT	"FICHA_TRASLADO"."IP"
														INTO 		:ls_tcp_ip
														FROM 	"FICHA_TRASLADO"  
														WHERE  ( "FICHA_TRASLADO"."BASE_ORIGEN" = :gs_base ) AND  
																 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :gs_serie ) AND  
																 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :gi_numero ) AND  
																 ( "FICHA_TRASLADO"."IP" = :gs_tcp_ip )   AND
																 ( "FICHA_TRASLADO"."BOLETA_NRO_ORIGEN" is null or "FICHA_TRASLADO"."BOLETA_NRO_ORIGEN" = 0 )
														USING		sqlca;
														if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
															UPDATE	"FICHA_TRASLADO"  
															SET 		"BOLETA_NRO_ORIGEN" = :gl_folio,   
																		"IP" = :ls_nulo  
															WHERE  ( "FICHA_TRASLADO"."IP" = :ls_tcp_ip ) AND  
																	 ( "FICHA_TRASLADO"."BASE_ORIGEN" = :gs_base ) AND  
																	 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :gs_serie ) AND  
																	 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :gi_numero )   
															USING		sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														else
															SELECT	"FICHA_TRASLADO"."IP"
															INTO 		:ls_tcp_ip
															FROM 	"FICHA_TRASLADO"  
															WHERE  ( "FICHA_TRASLADO"."BASE_DESTINO" = :gs_base ) AND  
																	 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :gs_serie ) AND  
																	 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :gi_numero ) AND  
																	 ( "FICHA_TRASLADO"."IP" = :gs_tcp_ip )   AND
																	 ( "FICHA_TRASLADO"."BOLETA_NRO_DESTINO" is null or "FICHA_TRASLADO"."BOLETA_NRO_DESTINO" = 0 )
															USING		sqlca;
															if not isnull(ls_tcp_ip) and ls_tcp_ip<>'' then
																UPDATE	"FICHA_TRASLADO"  
																SET 		"BOLETA_NRO_DESTINO" = :gl_folio,   
																			"IP" = :ls_nulo  
																WHERE  ( "FICHA_TRASLADO"."IP" = :ls_tcp_ip ) AND  
																		 ( "FICHA_TRASLADO"."BASE_DESTINO" = :gs_base ) AND  
																		 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :gs_serie ) AND  
																		 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :gi_numero )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															end if
														end if
													end if
	//												if gs_tipo_cobro = "BL" or gs_tipo_cobro = "FE" or gs_tipo_cobro = "FA" then
	//		//											if isnull(gl_folio_comp) or gl_folio_comp=0 then
	//		//												gl_folio_comp																			= gl_folio
	//		//											end if
	//													if w_ingreso2.tab_ingreso.SelectedTab=4 then
	//														ll_fila																						= w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.getrow()
	//														w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.setitem(ll_fila,'nro_cupon',gl_folio)
	//														w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.setitem(ll_fila,'sw_factura','S')
	//														w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.accepttext()
	//														if w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.update() = 1 then
	//															commit;
	//															w_ingreso2.tab_ingreso.tp_porfacturar.cb_imprimir_factura.enabled	= false
	//															w_ingreso2.tab_ingreso.tp_porfacturar.dw_por_facturar.retrieve()
	//														else
	//															rollback;
	//														end if
	//													end if
	//												end if
	//												
													if ll_pasa_cupon>0 and isvalid(w_ingreso2) then
														ll_tot_fila_cupon				= w_ingreso2.dw_detalle_pago_cupon2.rowcount()
														DECLARE x1 CURSOR FOR  
														SELECT 	"DETALLE_CUPON_CI"."TIPO_MOV",   
																	"DETALLE_CUPON_CI"."NUM_CUPON"  
														FROM 	"DETALLE_CUPON_CI"  
														WHERE  ( "DETALLE_CUPON_CI"."TIPO_COB" = :ls_cod_pago ) AND  
																	( "DETALLE_CUPON_CI"."FOLIO" = :gl_folio )  
														USING		Trans_2;
														open x1;
														if Trans_2.sqlcode=0 then
															DO WHILE Trans_2.sqlcode=0
																fetch x1 into :ls_tipo_mov_reg, :ll_num_cupon_reg;
																if ll_num_cupon_reg>0 then
																	ll_fila_cupon			= w_ingreso2.dw_detalle_pago_cupon2.Find("cuponeras_detalle_nro_cupon = "+string(ll_num_cupon_reg), 1, ll_tot_fila_cupon)
																	if ll_fila_cupon>0 then
																		ll_monto_cta	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_cuota_peso")	
																		ll_monto_int 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_interes_mora")	
																		ll_monto_gc 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_gasto_cobranza")	
																		ll_n_cupon 		= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_nro_cupon")	
																	end if
																	UPDATE	"CUPONERAS_DETALLE"  
																	SET 		"TIPO_COB_PAGO" = :ls_cod_pago,   
																				"ESTADO_PAGO_CUPON" = 'C',
																				"FOLIO_PAGO" = :gl_folio,   
																				"FECHA_PAGO" = :idt_fecha_hoy,
																				"MONTO_CUOTA_PESO" = :ll_monto_cta,
																				"MONTO_INTERES_MORA" = :ll_monto_int,
																				"MONTO_GASTO_COBRANZA" = :ll_monto_gc
																	WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																			 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																			 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																			 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon_reg ) AND  
																			 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut )  
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
	
																	else
																		rollback;
																	end if
																end if
																setnull(ll_num_cupon_reg)
															LOOP
														end if
														close x1;
													else
														if w_ingreso2.tab_ingreso.SelectedTab = 1 then // cupon
															// nada
														elseif w_ingreso2.tab_ingreso.SelectedTab = 2 then //Comprobante Ingreso
															ll_tot_filas				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
															ll_reg_cred				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K' or tipo_cob = 'U'", 1, ll_tot_filas)
															if ll_reg_cred > 0 then
																ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg_cred, "cantidad") 
																for ll_indi=1 to ll_can_cta_cred
																	SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")
																	INTO 		:ldt_fecha_venc_min_e  
																	FROM 	"CUPONERAS_DETALLE",   
																				"CUPONERAS"  
																	WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
																			 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
																			 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
																			 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
																			 (("CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																			 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																			 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																			 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
																			 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
																			 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																			 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   )   
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
																		INTO 		:ll_num_cupon_reg  
																		FROM 	"CUPONERAS_DETALLE",   
																					"CUPONERAS"  
																		WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
																				 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
																				 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
																				 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
																				 (("CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																				 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																				 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
																				 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
																				 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_min_e) and
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   )   
																		USING		sqlca;
																		if ll_num_cupon_reg > 0 then
																			ll_fila_cupon			= w_ingreso2.dw_detalle_pago_cupon2.Find("cuponeras_detalle_nro_cupon = "+string(ll_num_cupon_reg), 1, ll_tot_filas)
																			if ll_fila_cupon>0 then
																				ll_monto_cta	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_cuota_peso")	
																				ll_monto_int 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_interes_mora")	
																				ll_monto_gc 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_gasto_cobranza")	
																				ll_n_cupon 		= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_nro_cupon")	
																				ldt_fecha_venc	= w_ingreso2.dw_detalle_pago_cupon2.GetItemDatetime(ll_fila_cupon, 'cuponeras_detalle_fecha_venc')
																				ls_tipo_mov_p	= w_ingreso2.dw_detalle_pago_cupon2.GetItemString(ll_fila_cupon, 'cuponeras_detalle_tipo_mov')
																			end if
																			UPDATE	"CUPONERAS_DETALLE"  
																			SET 		"TIPO_COB_PAGO" = :ls_cod_pago,   
																						"FOLIO_PAGO" = :gl_folio,   
																						"FECHA_PAGO" = :ldt_fecha_pago,   
																						"ESTADO_PAGO_CUPON" = 'C',
																						"MONTO_CUOTA_PESO" = :ll_monto_cta,
																						"MONTO_INTERES_MORA" = :ll_monto_int,
																						"MONTO_GASTO_COBRANZA" = :ll_monto_gc
																			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																					 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																					 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_min_e ) AND  
																					 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon_reg ) and
																					 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
//																					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
																			USING		sqlca;
																			if sqlca.sqlcode=0 then
																				commit;
																			else
																				rollback;
																			end if
																			if ls_tipo_mov_p='E' or ls_tipo_mov_p='U' then
																				UPDATE	"PAT_DETALLE"  
																				SET 		"ESTADO_REG" = 'C',   
																							"FECHA_PAGO" = :idt_fecha_hoy,   
																							"CAJA_PAGO" = :gs_caja,   
																							"USUARIO_PAGO" = :gs_user  
																				WHERE  ( "PAT_DETALLE"."BASE" = :gs_base ) AND  
																						 ( "PAT_DETALLE"."SERIE" = :gs_serie ) AND  
																						 ( "PAT_DETALLE"."NUMERO" = :gi_numero ) AND  
																						 ( "PAT_DETALLE"."FECHA_VENC" = :ldt_fecha_venc ) AND  
																						 ( "PAT_DETALLE"."TIPO_MOV" = 'E' )   
																				USING		sqlca;
																				if sqlca.sqlcode=0 then
																					commit;
																				else
																					rollback;
																				end if
																			end if
																		end if
																	end if
																next
															end if
	//														
															ll_reg_mant				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'F' ", 1, ll_tot_filas)
															if ll_reg_mant>0 then
																ll_can_cta_mant	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg_mant, "cantidad") 
																for ll_indi=1 to ll_can_cta_mant
																	SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")
																	INTO 		:ldt_fecha_venc_min_e  
																	FROM 	"CUPONERAS_DETALLE",   
																				"CUPONERAS"  
																	WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
																			 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
																			 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
																			 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
																			 (("CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																			 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																			 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																			 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
																			 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
																			 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																			 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   )   
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
																		INTO 		:ll_num_cupon_reg  
																		FROM 	"CUPONERAS_DETALLE",   
																					"CUPONERAS"  
																		WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
																				 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
																				 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
																				 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
																				 (("CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																				 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																				 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
																				 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
																				 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_min_e) and
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   )   
																		USING		sqlca;
																		if ll_num_cupon_reg > 0 then
																			ll_fila_cupon	= w_ingreso2.dw_detalle_pago_cupon2.Find("cuponeras_detalle_nro_cupon = "+string(ll_num_cupon_reg), 1, ll_tot_filas)
																			if ll_fila_cupon>0 then
																				ll_monto_cta	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_cuota_peso")	
																				ll_monto_int 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_interes_mora")	
																				ll_monto_gc 	= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_monto_gasto_cobranza")	
																				ll_n_cupon 		= w_ingreso2.dw_detalle_pago_cupon2.GetItemNumber(ll_fila_cupon, "cuponeras_detalle_nro_cupon")	
																				ldt_fecha_venc	= w_ingreso2.dw_detalle_pago_cupon2.GetItemDatetime(ll_fila_cupon, 'cuponeras_detalle_fecha_venc')
																				ls_tipo_mov_p	= w_ingreso2.dw_detalle_pago_cupon2.GetItemString(ll_fila_cupon, 'cuponeras_detalle_tipo_mov')
																			end if
																			UPDATE	"CUPONERAS_DETALLE"  
																			SET 		"TIPO_COB_PAGO" = :ls_cod_pago,   
																						"FOLIO_PAGO" = :gl_folio,   
																						"FECHA_PAGO" = :ldt_fecha_pago,   
																						"ESTADO_PAGO_CUPON" = 'C',
																						"MONTO_CUOTA_PESO" = :ll_monto_cta,
																						"MONTO_INTERES_MORA" = :ll_monto_int,
																						"MONTO_GASTO_COBRANZA" = :ll_monto_gc
																			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																					 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																					 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_min_e ) AND  
																					 ( "CUPONERAS_DETALLE"."RUT" = :gi_rut ) AND
//																					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
																					 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon_reg ) AND
																					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
																			USING		sqlca;
																			if sqlca.sqlcode=0 then
																				commit;
																			else
																				rollback;
																			end if
																			
																			if ls_tipo_mov_p='F' then
																				UPDATE	"PAT_DETALLE"  
																				SET 		"ESTADO_REG" = 'C',   
																							"FECHA_PAGO" = :idt_fecha_hoy,   
																							"CAJA_PAGO" = :gs_caja,   
																							"USUARIO_PAGO" = :gs_user  
																				WHERE  ( "PAT_DETALLE"."BASE" = :gs_base ) AND  
																						 ( "PAT_DETALLE"."SERIE" = :gs_serie ) AND  
																						 ( "PAT_DETALLE"."NUMERO" = :gi_numero ) AND  
																						 ( "PAT_DETALLE"."FECHA_VENC" = :ldt_fecha_venc ) AND  
																						 ( "PAT_DETALLE"."TIPO_MOV" = 'F' )   
																				USING		sqlca;
																				if sqlca.sqlcode=0 then
																					commit;
																				else
																					rollback;
																				end if
																			end if
																		end if
																	end if
																next
															end if
														end if
													end if
	//												
													w_ingreso2.dw_detalle_pago_cupon2.setSort("cuponeras_detalle_fecha_venc A")
													w_ingreso2.dw_detalle_pago_cupon2.sort()
													gs_grabar_pie		= 'S'
													//Sale de la ventana
													IF gs_rezago = "S" THEN 
														ll_rut 				= long(substr(1,1,gs_string_cli_rezago))
														ls_dv				= substr(1,2,gs_string_cli_rezago)
														ls_nombre		= substr(1,3,gs_string_cli_rezago)
														ls_ap_pat		= substr(1,4,gs_string_cli_rezago)
														ls_ap_mat		= substr(1,5,gs_string_cli_rezago)
														ls_direc			= substr(1,6,gs_string_cli_rezago)
														ls_ciudad			= substr(1,7,gs_string_cli_rezago)
														ls_comuna		= substr(1,8,gs_string_cli_rezago)
														ls_fono			= substr(1,9,gs_string_cli_rezago)
														ls_base			= substr(1,10,gs_string_cli_rezago)
														ls_serie			= substr(1,11,gs_string_cli_rezago)
														ll_numero		= double(substr(1,12,gs_string_cli_rezago))
														ll_cod_parque	= long(substr(1,13,gs_string_cli_rezago))
														ls_moneda		=  substr(1,14,gs_string_cli_rezago)
														ld_fecha			= idt_fecha_hoy
														
														SELECT DISTINCT "CLIENTE_REZAGO"."NRO_CLIENTE_SAP"  
														INTO 			:ls_cliente_sap  
														FROM 		"CLIENTE_REZAGO"  
														WHERE 		"CLIENTE_REZAGO"."RUT" = :ll_rut
														USING		sqlca;
														if not isnull(ls_cliente_sap) and len(ls_cliente_sap) > 0 then
															INSERT INTO "CLIENTE_REZAGO"  
																	 ( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		 "FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO",		"COD_PARQUE",	"MONEDA",	"NRO_CLIENTE_SAP",		"ESTADO_SAP",	"FECHA_SAP")  
															VALUES ( :ll_rut, :ls_base, :ls_serie, :ll_numero, :ls_nombre, :ls_ap_pat,   	 :ls_ap_mat,     :ls_direc,   		 :ls_comuna,   	:ls_ciudad,   	  :ls_fono,   		   :ld_fecha,   	 :gs_user,    :ls_dv, 	:ls_cod_pago, :gl_folio,	:gs_caja,'A',			:ldt_fecha_pago,	:ll_cod_parque,		:ls_moneda,		:ls_cliente_sap,				1,						:gdt_fec_sistema)  
															USING		sqlca;
														else
															INSERT INTO "CLIENTE_REZAGO"  
																	 	( "RUT",   "BASE",   "SERIE",   "NUMERO",   "NOMBRE",   "AP_PATERNO",   "AP_MATERNO",   "DIRECCION_PART",   "COMUNA_PART",   "CIUDAD_PART",   "TELEFONO_PART",   "FECHA_CREA",   "USUARIO",   "DV" ,		"COD_PAGO",		 "FOLIO",	"CAJA",	"ESTADO",	"FECHA_PAGO",		"COD_PARQUE",	"MONEDA")  
															VALUES 	( :ll_rut, :ls_base, :ls_serie, :ll_numero, :ls_nombre, :ls_ap_pat,   	 :ls_ap_mat,     :ls_direc,   		 :ls_comuna,   	:ls_ciudad,   	  :ls_fono,   		   :ld_fecha,   	 :gs_user,    :ls_dv, 	:ls_cod_pago, :gl_folio,	:gs_caja,'A',			:ldt_fecha_pago,	:ll_cod_parque,		:ls_moneda)  
															USING		sqlca;
														end if
														
														if sqlca.sqlcode=0 then
															commit;
															UPDATE		"INGRESO"  
															SET 			"BASE" = :ls_base,   
																			"SERIE" = :ls_serie,
																			"COD_PARQUE" = :ll_cod_parque
															WHERE	  ( "INGRESO"."FOLIO" = :gl_folio ) AND  
																		  ( "INGRESO"."TIPO_COB" = :ls_cod_pago ) AND  
																		  ( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago )  
															USING		sqlca;
															if sqlca.sqlcode=0 then
																commit;
																UPDATE		"INGRE"  
																SET 			"BASE" = :ls_base,   
																				"SERIE" = :ls_serie,
																				"COD_PARQUE" = :ll_cod_parque  
																WHERE	  ( "INGRE"."FOLIO" = :gl_folio ) AND  
																			  ( "INGRE"."TIPO_COB" = :ls_cod_pago ) AND  
																			  ( "INGRE"."FECHA_PAGO" = :ldt_fecha_pago )  
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															else
																rollback;
															end if
			
															if ll_cod_parque > 0 then
																SELECT	"CD_FOLIO"."COD_PARQUE"  
																INTO 		:ll_cod_parque_aux  
																FROM 	"CD_FOLIO"  
																WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
																		 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																		 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	if ll_cod_parque_aux <> ll_cod_parque then
																		UPDATE	"CD_FOLIO"  
																		SET 		"COD_PARQUE" = :ll_cod_parque,
																					"SERIE" = :ls_serie
																		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
																				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																				 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
																		USING	sqlca;
																		if sqlca.sqlcode=0 then
																			commit;
																			UPDATE		"CD_FOLIO_DETALLE"  
																			SET 			"COD_PARQUE" = :ll_cod_parque ,
																							"SERIE" = :ls_serie
																			WHERE 	  ( "CD_FOLIO_DETALLE"."BASE" = :ls_base ) AND  
																						  ( "CD_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND  
																						  ( "CD_FOLIO_DETALLE"."NUMERO" = :ll_numero )   
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
																end if
															end if
														else
															rollback;
//															messagebox("Error","Error al Grabar Cliente Rezago SQL: "+SQLCA.SQLErrText )
														end if
													end if
													
													if w_ingreso2.tab_ingreso.SelectedTab=2 and (gs_base='O' or gs_base='M' or gs_base='U' or gs_base='L' or gs_base='A' or gs_base='F' or gs_base='G' or gs_base='V') then
														FOR ll_indi = 1 TO ll_tot_reg
															ls_tipo_pago 		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
															ll_monto_pagado	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemnumber(ll_indi, "c_total_linea")
															ldb_monto_uf		= round((w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemnumber(ll_indi, "c_total_linea") / gd_uf_dia),4)
															if w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.dataobject='d_datos_cuenta_ci_funeraria' and w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()> 0 then
																ll_plazo			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
															end if
//															if ll_plazo = 1 and gs_base='G' then
//																UPDATE 	"CADENA"  
//																SET 		"ESTADO" = 'C'  
//																WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
//																		 ( "CADENA"."SERIE" = :gs_serie ) AND  
//																		 ( "CADENA"."NUMERO" = :gi_numero )   
//																USING		sqlca;
//																if sqlca.sqlcode=0 then
//																	commit;
//																else
//																	rollback;
//																end if
//															end if
															if ls_tipo_pago='K' then
																UPDATE 	"CADENA"  
																SET 		"ESTADO" = 'V'  
																WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
																		 ( "CADENA"."SERIE" = :gs_serie ) AND  
																		 ( "CADENA"."NUMERO" = :gi_numero )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																	UPDATE 	"CUPONERAS_DETALLE"  
																	SET 		"ESTADO_PAGO_CUPON" = 'C',   
																				"TIPO_COB_PAGO" = :ls_cod_pago,
																				"FOLIO_PAGO" = :gl_folio,   
																				"FECHA_PAGO" = :ldt_fecha_pago,   
																				"MONTO_CUOTA_PESO" = :ll_monto_pagado  
																	WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																				( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																				( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																				( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
																				( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																	end if
																else
																	rollback;
																end if
																exit;
															elseif ls_tipo_pago='A' or ls_tipo_pago='Q' then
																if gs_rezago='S' then
																	SELECT	"CLIENTE_REZAGO"."BASE",   
																				"CLIENTE_REZAGO"."SERIE",   
																				"CLIENTE_REZAGO"."NUMERO"  
																	INTO 		:ls_base,   
																				:ls_serie,   
																				:ll_numero  
																	FROM 	"CLIENTE_REZAGO"  
																	WHERE  ( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
																			 ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_cod_pago ) AND  
																			 ( "CLIENTE_REZAGO"."FOLIO" = :gl_folio )   
																	USING		sqlca;
																else
																	ls_base		= gs_base
																	ls_serie		= gs_serie
																	ll_numero	= gi_numero
																end if
																INSERT INTO "DETALLE_PAGO_PIE_COMPROBANTE"  
																			( "TIPO_COB",		"FOLIO",		"RUT",	"FECHA_PAGO",		"BASE",		"SERIE",		"NUMERO",	"CAJA",		"USUARIO",	"MONTO_CANCELADO",	"REZAGO",	"MONTO_CANCELADO_UF" )  
																VALUES 	( :ls_cod_pago,		:gl_folio,	:gi_rut,	:ldt_fecha_pago,	:ls_base,	:ls_serie,	:ll_numero,	:gs_caja,	:gs_user,	:ll_monto_pagado,	:gs_rezago,		:ldb_monto_uf )  
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
																exit;
															end if
														next
													end if
													MessageBox("Grabar", "Grabación Exitosa Comprobante " + ls_cod_pago +" Nº " +String(gl_folio))

													
													wf_desactiva_descuento()
													
													
													f_inicializa_ingreso(gs_tipo_cobro)
													wf_limpiar_ventana_anterior_ingreso()
													Close(w_forma_pago2)
													//MessageBox("Grabar", "Imprimió correctamente el documento " + gs_tipo_cobro +" Nº " +String(gl_folio) +" ?", Exclamation!, YesNo!, 2)
													
													// Se elimina codigo Mirko 04/03/2024
//												ELSEIF Net = 2 THEN 
//													Rollback using sqlca;
//													Rollback using Trans_3;
//													OpenWithParm(w_observacion_no_grabar_comprobante,'S')
//				//									wf_limpiar_ventana_anterior_ingreso()
//													Close(w_forma_pago2)
												END IF
											end if
										END IF
									end if
								else
									if ll_fila_ea > 0 and gs_base <> 'L' then
										w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked		= true
										w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.triggerevent(clicked!)
									end if
									Close(w_forma_pago2)
								end if

							elseIF Net = 2 THEN 
								
								rollback using sqlca;
								rollback using Trans_3;
								OpenWithParm(w_observacion_no_grabar_comprobante,'N')
								Close(w_forma_pago2)
							END IF
						end if
					end if
				end if
			end if
		else
			messagebox("Advertencia","Debe estar Abierta la Ventana Ingreso de Caja")
		end if
	end if
end if
SetPointer ( Arrow! )
end event

type st_eliminar_tarjeta_cred from statictext within w_forma_pago2
boolean visible = false
integer x = 2729
integer y = 1224
integer width = 247
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_sumar
IF tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetRow() >0 THEN
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.DeleteRow(tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetRow())
	ll_sumar								= long(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text) - 1
	tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text	= string(ll_sumar)
END IF
end event

type st_insertar_tar_cred from statictext within w_forma_pago2
boolean visible = false
integer x = 2729
integer y = 1144
integer width = 233
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Insertar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long		ll_monto, ll_total,fila, n_cheques, i,ll_day,ll_month,ll_year
double	ll_efectivo=0, ll_saldo=0,id_saldo
Date		ld_fecha_vcto
String	ls_fecha,ls_pasa
DataWindowChild	dwch_tipo_tarjeta
n_cheques					= LONG(tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text)
//IF gs_tipo_cobro = "CU" THEN n_cheques = 1
IF n_cheques > 0 THEN
	// SI existían Cuotas, deben ser borrados
	il_sw_pasa_credito=0
	IF tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.RowCount() > 0 THEN
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
	END IF
	ld_fecha_vcto			= DATE(fechasys)
	ll_day					= day(ld_fecha_vcto)
	ll_month					= month(ld_fecha_vcto)
	ll_year					= year(ld_fecha_vcto)
	if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
		(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
		(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
		(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
		ls_pasa				= 'S'
	else
		ls_pasa				= 'N'
	end if
	FOR i = 1 TO n_cheques
		fila						= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.InsertRow(0)
		if n_cheques=1 then 
			if long(st_saldo.text)>=0 and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()=0 then
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "monto", long(st_total.text) - long(st_saldo.text))
			else
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "monto", long(st_total.text))
			end if
			il_valor_credito	= gd_total
		end if
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "cod_caja", gs_caja)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "cod_pago", "TC")
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "tipo_cob", gs_tipo_cobro)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, 'nro_cuotas_credito', i)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "rezago", gs_rezago)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "folio", gl_folio)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "fecha_venc", ld_fecha_vcto)
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "fecha_pago", idt_fecha_hoy)
		if tab_1.tabpage_credito.rb_empresa_1.checked=true then
			if mid(trim(tab_1.tabpage_credito.rb_empresa_1.text),1,1)='A' then
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "tipo_cob_aux",'BE')		//BL
			else
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "tipo_cob_aux",'BE')		// CI
			end if
		elseif tab_1.tabpage_credito.rb_empresa_2.checked=true then
			if mid(trim(tab_1.tabpage_credito.rb_empresa_2.text),1,1)='A' then
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "tipo_cob_aux",'BE')		//BL
			else
				tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.SetItem(fila, "tipo_cob_aux",'BE')		//CI
			end if
		end if
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
//		ll_day					= day(idt_fecha_hoy)
//		ll_month					= month(ld_fecha_vcto)
//		ll_year					= year(ld_fecha_vcto)
//		ll_month	++
//		if (ll_month=1 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=2 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 28
//		elseif (ll_month=3 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=4 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=5 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=6 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=7 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=8 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=9 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=10 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=11 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=12 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		end if
//		if ll_month>12 then
//			ll_year ++
//			ll_month		= 1
//			if (ll_month=1 and ls_pasa='S') then
//				ls_pasa	= 'S'
//				ll_day	= 31
//			end if
//		end if
		ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
		ld_fecha_vcto			= date(ls_fecha)
	NEXT
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.accepttext()
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.scrolltorow(1)
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setcolumn('cod_tarjeta_credito')
END IF
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.AcceptText()
wf_recalcular_valores()
end event

type st_correlativo_cheque from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2743
integer y = 764
integer width = 485
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Numerar Registros"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_mousemove;wf_mover_dw()
end event

event clicked;long 		ll_banco, ll_n_cheque,i,ll_total,ll_tot_reg,ll_monto_cheque,ll_cantidad,&
			ll_val_real,ll_valor_final
string 	ls_n_cheque
double 	ll_efectivo=0, ll_saldo=0,id_saldo
tab_1.tabpage_cheque.dw_detalle_pago_1.AcceptText()
ll_tot_reg				= tab_1.tabpage_cheque.dw_detalle_pago_1.RowCount()
ll_cantidad				= long(tab_1.tabpage_cheque.em_cantidad_1.text)
IF ll_tot_reg > 1 THEN
	ll_banco 			= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1, "cod_banco")
	ll_n_cheque 		= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1, "n_cheque")
	ll_total				= tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1, "monto")
	il_valor_cheque	= ll_total
	ll_monto_cheque 	= truncate(ll_total / ll_cantidad, 0)
	ll_val_real			= ll_monto_cheque * ll_cantidad
	ll_valor_final		= ll_total - ll_val_real
	tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(1,"monto", ll_monto_cheque)
	tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(1,"cod_banco",ll_banco)
	FOR i = 2 TO ll_tot_reg
		if ll_valor_final>0 and i=ll_tot_reg then
			tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(i,"monto", ll_monto_cheque + ll_valor_final)
		else
			tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(i,"monto", ll_monto_cheque)
		end if
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(i,"cod_banco",ll_banco)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(i,"n_cheque", (ll_n_cheque + i - 1))
	NEXT
END IF
tab_1.tabpage_cheque.dw_detalle_pago_1.AcceptText()
wf_recalcular_valores()
end event

type st_eliminar_cheque from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2747
integer y = 684
integer width = 247
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_mousemove;wf_mover_dw()
end event

event clicked;Long	ll_sumar
IF tab_1.tabpage_cheque.dw_detalle_pago_1.GetRow() >0 THEN
	tab_1.tabpage_cheque.dw_detalle_pago_1.DeleteRow(tab_1.tabpage_cheque.dw_detalle_pago_1.GetRow())
	ll_sumar				= long(tab_1.tabpage_cheque.em_cantidad_1.text) - 1
	tab_1.tabpage_cheque.em_cantidad_1.text	= string(ll_sumar)
END IF
end event

type st_insertar_cheque from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2743
integer y = 612
integer width = 233
integer height = 56
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 33554431
string text = "Insertar"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_mousemove;wf_mover_dw()
end event

event clicked;long		ll_monto, ll_total,fila, n_cheques,i,ll_dias,ll_day,ll_month,ll_year,ll_suma_final,ll_suma_total,&
			ll_suma_saldo
double	ll_efectivo=0, ll_saldo=0,id_saldo
Date		ld_fecha_vcto,ld_fecha_cheque_prim
String	ls_fecha,ls_tipo_cob_aux,ls_pasa

n_cheques						= LONG(tab_1.tabpage_cheque.em_cantidad_1.text)
ls_pasa							= 'N'
IF gs_tipo_cobro = "CU" THEN n_cheques = 1
IF n_cheques > 0 THEN
	// SI existían cheques, deben ser borrados
	il_sw_pasa_cheque=0
	IF tab_1.tabpage_cheque.dw_detalle_pago_1.RowCount() > 0 THEN
		tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
	END IF
	if tab_1.tabpage_cheque.rb_ch_dia.checked=true then
		ld_fecha_cheque_prim	= idt_fecha_hoy
	elseif tab_1.tabpage_cheque.rb_ch_30_dias.checked=true then
		ll_day					= day(idt_fecha_hoy)
		ll_month					= month(idt_fecha_hoy)
		ll_year					= year(idt_fecha_hoy)
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
		ld_fecha_cheque_prim	= date(ls_fecha)
	elseif tab_1.tabpage_cheque.rb_otra_fecha_ch.checked=true then
		ll_dias					= long(tab_1.tabpage_cheque.em_dias_cheque.text)
		ld_fecha_cheque_prim	= RelativeDate(idt_fecha_hoy, ll_dias)
	end if
	ld_fecha_cheque_prim		= date(datetime(ld_fecha_cheque_prim,time('00:00:00')))
	ls_tipo_cob_aux				= st_tipo_cobro.text
	if tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '1' or &
		tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '2' or &
		tab_1.tabpage_cheque.dw_empresa_1.getitemstring(1,'codigo_empresa') = '6' then //Administradora
//		ls_tipo_cob_aux		= 'BL'
	else // Inmobiliaria
//		ls_tipo_cob_aux		= 'CI'
	end if
	ll_day					= day(ld_fecha_cheque_prim)
	ll_month					= month(ld_fecha_cheque_prim)
	ll_year					= year(ld_fecha_cheque_prim)
	if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
		(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
		(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
		(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
		ls_pasa	= 'S'
	else
		ls_pasa	= 'N'
	end if
	FOR i = 1 TO n_cheques
		fila		= tab_1.tabpage_cheque.dw_detalle_pago_1.InsertRow(0)
		tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(fila)
		if n_cheques=1 then
			ll_suma_total		= long(st_total.text)
			ll_suma_saldo		= long(st_saldo.text)
			ll_suma_final		= ll_suma_total - ll_suma_saldo
			tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "monto",ll_suma_final)
			il_valor_cheque	= ll_suma_final //gd_total
		end if
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "cod_caja", gs_caja)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "cod_pago", "CH")
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "tipo_cob", gs_tipo_cobro)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "rezago", gs_rezago)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "folio", gl_folio)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "fecha_venc",ld_fecha_cheque_prim)
		tab_1.tabpage_cheque.dw_detalle_pago_1.setitem(fila, "tipo_cob_aux",ls_tipo_cob_aux)
		ll_day					= day(idt_fecha_hoy)//ld_fecha_cheque_prim)
		ll_month					= month(ld_fecha_cheque_prim)
		ll_year					= year(ld_fecha_cheque_prim)
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
//		if (ll_month=1 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=2 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 28
//		elseif (ll_month=3 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=4 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=5 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=6 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=7 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=8 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=9 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=10 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		elseif (ll_month=11 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 30
//		elseif (ll_month=12 and ls_pasa='S') then
//			ls_pasa	= 'S'
//			ll_day	= 31
//		end if
//		if ll_month>12 then
//			ll_year ++
//			ll_month		= 1
//			if (ll_month=1 and ls_pasa='S') then
//				ls_pasa	= 'S'
//				ll_day	= 31
//			end if
//		end if
		ls_fecha					= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
		ld_fecha_cheque_prim	= date(ls_fecha)
		tab_1.tabpage_cheque.dw_detalle_pago_1.SetItem(fila, "fecha_pago", idt_fecha_hoy)
		tab_1.tabpage_cheque.dw_detalle_pago_1.accepttext()
	NEXT
	tab_1.tabpage_cheque.dw_detalle_pago_1.accepttext()
	tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
	tab_1.tabpage_cheque.dw_detalle_pago_1.scrolltorow(1)
	tab_1.tabpage_cheque.dw_detalle_pago_1.setcolumn('n_cheque')
END IF
tab_1.tabpage_cheque.dw_detalle_pago_1.AcceptText()
wf_recalcular_valores()
end event

type cbx_tarjeta_debito from checkbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1495
integer y = 288
integer width = 535
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Tarjeta DEBITO"
end type

event clicked;Long	fila,ll_efectivo,ll_total
sle_paga_con.text																	= ''
sle_vuelto.text																		= ''
tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.enabled 		= cbx_tarjeta_debito.checked
tab_1.tabpage_debito.enabled													= cbx_tarjeta_debito.checked
if cbx_tarjeta_debito.checked=true then
	if st_tipo_cobro.text='BL' then
		if mid(tab_1.tabpage_debito.rb_empresa_3.text,1,1)='A' then
			tab_1.tabpage_debito.rb_empresa_3.checked					= true
			tab_1.tabpage_debito.rb_empresa_4.checked					= false
		end if
	else
		if mid(tab_1.tabpage_debito.rb_empresa_3.text,1,1)='A' then
			tab_1.tabpage_debito.rb_empresa_3.checked					= false
			tab_1.tabpage_debito.rb_empresa_4.checked					= true
		end if
	end if
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.reset()
	fila																			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.insertrow(0)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "cod_caja", gs_caja)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "cod_pago", "TD")
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "tipo_cob", gs_tipo_cobro)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "rezago", gs_rezago)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "folio", gl_folio)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "fecha_venc", idt_fecha_hoy)
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "fecha_pago", idt_fecha_hoy)
	tab_1.SelectedTab															= 3
	if cbx_efectivo.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo																= long(sle_efectivo.text)
		em_saldo.text															= string(ll_efectivo,"###,###,###,##0")
		sle_efectivo.text														= '0'
	elseif cbx_credito.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo																= long(sle_efectivo.text)
		em_saldo.text															= string(ll_efectivo,"###,###,###,##0")
		sle_efectivo.text														= '0'
	else
		ll_efectivo																= long(sle_efectivo.text)
		ll_total																	= long(st_total.text)
		if ll_efectivo = ll_total then
			em_saldo.text														= string(ll_total - il_abono,"###,###,###,##0")
			sle_efectivo.text													= '0'
		end if
	end if
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_tarjeta_debito')
else
	wf_valida_opciones_pago()
	tab_1.tabpage_debito.rb_empresa_3.checked							= false
	tab_1.tabpage_debito.rb_empresa_4.checked							= false
	tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.reset()
	if cbx_tarjeta_credito.checked=true then
		tab_1.SelectedTab														= 2
		tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
	elseif cbx_cheque.checked=true then
		tab_1.SelectedTab														= 1
		tab_1.tabpage_cheque.em_cantidad_1.setfocus()
	elseif cbx_efectivo.checked=true then
		sle_paga_con.setfocus()
	elseif cbx_credito.checked=true then
		sle_paga_con.setfocus()
	end if
end if
end event

type dw_impresion from datawindow within w_forma_pago2
boolean visible = false
integer x = 3483
integer y = 276
integer width = 389
integer height = 584
boolean titlebar = true
string dataobject = "d_rep_ci_form_nuevo"
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type sle_efectivo from editmask within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2560
integer y = 228
integer width = 594
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##,###,##0"
string displaydata = ""
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event modified;Long	ll_efectivo,ll_saldo,ll_diferencia,ll_abono

ll_efectivo				= long(this.text)
ll_abono					= long(st_saldo.text)
ll_saldo					= gd_total - ll_abono
ll_diferencia				= ll_saldo - ll_efectivo
if ll_efectivo > ll_saldo then
	messagebox("Advertencia","Monto Ingresado No puede ser Mayor a $ "+string(ll_saldo,"###,###,###,###,##0")+", existe diferencia de $ "+string(ll_diferencia,"###,###,###,###,##0"))
	sle_efectivo.text	= '0'
	em_saldo.text		= string(ll_saldo,"###,###,###,###,##0")
//	sle_efectivo.setfocus()
elseif ll_efectivo < ll_saldo then
	messagebox("Advertencia","Existe Diferencia de $ "+string(ll_diferencia,"###,###,###,###,##0"))
	sle_efectivo.text	= '0'
	em_saldo.text		= string(ll_saldo,"###,###,###,###,##0")
//	sle_efectivo.setfocus()
else
	wf_recalcular_valores()
end if
end event

type cbx_cheque from checkbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 128
integer y = 288
integer width = 453
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "CHEQUE"
end type

event clicked;Long	ll_efectivo,ll_total
sle_paga_con.text												= ''
sle_vuelto.text													= ''
st_insertar_cheque.enabled									= cbx_cheque.checked
st_eliminar_cheque.enabled 								= cbx_cheque.checked
st_correlativo_cheque.enabled 								= cbx_cheque.checked
tab_1.tabpage_cheque.em_cantidad_1.enabled 		= cbx_cheque.checked
tab_1.tabpage_cheque.dw_detalle_pago_1.enabled 	= cbx_cheque.checked
tab_1.tabpage_cheque.enabled								= cbx_cheque.checked
tab_1.tabpage_cheque.dw_empresa_1.enabled 		= cbx_cheque.checked
tab_1.tabpage_cheque.dw_empresa_2.enabled 		= cbx_cheque.checked
if cbx_cheque.checked=false then
	wf_valida_opciones_pago()
	tab_1.tabpage_cheque.dw_empresa_1.reset()
	tab_1.tabpage_cheque.dw_empresa_2.reset()
	tab_1.tabpage_cheque.dw_empresa_1.insertrow(0)
	tab_1.tabpage_cheque.dw_empresa_2.insertrow(0)
	if trim(st_tipo_cobro.text)='BL' then
		if gs_conexion = "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','6')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','6')
		else
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','1')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','1')
		end if
		dwch_empresa2.retrieve()
	else
		if gs_conexion = "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','5')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','5')
		elseif gs_conexion = "Parque El Prado" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','3')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','3')
		elseif gs_conexion = "Parque La Foresta" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','4')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','4')
		end if
		dwch_empresa2.retrieve()
	end if
	tab_1.tabpage_cheque.em_cantidad_1.text			= '0'
	tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
	tab_1.tabpage_cheque.em_dias_cheque.text		= ''
	if cbx_tarjeta_debito.checked=true then
		tab_1.SelectedTab										= 3
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
	elseif cbx_tarjeta_credito.checked=true then
		tab_1.SelectedTab										= 2
		tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
	elseif cbx_efectivo.checked=true then
		sle_paga_con.setfocus()
	elseif cbx_credito.checked=true then
		sle_paga_con.setfocus()
	else
		pb_grabar.setfocus()
	end if
else
	tab_1.SelectedTab											= 1
	tab_1.tabpage_cheque.rb_ch_dia.setfocus()
	
	if trim(st_tipo_cobro.text)='BL' then
		if gs_conexion = "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','6')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','6')
		else
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','1')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','1')
		end if
	else
		if gs_conexion	= "Parque El Prado" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','3')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','3')
		elseif gs_conexion = "Parque La Foresta" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','4')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','4')
		elseif gs_conexion = "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_1.setitem(1,'codigo_empresa','5')
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','5')
		end if
	end if
	if cbx_efectivo.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo			= long(sle_efectivo.text)
		em_saldo.text		= string(ll_efectivo - il_abono,"###,###,###,##0")
		sle_efectivo.text	= '0'
	elseif cbx_credito.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo			= long(sle_efectivo.text)
		em_saldo.text		= string(ll_efectivo - il_abono,"###,###,###,##0")
		sle_efectivo.text	= '0'
	else
		ll_efectivo			= long(sle_efectivo.text)
		ll_total				= long(st_total.text)
		if ll_efectivo = ll_total then
			em_saldo.text		= string(ll_total - il_abono,"###,###,###,##0")
			sle_efectivo.text	= '0'
		end if
	end if
end if
end event

type cbx_efectivo from checkbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 128
integer y = 204
integer width = 439
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "EFECTIVO"
end type

event clicked;Long	ll_saldo, ll_efectivo,id_resto,ll_total
sle_efectivo.Enabled 			= cbx_efectivo.Checked
sle_paga_con.text				= ''
sle_vuelto.text					= ''
IF cbx_efectivo.Checked=true THEN
	sle_paga_con.enabled	= true
	sle_vuelto.enabled			= true
	if cbx_efectivo.checked=true and trim(em_saldo.text) = trim(st_total.text) and cbx_cheque.checked=false and &
		cbx_tarjeta_credito.checked=false and cbx_tarjeta_debito.checked=false and cbx_credito.checked=false then
		ll_efectivo				= long(em_saldo.text)
		em_saldo.text			= '0'
		sle_efectivo.text		= string(ll_efectivo,"###,###,###,##0")
	else
		ll_efectivo				= long(sle_efectivo.text)
		ll_total					= long(st_total.text)
		if ll_efectivo = ll_total then
			em_saldo.text		= string(ll_total - il_abono,"###,###,###,##0")
			sle_efectivo.text	= '0'
		end if
	end if
	sle_paga_con.setfocus()
ELSE
	sle_paga_con.enabled		= false
	sle_vuelto.enabled				= false
	wf_valida_opciones_pago()
	if cbx_tarjeta_debito.checked=true then
		tab_1.SelectedTab															= 3
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
	elseif cbx_tarjeta_credito.checked=true then
		tab_1.SelectedTab															= 2
		tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
	elseif cbx_efectivo.checked=true then
		sle_efectivo.setfocus()
	elseif cbx_cheque.checked=true then
		tab_1.SelectedTab															= 1
		tab_1.tabpage_cheque.em_cantidad_1.setfocus()
	end if
END IF
end event

type st_6 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2139
integer y = 236
integer width = 402
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Monto Efectivo $ :"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_41 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2139
integer y = 152
integer width = 402
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean enabled = false
string text = "Abono :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_saldo from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2560
integer y = 144
integer width = 594
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_5 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 800
integer y = 1996
integer width = 201
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Vuelto :"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_4 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 69
integer y = 1996
integer width = 279
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Paga con :"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type sle_vuelto from singlelineedit within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 1015
integer y = 1988
integer width = 443
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type sle_paga_con from singlelineedit within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 361
integer y = 1988
integer width = 407
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event modified;Double		ll_resultado
if double(this.text) >= double(sle_efectivo.text) then
	ll_resultado		= double(sle_paga_con.text) - double(sle_efectivo.text)
	sle_paga_con.text	= string(long(this.text),'###,###,###,###,##0')
	sle_vuelto.text 	= string(ll_resultado,'###,###,###,###,##0')
else
	messagebox('Error','Paga con debe ser mayor al Monto Efectivo',stopsign!)
	this.setfocus()
end if
end event

type st_3 from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2139
integer y = 68
integer width = 402
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Total a Pagar :"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_total from statictext within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2560
integer y = 60
integer width = 594
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16776960
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type gb_1 from groupbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 2107
integer y = 4
integer width = 1083
integer height = 400
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Paga Efectivo"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type cbx_tarjeta_credito from checkbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 727
integer y = 288
integer width = 571
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Tarjeta CREDITO"
end type

event clicked;Long	ll_efectivo,ll_total
sle_paga_con.text															= ''
sle_vuelto.text																= ''
st_insertar_tar_cred.enabled											= cbx_tarjeta_credito.checked
st_eliminar_tarjeta_cred.enabled 										= cbx_tarjeta_credito.checked
tab_1.tabpage_credito.enabled											= cbx_tarjeta_credito.checked
tab_1.tabpage_credito.em_cantidad_tarjetacred_1.enabled		= cbx_tarjeta_credito.checked
tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.enabled = cbx_tarjeta_credito.checked
if cbx_tarjeta_credito.checked=false then
	wf_valida_opciones_pago()
	tab_1.tabpage_credito.rb_empresa_1.checked					= false
	tab_1.tabpage_credito.rb_empresa_2.checked					= false
	tab_1.tabpage_credito.em_cantidad_tarjetacred_1.text		= '0'
	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
	if cbx_cheque.checked=true then
		tab_1.SelectedTab													= 1
		tab_1.tabpage_cheque.em_cantidad_1.setfocus()
	elseif cbx_tarjeta_debito.checked=true then
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
		tab_1.SelectedTab													= 3
	elseif cbx_efectivo.checked=true then
		sle_paga_con.setfocus()
	elseif cbx_credito.checked=true then
		sle_paga_con.setfocus()
	end if
else
	tab_1.SelectedTab														= 2
	if st_tipo_cobro.text='BL' then
		if mid(tab_1.tabpage_credito.rb_empresa_1.text,1,1)='A' then
			tab_1.tabpage_credito.rb_empresa_1.checked			= true
			tab_1.tabpage_credito.rb_empresa_2.checked			= false
		end if
	else
		if mid(tab_1.tabpage_credito.rb_empresa_1.text,1,1)='A' then
			tab_1.tabpage_credito.rb_empresa_1.checked			= false
			tab_1.tabpage_credito.rb_empresa_2.checked			= true
		end if
	end if
	if cbx_efectivo.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo															= long(sle_efectivo.text)
		em_saldo.text														= string(ll_efectivo - il_abono,"###,###,###,##0")
		sle_efectivo.text													= '0'
	elseif cbx_credito.checked=true and trim(sle_efectivo.text) = trim(st_total.text) then
		ll_efectivo															= long(sle_efectivo.text)
		em_saldo.text														= string(ll_efectivo - il_abono,"###,###,###,##0")
		sle_efectivo.text													= '0'
	else
		ll_efectivo															= long(sle_efectivo.text)
		ll_total																= long(st_total.text)
		if ll_efectivo = ll_total then
			em_saldo.text													= string(ll_total - il_abono,"###,###,###,##0")
			sle_efectivo.text												= '0'
		end if
	end if
end if
end event

type gb_11 from groupbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 132
integer width = 2043
integer height = 272
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Seleccione Opción de Pago"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type tab_1 from tab within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 424
integer width = 3154
integer height = 1504
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_cheque tabpage_cheque
tabpage_credito tabpage_credito
tabpage_debito tabpage_debito
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

on tab_1.create
this.tabpage_cheque=create tabpage_cheque
this.tabpage_credito=create tabpage_credito
this.tabpage_debito=create tabpage_debito
this.Control[]={this.tabpage_cheque,&
this.tabpage_credito,&
this.tabpage_debito}
end on

on tab_1.destroy
destroy(this.tabpage_cheque)
destroy(this.tabpage_credito)
destroy(this.tabpage_debito)
end on

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		tab_1.tabpage_cheque.em_cantidad_1.setfocus()
	CASE 2
		tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
	CASE 3
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setfocus()
END CHOOSE
end event

type tabpage_cheque from userobject within tab_1
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 112
integer width = 3118
integer height = 1376
long backcolor = 79741120
string text = "Paga con Cheque"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_9 st_9
st_18 st_18
dw_empresa_2 dw_empresa_2
st_17 st_17
st_16 st_16
em_dias_cheque em_dias_cheque
rb_otra_fecha_ch rb_otra_fecha_ch
st_15 st_15
rb_ch_30_dias rb_ch_30_dias
rb_ch_dia rb_ch_dia
st_titulo_cheque st_titulo_cheque
em_cantidad_1 em_cantidad_1
dw_detalle_pago_1 dw_detalle_pago_1
gb_5 gb_5
dw_empresa_1 dw_empresa_1
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

on tabpage_cheque.create
this.st_9=create st_9
this.st_18=create st_18
this.dw_empresa_2=create dw_empresa_2
this.st_17=create st_17
this.st_16=create st_16
this.em_dias_cheque=create em_dias_cheque
this.rb_otra_fecha_ch=create rb_otra_fecha_ch
this.st_15=create st_15
this.rb_ch_30_dias=create rb_ch_30_dias
this.rb_ch_dia=create rb_ch_dia
this.st_titulo_cheque=create st_titulo_cheque
this.em_cantidad_1=create em_cantidad_1
this.dw_detalle_pago_1=create dw_detalle_pago_1
this.gb_5=create gb_5
this.dw_empresa_1=create dw_empresa_1
this.Control[]={this.st_9,&
this.st_18,&
this.dw_empresa_2,&
this.st_17,&
this.st_16,&
this.em_dias_cheque,&
this.rb_otra_fecha_ch,&
this.st_15,&
this.rb_ch_30_dias,&
this.rb_ch_dia,&
this.st_titulo_cheque,&
this.em_cantidad_1,&
this.dw_detalle_pago_1,&
this.gb_5,&
this.dw_empresa_1}
end on

on tabpage_cheque.destroy
destroy(this.st_9)
destroy(this.st_18)
destroy(this.dw_empresa_2)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.em_dias_cheque)
destroy(this.rb_otra_fecha_ch)
destroy(this.st_15)
destroy(this.rb_ch_30_dias)
destroy(this.rb_ch_dia)
destroy(this.st_titulo_cheque)
destroy(this.em_cantidad_1)
destroy(this.dw_detalle_pago_1)
destroy(this.gb_5)
destroy(this.dw_empresa_1)
end on

type st_9 from statictext within tabpage_cheque
boolean visible = false
integer x = 18
integer y = 92
integer width = 2633
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Paga con Cheque"
boolean focusrectangle = false
end type

type st_18 from statictext within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 1477
integer y = 1280
integer width = 215
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Destino"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type dw_empresa_2 from datawindow within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 1691
integer y = 1264
integer width = 974
integer height = 104
integer taborder = 110
string title = "none"
string dataobject = "dwe_lista_empresas_destino"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_17 from statictext within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 1256
integer width = 443
integer height = 108
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cheque Páguese a la Orden de"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_16 from statictext within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2693
integer y = 456
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

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type em_dias_cheque from editmask within tabpage_cheque
integer x = 2875
integer y = 440
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

event modified;if this.text<>'' and not isnull(this.text) then
	if long(this.text)>50 then
		messagebox("Advertencia","Excedió en Días para el Primer Pago")
		this.text	= ''
	elseif long(this.text)<=0 then
		messagebox("Advertencia","Número Día inválido")
		this.text	= ''
	else
		if tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 and long(tab_1.tabpage_cheque.em_cantidad_1.text)>0 then
			tab_1.tabpage_cheque.em_cantidad_1.triggerevent(modified!)
		end if
	end if
	tab_1.tabpage_cheque.em_cantidad_1.setfocus()
end if
end event

type rb_otra_fecha_ch from radiobutton within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2715
integer y = 348
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

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;tab_1.tabpage_cheque.em_dias_cheque.enabled	= true
tab_1.tabpage_cheque.em_dias_cheque.setfocus()

end event

type st_15 from statictext within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2729
integer y = 616
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Cheques"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type rb_ch_30_dias from radiobutton within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2715
integer y = 256
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
string text = "a 30 días"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;tab_1.tabpage_cheque.em_dias_cheque.text		= ''
tab_1.tabpage_cheque.em_dias_cheque.enabled	= false
if tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 and long(tab_1.tabpage_cheque.em_cantidad_1.text)>0 then
	tab_1.tabpage_cheque.em_cantidad_1.triggerevent(modified!)
end if
tab_1.tabpage_cheque.em_cantidad_1.setfocus()
end event

type rb_ch_dia from radiobutton within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2715
integer y = 164
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
string text = "Al día"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;tab_1.tabpage_cheque.em_dias_cheque.text		= ''
tab_1.tabpage_cheque.em_dias_cheque.enabled	= false
if tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 and long(tab_1.tabpage_cheque.em_cantidad_1.text)>0 then
	tab_1.tabpage_cheque.em_cantidad_1.triggerevent(modified!)
end if
tab_1.tabpage_cheque.em_cantidad_1.setfocus()
end event

type st_titulo_cheque from statictext within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 91
integer y = 24
integer width = 2501
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type em_cantidad_1 from editmask within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2711
integer y = 684
integer width = 352
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

event modified;long	ll_cant,ll_pasa=0

if tab_1.tabpage_cheque.rb_otra_fecha_ch.checked=true and &
	(long(tab_1.tabpage_cheque.em_dias_cheque.text)<=0 or tab_1.tabpage_cheque.em_dias_cheque.text='') then
	messagebox("Advertencia","Debe Ingresar Nº dias Primer Cheque")
	em_dias_cheque.setfocus()
	ll_pasa ++
elseif tab_1.tabpage_cheque.rb_otra_fecha_ch.checked=false and &
	    tab_1.tabpage_cheque.rb_ch_30_dias.checked=false and &
	    tab_1.tabpage_cheque.rb_ch_dia.checked=false then
	messagebox("Advertencia","Debe Seleccionar a Cuantos dias el Primer Cheque")
	tab_1.tabpage_cheque.rb_ch_dia.setfocus()
end if
if ll_pasa=0 then
	tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
	ll_cant					= long(this.text)
	if ll_cant>0 then
		tab_1.tabpage_cheque.dw_detalle_pago_1.reset()
		tab_1.tabpage_cheque.dw_detalle_pago_1.AcceptText()
		IF gs_tipo_cobro = "CU" THEN 
//			messagebox("Advertencia","En caso de Pago de Cupones, solo se puede recibir Un Cheque")
			this.text 		= '1'
			ll_cant			= long(this.text)
		end if
		if ll_cant>=1 and ll_cant < 31 then
			st_insertar_cheque.triggerevent(clicked!)
		else
			messagebox('Advertencia','Rango Inválido, Se acepta de 1 a 30 Documentos.',stopsign!)
			this.text 		= '0'
		end if
	end if
end if
end event

event losefocus;if isnull(trim(this.text)) or trim(this.text)='' then
	dw_detalle_pago_1.reset()
	
end if
end event

type dw_detalle_pago_1 from datawindow within tabpage_cheque
event ue_move pbm_mousemove
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 100
integer width = 2633
integer height = 1060
integer taborder = 10
boolean enabled = false
string title = " Paga con Cheque"
string dataobject = "d_detalle_pago"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;wf_mover_dw()
if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;string	ls_columna
long		ll_monto, ll_total,fila, n_cheques, ll_sumar
Date		ld_fecha_vcto
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 't_insertar'
		st_insertar_cheque.triggerevent(clicked!)
	CASE 't_numerar_registros'
		st_correlativo_cheque.triggerevent(clicked!)
	CASE 't_eliminar'
		st_eliminar_cheque.triggerevent(clicked!)
END CHOOSE
end event

event getfocus;if this.rowcount()=0 and cbx_cheque.checked=true then tab_1.tabpage_cheque.em_cantidad_1.setfocus()
end event

event itemchanged;String	ls_columna,ls_traspaso
Long		ll_monto,ll_saldo,ll_nro_cheque,ll_tot_reg,ll_indi,ll_nro_cheque_aux,ll_null,&
			ll_ult_cheque,ll_fila,ll_banco,ll_banco_aux,ll_count=0
Date		ld_fecha_venc,ld_fecha_nula

Setnull(ld_fecha_nula)
dw_detalle_pago_1.AcceptText()
if not isnull(data) then
	setnull(ll_null)
	ls_columna	= dwo.name
	//ls_columna	= dw_detalle_pago_1.GetColumnName()
	if long(em_cantidad_1.text)>0 then
		CHOOSE CASE ls_columna
			CASE 'monto'
				wf_recalcular_valores()
				tab_1.tabpage_cheque.dw_detalle_pago_1.AcceptText()
				if gs_tipo_cobro='CU' and long(em_cantidad_1.text)>0 then pb_grabar.setfocus()
	
			CASE 'fecha_venc'
				if not isnull(data) then
					ld_fecha_venc	= date(dw_detalle_pago_1.getitemdatetime(dw_detalle_pago_1.getrow(),'fecha_venc'))
					if ld_fecha_venc < idt_fecha_hoy then
						messagebox("Advertencia","Fecha Vencimiento Inválida, no puede ser Menor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
//						dw_detalle_pago_1.setitem(dw_detalle_pago_1.getrow(),'fecha_venc',ld_fecha_nula)
						dw_detalle_pago_1.accepttext()
						dw_detalle_pago_1.setfocus()
						dw_detalle_pago_1.scrolltorow(dw_detalle_pago_1.getrow())
						dw_detalle_pago_1.setcolumn('fecha_venc')
					end if	
				end if
	
		END CHOOSE
	else
		messagebox("Advertencia","Debe Ingresar Nº Cheques")
		em_cantidad_1.setfocus()
	end if
end if
dw_detalle_pago_1.AcceptText()
end event

event rowfocuschanged;Long		ll_tot_reg,ll_indi,ll_monto_saldo
double 	ll_efectivo=0, ll_saldo=0,id_saldo
this.accepttext()
if il_sw_pasa_cheque=0 and tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()>0 then
	ll_monto_saldo	= long(em_saldo.text)
	IF tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1,"monto") > 0 THEN
	//	and tab_1.tabpage_cheque.dw_detalle_pago_1.GetItemNumber(1,"monto") <= ll_monto_saldo
		il_sw_pasa_cheque ++
		if getrow()>1 then
			st_correlativo_cheque.triggerevent(clicked!)
		end if
	END IF
end if
//if long(st_saldo.text) > long(st_total.text) or long(sle_efectivo.text)<0 then
//	messagebox("Advertencia","Error La Suma de los Montos es Inválido, supera el Total a Pagar")
//	ll_tot_reg	= tab_1.tabpage_cheque.dw_detalle_pago_1.rowcount()
//	for ll_indi=1 to ll_tot_reg
//		tab_1.tabpage_cheque.dw_detalle_pago_1.setitem(ll_indi,'monto',0)
//	next
//	tab_1.tabpage_cheque.dw_detalle_pago_1.accepttext()
//	tab_1.tabpage_cheque.dw_detalle_pago_1.setfocus()
//	wf_recalcular_valores()
//	il_sw_pasa_cheque	= 0
//end if
end event

event losefocus;if gs_tipo_cobro='CU' and long(em_cantidad_1.text)>0 then 
	pb_grabar.setfocus()
end if
end event

event itemfocuschanged;Long		ll_tot_reg,ll_fila
date		ld_fecha_nula
String		ls_string

Setnull(ld_fecha_nula)
ll_tot_reg			= dw_detalle_pago_1.rowcount()
if ll_tot_reg > 0 then
	ls_string			= "date(fecha_venc) < date('"+string(idt_fecha_hoy,'dd/mm/yyyy')+"')"
	ll_fila				= dw_detalle_pago_1.Find(ls_string, 1, ll_tot_reg)
	if ll_fila > 0 then
//		dw_detalle_pago_1.setitem(ll_fila,'fecha_venc',ld_fecha_nula)
		dw_detalle_pago_1.accepttext()
		dw_detalle_pago_1.setfocus()
		dw_detalle_pago_1.scrolltorow(ll_fila)
		dw_detalle_pago_1.setcolumn('fecha_venc')
	end if	
end if
end event

type gb_5 from groupbox within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 2679
integer y = 80
integer width = 411
integer height = 1148
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1º Cheque"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type dw_empresa_1 from datawindow within tabpage_cheque
event ue_mousemove pbm_mousemove
integer x = 480
integer y = 1264
integer width = 974
integer height = 104
integer taborder = 100
string dataobject = "dwe_lista_empresas"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event itemchanged;String	ls_codigo,ls_tipo_cob_aux
Long		ll_tot_reg,ll_indi
dw_empresa_1.accepttext()
ls_codigo						= dw_empresa_1.getitemstring(1,'codigo_empresa')
ls_tipo_cob_aux			= st_tipo_cobro.text
if not isnull(ls_codigo) then 
	dw_empresa_2.reset()
	dw_empresa_2.insertrow(0)
	dwch_empresa2.retrieve()
end if
if ls_codigo = '1' or ls_codigo = '2' then //Administradora
//	ls_tipo_cob_aux		= 'BL'
else // Inmobiliaria
//	ls_tipo_cob_aux		= 'CI'
end if
ll_tot_reg					= dw_detalle_pago_1.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		tab_1.tabpage_cheque.dw_detalle_pago_1.setitem(ll_indi, "tipo_cob_aux",ls_tipo_cob_aux)
	next
end if
if il_tab_forma_pago=5 then
	if trim(st_tipo_cobro.text)='BL' then
		tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','3')
	else
		tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','1')
	end if
else
	if trim(st_tipo_cobro.text)='BL' then
		if gs_conexion	= "Parque El Prado" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','1')
		elseif gs_conexion	= "Parque la Foresta" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','2')
		elseif gs_conexion	= "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','5')
		end if
	else
		if gs_conexion	= "Parque El Prado" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','3')
		elseif gs_conexion	= "Parque la Foresta" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','4')
		elseif gs_conexion	= "Parque Concepción" then
			tab_1.tabpage_cheque.dw_empresa_2.setitem(1,'codigo_empresa','5')
		end if
	end if
end if
dw_empresa_1.accepttext()
dw_empresa_2.accepttext()
dw_empresa_2.setfocus()
end event

type tabpage_credito from userobject within tab_1
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 112
integer width = 3118
integer height = 1376
long backcolor = 79741120
string text = "Paga con Tarjeta Crédito"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_10 st_10
rb_empresa_2 rb_empresa_2
rb_empresa_1 rb_empresa_1
st_22 st_22
rb_tienda_ctdo rb_tienda_ctdo
st_21 st_21
rb_tienda_cred rb_tienda_cred
st_20 st_20
rb_comer rb_comer
rb_prom rb_prom
rb_cred rb_cred
st_titulo_credito st_titulo_credito
em_cantidad_tarjetacred_1 em_cantidad_tarjetacred_1
dw_detalle_pago_tarjetacred_1 dw_detalle_pago_tarjetacred_1
gb_2 gb_2
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

on tabpage_credito.create
this.st_10=create st_10
this.rb_empresa_2=create rb_empresa_2
this.rb_empresa_1=create rb_empresa_1
this.st_22=create st_22
this.rb_tienda_ctdo=create rb_tienda_ctdo
this.st_21=create st_21
this.rb_tienda_cred=create rb_tienda_cred
this.st_20=create st_20
this.rb_comer=create rb_comer
this.rb_prom=create rb_prom
this.rb_cred=create rb_cred
this.st_titulo_credito=create st_titulo_credito
this.em_cantidad_tarjetacred_1=create em_cantidad_tarjetacred_1
this.dw_detalle_pago_tarjetacred_1=create dw_detalle_pago_tarjetacred_1
this.gb_2=create gb_2
this.Control[]={this.st_10,&
this.rb_empresa_2,&
this.rb_empresa_1,&
this.st_22,&
this.rb_tienda_ctdo,&
this.st_21,&
this.rb_tienda_cred,&
this.st_20,&
this.rb_comer,&
this.rb_prom,&
this.rb_cred,&
this.st_titulo_credito,&
this.em_cantidad_tarjetacred_1,&
this.dw_detalle_pago_tarjetacred_1,&
this.gb_2}
end on

on tabpage_credito.destroy
destroy(this.st_10)
destroy(this.rb_empresa_2)
destroy(this.rb_empresa_1)
destroy(this.st_22)
destroy(this.rb_tienda_ctdo)
destroy(this.st_21)
destroy(this.rb_tienda_cred)
destroy(this.st_20)
destroy(this.rb_comer)
destroy(this.rb_prom)
destroy(this.rb_cred)
destroy(this.st_titulo_credito)
destroy(this.em_cantidad_tarjetacred_1)
destroy(this.dw_detalle_pago_tarjetacred_1)
destroy(this.gb_2)
end on

type st_10 from statictext within tabpage_credito
boolean visible = false
integer x = 18
integer y = 92
integer width = 2633
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Paga con Tarjeta Crédito"
boolean focusrectangle = false
end type

type rb_empresa_2 from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2469
integer y = 16
integer width = 613
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;if rb_empresa_2.checked=true then
	if long(em_cantidad_tarjetacred_1.text) > 0 then 
		dw_detalle_pago_tarjetacred_1.setfocus()
	else
		em_cantidad_tarjetacred_1.setfocus()
	end if
end if
end event

type rb_empresa_1 from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 1957
integer y = 16
integer width = 503
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;if rb_empresa_1.checked=true then
	if long(em_cantidad_tarjetacred_1.text) > 0 then 
		dw_detalle_pago_tarjetacred_1.setfocus()
	else
		em_cantidad_tarjetacred_1.setfocus()
	end if
end if
end event

type st_22 from statictext within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 1353
integer y = 16
integer width = 585
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Narrow"
long textcolor = 33554432
long backcolor = 80269524
string text = "Selecione Tarjeta Empresa"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type rb_tienda_ctdo from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2702
integer y = 832
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "promoción"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;Long					ll_resp
DataWindowChild	dwch_tipo_tarjeta
//DDW tipo tarjeta pago con TC 1
if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	if il_codigo_pago_credito<>5 then
		ll_resp	= messagebox("Advertencia","Seleccionó Otro Tipo de Cuota, está Seguro de Limpiar Detalle de Pago",Exclamation!,YesNo!)
		if ll_resp=1 then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			wf_recalcular_valores()
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.triggerevent(Modified!)
		else
			if il_codigo_pago_credito=1 then
				tab_1.tabpage_credito.rb_cred.checked			= true
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_cred.setfocus()
			elseif il_codigo_pago_credito=2 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= true
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_prom.setfocus()
			elseif il_codigo_pago_credito=3 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= true
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_comer.setfocus()
			elseif il_codigo_pago_credito=4 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_tienda_cred.setfocus()
			elseif il_codigo_pago_credito=5 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.setfocus()
			end if
		end if
	end if
end if
em_cantidad_tarjetacred_1.setfocus()
end event

type st_21 from statictext within tabpage_credito
integer x = 2693
integer y = 684
integer width = 379
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tarjeta Tienda"
boolean focusrectangle = false
end type

type rb_tienda_cred from radiobutton within tabpage_credito
integer x = 2702
integer y = 748
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crédito"
end type

event clicked;Long					ll_resp
DataWindowChild	dwch_tipo_tarjeta
//DDW tipo tarjeta pago con TC 1
if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	if il_codigo_pago_credito<>4 then
		ll_resp	= messagebox("Advertencia","Seleccionó Otro Tipo de Cuota, está Seguro de Limpiar Detalle de Pago",Exclamation!,YesNo!)
		if ll_resp=1 then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			wf_recalcular_valores()
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.triggerevent(Modified!)
		else
			if il_codigo_pago_credito=1 then
				tab_1.tabpage_credito.rb_cred.checked			= true
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_cred.setfocus()
			elseif il_codigo_pago_credito=2 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= true
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_prom.setfocus()
			elseif il_codigo_pago_credito=3 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= true
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_comer.setfocus()
			elseif il_codigo_pago_credito=4 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_tienda_cred.setfocus()
			elseif il_codigo_pago_credito=5 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.setfocus()
			end if
		end if
	end if
end if
em_cantidad_tarjetacred_1.setfocus()
end event

type st_20 from statictext within tabpage_credito
integer x = 2693
integer y = 304
integer width = 384
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tarjeta Crédito"
boolean focusrectangle = false
end type

type rb_comer from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2702
integer y = 536
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comercio"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;Long					ll_resp
DataWindowChild	dwch_tipo_tarjeta
//DDW tipo tarjeta pago con TC 1
if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	if il_codigo_pago_credito<>3 then
		ll_resp	= messagebox("Advertencia","Seleccionó Otro Tipo de Cuota, está Seguro de Limpiar Detalle de Pago",Exclamation!,YesNo!)
		if ll_resp=1 then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			wf_recalcular_valores()
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.triggerevent(Modified!)
		else
			if il_codigo_pago_credito=1 then
				tab_1.tabpage_credito.rb_cred.checked			= true
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_cred.setfocus()
			elseif il_codigo_pago_credito=2 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= true
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_prom.setfocus()
			elseif il_codigo_pago_credito=3 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= true
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_comer.setfocus()
			elseif il_codigo_pago_credito=4 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_tienda_cred.setfocus()
			elseif il_codigo_pago_credito=5 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.setfocus()
			end if
		end if
	end if
end if
em_cantidad_tarjetacred_1.setfocus()
end event

type rb_prom from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2702
integer y = 452
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Promoción"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;Long					ll_resp
DataWindowChild	dwch_tipo_tarjeta
//DDW tipo tarjeta pago con TC 1
if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	if il_codigo_pago_credito<>2 then
		ll_resp	= messagebox("Advertencia","Seleccionó Otro Tipo de Cuota, está Seguro de Limpiar Detalle de Pago",Exclamation!,YesNo!)
		if ll_resp=1 then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			wf_recalcular_valores()
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.triggerevent(Modified!)
		else
			if il_codigo_pago_credito=1 then
				tab_1.tabpage_credito.rb_cred.checked			= true
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_cred.setfocus()
			elseif il_codigo_pago_credito=2 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= true
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_prom.setfocus()
			elseif il_codigo_pago_credito=3 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= true
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_comer.setfocus()
			elseif il_codigo_pago_credito=4 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_tienda_cred.setfocus()
			elseif il_codigo_pago_credito=5 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.setfocus()
			end if
		end if
	end if
end if
em_cantidad_tarjetacred_1.setfocus()
end event

type rb_cred from radiobutton within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2702
integer y = 368
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crédito"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;Long					ll_resp
//DDW tipo tarjeta pago con TC 1
if tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	if il_codigo_pago_credito<>1 then
		ll_resp	= messagebox("Advertencia","Seleccionó Otro Tipo de Cuota, está Seguro de Limpiar Detalle de Pago",Exclamation!,YesNo!)
		if ll_resp=1 then
			tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
			wf_recalcular_valores()
			tab_1.tabpage_credito.em_cantidad_tarjetacred_1.triggerevent(Modified!)
		else
			if il_codigo_pago_credito=1 then
				tab_1.tabpage_credito.rb_cred.checked			= true
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_cred.setfocus()
			elseif il_codigo_pago_credito=2 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= true
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_prom.setfocus()
			elseif il_codigo_pago_credito=3 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= true
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_comer.setfocus()
			elseif il_codigo_pago_credito=4 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= false
				tab_1.tabpage_credito.rb_tienda_cred.setfocus()
			elseif il_codigo_pago_credito=5 then
				tab_1.tabpage_credito.rb_cred.checked			= false
				tab_1.tabpage_credito.rb_prom.checked			= false
				tab_1.tabpage_credito.rb_comer.checked			= false
				tab_1.tabpage_credito.rb_tienda_cred.checked	= false
				tab_1.tabpage_credito.rb_tienda_ctdo.checked	= true
				tab_1.tabpage_credito.rb_tienda_ctdo.setfocus()
			end if
		end if
	end if
end if
em_cantidad_tarjetacred_1.setfocus()
end event

type st_titulo_credito from statictext within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 16
integer width = 1307
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type em_cantidad_tarjetacred_1 from editmask within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2729
integer y = 172
integer width = 315
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event modified;long		ll_cant,ll_cta_ini,ll_cta_fin,ll_nro_cuota
String	ls_vigente,ls_pasa
if trim(em_cantidad_tarjetacred_1.text)<>'' and not isnull(trim(em_cantidad_tarjetacred_1.text)) then
	if tab_1.tabpage_credito.rb_empresa_1.checked=false and tab_1.tabpage_credito.rb_empresa_2.checked=false then
		messagebox("Advertencia","Debe Seleccionar Tarjeta Empresa")
		em_cantidad_tarjetacred_1.text	= ''
		tab_1.tabpage_credito.rb_empresa_1.setfocus()
	else
		il_codigo_pago_credito				= 0
		ll_cant									= long(this.text)
		if ll_cant>0 then
			if tab_1.tabpage_credito.rb_cred.checked=true then //codigo=1
				il_codigo_pago_credito	= 1
				wf_dw_credito()
				SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
							"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
				INTO 		:ll_cta_ini,   
							:ll_cta_fin  
				FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
				WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :il_codigo_pago_credito   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ll_cant>=ll_cta_ini and ll_cant <= ll_cta_fin then
						st_insertar_tar_cred.triggerevent(clicked!)
					else
						messagebox('Advertencia','Rango Inválido, Se acepta de '+string(ll_cta_ini)+' a '+string(ll_cta_fin)+' Cuotas.',stopsign!)
						this.text 	= '0'
						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
					end if
				end if
			
			elseif tab_1.tabpage_credito.rb_prom.checked=true then //codigo=2
				il_codigo_pago_credito	= 2
				wf_dw_credito()
				SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
							"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
				INTO 		:ll_cta_ini,   
							:ll_cta_fin  
				FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
				WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :il_codigo_pago_credito   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_pasa	= 'N'
					if ll_cant>=ll_cta_ini and ll_cant <= ll_cta_fin then
						DECLARE x1 CURSOR FOR  
						SELECT	"TIPO_COM_TARJETA_CTA_VIGENTE"."NUMERO_CUOTA",   
									"TIPO_COM_TARJETA_CTA_VIGENTE"."VIGENTE"  
						FROM 		"TIPO_COM_TARJETA_CTA_VIGENTE"  
						WHERE 	"TIPO_COM_TARJETA_CTA_VIGENTE"."CODIGO_TIPO_TARJETA" = :il_codigo_pago_credito   
						USING		sqlca;
						open x1;
						if sqlca.sqlcode=0 then
							DO WHILE sqlca.sqlcode=0
								setnull(ll_nro_cuota);setnull(ls_vigente)
								fetch x1 into :ll_nro_cuota, :ls_vigente;
								if not isnull(ll_nro_cuota) and not isnull(ls_vigente) then
									if ll_cant = ll_nro_cuota and ls_vigente='S' then
										ls_pasa	= 'S'
										exit
									end if
								end if
							LOOP
						end if
						close x1;
						if ls_pasa='S' then 
							st_insertar_tar_cred.triggerevent(clicked!)
						else
							messagebox("Advertencia","No está Vigente Pago con "+string(ll_cant)+" Cuota(s)")
							this.text 	= '0'
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
						end if							
					else
						messagebox('Advertencia','Rango Inválido, Se acepta de '+string(ll_cta_ini)+' a '+string(ll_cta_fin)+' Cuotas.',stopsign!)
						this.text 	= '0'
						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
					end if
				end if
			elseif tab_1.tabpage_credito.rb_comer.checked=true then //codigo=3
				il_codigo_pago_credito	= 3
				wf_dw_credito()
				SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
							"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
				INTO 		:ll_cta_ini,   
							:ll_cta_fin  
				FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
				WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :il_codigo_pago_credito   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ll_cant>=ll_cta_ini and ll_cant <= ll_cta_fin then
						st_insertar_tar_cred.triggerevent(clicked!)
					else
						messagebox('Advertencia','Rango Inválido, Se acepta de '+string(ll_cta_ini)+' a '+string(ll_cta_fin)+' Cuotas.',stopsign!)
						this.text 	= '0'
						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
					end if
				end if
			elseif tab_1.tabpage_credito.rb_tienda_cred.checked=true then //codigo=4
				il_codigo_pago_credito	= 4
				wf_dw_tienda()
				SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
							"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
				INTO 		:ll_cta_ini,   
							:ll_cta_fin  
				FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
				WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :il_codigo_pago_credito   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ll_cant>=ll_cta_ini and ll_cant <= ll_cta_fin then
						st_insertar_tar_cred.triggerevent(clicked!)
					else
						messagebox('Advertencia','Rango Inválido, Se acepta de '+string(ll_cta_ini)+' a '+string(ll_cta_fin)+' Cuotas.',stopsign!)
						this.text 	= '0'
						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
					end if
				end if
			elseif tab_1.tabpage_credito.rb_tienda_ctdo.checked=true then //codigo=5
				il_codigo_pago_credito	= 5
				wf_dw_tienda_contado()
				SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_INICIAL",   
							"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
				INTO 		:ll_cta_ini,   
							:ll_cta_fin  
				FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
				WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :il_codigo_pago_credito   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_pasa	= 'N'
					if ll_cant>=ll_cta_ini and ll_cant <= ll_cta_fin then
						DECLARE x2 CURSOR FOR  
						SELECT	"TIPO_COM_TARJETA_CTA_VIGENTE"."NUMERO_CUOTA",   
									"TIPO_COM_TARJETA_CTA_VIGENTE"."VIGENTE"  
						FROM 		"TIPO_COM_TARJETA_CTA_VIGENTE"  
						WHERE 	"TIPO_COM_TARJETA_CTA_VIGENTE"."CODIGO_TIPO_TARJETA" = :il_codigo_pago_credito   
						USING		sqlca;
						open x2;
						if sqlca.sqlcode=0 then
							DO WHILE sqlca.sqlcode=0
								setnull(ll_nro_cuota);setnull(ls_vigente)
								fetch x2 into :ll_nro_cuota, :ls_vigente;
								if not isnull(ll_nro_cuota) and not isnull(ls_vigente) then
									if ll_cant = ll_nro_cuota and ls_vigente='S' then
										ls_pasa	= 'S'
										exit
									end if
								end if
							LOOP
						end if
						close x2;
						if ls_pasa='S' then 
							st_insertar_tar_cred.triggerevent(clicked!)
						else
							messagebox("Advertencia","No está Vigente Pago con "+string(ll_cant)+" Cuota(s)")
							this.text 	= '0'
							tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
						end if
					else
						messagebox('Advertencia','Rango Inválido, Se acepta de '+string(ll_cta_ini)+' a '+string(ll_cta_fin)+' Cuotas.',stopsign!)
						this.text 	= '0'
						tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.reset()
					end if
				end if
			end if	
		end if
	end if
end if
end event

event losefocus;if isnull(trim(this.text)) or trim(this.text)='' then
	dw_detalle_pago_tarjetacred_1.reset()
end if
end event

type dw_detalle_pago_tarjetacred_1 from datawindow within tabpage_credito
event ue_move pbm_mousemove
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 100
integer width = 2633
integer height = 1060
integer taborder = 20
boolean enabled = false
string title = " Paga con Tarjeta Crédito"
string dataobject = "d_detalle_pago_tarjeta_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;wf_mover_dw()
if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event itemchanged;String	ls_columna
Date		ld_fecha_venc
Long		ll_monto, ll_cod_tarjeta
ls_columna	= dwo.name

this.AcceptText()
if long(em_cantidad_tarjetacred_1.text)>0 then
	if ls_columna='monto' then
		wf_recalcular_valores()
		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.AcceptText()
		il_monto_total	= il_monto_total + tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.getitemnumber(1,'c_total_2')
	elseif ls_columna='tipo_tarjeta_credito' then
		ll_cod_tarjeta	= dw_detalle_pago_tarjetacred_1.getitemnumber(row,'tipo_tarjeta_credito')
		if ll_cod_tarjeta>900 then
			dw_detalle_pago_tarjetacred_1.setitem(row,'cod_banco',ll_cod_tarjeta)
			dw_detalle_pago_tarjetacred_1.accepttext()
		end if
	elseif ls_columna='fecha_venc' then
		ld_fecha_venc	= date(dw_detalle_pago_tarjetacred_1.getitemdatetime(dw_detalle_pago_tarjetacred_1.getrow(),'fecha_venc'))
		if ld_fecha_venc < idt_fecha_hoy then
			messagebox("Advertencia","Fecha Vencimiento Inválida, no puede ser Menor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
			this.setfocus()
			this.scrolltorow(dw_detalle_pago_tarjetacred_1.getrow())
			this.setcolumn('fecha_venc')
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Nº Cuotas")
	em_cantidad_tarjetacred_1.setfocus()
end if
end event

event clicked;String	ls_columna
Long		fila,ll_sumar
Date		ld_fecha_vcto
wf_mover_dw()

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 't_insertar'
		st_insertar_tar_cred.triggerevent(clicked!)

	CASE 't_eliminar'
		st_eliminar_tarjeta_cred.triggerevent(clicked!)

	CASE 't_numerar_registros'
		st_correlativo_tarcred.triggerevent(clicked!)

END CHOOSE
end event

event getfocus;if this.rowcount()=0 and cbx_tarjeta_credito.checked=true then tab_1.tabpage_credito.em_cantidad_tarjetacred_1.setfocus()
end event

event rowfocuschanged;Long	ll_tot_reg,ll_indi,ll_monto_saldo
this.accepttext()
if il_sw_pasa_credito=0 and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()>0 then
	ll_monto_saldo	= long(em_saldo.text)
	IF tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1,"monto") >0 THEN
		//and tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.GetItemNumber(1,"monto") <= ll_monto_saldo 
		il_sw_pasa_credito ++
		if getrow()>1 then
			st_correlativo_tarcred.triggerevent(clicked!)
		end if
	END IF
end if
//if long(st_saldo.text) > long(st_total.text) or long(sle_efectivo.text)<0 then
//	messagebox("Advertencia","Error La Suma de los Montos es Inválido, supera el Total a Pagar")
//	ll_tot_reg	= tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.rowcount()
//	for ll_indi=1 to ll_tot_reg
//		tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setitem(ll_indi,'monto',0)
//	next
//	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.accepttext()
//	tab_1.tabpage_credito.dw_detalle_pago_tarjetacred_1.setfocus()
//	wf_recalcular_valores()
//	il_sw_pasa_credito	= 0
//end if
end event

type gb_2 from groupbox within tabpage_credito
event ue_mousemove pbm_mousemove
integer x = 2679
integer y = 80
integer width = 411
integer height = 1148
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Cuotas"
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type tabpage_debito from userobject within tab_1
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 112
integer width = 3118
integer height = 1376
long backcolor = 79741120
string text = "Paga con Tarjeta Débito"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_11 st_11
rb_empresa_4 rb_empresa_4
rb_empresa_3 rb_empresa_3
st_222 st_222
st_titulo_debito st_titulo_debito
dw_detalle_pago_tarjetadebito_1 dw_detalle_pago_tarjetadebito_1
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

on tabpage_debito.create
this.st_11=create st_11
this.rb_empresa_4=create rb_empresa_4
this.rb_empresa_3=create rb_empresa_3
this.st_222=create st_222
this.st_titulo_debito=create st_titulo_debito
this.dw_detalle_pago_tarjetadebito_1=create dw_detalle_pago_tarjetadebito_1
this.Control[]={this.st_11,&
this.rb_empresa_4,&
this.rb_empresa_3,&
this.st_222,&
this.st_titulo_debito,&
this.dw_detalle_pago_tarjetadebito_1}
end on

on tabpage_debito.destroy
destroy(this.st_11)
destroy(this.rb_empresa_4)
destroy(this.rb_empresa_3)
destroy(this.st_222)
destroy(this.st_titulo_debito)
destroy(this.dw_detalle_pago_tarjetadebito_1)
end on

type st_11 from statictext within tabpage_debito
boolean visible = false
integer x = 18
integer y = 92
integer width = 2633
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Paga con Tarjeta Débito"
boolean focusrectangle = false
end type

type rb_empresa_4 from radiobutton within tabpage_debito
event ue_mousemove pbm_mousemove
integer x = 2469
integer y = 16
integer width = 613
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;if tab_1.tabpage_debito.rb_empresa_4.checked=true then
	if mid(trim(tab_1.tabpage_debito.rb_empresa_4.text),1,1)='A' then
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(1, "tipo_cob_aux",'BE')		//BL
	else
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(1, "tipo_cob_aux",'BE')		//CI
	end if
	dw_detalle_pago_tarjetadebito_1.setfocus()
end if
end event

type rb_empresa_3 from radiobutton within tabpage_debito
event ue_mousemove pbm_mousemove
integer x = 1957
integer y = 16
integer width = 503
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event clicked;if tab_1.tabpage_debito.rb_empresa_3.checked=true then
	if mid(trim(tab_1.tabpage_debito.rb_empresa_3.text),1,1)='A' then
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(1, "tipo_cob_aux",'BE')		//BL
	else
		tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(1, "tipo_cob_aux",'BE')		//CI
	end if
	dw_detalle_pago_tarjetadebito_1.setfocus()
end if
end event

type st_222 from statictext within tabpage_debito
event ue_mousemove pbm_mousemove
integer x = 1353
integer y = 16
integer width = 585
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Narrow"
long textcolor = 33554432
long backcolor = 80269524
string text = "Selecione Tarjeta Empresa"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type st_titulo_debito from statictext within tabpage_debito
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 16
integer width = 1202
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

type dw_detalle_pago_tarjetadebito_1 from datawindow within tabpage_debito
event ue_move pbm_mousemove
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 100
integer width = 2633
integer height = 1060
integer taborder = 30
boolean enabled = false
string title = " Paga con Tarjeta Débito"
string dataobject = "d_detalle_pago_tarjeta_debito"
borderstyle borderstyle = stylelowered!
end type

event ue_move;wf_mover_dw()
if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

event itemchanged;String	ls_columna
Date		ld_fecha_venc
Long		ll_monto,ll_saldo,fila

this.accepttext()
if tab_1.tabpage_debito.rb_empresa_3.checked=false and tab_1.tabpage_debito.rb_empresa_4.checked=false then
	messagebox("Advertencia","Debe Seleccionar Tarjeta Empresa")
	tab_1.tabpage_debito.rb_empresa_3.setfocus()
else
	ls_columna	= dwo.name
	if ls_columna='monto' then
		il_valor_debito	= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.getitemnumber(1,'monto')
		ll_monto				= this.getitemnumber(1,'monto')
		ll_saldo				= long(em_saldo.text)
		if ll_monto > ll_saldo then
			messagebox("Advertencia","Monto Ingresado No puede ser Mayor a $ "+string(ll_saldo,"###,###,###,###,##0"))
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.reset()
			fila																			= tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.insertrow(0)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.scrolltorow(fila)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "cod_caja", gs_caja)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "cod_pago", "TD")
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "tipo_cob", gs_tipo_cobro)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "rezago", gs_rezago)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "folio", gl_folio)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "fecha_venc", idt_fecha_hoy)
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.SetItem(fila, "fecha_pago", idt_fecha_hoy)
			
			tab_1.tabpage_debito.dw_detalle_pago_tarjetadebito_1.setcolumn('cod_tarjeta_debito')
			wf_recalcular_valores()
		else		
			this.AcceptText()
			wf_recalcular_valores()
		end if
	elseif ls_columna='fecha_venc' then
		ld_fecha_venc	= date(dw_detalle_pago_tarjetadebito_1.getitemdatetime(dw_detalle_pago_tarjetadebito_1.getrow(),'fecha_venc'))
		if ld_fecha_venc < idt_fecha_hoy then
			messagebox("Advertencia","Fecha Vencimiento Inválida, no puede ser Menor a la Fecha de Hoy "+string(idt_fecha_hoy,"dd/mm/yyyy"))
			this.setfocus()
			this.scrolltorow(dw_detalle_pago_tarjetadebito_1.getrow())
			this.setcolumn('fecha_venc')
		end if
	end if
end if
this.accepttext()
end event

type gb_4 from groupbox within w_forma_pago2
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1916
integer width = 3154
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

event ue_mousemove;if is_opcion='FP' and (gs_depto='T' or gs_depto='I') then st_fuera_plazo.visible = true
end event

