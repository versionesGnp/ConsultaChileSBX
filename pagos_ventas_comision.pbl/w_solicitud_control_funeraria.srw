forward
global type w_solicitud_control_funeraria from window
end type
type cb_email from commandbutton within w_solicitud_control_funeraria
end type
type cb_cerrar from commandbutton within w_solicitud_control_funeraria
end type
type cb_grabar from commandbutton within w_solicitud_control_funeraria
end type
type st_situacion_actual from statictext within w_solicitud_control_funeraria
end type
type dw_detalle_actual from datawindow within w_solicitud_control_funeraria
end type
type dw_nuevo_detalle from datawindow within w_solicitud_control_funeraria
end type
end forward

global type w_solicitud_control_funeraria from window
integer width = 3013
integer height = 1968
boolean titlebar = true
string title = "Ingreso Detalle"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_email cb_email
cb_cerrar cb_cerrar
cb_grabar cb_grabar
st_situacion_actual st_situacion_actual
dw_detalle_actual dw_detalle_actual
dw_nuevo_detalle dw_nuevo_detalle
end type
global w_solicitud_control_funeraria w_solicitud_control_funeraria

type variables
String	is_base,is_serie
Long		il_tipo_opcion
end variables

on w_solicitud_control_funeraria.create
this.cb_email=create cb_email
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.st_situacion_actual=create st_situacion_actual
this.dw_detalle_actual=create dw_detalle_actual
this.dw_nuevo_detalle=create dw_nuevo_detalle
this.Control[]={this.cb_email,&
this.cb_cerrar,&
this.cb_grabar,&
this.st_situacion_actual,&
this.dw_detalle_actual,&
this.dw_nuevo_detalle}
end on

on w_solicitud_control_funeraria.destroy
destroy(this.cb_email)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.st_situacion_actual)
destroy(this.dw_detalle_actual)
destroy(this.dw_nuevo_detalle)
end on

