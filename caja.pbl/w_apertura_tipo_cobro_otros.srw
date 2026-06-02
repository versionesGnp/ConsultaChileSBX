forward
global type w_apertura_tipo_cobro_otros from window
end type
type st_1 from statictext within w_apertura_tipo_cobro_otros
end type
type dw_lista from datawindow within w_apertura_tipo_cobro_otros
end type
type cb_cerrar from commandbutton within w_apertura_tipo_cobro_otros
end type
type cb_aceptar from commandbutton within w_apertura_tipo_cobro_otros
end type
end forward

global type w_apertura_tipo_cobro_otros from window
integer width = 2226
integer height = 1464
boolean titlebar = true
string title = "Tipo de Cobro ~"Cuenta Otros~""
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
dw_lista dw_lista
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
end type
global w_apertura_tipo_cobro_otros w_apertura_tipo_cobro_otros

type variables
String	ls_tipo_cob,ls_tipo_comp,il_pasa_desc,is_tipo_mov,is_tipo_cob
end variables

forward prototypes
public subroutine wf_validar_descuentos ()
end prototypes

public subroutine wf_validar_descuentos ();long		ll_tot_reg,ll_fila_reg,ll_count_e,ll_indi,ll_fila_cob
double 	ll_monto,ll_monto_desc,ll_monto_uf,lbd_uf
string		ls_cod_descto,ls_glosa_otro,ls_tipo_comp_otro,ls_tipo_cob_ref, ls_tipo_af_ex
date		idt_fecha_hoy

ls_cod_descto			= gs_codigo_otro
if ls_cod_descto <> '' and not isnull(ls_cod_descto) then
	if isvalid(w_ingreso2) then
		if w_ingreso2.tab_ingreso.SelectedTab = 2 then
			ll_tot_reg				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
		elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
			ll_tot_reg				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
		end if	
	end if
	if isvalid(w_repacta) then
		ll_tot_reg					= w_repacta.dw_detalle_ci.rowcount()
	end if
	if isvalid(w_boletas_cuotas) then
		ll_tot_reg					= w_boletas_cuotas.dw_detalle_bl.rowcount()
	end if	
	if ll_tot_reg>0 then
		if isvalid(w_ingreso2) then
			if isnull(gs_tipo_cobro) then
				if w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked = true then
					ls_tipo_af_ex			= 'BA'
				elseif w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked = true then
					ls_tipo_af_ex			= 'BE'
				end if
			else
				ls_tipo_af_ex				= gs_tipo_cobro
			end if
		else
			ls_tipo_af_ex					= 'BE'
		end if
		SELECT	DISTINCT "TIPO_COB_OTRO_VALIDA"."GLOSA_OTRO",	"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE",	"TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA"  
		INTO  	:ls_glosa_otro,											:ls_tipo_comp_otro, 											:ls_tipo_cob_ref  
		FROM 	"TIPO_COB_OTRO_VALIDA"  
		WHERE 	"TIPO_COB_OTRO_VALIDA"."CODIGO_OTRO" = :ls_cod_descto and
					"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE" = :ls_tipo_af_ex ;
		if isvalid(w_ingreso2) then
			if w_ingreso2.tab_ingreso.SelectedTab = 2 then
				ll_fila_cob 				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
			elseif w_ingreso2.tab_ingreso.SelectedTab = 3 then
				ll_fila_cob 				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
			end if	
		end if	
		if isvalid(w_repacta) then
			ll_fila_cob 					= w_repacta.dw_detalle_ci.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
		end if
		if isvalid(w_boletas_cuotas) then
			ll_fila_cob 					= w_boletas_cuotas.dw_detalle_bl.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
		end if	
		if ll_fila_cob > 0 then
			il_pasa_desc = 'S'
		else
			messagebox('Advertencia','Codigo descuento '+ls_glosa_otro+' No corresponde a Tipo de Pago')
			il_pasa_desc = 'N'
		end if
	end if	
else
//	il_pasa_desc = 'N'
end if	
end subroutine

on w_apertura_tipo_cobro_otros.create
this.st_1=create st_1
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.st_1,&
this.dw_lista,&
this.cb_cerrar,&
this.cb_aceptar}
end on

on w_apertura_tipo_cobro_otros.destroy
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
end on

event open;gf_centrar(w_apertura_tipo_cobro_otros)
if isvalid(w_ingreso2) then
	dw_lista.dataobject	= 'dw_lista_cuenta_otro_por_tipo_cobro'
else
	dw_lista.dataobject	= 'dw_lista_cuenta_otro_por_tipo_cobro_cta'
