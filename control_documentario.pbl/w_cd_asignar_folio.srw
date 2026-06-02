forward
global type w_cd_asignar_folio from window
end type
type st_ult_folio from statictext within w_cd_asignar_folio
end type
type st_entregar_a from statictext within w_cd_asignar_folio
end type
type cb_entragar_a from commandbutton within w_cd_asignar_folio
end type
type cb_procesar from commandbutton within w_cd_asignar_folio
end type
type cb_cta_cte from commandbutton within w_cd_asignar_folio
end type
type cb_filtrar from commandbutton within w_cd_asignar_folio
end type
type cb_sort from commandbutton within w_cd_asignar_folio
end type
type cb_exportar from commandbutton within w_cd_asignar_folio
end type
type cb_imprimir from commandbutton within w_cd_asignar_folio
end type
type cb_limpiar from commandbutton within w_cd_asignar_folio
end type
type cb_grabar from commandbutton within w_cd_asignar_folio
end type
type em_final from editmask within w_cd_asignar_folio
end type
type st_2 from statictext within w_cd_asignar_folio
end type
type em_inicial from editmask within w_cd_asignar_folio
end type
type st_1 from statictext within w_cd_asignar_folio
end type
type dw_tipo_contrato from datawindow within w_cd_asignar_folio
end type
type cb_cerrar from commandbutton within w_cd_asignar_folio
end type
type dw_lista from datawindow within w_cd_asignar_folio
end type
type gb_1 from groupbox within w_cd_asignar_folio
end type
type cbx_entrega from checkbox within w_cd_asignar_folio
end type
type gb_2 from groupbox within w_cd_asignar_folio
end type
type p_fecha from picture within w_cd_asignar_folio
end type
type st_texto_entrega from statictext within w_cd_asignar_folio
end type
end forward

global type w_cd_asignar_folio from window
integer width = 3520
integer height = 1840
boolean titlebar = true
string title = "Foliar Contrato"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
st_ult_folio st_ult_folio
st_entregar_a st_entregar_a
cb_entragar_a cb_entragar_a
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
st_texto_entrega st_texto_entrega
end type
global w_cd_asignar_folio w_cd_asignar_folio

type variables
Long		il_row
String		is_filtro
datawindowchild			idw_detalle5

end variables

event open;Long		ll_parque
gf_centrar(w_cd_asignar_folio)

st_entregar_a.text							= ''
cb_entragar_a.enabled					= false
st_ult_folio.visible							= false
dw_lista.settransobject(sqlca)
dw_tipo_contrato.setfocus()
dw_tipo_contrato.setcolumn('parque')
if gs_conexion	= "Parque El Prado" then
	ll_parque									= 1
else
	ll_parque									= 11
