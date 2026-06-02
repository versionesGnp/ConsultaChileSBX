forward
global type w_cuenta_corriente_oferta_bkp from window
end type
type cb_clasif from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_convenio from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_est_cheque from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_11 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_seguro from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_cartera from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_detalle from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_derecho_especial from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_cupones from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_rescomi_vta from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_operaciones from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_agente from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_10 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_9 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_8 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_5 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_6 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_7 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_4 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type dw_agente_super from datawindow within w_cuenta_corriente_oferta_bkp
end type
type cb_3 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_2 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_1 from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_imprimir from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type cb_cerrar from commandbutton within w_cuenta_corriente_oferta_bkp
end type
type dw_estado_cta_cte from datawindow within w_cuenta_corriente_oferta_bkp
end type
type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_oferta_bkp
end type
type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_oferta_bkp
end type
type dw_cons_docu_w from datawindow within w_cuenta_corriente_oferta_bkp
end type
type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_oferta_bkp
end type
type dw_listado_cuenta_cte_man from datawindow within w_cuenta_corriente_oferta_bkp
end type
end forward

global type w_cuenta_corriente_oferta_bkp from window
integer x = 960
integer y = 756
integer width = 3186
integer height = 1960
boolean titlebar = true
string title = "Cuenta Corriente PROMESA (base O)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_clasif cb_clasif
cb_convenio cb_convenio
cb_est_cheque cb_est_cheque
cb_11 cb_11
cb_seguro cb_seguro
cb_cartera cb_cartera
cb_detalle cb_detalle
cb_derecho_especial cb_derecho_especial
cb_cupones cb_cupones
cb_rescomi_vta cb_rescomi_vta
cb_operaciones cb_operaciones
cb_agente cb_agente
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_4 cb_4
dw_agente_super dw_agente_super
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_estado_cta_cte dw_estado_cta_cte
dw_encabezado_cuenta_cte dw_encabezado_cuenta_cte
dw_listado_cuenta_cte dw_listado_cuenta_cte
dw_cons_docu_w dw_cons_docu_w
dw_listado_cuenta_cte_cta dw_listado_cuenta_cte_cta
dw_listado_cuenta_cte_man dw_listado_cuenta_cte_man
end type
global w_cuenta_corriente_oferta_bkp w_cuenta_corriente_oferta_bkp

type variables
long		il_count_print=0
String	is_cod_age   
Datetime	idt_fecha_base
Long		il_status  
end variables

on w_cuenta_corriente_oferta_bkp.create
this.cb_clasif=create cb_clasif
this.cb_convenio=create cb_convenio
this.cb_est_cheque=create cb_est_cheque
this.cb_11=create cb_11
this.cb_seguro=create cb_seguro
this.cb_cartera=create cb_cartera
this.cb_detalle=create cb_detalle
this.cb_derecho_especial=create cb_derecho_especial
this.cb_cupones=create cb_cupones
this.cb_rescomi_vta=create cb_rescomi_vta
this.cb_operaciones=create cb_operaciones
this.cb_agente=create cb_agente
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_4=create cb_4
this.dw_agente_super=create dw_agente_super
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_estado_cta_cte=create dw_estado_cta_cte
this.dw_encabezado_cuenta_cte=create dw_encabezado_cuenta_cte
this.dw_listado_cuenta_cte=create dw_listado_cuenta_cte
this.dw_cons_docu_w=create dw_cons_docu_w
this.dw_listado_cuenta_cte_cta=create dw_listado_cuenta_cte_cta
this.dw_listado_cuenta_cte_man=create dw_listado_cuenta_cte_man
this.Control[]={this.cb_clasif,&
this.cb_convenio,&
this.cb_est_cheque,&
this.cb_11,&
this.cb_seguro,&
this.cb_cartera,&
this.cb_detalle,&
this.cb_derecho_especial,&
this.cb_cupones,&
this.cb_rescomi_vta,&
this.cb_operaciones,&
this.cb_agente,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_5,&
this.cb_6,&
this.cb_7,&
this.cb_4,&
this.dw_agente_super,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_estado_cta_cte,&
this.dw_encabezado_cuenta_cte,&
this.dw_listado_cuenta_cte,&
this.dw_cons_docu_w,&
this.dw_listado_cuenta_cte_cta,&
this.dw_listado_cuenta_cte_man}
end on

