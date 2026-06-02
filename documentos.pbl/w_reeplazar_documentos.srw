forward
global type w_reeplazar_documentos from window
end type
type cb_ctacte from commandbutton within w_reeplazar_documentos
end type
type dw_lista_original_doc_cob from datawindow within w_reeplazar_documentos
end type
type cb_grabar from commandbutton within w_reeplazar_documentos
end type
type st_eliminar from statictext within w_reeplazar_documentos
end type
type st_insertar from statictext within w_reeplazar_documentos
end type
type pb_eliminar from picturebutton within w_reeplazar_documentos
end type
type pb_insertar from picturebutton within w_reeplazar_documentos
end type
type dw_lista_modificados from datawindow within w_reeplazar_documentos
end type
type st_identificar from statictext within w_reeplazar_documentos
end type
type st_ayuda from statictext within w_reeplazar_documentos
end type
type cb_cerrar from commandbutton within w_reeplazar_documentos
end type
type dw_lista_destino from datawindow within w_reeplazar_documentos
end type
type dw_lista_original from datawindow within w_reeplazar_documentos
end type
end forward

global type w_reeplazar_documentos from window
integer width = 4128
integer height = 1956
boolean titlebar = true
string title = "Reeplazar Documentos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_ctacte cb_ctacte
dw_lista_original_doc_cob dw_lista_original_doc_cob
cb_grabar cb_grabar
st_eliminar st_eliminar
st_insertar st_insertar
pb_eliminar pb_eliminar
pb_insertar pb_insertar
dw_lista_modificados dw_lista_modificados
st_identificar st_identificar
st_ayuda st_ayuda
cb_cerrar cb_cerrar
dw_lista_destino dw_lista_destino
dw_lista_original dw_lista_original
end type
global w_reeplazar_documentos w_reeplazar_documentos

type variables
String	is_base,is_serie,is_tipo_cob
Long		il_folio
Datetime	idt_fecha_pago
Double	il_numero
DragObject control_dw
end variables

on w_reeplazar_documentos.create
this.cb_ctacte=create cb_ctacte
this.dw_lista_original_doc_cob=create dw_lista_original_doc_cob
this.cb_grabar=create cb_grabar
this.st_eliminar=create st_eliminar
this.st_insertar=create st_insertar
this.pb_eliminar=create pb_eliminar
this.pb_insertar=create pb_insertar
this.dw_lista_modificados=create dw_lista_modificados
this.st_identificar=create st_identificar
this.st_ayuda=create st_ayuda
this.cb_cerrar=create cb_cerrar
this.dw_lista_destino=create dw_lista_destino
this.dw_lista_original=create dw_lista_original
this.Control[]={this.cb_ctacte,&
this.dw_lista_original_doc_cob,&
this.cb_grabar,&
this.st_eliminar,&
this.st_insertar,&
this.pb_eliminar,&
this.pb_insertar,&
this.dw_lista_modificados,&
this.st_identificar,&
this.st_ayuda,&
this.cb_cerrar,&
this.dw_lista_destino,&
this.dw_lista_original}
end on

on w_reeplazar_documentos.destroy
destroy(this.cb_ctacte)
destroy(this.dw_lista_original_doc_cob)
destroy(this.cb_grabar)
destroy(this.st_eliminar)
destroy(this.st_insertar)
destroy(this.pb_eliminar)
destroy(this.pb_insertar)
destroy(this.dw_lista_modificados)
destroy(this.st_identificar)
destroy(this.st_ayuda)
destroy(this.cb_cerrar)
destroy(this.dw_lista_destino)
destroy(this.dw_lista_original)
end on

event open;Long		ll_tot_reg,ll_indi
String	ls_fecha
Time		lt_hora

lt_hora						= time('00:00:00')
gf_centrar(w_reeplazar_documentos)
dw_lista_original.settransobject(sqlca)
dw_lista_original_doc_cob.settransobject(sqlca)
dw_lista_destino.settransobject(sqlca)
dw_lista_modificados.settransobject(sqlca)
st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false
is_base 						= trim(substr(1,1,Message.StringParm))
is_serie						= trim(substr(1,2,Message.StringParm))
il_numero					= Double(substr(1,3,Message.StringParm))
is_tipo_cob 				= trim(substr(1,4,Message.StringParm))
il_folio						= Long(substr(1,5,Message.StringParm))
gs_base						= is_base
gs_serie						= is_serie
gi_numero					= il_numero
ls_fecha						= mid(trim(substr(1,6,Message.StringParm)),1,10)
idt_fecha_pago				= datetime(date(ls_fecha),lt_hora)
ll_tot_reg					= dw_lista_original.retrieve(is_tipo_cob,il_folio,idt_fecha_pago)
if ll_tot_reg = 0 then
	messagebox("Advertencia","No Registra Pagos con Cheque, Comprobante "+is_tipo_cob+'-'+string(il_folio,"###,###,###,###,###"))
	close(w_reeplazar_documentos)
else
	dw_lista_original_doc_cob.retrieve(is_tipo_cob,il_folio,idt_fecha_pago)
	for ll_indi=1 to ll_tot_reg
		dw_lista_original.setitem(ll_indi,'estado',1)
	next
	dw_lista_original.accepttext()
end if
end event

event mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

type cb_ctacte from commandbutton within w_reeplazar_documentos
integer x = 1824
integer y = 1736
integer width = 448
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cu&enta Corriente"
end type

