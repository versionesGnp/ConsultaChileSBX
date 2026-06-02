forward
global type w_cd_asignar_folio_bkp from window
end type
type shl_1 from statichyperlink within w_cd_asignar_folio_bkp
end type
type st_texto_entrega from statictext within w_cd_asignar_folio_bkp
end type
type cb_procesar from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_cta_cte from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_filtrar from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_sort from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_exportar from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_imprimir from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_limpiar from commandbutton within w_cd_asignar_folio_bkp
end type
type cb_grabar from commandbutton within w_cd_asignar_folio_bkp
end type
type em_final from editmask within w_cd_asignar_folio_bkp
end type
type st_2 from statictext within w_cd_asignar_folio_bkp
end type
type em_inicial from editmask within w_cd_asignar_folio_bkp
end type
type st_1 from statictext within w_cd_asignar_folio_bkp
end type
type dw_tipo_contrato from datawindow within w_cd_asignar_folio_bkp
end type
type cb_cerrar from commandbutton within w_cd_asignar_folio_bkp
end type
type dw_lista from datawindow within w_cd_asignar_folio_bkp
end type
type gb_1 from groupbox within w_cd_asignar_folio_bkp
end type
type cbx_entrega from checkbox within w_cd_asignar_folio_bkp
end type
type gb_2 from groupbox within w_cd_asignar_folio_bkp
end type
type p_fecha from picture within w_cd_asignar_folio_bkp
end type
end forward

global type w_cd_asignar_folio_bkp from window
integer width = 3291
integer height = 1856
boolean titlebar = true
string title = "Asignar Formulario"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
shl_1 shl_1
st_texto_entrega st_texto_entrega
cb_procesar cb_procesar
cb_cta_cte cb_cta_cte
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_grabar cb_grabar
em_final em_final
st_2 st_2
em_inicial em_inicial
st_1 st_1
dw_tipo_contrato dw_tipo_contrato
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
cbx_entrega cbx_entrega
gb_2 gb_2
p_fecha p_fecha
end type
global w_cd_asignar_folio_bkp w_cd_asignar_folio_bkp

type variables
Long		il_row
String	is_filtro
end variables

event open;gf_centrar(w_cd_asignar_folio)
dw_tipo_contrato.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_tipo_contrato.insertrow(0)
dw_tipo_contrato.setfocus()
dw_tipo_contrato.setcolumn('base')
end event

on w_cd_asignar_folio_bkp.create
this.shl_1=create shl_1
this.st_texto_entrega=create st_texto_entrega
this.cb_procesar=create cb_procesar
this.cb_cta_cte=create cb_cta_cte
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.em_final=create em_final
this.st_2=create st_2
this.em_inicial=create em_inicial
this.st_1=create st_1
this.dw_tipo_contrato=create dw_tipo_contrato
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.cbx_entrega=create cbx_entrega
this.gb_2=create gb_2
this.p_fecha=create p_fecha
this.Control[]={this.shl_1,&
this.st_texto_entrega,&
this.cb_procesar,&
this.cb_cta_cte,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_grabar,&
this.em_final,&
this.st_2,&
this.em_inicial,&
this.st_1,&
this.dw_tipo_contrato,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.cbx_entrega,&
this.gb_2,&
this.p_fecha}
end on

on w_cd_asignar_folio_bkp.destroy
destroy(this.shl_1)
destroy(this.st_texto_entrega)
destroy(this.cb_procesar)
destroy(this.cb_cta_cte)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.em_inicial)
destroy(this.st_1)
destroy(this.dw_tipo_contrato)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.cbx_entrega)
destroy(this.gb_2)
destroy(this.p_fecha)
end on

event mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type shl_1 from statichyperlink within w_cd_asignar_folio_bkp
integer x = 2482
integer y = 1616
integer width = 370
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "Envio Email"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;mailsession mses
mailreturncode mret
mailmessage mmsg
mses							= create mailsession
mret							= mses.maillogon(mailnewsession!)
if mret <> mailReturnSuccess! then
	return
