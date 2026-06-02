forward
global type w_grabar_lista_gestion_atencion_terreno from window
end type
type dw_archivo from datawindow within w_grabar_lista_gestion_atencion_terreno
end type
type cb_cerrar from commandbutton within w_grabar_lista_gestion_atencion_terreno
end type
type cb_grabar from commandbutton within w_grabar_lista_gestion_atencion_terreno
end type
type dw_dato from datawindow within w_grabar_lista_gestion_atencion_terreno
end type
end forward

global type w_grabar_lista_gestion_atencion_terreno from window
integer width = 1897
integer height = 1108
boolean titlebar = true
string title = "Grabar Lista Gestión"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_archivo dw_archivo
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_dato dw_dato
end type
global w_grabar_lista_gestion_atencion_terreno w_grabar_lista_gestion_atencion_terreno

type variables
long		il_new,il_existe_mix
String	is_personal_interno
datawindowchild	idw_detalle6
end variables

forward prototypes
public subroutine wf_crea_at_gestion (string as_base, string as_serie, long al_numero, long al_rut, datetime adt_fec_crea, long al_cod_grupo, string as_estado_gest, string as_usuario_asig, datetime adt_fecha, string as_estado, string as_tipo_cob)
end prototypes

public subroutine wf_crea_at_gestion (string as_base, string as_serie, long al_numero, long al_rut, datetime adt_fec_crea, long al_cod_grupo, string as_estado_gest, string as_usuario_asig, datetime adt_fecha, string as_estado, string as_tipo_cob);long		ll_cta
String		ls_glosa,ls_estado_tele,ls_estado_at
datetime	ldt_fecha_sistema

//wf_crea_at_gestion(as_base,as_serie,al_numero,al_rut,adt_fec_crea,al_cod_grupo,as_estado_gest,as_usuario_asig,adt_fecha,as_estado,as_tipo_cob)

SELECT (sysdate +0.001)  INTO :ldt_fecha_sistema  FROM dual   ;
ls_glosa			= 'SE ASIGNA CONTRATO '+as_base+' '+as_serie+' '+string(al_numero)
ls_estado_tele	= '0'
ls_estado_at	= 'P'
INSERT INTO "TELE_LOG"  
			( "RUT",  	"ESTADO",   		"FECHA",   			"GLOSA",   		"USUARIO",   			"BASE",   	"SERIE",   	"NUMERO" )  
VALUES 	( :al_rut,   	:ls_estado_tele,   	:adt_fec_crea,   	:ls_glosa, 		:as_usuario_asig,   	:as_base,   	:as_serie,	:al_numero ) 
USING	Trans_1;
if Trans_1.sqlcode = 0 then
	commit using Trans_1;
	UPDATE	"AT_GESTION"  
	SET 		"FECHA_PROX_LLAMADA" = :adt_fec_crea,
				"FECHA_PROX_VISITA" = :adt_fec_crea,
				"ESTADO_GESTION" = :ls_estado_at,
				"TIPO_GESTION" = 1,
				"ESTADO_LLAMADA" = 'S',
				"ESTADO_VISITA" = 'S'
	WHERE	( "AT_GESTION"."BASE" = :gs_base ) AND  
				( "AT_GESTION"."SERIE" = :gs_serie ) AND  
				( "AT_GESTION"."NUMERO" = :gi_numero )  and
				( "AT_GESTION"."TIPO_COBRANZA" = 'N' ) 	//:gs_tipo_cob )
	USING	Trans_2;
	if Trans_2.sqlcode = 0 then
		commit using Trans_2;
	else
		rollbacK using Trans_2;
	end if
else
	rollback using Trans_1;
	messagebox("Error Grabar","Error Grabar Tabla TELE_LOG SQL: "+Trans_1.sqlerrtext)
end if