end if
dw_lista.settransobject(sqlca)
is_tipo_mov		= substr(1,1,Message.StringParm)
is_tipo_cob		= substr(1,2,Message.StringParm)
//ls_tipo_cob		= substr(1,1,Message.StringParm)
//ls_tipo_comp	= substr(1,2,Message.StringParm)
if dw_lista.retrieve(is_tipo_mov,is_tipo_cob)=0 then
	messagebox("Advertencia","No registra dato Tabla CUENTA OTRO")
end if
end event

event close;Long		ll_tot_reg

if isnull(gs_codigo_otro) or gs_codigo_otro='' then 
	messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	dw_lista.setfocus()
end if
if isvalid(w_ingreso2) then
	CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
		CASE 1 // Cupón
			
		CASE 2 // Comprobante Ingreso
				ll_tot_reg	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
				if ll_tot_reg > 0 then
					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.scrolltorow(ll_tot_reg)
					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto')
					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
				end if
		CASE 3 // Boletas
				ll_tot_reg	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
				if ll_tot_reg > 0 then
					w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.scrolltorow(ll_tot_reg)
					w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setcolumn('monto')
					w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setfocus()
				end if
		CASE 4 // Facturas Funeraria
				
	END CHOOSE
end if
end event

type st_1 from statictext within w_apertura_tipo_cobro_otros
integer x = 32
integer y = 48
integer width = 2135
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Seleccione Tipo de Cobro"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_apertura_tipo_cobro_otros
integer x = 32
integer y = 136
integer width = 2135
integer height = 1028
integer taborder = 10
string title = "Seleccione Tipo de Cobro"
string dataobject = "dw_lista_cuenta_otro_por_tipo_cobro"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

type cb_cerrar from commandbutton within w_apertura_tipo_cobro_otros
integer x = 1847
integer y = 1204
integer width = 320
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if isnull(gs_codigo_otro) or gs_codigo_otro='' then 
	messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	dw_lista.setfocus()
else
	close(w_apertura_tipo_cobro_otros)
end if
end event

type cb_aceptar from commandbutton within w_apertura_tipo_cobro_otros
integer x = 32
integer y = 1208
integer width = 320
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Double	ld_valor,ldb_valor_cta_ctto,ll_cuota_peso,ll_valor_serv,ll_rut_3ro,ll_valor_cuota_m,ll_rut_beneficiario
Long		ll_tot_reg,ll_indi,ll_count_reg,ll_fila,ll_res,ll_count_codigo,ll_new_reg,ll_sum_reg,ll_fila_dupli,ll_fila_iva,ll_count_m,ll_pasa_dup
String		ls_codigo_otro,ls_codigo_selec,ls_moneda, ls_codigo_otro_cur,ls_string,ls_moneda_val,ls_cod_otro_serv,ls_string_iva,ls_caja,ls_quien_paga,ls_dv_3ro,ls_fono_part_3ro,ls_celular_3ro,&
			ls_email_3ro,ls_tipo_via_3ro,ls_direccion_3ro,ls_nro_3ro,ls_depto_3ro,ls_block_3ro,ls_moneda_cta_m,ls_ciudad_3ro,ls_comuna_3ro,ls_nombre_3ro,ls_ap_pat_3ro,ls_ap_mat_3ro,&
			ls_dv_beneficiario,ls_nulo

Setnull(ls_nulo)
ll_pasa_dup											= 0
ll_res													= 1
ll_count_codigo										= 0
if isvalid(w_ingreso2) then
	gs_codigo_otro									= trim(dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros'))
	if isnull(gs_codigo_otro) or gs_codigo_otro='' then
		messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	else
		ld_valor										= dw_lista.getitemnumber(dw_lista.getrow(),'valor')
		CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
			CASE 1 // Cupón
				
			CASE 2 // Comprobante Ingreso
				ll_tot_reg							= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
				ls_codigo_selec						= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
//				if ls_codigo_selec = '22' then
//					ls_caja							= 'CR'		///Caja Diferencia Pagos Transferencia
//					w_ingreso2.st_n_caja.text	= ls_caja
//					if not isnull(ls_caja) then
//						gs_caja	= ls_caja
//					end if
//				end if
				if gs_base='F' then
					idw_detalle.retrieve('FA')
					idw_detalle12.retrieve('FA')
					idw_detalle15.retrieve()
				else
					idw_detalle.retrieve(gs_tipo_cobro)
					idw_detalle12.retrieve(gs_tipo_cobro)
				end if
				if is_tipo_mov='S' then wf_validar_descuentos()
				if il_pasa_desc = 'S' or is_tipo_mov='L' then
					if gs_base='F' then
						ll_tot_reg				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
						if w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.rowcount() > 0 then
							ldb_valor_cta_ctto	= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'producto_pago_valor_cuota')
							ll_cuota_peso		= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemnumber(1,'c_valor_cuota_pesos')
							ls_moneda			= w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.getitemstring(1,'producto_pago_moneda')
							if ld_valor > 1500 then // Debe ser PESO
								ls_moneda_val	= '1'
							else	// Debe ser UF
								ls_moneda_val	= '2'
							end if
							if ls_moneda_val <> ls_moneda then
