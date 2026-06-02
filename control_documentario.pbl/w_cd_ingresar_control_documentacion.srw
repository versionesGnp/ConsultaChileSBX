forward
global type w_cd_ingresar_control_documentacion from window
end type
type cb_anular from commandbutton within w_cd_ingresar_control_documentacion
end type
type cb_aceptar from commandbutton within w_cd_ingresar_control_documentacion
end type
type cb_cancelar from commandbutton within w_cd_ingresar_control_documentacion
end type
type cbx_tipo_rechazo from checkbox within w_cd_ingresar_control_documentacion
end type
type cb_email from commandbutton within w_cd_ingresar_control_documentacion
end type
type cb_memo from commandbutton within w_cd_ingresar_control_documentacion
end type
type cb_cerrar from commandbutton within w_cd_ingresar_control_documentacion
end type
type cb_grabar from commandbutton within w_cd_ingresar_control_documentacion
end type
type st_2 from statictext within w_cd_ingresar_control_documentacion
end type
type st_1 from statictext within w_cd_ingresar_control_documentacion
end type
type p_flecha from picture within w_cd_ingresar_control_documentacion
end type
type dw_lista_rechazo from datawindow within w_cd_ingresar_control_documentacion
end type
type gb_3 from groupbox within w_cd_ingresar_control_documentacion
end type
type dw_nuevo from datawindow within w_cd_ingresar_control_documentacion
end type
type dw_actual from datawindow within w_cd_ingresar_control_documentacion
end type
end forward

global type w_cd_ingresar_control_documentacion from window
integer width = 2834
integer height = 2356
boolean titlebar = true
string title = "Ingreso Documentación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_anular cb_anular
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
cbx_tipo_rechazo cbx_tipo_rechazo
cb_email cb_email
cb_memo cb_memo
cb_cerrar cb_cerrar
cb_grabar cb_grabar
st_2 st_2
st_1 st_1
p_flecha p_flecha
dw_lista_rechazo dw_lista_rechazo
gb_3 gb_3
dw_nuevo dw_nuevo
dw_actual dw_actual
end type
global w_cd_ingresar_control_documentacion w_cd_ingresar_control_documentacion

type variables
String	is_base,is_serie
Long		il_tipo_opcion
Double	il_numero
end variables

forward prototypes
public subroutine wf_validar_supervisor (datetime ldt_fecha, long ll_estado, long ll_ult_estado)
end prototypes

public subroutine wf_validar_supervisor (datetime ldt_fecha, long ll_estado, long ll_ult_estado);Long		ll_new
String	ls_descrip

if ll_estado=33 and ll_ult_estado<>2 and ll_ult_estado<>35 and ll_ult_estado<>36 and ll_ult_estado<>12 then
	messagebox("Advertencia","No es posible Seleccionar esta Opción, debe estar en Estado 2-Asignado Contrato Agente, 35-Recepción Contrato por Supervisor de Adm.Ventas o 36-Rechazado Contrato por Supervisor")
	dw_nuevo.reset()
	ll_new						= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	dw_nuevo.Modify("gb_1.Height=952")
	dw_nuevo.Modify("glosa.Height=832")
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('estado')
elseif ll_estado=34 and ll_ult_estado<>2 then
	messagebox("Advertencia","No es posible Seleccionar esta Opción, debe estar en Estado 2-Asignado Contrato Agente")
	dw_nuevo.reset()
	ll_new						= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	dw_nuevo.Modify("gb_1.Height=952")
	dw_nuevo.Modify("glosa.Height=832")
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('estado')
elseif ll_estado=35 and ll_ult_estado<>33 and ll_ult_estado<>36 then
	messagebox("Advertencia","No es posible Seleccionar esta Opción, debe estar en Estado 33-Contrato Devuelto de Supervisor al Agente o 36-Contrato Rechazado por Supervisor")
	dw_nuevo.reset()
	ll_new						= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	dw_nuevo.Modify("gb_1.Height=952")
	dw_nuevo.Modify("glosa.Height=832")
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('estado')
elseif ll_estado=36 and ll_ult_estado<>33 and ll_ult_estado<>34 and ll_ult_estado<>35 then
	messagebox("Advertencia","No es posible Seleccionar esta Opción, debe estar en Estado 33-Contrato Devuelto de Supervisor al Agente, 34-Recepción Contrato por Supervisor de Adm. Ventas o 35-Recepción Contrato por Supervisor de Agente")
	dw_nuevo.reset()
	ll_new						= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	dw_nuevo.Modify("gb_1.Height=952")
	dw_nuevo.Modify("glosa.Height=832")
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('estado')
elseif ll_estado=37 and ll_ult_estado<>33 and ll_ult_estado<>34 and ll_ult_estado<>35 and ll_ult_estado<>36 then
	messagebox("Advertencia","No es posible Seleccionar esta Opción, debe estar en Estado 33-Contrato Devuelto de Supervisor al Agente, 34-Recepción Contrato por Supervisor de Adm. Ventas, 35-Recepción Contrato por Supervisor de Agente o 36-Rechazado Contrato por Supervisor")
	dw_nuevo.reset()
	ll_new						= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	dw_nuevo.Modify("gb_1.Height=952")
	dw_nuevo.Modify("glosa.Height=832")
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('estado')
else
	SELECT	"CD_ESTADO"."GLOSA"  
	INTO 		:ls_descrip  
	FROM 		"CD_ESTADO"  
	WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_descrip	= ls_descrip+' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
		dw_nuevo.setitem(1,'glosa',ls_descrip)
	end if	
end if
end subroutine

on w_cd_ingresar_control_documentacion.create
this.cb_anular=create cb_anular
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.cbx_tipo_rechazo=create cbx_tipo_rechazo
this.cb_email=create cb_email
this.cb_memo=create cb_memo
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.st_2=create st_2
this.st_1=create st_1
this.p_flecha=create p_flecha
this.dw_lista_rechazo=create dw_lista_rechazo
this.gb_3=create gb_3
this.dw_nuevo=create dw_nuevo
this.dw_actual=create dw_actual
this.Control[]={this.cb_anular,&
this.cb_aceptar,&
this.cb_cancelar,&
this.cbx_tipo_rechazo,&
this.cb_email,&
this.cb_memo,&
this.cb_cerrar,&
this.cb_grabar,&
this.st_2,&
this.st_1,&
this.p_flecha,&
this.dw_lista_rechazo,&
this.gb_3,&
this.dw_nuevo,&
this.dw_actual}
end on

on w_cd_ingresar_control_documentacion.destroy
destroy(this.cb_anular)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.cbx_tipo_rechazo)
destroy(this.cb_email)
destroy(this.cb_memo)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_flecha)
destroy(this.dw_lista_rechazo)
destroy(this.gb_3)
destroy(this.dw_nuevo)
destroy(this.dw_actual)
end on

event open;Long		ll_new,ll_estado_actual,ll_cod_parque
Datetime	ldt_fecha
String		ls_depto,ls_depto_aux

cb_email.enabled		= false
gf_centrar(w_cd_ingresar_control_documentacion)
SELECT	sysdate
INTO 		:ldt_fecha
FROM 		"TASA"  ;
if gs_depto='O' and gl_proceso=4 then
	SELECT	"DEPTO_CD_DOCTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if
gdt_fec_sistema				= ldt_fecha
is_base 							= trim(substr(1,1,Message.StringParm))
is_serie							= trim(substr(1,2,Message.StringParm))
il_numero						= Double(trim(substr(1,3,Message.StringParm)))
setnull(il_tipo_opcion)
cbx_tipo_rechazo.visible		= false
dw_lista_rechazo.settransobject(sqlca)
dw_lista_rechazo.retrieve()
dw_actual.settransobject(sqlca)
if gs_conexion="Parque El Prado" then
	if gs_depto='R' or gs_depto='X' then
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd_supervisor'
	else
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd'
	end if
elseif gs_conexion = "Parque La Foresta" then
	if gs_depto='R' or gs_depto='X' then
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd_serena'
	else
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd_serena_supervisor'
	end if
elseif gs_conexion = "Parque Concepción" then
	if gs_depto='R' or gs_depto='X' then
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd_serena'
	else
		dw_nuevo.dataobject	= 'dw_ingreso_detalle_cd_serena_supervisor'
	end if
end if
dw_nuevo.settransobject(sqlca)
dw_nuevo.getchild('estado',idw_detalle)
idw_detalle.settransobject(sqlca)
if gs_depto='P' then 
	cb_anular.visible	= true
else
	cb_anular.visible	= false
end if
if gs_conexion="Parque El Prado" then
	if gs_depto='X' then
		ls_depto_aux	= 'R'
	else
		ls_depto_aux	= gs_depto
	end if
	if idw_detalle.retrieve(ls_depto_aux)=0 then idw_detalle.insertrow(0)
