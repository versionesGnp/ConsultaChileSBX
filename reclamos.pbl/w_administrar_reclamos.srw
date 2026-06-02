forward
global type w_administrar_reclamos from window
end type
type cb_reasignar from commandbutton within w_administrar_reclamos
end type
type cb_reemplazar_usuario from commandbutton within w_administrar_reclamos
end type
type pb_filtrar_tit from picturebutton within w_administrar_reclamos
end type
type em_mat_tit from editmask within w_administrar_reclamos
end type
type em_pat_tit from editmask within w_administrar_reclamos
end type
type st_ap_mat from statictext within w_administrar_reclamos
end type
type st_pat_tit from statictext within w_administrar_reclamos
end type
type em_nom_tit from editmask within w_administrar_reclamos
end type
type st_nom_tit from statictext within w_administrar_reclamos
end type
type st_titular from statictext within w_administrar_reclamos
end type
type dwe_ticket from datawindow within w_administrar_reclamos
end type
type pb_ok from picturebutton within w_administrar_reclamos
end type
type cb_ctacte from commandbutton within w_administrar_reclamos
end type
type cb_anular from commandbutton within w_administrar_reclamos
end type
type em_ctto from editmask within w_administrar_reclamos
end type
type pb_buscar from picturebutton within w_administrar_reclamos
end type
type st_busqueda from statictext within w_administrar_reclamos
end type
type cb_cerrar from commandbutton within w_administrar_reclamos
end type
type cb_imprimir from commandbutton within w_administrar_reclamos
end type
type cb_exportar from commandbutton within w_administrar_reclamos
end type
type cb_filtrar from commandbutton within w_administrar_reclamos
end type
type cb_ordenar from commandbutton within w_administrar_reclamos
end type
type p_inicio from picture within w_administrar_reclamos
end type
type st_hasta from statictext within w_administrar_reclamos
end type
type em_inicio from editmask within w_administrar_reclamos
end type
type em_termino from editmask within w_administrar_reclamos
end type
type st_desde from statictext within w_administrar_reclamos
end type
type p_termino from picture within w_administrar_reclamos
end type
type gb_periodo from groupbox within w_administrar_reclamos
end type
type gb_3 from groupbox within w_administrar_reclamos
end type
type dw_parque from datawindow within w_administrar_reclamos
end type
type tab_1 from tab within w_administrar_reclamos
end type
type tabpage_1 from userobject within tab_1
end type
type dw_contacto_detalle from datawindow within tabpage_1
end type
type dw_contacto_lista from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_contacto_detalle dw_contacto_detalle
dw_contacto_lista dw_contacto_lista
end type
type tabpage_2 from userobject within tab_1
end type
type dw_reclamos_rechazo from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_reclamos_rechazo dw_reclamos_rechazo
end type
type tabpage_3 from userobject within tab_1
end type
type cb_publico from commandbutton within tabpage_3
end type
type st_ticket from statictext within tabpage_3
end type
type rb_rut_contacto from radiobutton within tabpage_3
end type
type rb_requerimiento from radiobutton within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type dw_asigna_lista from datawindow within tabpage_3
end type
type dw_asigna_detalle from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_publico cb_publico
st_ticket st_ticket
rb_rut_contacto rb_rut_contacto
rb_requerimiento rb_requerimiento
st_1 st_1
dw_asigna_lista dw_asigna_lista
dw_asigna_detalle dw_asigna_detalle
end type
type tab_1 from tab within w_administrar_reclamos
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_detalle_gestion from commandbutton within w_administrar_reclamos
end type
type cb_gestionar from commandbutton within w_administrar_reclamos
end type
end forward

global type w_administrar_reclamos from window
integer width = 3607
integer height = 2176
boolean titlebar = true
string title = "Solicitud Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_reasignar cb_reasignar
cb_reemplazar_usuario cb_reemplazar_usuario
pb_filtrar_tit pb_filtrar_tit
em_mat_tit em_mat_tit
em_pat_tit em_pat_tit
st_ap_mat st_ap_mat
st_pat_tit st_pat_tit
em_nom_tit em_nom_tit
st_nom_tit st_nom_tit
st_titular st_titular
dwe_ticket dwe_ticket
pb_ok pb_ok
cb_ctacte cb_ctacte
cb_anular cb_anular
em_ctto em_ctto
pb_buscar pb_buscar
st_busqueda st_busqueda
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
p_inicio p_inicio
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_termino p_termino
gb_periodo gb_periodo
gb_3 gb_3
dw_parque dw_parque
tab_1 tab_1
cb_detalle_gestion cb_detalle_gestion
cb_gestionar cb_gestionar
end type
global w_administrar_reclamos w_administrar_reclamos

type variables
Long		il_row1,il_row3, il_grabar
end variables

forward prototypes
public subroutine wf_gestion_contacto ()
end prototypes

public subroutine wf_gestion_contacto ();string		ls_est_asig,ls_cod_solicitud,ls_depto_asig,ls_cod_geren_asig,ls_user_asig,ls_descrip,ls_depto_desc,ls_ult_glosa,ls_depto_asig_consul,&
			ls_glosa_gestion,ls_glosa_detalle,ls_email,ls_fono_part,ls_fono_comer,ls_celular,ls_base,ls_serie,ls_est_reg,ls_area,&
			ls_sector,ls_sepult,ls_glosa_orig,ls_nombre_contacto,ls_a_pater_contacto,ls_a_mater_contacto,ls_nivel,ls_nom_user_asig
long		ll_rut_cotizante,ll_rut_titular,ll_cod_reclamo,ll_ult_est_gestion,ll_cod_parque,ll_num_reclamo
Double	ll_numero

SELECT	sysdate  INTO 	:gdt_fec_sistema FROM	"TASA"  WHERE	"TASA"."LOOK" = 1   USING	sqlca ;
ls_est_asig						= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'estado_asigna')
ll_rut_cotizante					= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
ls_cod_solicitud					= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'tipo_contacto')
ls_nombre_contacto			= trim(tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'nombre_cotizante'))
ls_a_pater_contacto			= trim(tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'ap_paterno_cotizante'))
ls_a_mater_contacto			= trim(tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'ap_materno_cotizante'))
ll_cod_parque					= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')

if len(ls_nombre_contacto) > 20 then
	ls_nombre_contacto		= mid(ls_nombre_contacto,1,20)
end if
if len(ls_a_pater_contacto) > 20 then
	ls_a_pater_contacto		= mid(ls_a_pater_contacto,1,20)
end if
if len(ls_a_mater_contacto) > 20 then
	ls_a_mater_contacto		= mid(ls_a_mater_contacto,1,20)
end if
SELECT	"CODIGO_GERENCIA",	"CODIGO_DEPTO",	"NIVEL"
INTO		:ls_cod_geren_asig,	:ls_depto_asig,		:ls_nivel
FROM 	"RECLAMO_CODIGO_TIPO"  
WHERE	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solicitud 
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_cod_geren_asig) and ls_cod_geren_asig<>'' and not isnull(ls_depto_asig) and ls_depto_asig<>'' and not isnull(ls_nivel) and ls_nivel<>'' then
		ls_depto_asig			= ls_depto_asig
		ls_nivel					= ls_nivel
		ls_cod_geren_asig		= ls_cod_geren_asig
		if ls_depto_asig='X' then 
			ls_depto_asig_consul='G'
		else
			ls_depto_asig_consul = ls_depto_asig
		end if
	end if
end if

SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
INTO 		:ls_descrip  
FROM 	"RECLAMO_CODIGO_TIPO"  
WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solicitud
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_descrip) and ls_descrip<>'' then
		ls_descrip				= ls_descrip
	else
		ls_descrip				= ''
	end if
else
	ls_descrip					= ''
end if

SELECT	"ENCARGADOS"."CODIGO_USUARIO", "ENCARGADOS"."NOMBRE",	"CODIGO_DEPTO"."DESCRIPCION"
INTO		:ls_user_asig,								:ls_nom_user_asig,			:ls_depto_desc
FROM 	"ENCARGADOS","CODIGO_DEPTO","RECLAMO_USUARIO_AUTORIZA_WEB"
WHERE 	"ENCARGADOS"."DEPTO" = "CODIGO_DEPTO"."CODIGO" and
			"ENCARGADOS"."DEPTO" = :ls_depto_asig_consul AND
			"RECLAMO_USUARIO_AUTORIZA_WEB"."USUARIO" = "ENCARGADOS"."CODIGO_USUARIO" AND
			"ENCARGADOS"."RECLAMO" = 'R' and 
			"ENCARGADOS"."ESTADO" = 'A' 
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_user_asig) and ls_user_asig<>'' and not isnull(ls_nom_user_asig) and ls_nom_user_asig<>'' and not isnull(ls_depto_desc) and ls_depto_desc<>'' then
		ls_user_asig							= ls_user_asig
		ls_nom_user_asig					= ls_nom_user_asig
		ls_depto_desc						= ls_depto_desc
	else
		ls_user_asig							= ''
		ls_nom_user_asig					= ''
		ls_depto_desc						= ''
	end if
else
	ls_user_asig								= ''
	ls_nom_user_asig						= ''
	ls_depto_desc							= ''
end if
if ls_est_asig='A' then
	messagebox("Advertencia","Registro Asignado Departamento :" +ls_depto_desc)