on w_cuenta_corriente_oferta_bkp.destroy
destroy(this.cb_clasif)
destroy(this.cb_convenio)
destroy(this.cb_est_cheque)
destroy(this.cb_11)
destroy(this.cb_seguro)
destroy(this.cb_cartera)
destroy(this.cb_detalle)
destroy(this.cb_derecho_especial)
destroy(this.cb_cupones)
destroy(this.cb_rescomi_vta)
destroy(this.cb_operaciones)
destroy(this.cb_agente)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.dw_agente_super)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_estado_cta_cte)
destroy(this.dw_encabezado_cuenta_cte)
destroy(this.dw_listado_cuenta_cte)
destroy(this.dw_cons_docu_w)
destroy(this.dw_listado_cuenta_cte_cta)
destroy(this.dw_listado_cuenta_cte_man)
end on

event open;if gs_serie<>'' and gi_numero>0 and gs_base<>'' then
	Long		ll_count_reg,ll_count,ll_count_conv
	gf_centrar (w_cuenta_corriente_oferta)
	dw_encabezado_cuenta_cte.SetTransObject(SQLCA)
	if dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)=0 then
		messagebox("Advertencia","No Registra Datos Promesa "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
		close(w_cuenta_corriente_oferta)
	else
		if dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')>0 or &
			len(dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_anexo_repacta'))>0 then
			cb_7.enabled	= true
		else
			cb_7.enabled	= false
		end if
		if gs_conexion	= "Parque El Prado" then
			SELECT	"GEO_PRADO_CRESCATABLE"."FECHA_BASE",   
						"GEO_PRADO_CRESCATABLE"."COD_AGE",   
						"GEO_PRADO_CRESCATABLE"."STATUS"  
			INTO 		:idt_fecha_base,   
						:is_cod_age,   
						:il_status  
			FROM 		"GEO_PRADO_CRESCATABLE"  
			WHERE  ( "GEO_PRADO_CRESCATABLE"."CODIGO" = :gs_base ) AND  
					 ( "GEO_PRADO_CRESCATABLE"."SERIE" = :gs_serie ) AND  
					 ( "GEO_PRADO_CRESCATABLE"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				cb_cartera.enabled	= True
			else
				cb_cartera.enabled	= False
			end if
		end if
		SELECT	COUNT("DOCUMENTOS"."FOLIO")  
		INTO 		:ll_count  
		FROM 		"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :gs_base ) AND  
				 ( "INGRESO"."SERIE" = :gs_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T' ) AND
				 ( "DOCUMENTOS"."COD_PAGO" = 'CH');
		if ll_count>0 then
			cb_est_cheque.enabled	= true
		else
			cb_est_cheque.enabled	= false
		end if		
		dw_estado_cta_cte.SetTransObject(SQLCA)
		dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
		dw_listado_cuenta_cte.SetTransObject(SQLCA)
		dw_listado_cuenta_cte.Retrieve(gs_serie, gi_numero,gs_base)
		gs_ventana	= 'w_cuenta_corriente_oferta'
		f_valida_objeto()	
		SELECT	COUNT("DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL")  
		INTO 		:ll_count_conv  
		FROM 		"DETALLE_CONVENIO_PROTESTO"  
		WHERE  ( "DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL" = :gs_base ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."SERIE_ORIGINAL" = :gs_serie ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."NUMERO_ORIGINAL" = :gi_numero )   
		USING		sqlca;
		if ll_count_conv>0 then
			cb_convenio.enabled		= true
		else
			cb_convenio.enabled		= false
		end if
		if gs_depto = 'V' or gs_depto='G' or gs_depto='P' or gs_depto='I' or gs_depto='O' or gs_depto='T' or gs_depto='D' then
			cb_agente.enabled 		= true
			cb_rescomi_vta.enabled 	= true
		else
			cb_agente.enabled 		= false
			cb_rescomi_vta.enabled 	= false
		end if
		SELECT	COUNT("BENEFICIARIOS_SEGURO"."BASE")
		INTO 		:ll_count_reg  
		FROM 		"BENEFICIARIOS_SEGURO"  
		WHERE  ( "BENEFICIARIOS_SEGURO"."BASE" = :gs_base ) AND  
				 ( "BENEFICIARIOS_SEGURO"."SERIE" = :gs_serie ) AND  
				 ( "BENEFICIARIOS_SEGURO"."NUMERO" = :gi_numero ) AND  
				 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO" > 0 )   
		USING		sqlca;
		if ll_count_reg>0 then
			cb_seguro.enabled			= true
		else
			cb_seguro.enabled			= false
		end if
		cb_2.triggerevent(clicked!)
	end if
else
	close(w_cuenta_corriente_oferta)
end if

end event

event close;if gs_serie<>'' and gi_numero>0 and gs_base<>'' and dw_encabezado_cuenta_cte.rowcount()>0 then
	gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
	gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
	gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
	gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
	INSERT INTO 	"LOG_CONSULTA"  
					( 	"BASE",   	"SERIE",   	"NUMERO",	"FECHA",   				"RUT_CLIENTE",	"USUARIO",	"NRO_PRINT" ,		"TCP_IP",		"USUARIO_WIN")  
	VALUES 		( 	:gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,		:gi_rut,   		:gs_user,	:il_count_print,	:gs_tcp_ip,		:gs_user_maq )  
	USING				sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
end if
end event

type cb_clasif from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2903
integer y = 1748
integer width = 215
integer height = 84
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C.Riesgo"
end type

event clicked;if isvalid(w_formulario_clasificacion_riesgo) then close(w_formulario_clasificacion_riesgo)
openwithparm(w_formulario_clasificacion_riesgo,'N')
end event

type cb_convenio from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2560
integer y = 1748
integer width = 338
integer height = 84
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con&v.Pago CH"
end type

event clicked;String	ls_string
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_detalle_convenio_pago_cheque_protesto) then close(w_detalle_convenio_pago_cheque_protesto)
ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
openwithparm(w_detalle_convenio_pago_cheque_protesto,ls_string)
end event

type cb_est_cheque from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2281
integer y = 1748
integer width = 274
integer height = 84
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Est.Cheque"
end type

event clicked;String	ls_string
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type cb_11 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2281
integer y = 1660
integer width = 256
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dato&s Ctto"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 and dw_encabezado_cuenta_cte.rowcount()>0 then
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
			Open(w_datos_contrato_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
			Open(w_datos_contrato_liberador)
		CASE "P" // Pagaré
			if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
			Open(w_datos_contrato_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
			Open(w_datos_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
			Open(w_datos_contrato_derecho)	
		CASE "R" // Reprogramacion Cta. Mant.
			if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
			open(w_datos_contrato_reprogramacion_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
			open(w_datos_contrato_aumento_capacidad)
	END CHOOSE
end if
end event

type cb_seguro from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2053
integer y = 1660
integer width = 224
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ben.Se&g"
end type

event clicked;Long	ll_cod_seguro
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ll_cod_seguro	= dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_codigo_tipo_seguro')
if ll_cod_seguro>0 then 
	if isvalid(w_seguro_complementario) then close(w_seguro_complementario)
	openwithparm(w_seguro_complementario,string(ll_cod_seguro))
end if
end event

type cb_cartera from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 1993
integer y = 1748
integer width = 283
integer height = 84
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cart &Resca."
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_cartera_crescatable) then close(w_cartera_crescatable)
open(w_cartera_crescatable)
end event

type cb_detalle from commandbutton within w_cuenta_corriente_oferta_bkp
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 1660
integer width = 242
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ctrol.&Dcto"
end type

event clicked;String	ls_string
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
if not isnull(gs_base) and gi_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end event

type cb_derecho_especial from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 1682
integer y = 1748
integer width = 306
integer height = 84
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Derecho Esp"
end type

event clicked;String	ls_string
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if gi_rut>0 then
	ls_string	= gs_serie+'~t'+string(gi_numero)
	if isvalid(w_detalle_derecho_especial) then close(w_detalle_derecho_especial)
	openwithparm(w_detalle_derecho_especial,ls_string)
else
	messagebox("Advertencia","Antes de Ingresar Derecho Especial debe Ingresar Cliente")
end if
end event

type cb_cupones from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 1445
integer y = 1748
integer width = 233
integer height = 84
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cupo&nes"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type cb_rescomi_vta from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 1184
integer y = 1748
integer width = 256
integer height = 84
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pagos Vta"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_rescomi_por_vta) then close(w_rescomi_por_vta)
open(w_rescomi_por_vta)
end event

type cb_operaciones from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 905
integer y = 1748
integer width = 274
integer height = 84
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Operación"
end type

event clicked;String	ls_string, ls_nombre, ls_ap_pat,ls_ap_mat,ls_dv, ls_nom_comp, ls_rut_comp
Long		ll_rut
if isvalid(w_ingreso_solicitudes) then close(w_ingreso_solicitudes)
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_nombre	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_nombre')
ls_ap_pat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_paterno')
ls_ap_mat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_materno')
ll_rut		= dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
ls_dv			= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_dv')
ls_nom_comp	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
ls_rut_comp	= string(ll_rut,'###,###,###')+' - '+ls_dv
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_nom_comp+'~t'+ls_rut_comp
if isvalid(w_ingreso_solicitudes) then close(w_ingreso_solicitudes)
OpenWithParm(w_ingreso_solicitudes,ls_string)

end event

type cb_agente from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 457
integer y = 1748
integer width = 183
integer height = 84
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&gente"
end type

event clicked;string ls_age, ls_sup, ls_string
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_string	= dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')+'~t'+&
				  dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
if isvalid(w_agente_info) then close(w_agente_info)
openwithparm(w_agente_info,ls_string)


end event

type cb_10 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 645
integer y = 1748
integer width = 256
integer height = 84
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Institución"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_institucional')>0 then
	if isvalid(w_ingreso_institucion) then close(w_ingreso_institucion)
	OpenWithParm(w_ingreso_institucion,STRING(dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_institucional')))
else
	messagebox("Advertencia","No Registra Institución")
end if
end event

type cb_9 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 41
integer y = 1748
integer width = 256
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Funeraria"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_funeraria')>0 then
	if isvalid(w_ingreso_funeraria) then close(w_ingreso_funeraria)
	OpenWithParm(w_ingreso_funeraria,STRING(dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_funeraria')))
else
	messagebox("Advertencia","No Registra Funeraria")
end if
end event

type cb_8 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 302
integer y = 1748
integer width = 151
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aval"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_aval')>0 then 
	if isvalid(w_aval) then close(w_aval)
	OpenWithParm(w_aval, STRING(dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_rut_aval')))
else
	messagebox("Advertencia","No Registra Aval")
end if
end event

type cb_5 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 1568
integer y = 1660
integer width = 233
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
open(w_cobranza_historica)
end event

type cb_6 from commandbutton within w_cuenta_corriente_oferta_bkp
event clicked pbm_bnclicked
integer x = 942
integer y = 1660
integer width = 274
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&as.Créd"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_repacta) then close(w_repacta)
open(w_repacta)
end event

type cb_7 from commandbutton within w_cuenta_corriente_oferta_bkp
event clicked pbm_bnclicked
integer x = 1221
integer y = 1660
integer width = 343
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Repro&g.Mant"
end type

event clicked;String	ls_string, ls_fecha,ls_nom_comp
long 		i, ll_dia,ll_mes,ll_anno,ll_count_reg,ii_dmora,ii_mora_cobro,ii_inc_gastos,&
			ii_cantidad=0,ll_dias_mora_mant,ll_mora_mant
double	ld_total=0,ll_total=0,ld_resul,id_valor_cuota,id_im,id_gc,c_tasa_peso,c_tasa_uf,&
			ldb_valor_cuota_mant,id_interes_gc
Date		ld_fec_prox_pago,ld_fecha_dia
Datetime	ldt_fecha_venc_mant

dw_encabezado_cuenta_cte.accepttext()
gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if not isnull(gs_nombres) and gs_nombres<>'' then
	ls_nom_comp			= gs_nombres
end if
if not isnull(gs_apellido_paterno) and gs_apellido_paterno<>'' then
	ls_nom_comp			= ls_nom_comp+' '+gs_apellido_paterno
end if
if not isnull(gs_apellido_materno) and gs_apellido_materno<>'' then
	ls_nom_comp			= ls_nom_comp+' '+gs_apellido_materno
end if

//if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
//open(w_boletas_cuotas)
if gs_base='O' or gs_base='C' then
	ld_fecha_dia	= date(gdt_fec_sistema)
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:gd_uf_dia  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_dia   ;
	
	SELECT	"TASA"."TASA_INT_P",	"TASA"."TASA_INT_UF",	"GASTO_COB_MORA"
	INTO 		:c_tasa_peso,			:c_tasa_uf,					:id_interes_gc
	FROM 		"TASA"  
	WHERE 	"TASA"."LOOK" = 1   ;

	gl_n_cuotas_pag 		= 0 
	SELECT	COUNT("SOL_REACTIVA"."RUT_TITULAR")  
	INTO 		:ll_count_reg  
	FROM 		"SOL_ESTATUS",   
				"SOL_REACTIVA"  
	WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
			 (("SOL_ESTATUS"."BASE" = :gs_base ) AND  
			 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
			 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
			 ( "SOL_REACTIVA"."ESTATUS_OPERACION" = 0 ) AND
			 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '3' ) AND  
			 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
	USING		sqlca ;
	if gs_estado='V' or gs_estado='C' or gs_estado='R' or (gs_estado='N' and ll_count_reg>0) then
////		dw_detalle_bl.SetItem(1,"cuota_mantencion", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
		IF gs_rezago <> "S" THEN	 
			SELECT	"CADENA_MORA"."DIAS_MORA_MANT",	"CADENA_MORA"."VALOR_CUOTA_MANT",	"CADENA_MORA"."MORA_MANT",	"FECHA_VENC_MANT"  
			INTO 		:ll_dias_mora_mant,					:ldb_valor_cuota_mant,					:ll_mora_mant,					:ldt_fecha_venc_mant
			FROM 		"CADENA_MORA"  
			WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
					 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				id_valor_cuota 		= round((ldb_valor_cuota_mant * gd_uf_dia),0)
				ii_dmora 				= ll_dias_mora_mant
	//			id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
				IF ii_dmora > 5 THEN 
					ii_mora_cobro 		= ii_dmora 
					id_im 				= gf_int_mora(c_tasa_uf, ii_mora_cobro, id_valor_cuota)
					IF ii_dmora > 30 THEN 
						id_gc 			= Round(id_valor_cuota * id_interes_gc, 0) //005// PASA DE .1 A .05 10/1/2000
						ii_inc_gastos	= 1
					END IF
				ELSE
					id_gc 				= 0
					id_im 				= 0
					ii_mora_cobro 		= 0
					ii_inc_gastos 		= 0
				END IF
			else
				id_gc 					= 0
				id_im 					= 0
				ii_mora_cobro 			= 0
				ii_inc_gastos 			= 0
			end if
		ELSE
			id_valor_cuota				= 0
			ii_dmora 					= 0
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 				= 0
			ii_inc_gastos 				= 0
		END IF
		if gs_base='C' then
			ii_cantidad 				= ll_mora_mant
			ll_dia						= day(date(ldt_fecha_venc_mant))
			ll_mes						= month(date(ldt_fecha_venc_mant))
			ll_anno						= year(date(ldt_fecha_venc_mant))
			gs_moneda					= '2' //dw_datos_bl.GetItemstring(1,'contrato_moneda')
			SELECT	"CONTRATO"."CTA_PAG_M"  
			INTO 		:gl_ctas_pag_m  
			FROM 		"CONTRATO",   
						"CADENA"  
			WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
					 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
					 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )   )   
			USING		sqlca;

		elseif gs_base='O' then
			ii_cantidad 				= ll_mora_mant
			ll_dia						= day(date(ldt_fecha_venc_mant))
			ll_mes						= month(date(ldt_fecha_venc_mant))
			ll_anno						= year(date(ldt_fecha_venc_mant))
			gs_moneda					= '2' //dw_datos_bl.GetItemstring(1,'pago_oferta_moneda')
			SELECT	"OFERTA_V"."CTA_PAG_M"  
			INTO 		:gl_ctas_pag_m  
			FROM 		"CADENA",   
						"OFERTA_V",   
						"PAGO_OFERTA"  
			WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA"."NUMERO" = :gi_numero ) )   
			USING		sqlca;
		end if
		if ii_cantidad>=0 then
			gl_cta_mora_original		= ii_cantidad
			ls_fecha						= string(ll_dia,"00")+'/'+string(ll_mes,"00")+'/'+string(ll_anno)
			ld_fec_prox_pago			= date(ls_fecha)
			gl_n_cuotas_pag 			= ii_cantidad 
//			id_valor_cuota 			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
//			ii_dmora 					= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
//			id_interes_gc				= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
			ll_total						= ii_cantidad * id_valor_cuota
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 				= 0
			ii_inc_gastos 				= 0
			FOR i = 1 TO ii_cantidad 
				IF (ii_dmora - (i - 1) * 365) > 5 THEN 
					ii_mora_cobro 		= (ii_dmora - (i - 1) * 365)
					id_im 				= id_im + gf_int_mora(c_tasa_uf, ii_mora_cobro, id_valor_cuota)
					IF (ii_dmora - (i - 1) * 365) > 30 THEN 
						 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0) //005// CAMBIO DE 10 A 5%
						 ii_inc_gastos = 1
					END IF
				END IF
			NEXT
			ld_resul						= ( id_gc + id_im )* ii_inc_gastos 
			ld_total						=  round(((ld_resul * ii_inc_gastos) + ll_total),0)
			gd_val_interes				= ld_resul
			gd_val_deuda				= ll_total
			ls_string					= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ld_total)+'~t'+trim(ls_nom_comp)+'~t'+string(ld_fec_prox_pago)+'~t'+string(ii_cantidad)
			if isvalid(w_detalle_repactacion_por_contrato) then close(w_detalle_repactacion_por_contrato)
			OpenWithParm(w_detalle_repactacion_por_contrato,ls_string)
		else
			messagebox("Advertencia","No tiene Cuotas en Mora para Reprogramar")
		end if
	else
		if gs_estado='N' then
			messagebox("Advertencia","Recuerde para Reprogramar, Contrato Nulo debe existir Solicitud de Reactivación Aceptada")
		else
			messagebox("Advertencia","Recuerde para Reprogramar, El Contrato debe estar Vigente, Cancelado, Nulo o Resuelto")
		end if
	end if
else
	messagebox("Advertencia","Solo se Reprograma Cuota Mantención de Promesa y Contrato Isacruz")
end if
end event

type cb_4 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 41
integer y = 1660
integer width = 283
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Pagare"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_ver_pagare) then close(w_ver_pagare)
open(w_ver_pagare)
end event

type dw_agente_super from datawindow within w_cuenta_corriente_oferta_bkp
boolean visible = false
integer x = 453
integer y = 220
integer width = 2085
integer height = 1140
integer taborder = 60
boolean titlebar = true
string title = "Nombre Agente / Supervisor"
string dataobject = "d_agente_oferta2"
boolean controlmenu = true
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.visible = FALSE
end event

type cb_3 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 471
integer y = 1660
integer width = 183
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uotas"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
dw_listado_cuenta_cte_cta.SetTransObject(SQLCA)
dw_listado_cuenta_cte_cta.Retrieve(gs_serie, gi_numero,gs_base)
dw_listado_cuenta_cte_cta.visible	= true
dw_cons_docu_w.visible					= false
end event

type cb_2 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 329
integer y = 1660
integer width = 137
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Total"
end type

event clicked;dw_listado_cuenta_cte.visible	= true
dw_cons_docu_w.visible			= FALSE
end event

type cb_1 from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 658
integer y = 1660
integer width = 279
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mantención"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
dw_listado_cuenta_cte_man.SetTransObject(SQLCA)
dw_listado_cuenta_cte_man.Retrieve(gs_serie, gi_numero,gs_base)
dw_listado_cuenta_cte_man.visible	= true
dw_cons_docu_w.visible					= false
end event

type cb_imprimir from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2578
integer y = 1660
integer width = 238
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Im&primir"
end type

event clicked;gs_datawindow_a_imprimir = 'd_rep_impresion_ctta_cte_orden'
if isvalid(w_impresion_previa_de_ctta_ctes) then close(w_impresion_previa_de_ctta_ctes)
Open(w_impresion_previa_de_ctta_ctes)
il_count_print ++


end event

type cb_cerrar from commandbutton within w_cuenta_corriente_oferta_bkp
integer x = 2857
integer y = 1660
integer width = 261
integer height = 84
integer taborder = 300
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_cuenta_corriente_oferta)
end event

type dw_estado_cta_cte from datawindow within w_cuenta_corriente_oferta_bkp
integer x = 2286
integer y = 888
integer width = 850
integer height = 740
string dataobject = "d_estado_cta_cte_oferta"
boolean border = false
boolean livescroll = true
end type

type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_oferta_bkp
integer x = 37
integer y = 28
integer width = 3118
integer height = 864
integer taborder = 10
string dataobject = "d_encabezado_cuenta_cte_oferta"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string 	agente, superv,ls_columna,ls_moneda,ls_uso,ls_string
Long		ll_codigo
Double	lld_pie
ls_columna	= dwo.name
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "oferta_v_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "oferta_v_nro_oferta")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if ls_columna='oferta_v_promocion' or ls_columna='t_16' then
	ll_codigo	= dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_promocion')
	if not isnull(ll_codigo) and ll_codigo<>0 then OpenWithParm(w_lista_detalle_promocion, string(ll_codigo))
end if
if ls_columna='oferta_v_nro_reprog_mant' or ls_columna='t_30' then
	if isvalid(w_detalle_de_reprogramaciones_mantencion) then close(w_detalle_de_reprogramaciones_mantencion)
	if dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_nro_reprog_mant')>0 then
		gs_base		= 'O'
		gs_serie		= dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_serie')
		gi_numero	= dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_nro_oferta')
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
		OpenWithParm(w_detalle_de_reprogramaciones_mantencion,ls_string)
	end if
end if
if ls_columna='oferta_v_cod_age' or ls_columna='oferta_v_cod_sup' or ls_columna='oferta_v_cod_jef' or &
	ls_columna='oferta_v_cod_age_t' or ls_columna='oferta_v_cod_sup_t' or ls_columna='t_14' then
	agente = getitemstring(1,"oferta_v_cod_age")
	superv = getitemstring(1,"oferta_v_cod_sup")
	dw_agente_super.settransobject(sqlca)
	dw_agente_super.retrieve(agente, superv)
	dw_agente_super.visible=true
end if
if ls_columna='t_22' or ls_columna='t_26' or ls_columna='t_23' or ls_columna='t_24' or &
	ls_columna='t_25' or ls_columna='c_cuotas_mora_pie' or ls_columna='pago_oferta_ctas_pagadas_pie' or &
	ls_columna='pago_oferta_ctas_pactadas_pie' or ls_columna='pago_oferta_fecha_prim_pie' then
	lld_pie			= double(dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_pie'))
	ls_moneda		= dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_moneda')
	if lld_pie>0 then
		ls_uso		= trim(dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_uso'))
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
			openwithparm(w_ingreso_pie_pactado,ls_string)
		else
			if isnull(ls_uso) then
				messagebox("Advertencia","Debe ingresar antes Uso")
			elseif isnull(ls_moneda) then
				messagebox("Advertencia","Debe ingresar antes Moneda")
			end if
		end if
	end if
end if
end event

type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_oferta_bkp
integer x = 41
integer y = 900
integer width = 2231
integer height = 712
integer taborder = 30
boolean titlebar = true
string title = "Detalle Cta. Cte. Total ** doble click en Folio detalle pago **"
string dataobject = "d_listado_cuenta_cte"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long 		folio1
string 	tcom1
if getrow() > 0 then
	folio1	= getitemnumber(getrow(), "folio")
	tcom1 	= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if

end event

type dw_cons_docu_w from datawindow within w_cuenta_corriente_oferta_bkp
boolean visible = false
integer x = 41
integer y = 900
integer width = 2231
integer height = 712
integer taborder = 20
boolean titlebar = true
string title = "Detalle Pago"
string dataobject = "cons_docu_w"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
this.visible = FALSE

end event

event clicked;
this.visible = FALSE
end event

type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_oferta_bkp
integer x = 41
integer y = 900
integer width = 2231
integer height = 712
integer taborder = 40
boolean titlebar = true
string title = "Detalle Cuotas Sepultura"
string dataobject = "d_listado_cuenta_cte_cta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long folio1
string tcom1
if getrow()>0 then
	folio1	= getitemnumber(getrow(), "folio")
	tcom1 	= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if
end event

type dw_listado_cuenta_cte_man from datawindow within w_cuenta_corriente_oferta_bkp
integer x = 41
integer y = 900
integer width = 2231
integer height = 712
integer taborder = 50
boolean titlebar = true
string title = "Detalle de Mantención"
string dataobject = "d_listado_cuenta_cte_man"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long folio1
string tcom1
if getrow() > 0 then
	folio1						= getitemnumber(getrow(), "folio")
	tcom1 						= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
END IF
end event