//								messagebox("Adevertencia","El Monto Definido NO Corresponde al Tipo Moneda del Contrato - se realizará el cambio")
								ls_moneda		= ls_moneda_val
							end if
//							if (ld_valor = ldb_valor_cta_ctto or ldb_valor_cta_ctto = ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//								ll_res				= 1
//							elseif (ld_valor <> ldb_valor_cta_ctto and ldb_valor_cta_ctto <> ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//								ll_res				= messagebox("Advertencia","No Corresponde Valor según Definido por Contrato ( "+String(ldb_valor_cta_ctto,'###,###,##0.####')+" ), desea Continuar" ,Exclamation!,YesNo!,2)
//							elseif ld_valor >= 0 then
								ll_res				= 1
//							end if
						end if
						if ll_res=1 then
							for ll_indi=1 to ll_tot_reg
								ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
								if gs_codigo_otro = ls_codigo_otro then
									ll_count_codigo ++
									if ll_count_codigo>0 then
										messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
										exit
									end if
								end if
							next
							if ll_count_codigo < 1 then
								if ld_valor > 0 then
										ll_fila				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow()
										w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',gs_codigo_otro)
										if ls_moneda = '2' then
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'moneda','U')
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'monto_uf',ld_valor)
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'monto', round( ld_valor * gd_uf,0))
										elseif ls_moneda = '1' then
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'moneda','P')
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'monto',ld_valor)
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ld_valor / gd_uf,2))
										end if
										w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
								else
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
								end if