event open;string	ls_base,ls_serie,ls_base_funer,ls_serie_funer,ls_usuario_crea,ls_agente,ls_supervisor,ls_usuario,ls_depto
long		ll_tot_reg,ll_numero_funer,ll_cod_parque,ll_mes_cierre,ll_ano_cierre,ll_new,ll_cod_estado
datetime	ldt_fecha,ldt_fecha_crea,ldt_fecha_estado
double	ldb_numero

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_solicitud_control_funeraria)
ls_base		= substr(1,1,Message.StringParm)
ls_serie		= substr(1,2,Message.StringParm)
ldb_numero	= double(substr(1,3,Message.StringParm))
dw_detalle_actual.dataobject	= 'dw_sitiuacion_actual_funeraria'
dw_detalle_actual.settransobject(sqlca)
cb_email.enabled			= false
ll_tot_reg					= dw_detalle_actual.retrieve(ls_base,ls_serie,ldb_numero)
if ll_tot_reg>0 then
	ls_base_funer			= dw_detalle_actual.getitemstring(1,'funeraria_pago_comision_base')
	ls_serie_funer			= dw_detalle_actual.getitemstring(1,'funeraria_pago_comision_serie')
	ll_numero_funer		= dw_detalle_actual.getitemnumber(1,'funeraria_pago_comision_numero')
	ldt_fecha_crea			= dw_detalle_actual.getitemdatetime(1,'funeraria_folio_detalle_fecha_crea')
	ls_usuario_crea		= dw_detalle_actual.getitemstring(1,'funeraria_folio_detalle_usuario_crea')
	ldt_fecha_estado		= gdt_fec_sistema
	ls_agente				= dw_detalle_actual.getitemstring(1,'funeraria_pago_comision_cod_agente')
	ls_supervisor			= dw_detalle_actual.getitemstring(1,'funeraria_pago_comision_cod_supervisor')
	ll_cod_parque			= dw_detalle_actual.getitemnumber(1,'funeraria_folio_detalle_cod_parque')
	ll_mes_cierre			= dw_detalle_actual.getitemnumber(1,'funeraria_pago_comision_mes_cierre')
	ll_ano_cierre			= dw_detalle_actual.getitemnumber(1,'funeraria_pago_comision_ano_cierre')
	ls_usuario				= gs_user
	ll_new					= dw_nuevo_detalle.insertrow(0)
	dw_nuevo_detalle.scrolltorow(ll_new)
	dw_nuevo_detalle.setitem(ll_new,'base',ls_base_funer)
	dw_nuevo_detalle.setitem(ll_new,'serie',ls_serie_funer)
	dw_nuevo_detalle.setitem(ll_new,'numero',ll_numero_funer)
	dw_nuevo_detalle.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
	dw_nuevo_detalle.setitem(ll_new,'usuario_crea',ls_usuario_crea)
	dw_nuevo_detalle.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
	dw_nuevo_detalle.setitem(ll_new,'cod_agente',ls_agente)
	dw_nuevo_detalle.setitem(ll_new,'cod_supervisor',ls_supervisor)
	dw_nuevo_detalle.setitem(ll_new,'cod_parque',ll_cod_parque)
	dw_nuevo_detalle.setitem(ll_new,'mes_cierre',ll_mes_cierre)
	dw_nuevo_detalle.setitem(ll_new,'ano_cierre',ll_ano_cierre)
	dw_nuevo_detalle.setitem(ll_new,'usuario_gestor',ls_usuario)
	SELECT	"ENCARGADOS"."DEPTO"  
	INTO		:ls_depto  
	FROM		"ENCARGADOS"  
	WHERE		"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_nuevo_detalle.settransobject(sqlca)
		dw_nuevo_detalle.getchild('estado',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_depto)=0 then
			idw_detalle.insertrow(0)
		end if
	end if
	ll_cod_estado	= dw_detalle_actual.getitemnumber(1,'funeraria_folio_detalle_estado')
	if gs_depto = 'P' and (ll_cod_estado <> 1 and ll_cod_estado <> 2 and ll_cod_estado <> 3 and ll_cod_estado <> 6) then
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
		close(w_solicitud_control_funeraria)
	elseif gs_depto = 'X' and (ll_cod_estado <> 3 and ll_cod_estado <> 4 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 9 and ll_cod_estado <> 16 and ll_cod_estado <> 17 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20) then
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
		close(w_solicitud_control_funeraria)
	elseif gs_depto = 'O' and (ll_cod_estado <> 7 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 12) then
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
		close(w_solicitud_control_funeraria)
	elseif gs_depto = 'C' and (ll_cod_estado <> 10 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 15) then
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
		close(w_solicitud_control_funeraria)
	elseif gs_depto = 'T' and (ll_cod_estado <> 13 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 17 and ll_cod_estado <> 19) then
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
		close(w_solicitud_control_funeraria)
	else
		dw_nuevo_detalle.enabled	= true
	end if
else
	messagebox("Advertencia","No Puede Ingresar Gestión La Solicitud Pago Comisión No ha sido Creada")
	close(w_solicitud_control_funeraria)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_email from commandbutton within w_solicitud_control_funeraria
boolean visible = false
integer x = 1307
integer y = 1732
integer width = 357
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Enviar Email"
end type

event clicked;string	ls_base,ls_serie,ls_usuario_crea,ls_cod_agente,ls_cod_superv,ls_estado_modif,ls_nombre_usuario,ls_email_de,&
			ls_descripcion_email,ls_nombre_funeraria,ls_email_para,ls_glosa,ls_descrip,ls_glosa_email,ls_res,ls_origen
long		ll_estado,ll_cod_parque,ll_mes,ll_ano,ll_estado_email,ll_num_boleta,ll_num_cheque 
datetime	ldt_fecha_crea,ldt_fecha_estado
double	ldb_numero

dw_nuevo_detalle.accepttext()
ls_base				= dw_nuevo_detalle.getitemstring(1,'base')
ls_serie				= dw_nuevo_detalle.getitemstring(1,'serie')
ldb_numero			= dw_nuevo_detalle.getitemnumber(1,'numero')
ldt_fecha_crea		= dw_nuevo_detalle.getitemdatetime(1,'fecha_crea')
ls_usuario_crea	= dw_nuevo_detalle.getitemstring(1,'usuario_crea')
ll_estado			= dw_nuevo_detalle.getitemnumber(1,'estado')
ldt_fecha_estado	= dw_nuevo_detalle.getitemdatetime(1,'fecha_estado')
ls_cod_agente		= dw_nuevo_detalle.getitemstring(1,'cod_agente')
ls_cod_superv		= dw_nuevo_detalle.getitemstring(1,'cod_supervisor')
ll_cod_parque		= dw_nuevo_detalle.getitemnumber(1,'cod_parque')
ls_estado_modif	= dw_nuevo_detalle.getitemstring(1,'estado_modificacion')
ll_mes				= dw_nuevo_detalle.getitemnumber(1,'mes_cierre')
ll_ano				= dw_nuevo_detalle.getitemnumber(1,'ano_cierre')	
SELECT	"NOMBRE",				"EMAIL" 
INTO		:ls_nombre_usuario,	:ls_email_de 
FROM		"ENCARGADOS"  
WHERE		( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) 
USING		sqlca;			
if isnull(ls_email_de) or ls_email_de='-' or ls_email_de='' then
	ls_email_de				= 'consulta@nuestrosparques.cl'
