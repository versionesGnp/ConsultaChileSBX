forward
global type w_mantenedor_rechazo_seguro_desgravamen from window
end type
type dw_carta from datawindow within w_mantenedor_rechazo_seguro_desgravamen
end type
type cb_anular from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type cb_limpiar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type cb_buscar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type pb_ok from picturebutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type dw_ctto from datawindow within w_mantenedor_rechazo_seguro_desgravamen
end type
type cb_grabar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type cb_cerrar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
end type
type dw_seguro from datawindow within w_mantenedor_rechazo_seguro_desgravamen
end type
type gb_1 from groupbox within w_mantenedor_rechazo_seguro_desgravamen
end type
end forward

global type w_mantenedor_rechazo_seguro_desgravamen from window
integer width = 2610
integer height = 1440
boolean titlebar = true
string title = "Rechazo Seguro Desgravamen"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_carta dw_carta
cb_anular cb_anular
cb_limpiar cb_limpiar
cb_buscar cb_buscar
pb_ok pb_ok
dw_ctto dw_ctto
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_seguro dw_seguro
gb_1 gb_1
end type
global w_mantenedor_rechazo_seguro_desgravamen w_mantenedor_rechazo_seguro_desgravamen

type variables
Date	idt_fecha_hoy
end variables

on w_mantenedor_rechazo_seguro_desgravamen.create
this.dw_carta=create dw_carta
this.cb_anular=create cb_anular
this.cb_limpiar=create cb_limpiar
this.cb_buscar=create cb_buscar
this.pb_ok=create pb_ok
this.dw_ctto=create dw_ctto
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_seguro=create dw_seguro
this.gb_1=create gb_1
this.Control[]={this.dw_carta,&
this.cb_anular,&
this.cb_limpiar,&
this.cb_buscar,&
this.pb_ok,&
this.dw_ctto,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_seguro,&
this.gb_1}
end on

on w_mantenedor_rechazo_seguro_desgravamen.destroy
destroy(this.dw_carta)
destroy(this.cb_anular)
destroy(this.cb_limpiar)
destroy(this.cb_buscar)
destroy(this.pb_ok)
destroy(this.dw_ctto)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_seguro)
destroy(this.gb_1)
end on