elseif gs_conexion = "Parque La Foresta" then
	if gs_depto='X' then
		ls_depto_aux	= 'R'
	else
		ls_depto_aux	= gs_depto
	end if
	if gs_depto='O' or gs_depto='P' or gs_depto='E' then
		if gs_depto='O' then ls_depto='P'
		if gs_depto='P' then ls_depto='O'
		if gs_depto='E' then ls_depto='E'
		if idw_detalle.retrieve(ls_depto_aux,ls_depto)=0 then idw_detalle.insertrow(0)
	else
		if idw_detalle.retrieve(ls_depto_aux,gs_depto)=0 then idw_detalle.insertrow(0)
	end if
elseif gs_conexion = "Parque Concepción" then
	if gs_depto='X' then
		ls_depto_aux	= 'R'
	else
		ls_depto_aux	= gs_depto
	end if
	if gs_depto='O' or gs_depto='P' or gs_depto='E' then
		if gs_depto='O' then ls_depto='P'
		if gs_depto='P' then ls_depto='O'
		if gs_depto='E' then ls_depto='E'
		if idw_detalle.retrieve(ls_depto_aux,ls_depto)=0 then idw_detalle.insertrow(0)
	else
		if idw_detalle.retrieve(ls_depto_aux,gs_depto)=0 then idw_detalle.insertrow(0)
	end if
end if
if dw_actual.retrieve(is_base,is_serie,il_numero)=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_cd_ingresar_control_documentacion)
else
	ll_cod_parque	= dw_actual.getitemnumber(1,'cod_parque')
	ll_new			= dw_nuevo.insertrow(0)
	dw_nuevo.scrolltorow(ll_new)
	dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
	dw_nuevo.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
	dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
	dw_nuevo.setitem(ll_new,'base',is_base)
	dw_nuevo.setitem(ll_new,'serie',is_serie)
	dw_nuevo.setitem(ll_new,'numero',il_numero)
	dw_nuevo.setitem(ll_new,'memo','-')
	if ll_cod_parque > 0 then
		dw_nuevo.setitem(ll_new,'cod_parque',ll_cod_parque)
	end if
	if gs_conexion="Parque El Prado" then
		if gs_depto='X' then
			ls_depto_aux	= 'R'
		else
			ls_depto_aux	= gs_depto
		end if
		if idw_detalle.retrieve(ls_depto_aux)=0 then idw_detalle.insertrow(0)
	elseif gs_conexion = "Parque La Foresta" then
		if gs_depto='X' then
			ls_depto_aux	= 'R'
		else
			ls_depto_aux	= gs_depto
		end if
		if gs_depto='O' or gs_depto='P' or gs_depto='E' then
			if gs_depto='O' then ls_depto='P'
			if gs_depto='P' then ls_depto='O'
			if gs_depto='E' then ls_depto='E'
			if idw_detalle.retrieve(ls_depto_aux,ls_depto)=0 then idw_detalle.insertrow(0)
		else
			if idw_detalle.retrieve(ls_depto_aux,gs_depto)=0 then idw_detalle.insertrow(0)
		end if
	elseif gs_conexion = "Parque Concepción" then
		if gs_depto='X' then
			ls_depto_aux	= 'R'
		else
			ls_depto_aux	= gs_depto
		end if
		if gs_depto='O' or gs_depto='P' or gs_depto='E' then
			if gs_depto='O' then ls_depto='P'
			if gs_depto='P' then ls_depto='O'
			if gs_depto='E' then ls_depto='E'
			if idw_detalle.retrieve(ls_depto_aux,ls_depto)=0 then idw_detalle.insertrow(0)
		else
			if idw_detalle.retrieve(ls_depto_aux,gs_depto)=0 then idw_detalle.insertrow(0)
		end if
	end if
	dw_nuevo.accepttext()
	dw_nuevo.setfocus()
	ll_estado_actual	= dw_actual.getitemnumber(1,'ult_estado')
	if ll_estado_actual=11 then
		dw_nuevo.enabled	= false
		cb_grabar.enabled	= false
		cb_memo.enabled	= false
		cb_email.enabled	= false
	else
		dw_nuevo.enabled	= true
		cb_grabar.enabled	= true
		cb_memo.enabled	= true
		cb_email.enabled	= true
	end if
end if
end event

event close;if gs_depto='O' and gl_proceso=4 then
	SELECT	"DEPTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if
end event

type cb_anular from commandbutton within w_cd_ingresar_control_documentacion
integer x = 1783
integer y = 2132
integer width = 238
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Anular"
end type

event clicked;String	ls_glosa,ls_string
Long		ll_resp,ll_row

if il_numero>0 then
	ll_resp		= messagebox("Advertencia","Está Seguro de ANULAR Documento  "+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###"),Exclamation!,YesNo!,2)
	if ll_resp=1 then //100
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 		"TASA"  ;
		ls_glosa		= 'ANULAR DOCUMENTO Nº  '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")+' POR '+gs_user+': '+gs_nom_comp_usuario+' EL DIA: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'.'
		if isvalid(w_cd_gestion_folio)=true then
			ll_row	= w_cd_gestion_folio.dw_lista.getrow()
		elseif isvalid(w_documentos_pendientes) = true then
			ll_row	= w_documentos_pendientes.dw_lista.getrow()
		end if
		ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(gdt_fec_sistema)+'~t'+ls_glosa+'~t'+'100'+'~t'+string(ll_row)
		OPENWITHPARM(w_cd_anular_documento,ls_string)
	end if
end if

end event

type cb_aceptar from commandbutton within w_cd_ingresar_control_documentacion
boolean visible = false
integer x = 521
integer y = 1564
integer width = 283
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_lista_rechazo.visible = true then
	il_tipo_opcion					= dw_lista_rechazo.getitemnumber(dw_lista_rechazo.getrow(),'tipo_rechazo')
	cbx_tipo_rechazo.enabled	= true
end if
gb_3.visible						= false
cb_aceptar.visible				= false
cb_cancelar.visible				= false
dw_lista_rechazo.visible		= false
cb_grabar.enabled					= true
cb_cerrar.enabled					= true
dw_nuevo.enabled					= true
dw_actual.enabled					= true
cb_memo.enabled					= true
cb_email.enabled					= true


end event

type cb_cancelar from commandbutton within w_cd_ingresar_control_documentacion
boolean visible = false
integer x = 1952
integer y = 1564
integer width = 283
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ca&ncelar"
end type

event clicked;setnull(il_tipo_opcion)
if dw_lista_rechazo.visible= true then
	cbx_tipo_rechazo.enabled	= true
end if
gb_3.visible						= false
cb_aceptar.visible				= false
cb_cancelar.visible				= false
dw_lista_rechazo.visible		= false
cbx_tipo_rechazo.checked		= false
cb_grabar.enabled					= true
cb_cerrar.enabled					= true
dw_nuevo.enabled					= true
cb_memo.enabled					= true
cb_email.enabled					= true
dw_actual.enabled					= true
end event

type cbx_tipo_rechazo from checkbox within w_cd_ingresar_control_documentacion
integer x = 325
integer y = 2140
integer width = 672
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar Tipo de Rechazo"
end type

event clicked;String	ls_string,ls_memo
Long		ll_estado,ll_estado_anterior
Datetime	ldt_fecha_crea,ldt_fecha_estado
if not isnull(il_numero) and il_numero>0 and not isnull(is_base) and not isnull(is_serie) then
	ldt_fecha_crea								= dw_nuevo.getitemdatetime(1,'fecha_crea')
	ll_estado									= dw_nuevo.getitemnumber(1,'estado')
	ldt_fecha_estado							= dw_nuevo.getitemdatetime(1,'fecha_estado')
	ll_estado_anterior						= dw_actual.getitemnumber(1,'ult_estado')
	SELECT	"CD_FOLIO_DETALLE"."GLOSA"  
	INTO 		:ls_memo  
	FROM 		"CD_FOLIO_DETALLE"  
	WHERE	 ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
			 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
			 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = :ldt_fecha_crea ) AND  
			 ( "CD_FOLIO_DETALLE"."ESTADO" = :ll_estado ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_ESTADO" = :ldt_fecha_estado )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if isvalid(w_ingreso_detalle_rechazo) then close(w_ingreso_detalle_rechazo)
		if this.checked=true then
			ls_string							= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm:ss")+'~t'+'N'+'~t'+ls_memo+'~t'+string(ll_estado)
			openwithparm(w_ingreso_detalle_rechazo,ls_string)
		end if
	else
		messagebox("Advertencia","Antes de Ingresar Tipo de Rechazo, debe Grabar Ingreso Documentación")
		cbx_tipo_rechazo.checked			= false
		cb_grabar.setfocus()
	end if
else
	messagebox("Advertencia","Debe Grabar Ingreso Documentación")
	cbx_tipo_rechazo.checked				= false
	cb_grabar.setfocus()
end if
end event

type cb_email from commandbutton within w_cd_ingresar_control_documentacion
integer x = 1440
integer y = 2132
integer width = 315
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Enviar Email"
end type

event clicked;String	ls_string,ls_memo
Long		ll_estado
Datetime	ldt_fecha_crea,ldt_fecha_estado
String	ls_glosa,ls_asunto

if not isnull(il_numero) and il_numero>0 and not isnull(is_base) and not isnull(is_serie) then
	ldt_fecha_crea		= dw_nuevo.getitemdatetime(1,'fecha_crea')
	ll_estado			= dw_nuevo.getitemnumber(1,'estado')
	ldt_fecha_estado	= dw_nuevo.getitemdatetime(1,'fecha_estado')
	ls_glosa				= dw_nuevo.getitemstring(1,'glosa')
	SELECT	"CD_FOLIO_DETALLE"."MEMO"  
	INTO 		:ls_memo  
	FROM 		"CD_FOLIO_DETALLE"  
	WHERE	 ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
			 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
			 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = :ldt_fecha_crea ) AND  
			 ( "CD_FOLIO_DETALLE"."ESTADO" = :ll_estado ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_ESTADO" = :ldt_fecha_estado )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ll_estado) and not isnull(ls_glosa) then
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_asunto  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
			if sqlca.sqlcode=0 then
				ls_string	= ls_asunto+'~t'+ls_glosa+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)
				openwithparm(w_cd_enviar_email,ls_string)
			end if
		end if		
	else
		messagebox("Advertencia","Antes de Enviar Email, debe Grabar Ingreso Documentación")
		cb_grabar.setfocus()
	end if