end if

ll_estado_email						= 97
SELECT	"FUNERARIA_ESTADO"."DESCRIPCION"  
INTO		:ls_descripcion_email  
FROM		"FUNERARIA_ESTADO"  
WHERE		"FUNERARIA_ESTADO"."CODIGO" = :ll_estado_email   
USING		sqlca;
if sqlca.sqlcode=0 then
end if

SELECT	"FUNERARIA_EMAIL"."USUARIO"  
INTO 		:ls_email_para  
FROM 		"FUNERARIA_EMAIL"  
WHERE 	"FUNERARIA_EMAIL"."COD_ESTADO" = :ll_estado
USING		sqlca;
if sqlca.sqlcode=0 then
end if

SELECT	"GLOSA",		"DESCRIPCION"  
INTO 		:ls_glosa,	:ls_descrip   
FROM		"FUNERARIA_ESTADO"  
WHERE		"FUNERARIA_ESTADO"."CODIGO" = :ll_estado
USING		sqlca;
if sqlca.sqlcode=0 then
end if

SELECT	"FUNERARIA"."NOMBRE",	"FUNERARIA_PAGO_COMISION"."NUM_BOLETA",	"FUNERARIA_PAGO_COMISION"."NUM_CHEQUE"
INTO 		:ls_nombre_funeraria,	:ll_num_boleta,									:ll_num_cheque									 
FROM		"FUNERARIA_PAGO_COMISION",	"FUNERARIA" 
WHERE ( "FUNERARIA_PAGO_COMISION"."COD_FUNERARIA" = "FUNERARIA"."RUT" ) and  
		( ( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
		( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
		( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_numero ) )
USING		sqlca;
if sqlca.sqlcode=0 then
	if ll_estado = 13 then
		ls_glosa_email = ls_descripcion_email+' '+ls_glosa+', CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+': PROMESA : '+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' FUNERARIA '+ls_nombre_funeraria+' NUMERO BOLETA: '+string(ll_num_boleta)
	elseif ll_estado = 16 then
		ls_glosa_email = ls_descripcion_email+' '+ls_glosa+', CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+': PROMESA : '+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' FUNERARIA '+ls_nombre_funeraria+' NUMERO CHEQUE: '+string(ll_num_cheque)
	elseif ll_estado = 20 then
		SELECT	"OFERTA_V"."TIPO_VENTA"  
		INTO 		:ls_origen  
		FROM		"OFERTA_V"  
		WHERE		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_origen) and ls_origen<>'' then
				if ls_origen <> '5' then
					UPDATE	"OFERTA_V"  
     				SET		"TIPO_VENTA" = '5'  
   				WHERE		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
         					( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ls_glosa_email = ls_descripcion_email+' MODIFICACIÓN ORIGEN DE VENTA PROMESA :'+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' , CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+' VENTA FUNERARIA'
					end if
				end if
			end if
		end if
	else
		ls_glosa_email = ls_descripcion_email+' '+ls_glosa+', CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+': PROMESA : '+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' FUNERARIA '+ls_nombre_funeraria
	end if
	
	select	EnviarMail(:ls_email_de,:ls_email_para,:ls_glosa,:ls_glosa_email) 
	INTO 		:ls_res
	from 		DUAL;
	if ls_res='OK' then
		messagebox("Envio Email","Envio Email Exitoso")
	else
		messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
	end if
end if
INSERT INTO	"FUNERARIA_FOLIO_DETALLE"  
				( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",	"GLOSA",				"COD_AGENTE",		"COD_SUPERVISOR",	"COD_PARQUE",		"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR" )  
VALUES 		( :ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_crea,	:ls_usuario_crea,	:ll_estado_email,	:gdt_fec_sistema,	:ls_glosa_email,	:ls_cod_agente,	:ls_cod_superv,	:ll_cod_parque,	:ls_estado_modif,			:ll_mes,			:ll_ano,			:gs_user    ) ;
if sqlca.sqlcode = 0 then
	commit using sqlca;
else
	rollback using sqlca;
	messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_solicitud_control_funeraria
integer x = 2642
integer y = 1732
integer width = 279
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_solicitud_control_funeraria)
end event

type cb_grabar from commandbutton within w_solicitud_control_funeraria
integer x = 32
integer y = 1732
integer width = 279
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_base,ls_serie,ls_nulo,ls_pasa,ls_glosa
long 		ll_tot_reg,ll_res,ll_cod_estado,ll_cod_anterior,ll_nulo,ll_ctto,ll_fila,ll_num_boleta,ll_num_cheque
datetime	ldt_fecha_estado,ldt_nulo,ldt_fecha
double	ldb_numero

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_nuevo_detalle.accepttext()
dw_detalle_actual.accepttext()
ls_pasa								= 'S'
ll_cod_anterior					= dw_detalle_actual.getitemnumber(1,'funeraria_folio_detalle_estado')
ll_cod_estado						= dw_nuevo_detalle.getitemnumber(1,'estado')
ldt_fecha_estado					= dw_nuevo_detalle.getitemdatetime(1,'fecha_estado')
ls_glosa								= dw_nuevo_detalle.getitemstring(1,'glosa')
if not isnull(ll_cod_estado) and ll_cod_estado>0 and not isnull(ldt_fecha_estado) and string(ldt_fecha_estado,'dd/mm/yyyy')<>'00/00/0000' and string(ldt_fecha_estado,'dd/mm/yyyy')<>'01/01/1900' then
	SetPointer(HourGlass!)
	if ll_cod_anterior = 1 and ll_cod_estado <> 4 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 2 and ll_cod_estado <> 3 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 3 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 4 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 6 and ll_cod_estado <> 2 and ll_cod_estado <> 5 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 7 and ll_cod_estado <> 5 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 9 and ll_cod_estado <> 8 and ll_cod_estado <> 10 and ll_cod_estado <> 5 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 10 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 12 and ll_cod_estado <> 11 and ll_cod_estado <> 13 and ll_cod_estado <> 8 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 13 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 15 and ll_cod_estado <> 14 and ll_cod_estado <> 16 and ll_cod_estado <> 11 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 16 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 17 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 19 and ll_cod_estado <> 18 and ll_cod_estado <> 20 and ll_cod_estado <> 17 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 20 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa						= 'N'
	elseif ll_cod_anterior = 98 and ll_cod_estado = 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_estado = 13 then
		ll_num_boleta				= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_boleta")
		if isnull(ll_num_boleta) or ll_num_boleta = 0 then
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
			ls_pasa					= 'N'
		end if
	elseif ll_cod_estado = 16 then
		ll_num_cheque				= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_cheque")
		if isnull(ll_num_cheque) or ll_num_cheque = 0 then
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
			ls_pasa					= 'N'
		end if
	end if
	if ls_pasa='S' then
		ll_res						= MessageBox("Advertencia", '¿Esta seguro de Grabar Detalle Pago Comisión Funeraria?', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			if ll_cod_estado = 3 or ll_cod_estado = 6 or ll_cod_estado = 7 or ll_cod_estado = 9 or ll_cod_estado = 10 or ll_cod_estado = 12 or ll_cod_estado = 13 or ll_cod_estado = 15 or ll_cod_estado = 16 or ll_cod_estado = 19 or ll_cod_estado = 20 then
				cb_email.triggerevent(clicked!)
			end if
			ls_base					= dw_nuevo_detalle.getitemstring(1,'base')
			ls_serie					= dw_nuevo_detalle.getitemstring(1,'serie')
			ldb_numero				= dw_nuevo_detalle.getitemnumber(1,'numero')
			ll_cod_estado			= dw_nuevo_detalle.getitemnumber(1,'estado')
			SELECT	sysdate
			INTO 		:gdt_fec_sistema
			FROM		"TASA"  
			WHERE		"TASA"."LOOK" = 1   
			USING		sqlca ;
			dw_nuevo_detalle.setitem(1,'fecha_estado',gdt_fec_sistema)			
			dw_nuevo_detalle.accepttext()
			if dw_nuevo_detalle.update() = 1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				UPDATE	  "FUNERARIA_PAGO_COMISION"  
				SET 		  "COD_ESTADO" = :ll_cod_estado,   
							  "FECHA_ESTADO" = :gdt_fec_sistema  
				WHERE		( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
							( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
							( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					if isvalid(w_solicitud_gestion_funeraria) then
						ll_fila	= w_solicitud_gestion_funeraria.dw_lista_solicitud.getrow()
						w_solicitud_gestion_funeraria.dw_lista_solicitud.retrieve()
						if ll_fila>0 then
							w_solicitud_gestion_funeraria.dw_lista_solicitud.scrolltorow(ll_fila)
							w_solicitud_gestion_funeraria.dw_lista_solicitud.setfocus()
						end if
					end if
					if isvalid(w_solicitud_pago_funeraria) then
						w_solicitud_pago_funeraria.dw_comision.retrieve(ls_base,ls_serie,ldb_numero)
						w_solicitud_pago_funeraria.dw_comision.setfocus()
					end if
					if isvalid(w_solicitud_control_funeraria) then
						w_solicitud_control_funeraria.setfocus()
					end if
					close(w_solicitud_control_funeraria)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar FUNERARIA_PAGO_COMISION SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Detalle SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
	SetPointer(Arrow!)
else
	if ll_cod_estado = 13 then
		MessageBox("Advertencia","Debe Ingresar Número Botela En Formulario Solicitud Pago Comisión")
	elseif ll_cod_estado = 16 then
		MessageBox("Advertencia","Debe Ingresar Número Cheque En Formulario Solicitud Pago Comisión")
	else
		messagebox("Advertencia","No Es Posible Grabar Tipo de Gestión")
	end if
end if
end event

type st_situacion_actual from statictext within w_solicitud_control_funeraria
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

type dw_detalle_actual from datawindow within w_solicitud_control_funeraria
integer x = 18
integer y = 96
integer width = 2953
integer height = 800
integer taborder = 10
string dataobject = "dw_sitiuacion_actual_funeraria"
boolean border = false
boolean livescroll = true
end type

type dw_nuevo_detalle from datawindow within w_solicitud_control_funeraria
integer x = 14
integer y = 904
integer width = 2971
integer height = 808
integer taborder = 30
string dataobject = "dw_funeraria_crea_control"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_glosa,ls_glosa_detalle,ls_usuario,ls_nulo,ls_pasa
long		ll_cod_estado,ll_new,ll_cod_anterior,ll_nulo,ll_num_boleta,ll_num_cheque
datetime	ldt_fecha_estado,ldt_nulo,ldt_fecha

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_detalle_actual.accepttext()
ls_pasa					= 'S'
ll_cod_anterior		= dw_detalle_actual.getitemnumber(1,'funeraria_folio_detalle_estado')
this.accepttext()
ls_columna	= dwo.name
if ls_columna='estado' then
	ll_cod_estado			= this.getitemnumber(1,'estado')
	ldt_fecha_estado		= this.getitemdatetime(1,'fecha_estado')
	ls_usuario				= this.getitemstring(1,'usuario_gestor')
	if ll_cod_anterior = 1 and ll_cod_estado <> 4 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 2 and ll_cod_estado <> 3 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 3 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 4 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa			= 'N'
	elseif ll_cod_anterior = 6 and ll_cod_estado <> 2 and ll_cod_estado <> 5 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 7 and ll_cod_estado <> 5 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 9 and ll_cod_estado <> 8 and ll_cod_estado <> 10 and ll_cod_estado <> 5 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 10 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'	
	elseif ll_cod_anterior = 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 12 and ll_cod_estado <> 11 and ll_cod_estado <> 13 and ll_cod_estado <> 8 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 13 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 15 and ll_cod_estado <> 14 and ll_cod_estado <> 16 and ll_cod_estado <> 11 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 16 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 17 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 19 and ll_cod_estado <> 18 and ll_cod_estado <> 20 and ll_cod_estado <> 17 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 20 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_anterior = 98 and ll_cod_estado = 98 then
		messagebox("Advertencia","No puede Ingresar Tipo de Gestión")
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		ls_pasa		= 'N'
	elseif ll_cod_estado = 13 then
		ll_num_boleta						= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_boleta")
		if isnull(ll_num_boleta) or ll_num_boleta = 0 then
			MessageBox("Advertencia","Debe Ingresar Número Botela En Formulario Solicitud Pago Comisión")
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
			ls_pasa		= 'N'
		end if
	elseif ll_cod_estado = 16 then
		ll_num_cheque						= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_cheque")
		if isnull(ll_num_cheque) or ll_num_cheque = 0 then
			MessageBox("Advertencia","Debe Ingresar Número Cheque Formulario Solicitud Pago Comisión")
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
			ls_pasa		= 'N'
		end if	
	end if
	if ls_pasa='S' then
		this.setitem(1,'estado',ll_cod_estado)
		this.setitem(1,'fecha_estado',gdt_fec_sistema)
		this.setitem(1,'usuario_gestor',ls_usuario)
		dw_nuevo_detalle.accepttext()
		ldt_fecha					= this.getitemdatetime(1,'fecha_estado')
		SELECT	"FUNERARIA_ESTADO"."GLOSA"  
		INTO		:ls_glosa  
		FROM		"FUNERARIA_ESTADO"  
		WHERE	"FUNERARIA_ESTADO"."CODIGO" = :ll_cod_estado
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			ls_glosa_detalle 		= 'SE INGRESA GESTION USUARIO: '+ ls_usuario +', CON FECHA: '+string(ldt_fecha,'dd/mm/yyyy')+', GLOSA: '+ls_glosa
			dw_nuevo_detalle.setitem(1,'glosa',ls_glosa_detalle)
		end if
	end if
end if
dw_nuevo_detalle.accepttext()
end event

event itemfocuschanged;string	ls_columna,ls_glosa,ls_glosa_detalle,ls_usuario,ls_nulo
long		ll_cod_estado,ll_new,ll_cod_anterior,ll_nulo,ll_num_boleta,ll_num_cheque
datetime	ldt_fecha_estado,ldt_nulo

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_detalle_actual.accepttext()
ll_cod_anterior		= dw_detalle_actual.getitemnumber(1,'funeraria_folio_detalle_estado')
this.accepttext()
ls_columna	= dwo.name
if ls_columna <> 'estado' then
	ll_cod_estado		= this.getitemnumber(1,'estado')
	ldt_fecha_estado	= this.getitemdatetime(1,'fecha_estado')
	ls_usuario			= this.getitemstring(1,'usuario_gestor')
	if ll_cod_anterior = 1 and ll_cod_estado <> 4 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 2 and ll_cod_estado <> 3 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 3 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 4 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 6 and ll_cod_estado <> 2 and ll_cod_estado <> 5 and ll_cod_estado <> 7 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 7 and ll_cod_estado <> 5 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 9 and ll_cod_estado <> 8 and ll_cod_estado <> 10 and ll_cod_estado <> 5 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 10 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 12 and ll_cod_estado <> 11 and ll_cod_estado <> 13 and ll_cod_estado <> 8 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 13 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 15 and ll_cod_estado <> 14 and ll_cod_estado <> 16 and ll_cod_estado <> 11 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 16 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 17 and ll_cod_estado <> 16 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 19 and ll_cod_estado <> 18 and ll_cod_estado <> 20 and ll_cod_estado <> 17 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 20 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_anterior = 98 and ll_cod_estado = 98 then
		dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
		dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
		dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
	elseif ll_cod_estado = 13 then
		ll_num_boleta						= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_boleta")
		if isnull(ll_num_boleta) or ll_num_boleta = 0 then
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		end if
	elseif ll_cod_estado = 16 then
		ll_num_cheque						= dw_detalle_actual.getitemnumber(1,"funeraria_pago_comision_num_cheque")
		if isnull(ll_num_cheque) or ll_num_cheque = 0 then
			dw_nuevo_detalle.setitem(1,'glosa',ls_nulo)
			dw_nuevo_detalle.setitem(1,'estado',ll_nulo)
			dw_nuevo_detalle.setitem(1,'fecha_estado',ldt_nulo)
		end if	
	end if
end if
dw_nuevo_detalle.accepttext()
end event