//								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto')
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
								if isnull( w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount(),'tipo_cob_otro')) then
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.deleterow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
								end if
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.scrolltorow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
								cb_cerrar.triggerevent(clicked!)
							end if
						end if
					else
						if gs_base='M' and (gs_codigo_otro<>'170' and gs_codigo_otro<>'171' and gs_codigo_otro<>'172' and gs_codigo_otro<>'173' and gs_codigo_otro<>'174' and gs_codigo_otro<>'175' and gs_codigo_otro<>'177' and gs_codigo_otro<>'178' and gs_codigo_otro<>'179' ) then
							messagebox("Advertencia","Descuento Seleccionado No corresponde a MultiProducto")
						else
							for ll_indi=1 to ll_tot_reg
								ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
								if gs_codigo_otro = ls_codigo_otro then
									ll_count_codigo ++
									if ll_count_codigo>0 then
										messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
										exit
									end if
								end if
							next
							if ll_count_codigo < 1 then
								if ld_valor>0 then
									if w_ingreso2.tab_ingreso.tp_ci.rb_ci_uf.checked=true then
										w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto_uf',ld_valor)
										w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto_uf')
									else
										if ld_valor > 1500 then
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',ld_valor)
										else
											w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',ROUND((gd_uf * ld_valor),0))
										end if
			//							w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',(gd_uf * ld_valor))
										w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto')
									end if
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.scrolltorow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())		//getrow())
								else
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.scrolltorow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())		//getrow())
								end if
								
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
								if isnull( w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount(),'tipo_cob_otro')) then
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.deleterow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
									w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
								end if
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.scrolltorow(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount())
								w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
								cb_cerrar.triggerevent(clicked!)
							end if
						end if
					end if
				end if
				
			CASE 3 // Boletas
				ll_tot_reg			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
				ls_codigo_selec		= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
				
				if is_tipo_mov='S' then wf_validar_descuentos()
				if il_pasa_desc = 'S' or is_tipo_mov='L' then
					if gs_base='F' or gs_base='G' then
						ll_tot_reg				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
						if w_ingreso2.tab_ingreso.tp_be.dw_datos_be.rowcount() > 0 then
							ldb_valor_cta_ctto	= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber(1,'producto_pago_valor_cuota')
							ll_cuota_peso		= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemnumber(1,'c_valor_cuota_pesos')
							ls_moneda			= w_ingreso2.tab_ingreso.tp_be.dw_datos_be.getitemstring(1,'producto_pago_moneda')
							ll_res					= 1
							if gs_base='F' and (ls_codigo_selec='490' or ls_codigo_selec='491') then
								
								SELECT 	count("PRODUCTO_GESTION_SERVICIO"."BASE")
								INTO 		:ll_count_m
								FROM 	"PRODUCTO_GESTION_SERVICIO"  
								WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" = 2 ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."CODIGO_SERVICIO" >= 670 ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."CODIGO_SERVICIO" <= 674 )  ;
								if isnull(ll_count_m) then ll_count_m=0
								if ll_count_m=0 then
									messagebox("Advertencia","No Registra Servicio Activado para Facturar")
									Setnull(ls_moneda)
									Setnull(ll_cuota_peso)
									Setnull(ldb_valor_cta_ctto)
									Setnull(ld_valor)
									ll_fila				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow()
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'cantidad',0)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'tipo_cob',ls_nulo)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'tipo_cob_otro',ls_nulo)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.scrolltorow(ll_fila)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setcolumn('tipo_cob')
									ll_res				= 0
								else
									SELECT 	"PRODUCTO_GESTION_SERVICIO"."QUIEN_PAGA",  	"PRODUCTO_GESTION_SERVICIO"."RUT_3RO",   	"PRODUCTO_GESTION_SERVICIO"."DV_3RO",   	"PRODUCTO_GESTION_SERVICIO"."FONO_PARTICULAR_3RO",   	"PRODUCTO_GESTION_SERVICIO"."CELULAR_3RO",   	"PRODUCTO_GESTION_SERVICIO"."EMAIL_3RO",   	"PRODUCTO_GESTION_SERVICIO"."TIPO_VIA_3RO",   	"PRODUCTO_GESTION_SERVICIO"."DIRECCION_3RO",   	"PRODUCTO_GESTION_SERVICIO"."NRO_DIREC_3RO",   	"PRODUCTO_GESTION_SERVICIO"."DEPTO_3RO",   	"PRODUCTO_GESTION_SERVICIO"."BLOCK_3RO",   	"PRODUCTO_GESTION_SERVICIO"."MONEDA_CTA_MORTUORIA",   	"PRODUCTO_GESTION_SERVICIO"."VALOR_CUOTA_MORTUORIA",   	"PRODUCTO_GESTION_SERVICIO"."CIUDAD_3RO",   	"PRODUCTO_GESTION_SERVICIO"."COMUNA_3RO",   	"PRODUCTO_GESTION_SERVICIO"."NOMBRE_3RO",   	"PRODUCTO_GESTION_SERVICIO"."AP_PATERNO_3RO",   	"PRODUCTO_GESTION_SERVICIO"."AP_MATERNO_3RO",   	"PRODUCTO_GESTION_SERVICIO"."RUT_BENEFICIARIO",   	"PRODUCTO_GESTION_SERVICIO"."DV_BENEFICIARIO"  	
									INTO 		:ls_quien_paga,   												:ll_rut_3ro,   												:ls_dv_3ro,   												:ls_fono_part_3ro,   															:ls_celular_3ro,   													:ls_email_3ro,   												:ls_tipo_via_3ro,   													:ls_direccion_3ro,   												:ls_nro_3ro,   															:ls_depto_3ro,   												:ls_block_3ro,   												:ls_moneda_cta_m,   																:ll_valor_cuota_m,   																:ls_ciudad_3ro,   												:ls_comuna_3ro,   												:ls_nombre_3ro,   													:ls_ap_pat_3ro,   														:ls_ap_mat_3ro,   														:ll_rut_beneficiario,   													:ls_dv_beneficiario  
									FROM 	"PRODUCTO_GESTION_SERVICIO"  
									WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" = 2 ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."CORRELATIVO" = (SELECT MIN("PRODUCTO_GESTION_SERVICIO"."CORRELATIVO") FROM "PRODUCTO_GESTION_SERVICIO" WHERE ( "PRODUCTO_GESTION_SERVICIO"."BASE" = :gs_base ) AND ( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :gs_serie ) AND ( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :gi_numero ) AND ( "PRODUCTO_GESTION_SERVICIO"."SW_ACTIVACION" = 2 ) ) ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."CODIGO_SERVICIO" >= 670 ) AND  
												( "PRODUCTO_GESTION_SERVICIO"."CODIGO_SERVICIO" <= 674 )  
									USING	sqlca;
									if sqlca.sqlcode=0 then
										ls_moneda			= ls_moneda_cta_m
										ll_cuota_peso		= ll_valor_cuota_m
										ldb_valor_cta_ctto	= ll_valor_cuota_m
										ld_valor				= ll_valor_cuota_m
										
									end if
								end if
							end if
							if ld_valor > 1500 then // Debe ser PESO
								ls_moneda_val	= '1'
							else	// Debe ser UF
								ls_moneda_val	= '2'
							end if
							if ls_moneda_val <> ls_moneda then