else
	messagebox("Advertencia","Debe Grabar Ingreso Documentación")
	cb_grabar.setfocus()
end if
end event

type cb_memo from commandbutton within w_cd_ingresar_control_documentacion
integer x = 1038
integer y = 2132
integer width = 375
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ingresar &Memo"
end type

event clicked;String	ls_string,ls_memo
Long		ll_estado,ll_estado_anterior
Datetime	ldt_fecha_crea,ldt_fecha_estado
if not isnull(il_numero) and il_numero>0 and not isnull(is_base) and not isnull(is_serie) then
	ldt_fecha_crea			= dw_nuevo.getitemdatetime(1,'fecha_crea')
	ll_estado				= dw_nuevo.getitemnumber(1,'estado')
	ldt_fecha_estado		= dw_nuevo.getitemdatetime(1,'fecha_estado')
	ll_estado_anterior	= dw_actual.getitemnumber(1,'ult_estado')
	SELECT	"CD_FOLIO_DETALLE"."GLOSA"  
	INTO 		:ls_memo  
	FROM 		"CD_FOLIO_DETALLE"  
	WHERE	 ( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
			 ( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
			 ( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_CREA" = :ldt_fecha_crea ) AND  
			 ( "CD_FOLIO_DETALLE"."ESTADO" = :ll_estado ) AND  
			 ( "CD_FOLIO_DETALLE"."FECHA_ESTADO" = :ldt_fecha_estado )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_string			= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+trim(ls_memo)+'~t'+string(ll_estado)+'~t'+string(ldt_fecha_estado)+'~t'+string(ll_estado_anterior)
		openwithparm(w_cd_memorandum,ls_string)
	else
		messagebox("Advertencia","Antes de Ingresar Memorandum, debe Grabar Ingreso Documentación")
		cb_grabar.setfocus()
	end if
else
	messagebox("Advertencia","Debe Grabar Ingreso Documentación")
	cb_grabar.setfocus()
end if
end event

type cb_cerrar from commandbutton within w_cd_ingresar_control_documentacion
integer x = 2409
integer y = 2132
integer width = 311
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if gs_depto='O' and gl_proceso=4 then
	SELECT	"DEPTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if
close(w_cd_ingresar_control_documentacion)
end event

type cb_grabar from commandbutton within w_cd_ingresar_control_documentacion
integer x = 32
integer y = 2132
integer width = 238
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_usuario,ls_glosa,ls_memo,ls_age,ls_sup,ls_jefe,ls_age_actual,ls_sup_actual,&
			ls_jefe_actual,ls_cod_aux,ls_parametro,ls_obs
Datetime	ldt_fecha_estado
Long		ll_estado,ll_count_fila,ll_resp,ll_mes,ll_ano,ll_sw_pasa=0,ll_cod_parque

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"  ;
dw_nuevo.accepttext()
if isnull(dw_nuevo.getitemstring(1,'glosa')) then
	messagebox("Advertencia","Debe ingresar Glosa")
	dw_nuevo.setfocus()
	dw_nuevo.setcolumn('glosa')
else
	ll_cod_parque					= dw_nuevo.getitemnumber(1,'cod_parque')
	ll_estado							= dw_nuevo.getitemnumber(1,'estado')
	if not isnull(ll_cod_parque) and ll_cod_parque>0 then
		if ll_estado=4 or ll_estado=23 then
			SELECT	COUNT("CD_FOLIO_DETALLE_RECHAZO"."BASE"  )
			INTO 		:ll_count_fila  
			FROM 	"CD_FOLIO_DETALLE_RECHAZO","CD_FOLIO_DETALLE"  
			WHERE	( "CD_FOLIO_DETALLE_RECHAZO"."BASE" = "CD_FOLIO_DETALLE"."BASE" ) and  
						( "CD_FOLIO_DETALLE_RECHAZO"."SERIE" = "CD_FOLIO_DETALLE"."SERIE" ) and  
						( "CD_FOLIO_DETALLE_RECHAZO"."NUMERO" = "CD_FOLIO_DETALLE"."NUMERO" ) and  
						(("CD_FOLIO_DETALLE_RECHAZO"."BASE" = :is_base ) AND  
						( "CD_FOLIO_DETALLE_RECHAZO"."SERIE" = :is_serie ) AND  
						( "CD_FOLIO_DETALLE_RECHAZO"."NUMERO" = :il_numero ) AND  
						( "CD_FOLIO_DETALLE_RECHAZO"."ESTADO" = 'P' ) AND  
						( "CD_FOLIO_DETALLE"."ESTADO" = 10 OR "CD_FOLIO_DETALLE"."ESTADO" = 27) )   
			USING	sqlca;
			if ll_count_fila>0 then
				ll_resp					= messagebox("Advertencia","No es Posible ACEPTAR Contrato Nº "+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,##0")+", por encontrar Documento(s) Rechazado(s) Pendiente, desea Ver Documentos",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					ls_parametro		= is_base+'~t'+is_serie+'~t'+string(il_numero)
					openwithparm(w_lista_documentos_rechazados_pendientes,ls_parametro)
				end if
				ll_sw_pasa ++
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('estado')
			end if
		end if
		if ll_estado=14 or ll_estado=15 or ll_estado=30 then
			ls_age						= trim(dw_nuevo.getitemstring(1,'cod_agente'))
			ls_sup						= trim(dw_nuevo.getitemstring(1,'cod_supervisor'))
			ls_jefe						= trim(dw_nuevo.getitemstring(1,'cod_jefe_venta'))
			if isnull(ls_age) or ls_age='' then
				messagebox("Advertencia","Debe Ingresar Codigo de Agente")
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_agente')
				ll_sw_pasa ++
			elseif isnull(ls_sup) or ls_sup='' then
				messagebox("Advertencia","Debe Ingresar Codigo de Supervisor")
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_supervisor')
				ll_sw_pasa ++
			elseif isnull(ls_jefe) or  ls_jefe='' then
				messagebox("Advertencia","Debe Ingresar Codigo de Jefe Venta")
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_jefe_venta')
				ll_sw_pasa ++
			elseif not isnull(ls_age) and ls_age<>'' then
				SELECT	"AGENTES"."COD_AGE"  
				INTO 		:ls_cod_aux  
				FROM 	"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_age   
				USING	sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","Agente Inexistente")
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('cod_agente')
					ll_sw_pasa ++
				end if
			elseif not isnull(ls_sup) and ls_sup<>'' then
				SELECT	"SUPERVISOR"."COD_SUP"  
				INTO 		:ls_cod_aux  
				FROM 	"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
				USING	sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","Supervisor Inexistente")
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('cod_supervisor')
					ll_sw_pasa ++
				end if
			elseif not isnull(ls_jefe) and ls_jefe<>'' then
				SELECT	"JEFE_VENTAS"."JEFE_VENTAS"  
				INTO 		:ls_cod_aux  
				FROM 	"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe   
				USING	sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","Jefe Venta Inexistente")
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('cod_jefe_venta')
					ll_sw_pasa ++
				end if
			end if
		else
			SELECT	"CD_FOLIO"."COD_AGENTE",	"CD_FOLIO"."COD_SUPERVISOR",	"CD_FOLIO"."COD_JEFE_VENTA"  
			INTO 		:ls_age_actual,				:ls_sup_actual,					:ls_jefe_actual
			FROM 	"CD_FOLIO"  
			WHERE	( "CD_FOLIO"."BASE" = :is_base ) AND  
						( "CD_FOLIO"."SERIE" = :is_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :il_numero )   
			USING	sqlca;
			if not isnull(ls_age_actual) and not isnull(ls_sup_actual) and not isnull(ls_jefe_actual) then
				dw_nuevo.setitem(1,'cod_agente',ls_age_actual)
				dw_nuevo.setitem(1,'cod_supervisor',ls_sup_actual)
				dw_nuevo.setitem(1,'cod_jefe_venta',ls_jefe_actual)
				dw_nuevo.accepttext()
			end if
		end if
		if ll_sw_pasa=0 then
			if cbx_tipo_rechazo.checked=true and not isnull(il_tipo_opcion) then
				dw_nuevo.setitem(1,'tipo_rechazo',il_tipo_opcion)
			end if
			if ll_estado=14 or ll_estado=15 or ll_estado=30 then
				ls_age_actual				= trim(dw_actual.getitemstring(1,'cod_agente'))
				ls_sup_actual				= trim(dw_actual.getitemstring(1,'cod_supervisor'))
				ls_jefe_actual				= trim(dw_actual.getitemstring(1,'cod_jefe_venta'))
				ls_glosa						= trim(dw_nuevo.getitemstring(1,'glosa'))
				if isnull(ls_glosa) or ls_glosa='' then
					if ls_age<>ls_age_actual then
						ls_glosa				= ls_glosa + ', SE MODIFICA AGENTE: '+ls_age_actual+' POR '+ls_age
					end if
					if ls_sup<>ls_sup_actual then
						ls_glosa				= ls_glosa + ', SE MODIFICA SUPERVISOR: '+ls_sup_actual+' POR '+ls_sup
					end if
					if ls_jefe<>ls_jefe_actual then
						ls_glosa				= ls_glosa + ', SE MODIFICA JEFE DE VENTA: '+ls_jefe_actual+' POR '+ls_jefe
					end if
					ls_glosa					= ls_glosa + ' REALIZADO POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL DIA: '+string(gdt_fec_sistema,"dd/mm/yyyy")
				end if
				dw_nuevo.setitem(1,'glosa',trim(ls_glosa))
				dw_nuevo.accepttext()
			end if
			if dw_nuevo.update()=1 then
				commit;
				if ll_estado=4 or ll_estado=16 or ll_estado=23 then
					if ll_estado=4 then
						ls_obs				= 'Aceptado por Depto. Administración Venta el día '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")+' por '+gs_nom_comp_usuario
					elseif ll_estado=16 then
						ls_obs				= 'Aceptado por Depto. Atención Cliente el día '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")+' por '+gs_nom_comp_usuario
					elseif ll_estado=23 then
						ls_obs				= 'Aceptado por Depto. Atención Terreno el día '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")+' por '+gs_nom_comp_usuario
					end if
					UPDATE	"REVISION_CONTRATOS"  
					SET 		"ESTADO_REVISION" = 'V',   
								"OBSERVACION" = :ls_obs
					WHERE	( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
								( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
								( "REVISION_CONTRATOS"."NUMERO" = :il_numero ) AND  
								( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'R' )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				ls_usuario							= dw_nuevo.getitemstring(1,'usuario_crea')
				ldt_fecha_estado					= dw_nuevo.getitemdatetime(1,'fecha_estado')
				ls_glosa								= dw_nuevo.getitemstring(1,'glosa')
				ls_memo								= dw_nuevo.getitemstring(1,'memo')
				if isvalid(w_cd_gestion_folio) then
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_usuario_gestion',ls_usuario)
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_estado',ll_estado)
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_fecha_estado',ldt_fecha_estado)
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_glosa_estado',ls_glosa)
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ult_memo',ls_memo)
					w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'cod_parque',ll_cod_parque)
					if ll_estado=14 or ll_estado=15 or ll_estado=30 then
						w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'cod_agente',ls_age)
						w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'cod_supervisor',ls_sup)
						w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'cod_jefe_venta',ls_jefe)
					elseif ll_estado=3 or ll_estado=22 then
						ll_mes						= dw_nuevo.getitemnumber(1,'mes_cierre')
						ll_ano							= dw_nuevo.getitemnumber(1,'ano_cierre')
						w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'mes_cierre',ll_mes)
						w_cd_gestion_folio.dw_lista.setitem(w_cd_gestion_folio.dw_lista.getrow(),'ano_cierre',ll_ano)
					end if
					w_cd_gestion_folio.dw_lista.accepttext()
					if w_cd_gestion_folio.dw_lista.update()=1 then
						commit;
						w_cd_ingresar_control_documentacion.setfocus()
						cb_email.enabled			= true
						cb_grabar.enabled			= false
						dw_nuevo.Modify("estado.protect = 1")
						MessageBox("Grabar", "Grabación Exitosa")
					else
						rollback;
						messagebox("Error","Error al Grabar SQL:  "+sqlca.sqlerrtext)
					end if
				elseif isvalid(w_documentos_pendientes) then
					w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_usuario_gestion',ls_usuario)
					w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_estado',ll_estado)
					w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_fecha_estado',ldt_fecha_estado)
					w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_glosa_estado',ls_glosa)
					w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ult_memo',ls_memo)
					if ll_estado=14 or ll_estado=15 or ll_estado=30 then
						w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'cod_agente',ls_age)
						w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'cod_supervisor',ls_sup)
						w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'cod_jefe_venta',ls_jefe)
					elseif ll_estado=3 or ll_estado=22 then
						ll_mes						= dw_nuevo.getitemnumber(1,'mes_cierre')
						ll_ano							= dw_nuevo.getitemnumber(1,'ano_cierre')
						w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'mes_cierre',ll_mes)
						w_documentos_pendientes.dw_lista.setitem(w_documentos_pendientes.dw_lista.getrow(),'ano_cierre',ll_ano)
					end if
					w_documentos_pendientes.dw_lista.accepttext()
					if w_documentos_pendientes.dw_lista.update()=1 then
						commit;
						w_cd_ingresar_control_documentacion.setfocus()
						cb_email.enabled			= true
						cb_grabar.enabled			= false
						dw_nuevo.Modify("estado.protect = 1")
						MessageBox("Grabar", "Grabación Exitosa")
					else
						rollback;
						messagebox("Error","Error al Grabar SQL:  "+sqlca.sqlerrtext)
					end if
				end if
			else
				rollback;
				messagebox("Error","Error al Grabar SQL:  "+sqlca.sqlerrtext)
			end if
		end if
	else
		if isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Debe Ingresar Codigo Parque")
			dw_nuevo.setfocus()
			dw_nuevo.setcolumn('cod_parque')
		end if
	end if