end if
mmsg.recipient[1].name	= 'mirkom@elprado.cl'
mmsg.subject				= 'ejemplo'
mmsg.notetext				= 'texto prueba'
mses.mailsend(mmsg)
if mret <> mailreturnsuccess! then
	return
end if
mses.maillogoff()
destroy mses
end event

type st_texto_entrega from statictext within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1627
integer y = 340
integer width = 1083
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Entrega Formulario Inmediato al Depto.indicado"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type cb_procesar from commandbutton within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 2683
integer y = 244
integer width = 480
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event clicked;String	ls_base,ls_serie,ls_glosa,ls_descrip_estado,ls_depto,ls_usuario,ls_descrip_depto,&
			ls_filtro=''
Long		ll_folio_ini,ll_folio_fin,ll_indi,ll_new,ll_estado_ult,ll_tot_reg,ll_count_reg
Datetime	ldt_fecha_crea
SetPointer(HourGlass!)

dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
ls_base							= dw_tipo_contrato.getitemstring(1,'base')
ls_serie							= dw_tipo_contrato.getitemstring(1,'serie')
ls_depto							= dw_tipo_contrato.getitemstring(1,'depto')
ll_folio_ini					= long(em_inicial.text)
ll_folio_fin					= long(em_final.text)
SELECT 	"CD_CODIGO_DEPTO"."DESCRIPCION"  
INTO 		:ls_descrip_depto  
FROM 		"CD_CODIGO_DEPTO"  
WHERE 	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto   
USING		sqlca;
if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 and not isnull(ls_depto) then
	if ll_folio_ini>ll_folio_fin then
		messagebox("Advertencia","Rango de Folio Inválido")
		dw_lista.reset()
		em_final.setfocus()
	else
		ll_tot_reg				= dw_lista.retrieve(ll_folio_ini,ll_folio_fin,ls_base)
		for ll_indi = ll_folio_ini to ll_folio_fin
			SELECT	"CD_FOLIO"."ULT_ESTADO"  
			INTO 		:ll_estado_ult  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_indi )   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"OFERTA_V"."FECHA_INGRESO"  
						INTO 		:ldt_fecha_crea  
						FROM 		"CADENA",   
									"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi ) )   
						USING		sqlca;

					CASE 'L'
						SELECT	"ANEXO_LIBERADOR"."FECHA_INGRESO"  
						INTO 		:ldt_fecha_crea  
						FROM 		"ANEXO_LIBERADOR",   
									"CADENA",   
									"PAGO_LIBERADOR"  
						WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
								 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi ) )   
						USING		sqlca;

					CASE 'R'
						SELECT	"REPACTA_MANTENCION"."FECHA_CREA"  
						INTO 		:ldt_fecha_crea  
						FROM 		"CADENA",   
									"REPACTA_MANTENCION"  
						WHERE	 ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
								 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi )  )   
						USING		sqlca;

					CASE 'P'
						SELECT	"OFERTA_V"."FECHA_INGRESO"  
						INTO 		:ldt_fecha_crea  
						FROM 		"CADENA",   
									"PAGARE_V",   
									"OFERTA_V"  
						WHERE	 ( "CADENA"."SERIE" = "PAGARE_V"."SERIE_P" ) and  
								 ( "CADENA"."NUMERO" = "PAGARE_V"."NUMERO_P" ) and  
								 ( "PAGARE_V"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "PAGARE_V"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi ) AND  
								 ( "PAGARE_V"."BASE" = 'O' ) ) 
						USING		sqlca;

					CASE 'D'
						SELECT	"DERECHO"."FECHAS_INGRESO"  
						INTO 		:ldt_fecha_crea  
						FROM 		"CADENA",   
									"DERECHO"  
						WHERE	 ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
								 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi ) )   
						USING		sqlca;

					CASE 'C'
						SELECT	"CONTRATO"."FECHAS_INGRESO"  
						INTO 		:ldt_fecha_crea  
						FROM 		"CADENA",   
									"CONTRATO"  
						WHERE	 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
								 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_indi ) )   
						USING		sqlca;

				END CHOOSE
				if sqlca.sqlcode=0 then
					ll_new			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(0)
					dw_lista.setitem(ll_new,'base',ls_base)
					dw_lista.setitem(ll_new,'serie',ls_serie)
					dw_lista.setitem(ll_new,'numero',ll_indi)
					dw_lista.setitem(ll_new,'estado_reg','A')
					dw_lista.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
				else
					ldt_fecha_crea	= datetime(today(),time("00:00:00"))
					ll_new			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(0)
					dw_lista.setitem(ll_new,'base',ls_base)
					dw_lista.setitem(ll_new,'serie',ls_serie)
					dw_lista.setitem(ll_new,'numero',ll_indi)
					dw_lista.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
					dw_lista.setitem(ll_new,'usuario_crea',gs_user)
					if ls_depto='O' then
						dw_lista.setitem(ll_new,'cod_agente','CA')
						dw_lista.setitem(ll_new,'cod_supervisor','CS')
						dw_lista.setitem(ll_new,'cod_jefe_venta','CJ')
					end if
					dw_lista.setitem(ll_new,'ult_estado',0)
					dw_lista.setitem(ll_new,'estado_reg','N')
					dw_lista.setitem(ll_new,'ult_fecha_estado',ldt_fecha_crea)
					ls_glosa			= 'Folio '+ls_base+'-'+ls_serie+'-'+string(ll_indi,"###,###,###,###")+' Asignado al Depto.: '+ls_descrip_depto+', por Usuario: '+gs_user+': '+gs_nom_comp_usuario+' el '+string(gdt_fec_sistema)
					dw_lista.setitem(ll_new,'ult_glosa_estado',ls_glosa)
					dw_lista.setitem(ll_new,'ult_memo','-')
					dw_lista.setitem(ll_new,'ult_usuario_gestion',gs_user)
					dw_lista.setitem(ll_new,'depto_asignado',ls_depto)
				end if
			end if
		next
		dw_lista.sort()
		dw_lista.accepttext()
	end if