else
	SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
	INTO		:ls_ult_glosa
	FROM		"RECLAMO_ESTADO"  
	WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = 0 )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ls_ult_glosa) and ls_ult_glosa<>'' then
			ls_ult_glosa			= ls_ult_glosa
		else
			ls_ult_glosa			= ''
		end if
	else
		ls_ult_glosa				= ''
	end if
	ls_glosa_gestion			= ls_ult_glosa+' '+ls_descrip
	
	ls_glosa_detalle			= ls_ult_glosa+' '+ls_descrip+': USUARIO CREADOR: '+gs_user+' - '+gs_nombre_usuario+', USUARIO ASIGNADO: '+ls_user_asig+' - '+ls_nom_user_asig+', DEPARTAMENTO ASIGNADO :'+ ls_depto_asig+' - '+ls_depto_desc
	ls_email						= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'email')
	ls_fono_part   				= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'telefono')
	ls_fono_comer				= '-'
	ls_celular					= '-'
	ls_base						= '-'
	ls_serie						= '-'
	ll_numero					= 0
	ll_rut_titular					= 0
	ls_est_reg					= 'V'
	ls_area						= '-'
	ls_sector						= '-'
	ls_sepult						= '-'
	IF ls_depto_asig='X' then
		ll_cod_reclamo			= 3202
	elseif ls_depto_asig='P' then
		ll_cod_reclamo			= 340
	end if
	ls_glosa_orig				= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'asunto')
	ll_ult_est_gestion			= 1
	SELECT	max("NUMERO_RECLAMO" )
	INTO		:ll_num_reclamo
   	FROM 	"RECLAMO_SOLICITUD"
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
			ll_num_reclamo	= ll_num_reclamo + 1
		else
			ll_num_reclamo	= 1
		end if
	else
		ll_num_reclamo		= 1
	end if
			
	INSERT INTO	"RECLAMO_SOLICITUD"
					( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",		"FECHA_CREA",	"USUARIO_CREA",	"ULT_ESTADO_GESTION",	"ULT_FECHA_GESTION",	"ULT_GLOSA_GESTION",	"USUARIO_ASIGNADO",	"COD_GERENCIA_ASIGNADO",	"EMAIL",		"FONO_PARTICULAR",	"FONO_COMERCIAL",	"CELULAR",	"BASE",	"SERIE",	"NUMERO",	"RUT_TITULAR",	"COD_ESTADO_REG",	"AREA",	"SECTOR",	"SEPULTURA",	"CODIGO_RECLAMO",	"GLOSA_RECLAMO_ORIGINAL",	"DEPTO_CREA",	"DEPTO_ASIG",	"RUT_CONTACTO",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"COD_PARQUE",	"NIVEL",	"ORIGEN" )
	VALUES		( :ll_num_reclamo,		:ls_cod_solicitud,				:gdt_fec_sistema,	:gs_user,			:ll_ult_est_gestion,			:gdt_fec_sistema,			:ls_glosa_gestion,			:ls_user_asig,				:ls_cod_geren_asig,				:ls_email,	:ls_fono_part,				:ls_fono_comer,		:ls_celular,	:ls_base,	:ls_serie,	:ll_numero,	:ll_rut_titular,		:ls_est_reg,				:ls_area,	:ls_sector,	:ls_sepult,		:ll_cod_reclamo,		:ls_glosa_orig,						:gs_depto,			:ls_depto_asig,	:ll_rut_cotizante,		:ls_nombre_contacto,		:ls_a_pater_contacto,			:ls_a_mater_contacto,		:ll_cod_parque,		:ls_nivel,	'2'	)
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit using sqlca;
		INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
						( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",	"CODIGO_GESTION",	"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",	"NIVEL"  )  
		VALUES		( :ll_num_reclamo,		:ls_cod_solicitud,			:gdt_fec_sistema,	:gs_user,			:ll_ult_est_gestion,	:gdt_fec_sistema,		:ls_glosa_detalle,	:ls_glosa_gestion,		:ll_rut_cotizante,		:ll_cod_parque,		:ls_user_asig,		:ls_depto_asig,	:ls_nivel)
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			tab_1.tabpage_1.dw_contacto_lista.setitem(il_row1,"estado_asigna",'A')  
			tab_1.tabpage_1.dw_contacto_lista.setitem(il_row1,"fecha_asigna",gdt_fec_sistema)
			tab_1.tabpage_1.dw_contacto_lista.accepttext()
			if tab_1.tabpage_1.dw_contacto_lista.update() = 1 then
				commit using sqlca;
				messagebox("Grabar","Grabación Exitosa se Generó Requerimiento N° "+string(ll_num_reclamo,'###,###,###,##0'))
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Actualizar Web Contactos SQL: "+sqlca.sqlerrtext)
			end if					
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error Grabar Solicitud Detalle SQL: "+sqlca.sqlerrtext)
		end if
	else
		rollback using sqlca;
		messagebox("Error Grabar","Error Grabar Solicitud SQL: "+sqlca.sqlerrtext)
	end if
end if
end subroutine

on w_administrar_reclamos.create
this.cb_reasignar=create cb_reasignar
this.cb_reemplazar_usuario=create cb_reemplazar_usuario
this.pb_filtrar_tit=create pb_filtrar_tit
this.em_mat_tit=create em_mat_tit
this.em_pat_tit=create em_pat_tit
this.st_ap_mat=create st_ap_mat
this.st_pat_tit=create st_pat_tit
this.em_nom_tit=create em_nom_tit
this.st_nom_tit=create st_nom_tit
this.st_titular=create st_titular
this.dwe_ticket=create dwe_ticket
this.pb_ok=create pb_ok
this.cb_ctacte=create cb_ctacte
this.cb_anular=create cb_anular
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.st_busqueda=create st_busqueda
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.p_inicio=create p_inicio
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_termino=create p_termino
this.gb_periodo=create gb_periodo
this.gb_3=create gb_3
this.dw_parque=create dw_parque
this.tab_1=create tab_1
this.cb_detalle_gestion=create cb_detalle_gestion
this.cb_gestionar=create cb_gestionar
this.Control[]={this.cb_reasignar,&
this.cb_reemplazar_usuario,&
this.pb_filtrar_tit,&
this.em_mat_tit,&
this.em_pat_tit,&
this.st_ap_mat,&
this.st_pat_tit,&
this.em_nom_tit,&
this.st_nom_tit,&
this.st_titular,&
this.dwe_ticket,&
this.pb_ok,&
this.cb_ctacte,&
this.cb_anular,&
this.em_ctto,&
this.pb_buscar,&
this.st_busqueda,&
this.cb_cerrar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.p_inicio,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_termino,&
this.gb_periodo,&
this.gb_3,&
this.dw_parque,&
this.tab_1,&
this.cb_detalle_gestion,&
this.cb_gestionar}
end on

on w_administrar_reclamos.destroy
destroy(this.cb_reasignar)
destroy(this.cb_reemplazar_usuario)
destroy(this.pb_filtrar_tit)
destroy(this.em_mat_tit)
destroy(this.em_pat_tit)
destroy(this.st_ap_mat)
destroy(this.st_pat_tit)
destroy(this.em_nom_tit)
destroy(this.st_nom_tit)
destroy(this.st_titular)
destroy(this.dwe_ticket)
destroy(this.pb_ok)
destroy(this.cb_ctacte)
destroy(this.cb_anular)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.st_busqueda)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.p_inicio)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_termino)
destroy(this.gb_periodo)
destroy(this.gb_3)
destroy(this.dw_parque)
destroy(this.tab_1)
destroy(this.cb_detalle_gestion)
destroy(this.cb_gestionar)
end on

event open;long	ll_mes,ll_ano,ll_nivel,ll_cod_parque

gf_centrar(w_administrar_reclamos)
dw_parque.dataobject 											= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dwe_ticket.settransobject(sqlca)
dw_parque.insertrow(0)
dw_parque.insertrow(0)
SELECT 	"ENCARGADOS"."COD_PARQUE"  
INTO 		:ll_cod_parque 
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
if ll_cod_parque = 9999 then
	dw_parque.setitem(1,'parque',ll_cod_parque)
else
	if gs_conexion = "Parque El Prado" then
		dw_parque.setitem(1,'parque',1)
	elseif gs_conexion = "Parque La Foresta" then
		dw_parque.setitem(1,'parque',11)
	elseif gs_conexion = "Parque Concepción" then
		dw_parque.setitem(1,'parque',801)
	end if
end if
dw_parque.accepttext()
il_grabar																= 0
tab_1.tabpage_1.dw_contacto_lista.dataobject 			= 'dw_web_contacto_lista'
tab_1.tabpage_1.dw_contacto_lista.settransobject(sqlca)
tab_1.tabpage_1.dw_contacto_detalle.dataobject 			= 'dw_web_contacto_detalle'
tab_1.tabpage_1.dw_contacto_detalle.settransobject(sqlca)

tab_1.tabpage_2.dw_reclamos_rechazo.dataobject 		= 'dw_asignacion_reclamo_lista_rechazo'
tab_1.tabpage_2.dw_reclamos_rechazo.settransobject(sqlca)

tab_1.tabpage_3.dw_asigna_lista.dataobject 				= 'dw_asignacion_reclamo_lista'
tab_1.tabpage_3.dw_asigna_lista.settransobject(sqlca)
tab_1.tabpage_3.dw_asigna_detalle.dataobject 			= 'dw_asignacion_reclamo_detalle'
tab_1.tabpage_3.dw_asigna_detalle.settransobject(sqlca)
ll_mes																= month(date(gdt_fec_sistema))
ll_ano																	= year(date(gdt_fec_sistema))
em_inicio.text														= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
em_termino.text													= string(gdt_fec_sistema,"dd/mm/yyyy")
gb_periodo.visible													= false
st_desde.visible													= false
em_inicio.visible													= false
p_inicio.visible														= false
st_hasta.visible														= false
em_termino.visible												= false
p_termino.visible													= false
cb_anular.visible													= false
//tab_1.tabpage_3.cb_publico.visible							= false
st_titular.visible														= false
st_nom_tit.visible													= false
em_nom_tit.visible													= false
st_pat_tit.visible													= false
em_pat_tit.visible													= false
st_ap_mat.visible													= false
em_mat_tit.visible													= false
pb_filtrar_tit.visible												= false
em_nom_tit.text													= ''
em_pat_tit.text														= ''
em_mat_tit.text													= ''
if gs_depto='I' then
	cb_reemplazar_usuario.visible								= True