event open;Long	ll_new
gf_centrar(w_mantenedor_rechazo_seguro_desgravamen)
idt_fecha_hoy		= date(gdt_fec_sistema)
dw_carta.settransobject(sqlca)
dw_ctto.settransobject(sqlca)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.retrieve('O')
end if
dw_ctto.insertrow(0)
dw_ctto.setitem(1,'base','O')
dw_seguro.settransobject(sqlca)
dw_seguro.getchild('codigo_compania',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve()
dw_seguro.getchild('contacto_compania',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)
ll_new	= dw_seguro.insertrow(0)
end event

type dw_carta from datawindow within w_mantenedor_rechazo_seguro_desgravamen
boolean visible = false
integer x = 1723
integer y = 1236
integer width = 411
integer height = 432
integer taborder = 80
string title = "none"
string dataobject = "dw_rechazo_compania_print_carta"
boolean livescroll = true
end type

type cb_anular from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
boolean visible = false
integer x = 992
integer y = 1184
integer width = 320
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Anular"
end type

event clicked;Long	ll_resp
if dw_seguro.getitemnumber(1,'rut_cliente')>0 then
	dw_seguro.setitem(1,'estado_reg','A')
	dw_seguro.setitem(1,'fecha_anulacion_reg',idt_fecha_hoy)
	dw_seguro.accepttext()
	ll_resp	= messagebox("Grabar Anulación","Quiere Anular Este Rechazo de Seguro Desgravamen",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		cb_grabar.triggerevent(clicked!)
//	else
//		cb_limpiar.triggerevent(clicked!)
	end if
end if
end event

type cb_limpiar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
integer x = 1349
integer y = 1184
integer width = 297
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long	ll_new
dw_ctto.reset()
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.retrieve('O')
end if
dw_ctto.insertrow(0)
dw_ctto.setitem(1,'base','O')
dw_seguro.reset()
dw_seguro.getchild('codigo_compania',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve()
dw_seguro.getchild('contacto_compania',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)
ll_new											= dw_seguro.insertrow(0)
dw_seguro.object.t_nombre_cliente.text	= ''
dw_seguro.object.t_estado_titular.text	= ''
end event

type cb_buscar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
integer x = 453
integer y = 1184
integer width = 448
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Rechazo"
end type

event clicked;open(w_buscar_rechazo_seguro)
end event

type pb_ok from picturebutton within w_mantenedor_rechazo_seguro_desgravamen
integer x = 2327
integer y = 88
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_base,ls_serie,ls_nom,ls_ap_pat,ls_ap_mat,ls_est_titular
Long		ll_count,ll_resp,ll_new,ll_rut,ll_max_sol,ll_estatus_opera,&
			ll_estatus_infor
double	ldb_numero
dw_ctto.accepttext()
ls_base								= dw_ctto.getitemstring(1,'base')
ls_serie								= dw_ctto.getitemstring(1,'serie')
ldb_numero							= dw_ctto.getitemnumber(1,'numero')
dw_seguro.enabled					= false
if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ldb_numero) then
	SELECT	MAX("SOL_ESTATUS"."CORRELATIVO")
	INTO 		:ll_max_sol
	FROM 		"SOL_ESTATUS"
	WHERE 	(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
				( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
				( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' OR "SOL_ESTATUS"."CODIGO_SOLICITUD" = '15') AND  
				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
	Using		sqlca;
	if ll_max_sol>0 then
		SELECT	"SOL_SEGURO_DESG"."ESTATUS_OPERACIONES",
					"SOL_SEGURO_DESG"."ESTATUS_INFORMATICA"
		INTO 		:ll_estatus_opera,
					:ll_estatus_infor
		FROM 		"SOL_ESTATUS",   
					"SOL_SEGURO_DESG"  
		WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
					( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
					( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
					( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
					( "SOL_SEGURO_DESG"."CORRELATIVO" = :ll_max_sol )  AND 
					(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
					( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
					( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
					( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' OR "SOL_ESTATUS"."CODIGO_SOLICITUD" = '15') AND  
					( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))
		Using		sqlca;
		if sqlca.sqlcode<>0 then
			SELECT	"SOL_SEGURO"."ESTATUS_OPERACIONES",
						"SOL_SEGURO"."ESTATUS_INFORMATICA"
			INTO 		:ll_estatus_opera,
						:ll_estatus_infor
			FROM 		"SOL_ESTATUS",   
						"SOL_SEGURO"  
			WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO"."BASE" ) and  
						( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO"."SERIE" ) and  
						( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO"."NUMERO" ) and  
						( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO"."CORRELATIVO" ) and  
						( "SOL_SEGURO"."CORRELATIVO" = :ll_max_sol )  AND 
						(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
						( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
						( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' OR "SOL_ESTATUS"."CODIGO_SOLICITUD" = '15') AND  
						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))
			Using		sqlca;
		end if
		if ll_estatus_opera=0 and ll_estatus_infor=0 then
			dw_seguro.reset()
			dw_seguro.getchild('codigo_compania',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			idw_detalle2.retrieve()
			dw_seguro.getchild('contacto_compania',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			idw_detalle3.insertrow(0)
			ll_new							= dw_seguro.insertrow(0)
			SELECT	Count("SEGURO_RECHAZOS"."NUMERO")  
			INTO 		:ll_count  
			FROM 		"SEGURO_RECHAZOS"  
			WHERE  ( "SEGURO_RECHAZOS"."BASE" = :ls_base ) AND  
					 ( "SEGURO_RECHAZOS"."SERIE" = :ls_serie ) AND  
					 ( "SEGURO_RECHAZOS"."NUMERO" = :ldb_numero )   
			USING		sqlca;
			if ll_count>0 then
				ll_resp						= messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ldb_numero,"###,###,###,###")+" registra "+string(ll_count,"###,###,###")+" Rechazo(s), desea Ingresar Otro",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT DISTINCT	"CADENA"."RUT"  
					INTO 		:ll_rut  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ldb_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_seguro.setitem(1,'rut_cliente',ll_rut)
						SELECT	"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO",   
									"CLIENTE"."ESTADO_TITULAR"
						INTO 		:ls_nom,   
									:ls_ap_pat,   
									:ls_ap_mat,   
									:ls_est_titular
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_seguro.object.t_nombre_cliente.text		= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
							if ls_est_titular='0' then
								dw_seguro.object.t_estado_titular.text	= '0 - Activo'
							elseif ls_est_titular='1' then
								dw_seguro.object.t_estado_titular.text	= '1 - Fallecido'
							end if
						end if
						dw_seguro.enabled										= true
						dw_seguro.setitem(1,'fecha_crea',gdt_fec_sistema)
						dw_seguro.setitem(1,'base',ls_base)
						dw_seguro.setitem(1,'serie',ls_serie)
						dw_seguro.setitem(1,'numero',ldb_numero)
						dw_seguro.setitem(1,'estado_reg','V')
						dw_seguro.setitem(1,'fecha_recepcion',gdt_fec_sistema)
						dw_seguro.accepttext()
						dw_seguro.setfocus()
						dw_seguro.setcolumn('codigo_compania')
					else
						messagebox("Advertencia","No Existe Contrato "+ls_base+'-'+ls_serie+'-'+string(ldb_numero,"###,###,###,###"))
						dw_ctto.setfocus()
					end if
				else
					dw_seguro.enabled											= false
				end if
			else
				SELECT DISTINCT	"CADENA"."RUT"  
				INTO 		:ll_rut  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ldb_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_seguro.setitem(1,'rut_cliente',ll_rut)
					SELECT	"CLIENTE"."NOMBRE",   
								"CLIENTE"."A_PATERNO",   
								"CLIENTE"."A_MATERNO",   
								"CLIENTE"."ESTADO_TITULAR"
					INTO 		:ls_nom,   
								:ls_ap_pat,   
								:ls_ap_mat,   
								:ls_est_titular
					FROM 		"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_seguro.object.t_nombre_cliente.text		= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						if ls_est_titular='0' then
							dw_seguro.object.t_estado_titular.text	= '0 - Activo'
						elseif ls_est_titular='1' then
							dw_seguro.object.t_estado_titular.text	= '1 - Fallecido'
						end if
					end if
					dw_seguro.enabled										= true
					dw_seguro.setitem(1,'fecha_crea',gdt_fec_sistema)
					dw_seguro.setitem(1,'base',ls_base)
					dw_seguro.setitem(1,'serie',ls_serie)
					dw_seguro.setitem(1,'numero',ldb_numero)
					dw_seguro.setitem(1,'estado_reg','V')
					dw_seguro.setitem(1,'fecha_recepcion',gdt_fec_sistema)
					dw_seguro.accepttext()
					dw_seguro.setfocus()
					dw_seguro.setcolumn('codigo_compania')
				else
					messagebox("Advertencia","No Existe Contrato "+ls_base+'-'+ls_serie+'-'+string(ldb_numero,"###,###,###,###"))
					dw_ctto.setfocus()
				end if
			end if
		else
			if ll_estatus_opera<>0 then
				messagebox("Advertencia","Solicitud No está Autorizada por Departamento Atención Cliente")
			elseif ll_estatus_infor<>0 then
				messagebox("Advertencia","Solicitud No está Autorizada por Departamento de Operaciones")
			end if
		end if
	else
		messagebox("Advertencia","No Registra Solicitud Seguro Desgravamen Asociada")
	end if
end if
end event

type dw_ctto from datawindow within w_mantenedor_rechazo_seguro_desgravamen
integer x = 78
integer y = 112
integer width = 2094
integer height = 120
integer taborder = 10
string title = "none"
string dataobject = "dwe_consultar_contrato_rechazo_seguro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_base,ls_serie
double	ldb_numero

ls_columna			= dwo.name
dw_ctto.accepttext()
ls_base				= dw_ctto.getitemstring(1,'base')
ls_serie				= dw_ctto.getitemstring(1,'serie')
ldb_numero			= dw_ctto.getitemnumber(1,'numero')
dw_seguro.enabled	= false
if ls_base='A' or ls_base='O' or ls_base='L' or ls_base='P' then
	IF ls_columna = "base" THEN
		if not isnull(ls_base) then
			dw_ctto.getchild('serie',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base)
		end if
	end if
else
	dw_ctto.getchild('serie',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.reset()
	idw_detalle.insertrow(0)
end if
if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ldb_numero) then 
	pb_ok.triggerevent(clicked!)
end if
end event

type cb_grabar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
integer x = 41
integer y = 1184
integer width = 320
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_base,ls_serie,ls_obs,ls_cod_carta,ls_nom_compania,ls_motivo,ls_fecha,&
			ls_fec_comp,ls_oficina_central,ls_oficina_parque
Datetime	ldt_fecha_recep
Long		ll_max_sol,ll_cod_compania,ll_nro_poliza,ll_dia_fec,ll_anno_fec,ll_mes_fec,&
			ll_cod_parque
double	ldb_numero
if dw_seguro.update()=1 then
	commit;
	ls_base		= dw_ctto.getitemstring(1,'base')
	ls_serie		= dw_ctto.getitemstring(1,'serie')
	ldb_numero	= dw_ctto.getitemnumber(1,'numero')
	UPDATE	"CADENA"  
	SET 		"ESTADO" = 'V'  
	WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
			 ( "CADENA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA"."NUMERO" = :ldb_numero ) AND
			 ( "CADENA"."ESTADO" = 'S')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		SELECT	MAX("SOL_SEGURO_DESG"."CORRELATIVO")
		INTO 		:ll_max_sol
		FROM 		"SOL_ESTATUS",   
					"SOL_SEGURO_DESG"  
		WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
					( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
					( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
					( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
					(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
					( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
					( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
					( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' ) AND  
					( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
		Using		sqlca;
		if ll_max_sol>0 then
			SELECT	"SOL_ESTATUS"."OBSERVACION"  
			INTO 		:ls_obs  
			FROM 		"SOL_ESTATUS"  
			WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
					 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
					 ( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
					 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_max_sol ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_cod_compania	= dw_seguro.getitemnumber(1,'codigo_compania')
				ll_nro_poliza		= dw_seguro.getitemnumber(1,'nro_poliza')
				ldt_fecha_recep	= dw_seguro.getitemdatetime(1,'fecha_recepcion')
				ls_cod_carta		= trim(dw_seguro.getitemstring(1,'codigo_carta'))
				ls_motivo			= trim(dw_seguro.getitemstring(1,'motivo_rechazo'))
				SELECT	"SEGURO_COMPANIA"."DESCRIPCION"  
				INTO 		:ls_nom_compania  
				FROM 		"SEGURO_COMPANIA"  
				WHERE 	"SEGURO_COMPANIA"."CODIGO" = :ll_cod_compania   
				USING		sqlca;
				if not isnull(ls_obs) then
					ls_obs			= ls_obs+', Seguro Desgravamen RECHAZADO por '+ls_nom_compania+' Motivo: '+ls_motivo+' Fecha Recepción: '+string(ldt_fecha_recep,"dd/mm/yyyy")+' Nº Poliza: '+string(ll_nro_poliza,"##############0")+' Codigo Carta: '+ls_cod_carta+' realizado por: '+gs_nom_comp_usuario+' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
				else
					ls_obs			= 'Seguro Desgravamen RECHAZADO por '+ls_nom_compania+' Motivo: '+ls_motivo+' Fecha Recepción: '+string(ldt_fecha_recep,"dd/mm/yyyy")+' Nº Poliza: '+string(ll_nro_poliza,"##############0")+' Codigo Carta: '+ls_cod_carta+' realizado por: '+gs_nom_comp_usuario+' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
				end if
				UPDATE	"SOL_ESTATUS"  
				SET 		"OBSERVACION" = :ls_obs  
				WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
						 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
						 ( "SOL_ESTATUS"."NUMERO" = :ldb_numero ) AND  
						 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_max_sol ) AND  
						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '4' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
		end if
		ls_fecha							= string(idt_fecha_hoy,"dd/mm/yyyy")
		CHOOSE CASE UPPER(DayName(date(ls_fecha)))
			CASE 'LUNES','MONDAY'
				ls_fec_comp				= 'Lunes'
			CASE 'MARTES','TUESDAY'
				ls_fec_comp				= 'Martes'
			CASE 'MIERCOLES','WEDNESDAY'
				ls_fec_comp				= 'Miércoles'
			CASE 'JUEVES','THURSDAY'
				ls_fec_comp				= 'Jueves'
			CASE 'VIERNES','FRIDAY'
				ls_fec_comp				= 'Viernes'
			CASE 'SABADO','SATURDAY'
				ls_fec_comp				= 'Sábado'
			CASE 'DOMINGO','SUNDAY'
				ls_fec_comp				= 'Domingo'
		END CHOOSE
		ll_dia_fec						= day(idt_fecha_hoy)
		ll_mes_fec						= month(idt_fecha_hoy)
		ll_anno_fec						= year(idt_fecha_hoy)
		if ll_mes_fec=1 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
		elseif ll_mes_fec=2 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
		elseif ll_mes_fec=3 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
		elseif ll_mes_fec=4 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
		elseif ll_mes_fec=5 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
		elseif ll_mes_fec=6 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
		elseif ll_mes_fec=7 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
		elseif ll_mes_fec=8 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
		elseif ll_mes_fec=9 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
		elseif ll_mes_fec=10 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
		elseif ll_mes_fec=11 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
		elseif ll_mes_fec=12 then
			ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
		end if
		if dw_carta.retrieve(ls_base,ls_serie,ldb_numero,ll_max_sol)>0 then
			dw_carta.object.t_fecha.text	= ls_fec_comp
			SELECT	"CADENA"."COD_PARQUE"  
			INTO 		:ll_cod_parque  
			FROM 		"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ll_cod_parque=1 then
					SELECT	"GESTION_CARTA_MEMBRETE"."CASA_MATRIZ",   
								"GESTION_CARTA_MEMBRETE"."SUCURSAL"  
					INTO 		:ls_oficina_central,   
								:ls_oficina_parque
					FROM 		"GESTION_CARTA_MEMBRETE"  
					WHERE 	"GESTION_CARTA_MEMBRETE"."CODIGO" = 'P'   ;
				elseif ll_cod_parque=102 then
					SELECT	"GESTION_CARTA_MEMBRETE"."CASA_MATRIZ",   
								"GESTION_CARTA_MEMBRETE"."SUCURSAL"  
					INTO 		:ls_oficina_central,   
								:ls_oficina_parque
					FROM 		"GESTION_CARTA_MEMBRETE"  
					WHERE 	"GESTION_CARTA_MEMBRETE"."CODIGO" = 'M'   ;
				elseif ll_cod_parque=11 then
					SELECT	"GESTION_CARTA_MEMBRETE"."CASA_MATRIZ",   
								"GESTION_CARTA_MEMBRETE"."SUCURSAL"  
					INTO 		:ls_oficina_central,   
								:ls_oficina_parque
					FROM 		"GESTION_CARTA_MEMBRETE"  
					WHERE 	"GESTION_CARTA_MEMBRETE"."CODIGO" = 'F'   ;
				elseif ll_cod_parque=801 then
					SELECT	"GESTION_CARTA_MEMBRETE"."CASA_MATRIZ",   
								"GESTION_CARTA_MEMBRETE"."SUCURSAL"  
					INTO 		:ls_oficina_central,   
								:ls_oficina_parque
					FROM 		"GESTION_CARTA_MEMBRETE"  
					WHERE 	"GESTION_CARTA_MEMBRETE"."CODIGO" = 'C'   ;
				end if
				if isnull(ls_oficina_central) or ls_oficina_central='' then
					dw_carta.Object.t_12.Visible 				= 0
					dw_carta.Object.t_of_central.Visible	= 0
				else
					dw_carta.Object.t_12.Visible 				= 1
					dw_carta.Object.t_of_central.Visible	= 1
					dw_carta.object.t_of_central.text		= ls_oficina_central+'   De Lunes a Viernes de 09:00 a 17:30 horas.'
				end if
				if isnull(ls_oficina_parque) or ls_oficina_parque='' then
					dw_carta.Object.t_6.Visible 				= 0
					dw_carta.Object.t_of_parque.Visible		= 0
				else
					dw_carta.Object.t_6.Visible 				= 1
					dw_carta.Object.t_of_parque.Visible		= 1
					dw_carta.object.t_of_parque.text			= ls_oficina_parque+'   De Lunes a Domingo de 09:00 a 17:30 horas.'
				end if
			end if
			f_Print( dw_carta )
//			f_printdlg(dw_carta,gstr_print,w_mantenedor_rechazo_seguro_desgravamen)
		end if
		messagebox("Grabar","Grabación Exitosa")
		cb_limpiar.triggerevent(clicked!)		
	else
		rollback;
		messagebox("Error al Grabar","Error al Grabar Rechazo Seguro Desgravamen SQL: "+sqlca.sqlerrtext)
	end if
else
	rollback;
	messagebox("Error al Grabar","Error al Grabar Rechazo Seguro Desgravamen SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_rechazo_seguro_desgravamen
integer x = 2217
integer y = 1184
integer width = 334
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_rechazo_seguro_desgravamen)
end event

type dw_seguro from datawindow within w_mantenedor_rechazo_seguro_desgravamen
integer x = 41
integer y = 296
integer width = 2551
integer height = 868
integer taborder = 30
string title = "none"
string dataobject = "dw_rechazo_compania_seguro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_nom,ls_ap_pat,ls_ap_mat,ls_est_titular,ls_dv
Long		ll_cod_compania,ll_rut

ls_columna	= dwo.name
dw_seguro.accepttext()
if ls_columna='rut_cliente' then
	ll_rut														= dw_seguro.getitemnumber(1,'rut_cliente')
	if ll_rut>0 then
		
	end if
elseif ls_columna = "codigo_compania" THEN
	ll_cod_compania											= dw_seguro.getitemnumber(1,'codigo_compania')
	if not isnull(ll_cod_compania) then
		dw_seguro.getchild('contacto_compania',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.retrieve(ll_cod_compania)
	end if
end if
end event

event clicked;String	ls_columna,ls_fecha,ls_estado_reg
Long		ll_rut
ls_columna		= dwo.name
ll_rut			= dw_seguro.getitemnumber(1,'rut_cliente')
ls_estado_reg	= dw_seguro.getitemstring(1,'estado_reg')
if ll_rut>0 and ls_estado_reg<>'A' then
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_fecha					= string(date(dw_seguro.getitemdatetime(1,'fecha_recepcion')))
			if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_seguro.setitem(1,'fecha_recepcion',datetime(string(idt_fecha_hoy,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_seguro.setitem(1,'fecha_recepcion',date(ls_fecha))
			END IF
			dw_seguro.setcolumn('fecha_recepcion')
	END CHOOSE
end if
end event

type gb_1 from groupbox within w_mantenedor_rechazo_seguro_desgravamen
integer x = 41
integer y = 20
integer width = 2510
integer height = 252
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Contrato Rechazado por Compañia de Seguro"
end type