event clicked;String	ls_tipo_cob
Long		ll_folio,ll_row
datetime	ldt_fecha_pago
ll_row			= dw_lista_original.getrow()
if dw_lista_original.rowcount()>0 and ll_row>0 then
	ls_tipo_cob		= dw_lista_original.getitemstring(ll_row,'tipo_cob')
	ll_folio			= dw_lista_original.getitemnumber(ll_row,'folio')
	ldt_fecha_pago	= dw_lista_original.getitemdatetime(ll_row,'fecha_pago')
	SELECT DISTINCT 	"INGRESO"."BASE",   
							"INGRESO"."SERIE",   
							"INGRESO"."CONTRATO"  
	INTO 					:gs_base,   
							:gs_serie,   
							:gi_numero  
	FROM 					"INGRESO"  
	WHERE  			 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago)   
	USING					sqlca;
	if not isnull(gs_base) and gi_numero>0 then
	SELECT	"CADENA"."RUT",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."NOMBRE",	"CLIENTE"."DV",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE" 
	INTO 		:gi_rut,				:gs_apellido_paterno,	:gs_apellido_materno,	:gs_nombres,			:gs_dv,				:gs_estado,				:gl_cod_parque_cta  
	FROM 		"CADENA",   
				"CLIENTE"  
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )   ;
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type dw_lista_original_doc_cob from datawindow within w_reeplazar_documentos
boolean visible = false
integer x = 539
integer y = 1732
integer width = 398
integer height = 284
boolean titlebar = true
string title = "doc cob"
string dataobject = "dw_lista_documento_a_reemplazar_doc_cob"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_grabar from commandbutton within w_reeplazar_documentos
integer x = 37
integer y = 1736
integer width = 306
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_total_original,ll_total,ll_graba_1,ll_graba_2,ll_pasa=0,ll_tot_reg,ll_indi,&
			ll_n_cheque,ll_cod_banco,ll_monto,ll_tot_mod,ll_indi_mod,ll_n_cheque_mod,ll_cod_banco_mod,&
			ll_count
Datetime	ldt_fecha_venc,ldt_fecha_estado_ch
String	ls_cod_pago,ls_estado_ch,ls_glosa_ch,ls_estado
ll_total_original	= dw_lista_modificados.getitemnumber(1,'total_monto_original')
ll_total				= dw_lista_destino.getitemnumber(1,'total_monto')
if ll_total <> ll_total_original then
	messagebox("Advertencia","Error Monto Total Modificado debe ser $ "+string(ll_total_original,"###,###,###,###,###"))
	dw_lista_destino.setfocus()
	dw_lista_destino.scrolltorow(1)
	dw_lista_destino.setcolumn('monto')