else
	cb_reemplazar_usuario.visible								= False
end if
SELECT	"NIVEL_RECLAMO"
INTO		:ll_nivel
FROM		"ENCARGADOS"  
WHERE "ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;
if sqlca.sqlcode=0 then
end if
if gs_depto='I' or ll_nivel=2 then
	cb_anular.visible												= true
end if
if gs_depto='P' then
	tab_1.tabpage_3.cb_publico.visible						= true
	tab_1.tabpage_2.visible										= true
end if
end event

type cb_reasignar from commandbutton within w_administrar_reclamos
integer x = 1737
integer y = 56
integer width = 443
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ReAsignar Ticket"
end type

event clicked;Long		ll_fila,ll_folio,ll_cod_gestion

if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount() > 0 then
	ll_fila					= tab_1.tabpage_2.dw_reclamos_rechazo.getrow()
	ll_folio				= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_fila,'numero_reclamo')
	ll_cod_gestion		= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_fila,'ult_estado_gestion')
	if (ll_folio > 0 and (ll_cod_gestion = 5 or ll_cod_gestion = 3)) then
		if isvalid(w_ingreso_observacion_termino) then close(w_ingreso_observacion_termino)
		OpenWithParm(w_ingreso_observacion_termino, string(ll_folio)+'~t'+string(ll_cod_gestion))
	else
		messagebox("Advertencia","Recuerde Ultimo Estado Gestión debe estar Codigo 5 o 3")
	end if
end if
end event

type cb_reemplazar_usuario from commandbutton within w_administrar_reclamos
integer x = 1198
integer y = 56
integer width = 526
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reemplazar Usuario"
end type

event clicked;if isvalid(w_reemplazo_usuario_requerimiento) then close(w_reemplazo_usuario_requerimiento)
openwithparm(w_reemplazo_usuario_requerimiento,gs_depto)
end event

type pb_filtrar_tit from picturebutton within w_administrar_reclamos
integer x = 3433
integer y = 220
integer width = 101
integer height = 76
integer taborder = 100
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
alignment htextalign = right!
end type

event clicked;String		ls_filtro,ls_nom,ls_pat,ls_mat
Long		ll_largo_nom,ll_largo_pat,ll_largo_mat

ls_nom			= trim(em_nom_tit.text)
ll_largo_nom	= len(ls_nom)
ls_pat				= trim(em_pat_tit.text)
ll_largo_pat		= len(ls_pat)
ls_mat			= trim(em_mat_tit.text)
ll_largo_mat		= len(ls_mat)
if ll_largo_nom=0 then setnull(ls_nom)
if ll_largo_pat=0 then setnull(ls_pat)
if ll_largo_mat=0 then setnull(ls_mat)
if not isnull(ls_nom) and not isnull(ls_pat) and not isnull(ls_mat) then
	ls_filtro		= " ult_estado_gestion <= 12 and mid( cliente_nombre,1,"+string(ll_largo_nom)+") = '"+ls_nom+"' and mid(cliente_a_paterno,1,"+string(ll_largo_pat)+") = '"+ls_pat+"' and  mid( cliente_a_materno,1,"+string(ll_largo_mat)+")= '"+ls_mat+"'"
elseif not isnull(ls_nom) and not isnull(ls_pat) and isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( cliente_nombre,1,"+string(ll_largo_nom)+") = '"+ls_nom+"' and mid(cliente_a_paterno,1,"+string(ll_largo_pat)+") = '"+ls_pat+"'"
elseif not isnull(ls_nom) and isnull(ls_pat) and isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( cliente_nombre,1,"+string(ll_largo_nom)+") = '"+ls_nom+"'"
elseif not isnull(ls_nom) and isnull(ls_pat) and not isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( nombre_titular,1,"+string(ll_largo_nom)+") = '"+ls_nom+"' and  mid(cliente_a_materno,1,"+string(ll_largo_mat)+")= '"+ls_mat+"'"
elseif isnull(ls_nom) and not isnull(ls_pat) and not isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( cliente_a_paterno,1,"+string(ll_largo_pat)+") = '"+ls_pat+"' and  mid( cliente_a_materno,1,"+string(ll_largo_mat)+")= '"+ls_mat+"'"
elseif isnull(ls_nom) and not isnull(ls_pat) and isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( cliente_a_paterno,1,"+string(ll_largo_pat)+") = '"+ls_pat+"'"
elseif isnull(ls_nom) and isnull(ls_pat) and not isnull(ls_mat) then
	ls_filtro		= "ult_estado_gestion <= 12 and mid( cliente_a_materno,1,"+string(ll_largo_mat)+")= '"+ls_mat+"'"
else
	ls_filtro		= "ult_estado_gestion <= 12"
end if
tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
tab_1.tabpage_3.dw_asigna_lista.filter()
if tab_1.tabpage_3.dw_asigna_lista.rowcount() = 0 then
	messagebox("Advertencia","No Registra Dato")
end if
end event

type em_mat_tit from editmask within w_administrar_reclamos
integer x = 3081
integer y = 216
integer width = 334
integer height = 80
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_pat_tit from editmask within w_administrar_reclamos
integer x = 2446
integer y = 216
integer width = 334
integer height = 80
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_ap_mat from statictext within w_administrar_reclamos
integer x = 2784
integer y = 228
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Materno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_pat_tit from statictext within w_administrar_reclamos
integer x = 2153
integer y = 228
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_nom_tit from editmask within w_administrar_reclamos
integer x = 1824
integer y = 216
integer width = 334
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type st_nom_tit from statictext within w_administrar_reclamos
integer x = 1614
integer y = 228
integer width = 201
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_titular from statictext within w_administrar_reclamos
integer x = 1280
integer y = 236
integer width = 329
integer height = 60
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar * Titular"
alignment alignment = right!
boolean focusrectangle = false
end type

type dwe_ticket from datawindow within w_administrar_reclamos
boolean visible = false
integer x = 2409
integer y = 2068
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_imprimir_ticket"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_ok from picturebutton within w_administrar_reclamos
integer x = 942
integer y = 28
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_contacto_lista.reset()
tab_1.tabpage_1.dw_contacto_detalle.reset()
tab_1.tabpage_3.dw_asigna_lista.reset()
tab_1.tabpage_3.dw_asigna_detalle.reset()
em_nom_tit.text	= ''
em_pat_tit.text		= ''
em_mat_tit.text	= ''
il_grabar				= 0
 tab_1.triggerevent(clicked!)
end event

type cb_ctacte from commandbutton within w_administrar_reclamos
integer x = 928
integer y = 1948
integer width = 416
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_rut_titular,ll_rut_cotizante,ll_row2
String		ls_nom

if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
if isvalid(w_listado_contratos) then close(w_listado_contratos)
if tab_1.selectedtab=1 then
	if tab_1.tabpage_1.dw_contacto_lista.rowcount() > 0 then
		ll_rut_titular					= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_titular')
		ll_rut_cotizante				= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
		if ll_rut_titular > 0 then
			SELECT	"CLIENTE"."NOMBRE"  
			INTO 		:ls_nom  
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut_titular   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				gi_rut 					= ll_rut_titular
				gi_tipo_busqueda		= 1
				Open(w_listado_contratos)
	
			else
				if ll_rut_cotizante > 0 then
					SELECT	"CLIENTE"."NOMBRE"  
					INTO 		:ls_nom  
					FROM 	"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut_cotizante   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						gi_rut 				= ll_rut_cotizante
						gi_tipo_busqueda	= 1
						Open(w_listado_contratos)
					end if
				end if
			end if
		end if
	end if
elseif tab_1.selectedtab=2 then
	ll_row2							= tab_1.tabpage_2.dw_reclamos_rechazo.getrow()
	if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount() > 0 then
		ll_rut_titular					= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_row2,'rut_titular')
		ll_rut_cotizante				= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_row2,'rut_cotizante')
		if ll_rut_titular > 0 then
			SELECT	"CLIENTE"."NOMBRE"  
			INTO 		:ls_nom  
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut_titular   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				gi_rut 					= ll_rut_titular
				gi_tipo_busqueda		= 1
				Open(w_listado_contratos)
	
			else
				if ll_rut_cotizante > 0 then
					SELECT	"CLIENTE"."NOMBRE"  
					INTO 		:ls_nom  
					FROM 	"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut_cotizante   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						gi_rut 				= ll_rut_cotizante
						gi_tipo_busqueda	= 1
						Open(w_listado_contratos)
					end if
				end if
			end if
		end if
	end if
elseif tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then
		ll_rut_titular					= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'rut_titular')
		ll_rut_cotizante				= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'rut_contacto')
		if ll_rut_titular > 0 then
			SELECT	"CLIENTE"."NOMBRE"  
			INTO 		:ls_nom  
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut_titular   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				gi_rut 					= ll_rut_titular
				gi_tipo_busqueda		= 1
				Open(w_listado_contratos)
			else
				if ll_rut_cotizante > 0 then
					SELECT	"CLIENTE"."NOMBRE"  
					INTO 		:ls_nom  
					FROM 	"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut_cotizante   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						gi_rut 				= ll_rut_cotizante
						gi_tipo_busqueda	= 1
						Open(w_listado_contratos)
					end if
				end if
			end if
		end if
	end if