//SELECT	COUNT("AT_GESTION"."BASE")  
//INTO 		:ll_cta  
//FROM 	"AT_GESTION"  
//WHERE	( "AT_GESTION"."BASE" = :as_base ) AND  
//         	( "AT_GESTION"."SERIE" = :as_serie ) AND  
//         	( "AT_GESTION"."NUMERO" = :al_numero ) AND  
//         	( "AT_GESTION"."TIPO_COBRANZA" = :as_tipo_cob )
//USING	sqlca;
//if isnull(ll_cta) then ll_cta=0
//if ll_cta=0 then
//	INSERT INTO "AT_GESTION"  
//				( "BASE",		"SERIE",		"NUMERO",	"RUT_CLIENTE",	"FECHA_CREA",	"CODIGO_GRUPO",	"ESTADO_GESTION",	"USUARIO_ASIGNADO",	"FECHA_PROX_LLAMADA",	"FECHA_PROX_VISITA",	"ESTADO_LLAMADA",	"ESTADO_VISITA",	"TIPO_COBRANZA" )  
//	VALUES	( :as_base,	:as_serie,	:al_numero,	:al_rut,				:adt_fec_crea,		:al_cod_grupo,		:as_estado_gest,		:as_usuario_asig,			:adt_fecha,						:adt_fecha,					:as_estado,				:as_estado,				:as_tipo_cob )
//	USING	sqlca;
//	if sqlca.sqlcode = 0 then
//		commit using sqlca;
//	else
//		rollback using sqlca;
//		messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+sqlca.sqlerrtext)
//	end if
//end if
//
end subroutine

on w_grabar_lista_gestion_atencion_terreno.create
this.dw_archivo=create dw_archivo
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_dato=create dw_dato
this.Control[]={this.dw_archivo,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_dato}
end on

on w_grabar_lista_gestion_atencion_terreno.destroy
destroy(this.dw_archivo)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_dato)
end on

event open;connect using Trans_1;
string	ls_tipo_cob,ls_cob,ls_nulo

connect using Trans_2;
gf_centrar(w_grabar_lista_gestion_atencion_terreno)
setnull(ls_nulo)

if gs_conexion = "Parque La Foresta" then
	dw_dato.dataobject								= 'dw_grabar_lista_gestion_at_terreno_mix'
	dw_dato.settransobject(sqlca)
else
	if gs_tipo_cob= 'J' then
		dw_dato.dataobject							= 'dw_grabar_lista_gestion_at_terreno2'
		dw_dato.settransobject(sqlca)
	else
		dw_dato.dataobject							= 'dw_grabar_lista_gestion_at_terreno'
		dw_dato.settransobject(sqlca)
		dw_dato.object.tipo_cobranza.protect	= 1
	end if
end if

if gs_tipo_cob = 'T' or gs_tipo_cob = 'N' then
	ls_tipo_cob		= 'N'
else
	ls_tipo_cob		= gs_tipo_cob
end if

dw_dato.getchild('tipo_cobranza',idw_detalle6)
idw_detalle6.settransobject(sqlca)
if idw_detalle6.retrieve(gs_tipo_cob)=0 then
	idw_detalle6.insertrow(0)
end if

dw_dato.settransobject(sqlca)
dw_dato.getchild('usuario_asignado',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ls_tipo_cob)=0 then
	idw_detalle.insertrow(0)
end if

dw_archivo.settransobject(sqlca)

il_new					= dw_dato.insertrow(0)
dw_dato.scrolltorow(il_new)
dw_dato.setitem(il_new,'usuario_creador',gs_user)
dw_dato.setitem(il_new,'fecha_crea',date(gdt_fec_sistema))
dw_dato.setitem(il_new,'estado_gestion_lista','P')
if gs_tipo_cob= 'J' then
	dw_dato.setitem(il_new,'tipo_cobranza',ls_nulo)
else
	dw_dato.setitem(il_new,'tipo_cobranza',gs_tipo_cob)
end if
dw_dato.accepttext()

	
end event

event close;if isvalid(w_generar_filtro_at_terreno) then w_generar_filtro_at_terreno.dw_lista.setfocus()
DISCONNECT USING Trans_1;
DISCONNECT USING Trans_2;

end event

type dw_archivo from datawindow within w_grabar_lista_gestion_atencion_terreno
boolean visible = false
integer x = 480
integer y = 1092
integer width = 782
integer height = 432
string dataobject = "dwe_genera_archivo_cobranza_externa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_grabar_lista_gestion_atencion_terreno
integer x = 1499
integer y = 840
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;String	ls_filtrar
if isvalid(w_asignar_ejecutivo_atencion_terreno) then close(w_asignar_ejecutivo_atencion_terreno)
if isvalid(w_generar_filtro_at_terreno) then
	ls_filtrar			= gs_formula
	w_generar_filtro_at_terreno.dw_lista.SETfilter(ls_filtrar)
	w_generar_filtro_at_terreno.dw_lista.filter()
	w_generar_filtro_at_terreno.dw_lista.accepttext()