else
	ll_tot_reg						= dw_lista_destino.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_pasa					= 0
			ll_n_cheque				= dw_lista_destino.getitemnumber(ll_indi,'n_cheque')
			ll_cod_banco			= dw_lista_destino.getitemnumber(ll_indi,'cod_banco')
			ll_tot_mod				= dw_lista_modificados.rowcount()
			if ll_tot_mod>0 then
				for ll_indi_mod=1 to ll_tot_mod
					ll_n_cheque_mod	= dw_lista_modificados.getitemnumber(ll_indi_mod,'n_cheque')
					ll_cod_banco_mod	= dw_lista_modificados.getitemnumber(ll_indi_mod,'cod_banco')
					if ll_n_cheque_mod=ll_n_cheque and ll_cod_banco_mod=ll_cod_banco then
						messagebox("Advertencia","Debe Cambiar Cheque Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('n_cheque')
						ll_pasa++
						exit
					end if
				next
			end if
			if ll_pasa=0 then
				ll_monto					= dw_lista_destino.getitemnumber(ll_indi,'monto')
				ldt_fecha_venc			= dw_lista_destino.getitemdatetime(ll_indi,'fecha_venc')
				ls_cod_pago				= dw_lista_destino.getitemstring(ll_indi,'cod_pago')
				ls_estado_ch			= dw_lista_destino.getitemstring(ll_indi,'estado_ch')
				ls_glosa_ch				= dw_lista_destino.getitemstring(ll_indi,'glosa_ch')
				ldt_fecha_estado_ch	= dw_lista_destino.getitemdatetime(ll_indi,'fecha_estado_ch')
				if isnull(ll_cod_banco) or ll_cod_banco=0 then
					messagebox("Advertencia","Falta Ingresar Banco Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('cod_banco')
					ll_pasa++
					exit
				elseif isnull(ll_n_cheque) or ll_n_cheque=0 then
					messagebox("Advertencia","Falta Ingresar Serie Cheque Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('n_cheque')
					ll_pasa++
					exit
				elseif isnull(ldt_fecha_venc) then
					messagebox("Advertencia","Falta Ingresar Fecha Vencimiento Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('fecha_venc')
					ll_pasa++
					exit
				elseif isnull(ls_cod_pago) or ls_cod_pago='' then
					messagebox("Advertencia","Falta Ingresar Forma de Pago Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('cod_pago')
					ll_pasa++
					exit
				elseif isnull(ll_monto) or ll_monto=0 then
					messagebox("Advertencia","Falta Ingresar Monto Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('monto')
					ll_pasa++
					exit
				elseif isnull(ls_estado_ch) or ls_estado_ch='' then
					messagebox("Advertencia","Falta Ingresar Estado Cheque Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('estado_ch')
					ll_pasa++
					exit
				elseif isnull(ls_glosa_ch) or ls_glosa_ch='' then
					messagebox("Advertencia","Falta Ingresar Glosa Fila Nº "+string(ll_indi))
					dw_lista_destino.setfocus()
					dw_lista_destino.setcolumn('glosa_ch')
					ll_pasa++
					exit
				end if
			end if
		next
	end if
	if ll_pasa=0 then
		if dw_lista_original.update()=1 then
			commit;
			ll_graba_1	= dw_lista_destino.update()
			ll_graba_2	= dw_lista_modificados.update()
			if ll_graba_1=1 and ll_graba_2=1 then
				commit;
				SELECT	"CADENA"."ESTADO"  
				INTO 		:ls_estado  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :is_base ) AND  
						 ( "CADENA"."SERIE" = :is_serie ) AND  
						 ( "CADENA"."NUMERO" = :il_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='T' then
						SELECT	Count("DOCUMENTOS"."ESTADO_CH")  
						INTO 		:ll_count  
						FROM 		"DOCUMENTOS",   
									"INGRESO"  
						WHERE  (( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
								 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
								 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
								 ( "INGRESO"."BASE" = :is_base AND  
									"INGRESO"."SERIE" = :is_serie AND  
									"INGRESO"."CONTRATO" = :il_numero AND  
									"DOCUMENTOS"."ESTADO_CH" = 'T')) OR  
								 (( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
								 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
								 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and 
								 ( "INGRESO"."BASE" = :is_base AND  
									"INGRESO"."SERIE" = :is_serie AND  
									"INGRESO"."CONTRATO" = :il_numero AND  
									"DOCUMENTOS"."ESTADO_CH" = 'P'))
						USING		sqlca;
						if ll_count=0 then
							UPDATE	"CADENA"  
							SET 		"ESTADO" = 'V'  
							WHERE  ( "CADENA"."CODIGO" = :is_base ) AND  
									 ( "CADENA"."SERIE" = :is_serie ) AND  
									 ( "CADENA"."NUMERO" = :il_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
				close(w_reeplazar_documentos)
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type st_eliminar from statictext within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2153
integer y = 704
integer width = 814
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Eliminar Cheque Seleccionado"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

type st_insertar from statictext within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 832
integer y = 704
integer width = 777
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Insertar Cheque(s) Marcados"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

type pb_eliminar from picturebutton within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
integer x = 2487
integer y = 780
integer width = 151
integer height = 136
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "arriba.jpg"
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= true

end event

event clicked;Long		ll_fila,ll_folio,ll_banco,ll_monto,ll_n_cheque,ll_folio_mod,ll_banco_mod,&
			ll_monto_mod,ll_n_cheque_mod,ll_tot_reg,ll_indi,ll_new,ll_hora_mod,&
			ll_tipo_tarjeta_credito_mod,ll_cod_tarjeta_debito_mod,ll_minuto_mod,ll_num_cheques_mod,&
			ll_cod_tarjeta_credito_mod,ll_nro_cuotas_credito_mod,ll_cod_banco_debito_mod,&
			ll_tipo_pago_tarjeta_credito_mod
String	ls_caja,ls_tipo_cob,ls_caja_mod,ls_tipo_cob_mod,ls_rezago_mod,ls_traspaso_pago_mod,&
			ls_estado_ch_mod,ls_glosa_ch_mod,ls_tipo_cod_aux_mod,ls_cod_pago_mod,&
			ls_cod_autorizacion_credito_mod,ls_cod_autotizacion_debito_mod,ls_tarjeta_empresa_mod

Datetime	ldt_fecha_venc,ldt_fecha_pago,ldt_fecha_venc_mod,ldt_fecha_pago_mod,ldt_fecha_estado_ch_mod

if dw_lista_destino.rowcount()>0 then
	ll_fila												= dw_lista_destino.getrow()
	if ll_fila > 0 then
		ll_folio											= dw_lista_destino.getitemnumber(ll_fila,'folio')
		ls_tipo_cob										= dw_lista_destino.getitemstring(ll_fila,'tipo_cob')
		ll_banco											= dw_lista_destino.getitemnumber(ll_fila,'cod_banco')
		ll_n_cheque										= dw_lista_destino.getitemnumber(ll_fila,'n_cheque')
		ldt_fecha_venc									= dw_lista_destino.getitemdatetime(ll_fila,'fecha_venc')
		ll_monto											= dw_lista_destino.getitemnumber(ll_fila,'monto')
		ldt_fecha_pago									= dw_lista_destino.getitemdatetime(ll_fila,'fecha_pago')
		ls_caja											= dw_lista_destino.getitemstring(ll_fila,'cod_caja')
		ll_tot_reg										= dw_lista_modificados.rowcount()
		for ll_indi=1 to ll_tot_reg
			ll_folio_mod								= dw_lista_modificados.getitemnumber(ll_indi,'folio')
			ls_tipo_cob_mod							= dw_lista_modificados.getitemstring(ll_indi,'tipo_cob')
			ll_banco_mod								= dw_lista_modificados.getitemnumber(ll_indi,'cod_banco')
			ll_n_cheque_mod							= dw_lista_modificados.getitemnumber(ll_indi,'n_cheque')
			ldt_fecha_venc_mod						= dw_lista_modificados.getitemdatetime(ll_indi,'fecha_venc')
			ll_monto_mod								= dw_lista_modificados.getitemnumber(ll_indi,'monto')
			ldt_fecha_pago_mod						= dw_lista_modificados.getitemdatetime(ll_indi,'fecha_pago')
			ls_caja_mod									= dw_lista_modificados.getitemstring(ll_indi,'cod_caja')
			if ll_folio_mod=ll_folio and ls_tipo_cob_mod=ls_tipo_cob and ll_banco_mod=ll_banco and &
				ll_n_cheque_mod=ll_n_cheque and ldt_fecha_venc_mod=ldt_fecha_venc and ll_monto_mod=ll_monto and &
				ldt_fecha_pago=ldt_fecha_pago_mod and ls_caja_mod=ls_caja then
				
				ls_rezago_mod							= dw_lista_destino.getitemstring(ll_indi,'rezago')
				ls_estado_ch_mod						= dw_lista_destino.getitemstring(ll_indi,'estado_ch')
				ls_glosa_ch_mod						= dw_lista_destino.getitemstring(ll_indi,'glosa_ch')
				ldt_fecha_estado_ch_mod				= dw_lista_destino.getitemdatetime(ll_indi,'fecha_estado_ch')
				ls_traspaso_pago_mod					= dw_lista_destino.getitemstring(ll_indi,'traspado_pago')
				ll_hora_mod								= dw_lista_destino.getitemnumber(ll_indi,'hora_pago')
				ll_minuto_mod							= dw_lista_destino.getitemnumber(ll_indi,'minuto_pago')
				ls_tipo_cod_aux_mod					= dw_lista_destino.getitemstring(ll_indi,'tipo_cob_aux')
				ls_cod_pago_mod						= dw_lista_destino.getitemstring(ll_indi,'cod_pago')
				ll_num_cheques_mod					= dw_lista_destino.getitemnumber(ll_indi,'num_cheques')
				ll_cod_tarjeta_credito_mod			= dw_lista_destino.getitemnumber(ll_indi,'cod_tarjeta_credito')
				ll_nro_cuotas_credito_mod			= dw_lista_destino.getitemnumber(ll_indi,'nro_cuotas_credito')
				ls_cod_autorizacion_credito_mod	= dw_lista_destino.getitemstring(ll_indi,'cod_autorizacion_credito')
				ll_tipo_tarjeta_credito_mod		= dw_lista_destino.getitemnumber(ll_indi,'tipo_tarjeta_credito')
				ll_cod_tarjeta_debito_mod			= dw_lista_destino.getitemnumber(ll_indi,'cod_tarjeta_debito')
				ls_cod_autotizacion_debito_mod	= dw_lista_destino.getitemstring(ll_indi,'cod_autorizacion_debito')
				ll_cod_banco_debito_mod				= dw_lista_destino.getitemnumber(ll_indi,'cod_banco_debito')
				ll_tipo_pago_tarjeta_credito_mod	= dw_lista_destino.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
				ls_tarjeta_empresa_mod				= dw_lista_destino.getitemstring(ll_indi,'tarjeta_empresa')
				ll_new									= dw_lista_original.insertrow(0)
				dw_lista_original.scrolltorow(ll_new)
				dw_lista_original.setitem(ll_new,'estado',1)
				dw_lista_original.setitem(ll_new,'folio',ll_folio_mod)
				dw_lista_original.setitem(ll_new,'tipo_cob',ls_tipo_cob_mod)
				dw_lista_original.setitem(ll_new,'cod_banco',ll_banco_mod)
				dw_lista_original.setitem(ll_new,'n_cheque',ll_n_cheque_mod)
				dw_lista_original.setitem(ll_new,'fecha_venc',ldt_fecha_venc_mod)
				dw_lista_original.setitem(ll_new,'monto',ll_monto_mod)
				dw_lista_original.setitem(ll_new,'rezago',ls_rezago_mod)
				dw_lista_original.setitem(ll_new,'fecha_pago',ldt_fecha_pago_mod)
				dw_lista_original.setitem(ll_new,'cod_caja',ls_caja_mod)
				dw_lista_original.setitem(ll_new,'estado_ch',ls_estado_ch_mod)
				dw_lista_original.setitem(ll_new,'glosa_ch',ls_glosa_ch_mod)
				dw_lista_original.setitem(ll_new,'fecha_estado_ch',ldt_fecha_estado_ch_mod)
				dw_lista_original.setitem(ll_new,'traspado_pago',ls_traspaso_pago_mod)
				dw_lista_original.setitem(ll_new,'hora_pago',ll_hora_mod)
				dw_lista_original.setitem(ll_new,'minuto_pago',ll_minuto_mod)
				dw_lista_original.setitem(ll_new,'tipo_cob_aux',ls_tipo_cod_aux_mod)
				dw_lista_original.setitem(ll_new,'cod_pago',ls_cod_pago_mod)
				dw_lista_original.setitem(ll_new,'num_cheques',ll_num_cheques_mod)
				dw_lista_original.setitem(ll_new,'cod_tarjeta_credito',ll_cod_tarjeta_credito_mod)
				dw_lista_original.setitem(ll_new,'nro_cuotas_credito',ll_nro_cuotas_credito_mod)
				dw_lista_original.setitem(ll_new,'cod_autorizacion_credito',ls_cod_autorizacion_credito_mod)
				dw_lista_original.setitem(ll_new,'tipo_tarjeta_credito',ll_tipo_tarjeta_credito_mod)
				dw_lista_original.setitem(ll_new,'cod_tarjeta_debito',ll_cod_tarjeta_debito_mod)
				dw_lista_original.setitem(ll_new,'cod_autorizacion_debito',ls_cod_autotizacion_debito_mod)
				dw_lista_original.setitem(ll_new,'cod_banco_debito',ll_cod_banco_debito_mod)
				dw_lista_original.setitem(ll_new,'tipo_pago_tarjeta_credito',ll_tipo_pago_tarjeta_credito_mod)
				dw_lista_original.setitem(ll_new,'tarjeta_empresa',ls_tarjeta_empresa_mod)
				
				ll_new									= dw_lista_original_doc_cob.insertrow(0)
				dw_lista_original_doc_cob.scrolltorow(ll_new)
				dw_lista_original_doc_cob.setitem(ll_new,'folio',ll_folio_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'tipo_cob',ls_tipo_cob_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_banco',ll_banco_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'n_cheque',ll_n_cheque_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'fecha_venc',ldt_fecha_venc_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'monto',ll_monto_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'rezago',ls_rezago_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'fecha_pago',ldt_fecha_pago_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_caja',ls_caja_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'traspaso_pago',ls_traspaso_pago_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'hora_pago',ll_hora_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'minuto_pago',ll_minuto_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'tipo_cob_aux',ls_tipo_cod_aux_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_pago',ls_cod_pago_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'num_cheques',ll_num_cheques_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_tarjeta_credito',ll_cod_tarjeta_credito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'nro_cuotas_credito',ll_nro_cuotas_credito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_autorizacion_credito',ls_cod_autorizacion_credito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'tipo_tarjeta_credito',ll_tipo_tarjeta_credito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_tarjeta_debito',ll_cod_tarjeta_debito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_autorizacion_debito',ls_cod_autotizacion_debito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'cod_banco_debito',ll_cod_banco_debito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'tipo_pago_tarjeta_credito',ll_tipo_pago_tarjeta_credito_mod)
				dw_lista_original_doc_cob.setitem(ll_new,'tarjeta_empresa',ls_tarjeta_empresa_mod)
				
				dw_lista_modificados.deleterow(ll_indi)
				dw_lista_destino.deleterow(ll_fila)
				if dw_lista_modificados.rowcount()>0 then dw_lista_modificados.scrolltorow(1)
				if dw_lista_destino.rowcount()>0 then dw_lista_destino.scrolltorow(1)
				exit
			end if
		next
		dw_lista_original.sort()
		dw_lista_original_doc_cob.sort()
	end if
end if
end event

type pb_insertar from picturebutton within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
integer x = 1147
integer y = 780
integer width = 151
integer height = 136
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "abajo.jpg"
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= true
st_eliminar.visible		= false

end event

event clicked;long		ll_fila,ll_tot_reg,ll_indi,ll_estado,ll_folio,ll_banco,ll_monto,ll_n_cheque,&
			ll_hora,ll_minuto,ll_new,ll_count,ll_num_cheques,ll_cod_tarjeta_credito,&
			ll_nro_cuotas_credito,ll_tipo_tarjeta_credito,ll_cod_tarjeta_debito,&
			ll_cod_banco_debito,ll_tipo_pago_tarjeta_credito
String	ls_tipo_cob,ls_rezago,ls_caja,ls_estado_ch,ls_glosa_ch,ls_traspaso_pago,ls_tipo_cod_aux,&
			ls_cod_pago,ls_cod_autorizacion_credito,ls_cod_autotizacion_debito,ls_tarjeta_empresa,ls_pasa
Datetime	ldt_fecha_venc,ldt_fecha_pago,ldt_fecha_estado_ch

dw_lista_original.accepttext()
ll_tot_reg												= dw_lista_original.rowcount()
if ll_tot_reg > 0 then
	ll_fila												= dw_lista_original.Find("estado = 0",1, dw_lista_original.RowCount())
	if ll_fila > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_estado									= dw_lista_original.getitemnumber(ll_indi,'estado')
			if ll_estado=0 then
				ll_folio									= dw_lista_original.getitemnumber(ll_indi,'folio')
				ls_tipo_cob								= dw_lista_original.getitemstring(ll_indi,'tipo_cob')
				ll_banco									= dw_lista_original.getitemnumber(ll_indi,'cod_banco')
				ll_n_cheque								= dw_lista_original.getitemnumber(ll_indi,'n_cheque')
				SELECT	COUNT("LOG_CHEQUE"."FOLIO")  
				INTO 		:ll_count  
				FROM 		"LOG_CHEQUE"  
				WHERE  ( "LOG_CHEQUE"."FOLIO" = :ll_folio ) AND  
						 ( "LOG_CHEQUE"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "LOG_CHEQUE"."N_CHEQUE" = :ll_n_cheque ) AND  
						 ( "LOG_CHEQUE"."COD_BANCO" = :ll_banco )   
				USING		sqlca;
				if ll_count=0 or sqlca.sqlcode=100 then
					ldt_fecha_venc						= dw_lista_original.getitemdatetime(ll_indi,'fecha_venc')
					ll_monto								= dw_lista_original.getitemnumber(ll_indi,'monto')
					ls_rezago							= dw_lista_original.getitemstring(ll_indi,'rezago')
					ldt_fecha_pago						= dw_lista_original.getitemdatetime(ll_indi,'fecha_pago')
					ls_caja								= dw_lista_original.getitemstring(ll_indi,'cod_caja')
					ls_estado_ch						= dw_lista_original.getitemstring(ll_indi,'estado_ch')
					ls_glosa_ch							= dw_lista_original.getitemstring(ll_indi,'glosa_ch')
					ldt_fecha_estado_ch				= dw_lista_original.getitemdatetime(ll_indi,'fecha_estado_ch')
					ls_traspaso_pago					= dw_lista_original.getitemstring(ll_indi,'traspado_pago')
					ll_hora								= dw_lista_original.getitemnumber(ll_indi,'hora_pago')
					ll_minuto							= dw_lista_original.getitemnumber(ll_indi,'minuto_pago')
					ls_tipo_cod_aux					= dw_lista_original.getitemstring(ll_indi,'tipo_cob_aux')

					ls_cod_pago							= dw_lista_original.getitemstring(ll_indi,'cod_pago')
					ll_num_cheques						= dw_lista_original.getitemnumber(ll_indi,'num_cheques')
					ll_cod_tarjeta_credito			= dw_lista_original.getitemnumber(ll_indi,'cod_tarjeta_credito')
					ll_nro_cuotas_credito			= dw_lista_original.getitemnumber(ll_indi,'nro_cuotas_credito')
					ls_cod_autorizacion_credito	= dw_lista_original.getitemstring(ll_indi,'cod_autorizacion_credito')
					ll_tipo_tarjeta_credito			= dw_lista_original.getitemnumber(ll_indi,'tipo_tarjeta_credito')
					ll_cod_tarjeta_debito			= dw_lista_original.getitemnumber(ll_indi,'cod_tarjeta_debito')
					ls_cod_autotizacion_debito		= dw_lista_original.getitemstring(ll_indi,'cod_autorizacion_debito')
					ll_cod_banco_debito				= dw_lista_original.getitemnumber(ll_indi,'cod_banco_debito')
					ll_tipo_pago_tarjeta_credito	= dw_lista_original.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
					ls_tarjeta_empresa				= dw_lista_original.getitemstring(ll_indi,'tarjeta_empresa')
					
					SELECT	SYSDATE  
					INTO 		:gdt_fec_sistema  
					FROM 		"TASA"  ;
					ll_new								= dw_lista_modificados.insertrow(0)
					dw_lista_modificados.scrolltorow(ll_new)
					dw_lista_modificados.setitem(ll_new,'folio',ll_folio)
					dw_lista_modificados.setitem(ll_new,'tipo_cob',ls_tipo_cob)
					dw_lista_modificados.setitem(ll_new,'cod_banco',ll_banco)
					dw_lista_modificados.setitem(ll_new,'n_cheque',ll_n_cheque)
					dw_lista_modificados.setitem(ll_new,'fecha_venc',ldt_fecha_venc)
					dw_lista_modificados.setitem(ll_new,'monto',ll_monto)
					dw_lista_modificados.setitem(ll_new,'rezago',ls_rezago)
					dw_lista_modificados.setitem(ll_new,'fecha_pago',ldt_fecha_pago)
					dw_lista_modificados.setitem(ll_new,'cod_caja',ls_caja)
					dw_lista_modificados.setitem(ll_new,'estado_ch_original',ls_estado_ch)
					dw_lista_modificados.setitem(ll_new,'glosa_ch_original',ls_glosa_ch)
					dw_lista_modificados.setitem(ll_new,'fecha_estado_ch_original',ldt_fecha_estado_ch)
					dw_lista_modificados.setitem(ll_new,'traspaso_pago',ls_traspaso_pago)
					dw_lista_modificados.setitem(ll_new,'hora_pago',ll_hora)
					dw_lista_modificados.setitem(ll_new,'minuto_pago',ll_minuto)
					dw_lista_modificados.setitem(ll_new,'tipo_cob_aux',ls_tipo_cod_aux)
					dw_lista_modificados.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
					dw_lista_modificados.setitem(ll_new,'usuario',gs_user)

					ll_new								= dw_lista_destino.insertrow(0)
					dw_lista_destino.scrolltorow(ll_new)
					dw_lista_destino.setitem(ll_new,'folio',ll_folio)
					dw_lista_destino.setitem(ll_new,'tipo_cob',ls_tipo_cob)
					dw_lista_destino.setitem(ll_new,'cod_banco',ll_banco)
					dw_lista_destino.setitem(ll_new,'n_cheque',ll_n_cheque)
					dw_lista_destino.setitem(ll_new,'fecha_venc',ldt_fecha_venc)
					dw_lista_destino.setitem(ll_new,'monto',ll_monto)
					dw_lista_destino.setitem(ll_new,'rezago',ls_rezago)
					dw_lista_destino.setitem(ll_new,'fecha_pago',ldt_fecha_pago)
					dw_lista_destino.setitem(ll_new,'cod_caja',ls_caja)
					dw_lista_destino.setitem(ll_new,'estado_ch','V')
					dw_lista_destino.setitem(ll_new,'glosa_ch',ls_glosa_ch)
					dw_lista_destino.setitem(ll_new,'fecha_estado_ch',ldt_fecha_estado_ch)
					dw_lista_destino.setitem(ll_new,'traspado_pago',ls_traspaso_pago)
					dw_lista_destino.setitem(ll_new,'hora_pago',ll_hora)
					dw_lista_destino.setitem(ll_new,'minuto_pago',ll_minuto)
					dw_lista_destino.setitem(ll_new,'tipo_cob_aux',ls_tipo_cod_aux)

					dw_lista_destino.setitem(ll_new,'cod_pago',ls_cod_pago)
					dw_lista_destino.setitem(ll_new,'num_cheques',ll_num_cheques)
					dw_lista_destino.setitem(ll_new,'cod_tarjeta_credito',ll_cod_tarjeta_credito)
					dw_lista_destino.setitem(ll_new,'nro_cuotas_credito',ll_nro_cuotas_credito)
					dw_lista_destino.setitem(ll_new,'cod_autorizacion_credito',ls_cod_autorizacion_credito)
					dw_lista_destino.setitem(ll_new,'tipo_tarjeta_credito',ll_tipo_tarjeta_credito)
					dw_lista_destino.setitem(ll_new,'cod_tarjeta_debito',ll_cod_tarjeta_debito)
					dw_lista_destino.setitem(ll_new,'cod_autorizacion_debito',ls_cod_autotizacion_debito)
					dw_lista_destino.setitem(ll_new,'cod_banco_debito',ll_cod_banco_debito)
					dw_lista_destino.setitem(ll_new,'tipo_pago_tarjeta_credito',ll_tipo_pago_tarjeta_credito)
					dw_lista_destino.setitem(ll_new,'tarjeta_empresa',ls_tarjeta_empresa)
					
				else
					messagebox("Advertencia","Ya existe Cheque "+string(ll_n_cheque)+' Comprobante Nº '+ls_tipo_cob+'-'+string(ll_folio,"###,###,###,###,###"))
				end if
			end if
		next
		ls_pasa				='S'
		DO WHILE ls_pasa='S'
			ll_fila			= dw_lista_original.Find("estado = 0",1, dw_lista_original.RowCount())
			if ll_fila>0 then
				dw_lista_original.deleterow(ll_fila)
				dw_lista_original_doc_cob.deleterow(ll_fila)
			else
				ls_pasa		= 'N'
			end if
		LOOP
		dw_lista_original.accepttext()
		ll_tot_reg			= dw_lista_original.rowcount()
		for ll_indi=1 to ll_tot_reg
			dw_lista_original.setitem(ll_indi,'estado',1)
		next
		dw_lista_original.accepttext()
		dw_lista_original_doc_cob.accepttext()
		dw_lista_destino.sort()
		dw_lista_modificados.sort()
		if dw_lista_modificados.rowcount()>0 then dw_lista_modificados.scrolltorow(1)
		if dw_lista_destino.rowcount()>0 then dw_lista_destino.scrolltorow(1)
	else
		messagebox("Advertencia","No Registra Cheque Marcado, debe seleccionar por lo Menos Uno")
	end if
end if
end event

type dw_lista_modificados from datawindow within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1760
integer y = 1732
integer width = 398
integer height = 284
boolean titlebar = true
string title = "Ingresar LOG Cheque(s)"
string dataobject = "dw_log_cambio_estado_de_cheques"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

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

type st_identificar from statictext within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3374
integer y = 876
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Cheque(s) a Modificar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

type st_ayuda from statictext within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 24
integer width = 850
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "Marque los que desee Modificar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false

end event

type cb_cerrar from commandbutton within w_reeplazar_documentos
integer x = 3753
integer y = 1736
integer width = 315
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_reeplazar_documentos)
end event

type dw_lista_destino from datawindow within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 944
integer width = 4037
integer height = 764
integer taborder = 30
string dragicon = "Exclamation!"
boolean titlebar = true
string title = "Lista de Cheques a Modificar"
string dataobject = "dw_ingresar_documento_reemplazo"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible			= false
st_identificar.visible	= true
st_insertar.visible		= false
st_eliminar.visible		= false

end event

event clicked;String	ls_columna,ls_cod_pago,ls_estado_ch,ls_glosa_ch
Long		ll_new,ll_hora,ll_minuto,ll_tot_reg,ll_indi,ll_n_cheque,ll_cod_banco,ll_monto,&
			ll_fila,ll_resp,ll_pasa=0
Time		ld_hora
datetime	ldt_fecha_venc,ldt_fecha_estado_ch

dw_lista_destino.accepttext()
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
//	this.Drag(Begin!)
else
	ls_columna			= dwo.name
	CHOOSE CASE ls_columna
		CASE 't_insertar'
			ll_tot_reg						= dw_lista_destino.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_n_cheque				= dw_lista_destino.getitemnumber(ll_indi,'n_cheque')
					ll_cod_banco			= dw_lista_destino.getitemnumber(ll_indi,'cod_banco')
					ll_monto					= dw_lista_destino.getitemnumber(ll_indi,'monto')
					ldt_fecha_venc			= dw_lista_destino.getitemdatetime(ll_indi,'fecha_venc')
					ls_cod_pago				= dw_lista_destino.getitemstring(ll_indi,'cod_pago')
					ls_estado_ch			= dw_lista_destino.getitemstring(ll_indi,'estado_ch')
					ls_glosa_ch				= dw_lista_destino.getitemstring(ll_indi,'glosa_ch')
					ldt_fecha_estado_ch	= dw_lista_destino.getitemdatetime(ll_indi,'fecha_estado_ch')
					if isnull(ll_cod_banco) or ll_cod_banco=0 then
						messagebox("Advertencia","Falta Ingresar Banco Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('cod_banco')
						ll_pasa++
						exit
					elseif isnull(ll_n_cheque) or ll_n_cheque=0 then
						messagebox("Advertencia","Falta Ingresar Serie Cheque Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('n_cheque')
						ll_pasa++
						exit
					elseif isnull(ldt_fecha_venc) then
						messagebox("Advertencia","Falta Ingresar Fecha Vencimiento Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('fecha_venc')
						ll_pasa++
						exit
					elseif isnull(ls_cod_pago) or ls_cod_pago='' then
						messagebox("Advertencia","Falta Ingresar Forma de Pago Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('cod_pago')
						ll_pasa++
						exit
					elseif isnull(ll_monto) or ll_monto=0 then
						messagebox("Advertencia","Falta Ingresar Monto Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('monto')
						ll_pasa++
						exit
					elseif isnull(ls_estado_ch) or ls_estado_ch='' then
						messagebox("Advertencia","Falta Ingresar Estado Cheque Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('estado_ch')
						ll_pasa++
						exit
					elseif isnull(ls_glosa_ch) or ls_glosa_ch='' then
						messagebox("Advertencia","Falta Ingresar Glosa Fila Nº "+string(ll_indi))
						dw_lista_destino.setfocus()
						dw_lista_destino.setcolumn('glosa_ch')
						ll_pasa++
						exit
					end if
				next
			end if
			if ll_pasa=0 then
				ld_hora		= now()
				ll_hora		= long(mid(string(ld_hora),1,2))
				ll_minuto	= long(mid(string(ld_hora),4,2))
				ll_new		= dw_lista_destino.insertrow(0)
				dw_lista_destino.setitem(ll_new,'folio',il_folio)
				dw_lista_destino.setitem(ll_new,'tipo_cob',is_tipo_cob)
				dw_lista_destino.setitem(ll_new,'rezago','N')
				dw_lista_destino.setitem(ll_new,'fecha_pago',today())
				dw_lista_destino.setitem(ll_new,'fecha_estado_ch',today())
				dw_lista_destino.setitem(ll_new,'cod_caja',gs_caja)
				dw_lista_destino.setitem(ll_new,'traspado_pago','NN')
				dw_lista_destino.setitem(ll_new,'hora_pago',ll_hora)
				dw_lista_destino.setitem(ll_new,'minuto_pago',ll_minuto)
				dw_lista_destino.setitem(ll_new,'tipo_cob_aux',is_tipo_cob)
				dw_lista_destino.setitem(ll_new,'num_cheques',dw_lista_destino.rowcount())
				dw_lista_destino.setfocus()
				dw_lista_destino.scrolltorow(ll_new)
				dw_lista_destino.setcolumn('n_cheque')
			end if
			
		CASE 't_eliminar'
			ll_fila	= dw_lista_destino.getrow()
			if ll_fila>0 then
				ll_resp	= messagebox("Eliminar","Está seguro de Eliminar Fila Nº "+string(ll_fila))
				if ll_resp=1 then dw_lista_destino.deleterow(ll_fila)
			end if
	END CHOOSE
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event itemchanged;string	ls_columna
Long		ll_n_cheque,ll_cod_banco,ll_tot_reg,ll_indi,ll_n_cheque_aux,ll_cod_banco_aux,&
			ll_nulo
			
dw_lista_destino.accepttext()
ls_columna							= dw_lista_destino.getcolumnName()//dwo.name()
CHOOSE CASE ls_columna
	CASE 'n_cheque','cod_banco'
		ll_cod_banco				= dw_lista_destino.getitemnumber(dw_lista_destino.getrow(),'cod_banco')
		ll_n_cheque					= dw_lista_destino.getitemnumber(dw_lista_destino.getrow(),'n_cheque')
		setnull(ll_nulo)
		ll_tot_reg					= dw_lista_original.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ll_n_cheque_aux	= dw_lista_original.getitemnumber(ll_indi,'n_cheque')
				ll_cod_banco_aux	= dw_lista_original.getitemnumber(ll_indi,'cod_banco')
				if ll_n_cheque_aux=ll_n_cheque and ll_cod_banco_aux=ll_cod_banco then
					messagebox("Advertencia","No es posible Ingresar Cheque Ya Existe !!!")
					dw_lista_destino.setitem(dw_lista_destino.getrow(),'cod_banco',ll_nulo)
					dw_lista_destino.setitem(dw_lista_destino.getrow(),'n_cheque',ll_nulo)
					dw_lista_destino.accepttext()
					exit
				end if					
			next
		end if
		ll_tot_reg					= dw_lista_modificados.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ll_n_cheque_aux	= dw_lista_modificados.getitemnumber(ll_indi,'n_cheque')
				ll_cod_banco_aux	= dw_lista_modificados.getitemnumber(ll_indi,'cod_banco')
				if ll_n_cheque_aux=ll_n_cheque and ll_cod_banco_aux=ll_cod_banco then
					messagebox("Advertencia","No es posible Ingresar Cheque, está siendo Reemplazado !!!")
					dw_lista_destino.setitem(dw_lista_destino.getrow(),'cod_banco',ll_nulo)
					dw_lista_destino.setitem(dw_lista_destino.getrow(),'n_cheque',ll_nulo)
					dw_lista_destino.accepttext()
					exit
				end if					
			next
		end if
END CHOOSE

end event

event dragdrop;control_dw = DraggedObject()
pb_insertar.triggerevent(clicked!)
end event

type dw_lista_original from datawindow within w_reeplazar_documentos
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 92
integer width = 4037
integer height = 664
integer taborder = 10
string dragicon = "StopSign!"
boolean titlebar = true
string title = "Lista de Cheque(s)"
string dataobject = "dw_lista_documento_a_reemplazar"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible			= true
st_identificar.visible	= false
st_insertar.visible		= false
st_eliminar.visible		= false
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row>0 then cb_ctacte.triggerevent(clicked!)

end event

event dragdrop;control_dw = DraggedObject()
pb_eliminar.triggerevent(clicked!)
end event