end if
end event

type cb_anular from commandbutton within w_administrar_reclamos
boolean visible = false
integer x = 699
integer y = 1948
integer width = 229
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;Long		ll_reclamo,ll_fila,ll_res,ll_rut_contacto
String		ls_estado

if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then
	ll_fila				= tab_1.tabpage_3.dw_asigna_lista.getrow()
	if ll_fila > 0 then
		ll_reclamo	= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_fila,'numero_reclamo')
		ls_estado	= tab_1.tabpage_3.dw_asigna_lista.getitemstring(ll_fila,'cod_estado_reg')
		if ll_reclamo > 0 and ls_estado='V' then
			ll_res		= messagebox("Advertencia","Está seguro(a) Anular Requerimiento Nº  "+string(ll_reclamo,'###,###,###,###'),Exclamation!,YesNo!,2)
			if ll_res = 1 then
				tab_1.tabpage_3.dw_asigna_lista.setitem(ll_fila,'cod_estado_reg','A')
				tab_1.tabpage_3.dw_asigna_lista.accepttext()
				if tab_1.tabpage_3.dw_asigna_lista.update()=1 then
					commit;
					messagebox("Anular","Anulación Exitosa")
				else
					rollback;
					messagebox("Error Anular","Error al Anular SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			messagebox("Advertencia","Recuerde Requerimiento debe estar V - VIGENTE")
		end if
	end if	
elseif tab_1.tabpage_1.dw_contacto_lista.rowcount() > 0 then
	ll_fila					= tab_1.tabpage_1.dw_contacto_lista.getrow()
	if ll_fila > 0 then
		ll_rut_contacto	= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(ll_fila,'rut_cotizante')
		ls_estado		= tab_1.tabpage_1.dw_contacto_lista.getitemstring(ll_fila,'estado_asigna')
		if ll_rut_contacto > 0 and ls_estado<>'I' then
			ll_res			= messagebox("Advertencia","Está seguro(a) Inactivar Fila Nº  "+string(ll_fila,'###,###,###,###')+" Rut Contacto Nº "+string(ll_rut_contacto,'###,###,###,###,###'),Exclamation!,YesNo!,2)
			if ll_res = 1 then
				tab_1.tabpage_1.dw_contacto_lista.setitem(ll_fila,'estado_asigna','I')
				tab_1.tabpage_1.dw_contacto_lista.accepttext()
				if tab_1.tabpage_1.dw_contacto_lista.update()=1 then
					commit;
					messagebox("Anular","Anulación Exitosa")
				else
					rollback;
					messagebox("Error Anular","Error al Anular SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			messagebox("Advertencia","Recuerde Requerimiento debe estar A-ASIGNADA o N-NO ASIGNADA")
		end if
	end if	
end if
end event

type em_ctto from editmask within w_administrar_reclamos
integer x = 2702
integer y = 1956
integer width = 375
integer height = 92
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if Double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_administrar_reclamos
integer x = 3081
integer y = 1956
integer width = 101
integer height = 88
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string
Double	ll_numero

if tab_1.selectedtab=1 then	
	ll_tot_reg						= tab_1.tabpage_1.dw_contacto_lista.rowcount()
	if ll_tot_reg>0 then
		if st_busqueda.text 		= 'Rut Contacto' then
			ll_numero				= Double(em_ctto.text)
			ls_string					= "rut_cotizante = "+string(ll_numero)
			ll_fila 						= tab_1.tabpage_1.dw_contacto_lista.find(ls_string, 1, ll_tot_reg)
			if ll_fila>0 then
				tab_1.tabpage_1.dw_contacto_lista.scrolltorow(ll_fila)
				tab_1.tabpage_1.dw_contacto_lista.SelectRow(ll_fila, true)
			else
				messagebox("Advertencia","Nº Rut No Existe en Lista")
				tab_1.tabpage_1.dw_contacto_lista.scrolltorow(1)
			end if
		end if
	end if
elseif tab_1.selectedtab=2 then	
	ll_tot_reg						= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg>0 then
		if st_busqueda.text 		= 'Rut Contacto' then
			ll_numero				= Double(em_ctto.text)
			ls_string					= "rut_cotizante = "+string(ll_numero)
			ll_fila 						= tab_1.tabpage_2.dw_reclamos_rechazo.find(ls_string, 1, ll_tot_reg)
			if ll_fila>0 then
				tab_1.tabpage_2.dw_reclamos_rechazo.scrolltorow(ll_fila)
				tab_1.tabpage_2.dw_reclamos_rechazo.SelectRow(ll_fila, true)
			else
				messagebox("Advertencia","Nº Rut No Existe en Lista")
				tab_1.tabpage_2.dw_reclamos_rechazo.scrolltorow(1)
			end if
		end if
	end if
elseif tab_1.selectedtab=3 then
	ll_tot_reg						= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg>0 then
		if st_busqueda.text 		= 'Rut Contacto' then
			ll_numero				= Double(em_ctto.text)
			ls_string					= "rut_contacto = "+string(ll_numero)
			ll_fila 						= tab_1.tabpage_3.dw_asigna_lista.find(ls_string, 1, ll_tot_reg)
			if ll_fila>0 then
				tab_1.tabpage_3.dw_asigna_lista.scrolltorow(ll_fila)
				tab_1.tabpage_3.dw_asigna_lista.SelectRow(ll_fila, true)
			else
				messagebox("Advertencia","Nº Rut No Existe en Lista")
				tab_1.tabpage_3.dw_asigna_lista.scrolltorow(1)
			end if
		elseif st_busqueda.text 	= 'N° Requerimiento' then
			ll_numero				= Double(em_ctto.text)
			ls_string					= "numero_reclamo = "+string(ll_numero)
			ll_fila 						= tab_1.tabpage_3.dw_asigna_lista.find(ls_string, 1, ll_tot_reg)
			if ll_fila>0 then
				tab_1.tabpage_3.dw_asigna_lista.scrolltorow(ll_fila)
				tab_1.tabpage_3.dw_asigna_lista.SelectRow(ll_fila, true)
			else
				messagebox("Advertencia","Nº Requerimiento No Existe en Lista")
				tab_1.tabpage_3.dw_asigna_lista.scrolltorow(1)
			end if
		end if
	end if
end if
end event

type st_busqueda from statictext within w_administrar_reclamos
integer x = 2304
integer y = 1972
integer width = 384
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Requerimiento"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_administrar_reclamos
integer x = 3259
integer y = 1940
integer width = 293
integer height = 112
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_administrar_reclamos)
end event

type cb_imprimir from commandbutton within w_administrar_reclamos
integer x = 2043
integer y = 1956
integer width = 224
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.selectedtab=1 then
	if tab_1.tabpage_1.dw_contacto_lista.rowcount() > 0 then f_Print( tab_1.tabpage_1.dw_contacto_lista )
elseif tab_1.selectedtab=2 then
	if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount() > 0 then f_Print( tab_1.tabpage_2.dw_reclamos_rechazo)
elseif tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then f_Print( tab_1.tabpage_3.dw_asigna_lista)
end if

end event

type cb_exportar from commandbutton within w_administrar_reclamos
integer x = 1371
integer y = 1956
integer width = 224
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso

if tab_1.selectedtab=1 then
	dw_paso	= tab_1.tabpage_1.dw_contacto_lista
	if tab_1.tabpage_1.dw_contacto_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
elseif tab_1.selectedtab=2 then
	dw_paso	= tab_1.tabpage_2.dw_reclamos_rechazo
	if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount() > 0 then f_DWToExcel( dw_paso )
elseif tab_1.selectedtab=3 then
	dw_paso	= tab_1.tabpage_3.dw_asigna_lista
	if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end if
end event

type cb_filtrar from commandbutton within w_administrar_reclamos
integer x = 1595
integer y = 1956
integer width = 224
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo
long	ll_tot_reg

setnull (ls_nulo)
if tab_1.selectedtab=1 then
	ll_tot_reg					= tab_1.tabpage_1.dw_contacto_lista.rowcount()
	tab_1.tabpage_1.dw_contacto_lista.setfilter(ls_nulo)
	tab_1.tabpage_1.dw_contacto_lista.filter()
elseif tab_1.selectedtab=2 then
	ll_tot_reg					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_nulo)
	tab_1.tabpage_2.dw_reclamos_rechazo.filter()
elseif tab_1.selectedtab=3 then
	ll_tot_reg					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_nulo)
	tab_1.tabpage_3.dw_asigna_lista.filter()
end if

end event

type cb_ordenar from commandbutton within w_administrar_reclamos
integer x = 1819
integer y = 1956
integer width = 224
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string ls_nulo
long	ll_tot_reg
setnull (ls_nulo)

if tab_1.selectedtab=1 then
	ll_tot_reg					= tab_1.tabpage_1.dw_contacto_lista.rowcount()
	if ll_tot_reg > 0 then 
		tab_1.tabpage_1.dw_contacto_lista.setsort(ls_nulo)
		tab_1.tabpage_1.dw_contacto_lista.sort()
	end if
elseif tab_1.selectedtab=2 then
	ll_tot_reg					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg > 0 then 
		tab_1.tabpage_2.dw_reclamos_rechazo.setsort(ls_nulo)
		tab_1.tabpage_2.dw_reclamos_rechazo.sort()
	end if
elseif tab_1.selectedtab=3 then
	ll_tot_reg					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg > 0 then 
		tab_1.tabpage_3.dw_asigna_lista.setsort(ls_nulo)
		tab_1.tabpage_3.dw_asigna_lista.sort()
	end if
end if
end event