end if
dw_tipo_contrato.getchild('parque',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve()=0 then
	idw_detalle3.insertrow(0)
end if
dw_tipo_contrato.getchild('base',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve()=0 then
	idw_detalle4.insertrow(0)
end if
dw_tipo_contrato.getchild('serie',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if idw_detalle5.retrieve('O',ll_parque)=0 then
	idw_detalle5.insertrow(0)
end if
dw_tipo_contrato.insertrow(0)
dw_tipo_contrato.accepttext()
end event

on w_cd_asignar_folio.create
this.st_ult_folio=create st_ult_folio
this.st_entregar_a=create st_entregar_a
this.cb_entragar_a=create cb_entragar_a
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
this.st_texto_entrega=create st_texto_entrega
this.Control[]={this.st_ult_folio,&
this.st_entregar_a,&
this.cb_entragar_a,&
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
this.p_fecha,&
this.st_texto_entrega}
end on

on w_cd_asignar_folio.destroy
destroy(this.st_ult_folio)
destroy(this.st_entregar_a)
destroy(this.cb_entragar_a)
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
destroy(this.st_texto_entrega)
end on

type st_ult_folio from statictext within w_cd_asignar_folio
integer x = 2437
integer y = 88
integer width = 933
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_entregar_a from statictext within w_cd_asignar_folio
integer x = 745
integer y = 432
integer width = 1856
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_entragar_a from commandbutton within w_cd_asignar_folio
integer x = 41
integer y = 432
integer width = 690
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Personal Recepciona"
end type

event clicked;String	ls_depto
ls_depto						= trim(dw_tipo_contrato.getitemstring(1,'depto'))
setnull(gs_usuario_entregar)
st_entregar_a.text			= ''
if not isnull(ls_depto) and ls_depto<>'' then
	open(w_cd_lista_usuario_a_quien_entregar_doc)
else
	messagebox("Advertencia","Debe Seleccionar Departamento a Entregar Documentos")
	dw_tipo_contrato.setfocus()
	dw_tipo_contrato.setcolumn('depto')
end if
end event

type cb_procesar from commandbutton within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2944
integer y = 292
integer width = 434
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

event clicked;String		ls_base,ls_serie,ls_glosa,ls_descrip_estado,ls_usuario,ls_descrip_depto,	ls_filtro,ls_depto,ls_pasa,ls_pasa_l
Long		ll_new,ll_estado_ult,ll_tot_reg,ll_count_reg,ll_count,ll_cod_parque,ll_sw_pasa
Datetime	ldt_fecha_crea
Double	ll_folio_ini,ll_folio_fin,ll_indi,ll_count_repro

SetPointer(HourGlass!)
ls_pasa									= 'S'
ls_pasa_l									= 'S'
ls_filtro									= ''
ll_sw_pasa								= 0
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.reset()
dw_tipo_contrato.accepttext()
ls_base									= dw_tipo_contrato.getitemstring(1,'base')
ls_serie									= dw_tipo_contrato.getitemstring(1,'serie')
ll_cod_parque							= dw_tipo_contrato.getitemnumber(1,'parque')
ls_depto									= dw_tipo_contrato.getitemstring(1,'depto')
if not isnull(ls_base) and ls_base<>'' then
	if isnull(ls_serie) or ls_serie='' then
		if ls_base='O' or ls_base='A' then
	//		dw_tipo_contrato.setitem(1,'serie','I')
		elseif ls_base='L' then
	//		dw_tipo_contrato.setitem(1,'serie','L')
		elseif ls_base='P' then
			dw_tipo_contrato.setitem(1,'serie','P')
		elseif ls_base='S' then
			dw_tipo_contrato.setitem(1,'serie','P')
		elseif ls_base='U' then
			if ll_cod_parque=11 then
				dw_tipo_contrato.setitem(1,'serie','A')
			else
				dw_tipo_contrato.setitem(1,'serie','U')
			end if
		elseif ls_base='V' then
			dw_tipo_contrato.setitem(1,'serie','V')
		end if
	end if
end if
dw_tipo_contrato.accepttext()
ls_serie									= dw_tipo_contrato.getitemstring(1,'serie')
ll_folio_ini								= Double(em_inicial.text)
ll_folio_fin								= Double(em_final.text)
ll_cod_parque							= dw_tipo_contrato.getitemnumber(1,'parque')
ls_depto									= dw_tipo_contrato.getitemstring(1,'depto')
if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 and not isnull(ll_cod_parque) and ll_cod_parque>0 then
	if ll_folio_ini > ll_folio_fin then
		messagebox("Advertencia","Rango de Folio Inválido")
		dw_lista.reset()
		em_final.setfocus()
	else
		if ls_base='L' and ls_serie='R' then
			SELECT COUNT( "REPACTA_MANTENCION_L"."BASE" )
			INTO 		:ll_count_repro  
			FROM 	"REPACTA_MANTENCION_L"  
			WHERE 	"REPACTA_MANTENCION_L"."NUMERO" = :ll_folio_ini AND
						"REPACTA_MANTENCION_L"."ESTADO_PAGO" = 'V'
			USING	sqlca;
			if ll_count_repro = 0 then
				messagebox("Advertencia","No Existe Desarrollo Reprogramación de Mantención N° "+String(ll_folio_ini,'###,###,###,###,###'))
				ls_pasa_l		= 'N'
			else
				ls_pasa_l		= 'S'
			end if
		end if
		if ls_pasa_l='S' then
			if cbx_entrega.checked=true then
				if not isnull(ls_depto) then
					SELECT	"CD_CODIGO_DEPTO"."DESCRIPCION"  
					INTO 		:ls_descrip_depto  
					FROM 	"CD_CODIGO_DEPTO"  
					WHERE 	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto   
					USING	sqlca;
					ll_sw_pasa ++
				else
					messagebox("Advertencia","Departamento Inválido")
					dw_tipo_contrato.setfocus()
					dw_tipo_contrato.setcolumn('depto')				
					ll_sw_pasa		= 0
					return
				end if
			else
				ll_sw_pasa ++
			end if
			if ll_sw_pasa > 0 then
				ll_tot_reg					= dw_lista.retrieve(ll_folio_ini,ll_folio_fin,ls_base)
				for ll_indi = ll_folio_ini to ll_folio_fin
					if ls_base='L' and ls_serie='R' then
						// Se graba codigo Parque
					elseif ls_base='F' or ls_base='G' or ls_base='U' or ls_base='V' then
						ll_cod_parque		= dw_tipo_contrato.getitemnumber(1,'parque')
					else
						ll_cod_parque		= 0
					end if
					SELECT	"CD_FOLIO"."ULT_ESTADO"  
					INTO 		:ll_estado_ult  
					FROM 	"CD_FOLIO"  
					WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
								( "CD_FOLIO"."SERIE" = :ls_serie ) AND
								( "CD_FOLIO"."NUMERO" = :ll_indi )   
					USING	sqlca;
					if sqlca.sqlcode<>0 then
						CHOOSE CASE ls_base
							CASE 'O', 'U'
								SELECT	"OFERTA_V"."FECHA_INGRESO"  
								INTO 		:ldt_fecha_crea  
								FROM 	"CADENA","OFERTA_V","PAGO_OFERTA"  
								WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
											( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
											( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
											( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
											( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
							CASE 'L'
								SELECT	"ANEXO_LIBERADOR"."FECHA_INGRESO"  
								INTO 		:ldt_fecha_crea  
								FROM 	"ANEXO_LIBERADOR","CADENA","PAGO_LIBERADOR"  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
											( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
							CASE 'A'
								SELECT	"ANEXO_AUMENTO"."FECHA_INGRESO"  
								INTO 		:ldt_fecha_crea  
								FROM 	"ANEXO_AUMENTO","CADENA","PAGO_AUMENTO"  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
											( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
											( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
											( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
							CASE 'R'
								SELECT	"REPACTA_MANTENCION"."FECHA_CREA"  
								INTO 		:ldt_fecha_crea  
								FROM 	"CADENA","REPACTA_MANTENCION"  
								WHERE	( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
											( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
											( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi )  )   
								USING	sqlca;
							CASE 'P'
								SELECT	sysdate
								INTO 		:ldt_fecha_crea  
								FROM 	"PAGARE_V"   
								WHERE	( "PAGARE_V"."SERIE_P" = :ls_serie ) AND  
											( "PAGARE_V"."NUMERO_P" = :ll_indi )    
								USING	sqlca; 
							CASE 'D'
								SELECT	"DERECHO"."FECHAS_INGRESO"  
								INTO 		:ldt_fecha_crea  
								FROM 	"CADENA","DERECHO"  
								WHERE	( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
											( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
							CASE 'C'
								SELECT	"CONTRATO"."FECHAS_INGRESO"  
								INTO 		:ldt_fecha_crea  
								FROM 	"CADENA","CONTRATO"  
								WHERE	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
											( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
											(("CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
							CASE 'F', 'G', 'V'
								SELECT 	"PRODUCTO_ANEXO"."INGRESO_SISTEMA"  
								INTO 		:ldt_fecha_crea
								FROM 	"CADENA",   	"PRODUCTO_ANEXO",   	"PRODUCTO_PAGO"  
								WHERE 	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
											( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
											( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
											( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
											( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
											( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
											( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
											( ( "CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_indi ) )   
								USING	sqlca;
								
	
						END CHOOSE
						if sqlca.sqlcode=0 then
							ls_pasa								= 'N'
						else
							SELECT	COUNT("CD_FOLIO"."ULT_ESTADO")  
							INTO 		:ll_count  
							FROM 	"CD_FOLIO"  
							WHERE  	"CD_FOLIO"."BASE" = :ls_base AND  
										"CD_FOLIO"."SERIE" = :ls_serie AND  
										"CD_FOLIO"."NUMERO" = :ll_indi   
							USING	sqlca;
							if ll_count=0 then
								ls_pasa							='S'
							else
								ls_pasa							='N'
							end if
							if ls_pasa ='S' then
								SELECT	sysdate
								INTO 		:ldt_fecha_crea
								FROM 	"TASA"  ;
								ll_new							= dw_lista.insertrow(0)
								dw_lista.scrolltorow(0)
								dw_lista.setitem(ll_new,'base',ls_base)
								dw_lista.setitem(ll_new,'serie',ls_serie)
								dw_lista.setitem(ll_new,'numero',ll_indi)
								dw_lista.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
								dw_lista.setitem(ll_new,'usuario_crea',gs_user)
								dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
								if ls_depto='P' then
									if ls_base='O' or ls_base='A' then dw_lista.setitem(ll_new,'serie','R')
									if gs_empresa='El Prado' then
										dw_lista.setitem(ll_new,'cod_agente','CA')
										dw_lista.setitem(ll_new,'cod_supervisor','CS')
										dw_lista.setitem(ll_new,'cod_jefe_venta','CJ')
									else
										dw_lista.setitem(ll_new,'cod_agente','302')
										dw_lista.setitem(ll_new,'cod_supervisor','099')
										dw_lista.setitem(ll_new,'cod_jefe_venta','CJ')
									end if
								end if
								dw_lista.setitem(ll_new,'ult_estado',0)
								dw_lista.setitem(ll_new,'estado_reg','N')
								dw_lista.setitem(ll_new,'ult_fecha_estado',ldt_fecha_crea)
								if not isnull(ls_descrip_depto) and ls_descrip_depto<>'' then
									ls_glosa			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_indi,"###,###,###,###")+' ASIGNADO AL DEPTO.: '+ls_descrip_depto+', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
								else
									ls_glosa			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_indi,"###,###,###,###")+', CREADO POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
								end if
								dw_lista.setitem(ll_new,'ult_glosa_estado',ls_glosa)
								dw_lista.setitem(ll_new,'ult_memo','-')
								dw_lista.setitem(ll_new,'ult_referencia_memo','-')
								dw_lista.setitem(ll_new,'ult_usuario_gestion',gs_user)
								dw_lista.setitem(ll_new,'depto_asignado',ls_depto)
							end if
						end if
					else
						if ll_estado_ult>=2 then
							dw_lista.deleterow(ll_indi)
							dw_lista.accepttext()
						end if
					end if
				next
				dw_lista.sort()
				dw_lista.accepttext()
			end if
		end if
	end if
else
	if isnull(ls_base) then
		messagebox("Advertencia","Base Inválida")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('base')
	elseif isnull(ll_folio_ini) or ll_folio_ini=0 then
		messagebox("Advertencia","Folio Rango Inicial Inválido")
		em_inicial.setfocus()
	elseif isnull(ll_folio_fin) or ll_folio_fin=0 then
		messagebox("Advertencia","Folio Rango Final Inválido")
		em_final.setfocus()
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia","Código Parque Inválido")
		dw_tipo_contrato.setfocus()
		dw_tipo_contrato.setcolumn('parque')
	end if
	dw_lista.reset()
end if
SetPointer(Arrow!)
//cb_entragar_a.enabled					= true
end event

type cb_cta_cte from commandbutton within w_cd_asignar_folio
integer x = 411
integer y = 1600
integer width = 439
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;String		ls_serie_c,ls_base_c
Double	ll_numero_c
if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	
	SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA"."RUT"	
	INTO 		:gs_dv,				:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gs_estado,				:gl_cod_parque_cta,		:gi_rut
	FROM 		"CADENA",   
				"CLIENTE"  
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )   ;

	
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			SELECT	"PAGARE_V"."SERIE",   
						"PAGARE_V"."NUMERO",   
						"PAGARE_V"."BASE"  
			INTO 		:ls_serie_c,   
						:ll_numero_c,   
						:ls_base_c  
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE_V"."NUMERO_P" = :gi_numero )   
			USING		sqlca; 
			if not isnull(ls_serie_c) and ls_serie_c<>'' and not isnull(ls_base_c) and ls_base_c<>'0' and ll_numero_c>0 then
				messagebox("Advertencia","Recuerde Pagaré seleccionado está Asociado al Contrato Nº "+ls_base_c+'-'+ls_serie_c+'-'+string(ll_numero_c,"###,###,###,###,###"))
			else
				messagebox("Advertencia","No Registra Datos Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###"))
			end if
//			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
//			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "F","G", "V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type cb_filtrar from commandbutton within w_cd_asignar_folio
integer x = 2295
integer y = 1600
integer width = 274
integer height = 96
integer taborder = 130
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

type cb_sort from commandbutton within w_cd_asignar_folio
integer x = 2016
integer y = 1600
integer width = 274
integer height = 96
integer taborder = 120
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

type cb_exportar from commandbutton within w_cd_asignar_folio
integer x = 1737
integer y = 1600
integer width = 274
integer height = 96
integer taborder = 110
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

type cb_imprimir from commandbutton within w_cd_asignar_folio
integer x = 905
integer y = 1600
integer width = 315
integer height = 96
integer taborder = 90
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

type cb_limpiar from commandbutton within w_cd_asignar_folio
integer x = 1408
integer y = 1600
integer width = 274
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_parque
dw_tipo_contrato.reset()
Setnull(il_row);Setnull(is_filtro)
em_inicial.text									= ''
em_final.text									= ''
st_entregar_a.text								= ''
st_ult_folio.text									= ''
st_ult_folio.visible								= false
cbx_entrega.checked							= false
cbx_entrega.visible							= true
p_fecha.visible									= false
st_texto_entrega.visible						= false
dw_tipo_contrato.object.depto_t.visible	= false
//dw_tipo_contrato.object.depto.visible	= false
cb_entragar_a.enabled						= false
dw_lista.reset()
dw_tipo_contrato.setfocus()
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
else
	ll_parque				= 11
end if
dw_tipo_contrato.getchild('depto',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if

dw_tipo_contrato.getchild('parque',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve()=0 then
	idw_detalle3.insertrow(0)
end if

dw_tipo_contrato.getchild('base',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve()=0 then
	idw_detalle4.insertrow(0)
end if

dw_tipo_contrato.getchild('serie',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if idw_detalle5.retrieve('O',ll_parque)=0 then
	idw_detalle5.insertrow(0)
end if
dw_tipo_contrato.insertrow(0)
dw_tipo_contrato.accepttext()
end event

type cb_grabar from commandbutton within w_cd_asignar_folio
integer x = 41
integer y = 1600
integer width = 315
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_estado_cd,ll_count,ll_resp,ll_cod_parque,ll_ult_estado
String		ls_base,ls_serie,ls_glosa,ls_memo,ls_estado_reg,ls_depto,ls_glosa_cd,ls_descrip_depto,ls_ref_memo,ls_nombre_entregar,ls_nom_sup,ls_jefe,ls_nom_com_jef,ls_sup,ls_nulo
Datetime	ldt_fecha
Double	ll_numero

SetPointer(HourGlass!)
Setnull(ls_nulo)
dw_tipo_contrato.accepttext()
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_count	= dw_lista.Find("estado_reg = "+"'"+'N'+"'",1,ll_tot_reg)
	if ll_count>0 then	
		ls_depto			= dw_tipo_contrato.getitemstring(1,'depto')
		if (not isnull(ls_depto) or ls_depto<>'') and (isnull(gs_usuario_entregar) or gs_usuario_entregar='') then
			messagebox("Advertencia","Debe Seleccionar Usuario a Entregar Documentos")
			cb_entragar_a.setfocus()
		else
			SELECT 	"CD_CODIGO_DEPTO"."DESCRIPCION"  
			INTO 		:ls_descrip_depto  
			FROM 		"CD_CODIGO_DEPTO"  
			WHERE 	"CD_CODIGO_DEPTO"."CODIGO" = :ls_depto   
			USING		sqlca;
			for ll_indi=1 to ll_tot_reg
				SELECT	sysdate
				INTO 		:gdt_fec_sistema
				FROM 		"TASA"  ;
				ls_base			= dw_lista.getitemstring(ll_indi,'base')
				ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
				ldt_fecha			= dw_lista.getitemdatetime(ll_indi,'ult_fecha_estado')
				ls_glosa			= dw_lista.getitemstring(ll_indi,'ult_glosa_estado')
				ls_memo			= dw_lista.getitemstring(ll_indi,'ult_memo')
				ls_estado_reg	= dw_lista.getitemstring(ll_indi,'estado_reg')
				ls_ref_memo	= dw_lista.getitemstring(ll_indi,'ult_referencia_memo')
				ll_cod_parque	= dw_lista.getitemnumber(ll_indi,'cod_parque')
				if ls_estado_reg='N' then
					INSERT INTO "CD_FOLIO_DETALLE"  
							( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   	"MEMO",		"REFERENCIA_MEMO",	"COD_PARQUE" )  
					VALUES 
							( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   				0, 				:ldt_fecha,   		:ls_glosa,	:ls_memo,	:ls_ref_memo,			:ll_cod_parque )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_depto='P' then
							dw_lista.setitem(ll_indi,'estado_reg','I')
							dw_lista.setitem(ll_indi,'ult_estado',6)
						else
							dw_lista.setitem(ll_indi,'estado_reg','I')
						end if
					end if
					if cbx_entrega.checked=true and ls_depto='V' then
						SELECT	"ENCARGADOS"."NOMBRE"  
						INTO 		:ls_nombre_entregar  
						FROM 	"ENCARGADOS"  
						WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
						USING	sqlca;
						ll_estado_cd			= 1
						ls_glosa_cd			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ENTREGA AL DEPTO.: '+ls_descrip_depto+' A '+ ls_nombre_entregar +', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
						INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   		"MEMO",		"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"COD_PARQUE" )  
						VALUES 
								( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   		:ll_estado_cd, :ldt_fecha,   		:ls_glosa_cd,	:ls_memo,	:ls_ref_memo,			:gs_usuario_entregar,			:ll_cod_parque ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'ult_estado',ll_estado_cd)
							dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
							dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa_cd)
							dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',ls_ref_memo)
							dw_lista.setitem(ll_indi,'usuario_entregar_form',gs_usuario_entregar)
							dw_lista.accepttext()
							if (ls_base='G' or ls_base='V') and ls_depto='V' then
								ls_sup				= gs_usuario_entregar
								ll_ult_estado		= 2
								SELECT 	"SUPERVISOR"."NOMBRE" ||' '|| "SUPERVISOR"."A_PATERNO" ||' '|| "SUPERVISOR"."A_MATERNO",
											"SUPERVISOR"."COD_JEFE",
											"JEFE_VENTAS"."NOMBRE" ||' '|| "JEFE_VENTAS"."A_PATERNO"|| ' ' || "JEFE_VENTAS"."A_MATERNO"
								INTO 		:ls_nom_sup,
											:ls_jefe,
											:ls_nom_com_jef
								FROM 		"SUPERVISOR", "JEFE_VENTAS"  
								WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   AND
											"SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS";
											
								ls_glosa_cd	= 'SE ASIGNA CONTRATO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' AL SUPERVISOR: '+ls_sup+'  '+ls_nom_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
								INSERT INTO "CD_FOLIO_DETALLE"  
												("BASE",   	"SERIE",  "NUMERO",	"FECHA_CREA",  	"USUARIO_CREA",	"ESTADO",   	"FECHA_ESTADO",	"GLOSA",			"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"COD_PARQUE" )  
								VALUES		(:ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha,			:gs_user,   			:ll_ult_estado,	:ldt_fecha,   		:ls_glosa_cd,	'-' ,		:ls_nulo,				:ls_sup,					:ls_jefe,					'-',								:ll_cod_parque)  
								USING		sqlca;

								dw_lista.setitem(ll_indi,'ult_estado',ll_ult_estado)
								dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
								dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa)
								dw_lista.setitem(ll_indi,'ult_memo','-')
								dw_lista.setitem(ll_indi,'ult_referencia_memo','-')
								dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
								dw_lista.setitem(ll_indi,'cod_agente',ls_nulo)
								dw_lista.setitem(ll_indi,'cod_supervisor',ls_sup)
								dw_lista.setitem(ll_indi,'cod_jefe_venta',ls_jefe)
								dw_lista.setitem(ll_indi,'cod_parque',ll_cod_parque)
								dw_lista.accepttext()
							end if
						end if
						
					end if
					if cbx_entrega.checked=true and ls_depto='O' and ls_base<>'G' and ls_base<>'V' then
						SELECT	"ENCARGADOS"."NOMBRE"  
						INTO 		:ls_nombre_entregar  
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
						USING		sqlca;
						ll_estado_cd			= 9
						ls_glosa_cd			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ACEPTA CONTRATO Y ENTREGA A DIGITACION, POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
						INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   		"FECHA_ESTADO",   "GLOSA",   		"MEMO",		"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"COD_PARQUE"  )  
						VALUES 
								( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   				:ll_estado_cd, 	:ldt_fecha,   			:ls_glosa_cd,	:ls_memo,	:ls_ref_memo,				:gs_usuario_entregar,			:ll_cod_parque) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'ult_estado',ll_estado_cd)
							dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
							dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa_cd)
							dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',ls_ref_memo)
							dw_lista.setitem(ll_indi,'usuario_entregar_form',gs_usuario_entregar)
						end if
					end if
					if cbx_entrega.checked=true and ls_depto='T' and ls_base <> 'G' and ls_base <>'V' then
						SELECT	"ENCARGADOS"."NOMBRE"  
						INTO 		:ls_nombre_entregar  
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
						USING	sqlca;
						ll_estado_cd		= 20
						ls_glosa_cd		= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ENTREGA AL DEPTO.: '+ls_descrip_depto+' A '+ ls_nombre_entregar +', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
						INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   		"MEMO",		"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"COD_PARQUE" )  
						VALUES 
								( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   		:ll_estado_cd, :ldt_fecha,   		:ls_glosa_cd,	:ls_memo,	:ls_ref_memo,			:gs_usuario_entregar,			:ll_cod_parque) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'ult_estado',ll_estado_cd)
							dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
							dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa_cd)
							dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',ls_ref_memo)
							dw_lista.setitem(ll_indi,'usuario_entregar_form',gs_usuario_entregar)
						end if
					end if
					if ls_depto='P' then
						ll_estado_cd		= 6
						SELECT	"ENCARGADOS"."NOMBRE"  
						INTO 		:ls_nombre_entregar  
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
						USING		sqlca;
						ls_glosa_cd			= 'FOLIO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' SE ENTREGA AL DEPTO.: '+ls_descrip_depto+' A '+ ls_nombre_entregar +', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
						INSERT INTO "CD_FOLIO_DETALLE"  
								( "BASE",   "SERIE", 	"NUMERO",   "FECHA_CREA",  	"USUARIO_CREA",   "ESTADO",   	"FECHA_ESTADO",   "GLOSA",   		"MEMO",		"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"COD_PARQUE" )  
						VALUES 
								( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema, :gs_user,   		:ll_estado_cd, :ldt_fecha,   		:ls_glosa_cd,	:ls_memo,	:ls_ref_memo,			:gs_usuario_entregar,			:ll_cod_parque ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'ult_estado',ll_estado_cd)
							dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
							dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa_cd)
							dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
							dw_lista.setitem(ll_indi,'ult_usuario_gestion',ls_ref_memo)
							dw_lista.setitem(ll_indi,'usuario_entregar_form',gs_usuario_entregar)
							if gs_conexion	= "Parque El Prado" then
								dw_lista.setitem(ll_indi,'cod_agente','CA')
								dw_lista.setitem(ll_indi,'cod_supervisor','CS')
								dw_lista.setitem(ll_indi,'cod_jefe_venta','CJ')
							else
								dw_lista.setitem(ll_indi,'cod_agente','302')
								dw_lista.setitem(ll_indi,'cod_supervisor','099')
								dw_lista.setitem(ll_indi,'cod_jefe_venta','CJ')
							end if
							if ls_base='S' then
								ls_serie		= 'P'
							else
								if ls_base='L' then
//									ls_serie	= 'L'
								else
									ls_serie	= 'R'
								end if
							end if
							dw_lista.setitem(ll_indi,'serie',ls_serie)
						end if
					end if
				end if
			next
			if dw_lista.update()=1 then
				commit using sqlca;
				ll_resp	= messagebox("Grabar","GRABACION EXITOSA, desea Limpiar Pantalla",Exclamation!, YesNo!, 2)
				if ll_resp=1 then cb_limpiar.triggerevent(clicked!)
			else
				rollback using sqlca;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		messagebox("Advertencia","No Registra Folio Nuevo para Grabar")
	end if
end if
SetPointer(Arrow!)
end event

type em_final from editmask within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2871
integer y = 160
integer width = 512
integer height = 100
integer taborder = 30
integer textsize = -9
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

event modified;Long		ll_folio_ini,ll_folio_fin,ll_cod_parque
String		ls_base

ll_folio_ini			= long(em_inicial.text)
ll_folio_fin			= long(em_final.text)
if not isnull(ll_folio_fin) and ll_folio_fin>0 then dw_lista.reset()
ls_base				= dw_tipo_contrato.getitemstring(1,'base')
ll_cod_parque		= dw_tipo_contrato.getitemnumber(1,'parque')
if cbx_entrega.checked=true then
	if not isnull(ls_base) and /*not isnull(ls_depto) and*/ ll_folio_ini>0 and ll_folio_fin>0 /*and ll_cod_parque>0*/ then cb_procesar.triggerevent(clicked!)
else
	if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 /*and ll_cod_parque>0*/ then cb_procesar.triggerevent(clicked!)
end if
end event

type st_2 from statictext within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2720
integer y = 176
integer width = 142
integer height = 68
integer textsize = -8
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

type em_inicial from editmask within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2203
integer y = 160
integer width = 512
integer height = 100
integer taborder = 20
integer textsize = -9
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

event modified;Long		ll_folio_ini,ll_folio_fin, ll_max_folio,ll_cod_parque,ll_res,ll_nulo
String		ls_base,ls_serie,ls_depto

setnull(ll_nulo)
ll_folio_ini							= long(this.text)
if not isnull(ll_folio_ini) and ll_folio_ini>0 then dw_lista.reset()
ls_base								= dw_tipo_contrato.getitemstring(1,'base')
ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
ll_folio_fin							= long(em_final.text)
ll_cod_parque						= dw_tipo_contrato.getitemnumber(1,'parque')
ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
	if ls_base<>'A' then
		if ll_cod_parque=103 and ls_serie='K' then
			SELECT	MAX("CD_FOLIO"."NUMERO")  
			INTO 		:ll_max_folio  
			FROM 	"CD_FOLIO"  
			WHERE 	"CD_FOLIO"."BASE" = :ls_base and
						"CD_FOLIO"."SERIE" = :ls_serie
			USING	sqlca;
		elseif ll_cod_parque=101 and ls_serie='I' then
			SELECT	MAX("CD_FOLIO"."NUMERO")  
			INTO 		:ll_max_folio  
			FROM 	"CD_FOLIO"  
			WHERE 	"CD_FOLIO"."BASE" = :ls_base and
						"CD_FOLIO"."SERIE" = :ls_serie
			USING	sqlca;	
		elseif ls_base='L' then
			SELECT	MAX("CD_FOLIO"."NUMERO")  
			INTO 		:ll_max_folio  
			FROM 	"CD_FOLIO"  
			WHERE 	"CD_FOLIO"."BASE" = :ls_base and
						"CD_FOLIO"."SERIE" = :ls_serie and
						"CD_FOLIO"."NUMERO" < 210000109
			USING	sqlca;		
		else
			SELECT	MAX("CD_FOLIO"."NUMERO")  
			INTO 		:ll_max_folio  
			FROM 	"CD_FOLIO"  
			WHERE 	"CD_FOLIO"."BASE" = :ls_base AND
						"CD_FOLIO"."SERIE" <> 'C'
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ll_folio_ini < (ll_max_folio + 1) then
				ll_res							= messagebox("Advertencia","Ultimo Folio Registrado es el: "+string(ll_max_folio)+", Desea Generar Folio Siguiente",Exclamation!,YesNo!,2)
				if ll_res=1 then
					ll_folio_ini				= ll_max_folio + 1
					em_inicial.text			= string(ll_folio_ini)
				//	em_final.setfocus()
				else
				//em_inicial.text			= string(ll_nulo)
				//	em_final.setfocus()
				end if
			end if
		end if
	else
		SELECT	MAX("CD_FOLIO"."NUMERO")  
		INTO 		:ll_max_folio  
		FROM 	"CD_FOLIO"  
		WHERE 	"CD_FOLIO"."BASE" = :ls_base and
					"CD_FOLIO"."SERIE" = :ls_serie and
					("CD_FOLIO"."COD_AGENTE" <> 'X' OR "CD_FOLIO"."COD_AGENTE" IS NULL)
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ll_folio_ini < (ll_max_folio + 1) then
				ll_res							= messagebox("Advertencia","Ultimo Folio Registrado es el: "+string(ll_max_folio)+", Desea Generar Folio Siguiente",Exclamation!,YesNo!,2)
				if ll_res=1 then
					ll_folio_ini				= ll_max_folio + 1
					em_inicial.text			= string(ll_folio_ini)
				//	em_final.setfocus()
				else
				//	em_inicial.text			= string(ll_nulo)
				//	em_final.setfocus()
				end if
			end if
		end if
	end if
end if
if cbx_entrega.checked=true then
	if not isnull(ls_base) and not isnull(ls_depto) and ll_folio_ini>0 and ll_folio_fin>0 and ll_cod_parque>0 then cb_procesar.triggerevent(clicked!)
else
	if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 and ll_cod_parque>0 then cb_procesar.triggerevent(clicked!)
end if
end event

type st_1 from statictext within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2039
integer y = 176
integer width = 151
integer height = 68
integer textsize = -8
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

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type dw_tipo_contrato from datawindow within w_cd_asignar_folio
event ue_mousemove pbm_dwnmousemove
integer x = 59
integer y = 104
integer width = 1906
integer height = 280
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_contrato_foliar_cd"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

event itemchanged;String		ls_columna,ls_base,ls_nulo,ls_serie,ls_descrip,ls_depto
Long		ll_folio_ini,ll_folio_fin,ll_cod_parque,ll_nulo,ll_max_folio

Setnull(ls_nulo);setnull(ll_nulo)
dw_tipo_contrato.accepttext()
ls_columna								= dwo.name
st_ult_folio.visible						= false
if ls_columna='parque' then
	dw_lista.reset()
	em_inicial.text						= string(ll_nulo)
	em_final.text						= string(ll_nulo)
	dw_tipo_contrato.setitem(1,'base',ls_nulo)
	dw_tipo_contrato.setitem(1,'serie',ls_nulo)
	dw_tipo_contrato.accepttext()
	idw_detalle4.retrieve()
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	if not isnull(ls_base) and ls_base<>'' then
		idw_detalle5.retrieve(ls_base,ll_cod_parque)
	end if
elseif ls_columna='base' then
	dw_lista.reset()
	em_inicial.text						= string(ll_nulo)
	em_final.text						= string(ll_nulo)
	dw_tipo_contrato.setitem(1,'serie',ls_nulo)
	dw_tipo_contrato.accepttext()
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	if not isnull(ls_base) and ls_base<>'' then
		idw_detalle5.retrieve(ls_base,ll_cod_parque)
	end if
elseif ls_columna='serie' then
	dw_lista.reset()
	em_inicial.text						= string(ll_nulo)
	em_final.text						= string(ll_nulo)
	ll_cod_parque						=  dw_tipo_contrato.getitemnumber(1,'parque')
	ls_base								= dw_tipo_contrato.getitemstring(1,'base')
	ls_serie								= dw_tipo_contrato.getitemstring(1,'serie')
	ls_depto								= dw_tipo_contrato.getitemstring(1,'depto')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
		if ls_base<>'A' then
			if ll_cod_parque=103 and ls_serie='K' then
				SELECT	MAX("CD_FOLIO"."NUMERO")  
				INTO 		:ll_max_folio  
				FROM 	"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base and
							"CD_FOLIO"."SERIE" = :ls_serie
				USING	sqlca;
			elseif ll_cod_parque=101 and ls_serie='I' then
				SELECT	MAX("CD_FOLIO"."NUMERO")  
				INTO 		:ll_max_folio  
				FROM 	"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base and
							"CD_FOLIO"."SERIE" = :ls_serie
				USING	sqlca;
			elseif ls_base='L' then
				SELECT	MAX("CD_FOLIO"."NUMERO")  
				INTO 		:ll_max_folio  
				FROM 	"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base and
							"CD_FOLIO"."SERIE" = :ls_serie and
							"CD_FOLIO"."NUMERO" < 210000109
				USING	sqlca;
			elseif (ls_base='G' or ls_base='F' or ls_base = 'V') then
				SELECT	MAX("CD_FOLIO"."NUMERO")  
				INTO 		:ll_max_folio  
				FROM 	"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base and
							"CD_FOLIO"."SERIE" = :ls_serie
				USING	sqlca;
			else
				SELECT	MAX("CD_FOLIO"."NUMERO")  
				INTO 		:ll_max_folio  
				FROM 	"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base AND
							"CD_FOLIO"."SERIE" <> 'C' and
							"CD_FOLIO"."SERIE" <> 'E'
				USING	sqlca;
			end if
			if sqlca.sqlcode=0 then
				if not isnull(ll_max_folio) and ll_max_folio>0 then
					ll_max_folio				= ll_max_folio
				else
					ll_max_folio				= 0
				end if
			else
				ll_max_folio					= 0
			end if
			st_ult_folio.visible				= true
			st_ult_folio.text					= 'Últ. Folio Generado '+string(ll_max_folio,'###,###,###,##0')
			dw_tipo_contrato.accepttext()
		else
			SELECT	MAX("CD_FOLIO"."NUMERO")  
			INTO 		:ll_max_folio  
			FROM 	"CD_FOLIO"  
			WHERE 	"CD_FOLIO"."BASE" = :ls_base and
						"CD_FOLIO"."SERIE" = 'A' and
						("CD_FOLIO"."COD_AGENTE" <> 'X' OR "CD_FOLIO"."COD_AGENTE" IS NULL)
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_max_folio) and ll_max_folio>0 then
					ll_max_folio				= ll_max_folio
				else
					ll_max_folio				= 0
				end if
			else
				ll_max_folio					= 0
			end if
			st_ult_folio.visible				= true
			st_ult_folio.text					= 'Últ. Folio Generado '+string(ll_max_folio,'###,###,###,##0')
			dw_tipo_contrato.accepttext()
		end if
	end if
end if
dw_tipo_contrato.accepttext()
ll_cod_parque							=  dw_tipo_contrato.getitemnumber(1,'parque')
ls_base									= dw_tipo_contrato.getitemstring(1,'base')
ll_folio_ini								= long(em_inicial.text)
ll_folio_fin								= long(em_final.text)
if cbx_entrega.checked=true then
	if not isnull(ls_base) and not isnull(ls_depto) and ll_folio_ini>0 and ll_folio_fin>0 and ll_cod_parque>0 then cb_procesar.triggerevent(clicked!)
else
	if not isnull(ls_base) and ll_folio_ini>0 and ll_folio_fin>0 and ll_cod_parque>0 then cb_procesar.triggerevent(clicked!)
end if
this.accepttext()
end event

event itemfocuschanged;String	ls_base,ls_depto,ls_nulo

Setnull(ls_nulo)
ls_base		= dw_tipo_contrato.getitemstring(1,'base')
ls_depto		= dw_tipo_contrato.getitemstring(1,'depto')
if not isnull(ls_base) and not isnull(ls_depto) then
	if ls_base='S' and ls_depto='T' then
		dw_tipo_contrato.setitem(1,'depto',ls_nulo)
		dw_tipo_contrato.accepttext()
		dw_tipo_contrato.setcolumn('depto')
	end if
end if
this.accepttext()
end event

type cb_cerrar from commandbutton within w_cd_asignar_folio
integer x = 3099
integer y = 1600
integer width = 315
integer height = 96
integer taborder = 140
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

type dw_lista from datawindow within w_cd_asignar_folio
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 556
integer width = 3374
integer height = 1000
integer taborder = 60
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

type gb_1 from groupbox within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 16
integer width = 1952
integer height = 404
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

type cbx_entrega from checkbox within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2053
integer y = 300
integer width = 878
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Entrega Form. [Solo Folios Nuevos]"
end type

event ue_mousemove;st_texto_entrega.visible			= true
if cbx_entrega.checked=true then
	//p_fecha.visible					= true
else
	//p_fecha.visible					= false
end if
end event

event clicked;String	ls_depto

if cbx_entrega.checked=true then
	dw_tipo_contrato.object.depto_t.visible	= true
	dw_tipo_contrato.object.depto.visible		= true
	cb_entragar_a.enabled						= true
	dw_tipo_contrato.getchild('depto',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve()=0 then
		idw_detalle2.insertrow(0)
	end if
else
	dw_tipo_contrato.object.depto_t.visible	= false
	dw_tipo_contrato.object.depto.visible		= false
	cb_entragar_a.enabled						= false
	setnull(gs_usuario_entregar)
	Setnull(ls_depto)
	dw_tipo_contrato.setitem(1,'depto',ls_depto)
end if
dw_tipo_contrato.accepttext()
dw_tipo_contrato.setfocus()
dw_tipo_contrato.setcolumn('depto')
end event

type gb_2 from groupbox within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
integer x = 2002
integer y = 16
integer width = 1422
integer height = 404
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

type p_fecha from picture within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2642
integer y = 428
integer width = 142
integer height = 120
boolean bringtotop = true
string picturename = "flec_atras.bmp"
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

type st_texto_entrega from statictext within w_cd_asignar_folio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1175
integer y = 452
integer width = 2258
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Entrega Formulario Inmediato al Depto.indicado, se actualizará solo los Estado Registro = ~"N - Nuevo~""
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;p_fecha.visible				= false
st_texto_entrega.visible	= false
end event