elseif isvalid(w_generar_filtro_cartera_cobranza) then
	ls_filtrar			= gs_formula
	w_generar_filtro_cartera_cobranza.dw_lista.SETfilter(ls_filtrar)
	w_generar_filtro_cartera_cobranza.dw_lista.filter()
	w_generar_filtro_cartera_cobranza.dw_lista.accepttext()
end if
close(w_grabar_lista_gestion_atencion_terreno)
end event

type cb_grabar from commandbutton within w_grabar_lista_gestion_atencion_terreno
integer x = 37
integer y = 840
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_max,ll_tot_reg,ll_indi,ll_rut_cliente,ll_dato_1,ll_dato_2,ll_cod_parque
string		ls_base,ls_serie,ls_estado='P',ls_usuario_asig, ls_obs,ls_personal_interno,ls_filtrar,ls_tipo_cob
datetime	ldt_fec_prox_llam,ldt_fecha_hoy,ldt_fecha_crea
Double	ll_numero

SetPointer(HourGlass!)

if gs_tipo_cob='N' or gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J'  or gs_tipo_cob='T' then
	ldt_fecha_hoy								= datetime(date(gdt_fec_sistema),time('00:00:00'))
	dw_dato.accepttext()
	ls_usuario_asig								= dw_dato.getitemstring(1,'usuario_asignado')
	ls_obs										= dw_dato.getitemstring(1,'obervacion')
	ls_tipo_cob									= dw_dato.getitemstring(1,'tipo_cobranza')
	if ls_usuario_asig='' or isnull(ls_usuario_asig) then
		messagebox("Advertencia","Debe seleccionar Usuario")
		dw_dato.setfocus()
		dw_dato.setcolumn('usuario_asignado')
	else
		if ls_obs='' or isnull(ls_obs) then
			messagebox("Advertencia","Debe Ingresar Observación")
			dw_dato.setfocus()
			dw_dato.setcolumn('obervacion')
		else
			SELECT 	MAX("AT_LISTA_GESTION"."CODIGO_GRUPO")  
			INTO 		:ll_max  
			FROM 	"AT_LISTA_GESTION"  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ll_max) or ll_max=0 then
					ll_max								= 1
				else
					ll_max++
				end if
			else
				ll_max									= 1
			end if
			dw_dato.setitem(il_new,'codigo_grupo',ll_max)
			if isvalid(w_asignar_ejecutivo_atencion_terreno) then
				ll_dato_1									= dw_dato.update()
				if ll_dato_1 = 1 then
					commit using sqlca;
					ll_tot_reg							= w_asignar_ejecutivo_atencion_terreno.dw_lista.rowcount()
					for ll_indi=1 to ll_tot_reg
						ll_rut_cliente					= w_asignar_ejecutivo_atencion_terreno.dw_lista.getitemnumber(ll_indi,'rut_cliente')
						ls_base							= w_asignar_ejecutivo_atencion_terreno.dw_lista.getitemstring(ll_indi,'base')
						ls_serie							= w_asignar_ejecutivo_atencion_terreno.dw_lista.getitemstring(ll_indi,'serie')
						ll_numero						= w_asignar_ejecutivo_atencion_terreno.dw_lista.getitemnumber(ll_indi,'numero')
						
						w_asignar_ejecutivo_atencion_terreno.dw_lista.setitem(ll_indi,'codigo_grupo',ll_max)
						w_asignar_ejecutivo_atencion_terreno.dw_lista.setitem(ll_indi,'fecha_crea',date(gdt_fec_sistema))
						w_asignar_ejecutivo_atencion_terreno.dw_lista.setitem(ll_indi,'usuario_asignado',ls_usuario_asig)
						if gs_tipo_cob='J' then
							w_asignar_ejecutivo_atencion_terreno.dw_lista.setitem(ll_indi,'tipo_cobranza',ls_tipo_cob)
						elseif gs_tipo_cob='N' then
							SELECT (sysdate +0.001 )  INTO :ldt_fecha_crea  FROM dual   ;
							wf_crea_at_gestion(ls_base,ls_serie,ll_numero,ll_rut_cliente,ldt_fecha_crea,ll_max,'P',ls_usuario_asig,ldt_fecha_hoy,'S',gs_tipo_cob)
						end if
						
						w_asignar_ejecutivo_atencion_terreno.dw_lista.accepttext()
						ldt_fec_prox_llam				= datetime(RelativeDate(date(gdt_fec_sistema), 370))
						UPDATE	"CADENA"  
						SET 		"ASIGNACION_AT" = 'S',
									"DEPTO_COB_ASIG" = 'T'
						WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero )   
						USING	Trans_2;
						if Trans_2.sqlcode=0 then
							commit using Trans_2;
						else
							rollback using Trans_2;
							messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
						end if
					next
					if w_asignar_ejecutivo_atencion_terreno.dw_lista.update()=1 then
						commit using sqlca;
						if gs_tipo_cob='N'  then 
							ll_tot_reg					= w_generar_filtro_at_terreno.dw_lista.rowcount()
							For ll_indi=1 to ll_tot_reg
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'pasa','N')
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'estado_reg',1)
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'usuario_asignado',ls_usuario_asig)
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'vista_atencion_terreno_estado_llamada','S')
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'vista_atencion_terreno_fecha_prox_llamada',ldt_fecha_hoy)
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'vista_atencion_terreno_estado_visita','S')
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'vista_atencion_terreno_fecha_prox_visita',ldt_fecha_hoy)
								
							next
							w_generar_filtro_at_terreno.dw_lista.accepttext()
						elseif gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E'  then
							ll_tot_reg					= w_generar_filtro_cartera_cobranza.dw_lista.rowcount()
							For ll_indi=1 to ll_tot_reg
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'pasa','N')
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_reg',1)
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'usuario_asignado',ls_usuario_asig)
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_llamada','S')
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_llamada',ldt_fecha_hoy)
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_visita','S')
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_visita',ldt_fecha_hoy)
//								wf_crea_at_gestion(ls_base,ls_serie,ll_numero,ll_rut_cliente,ldt_fecha_crea,ll_max,'P',ls_usuario_asig,ldt_fecha_hoy,'S',gs_tipo_cob)
							next
							w_generar_filtro_cartera_cobranza.dw_lista.accepttext()
						elseif gs_tipo_cob='J' then
							if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_tipo_cob.TriggerEvent(Itemchanged!)
							end if
						end if
						messagebox("Grabar","Grabación Exitosa")
						if gs_tipo_cob='N' then
							ls_filtrar			= gs_formula
							w_generar_filtro_at_terreno.dw_lista.SETfilter(ls_filtrar)
							w_generar_filtro_at_terreno.dw_lista.filter()
							w_generar_filtro_at_terreno.dw_lista.accepttext()
						elseif gs_tipo_cob='C' or gs_tipo_cob='M'  or gs_tipo_cob='E' then
							ls_filtrar			= gs_formula
							w_generar_filtro_cartera_cobranza.dw_lista.SETfilter(ls_filtrar)
							w_generar_filtro_cartera_cobranza.dw_lista.filter()
							w_generar_filtro_cartera_cobranza.dw_lista.accepttext()
						elseif gs_tipo_cob='J' then
							
						end if
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
				cb_cerrar.triggerevent(clicked!)
			else
				messagebox("Advertencia","Ventana Asignar Ejecutivo Atención Terreno, se encuentra Cerrada")
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_dato from datawindow within w_grabar_lista_gestion_atencion_terreno
integer x = 37
integer y = 44
integer width = 1824
integer height = 792
integer taborder = 10
string dataobject = "dw_grabar_lista_gestion_at_terreno"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_tipo_cob,ls_nulo

setnull(ls_nulo)
dw_dato.accepttext()

ls_columna	= dwo.name
if ls_columna = 'tipo_cobranza' then
	ls_tipo_cob										= dw_dato.getitemstring(1,'tipo_cobranza')
	if isnull(ls_tipo_cob) or ls_tipo_cob = '' then
		dw_dato.setitem(1,'usuario_asignado',ls_nulo)
		dw_dato.accepttext()
	else
		dw_dato.getchild('usuario_asignado',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_tipo_cob)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_dato.insertrow(0)
		dw_dato.accepttext()
	end if
end if
		
		
end event