type p_inicio from picture within w_administrar_reclamos
boolean visible = false
integer x = 2798
integer y = 80
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if tab_1.selectedtab=3 then
	tab_1.tabpage_3.dw_asigna_lista.reset()
	tab_1.tabpage_3.dw_asigna_detalle.reset()
	if f_valida_fecha(em_inicio.text)=-1 then 
		em_inicio.text					= string(today(),gs_formato_fecha)
		em_inicio.setfocus()
		return
	end if	
	if em_inicio.text<>'00/00/0000' then
		ls_fecha 							= em_inicio.text
	else
		ls_fecha 							= string(today(),gs_formato_fecha)
	end if	
	OpenWithParm(w_calendar,ls_fecha)
	if Message.StringParm <> ls_fecha THEN
		em_inicio.text = Message.StringParm
	end if
end if
end event

type st_hasta from statictext within w_administrar_reclamos
boolean visible = false
integer x = 2898
integer y = 92
integer width = 146
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_inicio from editmask within w_administrar_reclamos
boolean visible = false
integer x = 2450
integer y = 84
integer width = 343
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;if tab_1.selectedtab=3 then
	tab_1.tabpage_3.dw_asigna_lista.reset()
	tab_1.tabpage_3.dw_asigna_detalle.reset()
end if
end event

type em_termino from editmask within w_administrar_reclamos
boolean visible = false
integer x = 3067
integer y = 84
integer width = 357
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;if tab_1.selectedtab=3 then
	tab_1.tabpage_3.dw_asigna_lista.reset()
	tab_1.tabpage_3.dw_asigna_detalle.reset()
end if
end event

type st_desde from statictext within w_administrar_reclamos
boolean visible = false
integer x = 2258
integer y = 96
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_termino from picture within w_administrar_reclamos
boolean visible = false
integer x = 3429
integer y = 80
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if tab_1.selectedtab=3 then
	tab_1.tabpage_3.dw_asigna_lista.reset()
	tab_1.tabpage_3.dw_asigna_detalle.reset()
	if f_valida_fecha(em_inicio.text)=-1 then 
		em_inicio.text					= string(today(),gs_formato_fecha)
		em_inicio.setfocus()
		return
	end if	
	if em_inicio.text<>'00/00/0000' then
		ls_fecha 							= em_inicio.text
	else
		ls_fecha 							= string(today(),gs_formato_fecha)
	end if	
	OpenWithParm(w_calendar,ls_fecha)
	if Message.StringParm <> ls_fecha THEN
		em_inicio.text = Message.StringParm
	end if
end if
end event

type gb_periodo from groupbox within w_administrar_reclamos
boolean visible = false
integer x = 2240
integer y = 24
integer width = 1307
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type gb_3 from groupbox within w_administrar_reclamos
integer x = 1353
integer y = 1908
integer width = 937
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_parque from datawindow within w_administrar_reclamos
integer x = 46
integer y = 52
integer width = 887
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna

ls_columna		= dwo.name
if ls_columna='parque' then
	tab_1.tabpage_1.dw_contacto_lista.reset()
	tab_1.tabpage_1.dw_contacto_detalle.reset()
	tab_1.tabpage_3.dw_asigna_lista.reset()
	tab_1.tabpage_3.dw_asigna_detalle.reset()
	il_grabar			= 0
	 tab_1.triggerevent(clicked!)
end if
end event

type tab_1 from tab within w_administrar_reclamos
event destro ( )
event creat ( )
integer x = 37
integer y = 216
integer width = 3525
integer height = 1700
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

event destro();destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end event

event creat();this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end event

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event clicked;string		ls_nivel,ls_cod_geren,ls_nivel_02,ls_nivel_03
long		ll_tot_reg,ll_cod_parque,ll_indi,ll_nro_reclamo
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha_comp,ldt_nulo

Setnull(ldt_nulo)
dw_parque.accepttext()
ll_cod_parque									= dw_parque.getitemnumber(1,'parque')
em_ctto.text										= ''
st_titular.visible									= false
st_nom_tit.visible								= false
em_nom_tit.visible								= false
st_pat_tit.visible								= false
em_pat_tit.visible								= false
st_ap_mat.visible								= false
em_mat_tit.visible								= false
pb_filtrar_tit.visible							= false
cb_reasignar.visible							= false
if not isnull(ll_cod_parque) and ll_cod_parque>0 then
	if tab_1.selectedtab=1 then
		cb_anular.enabled						= true
		st_busqueda.text						= 'Rut Contacto'
		gb_periodo.visible						= false
		st_desde.visible						= false
		em_inicio.visible						= false
		p_inicio.visible							= false
		st_hasta.visible							= false
		em_termino.visible					= false
		p_termino.visible						= false
		ll_tot_reg								= tab_1.tabpage_1.dw_contacto_lista.retrieve(ll_cod_parque,'N',gs_user)
		cb_detalle_gestion.visible			= false
		if gs_depto<>'I' then
			cb_gestionar.enabled				= false
			cb_anular.enabled					= false
		end if
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos Web")
		end if
	elseif tab_1.selectedtab=2 then
		cb_reasignar.visible					= true
//		tab_1.tabpage_2.dw_reclamos_rechazo.dataobject 		= 'dw_asignacion_reclamo_lista_rechazo'
//		tab_1.tabpage_2.dw_reclamos_rechazo.settransobject(sqlca)
		
		gb_periodo.visible						= true
		st_desde.visible						= true
		em_inicio.visible						= true
		p_inicio.visible							= true
		st_hasta.visible							= true
		em_termino.visible					= true
		p_termino.visible						= true
		cb_detalle_gestion.visible			= true
		cb_gestionar.enabled					= false
		cb_anular.enabled						= false
		st_titular.visible							= true
		st_nom_tit.visible						= true
		em_nom_tit.visible						= true
		st_pat_tit.visible						= true
		em_pat_tit.visible						= true
		st_ap_mat.visible						= true
		em_mat_tit.visible						= true
		pb_filtrar_tit.visible					= true
		if tab_1.tabpage_3.rb_requerimiento.checked=true then
			st_busqueda.text					= 'N° Requerimiento'
		elseif tab_1.tabpage_3.rb_rut_contacto.checked=true then
			st_busqueda.text					= 'Rut Contacto'
		end if
		ldt_fec_ini								= datetime(date(em_inicio.text),time('00:00:00'))
		ldt_fec_fin								= datetime(date(em_termino.text),time('23:59:59'))
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Fecha Inicio No Puede ser Mayor a Fecha Término")
		else
			tab_1.tabpage_2.dw_reclamos_rechazo.retrieve(ll_cod_parque,ldt_fec_ini,ldt_fec_fin,gs_depto,gs_user)
//			ll_tot_reg							= f_nivel_codigo(ll_cod_parque,ldt_fec_ini,ldt_fec_fin)
//			if ll_tot_reg=0 then
//				messagebox("Advertencia","No Registra Datos Asigandos")
//			else
//				for ll_indi=1 to ll_tot_reg
//					ll_nro_reclamo				= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_indi,'numero_reclamo')
//					ldt_fecha_comp			= f_calcular_dias_reclamo( ll_nro_reclamo )
//					if isnull(ldt_fecha_comp) or ldt_fecha_comp = datetime(date('01/01/1901'),time('00:00:00')) then
//						tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_nulo)
//					else
//						tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_fecha_comp)
//					end if
//				next
//				tab_1.tabpage_3.dw_asigna_lista.accepttext()
//			end if
		end if
	elseif tab_1.selectedtab=3 then
		cb_anular.enabled						= true
		gb_periodo.visible						= true
		st_desde.visible						= true
		em_inicio.visible						= true
		p_inicio.visible							= true
		st_hasta.visible							= true
		em_termino.visible					= true
		p_termino.visible						= true
		cb_detalle_gestion.visible			= true
		cb_gestionar.enabled					= true
		cb_anular.enabled						= true
		st_titular.visible							= true
		st_nom_tit.visible						= true
		em_nom_tit.visible						= true
		st_pat_tit.visible						= true
		em_pat_tit.visible						= true
		st_ap_mat.visible						= true
		em_mat_tit.visible						= true
		pb_filtrar_tit.visible					= true
		if tab_1.tabpage_3.rb_requerimiento.checked=true then
			st_busqueda.text					= 'N° Requerimiento'
		elseif tab_1.tabpage_3.rb_rut_contacto.checked=true then
			st_busqueda.text					= 'Rut Contacto'
		end if
		ldt_fec_ini								= datetime(date(em_inicio.text),time('00:00:00'))
		ldt_fec_fin								= datetime(date(em_termino.text),time('23:59:59'))
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Fecha Inicio No Puede ser Mayor a Fecha Término")
		else
			ll_tot_reg							= f_nivel_codigo(ll_cod_parque,ldt_fec_ini,ldt_fec_fin)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Datos Asigandos")
			else
				for ll_indi=1 to ll_tot_reg
					ll_nro_reclamo				= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_indi,'numero_reclamo')
					ldt_fecha_comp			= f_calcular_dias_reclamo( ll_nro_reclamo )
					if isnull(ldt_fecha_comp) or ldt_fecha_comp = datetime(date('01/01/1901'),time('00:00:00')) then
						tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_nulo)
					else
						tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_fecha_comp)
					end if
				next
				tab_1.tabpage_3.dw_asigna_lista.accepttext()
			end if
		end if
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque a Consultar")
		dw_parque.setfocus()
	end if	
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3488
integer height = 1580
long backcolor = 67108864
string text = "Web Contactos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_contacto_detalle dw_contacto_detalle
dw_contacto_lista dw_contacto_lista
end type