else
	if isnull(ls_base) then
		messagebox("Advertencia","Base Inválida")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('base')
	elseif isnull(ls_depto) then
		messagebox("Advertencia","Departamento Inválido")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('depto')
	elseif isnull(ll_folio_ini) or ll_folio_ini=0 then
		messagebox("Advertencia","Folio Rango Inicial Inválido")
		em_inicial.setfocus()
	elseif isnull(ll_folio_fin) or ll_folio_fin=0 then
		messagebox("Advertencia","Folio Rango Final Inválido")
		em_final.setfocus()
	end if
	dw_lista.reset()
end if
SetPointer(Arrow!)
end event

type cb_cta_cte from commandbutton within w_cd_asignar_folio_bkp
integer x = 434
integer y = 1600
integer width = 352
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a.Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
	END CHOOSE
end if
end event

type cb_filtrar from commandbutton within w_cd_asignar_folio_bkp
integer x = 2167
integer y = 1600
integer width = 274
integer height = 104
integer taborder = 120
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_asignar_folio_bkp
integer x = 1888
integer y = 1600
integer width = 274
integer height = 104
integer taborder = 110
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

type cb_exportar from commandbutton within w_cd_asignar_folio_bkp
integer x = 1609
integer y = 1600
integer width = 274
integer height = 104
integer taborder = 100
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