//								messagebox("Adevertencia","El Monto Definido NO Corresponde al Tipo Moneda del Contrato - se realizará el cambio")
								ls_moneda		= ls_moneda_val
							end if
//								ll_res				= 1
						end if
						if ll_res=1 then
							for ll_indi=1 to ll_tot_reg
								ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
								if gs_codigo_otro = ls_codigo_otro then
									ll_count_codigo ++
									if ll_count_codigo>0 then
										messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
										exit
									end if
								end if
							next
							if ll_count_codigo < 1 then
								if ld_valor > 0 then
										ll_fila				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow()
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'tipo_cob_otro',gs_codigo_otro)
										if ls_moneda = '2' then
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'moneda','U')
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'monto_uf',ld_valor)
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'monto', round( ld_valor * gd_uf,0))
										elseif ls_moneda = '1' then
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'moneda','P')
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'monto',ld_valor)
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila,'monto_uf', round( ld_valor / gd_uf,2))
										end if
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
								else
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
								end if
//								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'tipo_cob_otro',gs_codigo_otro)
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setcolumn('monto')
								if is_tipo_mov = 'L' then w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.triggerevent(itemchanged!)
								if isnull( w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount(),'tipo_cob_otro')) then
//									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.deleterow(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
								end if
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.scrolltorow(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setfocus()
								cb_cerrar.triggerevent(clicked!)
							end if
						end if
					else	
						for ll_indi=1 to ll_tot_reg
							ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
							if gs_codigo_otro = ls_codigo_otro then
								ll_count_codigo ++
								if ll_count_codigo>0 then
									messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
									exit
								end if
							end if
						next
						if ll_count_codigo < 1 then
							ls_string_iva		= "tipo_cob='D' or tipo_cob='X' or tipo_cob='V' "
							ll_fila_iva			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find(ls_string_iva, 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
							if ll_fila_iva > 0 and gs_codigo_otro <> '3' and gs_codigo_otro <> '76' and is_tipo_mov <> 'S' then
								messagebox("Advertencia","Debe Generar otra Boleta Afecta para Items Otros")
//								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.deleterow(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow())
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
							else
								if ld_valor>0 then
									if w_ingreso2.tab_ingreso.tp_be.rb_be_uf.checked=true then
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto_uf',ld_valor)
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setcolumn('monto_uf')
									else
										if ld_valor > 1500 then
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto',ld_valor)
										else							
											w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'monto',ROUND((gd_uf * ld_valor),0))
										end if
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setcolumn('monto')
									end if
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.scrolltorow(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow())
								else
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'tipo_cob',is_tipo_mov)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.scrolltorow(w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getrow())
								end if
								if is_tipo_mov = 'L' then w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.triggerevent(itemchanged!)
								cb_cerrar.triggerevent(clicked!)
							end if
						end if
					end if
				end if

			CASE 4 // Facturas Funeraria
				ll_tot_reg			= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.rowcount()
				ls_codigo_selec		= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
				
				if is_tipo_mov='S' then wf_validar_descuentos()
				if il_pasa_desc = 'S' or is_tipo_mov='L' then
					if gs_base='F' then
//						if ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' then
//							SELECT DISTINCT "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO"  
//							INTO					:ls_cod_otro_serv
//							FROM 	"PRODUCTO_VENTA_ASOCIADA",  "PRODUCTO_TIPO_SERVICIO"  
//							WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
//										( ( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
//										( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
//										( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) )   ;
//							ls_codigo_selec		= ls_cod_otro_serv
//							gs_codigo_otro		= ls_cod_otro_serv
//						end if
						ll_tot_reg				= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.rowcount()
						if w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.rowcount() > 0 then
							ldb_valor_cta_ctto	= w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.getitemnumber(1,'producto_pago_valor_cuota')
							ll_cuota_peso		= w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.getitemnumber(1,'c_valor_cuota_pesos')
							ls_moneda			= w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.getitemstring(1,'producto_pago_moneda')
							if ld_valor > 1500 then // Debe ser PESO
								ls_moneda_val	= '1'
							else	// Debe ser UF
								ls_moneda_val	= '2'
							end if
							if ls_moneda_val <> ls_moneda then
//								messagebox("Adevertencia","El Monto Definido NO Corresponde al Tipo Moneda del Contrato - se realizará el cambio")
								ls_moneda		= ls_moneda_val
							end if