end if
end event

type st_2 from statictext within w_cd_ingresar_control_documentacion
integer x = 46
integer y = 892
integer width = 937
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Documentación"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cd_ingresar_control_documentacion
integer x = 41
integer y = 8
integer width = 640
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Situación Actual"
boolean focusrectangle = false
end type

type p_flecha from picture within w_cd_ingresar_control_documentacion
boolean visible = false
integer x = 27
integer y = 252
integer width = 265
integer height = 816
boolean bringtotop = true
string picturename = "flec_arriba.bmp"
boolean focusrectangle = false
end type

type dw_lista_rechazo from datawindow within w_cd_ingresar_control_documentacion
boolean visible = false
integer x = 521
integer y = 800
integer width = 1714
integer height = 692
integer taborder = 70
string dataobject = "dw_lista_de_rechazo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	cb_aceptar.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_3 from groupbox within w_cd_ingresar_control_documentacion
boolean visible = false
integer x = 416
integer y = 684
integer width = 1920
integer height = 1068
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Tipo de Rechazo"
end type

type dw_nuevo from datawindow within w_cd_ingresar_control_documentacion
integer x = 14
integer y = 956
integer width = 2738
integer height = 1144
integer taborder = 30
string dataobject = "dw_ingreso_detalle_cd_serena_supervisor"
boolean border = false
boolean livescroll = true
end type