type cb_imprimir from commandbutton within w_cd_asignar_folio_bkp
integer x = 864
integer y = 1600
integer width = 315
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_asignar_folio_bkp
integer x = 1257
integer y = 1600
integer width = 274
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_tipo_contrato.reset()
dw_tipo_contrato.insertrow(0)
Setnull(il_row);Setnull(is_filtro)
em_inicial.text				= ''
em_final.text					= ''
cbx_entrega.checked			= false
p_fecha.visible				= false
st_texto_entrega.visible	= false
dw_lista.reset()
dw_tipo_contrato.setfocus()
end event

type cb_grabar from commandbutton within w_cd_asignar_folio_bkp
integer x = 41
integer y = 1600
integer width = 315
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_estado_cd
Double	ll_numero
String		ls_base,ls_serie,ls_glosa,ls_memo,ls_estado_reg,ls_depto,ls_glosa_cd,ls_descrip_depto
Datetime	ldt_fecha

SetPointer(HourGlass!)
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_depto			= dw_tipo_contrato.getitemstring(1,'depto')
	SELECT 	"CD_CODIGO_DEPTO"."DESCRIPCION"  
	INTO 		:ls_descrip_depto  
	FROM 		"CD_CODIGO_DEPTO"  
	WHERE 	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto   
	USING		sqlca;
	if dw_lista.update()=1 then
		commit;
		for ll_indi=1 to ll_tot_reg
			ls_base			= dw_lista.getitemstring(ll_indi,'base')
			ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
			ldt_fecha		= dw_lista.getitemdatetime(ll_indi,'ult_fecha_estado')
			ls_glosa			= dw_lista.getitemstring(ll_indi,'ult_glosa_estado')
			ls_memo			= dw_lista.getitemstring(ll_indi,'ult_memo')
			ls_estado_reg	= dw_lista.getitemstring(ll_indi,'estado_reg')
			if ls_estado_reg='N' then
				SELECT	sysdate
				INTO 		:gdt_fec_sistema
				FROM 		"TASA"  ;
				INSERT INTO "CD_FOLIO_DETALLE"  
						( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   	"MEMO" )  
				VALUES 
						( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   		0, 				:ldt_fecha,   		:ls_glosa,	:ls_memo )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					if ls_depto='O' then
						UPDATE	"CD_FOLIO"  
						SET 		"ESTADO_REG" = 'I',
									"ULT_ESTADO" = 6
						WHERE	 ( "CD_FOLIO"."BASE" = :ls_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					else
						UPDATE	"CD_FOLIO"  
						SET 		"ESTADO_REG" = 'I'  
						WHERE	 ( "CD_FOLIO"."BASE" = :ls_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				else
					rollback;
				end if
				if cbx_entrega.checked=true then
					if ls_depto='V' then //Venta
						ll_estado_cd	= 1
					else //Operaciones
						ll_estado_cd	= 6
					end if
					SELECT	sysdate
					INTO 		:gdt_fec_sistema
					FROM 		"TASA"  ;
					ls_glosa_cd			= 'Folio '+ls_base+'-'+ls_serie+'-'+string(ll_indi,"###,###,###,###")+' Se entrega al Depto.: '+ls_descrip_depto+', por Usuario: '+gs_user+': '+gs_nom_comp_usuario+' el '+string(gdt_fec_sistema)
					INSERT INTO "CD_FOLIO_DETALLE"  
							( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   		"MEMO" )  
					VALUES 
							( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   		:ll_estado_cd, :ldt_fecha,   		:ls_glosa_cd,	:ls_memo ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"CD_FOLIO"  
						SET 		"ULT_ESTADO" = :ll_estado_cd,   
									"ULT_FECHA_ESTADO" = :ldt_fecha,   
									"ULT_GLOSA_ESTADO" = :ls_glosa_cd,   
									"ULT_MEMO" = :ls_memo,   
									"ULT_USUARIO_GESTION" = :gs_user  
						WHERE	 ( "CD_FOLIO"."BASE" = :ls_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
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
		next
		messagebox("Grabar","Grabación Exitosa")
		cb_limpiar.triggerevent(clicked!)
	else
		rollback;
		messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
SetPointer(Arrow!)
end event

type em_final from editmask within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 2683
integer y = 112
integer width = 480
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
boolean spin = true
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event modified;Long	ll_hasta
ll_hasta	= long(this.text)
if not isnull(ll_hasta) and ll_hasta>0 then dw_lista.reset()
end event

type st_2 from statictext within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 2496
integer y = 124
integer width = 160
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type em_inicial from editmask within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 1998
integer y = 112
integer width = 480
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
boolean spin = true
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event modified;Long	ll_desde
ll_desde	= long(this.text)
if not isnull(ll_desde) and ll_desde>0 then dw_lista.reset()
end event

type st_1 from statictext within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 128
integer width = 183
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= true
st_texto_entrega.visible	= true
end event

type dw_tipo_contrato from datawindow within w_cd_asignar_folio_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 59
integer y = 104
integer width = 1678
integer height = 264
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_contrato_cd"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event itemchanged;String	ls_columna,ls_base,ls_depto
this.accepttext()
ls_columna			= dwo.name
dw_lista.reset()
em_inicial.text	= ''
em_final.text		= ''
if ls_columna='base' then
	dw_tipo_contrato.setitem(1,'serie','')
	ls_base	= dw_tipo_contrato.getitemstring(1,'base')
	if not isnull(ls_base) and ls_base<>'' then
		if ls_base='O' then
			dw_tipo_contrato.setitem(1,'serie','I')
		elseif ls_base='L' then
			dw_tipo_contrato.setitem(1,'serie','L')
		elseif ls_base='R' then
			dw_tipo_contrato.setitem(1,'serie','')
		end if
	end if
	dw_tipo_contrato.setcolumn('depto')
elseif ls_columna='depto' then
	ls_depto	= dw_tipo_contrato.getitemstring(1,'depto')
	if ls_depto='O' then
		cbx_entrega.enabled	= false
		cbx_entrega.checked	= true
		dw_tipo_contrato.setitem(1,'serie','R')
	elseif ls_depto='V' then
		cbx_entrega.checked	= false
		cbx_entrega.enabled	= true
		dw_tipo_contrato.setitem(1,'serie','I')
	end if
end if
this.accepttext()
end event

type cb_cerrar from commandbutton within w_cd_asignar_folio_bkp
integer x = 2894
integer y = 1600
integer width = 315
integer height = 104
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_asignar_folio)
end event

type dw_lista from datawindow within w_cd_asignar_folio_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 432
integer width = 3168
integer height = 1124
integer taborder = 50
string dataobject = "dw_lista_estado_inicial"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event clicked;String	ls_columna
ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
if ls_columna='t_rojo' or ls_columna='t_rojo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'N'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'I'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_blanco' or ls_columna='t_blanco_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'A'+"'" then
		is_filtro	= "estado_reg="+"'"+'N'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
elseif ls_columna='t_amarillo' or ls_columna='t_amarillo_txt' then
	if is_filtro='' or isnull(is_filtro) or is_filtro="estado_reg="+"'"+'I'+"'" or is_filtro="estado_reg="+"'"+'N'+"'" then
		is_filtro	= "estado_reg="+"'"+'A'+"'"
	else
		is_filtro	= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;String	ls_columna
ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_cta_cte.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 16
integer width = 1723
integer height = 380
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar Contrato y Departamento"
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type cbx_entrega from checkbox within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 1838
integer y = 252
integer width = 759
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Entrega Form. Inmediato"
end type

event ue_mousemove;p_fecha.visible				= true
st_texto_entrega.visible	= true
end event

type gb_2 from groupbox within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
integer x = 1787
integer y = 16
integer width = 1422
integer height = 380
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Folio a Generar"
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type p_fecha from picture within w_cd_asignar_folio_bkp
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1682
integer y = 212
integer width = 142
integer height = 120
boolean bringtotop = true
string picturename = "flec_atras.bmp"
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