on tabpage_1.create
this.dw_contacto_detalle=create dw_contacto_detalle
this.dw_contacto_lista=create dw_contacto_lista
this.Control[]={this.dw_contacto_detalle,&
this.dw_contacto_lista}
end on

on tabpage_1.destroy
destroy(this.dw_contacto_detalle)
destroy(this.dw_contacto_lista)
end on

type dw_contacto_detalle from datawindow within tabpage_1
integer x = 14
integer y = 996
integer width = 3442
integer height = 576
integer taborder = 30
string title = "none"
string dataobject = "dw_web_contacto_detalle"
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna,ls_tipo_contacto

ls_columna						= dwo.name
if ls_columna = 't_grabar' then
	if il_grabar > 0 then
		if dw_contacto_detalle.update()= 1 then
			commit;
			ls_tipo_contacto	= dw_contacto_detalle.getitemstring(1,'tipo_contacto')
			dw_contacto_lista.setitem(il_row1,'tipo_contacto',ls_tipo_contacto)
			il_grabar				= 0
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error al Actualizar Tipo Solicitud SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

event itemchanged;String	ls_columna

ls_columna	= dwo.name
if ls_columna='tipo_contacto'  or ls_columna='asunto' then il_grabar ++
this.accepttext()
end event

type dw_contacto_lista from datawindow within tabpage_1
integer x = 14
integer y = 28
integer width = 3447
integer height = 960
integer taborder = 20
string title = "none"
string dataobject = "dw_web_contacto_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_campo_ord
long	ll_cod_parque,ll_rut,ll_tot_reg
datetime	ldt_fecha

ls_columna																							= dwo.name
dw_parque.accepttext()
if row>0 then
	il_row1																							= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row1, TRUE)
	ll_cod_parque																					= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')
	ll_rut																								= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
	ldt_fecha																							= tab_1.tabpage_1.dw_contacto_lista.getitemdatetime(il_row1,'fecha')
	ll_tot_reg																						= tab_1.tabpage_1.dw_contacto_detalle.retrieve(ll_cod_parque,ll_rut,ldt_fecha)
else
	if ls_columna='rut_contacto_web_t' then
		ls_campo_ord																				= 'rut_cotizante'
		em_ctto.text																					= ''
		tab_1.tabpage_1.dw_contacto_lista.Object.rut_contacto_web_t.border		= 5
		tab_1.tabpage_1.dw_contacto_lista.SETSORT(ls_campo_ord)
		tab_1.tabpage_1.dw_contacto_lista.SORT()
		st_busqueda.text																			= 'Rut Contacto'
	elseif ls_columna='t_asig_color' or ls_columna='t_asig' then
		ll_tot_reg																					= tab_1.tabpage_1.dw_contacto_lista.retrieve(ll_cod_parque,'A',gs_user)
		if ll_tot_reg>0 then
			ll_cod_parque																			= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')
			ll_rut																						= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
			ldt_fecha																					= tab_1.tabpage_1.dw_contacto_lista.getitemdatetime(il_row1,'fecha')
			ll_tot_reg																				= tab_1.tabpage_1.dw_contacto_detalle.retrieve(ll_cod_parque,ll_rut,ldt_fecha)
		else
			messagebox("Advertencia","No Regista Contactos sin Asignar")
			tab_1.tabpage_1.dw_contacto_detalle.reset()
		end if
	elseif ls_columna='t_no_asig_color' or  ls_columna='t_no_asig' then
		ll_tot_reg																					= tab_1.tabpage_1.dw_contacto_lista.retrieve(ll_cod_parque,'N',gs_user)
		if ll_tot_reg>0 then
			ll_cod_parque																			= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')
			ll_rut																						= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
			ldt_fecha																					= tab_1.tabpage_1.dw_contacto_lista.getitemdatetime(il_row1,'fecha')
			ll_tot_reg																				= tab_1.tabpage_1.dw_contacto_detalle.retrieve(ll_cod_parque,ll_rut,ldt_fecha)
		else
			messagebox("Advertencia","No Regista Contactos sin Asignar")
			tab_1.tabpage_1.dw_contacto_detalle.reset()
		end if
	elseif ls_columna='t_inactivo_color' or ls_columna='t_inactivo' then
		ll_tot_reg																					= tab_1.tabpage_1.dw_contacto_lista.retrieve(ll_cod_parque,'I',gs_user)
		if ll_tot_reg>0 then
			ll_cod_parque																			= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')
			ll_rut																						= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
			ldt_fecha																					= tab_1.tabpage_1.dw_contacto_lista.getitemdatetime(il_row1,'fecha')
			ll_tot_reg																				= tab_1.tabpage_1.dw_contacto_detalle.retrieve(ll_cod_parque,ll_rut,ldt_fecha)
		else
			messagebox("Advertencia","No Regista Contactos Inactivos")
			tab_1.tabpage_1.dw_contacto_detalle.reset()
		end if
	elseif ls_columna='t_todo' then
		ll_cod_parque							= dw_parque.getitemnumber(1,'parque')
		ll_tot_reg								= tab_1.tabpage_1.dw_contacto_lista.retrieve(ll_cod_parque,'N',gs_user)
		cb_detalle_gestion.visible			= false
		if gs_depto<>'I' then
//			cb_gestionar.enabled				= false
		end if
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
end if
end event

event rowfocuschanged;string		ls_columna
long		ll_cod_parque,ll_rut,ll_tot_reg
datetime	ldt_fecha

if getrow() > 0 then
	il_row1				= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row1, TRUE)
	ll_cod_parque		= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'cod_parque')
	ll_rut					= tab_1.tabpage_1.dw_contacto_lista.getitemnumber(il_row1,'rut_cotizante')
	ldt_fecha				= tab_1.tabpage_1.dw_contacto_lista.getitemdatetime(il_row1,'fecha')
	ll_tot_reg			= tab_1.tabpage_1.dw_contacto_detalle.retrieve(ll_cod_parque,ll_rut,ldt_fecha)
end if


end event

type tabpage_2 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 104
integer width = 3488
integer height = 1580
long backcolor = 67108864
string text = "Rechazos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_reclamos_rechazo dw_reclamos_rechazo
end type

on tabpage_2.create
this.dw_reclamos_rechazo=create dw_reclamos_rechazo
this.Control[]={this.dw_reclamos_rechazo}
end on

on tabpage_2.destroy
destroy(this.dw_reclamos_rechazo)
end on

type dw_reclamos_rechazo from datawindow within tabpage_2
integer x = 14
integer y = 24
integer width = 3451
integer height = 1432
integer taborder = 20
string title = "none"
string dataobject = "dw_asignacion_reclamo_lista_rechazo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string		ls_string,ls_campo_ord,ls_filtro
long		ll_tot_reg,ll_num_reclamo,ll_row2
string		ls_columna

ls_columna																						= dwo.name
if row > 0 then
	ll_row2																						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row2, TRUE)
	ll_num_reclamo																			= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_row2,'numero_reclamo')
else
	if ls_columna='t_cr' or ls_columna='t_cr_texto' then
		ls_filtro			= "c_estado_gestion ='CR'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_g' or ls_columna='t_g_texto' then
		ls_filtro			= "c_estado_gestion ='G'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_ep' or ls_columna='t_ep_texto' then
		ls_filtro			= "c_estado_gestion ='EP'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_sc' or ls_columna='t_sc_texto' then
		ls_filtro			= "c_estado_gestion ='SC'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_0_50'  then
		ls_filtro			= "c_estado_gestion ='0'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_51_90'  then
		ls_filtro			= "c_estado_gestion ='51'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_91_100' then
		ls_filtro			= "c_estado_gestion ='100'"
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_todos' then
		ls_filtro			= ""
		tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_filtro)
		tab_1.tabpage_2.dw_reclamos_rechazo.filter()
		if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	end if
end if
if ls_columna='rut_contacto_t' then
	ls_campo_ord																				= 'rut_contacto'
	em_ctto.text																					= ''
	tab_1.tabpage_2.dw_reclamos_rechazo.Object.rut_contacto_t.border				= 5
	tab_1.tabpage_2.dw_reclamos_rechazo.Object.numero_reclamo_t.border			= 6
	tab_1.tabpage_2.dw_reclamos_rechazo.SETSORT(ls_campo_ord)
	tab_1.tabpage_2.dw_reclamos_rechazo.SORT()
	st_busqueda.text																			= 'Rut Contacto'
elseif ls_columna='numero_reclamo_t' then
	ls_campo_ord																				= 'numero_reclamo'
	em_ctto.text																					= ''
	tab_1.tabpage_2.dw_reclamos_rechazo.Object.numero_reclamo_t.border			= 5
	tab_1.tabpage_2.dw_reclamos_rechazo.Object.rut_contacto_t.border				= 6
	tab_1.tabpage_2.dw_reclamos_rechazo.SETSORT(ls_campo_ord)
	tab_1.tabpage_2.dw_reclamos_rechazo.SORT()
	st_busqueda.text																			= 'Número Reclamo'
elseif ls_columna='t_jefe_color' or ls_columna='t_jefe' then
	ls_string																						= 'nivel ="2" and ult_estado_gestion < 12'
	tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_string)
	tab_1.tabpage_2.dw_reclamos_rechazo.filter()
	tab_1.tabpage_2.dw_reclamos_rechazo.accepttext()
	ll_tot_reg																					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Solicitudes Asignadas a Jefe Unidad")
	end if
elseif ls_columna='t_user_color' or ls_columna='t_user' then
	ls_string																						= 'nivel ="3" and ult_estado_gestion < 12'
	tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_string)
	tab_1.tabpage_2.dw_reclamos_rechazo.filter()
	tab_1.tabpage_2.dw_reclamos_rechazo.accepttext()
	ll_tot_reg																					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Solicitudes Asignadas a Usuarios Unidad")
	end if