event clicked;String	ls_columna,ls_fecha,ls_opcion
this.accepttext()
if row>0 then
	ls_columna	= dwo.name
	if ls_columna='p_1' then
		if not isnull(this.getitemnumber(1,'estado')) then
			ls_fecha		= string(date(this.getitemdatetime(1,'fecha_estado')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				this.setitem(1,'fecha_estado',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha	= trim(Message.StringParm)
				this.setitem(1,'fecha_estado',date(ls_fecha))
			END IF
			this.setcolumn('fecha_estado')
		end if

	elseif ls_columna='p_2' or ls_columna='p_3' or ls_columna='p_4' then
		CHOOSE CASE ls_columna
			CASE 'p_2'
				ls_opcion	= 'A'
			CASE 'p_3'
				ls_opcion	= 'S'
			CASE 'p_4'
				ls_opcion	= 'J'
		END CHOOSE
		openwithparm(w_lista_codigos,ls_opcion)
	end if
end if
end event

event itemchanged;String	ls_columna,ls_glosa,ls_age_actual,ls_sup_actual,ls_jefe_actual,&
			ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_jefe_aux,ls_estado,ls_descrip,&
			ls_nom,ls_ap_pat,ls_ap_mat,ls_nom_com_age,ls_nom_com_sup,ls_nom_com_jef,&
			ls_ult_glosa,ls_parametro,ls_agente,ls_inserta_fila	= 'S'
Long		ll_estado,ll_ult_estado,ll_new,ll_count_fila,ll_resp,ll_mes,ll_ano
Datetime	ldt_fecha,ldt_fecha_estado,ldt_max_fecha

this.accepttext()
ls_columna									= dwo.name
SELECT	sysdate
INTO 		:ldt_fecha
FROM 		"TASA"  ;
gdt_fec_sistema							= ldt_fecha
CHOOSE CASE ls_columna
	CASE 'estado'
		ls_agente							= dw_actual.getitemstring(1,'cod_agente')
		ll_estado								= dw_nuevo.getitemnumber(1,'estado')
		ll_ult_estado						= dw_actual.getitemnumber(1,'ult_estado')
		ls_ult_glosa							= dw_actual.getitemstring(1,'ult_glosa_estado')
		if (gs_depto='R' or gs_depto='X') and (isnull(ls_agente) or ls_agente='') then
			messagebox("Advertencia","Debe Asignar AGENTE al Contrato Indicado")
			dw_nuevo.reset()
			ll_new						= dw_nuevo.insertrow(0)
			dw_nuevo.scrolltorow(ll_new)
			dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
			dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
			dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
			dw_nuevo.setitem(ll_new,'base',is_base)
			dw_nuevo.setitem(ll_new,'serie',is_serie)
			dw_nuevo.setitem(ll_new,'numero',il_numero)
			dw_nuevo.setitem(ll_new,'memo','-')
			dw_nuevo.Modify("gb_1.Height=952")
			dw_nuevo.Modify("glosa.Height=832")
			dw_nuevo.accepttext()
			dw_nuevo.setfocus()
			dw_nuevo.setcolumn('estado')
		elseif ( gs_depto='R' or gs_depto='X' )then
			wf_validar_supervisor(ldt_fecha,ll_estado,ll_ult_estado)
		else
			if ll_estado=5 or ll_estado=10 or ll_estado=17 or ll_estado=24 or ll_estado=27 then
				cbx_tipo_rechazo.visible	= true
				if ll_estado=5 or ll_estado=24 then
					SELECT	"CD_FOLIO_DETALLE"."GLOSA"  
					INTO 		:ls_glosa  
					FROM 	"CD_FOLIO_DETALLE"  
					WHERE 	( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
							 	( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
							 	( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero ) AND  
							 	( "CD_FOLIO_DETALLE"."ESTADO" = 10 or "CD_FOLIO_DETALLE"."ESTADO" = 27) AND  
							 	( "CD_FOLIO_DETALLE"."FECHA_CREA" = (	SELECT	max("CD_FOLIO_DETALLE"."FECHA_CREA")  
																						FROM 	"CD_FOLIO_DETALLE"  
																				 		WHERE 	"CD_FOLIO_DETALLE"."ESTADO" = 10 or "CD_FOLIO_DETALLE"."ESTADO" = 27))   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_nuevo.setitem(1,'glosa',ls_glosa)
						dw_nuevo.accepttext()
					end if
				end if
			else
				cbx_tipo_rechazo.visible	= false
			end if
			if ll_estado=14 or ll_estado=15 or ll_estado=30 then
				dw_nuevo.Modify("gb_1.Height=648")
				dw_nuevo.Modify("glosa.Height=528")
			else
				dw_nuevo.Modify("gb_1.Height=952")
				dw_nuevo.Modify("glosa.Height=832")
			end if
			setnull(ls_descrip)
			dw_nuevo.setitem(1,'glosa',ls_descrip)
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_descrip  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado
			USING		sqlca;
			if ll_estado>=100 then
				SELECT	"CD_ESTADO"."GLOSA"  
				INTO 		:ls_descrip  
				FROM 		"CD_ESTADO"  
				WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_descrip						= ls_descrip+' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
					dw_nuevo.setitem(1,'glosa',ls_descrip)
				end if	
			else
				if (ll_ult_estado=19 and ll_estado<>14) or (ll_ult_estado=32 and ll_estado<>30) then
					if gs_depto='V' then
						messagebox("Advertencia","No es posible Seleccionar esta Opción por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip+", debe Asignar Agente")
					elseif gs_depto='E' then
						messagebox("Advertencia","No es posible Seleccionar esta Opción por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip+", debe Asignar Ejecutivo")
					end if
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_ult_estado=2 and ll_estado<>3 and ll_estado<>4 and ll_estado<>5 and ll_estado<>7 and ll_estado<>12 and ll_estado<>13 and ll_estado<>19 and ll_estado<>14 and &
						 ll_ult_estado=21 and ll_estado<>22 and ll_estado<>23 and ll_estado<>24 and ll_estado<>25 and ll_estado<>28 and ll_estado<>29 and ll_estado<>32 and ll_estado<>30 and &
						 ll_ult_estado=2 and ll_estado<>33 and ll_estado<>34 then
					messagebox("Advertencia","No es posible Seleccionar esta Opción por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip)
					dw_nuevo.reset()
					ll_new							= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_estado>5 and ll_ult_estado<4 and ll_estado<>14 and ll_estado<>15 and ll_estado<>19 and &
						 ll_estado>24 and ll_ult_estado<23 and ll_estado<>30 and ll_estado<>32 and &
						 ll_ult_estado=33 and ll_estado<>2 and ll_estado<>35 and ll_estado<>36 then
					messagebox("Advertencia","No es posible Seleccionar esta Opción por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip)
					dw_nuevo.reset()
					ll_new							= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_estado<>3 and ll_estado<>19 and ll_estado<>4 and ll_estado<>5 and ll_estado<>14 and ll_estado<100  and ll_ult_estado=2 and &
						 ll_estado<>22 and ll_estado<>32 and ll_estado<>23 and ll_estado<>24 and ll_estado<>30 and ll_estado<100  and ll_ult_estado=21 and &
						 ll_ult_estado=34 and ll_estado<>2 then
					messagebox("Advertencia","No es posible Seleccionar esta Opcion por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip)
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_estado<>13 and ll_estado<>4 and ll_estado<>5 and ll_estado<>14 and ll_ult_estado=12 and &
						 ll_estado<>29 and ll_estado<>23 and ll_estado<>24 and ll_estado<>30 and ll_ult_estado=28 and &
						 ll_ult_estado=35 and ll_estado<>33 and ll_estado<>36 then
					messagebox("Advertencia","No es posible Seleccionar esta Opcion por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip)
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado=8 and ll_ult_estado=16) or (ll_estado=18 and ll_ult_estado=4) or (ll_estado=10 and ll_ult_estado=16) or (ll_estado=17 and ll_ult_estado=4) or &
						 (ll_estado=25 and ll_ult_estado=4) or (ll_estado=25 and ll_ult_estado=8) or (ll_estado=27 and ll_ult_estado=16) or (ll_estado=27 and ll_ult_estado=4) then
						 
					if ll_estado=8 and ll_ult_estado=16  then messagebox("Advertencia","Para Recepcionar Contrato del Depto At.Clientes debe seleccionar Opción 18-Recepción Ctto.por Depto.Operaciones a Depto.At.Clientes")
					if ll_estado=18 and ll_ult_estado=4  then messagebox("Advertencia","Para Recepcionar Contrato del Depto At.Clientes debe seleccionar Opción 8-Recepción Ctto.por Depto.Operaciones a Depto.Adm.Ventas")
					if ll_estado=10 and ll_ult_estado=16 then messagebox("Advertencia","Para Rechazar Contrato del Depto At.Clientes debe seleccionar Opción 17-Rechazado Contrato por Depto.Operaciones a At.Clientes")
					if ll_estado=17 and ll_ult_estado=4  then messagebox("Advertencia","Para Rechazar Contrato del Depto At.Clientes debe seleccionar Opción 10-Rechazado Contrato por Depto.Operaciones a Adm.Ventas")
					
					if ll_estado=25 and ll_ult_estado=4  then messagebox("Advertencia","Para Recepcionar Contrato del Depto At.Terreno debe seleccionar Opción 26-Recepción Ctto.por Depto.Operaciones a Depto.At.Terreno")
					if ll_estado=25 and ll_ult_estado=8  then messagebox("Advertencia","Para Recepcionar Contrato del Depto At.Terreno debe seleccionar Opción 26-Recepción Ctto.por Depto.Operaciones a Depto.At.Terreno")
					if ll_estado=27 and ll_ult_estado=16 then messagebox("Advertencia","Para Rechazar Contrato del Depto At.Terreno debe seleccionar Opción 27-Rechazado Contrato por Depto.Operaciones a At.Terreno")
					if ll_estado=27 and ll_ult_estado=4  then messagebox("Advertencia","Para Rechazar Contrato del Depto At.Terreno debe seleccionar Opción 27-Rechazado Contrato por Depto.Operaciones a At.Terreno")
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_ult_estado=16 and (ll_estado<>17 and ll_estado<>9 and ll_estado<>15 and ll_estado<>18) or &
						 ll_ult_estado=17 and (ll_estado<>16 and ll_estado<>15 and ll_estado<>18) or &
						 ll_ult_estado=23 and (ll_estado<>24 and ll_estado<>9 and ll_estado<>15 and ll_estado<>26 and ll_estado<>27 and ll_estado<>29) or &
						 ll_ult_estado=24 and (ll_estado<>23 and ll_estado<>15 and ll_estado<>26) and &
						 ll_ult_estado=36 and (ll_estado<>33 and ll_estado<>34 and ll_estado<>35) then
					messagebox("Advertencia","No es posible Seleccionar esta Opción por encontrarse en Estado "+string(ll_ult_estado)+'-'+ls_descrip)
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado<>16 and ll_ult_estado=6) then
					messagebox("Advertencia","Debe Seleccionar Opción 16-Aceptado Ctto.por Depto.At.Cliente y Entregar a Opera.")
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado=23 and ll_ult_estado < 22) then
					messagebox("Advertencia","Recuerde Para 23-Aceptar Contrato y Entregar a Operaciones, por lo menos debe estar 22-Recepción Contrato de Ejecutivo por Atención Terreno")
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado=7 and ll_ult_estado<>10) or &
						 (ll_estado=25 and ll_ult_estado<>27) then
					if gs_depto='V' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar 10-Rechazado Contrato por Depto. Operaciones")
					elseif gs_depto='E' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar 27-Rechazado Contrato por Depto. Operaciones")
					end if
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado=7 and ll_ult_estado=10) or &
						 (ll_estado=25 and ll_ult_estado=27) then
					dw_nuevo.setitem(1,'glosa',ls_ult_glosa)
					dw_nuevo.accepttext()
				elseif (ll_estado=5 and ll_ult_estado=7) or &
						 (ll_estado=24 and ll_ult_estado=25) then
					dw_nuevo.setitem(1,'glosa',ls_ult_glosa)
					dw_nuevo.accepttext()
				elseif (ll_estado=13 and ll_ult_estado<>12) or &
						 (ll_estado=29 and ll_ult_estado<>28) then
					if gs_depto='V' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar 12-Entregado Contrato de Adm.Venta a Supervisor")
					elseif gs_depto='E' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar 28-Entregado Contrato de At.Terreno a Ejecutivo")
					end if
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_estado=9 and ll_ult_estado<>4 and ll_ult_estado<>8 and ll_ult_estado<>18 and ll_ult_estado<>23 and ll_ult_estado<>26 then
					messagebox("Advertencia","Para esta Opción el Contrato debe estar en Estado 4-Aceptado Contrato y Entregar a Operaciones, Estado 8-Recepción Ctto.por Depto.Operaciones a Depto.Adm.Vtas., Estado 18-Recepción Ctto.por Depto.Operaciones a Depto.At.Cliente o Estado 26-Recepción Ctto. por Depto.Operaciones a Depto. At.Terreno")
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif (ll_estado=8 and ll_ult_estado<>4) or &
						 (ll_estado=26 and ll_ult_estado<>23) then
					if gs_depto='V' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar en Estado 4-Aceptado Contrato y Entregar a Operaciones")
					elseif gs_depto='E' then
						messagebox("Advertencia","Para esta Opción el Contrato debe estar en Estado 23-Aceptado Contrato y Entregar a Operaciones")
					end if
					dw_nuevo.reset()
					ll_new						= dw_nuevo.insertrow(0)
					dw_nuevo.scrolltorow(ll_new)
					dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
					dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
					dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
					dw_nuevo.setitem(ll_new,'base',is_base)
					dw_nuevo.setitem(ll_new,'serie',is_serie)
					dw_nuevo.setitem(ll_new,'numero',il_numero)
					dw_nuevo.setitem(ll_new,'memo','-')
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					dw_nuevo.accepttext()
					dw_nuevo.setfocus()
					dw_nuevo.setcolumn('estado')
				elseif ll_estado=14 or ll_estado=15 or ll_estado=30 then
					dw_nuevo.Modify("gb_1.Height=648")
					dw_nuevo.Modify("glosa.Height=528")
					SELECT	"CD_ESTADO"."GLOSA"  
					INTO 		:ls_descrip  
					FROM 		"CD_ESTADO"  
					WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_descrip				= ls_descrip+ ' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
						dw_nuevo.setitem(1,'glosa',ls_descrip)
					end if
				else
					dw_nuevo.Modify("gb_1.Height=952")
					dw_nuevo.Modify("glosa.Height=832")
					if ll_estado=ll_ult_estado then
						p_flecha.visible				= true
						messagebox("Advertencia","Estado Seleccionado es Idem al Ultimo Estado Ingresado")
						p_flecha.visible				= false
						cbx_tipo_rechazo.visible	= false
						dw_nuevo.reset()
						ll_new							= dw_nuevo.insertrow(0)
						dw_nuevo.scrolltorow(ll_new)
						dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
						dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
						dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
						dw_nuevo.setitem(ll_new,'base',is_base)
						dw_nuevo.setitem(ll_new,'serie',is_serie)
						dw_nuevo.setitem(ll_new,'numero',il_numero)
						dw_nuevo.setitem(ll_new,'memo','-')
						dw_nuevo.Modify("gb_1.Height=952")
						dw_nuevo.Modify("glosa.Height=832")
						dw_nuevo.accepttext()
						dw_nuevo.setfocus()
						dw_nuevo.setcolumn('estado')
					else
						if ll_estado=11 and ll_ult_estado<>9 then
							messagebox("Advertencia","Para esta Opción el Contrato debe estar 9-Aceptado por Depto.Operaciones")
							dw_nuevo.reset()
							ll_new				= dw_nuevo.insertrow(0)
							dw_nuevo.scrolltorow(ll_new)
							dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
							dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
							dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
							dw_nuevo.setitem(ll_new,'base',is_base)
							dw_nuevo.setitem(ll_new,'serie',is_serie)
							dw_nuevo.setitem(ll_new,'numero',il_numero)
							dw_nuevo.setitem(ll_new,'memo','-')
							dw_nuevo.Modify("gb_1.Height=952")
							dw_nuevo.Modify("glosa.Height=832")
							dw_nuevo.accepttext()
							dw_nuevo.setfocus()
							dw_nuevo.setcolumn('estado')
						elseif (ll_estado=4 and ll_ult_estado<3 and ll_ult_estado>99) or (ll_estado=9 and ll_ult_estado<3 and ll_ult_estado>99) or &
								 (ll_estado=23 and ll_ult_estado<22 and ll_ult_estado>99) or (ll_estado=9 and ll_ult_estado<22 and ll_ult_estado>99) then
							messagebox("Advertencia","Para Aceptar Contrato, por lo menos debe estar Recepcionado por el Departamento")
							dw_nuevo.reset()
							ll_new				= dw_nuevo.insertrow(0)
							dw_nuevo.scrolltorow(ll_new)
							dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
							dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
							dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
							dw_nuevo.setitem(ll_new,'base',is_base)
							dw_nuevo.setitem(ll_new,'serie',is_serie)
							dw_nuevo.setitem(ll_new,'numero',il_numero)
							dw_nuevo.setitem(ll_new,'memo','-')
							dw_nuevo.Modify("gb_1.Height=952")
							dw_nuevo.Modify("glosa.Height=832")
							dw_nuevo.accepttext()
							dw_nuevo.setfocus()
							dw_nuevo.setcolumn('estado')
						elseif (ll_estado=12 and ll_ult_estado=5) or (ll_estado=28 and ll_ult_estado=24) then
							dw_nuevo.setitem(1,'glosa',ls_ult_glosa)
							dw_nuevo.accepttext()
						else
							if (ll_estado=4 and ll_ult_estado=3) or (ll_estado=23 and ll_ult_estado=22) then
								SELECT	COUNT("CD_FOLIO_DETALLE_RECHAZO"."BASE"  )
								INTO 		:ll_count_fila  
								FROM 		"CD_FOLIO_DETALLE_RECHAZO",   
											"CD_FOLIO_DETALLE"  
								WHERE  ( "CD_FOLIO_DETALLE_RECHAZO"."BASE" = "CD_FOLIO_DETALLE"."BASE" ) and  
										 ( "CD_FOLIO_DETALLE_RECHAZO"."SERIE" = "CD_FOLIO_DETALLE"."SERIE" ) and  
										 ( "CD_FOLIO_DETALLE_RECHAZO"."NUMERO" = "CD_FOLIO_DETALLE"."NUMERO" ) and  
										 (("CD_FOLIO_DETALLE_RECHAZO"."BASE" = :is_base ) AND  
										 ( "CD_FOLIO_DETALLE_RECHAZO"."SERIE" = :is_serie ) AND  
										 ( "CD_FOLIO_DETALLE_RECHAZO"."NUMERO" = :il_numero ) AND  
										 ( "CD_FOLIO_DETALLE_RECHAZO"."ESTADO" = 'P' ) AND  
										 (("CD_FOLIO_DETALLE"."ESTADO" = 10 OR "CD_FOLIO_DETALLE"."ESTADO" = 27)) )   
								USING		sqlca;
								if ll_count_fila>0 then
									ls_inserta_fila	= 'N'
									ll_resp	= messagebox("Advertencia","No es Posible ACEPTAR Contrato Nº "+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,##0")+", por encontrar Documento(s) Rechazado(s) Pendiente, desea Ver Documentos",Exclamation!,YesNo!,2)
									if ll_resp=1 then
										ls_parametro	= is_base+'~t'+is_serie+'~t'+string(il_numero)
										openwithparm(w_lista_documentos_rechazados_pendientes,ls_parametro)
									end if
									dw_nuevo.reset()
									ll_new						= dw_nuevo.insertrow(0)
									dw_nuevo.scrolltorow(ll_new)
									dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
									dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
									dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
									dw_nuevo.setitem(ll_new,'base',is_base)
									dw_nuevo.setitem(ll_new,'serie',is_serie)
									dw_nuevo.setitem(ll_new,'numero',il_numero)
									dw_nuevo.setitem(ll_new,'memo','-')
									dw_nuevo.Modify("gb_1.Height=952")
									dw_nuevo.Modify("glosa.Height=832")
									dw_nuevo.accepttext()
									dw_nuevo.setfocus()
									dw_nuevo.setcolumn('estado')
								end if
							else //debe estar en recepcion
								if ll_estado=3 or ll_estado=22 then
									SELECT	MAX("CIERRE_VENTA"."CIERRE_VENTA")
									INTO 		:ldt_max_fecha  
									FROM 		"CIERRE_VENTA"  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										ll_mes	= month(date(ldt_max_fecha))
										ll_ano	= year(date(ldt_max_fecha))
										ll_mes ++
										if ll_mes>12 then
											ll_ano ++
										end if
										dw_nuevo.setitem(1,'mes_cierre',ll_mes)
										dw_nuevo.setitem(1,'ano_cierre',ll_ano)
									end if
								elseif (ll_estado=4 and ll_ult_estado<>3) or (ll_estado=23 and ll_ult_estado<>22 and ll_ult_estado<>29) then
									if gs_depto='V' then
										messagebox("Advertencia","Recuerde para ACEPTAR CONTRATO Y ENTREGAR A OPERACIONES, debe estar en Estado 3-RECEPCION CONTRATO DE AGENTE POR ADMIN.VENTAS")
									elseif gs_depto='E' then
										messagebox("Advertencia","Recuerde para ACEPTAR CONTRATO Y ENTREGAR A OPERACIONES, debe estar en Estado 22-RECEPCION CONTRATO DE EJECUTIVO POR ATENCION TERRENO")
									end if
									dw_nuevo.reset()
									ll_new						= dw_nuevo.insertrow(0)
									dw_nuevo.scrolltorow(ll_new)
									dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
									dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
									dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
									dw_nuevo.setitem(ll_new,'base',is_base)
									dw_nuevo.setitem(ll_new,'serie',is_serie)
									dw_nuevo.setitem(ll_new,'numero',il_numero)
									dw_nuevo.setitem(ll_new,'memo','-')
									dw_nuevo.Modify("gb_1.Height=952")
									dw_nuevo.Modify("glosa.Height=832")
									dw_nuevo.accepttext()
									dw_nuevo.setfocus()
									dw_nuevo.setcolumn('estado')
								end if
							end if
							
							if ls_inserta_fila='S' then
								SELECT	"CD_ESTADO"."GLOSA"  
								INTO 		:ls_descrip  
								FROM 		"CD_ESTADO"  
								WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_descrip	= ls_descrip+' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
									dw_nuevo.setitem(1,'glosa',ls_descrip)
								end if	
							end if
						end if
					end if
				end if
			end if
		end if
		
	CASE 'cod_agente'
		ls_age_actual		= trim(dw_actual.getitemstring(1,'cod_agente'))
		ls_sup_actual		= trim(dw_actual.getitemstring(1,'cod_supervisor'))
		ls_jefe_actual		= trim(dw_actual.getitemstring(1,'cod_jefe_venta'))
		ls_cod_age			= trim(dw_nuevo.getitemstring(1,'cod_agente'))
		ll_estado			= dw_nuevo.getitemnumber(1,'estado')
		ldt_fecha_estado	= dw_nuevo.getitemdatetime(1,'fecha_estado')
		ls_glosa				= trim(dw_nuevo.getitemstring(1,'glosa'))
		if (ls_cod_age<>ls_age_actual and not isnull(ls_cod_age) and ls_cod_age<>'') or (isnull(ls_age_actual) or ls_age_actual='') then
			ls_glosa		= trim(dw_nuevo.getitemstring(1,'glosa'))
			SELECT	"AGENTES"."ESTADO",
						"SUPERVISOR"."COD_SUP",   
						"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_estado,
						:ls_cod_sup,   
						:ls_cod_jefe  
			FROM 		"AGENTES",   
						"SUPERVISOR"  
			WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
					 (("AGENTES"."COD_AGE" = :ls_cod_age ) )   
			USING		sqlca;
			if sqlca.sqlcode<>0 or ls_estado='I' then
				if sqlca.sqlcode<>0 then 
					messagebox("Advertencia","Agente Inexistente")
				else
					if ls_estado='I' then
						messagebox("Advertencia","Agente Inactivo")
					end if
				end if
				dw_nuevo.reset()
				ll_new						= dw_nuevo.insertrow(0)
				dw_nuevo.scrolltorow(ll_new)
				dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
				dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
				dw_nuevo.setitem(ll_new,'base',is_base)
				dw_nuevo.setitem(ll_new,'serie',is_serie)
				dw_nuevo.setitem(ll_new,'numero',il_numero)
				dw_nuevo.setitem(ll_new,'memo','-')
				dw_nuevo.Modify("gb_1.Height=648")
				dw_nuevo.Modify("glosa.Height=528")
				dw_nuevo.setitem(ll_new,'estado',ll_estado)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
				SELECT	"CD_ESTADO"."GLOSA"  
				INTO 		:ls_descrip  
				FROM 		"CD_ESTADO"  
				WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_glosa = ls_descrip + ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(ll_new,'glosa',ls_glosa)
				dw_nuevo.accepttext()
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_agente')
			elseif sqlca.sqlcode=0 then
				if ls_estado='A' then
					dw_nuevo.setitem(1,'cod_supervisor',ls_cod_sup)
					dw_nuevo.setitem(1,'cod_jefe_venta',ls_cod_jefe)	
					if ll_estado=14 or ll_estado=15 or ll_estado=30 then
						//Nombre Agente
						SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
						INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
						FROM 		"AGENTES"  
						WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						//Nombre Supervisor
						SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
						INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
						FROM 		"SUPERVISOR"  
						WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						//Nombre Jefe
						SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
						INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
						FROM 		"JEFE_VENTAS"  
						WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						SELECT	"CD_ESTADO"."GLOSA"  
						INTO 		:ls_descrip  
						FROM 		"CD_ESTADO"  
						WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
							if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
							if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
							ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
							dw_nuevo.setitem(1,'glosa',ls_descrip)
						end if
					end if
				end if
				this.accepttext()
			end if
		else //iguales
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_descrip  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
			USING		sqlca;
			if sqlca.sqlcode=0 then
				//Nombre Agente
				SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
				INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
				FROM 		"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Supervisor
				SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
				INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Jefe
				SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
				INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				
				if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
				if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
				if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
				ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(1,'glosa',ls_descrip)
			end if	
		end if

	CASE 'cod_supervisor'
		ls_age_actual		= trim(dw_actual.getitemstring(1,'cod_agente'))
		ls_sup_actual		= trim(dw_actual.getitemstring(1,'cod_supervisor'))
		ls_jefe_actual		= trim(dw_actual.getitemstring(1,'cod_jefe_venta'))
		ls_cod_age			= trim(dw_nuevo.getitemstring(1,'cod_agente'))
		ls_cod_sup			= trim(dw_nuevo.getitemstring(1,'cod_supervisor'))
		ls_cod_jefe			= trim(dw_nuevo.getitemstring(1,'cod_jefe_venta'))
		ll_estado			= dw_nuevo.getitemnumber(1,'estado')
		ldt_fecha_estado	= dw_nuevo.getitemdatetime(1,'fecha_estado')
		ls_glosa				= trim(dw_nuevo.getitemstring(1,'glosa'))
		if ls_sup_actual<>ls_cod_sup then
			SELECT	"SUPERVISOR"."ESTADO",
						"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_estado,
						:ls_cod_jefe  
			FROM 		"SUPERVISOR"  
			WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
			USING		sqlca;
			if sqlca.sqlcode<>0 or ls_estado='I' then
				if ls_estado='I' then
					messagebox("Advertencia","Supervisor Inactivo")
				else
					if sqlca.sqlcode<>0 then
						messagebox("Advertencia","Supervisor Inexistente")
					end if
				end if
				dw_nuevo.reset()
				ll_new				= dw_nuevo.insertrow(0)
				dw_nuevo.scrolltorow(ll_new)
				dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
				dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
				dw_nuevo.setitem(ll_new,'base',is_base)
				dw_nuevo.setitem(ll_new,'serie',is_serie)
				dw_nuevo.setitem(ll_new,'numero',il_numero)
				dw_nuevo.setitem(ll_new,'memo','-')
				dw_nuevo.Modify("gb_1.Height=648")
				dw_nuevo.Modify("glosa.Height=528")
				dw_nuevo.setitem(ll_new,'estado',ll_estado)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
				SELECT	"CD_ESTADO"."GLOSA"  
				INTO 		:ls_descrip  
				FROM 		"CD_ESTADO"  
				WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_glosa = ls_descrip + ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(ll_new,'glosa',ls_glosa)
				dw_nuevo.setitem(ll_new,'cod_agente',ls_cod_age)
				dw_nuevo.setitem(ll_new,'cod_jefe_venta',ls_cod_jefe)
				dw_nuevo.accepttext()
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_supervisor')
			elseif sqlca.sqlcode=0 then
				if ls_estado='A' then
					dw_nuevo.setitem(1,'cod_jefe_venta',ls_cod_jefe)
					if ll_estado=14 or ll_estado=15 or ll_estado=30 then
						SELECT	"CD_ESTADO"."GLOSA"  
						INTO 		:ls_descrip  
						FROM 		"CD_ESTADO"  
						WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
						USING		sqlca;
						if sqlca.sqlcode=0 then
							//Nombre Agente
							SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
							INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
							FROM 		"AGENTES"  
							WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
							USING		sqlca;
							if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
							//Nombre Supervisor
							SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
							INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
							FROM 		"SUPERVISOR"  
							WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
							USING		sqlca;
							if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
							//Nombre Jefe
							SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
							INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
							FROM 		"JEFE_VENTAS"  
							WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
							USING		sqlca;
							if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
							
							if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
							if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
							if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
							ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
							dw_nuevo.setitem(1,'glosa',ls_descrip)
						end if
					end if
				else
				end if
			end if
		else
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_descrip  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
			USING		sqlca;
			if sqlca.sqlcode=0 then
				//Nombre Agente
				SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
				INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
				FROM 		"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Supervisor
				SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
				INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Jefe
				SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
				INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
				if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
				if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
				ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(1,'glosa',ls_descrip)
			end if
		end if

	CASE 'cod_jefe_venta'
		ls_age_actual		= trim(dw_actual.getitemstring(1,'cod_agente'))
		ls_sup_actual		= trim(dw_actual.getitemstring(1,'cod_supervisor'))
		ls_jefe_actual		= trim(dw_actual.getitemstring(1,'cod_jefe_venta'))
		ls_cod_age			= trim(dw_nuevo.getitemstring(1,'cod_agente'))
		ls_cod_sup			= trim(dw_nuevo.getitemstring(1,'cod_supervisor'))
		ls_cod_jefe			= trim(dw_nuevo.getitemstring(1,'cod_jefe_venta'))
		ll_estado			= dw_nuevo.getitemnumber(1,'estado')
		ldt_fecha_estado	= dw_nuevo.getitemdatetime(1,'fecha_estado')
		ls_glosa				= trim(dw_nuevo.getitemstring(1,'glosa'))
		if ls_jefe_actual<>ls_cod_jefe then
			SELECT	"JEFE_VENTAS"."ESTADO",
						"JEFE_VENTAS"."JEFE_VENTAS"  
			INTO 		:ls_estado,
						:ls_jefe_aux  
			FROM 		"JEFE_VENTAS"  
			WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe   
			USING		sqlca;
			if sqlca.sqlcode<>0 or ls_estado='I' then
				if sqlca.sqlcode<>0 then 
					messagebox("Advertencia","Jefe de Venta Inexistente")
				else
					if ls_estado='I' then
						messagebox("Advertencia","Jefe de Venta Inactivo")
					end if
				end if
				dw_nuevo.reset()
				ll_new				= dw_nuevo.insertrow(0)
				dw_nuevo.scrolltorow(ll_new)
				dw_nuevo.setitem(ll_new,'usuario_crea',gs_user)
				dw_nuevo.setitem(ll_new,'fecha_crea',ldt_fecha)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha)
				dw_nuevo.setitem(ll_new,'base',is_base)
				dw_nuevo.setitem(ll_new,'serie',is_serie)
				dw_nuevo.setitem(ll_new,'numero',il_numero)
				dw_nuevo.setitem(ll_new,'memo','-')
				dw_nuevo.Modify("gb_1.Height=648")
				dw_nuevo.Modify("glosa.Height=528")
				dw_nuevo.setitem(ll_new,'estado',ll_estado)
				dw_nuevo.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
				SELECT	"CD_ESTADO"."GLOSA"  
				INTO 		:ls_descrip  
				FROM 		"CD_ESTADO"  
				WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_glosa = ls_descrip + ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(ll_new,'glosa',ls_glosa)
				dw_nuevo.setitem(ll_new,'cod_agente',ls_cod_age)
				dw_nuevo.setitem(ll_new,'cod_supervisor',ls_cod_sup)
				dw_nuevo.accepttext()
				dw_nuevo.setfocus()
				dw_nuevo.setcolumn('cod_jefe_venta')
			else
				if ll_estado=14 or ll_estado=15 or ll_estado=30 then
					SELECT	"CD_ESTADO"."GLOSA"  
					INTO 		:ls_descrip  
					FROM 		"CD_ESTADO"  
					WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
					USING		sqlca;
					if sqlca.sqlcode=0 then
						//Nombre Agente
						SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
						INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
						FROM 		"AGENTES"  
						WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						//Nombre Supervisor
						SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
						INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
						FROM 		"SUPERVISOR"  
						WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						//Nombre Jefe
						SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
						INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
						FROM 		"JEFE_VENTAS"  
						WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
						USING		sqlca;
						if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
						
						if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
						if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
						if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
						ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
						dw_nuevo.setitem(1,'glosa',ls_descrip)
					end if
				end if
			end if
		else
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_descrip  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
			USING		sqlca;
			if sqlca.sqlcode=0 then
				//Nombre Agente
				SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
				INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
				FROM 		"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Supervisor
				SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
				INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_sup   
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				//Nombre Jefe
				SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
				INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe 
				USING		sqlca;
				if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				
				if ls_age_actual<>ls_cod_age then ls_descrip	= ls_descrip + ' '+ls_age_actual +' POR '+ ls_cod_age+'  '+ls_nom_com_age
				if ls_sup_actual<>ls_cod_sup then ls_descrip	= ls_descrip + ' SUPERVISOR '+ls_sup_actual+' POR '+ ls_cod_sup+'  '+ls_nom_com_sup
				if ls_jefe_actual<>ls_cod_jefe then ls_descrip	= ls_descrip + ' JEFE VENTA '+	ls_jefe_actual+ ' POR '+ls_cod_jefe+'  '+ls_nom_com_jef
				ls_descrip	= ls_descrip+ ', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")
				dw_nuevo.setitem(1,'glosa',ls_descrip)
			end if
		end if
END CHOOSE
this.accepttext()
end event

event getfocus;String	ls_age,ls_sup,ls_jefe,ls_estado

ls_age	= dw_actual.getitemstring(1,'cod_agente')
ls_sup	= dw_actual.getitemstring(1,'cod_supervisor')
ls_jefe	= dw_actual.getitemstring(1,'cod_jefe_venta')
SELECT	"AGENTES"."ESTADO",   
			"AGENTES"."COD_SUP"  
INTO 		:ls_estado,   
			:ls_sup  
FROM 		"AGENTES"  
WHERE 	"AGENTES"."COD_AGE" = :ls_age   ;

end event

type dw_actual from datawindow within w_cd_ingresar_control_documentacion
integer x = 14
integer y = 76
integer width = 2734
integer height = 824
integer taborder = 10
string dataobject = "dw_sitiuacion_actual_contrato"
boolean border = false
boolean livescroll = true
end type