//							if (ld_valor = ldb_valor_cta_ctto or ldb_valor_cta_ctto = ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//								ll_res				= 1
//							elseif (ld_valor <> ldb_valor_cta_ctto and ldb_valor_cta_ctto <> ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//								ll_res				= messagebox("Advertencia","No Corresponde Valor según Definido por Contrato ( "+String(ldb_valor_cta_ctto,'###,###,##0.####')+" ), desea Continuar" ,Exclamation!,YesNo!,2)
//							elseif ld_valor >= 0 then
								ll_res				= 1
//							end if
						end if
						if ll_res=1 then
							for ll_indi=1 to ll_tot_reg
								ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
								if gs_codigo_otro = ls_codigo_otro then
									ll_count_codigo ++
									if ll_count_codigo>0 then
										messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
										exit
									end if
								end if
							next
							if ll_count_codigo < 1 then
								if ld_valor > 0 then
									if ls_moneda = '2' then
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'moneda','U')
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto_uf',ld_valor)
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto_uf')
									elseif ls_moneda = '1' then
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto',ld_valor)
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto')
									end if
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.scrolltorow(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow())
								else
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.scrolltorow(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow())
								end if
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto')
								
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.triggerevent(itemchanged!)
								cb_cerrar.triggerevent(clicked!)
							end if
						end if
					else
						for ll_indi=1 to ll_tot_reg
							ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
							if gs_codigo_otro = ls_codigo_otro then
								ll_count_codigo ++
								if ll_count_codigo>0 then
									messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
									exit
								end if
							end if
						next
						if ll_count_codigo < 1 then
							if ld_valor > 0 then
								if w_ingreso2.tab_ingreso.tp_boletas.rb_ci_uf_bl.checked=true then
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto_uf',ld_valor)
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto_uf')
								else
									if ld_valor > 1500 then
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto',ld_valor)
									else							
										w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto',ROUND((gd_uf * ld_valor),0))
									end if
									w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto')
								end if
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.scrolltorow(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow())
							else
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob',is_tipo_mov)
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
								w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.scrolltorow(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow())
							end if
							w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.triggerevent(itemchanged!)
							cb_cerrar.triggerevent(clicked!)
						end if
					end if
				end if
//			CASE 5 // Pago Traspaso a Empresa
//				ll_tot_reg			= w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.rowcount()
//				for ll_indi=1 to ll_tot_reg
//					ls_codigo_otro	= w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.getitemstring(ll_indi,'tipo_cob_otro')
//					if gs_codigo_otro = ls_codigo_otro then
//						ll_count_codigo ++
//						if ll_count_codigo>0 then
//							messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
//							exit
//						end if
//					end if
//				next
//				if ll_count_codigo < 1 then
//					if ld_valor>0 then
//						if w_ingreso2.tab_ingreso.tp_traspaso.rb_ci_uf_mult.checked=true then
//							w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.setitem(w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.getrow(),'monto_uf',ld_valor)
//							w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto_uf')
//						else
//							w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.setitem(w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.getrow(),'monto',(gd_uf * ld_valor))
//							w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setcolumn('monto')
//						end if
//						w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.setitem(w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.getrow(),'tipo_cob_otro',gs_codigo_otro)
//						w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.accepttext()
//					else
//						w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.setitem(w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.getrow(),'tipo_cob_otro',gs_codigo_otro)
//						w_ingreso2.tab_ingreso.tp_traspaso.dw_detalle_ci_2.accepttext()
//					end if
//					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
//					cb_cerrar.triggerevent(clicked!)
//				end if
		END CHOOSE
	end if
end if
if isvalid(w_repacta) then
	gs_codigo_otro	= trim(dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros'))
	if isnull(gs_codigo_otro) or gs_codigo_otro='' then
		messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	else
		ld_valor				= dw_lista.getitemnumber(dw_lista.getrow(),'valor')
		ll_tot_reg			= w_repacta.dw_detalle_ci.rowcount()
		ls_codigo_selec		= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
//		if gs_base='F' then
//			if ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' then
//				SELECT DISTINCT "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO"  
//				INTO					:ls_cod_otro_serv
//				FROM 	"PRODUCTO_VENTA_ASOCIADA",  "PRODUCTO_TIPO_SERVICIO"  
//				WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
//							( ( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
//							( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
//							( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) )   ;
//				ls_codigo_selec		= ls_cod_otro_serv
//				gs_codigo_otro		= ls_cod_otro_serv
//			end if
//		end if
		if is_tipo_mov='S' then wf_validar_descuentos()
		if il_pasa_desc = 'S' or is_tipo_mov='L' then
			for ll_indi=1 to ll_tot_reg
				ls_codigo_otro	= w_repacta.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
				if gs_codigo_otro = ls_codigo_otro then
					ll_count_codigo ++
					if ll_count_codigo>0 then
						messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
						exit
					end if
				end if
			next
			if ll_count_codigo < 1 then
				if ld_valor>0 then
					//if gs_codigo_otro='27' or gs_codigo_otro='42' then
					if ld_valor > 1500 then
						w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'moneda','P')
						w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'monto',ld_valor)
					else							
						w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'moneda','U')
						w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'monto_uf', ld_valor )