elseif ls_columna='t_cliente_color' or ls_columna='t_cliente' then
	ls_string																						= 'ult_estado_gestion = 12'
	tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_string)
	tab_1.tabpage_2.dw_reclamos_rechazo.filter()
	tab_1.tabpage_2.dw_reclamos_rechazo.accepttext()
	ll_tot_reg																					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Respuestas a Clientes")
	end if
elseif ls_columna='t_todos' then
	ls_string																						=  ''
	tab_1.tabpage_2.dw_reclamos_rechazo.setfilter(ls_string)
	tab_1.tabpage_2.dw_reclamos_rechazo.filter()
	tab_1.tabpage_2.dw_reclamos_rechazo.accepttext()
	ll_tot_reg																					= tab_1.tabpage_2.dw_reclamos_rechazo.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Solicitud Reclamo")
	end if
end if
end event

event rowfocuschanged;long		ll_tot_reg,ll_num_reclamo,ll_row2

if getrow()>0 then
	ll_row2					= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row2, TRUE)
	ll_num_reclamo		= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_row2,'numero_reclamo')
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3488
integer height = 1580
long backcolor = 67108864
string text = "Asignación"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_publico cb_publico
st_ticket st_ticket
rb_rut_contacto rb_rut_contacto
rb_requerimiento rb_requerimiento
st_1 st_1
dw_asigna_lista dw_asigna_lista
dw_asigna_detalle dw_asigna_detalle
end type

on tabpage_3.create
this.cb_publico=create cb_publico
this.st_ticket=create st_ticket
this.rb_rut_contacto=create rb_rut_contacto
this.rb_requerimiento=create rb_requerimiento
this.st_1=create st_1
this.dw_asigna_lista=create dw_asigna_lista
this.dw_asigna_detalle=create dw_asigna_detalle
this.Control[]={this.cb_publico,&
this.st_ticket,&
this.rb_rut_contacto,&
this.rb_requerimiento,&
this.st_1,&
this.dw_asigna_lista,&
this.dw_asigna_detalle}
end on

on tabpage_3.destroy
destroy(this.cb_publico)
destroy(this.st_ticket)
destroy(this.rb_rut_contacto)
destroy(this.rb_requerimiento)
destroy(this.st_1)
destroy(this.dw_asigna_lista)
destroy(this.dw_asigna_detalle)
end on

type cb_publico from commandbutton within tabpage_3
integer x = 2981
integer y = 1468
integer width = 443
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gestión Público"
end type

event clicked;Long		ll_row

ll_row			= dw_asigna_lista.getrow()
if ll_row > 0 and dw_asigna_lista.rowcount() > 0 then
	gs_base		= dw_asigna_lista.getitemstring(ll_row,'base')
	gs_serie		= dw_asigna_lista.getitemstring(ll_row,'serie')
	gi_numero	= dw_asigna_lista.getitemnumber(ll_row,'numero')
	gi_rut			= dw_asigna_lista.getitemnumber(ll_row,'rut_titular')
	if isvalid(w_mensaje_atencion_publico) then close(w_mensaje_atencion_publico)
	open(w_mensaje_atencion_publico)
end if
end event

type st_ticket from statictext within tabpage_3
integer x = 1943
integer y = 1476
integer width = 512
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir TICKET"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;Long		ll_fila,ll_folio,ll_dia_fec,ll_mes_fec,ll_anno_fec,ll_new,ll_cod_reclamo
date		ld_fec_prox
String		ls_nom_contacto,ls_ap_pat_contacto,ls_ap_mat_contacto,ls_nombre,ls_fecha,ls_fec_comp,ls_descrip,ls_titulo,ls_descrip_reclamo,&
			ls_nom_encargado,ls_descrip_depto,ls_glosa_original

if dw_asigna_lista.rowcount() > 0 then
	SetPointer(HourGlass!)
	ll_fila					= dw_asigna_lista.getrow()
	ll_folio				= dw_asigna_lista.getitemnumber(ll_fila,'numero_reclamo')
	if ll_folio > 0 then
		dwe_ticket.reset()
		ll_new			= dwe_ticket.insertrow(0)
		SELECT	"RECLAMO_SOLICITUD"."NOMBRE_CONTACTO",   
					"RECLAMO_SOLICITUD"."A_PATERNO_CONTACTO",   
					"RECLAMO_SOLICITUD"."A_MATERNO_CONTACTO",
					"RECLAMO_SOLICITUD"."CODIGO_RECLAMO",
					"RECLAMO_SOLICITUD"."GLOSA_RECLAMO_ORIGINAL"
		INTO 		:ls_nom_contacto,   
					:ls_ap_pat_contacto,   
					:ls_ap_mat_contacto,
					:ll_cod_reclamo,
					:ls_glosa_original
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE 	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :ll_folio  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ls_nom_contacto) 		then ls_nom_contacto='-'
			if isnull(ls_ap_pat_contacto) 	then ls_ap_pat_contacto='-'
			if isnull(ls_ap_mat_contacto) 	then ls_ap_mat_contacto='-'
		end if
		ls_nombre									= ls_nom_contacto+' '+ls_ap_pat_contacto+' '+ls_ap_mat_contacto
		
		ld_fec_prox				 					= date( dw_asigna_lista.getitemdatetime(ll_fila,'fecha_crea'))
		ll_dia_fec									= day(ld_fec_prox)
		ll_mes_fec									= month(ld_fec_prox)
		ll_anno_fec									= year(ld_fec_prox)
		CHOOSE CASE UPPER(DayName(ld_fec_prox))
			CASE 'LUNES','MONDAY'
				ls_fecha								= 'LUNES'
			CASE 'MARTES','TUESDAY'
				ls_fecha								= 'MARTES'
			CASE 'MIERCOLES','WEDNESDAY'
				ls_fecha								= 'MIERCOLES'
			CASE 'JUEVES','THURSDAY'
				ls_fecha								= 'JUEVES'
			CASE 'VIERNES','FRIDAY'
				ls_fecha								= 'VIERNES'
			CASE 'SABADO','SATURDAY'
				ls_fecha								= 'SABADO'
			CASE 'DOMINGO','SUNDAY'
				ls_fecha								= 'DOMINGO'
		END CHOOSE
		ls_fec_comp									= trim(ls_fecha)
		
		if ll_mes_fec=1 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE ENERO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=2 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE FEBRERO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=3 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE MARZO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=4 then	
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE ABRIL DE '+string(ll_anno_fec)
		elseif ll_mes_fec=5 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE MAYO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=6 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE JUNIO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=7 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE JULIO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=8 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE AGOSTO DE '+string(ll_anno_fec)
		elseif ll_mes_fec=9 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE SEPTIEMBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=10 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE OCTUBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=11 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE NOVIEMBRE DE '+string(ll_anno_fec)
		elseif ll_mes_fec=12 then
			ls_fec_comp								= ls_fecha+' '+string(ll_dia_fec)+' DE DICIEMBRE DE '+string(ll_anno_fec)
		end if
		dwe_ticket.setitem( ll_new,'fecha',ls_fec_comp)
		dwe_ticket.object.t_folio.text			= 'FOLIO SOLICITUD   '+string(ll_folio,'###,###,###,###,##0')
		ls_titulo										= 'ESTIMADO(A)  '+ls_nombre
		dwe_ticket.setitem( ll_new, 'titulo', ls_titulo )

		ls_descrip									= '	LE INFORMAMOS QUE HOY '+ls_fec_comp+' HEMOS RECEPCIONADO SU REQUERIMIENTO Y HA SIDO INGRESADO EN NUESTRO SISTEMA DE CONTROL DE SOLICITUDES CON FOLIO N° '+string(ll_folio,'###,###,##0')+', CON EL SIGUIENTE DETALLE.'
		dwe_ticket.setitem( ll_new,'descripcion',ls_descrip)
		
		SELECT		"RECLAMO_CODIGO_RECLAMO"."DESCRIPCION"  
		INTO 			:ls_descrip_reclamo
		FROM 		"RECLAMO_CODIGO_RECLAMO"  
		WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_cod_reclamo  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dwe_ticket.setitem( ll_new,'folio',ls_descrip_reclamo+  ' - REQUERIMIENTO ORIGINAL:  '+ls_glosa_original)
		end if
		
		SELECT		"ENCARGADOS"."NOMBRE",   
						"CODIGO_DEPTO"."DESCRIPCION"  
		INTO			:ls_nom_encargado,
						:ls_descrip_depto
		FROM 		"CODIGO_DEPTO",   
						"ENCARGADOS"  
		WHERE 	   ( "CODIGO_DEPTO"."CODIGO" = "ENCARGADOS"."DEPTO" ) and  
					   (("ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dwe_ticket.setitem( ll_new,'atendido_por',ls_nom_encargado)
			dwe_ticket.setitem( ll_new,'departamento',ls_descrip_depto)
		end if
		f_Print( dwe_ticket )
	end if
	SetPointer(Arrow!)
end if
end event

type rb_rut_contacto from radiobutton within tabpage_3
integer x = 978
integer y = 1468
integer width = 421
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut Contacto"
end type

event clicked;em_ctto.text					= ''
if rb_rut_contacto.checked=true then
	st_busqueda.text		= 'Rut Contacto'
end if
end event

type rb_requerimiento from radiobutton within tabpage_3
integer x = 379
integer y = 1468
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Requerimiento"
boolean checked = true
end type

event clicked;em_ctto.text					= ''
if rb_requerimiento.checked=true then
	st_busqueda.text		= 'N° Requerimiento'
end if
end event

type st_1 from statictext within tabpage_3
integer x = 50
integer y = 1476
integer width = 311
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por"
boolean focusrectangle = false
end type

type dw_asigna_lista from datawindow within tabpage_3
integer x = 14
integer y = 24
integer width = 3451
integer height = 836
integer taborder = 70
string title = "none"
string dataobject = "dw_asignacion_reclamo_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string		ls_string,ls_campo_ord,ls_filtro
long		ll_tot_reg,ll_num_reclamo
string		ls_columna

ls_columna																						= dwo.name
if row>0 then
	il_row3																						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row3, TRUE)
	ll_num_reclamo																			= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'numero_reclamo')
	ll_tot_reg																					= tab_1.tabpage_3.dw_asigna_detalle.retrieve(ll_num_reclamo)
else
	if ls_columna='t_cr' or ls_columna='t_cr_texto' then
		ls_filtro			= "c_estado_gestion ='CR'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_g' or ls_columna='t_g_texto' then
		ls_filtro			= "c_estado_gestion ='G'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_ep' or ls_columna='t_ep_texto' then
		ls_filtro			= "c_estado_gestion ='EP'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_sc' or ls_columna='t_sc_texto' then
		ls_filtro			= "c_estado_gestion ='SC'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_0_50'  then
		ls_filtro			= "c_estado_gestion ='0'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_51_90'  then
		ls_filtro			= "c_estado_gestion ='51'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_91_100' then
		ls_filtro			= "c_estado_gestion ='100'"
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	elseif ls_columna='t_todos' then
		ls_filtro			= ""
		tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_filtro)
		tab_1.tabpage_3.dw_asigna_lista.filter()
		if tab_1.tabpage_3.dw_asigna_lista.rowcount()=0 then messagebox("Advertencia","No registra Dato")
	end if
end if
if ls_columna='rut_contacto_t' then
	ls_campo_ord																				= 'rut_contacto'
	em_ctto.text																					= ''
	tab_1.tabpage_3.dw_asigna_lista.Object.rut_contacto_t.border				= 5
	tab_1.tabpage_3.dw_asigna_lista.Object.numero_reclamo_t.border			= 6
	tab_1.tabpage_3.dw_asigna_lista.SETSORT(ls_campo_ord)
	tab_1.tabpage_3.dw_asigna_lista.SORT()
	st_busqueda.text																			= 'Rut Contacto'
elseif ls_columna='numero_reclamo_t' then
	ls_campo_ord																				= 'numero_reclamo'
	em_ctto.text																					= ''
	tab_1.tabpage_3.dw_asigna_lista.Object.numero_reclamo_t.border			= 5
	tab_1.tabpage_3.dw_asigna_lista.Object.rut_contacto_t.border				= 6
	tab_1.tabpage_3.dw_asigna_lista.SETSORT(ls_campo_ord)
	tab_1.tabpage_3.dw_asigna_lista.SORT()
	st_busqueda.text																			= 'Número Reclamo'
elseif ls_columna='t_jefe_color' or ls_columna='t_jefe' then
	ls_string																						= 'nivel ="2" and ult_estado_gestion < 12'
	tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_string)
	tab_1.tabpage_3.dw_asigna_lista.filter()
	tab_1.tabpage_3.dw_asigna_lista.accepttext()
	ll_tot_reg																					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Solicitudes Asignadas a Jefe Unidad")
	end if
elseif ls_columna='t_user_color' or ls_columna='t_user' then
	ls_string																						= 'nivel ="3" and ult_estado_gestion < 12'
	tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_string)
	tab_1.tabpage_3.dw_asigna_lista.filter()
	tab_1.tabpage_3.dw_asigna_lista.accepttext()
	ll_tot_reg																					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Solicitudes Asignadas a Usuarios Unidad")
	end if
elseif ls_columna='t_cliente_color' or ls_columna='t_cliente' then
	ls_string																						= 'ult_estado_gestion = 12'
	tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_string)
	tab_1.tabpage_3.dw_asigna_lista.filter()
	tab_1.tabpage_3.dw_asigna_lista.accepttext()
	ll_tot_reg																					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Regista Respuestas a Clientes")
	end if
elseif ls_columna='t_todos' then
	ls_string																						=  ''
	tab_1.tabpage_3.dw_asigna_lista.setfilter(ls_string)
	tab_1.tabpage_3.dw_asigna_lista.filter()
	tab_1.tabpage_3.dw_asigna_lista.accepttext()
	ll_tot_reg																					= tab_1.tabpage_3.dw_asigna_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Solicitud Reclamo")
	end if
end if
end event

event rowfocuschanged;long		ll_tot_reg,ll_num_reclamo

if getrow()>0 then
	il_row3					= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row3, TRUE)
	ll_num_reclamo		= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'numero_reclamo')
	ll_tot_reg				= tab_1.tabpage_3.dw_asigna_detalle.retrieve(ll_num_reclamo)
end if

end event

type dw_asigna_detalle from datawindow within tabpage_3
integer x = 14
integer y = 884
integer width = 3451
integer height = 692
integer taborder = 40
string title = "none"
string dataobject = "dw_asignacion_reclamo_detalle"
borderstyle borderstyle = stylelowered!
end type

type cb_detalle_gestion from commandbutton within w_administrar_reclamos
integer x = 315
integer y = 1948
integer width = 384
integer height = 100
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;string	ls_string,ls_cod_solic
long	ll_num_reclamo,ll_row2
if tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then
		if il_row3 > 0 then
			ll_num_reclamo				= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'numero_reclamo')
			ls_cod_solic						= tab_1.tabpage_3.dw_asigna_lista.getitemstring(il_row3,'codigo_solicitud')
			if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
				ls_string						= string(ll_num_reclamo)+'~t'+ls_cod_solic
				if isvalid(w_detalle_gestion) then close(w_detalle_gestion)
				OpenWithParm (w_detalle_gestion,ls_string)
			end if
		end if
	end if
elseif tab_1.selectedtab=2 then
	ll_row2									= tab_1.tabpage_2.dw_reclamos_rechazo.getrow()
	if tab_1.tabpage_2.dw_reclamos_rechazo.rowcount() > 0 then
		if ll_row2 > 0 then
			ll_num_reclamo				= tab_1.tabpage_2.dw_reclamos_rechazo.getitemnumber(ll_row2,'numero_reclamo')
			ls_cod_solic						= tab_1.tabpage_2.dw_reclamos_rechazo.getitemstring(ll_row2,'codigo_solicitud')
			if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
				ls_string						= string(ll_num_reclamo)+'~t'+ls_cod_solic
				if isvalid(w_detalle_gestion) then close(w_detalle_gestion)
				OpenWithParm (w_detalle_gestion,ls_string)
			end if
		end if
	end if
end if
end event

type cb_gestionar from commandbutton within w_administrar_reclamos
integer x = 41
integer y = 1948
integer width = 274
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gestionar"
end type

event clicked;string		ls_string,ls_nivel,ls_cod_solic,ls_estado
long		ll_res,ll_num_reclamo,ll_cod_parque,ll_cod_gestion,ll_rut_contacto
datetime	ldt_fecha_crea,ldt_fec_gestion

if tab_1.selectedtab=1 then
	if tab_1.tabpage_1.dw_contacto_lista.rowcount() > 0 then
		ls_estado		= tab_1.tabpage_1.dw_contacto_lista.getitemstring(il_row1,'estado_asigna')
		if il_row1 > 0 then
			if ls_estado='I' then
				messagebox("Advertencia","No es posible Asignar Registro, se encuentra INACTIVO")
			else
				ll_res						= MessageBox("Advertencia", 'Esta seguro de Asignar Registro', Exclamation!, YesNo!, 2)
				if ll_res=1 then
					wf_gestion_contacto()
					em_nom_tit.text	= ''
					em_pat_tit.text		= ''
					em_mat_tit.text	= ''
				end if
			end if
		end if
	end if
elseif tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_asigna_lista.rowcount() > 0 then
		if il_row3 > 0 then
			ll_num_reclamo		= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'numero_reclamo')
			ls_nivel					= tab_1.tabpage_3.dw_asigna_lista.getitemstring(il_row3,'nivel')
			ll_cod_parque			= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'cod_parque')
			ls_cod_solic				= tab_1.tabpage_3.dw_asigna_lista.getitemstring(il_row3,'codigo_solicitud')
			ll_cod_gestion			= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'ult_estado_gestion')
			ldt_fecha_crea			= tab_1.tabpage_3.dw_asigna_lista.getitemdatetime(il_row3,'fecha_crea')
			ll_rut_contacto			= tab_1.tabpage_3.dw_asigna_lista.getitemnumber(il_row3,'rut_contacto')
			ldt_fec_gestion			= tab_1.tabpage_3.dw_asigna_lista.getitemdatetime(il_row3,'ult_fecha_gestion')
			if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
				SELECT 	"ENCARGADOS"."COD_PARQUE"  
				INTO 		:ll_cod_parque  
				FROM 	"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
				ls_string				= string(ll_num_reclamo)+'~t'+ls_nivel+'~t'+string(ll_cod_parque)+'~t'+ls_cod_solic+'~t'+string(ll_cod_gestion)+'~t'+string(ldt_fecha_crea)+'~t'+string(ll_rut_contacto)+'~t'+string(ldt_fec_gestion)   
				if isvalid(w_asigna_modif_reclamos) then close(w_asigna_modif_reclamos)
				OpenWithParm (w_asigna_modif_reclamos,ls_string)
				em_nom_tit.text	= ''
				em_pat_tit.text		= ''
				em_mat_tit.text	= ''
			end if
		end if
	end if
end if
end event