//						w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'monto',ROUND((gd_uf * ld_valor),0))
					end if			
					w_repacta.dw_detalle_ci.accepttext()
					w_repacta.dw_detalle_ci.setcolumn('monto')
					w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
					w_repacta.dw_detalle_ci.accepttext()
				else
					w_repacta.dw_detalle_ci.setitem(w_repacta.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
					w_repacta.dw_detalle_ci.accepttext()
				end if
				w_repacta.dw_detalle_ci.triggerevent(itemchanged!)
				cb_cerrar.triggerevent(clicked!)
			end if
		end if
	end if
end if

if isvalid(w_repacta_funeraria) then
	gs_codigo_otro	= trim(dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros'))
	if isnull(gs_codigo_otro) or gs_codigo_otro='' then
		messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	else
		ld_valor						= dw_lista.getitemnumber(dw_lista.getrow(),'valor')
	
		ll_tot_reg					= w_repacta_funeraria.dw_detalle_ci.rowcount()
		ls_codigo_selec				= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
		ldb_valor_cta_ctto			= w_repacta_funeraria.dw_datos_ci.getitemnumber(1,'producto_pago_valor_cuota')
		ll_cuota_peso				= w_repacta_funeraria.dw_datos_ci.getitemnumber(1,'c_valor_cuota_pesos')
		ls_moneda					= w_repacta_funeraria.dw_datos_ci.getitemstring(1,'producto_pago_moneda')
		if gs_base='F' or gs_base='G' then
			ll_tot_reg				= w_repacta_funeraria.dw_detalle_ci.rowcount()
			if w_repacta_funeraria.dw_detalle_ci.rowcount() > 0 then
				if ld_valor > 1500 then // Debe ser PESO
					ls_moneda_val	= '1'
				else	// Debe ser UF
					ls_moneda_val	= '2'
				end if
				if ls_moneda_val <> ls_moneda then
//					messagebox("Adevertencia","El Monto Definido NO Corresponde al Tipo Moneda del Contrato - se realizará el cambio")
					ls_moneda		= ls_moneda_val
				end if
//				if (ld_valor = ldb_valor_cta_ctto or ldb_valor_cta_ctto = ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//					ll_res				= 1
//				elseif (ld_valor <> ldb_valor_cta_ctto and ldb_valor_cta_ctto <> ll_cuota_peso) and (ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' ) then
//					ll_res				= messagebox("Advertencia","No Corresponde Valor según Definido por Contrato ( "+String(ldb_valor_cta_ctto,'###,###,##0.####')+" ), desea Continuar" ,Exclamation!,YesNo!,2)
//				elseif ld_valor >= 0 then
					ll_res				= 1
//				end if
			end if
			if ll_res=1 then
				for ll_indi=1 to ll_tot_reg
					ls_codigo_otro	= w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
					if gs_codigo_otro = ls_codigo_otro then
						ll_count_codigo ++
						if ll_count_codigo>0 then
							messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
							exit
						end if
					end if
				next
				if ll_count_codigo < 1 then
					if ld_valor > 0 then
							ll_fila				= w_repacta_funeraria.dw_detalle_ci.getrow()
							w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',gs_codigo_otro)
							if ls_moneda = '2' then
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'moneda','U')
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'monto_uf',ld_valor)
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'monto', round( ld_valor * gd_uf,0))
							elseif ls_moneda = '1' then
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'moneda','P')
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'monto',ld_valor)
								w_repacta_funeraria.dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ld_valor / gd_uf,2))
							end if
							w_repacta_funeraria.dw_detalle_ci.accepttext()
					else
						w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
						w_repacta_funeraria.dw_detalle_ci.accepttext()
					end if
					w_repacta_funeraria.dw_detalle_ci.setcolumn('monto')
					w_repacta_funeraria.dw_detalle_ci.triggerevent(itemchanged!)
					if isnull( w_repacta_funeraria.dw_detalle_ci.getitemstring(w_repacta_funeraria.dw_detalle_ci.rowcount(),'tipo_cob_otro')) then
						w_repacta_funeraria.dw_detalle_ci.deleterow(w_repacta_funeraria.dw_detalle_ci.rowcount())
						w_repacta_funeraria.dw_detalle_ci.accepttext()
					end if
					w_repacta_funeraria.dw_detalle_ci.scrolltorow(w_repacta_funeraria.dw_detalle_ci.rowcount())
					w_repacta_funeraria.dw_detalle_ci.setfocus()
					cb_cerrar.triggerevent(clicked!)
				end if
			end if
		else				
			for ll_indi=1 to ll_tot_reg
				ls_codigo_otro	= w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
				if gs_codigo_otro = ls_codigo_otro then
					ll_count_codigo ++
					if ll_count_codigo>0 then
						messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
						exit
					end if
				end if
			next
			if ll_count_codigo < 1 then
				if ld_valor > 0 then
					if ls_moneda = '2' then
						w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'moneda','U')
						w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'monto_uf',ld_valor)
//						w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto_uf')
					elseif ls_moneda = '1' then
						w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'moneda','P')
						w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'monto_uf',ld_valor)
//						w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'monto',ld_valor)
//						w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto')
					end if
					w_repacta_funeraria.dw_detalle_ci.accepttext()
//					w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
//					w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
				else
					w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
					w_repacta_funeraria.dw_detalle_ci.accepttext()
//					w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
//					w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.accepttext()
				end if
				w_repacta_funeraria.dw_detalle_ci.setitem(w_repacta_funeraria.dw_detalle_ci.getrow(),'tipo_cob_otro',gs_codigo_otro)
				w_repacta_funeraria.dw_detalle_ci.accepttext()
				w_repacta_funeraria.dw_detalle_ci.setcolumn('monto')
//				w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setitem(w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getrow(),'tipo_cob_otro',gs_codigo_otro)
//				w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.setcolumn('monto')
				
//				w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.triggerevent(itemchanged!)
				cb_cerrar.triggerevent(clicked!)
			end if
		end if
	end if
end if

if isvalid(w_boletas_cuotas) then
	gs_codigo_otro	= dw_lista.getitemstring(dw_lista.getrow(),'codigo_otros')
//	if gs_base='F' then
//		if ls_codigo_selec = '85' or ls_codigo_selec = '86' or ls_codigo_selec = '87' or ls_codigo_selec = '88' or ls_codigo_selec = '89' or ls_codigo_selec = '90' or ls_codigo_selec = '91' or ls_codigo_selec = '92' then
//			SELECT DISTINCT "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO"  
//			INTO					:ls_cod_otro_serv
//			FROM 	"PRODUCTO_VENTA_ASOCIADA",  "PRODUCTO_TIPO_SERVICIO"  
//			WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
//						( ( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
//						( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
//						( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) )   ;
//			ls_codigo_selec		= ls_cod_otro_serv
//			gs_codigo_otro		= ls_cod_otro_serv
//		end if
//	end if
	if isnull(gs_codigo_otro) or gs_codigo_otro='' then
		messagebox("Advertencia","Debe Seleccionar Tipo de Cobro")
	else
		ll_tot_reg			= w_boletas_cuotas.dw_detalle_bl.rowcount()
		ld_valor				= dw_lista.getitemnumber(dw_lista.getrow(),'valor')
		if is_tipo_mov= 'S' then wf_validar_descuentos()
		if il_pasa_desc = 'S' or is_tipo_mov='L' then
			for ll_indi=1 to ll_tot_reg
				ls_codigo_otro	= w_boletas_cuotas.dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
				if gs_codigo_otro = ls_codigo_otro then
					ll_count_codigo ++
					if ll_count_codigo>0 then
						messagebox("Advertencia","Tipo de Cobro (Cuenta Otros) Duplicado")
						exit
					end if
				end if
			next
			if ll_count_codigo < 1 then
				ll_fila			= w_boletas_cuotas.dw_detalle_bl.getrow()
				if ld_valor > 0 then
					if ld_valor > 1500 then
						w_boletas_cuotas.dw_detalle_bl.setitem(ll_fila,'monto', ld_valor )
					else
						w_boletas_cuotas.dw_detalle_bl.setitem(ll_fila,'monto',ROUND((gd_uf * ld_valor),0))
					end if
					w_boletas_cuotas.dw_detalle_bl.setcolumn('monto')
					w_boletas_cuotas.dw_detalle_bl.setitem(ll_fila,'tipo_cob_otro',gs_codigo_otro)
					w_boletas_cuotas.dw_detalle_bl.accepttext()
				else
					w_boletas_cuotas.dw_detalle_bl.setitem(ll_fila,'tipo_cob_otro',gs_codigo_otro)
					w_boletas_cuotas.dw_detalle_bl.accepttext()
				end if
				w_boletas_cuotas.dw_detalle_bl.triggerevent(itemchanged!)
				cb_cerrar.triggerevent(clicked!)
			end if
		end if	
	end if
end if
end event

