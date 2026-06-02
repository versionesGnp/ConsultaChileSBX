forward
global type w_asigna_modif_reclamos from window
end type
type cb_otras_gest from commandbutton within w_asigna_modif_reclamos
end type
type cb_1 from commandbutton within w_asigna_modif_reclamos
end type
type cb_email from commandbutton within w_asigna_modif_reclamos
end type
type cb_envia_email_cliente from commandbutton within w_asigna_modif_reclamos
end type
type tab_1 from tab within w_asigna_modif_reclamos
end type
type tabpage_1 from userobject within tab_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_asig_sol_trabajo from datawindow within tabpage_1
end type
type dw_asig_sol_origen from datawindow within tabpage_1
end type
type dw_asig_sol_nuevo from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_1 st_1
dw_asig_sol_trabajo dw_asig_sol_trabajo
dw_asig_sol_origen dw_asig_sol_origen
dw_asig_sol_nuevo dw_asig_sol_nuevo
end type
type tabpage_2 from userobject within tab_1
end type
type dw_asig_sol_modif from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_asig_sol_modif dw_asig_sol_modif
end type
type tab_1 from tab within w_asigna_modif_reclamos
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_limpiar from commandbutton within w_asigna_modif_reclamos
end type
type cb_cerrar from commandbutton within w_asigna_modif_reclamos
end type
type cb_gestionar from commandbutton within w_asigna_modif_reclamos
end type
type cb_grabar from commandbutton within w_asigna_modif_reclamos
end type
end forward

global type w_asigna_modif_reclamos from window
integer width = 2880
integer height = 2072
boolean titlebar = true
string title = "Asignación y Modificación de Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_otras_gest cb_otras_gest
cb_1 cb_1
cb_email cb_email
cb_envia_email_cliente cb_envia_email_cliente
tab_1 tab_1
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_gestionar cb_gestionar
cb_grabar cb_grabar
end type
global w_asigna_modif_reclamos w_asigna_modif_reclamos

type variables
string		is_cod_solic,is_nivel,is_email='N'
long		il_row,il_num_reclamo,il_cod_parque,il_cod_gestion,il_rut_contacto
datetime	idt_fec_crea,idt_fec_gestion
datawindowchild	idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8
end variables

forward prototypes
public subroutine wf_modif_itemchanged (string as_columna)
public function long wf_graba_gestion (string as_user_crea, long al_cod_gestion, datetime adt_fec_gestion, string as_glosa_gestion, string as_user_asig, string as_depto_asig, string as_nivel, long al_num_reclamo)
end prototypes

public subroutine wf_modif_itemchanged (string as_columna);string		ls_cod_solic,ls_descrip,ls_ult_glosa,ls_glosa_gestion,ls_user_asig,ls_depto_asig,ls_nivel,ls_depto_desc,ls_observ,ls_nom_user_asig,ls_nulo,&
			ls_nom_contacto,ls_ap_pat_contacto,ls_ap_mat_contacto,ls_texto_6,ls_fecha,ls_fec_comp,ls_descrip_reclamo,ls_nom_encargado,ls_descrip_depto
long		ll_cod_gestion,ll_tot_reg,ll_dia_comp,ll_dia_act,ll_dia_fec,ll_mes_fec,ll_anno_fec,ll_folio,ll_cod_reclamo,ll_dias_solucion
datetime	ldt_fec_estado,ldt_fec_compr,ldt_fec_ini,ldt_fec_fin
date		ld_fec_prox

//wf_modif_itemchanged(as_columna)
setnull(ls_nulo)
ls_nom_contacto				= trim(tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'nombre_contacto'))
ls_ap_pat_contacto			= trim(tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'a_paterno_contacto'))
ls_ap_mat_contacto			= trim(tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'a_materno_contacto'))
ll_folio							= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'reclamo_solicitud_numero_reclamo')
ll_cod_reclamo					= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'codigo_reclamo')

if isnull(ls_nom_contacto) or ls_nom_contacto='-' then ls_nom_contacto=''
if isnull(ls_ap_pat_contacto) or ls_ap_pat_contacto='-' then ls_ap_pat_contacto=''
if isnull(ls_ap_mat_contacto) or ls_ap_mat_contacto='-' then ls_ap_mat_contacto=''

SELECT	sysdate
INTO 		:ldt_fec_estado
FROM		"TASA"  
WHERE	"TASA"."LOOK" = 1   
USING	sqlca ;
if as_columna = 'codigo_gestion' then
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'depto_asig',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'nivel',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_nulo)
	ls_cod_solic									=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_gestion								=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ls_descrip) and ls_descrip<>'' then
			ls_descrip							= ls_descrip
		else
			ls_descrip							= ''
		end if
	else
		ls_descrip								= ''
	end if
	SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
	INTO		:ls_ult_glosa
	FROM		"RECLAMO_ESTADO"  
	WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ls_ult_glosa) and ls_ult_glosa<>'' then
			ls_ult_glosa							= ls_ult_glosa
		else
			ls_ult_glosa							= ''
		end if
	else
		ls_ult_glosa								= ''
	end if
	ls_glosa_gestion							= ls_ult_glosa+' '+ls_descrip
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_glosa_gestion)
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
elseif as_columna = 'usuario_asig' then
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'depto_asig',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'nivel',ls_nulo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_nulo)
	ls_user_asig										=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	ls_cod_solic										=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_gestion									=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ldt_fec_estado									=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	ls_glosa_gestion								=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'glosa_gestion')
	if ll_cod_gestion <> 6 and not isnull(ll_cod_gestion) then
		if ll_cod_gestion<9 then
			ls_observ								=	tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
		else
			ls_observ								=	tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'reclamo_solicitud_detalle_observacion')
		end if
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip							= ls_descrip
			else
				ls_descrip							= ''
			end if
		else
			ls_descrip								= ''
		end if
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_ult_glosa
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_ult_glosa) and ls_ult_glosa<>'' then
				ls_ult_glosa							= ls_ult_glosa
			else
				ls_ult_glosa							= ''
			end if
		else
			ls_ult_glosa								= ''
		end if
		SELECT	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."DEPTO",	"ENCARGADOS"."NIVEL_RECLAMO",	"CODIGO_DEPTO"."DESCRIPCION"
		INTO		:ls_nom_user_asig,			:ls_depto_asig,					:ls_nivel,										:ls_depto_desc
		FROM 	"ENCARGADOS","CODIGO_DEPTO"  
		WHERE 	"ENCARGADOS"."DEPTO" = "CODIGO_DEPTO"."CODIGO" and  
					"ENCARGADOS"."CODIGO_USUARIO" = :ls_user_asig AND  
					"ENCARGADOS"."RECLAMO" = 'R'
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_depto_asig) and ls_depto_asig<>'' and not isnull(ls_nivel) and ls_nivel<>'' and not isnull(ls_depto_desc) and ls_depto_desc<>'' and not isnull(ls_nom_user_asig) and ls_nom_user_asig<>'' then
				ls_nom_user_asig					= ls_nom_user_asig
				ls_depto_asig						= ls_depto_asig
				ls_nivel								= ls_nivel
				ls_depto_desc						= ls_depto_desc
			else
				ls_nom_user_asig					= ''
				ls_depto_asig						= ''
				ls_nivel								= ''
				ls_depto_desc						= ''
			end if
		else
			ls_nom_user_asig						= ''
			ls_depto_asig							= ''
			ls_nivel									= ''
			ls_depto_desc							= ''
		end if
		ls_glosa_gestion							= ls_ult_glosa+' '+ls_descrip
		if ll_cod_gestion<9 then
			ls_observ								= ls_ult_glosa+' '+ls_descrip+': USUARIO CREADOR: '+gs_user+' - '+gs_nombre_usuario+', USUARIO ASIGNADO: '+ls_user_asig+' - '+ls_nom_user_asig+', DEPARTAMENTO ASIGNADO :'+ ls_depto_asig+' - '+ls_depto_desc
		else
			ls_observ								= ls_observ
		end if
	elseif ll_cod_gestion = 6 and not isnull(ll_cod_gestion) then
		ldt_fec_compr								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_compromiso')
		SELECT	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."DEPTO",	"ENCARGADOS"."NIVEL_RECLAMO",	"CODIGO_DEPTO"."DESCRIPCION"
		INTO		:ls_nom_user_asig,			:ls_depto_asig,					:ls_nivel,										:ls_depto_desc
		FROM 	"ENCARGADOS","CODIGO_DEPTO"  
		WHERE 	"ENCARGADOS"."DEPTO" = "CODIGO_DEPTO"."CODIGO" and  
					"ENCARGADOS"."CODIGO_USUARIO" = :ls_user_asig AND  
					"ENCARGADOS"."RECLAMO" = 'R'
		USING	sqlca;

		ls_texto_6									= 'ESTIMADO(A) '+ls_nom_contacto+' '+ls_ap_pat_contacto+' '+ls_ap_mat_contacto+'           '
		ld_fec_prox				 					= date(gdt_fec_sistema)
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
		ls_texto_6									= ls_texto_6 +'LE INFORMAMOS QUE HOY '+ls_fec_comp+' HEMOS RECEPCIONADO SU REQUERIMIENTO Y HA SIDO INGRESADO EN NUESTRO SISTEMA DE CONTROL DE SOLICITUDES CON FOLIO N° '
		ls_texto_6									= ls_texto_6 +string(ll_folio,'###,###,###,##0')+',    Y EL SIGUIENTE DETALLE:'+'         '
		SELECT		"RECLAMO_CODIGO_RECLAMO"."DESCRIPCION",   
						"RECLAMO_CODIGO_RECLAMO"."DIAS_GESTION"  
		INTO 			:ls_descrip_reclamo,   
						:ll_dias_solucion  
		FROM 		"RECLAMO_CODIGO_RECLAMO"  
		WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_cod_reclamo   ;
		
		SELECT		"ENCARGADOS"."NOMBRE",   
						"CODIGO_DEPTO"."DESCRIPCION"  
		INTO			:ls_nom_encargado,
						:ls_descrip_depto
		FROM 		"CODIGO_DEPTO",   
						"ENCARGADOS"  
		WHERE 	   ( "CODIGO_DEPTO"."CODIGO" = "ENCARGADOS"."DEPTO" ) and  
						(("ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   ;
		
		ls_texto_6									= ls_texto_6 +'-  '+ls_descrip_reclamo+'   '
		if ll_dias_solucion=1 then
			ls_texto_6								= ls_texto_6 +'SERA RESUELTO EN LAS PROXIMAS 24 HORAS.'+'  '
		else
			ls_texto_6								= ls_texto_6 +'SERA RESUELTO EN LOS PROXIMOS '+string(ll_dias_solucion,'###,##0')+' DIAS.'+'   FECHA COMPROMISO '+string(ldt_fec_compr,'dd/mm/yyyy')
		end if
		ls_texto_6									= ls_texto_6 +'ESTE EMAIL ES GENERADO DE MANERA AUTOMATICA, POR FAVOR NO RESPONDER.'+'     '
		ls_texto_6									= ls_texto_6 +'RESPONSABLE DE LA SOLICITUD:'+'  '
		ls_texto_6									= ls_texto_6 +'EJECUTIVO				'+ls_nom_encargado+'             '
		ls_texto_6									= ls_texto_6 +'DEPARTAMENTO		'+ls_descrip_depto
		ls_observ									= ls_texto_6
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_cod_gestion)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_observ) //ls_glosa_gestion)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'depto_asig',ls_depto_asig)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'nivel',ls_nivel)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_observ)
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	ll_tot_reg									= tab_1.tabpage_1.dw_asig_sol_trabajo.retrieve(ls_cod_solic,ls_user_asig)
	if ll_tot_reg > 0 then
		SELECT	"FECHA_GESTION", "FECHA_COMPROMISO" 
		INTO		:ldt_fec_ini,				:ldt_fec_fin
		FROM		"RECLAMO_SOLICITUD_DETALLE"  
		WHERE	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_num_reclamo and
					"RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 6 and
					"RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION" = (	SELECT	max("FECHA_GESTION")  
																							 	FROM		"RECLAMO_SOLICITUD_DETALLE"  
																								WHERE	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_num_reclamo and
																											"RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 6 )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
				ll_dia_comp						= DaysAfter(date(ldt_fec_ini), date(ldt_fec_fin))
				ll_dia_act						= DaysAfter(date(ldt_fec_ini), date(gdt_fec_sistema))
				tab_1.tabpage_1.dw_asig_sol_trabajo.setitem(1,'dia_compro',ll_dia_comp)
				tab_1.tabpage_1.dw_asig_sol_trabajo.setitem(1,'dia_actual',ll_dia_act)
				tab_1.tabpage_1.dw_asig_sol_trabajo.accepttext()
			end if
		end if
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('observacion')
	
elseif as_columna = 'observacion' then
	ll_cod_gestion								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ldt_fec_estado								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	ls_glosa_gestion							= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'glosa_gestion')
	ls_user_asig									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	ls_depto_asig								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'depto_asig')
	ls_nivel										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'nivel')
	ls_observ									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_cod_gestion)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_glosa_gestion)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'depto_asig',ls_depto_asig)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'nivel',ls_nivel)
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
elseif as_columna = 'fecha_compromiso' then
	ls_cod_solic									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_gestion								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ldt_fec_compr								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_compromiso')
	if ll_cod_gestion <> 6 and not isnull(ll_cod_gestion) then
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip																= ls_descrip
			else
				ls_descrip																= ''
			end if
		else
			ls_descrip																	= ''
		end if
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_ult_glosa
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_ult_glosa) and ls_ult_glosa<>'' then
				ls_ult_glosa																= ls_ult_glosa
			else
				ls_ult_glosa																= ''
			end if
		else
			ls_ult_glosa																	= ''
		end if
		ls_observ									= 'SU '+ls_descrip+' SE ENCUENTRA EN PROCESO,  USUARIO ENCARGADO: '+gs_nombre_usuario+', FECHA ESTIMADA DE RESPUESTA: '+string(ldt_fec_compr,'dd/mm/yyyy')
	elseif ll_cod_gestion = 6 and not isnull(ll_cod_gestion) then
		ldt_fec_compr								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_compromiso')
		ls_texto_6									= 'ESTIMADO(A) '+ls_nom_contacto+' '+ls_ap_pat_contacto+' '+ls_ap_mat_contacto+'     '
		ld_fec_prox				 					= date(gdt_fec_sistema)
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
		ls_texto_6									= ls_texto_6 +'LE INFORMAMOS QUE HOY '+ls_fec_comp+' HEMOS RECEPCIONADO SU REQUERIMIENTO Y HA SIDO INGRESADO EN NUESTRO SISTEMA DE CONTROL DE SOLICITUDES CON FOLIO N° '
		ls_texto_6									= ls_texto_6 +string(ll_folio,'###,###,###,##0')+',    Y EL SIGUIENTE DETALLE.'+'   '
		SELECT		"RECLAMO_CODIGO_RECLAMO"."DESCRIPCION",   
						"RECLAMO_CODIGO_RECLAMO"."DIAS_GESTION"  
		INTO 			:ls_descrip_reclamo,   
						:ll_dias_solucion  
		FROM 		"RECLAMO_CODIGO_RECLAMO"  
		WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_cod_reclamo   ;
		
		SELECT		"ENCARGADOS"."NOMBRE",   
						"CODIGO_DEPTO"."DESCRIPCION"  
		INTO			:ls_nom_encargado,
						:ls_descrip_depto
		FROM 		"CODIGO_DEPTO",   
						"ENCARGADOS"  
		WHERE 	   ( "CODIGO_DEPTO"."CODIGO" = "ENCARGADOS"."DEPTO" ) and  
						(("ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   ;
		
		ls_texto_6									= ls_texto_6 +'-  '+ls_descrip_reclamo+'            '
		if ll_dias_solucion=1 then
			ls_texto_6								= ls_texto_6 +'SERA RESUELTO EN LAS PROXIMAS 24 HORAS.'+'   '
		else
			ls_texto_6								= ls_texto_6 +'SERA RESUELTO EN LOS PROXIMOS '+string(ll_dias_solucion,'###,##0')+' DIAS.'+'  FECHA COMPROMISO '+string(ldt_fec_compr,'dd/mm/yyyy')
		end if
		ls_texto_6									= ls_texto_6 +'ESTE EMAIL ES GENERADO DE MANERA AUTOMATICA, POR FAVOR NO RESPONDER.'+'     '
		ls_texto_6									= ls_texto_6 +'RESPONSABLE DE LA SOLICITUD:'+'    '
		ls_texto_6									= ls_texto_6 +'EJECUTIVO				'+ls_nom_encargado+'   '
		ls_texto_6									= ls_texto_6 +'DEPARTAMENTO		'+ls_descrip_depto
		ls_observ									= ls_texto_6
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_observ)
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('observacion')
end if
tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
end subroutine

public function long wf_graba_gestion (string as_user_crea, long al_cod_gestion, datetime adt_fec_gestion, string as_glosa_gestion, string as_user_asig, string as_depto_asig, string as_nivel, long al_num_reclamo);long		ll_graba=0,ll_numero_reclamo,ll_cod_gestion,ll_rut_contacto, ll_cod_parque,ll_cod_solicitud,ll_cod_notificacion
datetime	ldt_fecha_crea,ldt_fecha_gestion,ldt_fecha_compromiso,ldt_fecha_gestion_graba
String	ls_reasigna,ls_cod_solicitud,ls_obs,ls_glosa,ls_usuario_asig,ls_depto_asig,ls_nuvel,ls_user_crea
//wf_graba_gestion(as_user_crea,al_cod_gestion,adt_fec_gestion,as_glosa_gestion,as_user_asig,as_depto_asig,as_cod_solicitud,adt_fec_crea,al_cod_gestion_ant,adt_fec_gestion_ant,al_rut_contac,as_nivel)
//"USUARIO_CREA" = :as_user_crea, 
//"DEPTO_CREA" = :gs_depto,   
UPDATE	"RECLAMO_SOLICITUD"  
SET 		"ULT_ESTADO_GESTION" = :al_cod_gestion,   
			"USUARIO_CREA" = :as_user_crea, 
			"DEPTO_CREA" = :gs_depto,   
			"ULT_FECHA_GESTION" = :adt_fec_gestion,   
			"ULT_GLOSA_GESTION" = :as_glosa_gestion,   
			"USUARIO_ASIGNADO" = :as_user_asig,   
			"DEPTO_ASIG" = :as_depto_asig,   
			"NIVEL" = :as_nivel  
WHERE	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :al_num_reclamo 
USING	sqlca;
if sqlca.sqlcode=0 then
	commit;
	if al_cod_gestion=12 or al_cod_gestion=10 or al_cod_gestion=3 then
		UPDATE		"RECLAMO_SOLICITUD"  
		SET 			"COD_ESTADO_REG" = 'G'  
		WHERE 		"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :al_num_reclamo  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	elseif al_cod_gestion=11 then
		ls_reasigna		= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'reasignacion')
		if ls_reasigna<>'S' then
			UPDATE		"RECLAMO_SOLICITUD"  
			SET 			"COD_ESTADO_REG" = 'G'  
			WHERE 		"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :al_num_reclamo  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		elseif ls_reasigna='S' then
			SELECT	"RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG",	"RECLAMO_SOLICITUD_DETALLE"."DEPTO_ASIG",		"RECLAMO_SOLICITUD_DETALLE"."NIVEL" 
			INTO 		:ls_usuario_asig,   											:ls_depto_asig,   												:ls_nuvel
			FROM 	"RECLAMO_SOLICITUD_DETALLE"  
			WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :al_num_reclamo ) AND  
					  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 2 ) AND  
					  ( "RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION" = ( 	SELECT	max("RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION")
																									FROM 	"RECLAMO_SOLICITUD_DETALLE" 
																									WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :al_num_reclamo ) AND 
																												( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 2 )  ) ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ldt_fecha_gestion_graba		= gdt_fec_sistema			
				ls_glosa							= 'SE RE-ASIGNA SOLICITUD REQUERIMIENTO N° '+string(al_num_reclamo)+', USUARIO: '+gs_user+' CON FECHA '+string(gdt_fec_sistema,'dd/mm/yyyy')
				//"USUARIO_CREA" = :as_user_crea,   
//							"DEPTO_CREA" = :gs_depto,   
				UPDATE	"RECLAMO_SOLICITUD"  
				SET 		"ULT_ESTADO_GESTION" = 2,   
							"ULT_FECHA_GESTION" = :ldt_fecha_gestion_graba,   
							"USUARIO_CREA" = :as_user_crea,   
							"DEPTO_CREA" = :gs_depto,   
							"ULT_GLOSA_GESTION" = :ls_glosa,   
							"USUARIO_ASIGNADO" = :ls_usuario_asig,   
							"DEPTO_ASIG" = :ls_depto_asig,   
							"NIVEL" = :ls_nuvel  
				WHERE	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :al_num_reclamo 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
		end if
	end if
	ll_graba	++
else
	rollback;
	messagebox("Error Grabar","Error al Grabar Solicitud Requerimiento SQL: "+sqlca.sqlerrtext)
end if

if isnull(ll_graba) or ll_graba=0 then ll_graba=0
Return ll_graba
end function

on w_asigna_modif_reclamos.create
this.cb_otras_gest=create cb_otras_gest
this.cb_1=create cb_1
this.cb_email=create cb_email
this.cb_envia_email_cliente=create cb_envia_email_cliente
this.tab_1=create tab_1
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_gestionar=create cb_gestionar
this.cb_grabar=create cb_grabar
this.Control[]={this.cb_otras_gest,&
this.cb_1,&
this.cb_email,&
this.cb_envia_email_cliente,&
this.tab_1,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_gestionar,&
this.cb_grabar}
end on

on w_asigna_modif_reclamos.destroy
destroy(this.cb_otras_gest)
destroy(this.cb_1)
destroy(this.cb_email)
destroy(this.cb_envia_email_cliente)
destroy(this.tab_1)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_gestionar)
destroy(this.cb_grabar)
end on

event open;long		ll_tot_reg1,ll_tot_reg2,ll_etapa,ll_new,ll_p
datetime	ldt_fec_comp,ldt_nulo
gf_centrar(w_asigna_modif_reclamos)
is_email																							= 'N'
tab_1.tabpage_1.dw_asig_sol_origen.dataobject 										= 'dw_asigna_modif_reclamo_origen'
tab_1.tabpage_1.dw_asig_sol_origen.settransobject(sqlca)
tab_1.tabpage_2.dw_asig_sol_modif.dataobject 										= 'dw_asigna_modif_reclamo_origen_modif'
tab_1.tabpage_2.dw_asig_sol_modif.settransobject(sqlca)
il_num_reclamo																				= long(substr(1,1,Message.StringParm))
is_nivel																							= substr(1,2,Message.StringParm)
il_cod_parque																					= long(substr(1,3,Message.StringParm))
gl_codigo_parque																				= il_cod_parque
is_cod_solic																						= substr(1,4,Message.StringParm)
il_cod_gestion																					= long(substr(1,5,Message.StringParm))
idt_fec_crea																						= datetime(substr(1,6,Message.StringParm))
il_rut_contacto																					= long(substr(1,7,Message.StringParm))
idt_fec_gestion																					= datetime(substr(1,8,Message.StringParm))
ll_p																								= 1

SELECT DISTINCT max("RECLAMO_SOLICITUD_DETALLE"."FECHA_COMPROMISO" )
INTO 		:ldt_fec_comp  
FROM 	"RECLAMO_SOLICITUD_DETALLE"  
WHERE 	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_num_reclamo   ;

if il_cod_gestion = 6 and gs_depto = 'X' then
	cb_otras_gest.enabled = true
end if	
tab_1.tabpage_2.dw_asig_sol_modif.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(il_cod_parque)=0 then
	idw_detalle.insertrow(0)
end if
tab_1.tabpage_2.dw_asig_sol_modif.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.reset()
idw_detalle2.insertrow(0)
tab_1.tabpage_2.dw_asig_sol_modif.getchild('sepultura',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.reset()
idw_detalle3.insertrow(0)
tab_1.tabpage_2.dw_asig_sol_modif.getchild('serie',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.reset()
idw_detalle4.insertrow(0)
ll_tot_reg1																						= tab_1.tabpage_1.dw_asig_sol_origen.retrieve(il_num_reclamo,il_cod_gestion,idt_fec_gestion)
ll_tot_reg2																						= tab_1.tabpage_2.dw_asig_sol_modif.retrieve(il_num_reclamo,il_cod_gestion,idt_fec_gestion)
if ll_tot_reg1>0 and isnull(ldt_fec_comp) then
	SELECT DISTINCT max("RECLAMO_SOLICITUD_DETALLE"."FECHA_COMPROMISO" )
	INTO 		:ldt_fec_comp  
	FROM 	"RECLAMO_SOLICITUD_DETALLE"  
	WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_num_reclamo ) //AND  
//			  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 6 )  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'c_max_fec_comp',ldt_fec_comp)
		tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'reclamo_solicitud_detalle_fecha_compromiso',ldt_fec_comp)
	else
		tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'c_max_fec_comp',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'reclamo_solicitud_detalle_fecha_compromiso',ldt_nulo)
	end if
else
	tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'c_max_fec_comp',ldt_fec_comp)
	tab_1.tabpage_1.dw_asig_sol_origen.setitem(1,'reclamo_solicitud_detalle_fecha_compromiso',ldt_fec_comp)
end if
if ll_tot_reg2>0 then
	tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect							= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect						= 1	
	tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect		= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect		= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect				= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect							= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect						= 1	
	tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect					= 1
	cb_grabar.visible																			= false
	if il_cod_gestion<=5 then
		ll_etapa																					= 1
	elseif il_cod_gestion>=6 and il_cod_gestion<=11 then	
		ll_etapa																					= 2
		if il_cod_gestion=10 then
			ll_etapa																				= 3
		end if
	elseif il_cod_gestion>=12 then	
		ll_etapa																					= 3	
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.dataobject 									= 'dw_asigna_modif_reclamo_origen_nuevo'
	tab_1.tabpage_1.dw_asig_sol_nuevo.settransobject(sqlca)
	tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('codigo_gestion',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if idw_detalle5.retrieve(gs_depto,is_nivel,ll_etapa)=0 then
		idw_detalle5.insertrow(0)
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('usuario_asig',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	if idw_detalle6.retrieve(gs_depto,il_cod_parque)=0 then
		idw_detalle6.insertrow(0)
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('codigo_solucion',idw_detalle8)
	idw_detalle8.settransobject(sqlca)
	if idw_detalle8.retrieve(gs_depto)=0 then
		idw_detalle8.insertrow(0)
	end if
	tab_1.tabpage_1.dw_asig_sol_trabajo.dataobject 									= 'dw_asigna_modif_reclamo_origen_trab'
	tab_1.tabpage_1.dw_asig_sol_trabajo.settransobject(sqlca)
	tab_1.tabpage_1.dw_asig_sol_trabajo.getchild('ult_estado_gestion',idw_detalle7)
	idw_detalle7.settransobject(sqlca)
	if idw_detalle7.retrieve(gs_depto)=0 then
		idw_detalle7.insertrow(0)
	end if
	ll_new																						= tab_1.tabpage_1.dw_asig_sol_nuevo.insertrow(0)
	tab_1.tabpage_1.dw_asig_sol_nuevo.scrolltorow(ll_new)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"numero_reclamo",il_num_reclamo)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"cod_parque",il_cod_parque)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"codigo_solicitud",is_cod_solic)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"fecha_crea",idt_fec_crea)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"rut_contacto",il_rut_contacto)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"usuario_crea",gs_user)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,"codigo_notificacion",5)
	tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(ll_new,'fecha_compromiso',ldt_fec_comp)
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
else
	messagebox("Advertencia","No Registra Datos")
end if
tab_1.tabpage_1.dw_asig_sol_origen.accepttext()
tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
end event

type cb_otras_gest from commandbutton within w_asigna_modif_reclamos
integer x = 1842
integer y = 1828
integer width = 407
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Otras Gestiones"
end type

event clicked;string ls_string
long	ll_res

ll_res					= messagebox("Advertencia","¿Desea Ingresar Otra Gestion?",Exclamation!, YesNo!, 2)
if ll_res = 1 then	
	ls_string				= string(il_num_reclamo)+'~t'+is_nivel+'~t'+string(il_cod_parque)+'~t'+is_cod_solic+'~t'+string(il_cod_gestion)+'~t'+string(idt_fec_crea)+'~t'+string(il_rut_contacto)+'~t'+string(idt_fec_gestion)																	
	OpenWithParm (w_asigna_modif_reclamos_ugn,ls_string)
	close(w_asigna_modif_reclamos)
end if	
end event

type cb_1 from commandbutton within w_asigna_modif_reclamos
boolean visible = false
integer x = 649
integer y = 1828
integer width = 517
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enviar Prueba"
end type

event clicked;string		ls_nombre_usuario,ls_email_de,ls_cod_solic,ls_email_para,ls_asunto,ls_texto,ls_res,&
			ls_descrip,ls_nivel,ls_glosa_gestion,ls_nom_contac,ls_a_pater_contac,ls_a_mater_contac,&
			ls_parrafo_2,ls_parrafo_3,ls_parrafo_4,ls_nombre_parq,ls_user_asig,ls_pasa
long		ll_tot_reg,ll_cod_gestion,ll_cod_parque,ll_rut_contac,ll_num_reclamo
datetime	ldt_fec_estado,ldt_fec_crea

tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
ls_pasa												= 'N'
is_email												= 'C'
ll_tot_reg											= tab_1.tabpage_1.dw_asig_sol_nuevo.rowcount()
if ll_tot_reg>0 then
	SELECT	"NOMBRE",				"EMAIL" 
	INTO		:ls_nombre_usuario,	:ls_email_de 
	FROM		"ENCARGADOS"  
	WHERE		( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) 
	USING		sqlca;			
	if isnull(ls_email_de) or ls_email_de='-' or ls_email_de='' then
		ls_email_de									= 'consulta@nuestrosparques.cl'
	end if
	
	ls_nom_contac									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'nombre_contacto')
	ls_a_pater_contac								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_paterno_contacto')
	ls_a_mater_contac							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_materno_contacto')
	
	ls_cod_solic										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_parque									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'cod_parque')
	ls_nivel											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'nivel')
	ll_rut_contac									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'rut_contacto')
	ldt_fec_crea										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_crea')
	ldt_fec_estado									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	ll_cod_gestion									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ls_user_asig										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	
	if ll_cod_gestion=6 or ll_cod_gestion=12 then
		ls_email_para								= tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'email')
		ls_pasa										= 'S'
	elseif ll_cod_gestion=7 or ll_cod_gestion=8 then
		SELECT	"NOMBRE",				"EMAIL" 
		INTO		:ls_nombre_usuario,	:ls_email_para 
		FROM		"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_user_asig
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_email_para) and ls_email_para<>'-' and ls_email_para<>'' then
				ls_pasa								= 'S'
			else
				ls_pasa								= 'N'
			end if
		else
			ls_pasa									= 'N'
		end if
	end if
	if ls_pasa='S' then
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_glosa_gestion
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_glosa_gestion) and ls_glosa_gestion<>'' then
				ls_glosa_gestion						= ls_glosa_gestion
			else
				ls_glosa_gestion						= ''
			end if
		else
			ls_glosa_gestion							= ''
		end if
		
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip								= ls_descrip
			else
				ls_descrip								= ''
			end if
		else
			ls_descrip									= ''
		end if
		
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_nombre_parq  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."GRUPO" = 1 AND  
					"COD_PARQ"."CODIGO" = :ll_cod_parque
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_nombre_parq) and ls_nombre_parq<>'' then
				ls_nombre_parq						= ls_nombre_parq
			else
				ls_nombre_parq						= ''
			end if
		else
			ls_nombre_parq							= ''
		end if
		ll_num_reclamo								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'numero_reclamo')
		ls_asunto										= +ls_descrip+' '+ls_nombre_parq+' PARQUE CEMENTERIO '+'Nº RECLAMO: '+string(ll_num_reclamo,'###,###,###,###')
		ls_glosa_gestion								= ls_asunto+' USUARIO: '+gs_nombre_usuario+', CON FECHA: '+string(ldt_fec_estado,'dd/mm/yyyy')+' ENVIADO A: '+ls_email_para
		ls_texto											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
		ls_parrafo_2									= ''
		ls_parrafo_3									= ''
		ls_parrafo_4									= ''
		
		SELECT	EnviarMail(:ls_email_de,:ls_email_para,:ls_asunto,:ls_texto) 
		INTO 		:ls_res
		from 		DUAL;
		if ls_res='OK' then
			messagebox("Envio Email","Envio Email Exitoso")
		else
			messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
		end if
		
//		SELECT	F_EnviarMail2(:ll_cod_parque,'CO','mirkom@nuestrosparques.cl','mirkom@nuestrosparques.cl',:ls_asunto,:ls_texto,:ls_parrafo_2,:ls_parrafo_3,:ls_parrafo_4,:ll_num_reclamo,:ls_nom_contac,:ls_a_pater_contac,:ls_a_mater_contac) 
//		INTO 		:ls_res
//		FROM 	DUAL;
//		if ls_res='OK' then
//			messagebox("Email","Envio de Email Exitoso")
//			INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
//							( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",	"CODIGO_GESTION",	"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",	"NIVEL"  )  
//			VALUES		( :ll_num_reclamo,		:ls_cod_solic,				:ldt_fec_crea,		:gs_user,			99,						:ldt_fec_estado,		:ls_texto,				:ls_glosa_gestion,		:ll_rut_contac,					:ll_cod_parque,		:gs_user,	:gs_depto,		:ls_nivel)
//			USING	sqlca;
//			if sqlca.sqlcode = 0 then
//				commit using sqlca;
//				cb_gestionar.triggerevent(clicked!)
//			else
//				rollback using sqlca;
//				messagebox("Error Grabar","Error Grabar Solicitud detalle SQL: "+sqlca.sqlerrtext)
//			end if
//		end if
	else
		messagebox("Advertencia","Usuario Asignado No Registra Email")
	end if
end if
end event

type cb_email from commandbutton within w_asigna_modif_reclamos
boolean visible = false
integer x = 1403
integer y = 1960
integer width = 517
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Enviar Email"
end type

event clicked;string	ls_email_de,ls_email_para,ls_asunto,ls_glosa_email,ls_res,ls_nombre_usuario,ls_cod_solic,ls_nivel,ls_glosa_gestion,ls_descrip,&
		ls_nombre_parq,ls_user_asig
long	ll_tot_reg,ll_cod_parque,ll_cod_gestion,ll_rut_contac,ll_num_reclamo
datetime	ldt_fec_crea,ldt_fec_estado


tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
ll_tot_reg											= tab_1.tabpage_1.dw_asig_sol_nuevo.rowcount()
is_email												= 'U'
if ll_tot_reg>0 then
	SELECT	"NOMBRE",				"EMAIL" 
	INTO		:ls_nombre_usuario,	:ls_email_de 
	FROM		"ENCARGADOS"  
	WHERE	( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) 
	USING		sqlca;			
	if isnull(ls_email_de) or ls_email_de='-' or ls_email_de='' then
		ls_email_de									= 'consulta@nuestrosparques.cl'
	end if
	ll_num_reclamo								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'numero_reclamo')
	ls_cod_solic										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_parque									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'cod_parque')
	ll_rut_contac									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'rut_contacto')
	ls_nivel											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'nivel')
	ll_cod_gestion									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ldt_fec_crea										= tab_1.tabpage_1.dw_asig_sol_origen.getitemdatetime(1,'fecha_crea')
	ls_user_asig										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	ldt_fec_estado									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	
	SELECT	"ENCARGADOS"."EMAIL"  
   	INTO 		:ls_email_para  
    	FROM 	"ENCARGADOS"  
   	WHERE "ENCARGADOS"."CODIGO_USUARIO" = :ls_user_asig
	USING		sqlca;
	if isnull(ls_email_para) or ls_email_para='-' or ls_email_para='' then
		messagebox("Advertencia","Usuario Asignado No Registra Email")
	else
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_glosa_gestion
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_glosa_gestion) and ls_glosa_gestion<>'' then
				ls_glosa_gestion						= ls_glosa_gestion
			else
				ls_glosa_gestion						= ''
			end if
		else
			ls_glosa_gestion							= ''
		end if
		
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip								= ls_descrip
			else
				ls_descrip								= ''
			end if
		else
			ls_descrip									= ''
		end if
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_nombre_parq  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."GRUPO" = 1 AND  
					"COD_PARQ"."CODIGO" = :ll_cod_parque
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_nombre_parq) and ls_nombre_parq<>'' then
				ls_nombre_parq						= ls_nombre_parq
			else
				ls_nombre_parq						= ''
			end if
		else
			ls_nombre_parq							= ''
		end if
		
		ls_asunto										= ls_glosa_gestion+', '+' Nº RECLAMO: '+string(ll_num_reclamo,'###,###,###,###')+', '+ls_nombre_parq+ ' PARQUE CEMENTERIO'
		ls_glosa_email									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
				
		SELECT	EnviarMail(:ls_email_de,:ls_email_para,:ls_asunto,:ls_glosa_email) 
		INTO 		:ls_res
		from 		DUAL;
		if ls_res='OK' then
			messagebox("Envio Email","Envio Email Exitoso")
			INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
							( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",	"CODIGO_GESTION",	"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",	"NIVEL"  )  
			VALUES		( :ll_num_reclamo,		:ls_cod_solic,				:ldt_fec_crea,		:gs_user,			99,						:ldt_fec_estado,		:ls_glosa_email,	:ls_asunto,				:ll_rut_contac,			:ll_cod_parque,		:gs_user,	:gs_depto,		:ls_nivel)
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Solicitud detalle SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
		end if
	end if
end if
end event

type cb_envia_email_cliente from commandbutton within w_asigna_modif_reclamos
boolean visible = false
integer x = 855
integer y = 1960
integer width = 517
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enviar Email Cliente"
end type

event clicked;string		ls_nombre_usuario,ls_email_de,ls_cod_solic,ls_email_para,ls_asunto,ls_texto,ls_res,&
			ls_descrip,ls_nivel,ls_glosa_gestion,ls_nom_contac,ls_a_pater_contac,ls_a_mater_contac,&
			ls_parrafo_2,ls_parrafo_3,ls_parrafo_4,ls_nombre_parq,ls_user_asig,ls_pasa
long		ll_tot_reg,ll_cod_gestion,ll_cod_parque,ll_rut_contac,ll_num_reclamo
datetime	ldt_fec_estado,ldt_fec_crea

tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
ls_pasa												= 'N'
is_email												= 'C'
ll_tot_reg											= tab_1.tabpage_1.dw_asig_sol_nuevo.rowcount()
if ll_tot_reg>0 then
	SELECT	"NOMBRE",				"EMAIL" 
	INTO		:ls_nombre_usuario,	:ls_email_de 
	FROM		"ENCARGADOS"  
	WHERE	( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) 
	USING	sqlca;			
	if isnull(ls_email_de) or ls_email_de='-' or ls_email_de='' then
		ls_email_de									= 'consulta@nuestrosparques.cl'
	end if
	
	ls_nom_contac									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'nombre_contacto')
	ls_a_pater_contac								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_paterno_contacto')
	ls_a_mater_contac							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_materno_contacto')
	
	ls_cod_solic										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ll_cod_parque									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'cod_parque')
	ls_nivel											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'nivel')
	ll_rut_contac									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'rut_contacto')
	ldt_fec_crea										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_crea')
	ldt_fec_estado									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	ll_cod_gestion									= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ls_user_asig										= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	
	if ll_cod_gestion=6 or ll_cod_gestion=12 then
		ls_email_para								= tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'email')
		ls_pasa										= 'S'
	elseif ll_cod_gestion=7 or ll_cod_gestion=8 then
		SELECT	"NOMBRE",				"EMAIL" 
		INTO		:ls_nombre_usuario,	:ls_email_para 
		FROM		"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_user_asig
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_email_para) and ls_email_para<>'-' and ls_email_para<>'' then
				ls_pasa								= 'S'
			else
				ls_pasa								= 'N'
			end if
		else
			ls_pasa									= 'N'
		end if
	end if
	if ls_pasa='S' then
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_glosa_gestion
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_glosa_gestion) and ls_glosa_gestion<>'' then
				ls_glosa_gestion						= ls_glosa_gestion
			else
				ls_glosa_gestion						= ''
			end if
		else
			ls_glosa_gestion							= ''
		end if
		
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip								= ls_descrip
			else
				ls_descrip								= ''
			end if
		else
			ls_descrip									= ''
		end if
		
		SELECT	"COD_PARQ"."NOMBRE"  
			INTO 	:ls_nombre_parq  
		FROM 	"COD_PARQ"  
			WHERE 	"COD_PARQ"."GRUPO" = 1 AND  
					"COD_PARQ"."CODIGO" = :ll_cod_parque
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_nombre_parq) and ls_nombre_parq<>'' then
				ls_nombre_parq						= ls_nombre_parq
			else
				ls_nombre_parq						= ''
			end if
		else
			ls_nombre_parq							= ''
		end if
		ll_num_reclamo								= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'numero_reclamo')
		ls_asunto										= +ls_descrip+' '+ls_nombre_parq+' PARQUE CEMENTERIO '+'Nº RECLAMO: '+string(ll_num_reclamo,'###,###,###,###')
		ls_glosa_gestion								= ls_asunto+' USUARIO: '+gs_nombre_usuario+', CON FECHA: '+string(ldt_fec_estado,'dd/mm/yyyy')+' ENVIADO A: '+ls_email_para
		ls_texto											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
		ls_parrafo_2									= ''
		ls_parrafo_3									= ''
		ls_parrafo_4									= ''
		
//		SELECT	F_EnviarMail2(:ll_cod_parque,'CO',:ls_email_de,:ls_email_para,:ls_asunto,:ls_texto,:ls_parrafo_2,:ls_parrafo_3,:ls_parrafo_4,:ll_num_reclamo,:ls_nom_contac,:ls_a_pater_contac,:ls_a_mater_contac) 
//		INTO 		:ls_res
//		FROM 	DUAL;
		SELECT	EnviarMail(:ls_email_de,:ls_email_para,:ls_asunto,:ls_texto) 
		INTO 		:ls_res
		from 		DUAL;
		if ls_res='OK' then
			messagebox("Email","Envio de Email Exitoso")
			INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
							( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",	"CODIGO_GESTION",	"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",	"NIVEL"  )  
			VALUES		( :ll_num_reclamo,		:ls_cod_solic,				:ldt_fec_crea,		:gs_user,			99,						:ldt_fec_estado,		:ls_texto,				:ls_glosa_gestion,		:ll_rut_contac,					:ll_cod_parque,		:gs_user,	:gs_depto,		:ls_nivel)
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				cb_gestionar.triggerevent(clicked!)
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Solicitud detalle SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		messagebox("Advertencia","Usuario Asignado No Registra Email")
	end if
end if
end event

type tab_1 from tab within w_asigna_modif_reclamos
event create ( )
event destroy ( )
integer x = 27
integer y = 40
integer width = 2802
integer height = 1768
integer taborder = 30
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;long	ll_tot_reg,ll_etapa

if tab_1.selectedtab=1 then
	cb_grabar.visible				= false
	cb_gestionar.visible			= true
	ll_tot_reg						= tab_1.tabpage_1.dw_asig_sol_origen.rowcount() 				
	if ll_tot_reg > 0 then
		if il_cod_gestion<=5 then
		ll_etapa						= 1
	elseif il_cod_gestion>=6 and il_cod_gestion<=11 then	
		ll_etapa						= 2
		if il_cod_gestion=10 then
			ll_etapa					= 3
		end if
	elseif il_cod_gestion>=12 then	
		ll_etapa						= 3	
	end if
		tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('codigo_gestion',idw_detalle5)
		idw_detalle5.settransobject(sqlca)
		if idw_detalle5.retrieve(gs_depto,is_nivel,ll_etapa)=0 then
			idw_detalle5.insertrow(0)
		end if
		tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('usuario_asig',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		if idw_detalle6.retrieve(gs_depto,il_cod_parque)=0 then
			idw_detalle6.insertrow(0)
		end if
		tab_1.tabpage_1.dw_asig_sol_trabajo.getchild('ult_estado_gestion',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		if idw_detalle7.retrieve(gs_depto)=0 then
			idw_detalle7.insertrow(0)
		end if
	end if
elseif tab_1.selectedtab=2 then
	ll_tot_reg						= tab_1.tabpage_2.dw_asig_sol_modif.rowcount() 				
	if ll_tot_reg > 0 then
		tab_1.tabpage_2.dw_asig_sol_modif.getchild('area',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(il_cod_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		tab_1.tabpage_2.dw_asig_sol_modif.getchild('sector',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle2.insertrow(0)
		tab_1.tabpage_2.dw_asig_sol_modif.getchild('sepultura',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.reset()
		idw_detalle3.insertrow(0)
		tab_1.tabpage_2.dw_asig_sol_modif.getchild('serie',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		idw_detalle4.reset()
		idw_detalle4.insertrow(0)
	end if
end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2766
integer height = 1648
long backcolor = 67108864
string text = "Asignación Solicitud"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
dw_asig_sol_trabajo dw_asig_sol_trabajo
dw_asig_sol_origen dw_asig_sol_origen
dw_asig_sol_nuevo dw_asig_sol_nuevo
end type

on tabpage_1.create
this.st_1=create st_1
this.dw_asig_sol_trabajo=create dw_asig_sol_trabajo
this.dw_asig_sol_origen=create dw_asig_sol_origen
this.dw_asig_sol_nuevo=create dw_asig_sol_nuevo
this.Control[]={this.st_1,&
this.dw_asig_sol_trabajo,&
this.dw_asig_sol_origen,&
this.dw_asig_sol_nuevo}
end on

on tabpage_1.destroy
destroy(this.st_1)
destroy(this.dw_asig_sol_trabajo)
destroy(this.dw_asig_sol_origen)
destroy(this.dw_asig_sol_nuevo)
end on

type st_1 from statictext within tabpage_1
integer x = 2117
integer y = 924
integer width = 507
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "Tareas Pendientes"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_asig_sol_trabajo from datawindow within tabpage_1
integer x = 55
integer y = 964
integer width = 2656
integer height = 668
integer taborder = 30
string title = "none"
string dataobject = "dw_asigna_modif_reclamo_origen_trab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string	ls_cod_solic,ls_user_asig
long	ll_tot_reg

ls_cod_solic			= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
ls_user_asig			= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
ll_tot_reg			= tab_1.tabpage_1.dw_asig_sol_trabajo.retrieve(ls_cod_solic,ls_user_asig)
end event

type dw_asig_sol_origen from datawindow within tabpage_1
integer x = 32
integer width = 2706
integer height = 372
integer taborder = 40
string title = "none"
string dataobject = "dw_asigna_modif_reclamo_origen"
boolean border = false
boolean livescroll = true
end type

type dw_asig_sol_nuevo from datawindow within tabpage_1
integer x = 50
integer y = 360
integer width = 2665
integer height = 604
integer taborder = 20
string title = "none"
string dataobject = "dw_asigna_modif_reclamo_origen_nuevo"
boolean border = false
boolean livescroll = true
end type

event clicked;string		ls_columna,ls_fecha
datetime	ldt_fecha

ls_columna = dwo.name
if ls_columna = 'p_fec_compro' then
	ldt_fecha											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_compromiso')
	if f_valida_fecha(string(ldt_fecha,'dd/mm/yyyy')) = -1 then 
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_compromiso',today())
		tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
		tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('fecha_compromiso')
		return
	end if	
	if not isnull(ldt_fecha) then
		ls_fecha 										= string(ldt_fecha,'dd/mm/yyyy')
	else
		ls_fecha 										= string(today(),gs_formato_fecha)
	end if	
	OpenWithParm(w_calendar,ls_fecha)
	IF Message.StringParm <> ls_fecha THEN
		ls_fecha 										= Message.StringParm
		ldt_fecha										= datetime(date(ls_fecha))
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_compromiso',ldt_fecha)
		wf_modif_itemchanged('fecha_compromiso')
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	end if
end if		
end event

event itemchanged;string		ls_columna,ls_user_asig,ls_pasa,ls_nulo,ls_depto_crea,ls_cod_solic_ant,ls_descrip,ls_ult_glosa,ls_usuario_asig
long		ll_gestion_ant,ll_gestion_act,ll_nulo,ll_cod_parque_ant,ll_rut_contac_ant,ll_gestion_consul,ll_dias_compr,ll_gestion_asignador,ll_cod_reclamo
datetime	ldt_nulo,ldt_fec_estado,ldt_fec_crea_ant,ldt_fec_compr

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
tab_1.tabpage_1.dw_asig_sol_origen.accepttext()
tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
SELECT	sysdate
INTO 		:ldt_fec_estado
FROM		"TASA"  
WHERE	"TASA"."LOOK" = 1   
USING	sqlca ;

ls_columna = dwo.name
ll_cod_parque_ant																				= gl_codigo_parque	//il_cod_parque
ls_cod_solic_ant																				= tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'codigo_solicitud')
ldt_fec_crea_ant																				= tab_1.tabpage_1.dw_asig_sol_origen.getitemdatetime(1,'fecha_crea')
ll_rut_contac_ant																				= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'rut_contacto')
ll_gestion_ant																					= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'ult_estado_gestion')
ll_cod_reclamo																					= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'codigo_reclamo')

ls_usuario_asig																					= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getitemstring(w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getrow(),'usuario_asignado')

SELECT 		"RECLAMO_CODIGO_RECLAMO"."DIAS_GESTION"  
INTO 			:ll_dias_compr  
FROM 		"RECLAMO_CODIGO_RECLAMO"  
WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_cod_reclamo 
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_dias_compr) and ll_dias_compr>0 then
		ll_dias_compr																			= ll_dias_compr
	else
		ll_dias_compr																			= 0
	end if
else
	ll_dias_compr																				= 0
end if
if ls_columna = 'codigo_gestion' then
	ll_gestion_act																				= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	if ll_gestion_act = 10 then
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_solucion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	end if
	if ll_gestion_ant = 0 and ll_gestion_act <> 1 and ll_gestion_act <> 2 and ll_gestion_act <> 3 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 1 and ll_gestion_act <> 2 and  ll_gestion_act <> 3 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 2 and ll_gestion_act <> 1 and ll_gestion_act <> 3 and ll_gestion_act <> 4 and ll_gestion_act <> 10 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 3 and ll_gestion_act <> 1 and ll_gestion_act <> 2 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 4 and ll_gestion_act <> 5 and ll_gestion_act <> 6 and ll_gestion_act <> 10 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 2 and ll_gestion_act = 4 and ls_usuario_asig <> gs_user then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión, recuerde debe Recepcionardo Usuario Asignado "+ls_usuario_asig)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 5 and ll_gestion_act<>1 and ll_gestion_act <> 4 and ll_gestion_act <> 6 and ll_gestion_act <> 10 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'	
	elseif ll_gestion_ant = 6 and ll_gestion_act <> 7 and ll_gestion_act <> 8 and ll_gestion_act <> 10 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 7 and ll_gestion_act <> 10 and ll_gestion_act <> 11 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 8 and ll_gestion_act <> 9 and ll_gestion_act <> 10 and ll_gestion_act <> 11 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 9 and ll_gestion_act <> 7 and ll_gestion_act <> 8 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'	
	elseif ll_gestion_ant = 10 and ll_gestion_act <> 9 and ll_gestion_act <> 12 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'	
	elseif ll_gestion_ant = 11 and ll_gestion_act <> 6 and ll_gestion_act <> 9 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'
	elseif ll_gestion_ant = 12 and ll_gestion_act <> 0 then
		messagebox("Advertencia","No Puede Ingresar Tipo de Gestión")
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_user_asig)
		tab_1.tabpage_1.dw_asig_sol_nuevo.object.usuario_asig.protect			= 1
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		ls_pasa		= 'N'		
	else
		ls_pasa		= 'S'
	end if
	if ls_pasa='N' then
		tab_1.tabpage_1.dw_asig_sol_trabajo.reset()
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'depto_asig',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'nivel',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
	elseif ls_pasa='S' then
		if ll_gestion_act=1 or ll_gestion_act=3 or ll_gestion_act=4 or ll_gestion_act=5 or ll_gestion_act=7 or ll_gestion_act=8 or ll_gestion_act=9 or ll_gestion_act=10 or ll_gestion_act=11 then
			if ll_gestion_act=1 or ll_gestion_act=4 or ll_gestion_act=9 or ll_gestion_act=10 then
				ls_user_asig																		= gs_user
			elseif ll_gestion_act=3 or ll_gestion_act=5 or ll_gestion_act=7 or ll_gestion_act=8 or ll_gestion_act=11 then
				ll_cod_parque_ant																= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'cod_parque')
				ls_cod_solic_ant																= tab_1.tabpage_1.dw_asig_sol_origen.getitemstring(1,'codigo_solicitud')
				ldt_fec_crea_ant																= tab_1.tabpage_1.dw_asig_sol_origen.getitemdatetime(1,'fecha_crea')
				ll_rut_contac_ant																= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'rut_contacto')
				if ll_gestion_act=3 then
					ll_gestion_asignador														= 0
				elseif ll_gestion_act=5 or ll_gestion_act=7 or ll_gestion_act=8 then
					ll_gestion_asignador														= 2
				elseif ll_gestion_act=11 then
					ll_gestion_asignador														= 7
				end if
				SELECT DISTINCT "RECLAMO_SOLICITUD_DETALLE"."USUARIO_CREA"  
				INTO		:ls_user_asig		
				FROM 	"RECLAMO_SOLICITUD_DETALLE"
				WHERE	"RECLAMO_SOLICITUD_DETALLE"."COD_PARQUE" = :ll_cod_parque_ant AND  
							"RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLICITUD" = :ls_cod_solic_ant AND  
							"RECLAMO_SOLICITUD_DETALLE"."FECHA_CREA" = :ldt_fec_crea_ant AND  
							"RECLAMO_SOLICITUD_DETALLE"."RUT_CONTACTO" = :ll_rut_contac_ant AND
							"RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = :ll_gestion_asignador
				USING	sqlca;	
				if sqlca.sqlcode=0 then
					if not isnull(ls_user_asig) then
						ls_user_asig																	= ls_user_asig
					else
						ls_user_asig																	= ''
					end if
				else
					ls_user_asig																		= gs_user
				end if
			end if
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_user_asig)
			tab_1.tabpage_1.dw_asig_sol_nuevo.object.usuario_asig.protect			= 1
			if ll_gestion_act =10 or  ll_gestion_act =7 then
				tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_notificacion',5)
			end if
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
			wf_modif_itemchanged('usuario_asig')
		elseif ll_gestion_act=2 then
			wf_modif_itemchanged(ls_columna)
			tab_1.tabpage_1.dw_asig_sol_nuevo.getchild('usuario_asig',idw_detalle6)
			idw_detalle6.settransobject(sqlca)
			if idw_detalle6.retrieve(gs_depto,gl_codigo_parque)=0 then	//il_cod_parque
				idw_detalle6.insertrow(0)
			end if
			tab_1.tabpage_1.dw_asig_sol_nuevo.object.usuario_asig.protect			= 0
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		elseif ll_gestion_act=6 then
			ls_user_asig																				= gs_user
//			ldt_fec_compr																			= datetime((RelativeDate(date(ldt_fec_estado),+ ll_dias_compr)),time('00:00:00'))
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_user_asig)
			// Nueva Funcion
//			ldt_fec_compr																			= f_retorna_fecha_vcto_requerimiento(ldt_fec_estado,ll_dias_compr)
//			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_compromiso',ldt_fec_compr)
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
			wf_modif_itemchanged('usuario_asig')
			wf_modif_itemchanged('fecha_compromiso')
			tab_1.tabpage_1.dw_asig_sol_nuevo.object.usuario_asig.protect			= 1
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		elseif ll_gestion_act=12 then
			ls_user_asig																				= gs_user
			ldt_fec_compr																			= tab_1.tabpage_1.dw_asig_sol_origen.getitemdatetime(1,'reclamo_solicitud_detalle_fecha_compromiso')
			// Nueva Funcion
			ldt_fec_compr																			= f_retorna_fecha_vcto_requerimiento(ldt_fec_estado,ll_dias_compr)
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_fec_estado)
			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'usuario_asig',ls_user_asig)
//			tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_compromiso',ldt_fec_compr)
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
			wf_modif_itemchanged('usuario_asig')
			tab_1.tabpage_1.dw_asig_sol_nuevo.object.usuario_asig.protect			= 1
			tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
		else
			wf_modif_itemchanged(ls_columna)
		end if
	end if
elseif ls_columna = 'usuario_asig' then
	wf_modif_itemchanged(ls_columna)
elseif ls_columna = 'observacion' then
	wf_modif_itemchanged(ls_columna)
elseif ls_columna = 'fecha_compromiso' then
	wf_modif_itemchanged(ls_columna)	
end if
tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2766
integer height = 1648
long backcolor = 67108864
string text = "Modificación Solicitud"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_asig_sol_modif dw_asig_sol_modif
end type

on tabpage_2.create
this.dw_asig_sol_modif=create dw_asig_sol_modif
this.Control[]={this.dw_asig_sol_modif}
end on

on tabpage_2.destroy
destroy(this.dw_asig_sol_modif)
end on

type dw_asig_sol_modif from datawindow within tabpage_2
integer x = 9
integer y = 16
integer width = 2720
integer height = 1444
integer taborder = 40
string title = "none"
string dataobject = "dw_asigna_modif_reclamo_origen_modif"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string		ls_columna,ls_area,ls_base,ls_sector,ls_nulo
long		ll_marca

setnull(ls_nulo)
ls_columna						= dwo.name
if ls_columna='serie' then
	ls_base						=  tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'base')			
	tab_1.tabpage_2.dw_asig_sol_modif.getchild('serie',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	if idw_detalle4.retrieve(ls_base)=0 then
		idw_detalle4.insertrow(0)
	end if
elseif ls_columna='area' then
	tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,'sector',ls_nulo)
	tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,'sepultura',ls_nulo)
	tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	il_cod_parque																					= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'cod_parque')
	tab_1.tabpage_2.dw_asig_sol_modif.getchild('area',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(il_cod_parque)=0 then
		idw_detalle.insertrow(0)
	end if
elseif ls_columna='sector' then
	tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,'sepultura',ls_nulo)
	tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	il_cod_parque																					= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'cod_parque')
	ls_area																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'area')
	tab_1.tabpage_2.dw_asig_sol_modif.getchild('sector',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(il_cod_parque,ls_area)=0 then
		idw_detalle2.insertrow(0)
	end if	
elseif ls_columna='sepultura' then
	il_cod_parque																					= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'cod_parque')
	ls_sector																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'sector')
	tab_1.tabpage_2.dw_asig_sol_modif.getchild('sepultura',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(il_cod_parque,ls_sector)=0 then
		idw_detalle3.insertrow(0)
	end if		
elseif ls_columna='c_marca' then
	ll_marca																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'c_marca')
	if ll_marca=0 then
		tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect							= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect						= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect						= 0	
		tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect			= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect			= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect		= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect		= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect				= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect						= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect			= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect			= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect						= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect							= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect						= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect					= 0
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
		cb_grabar.visible																			= true
		cb_gestionar.visible																		= false
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	else
		tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect							= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect						= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect						= 1	
		tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect			= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect			= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect		= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect		= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect				= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect						= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect			= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect			= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect						= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect							= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect						= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect					= 1
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
		cb_grabar.visible																			= false
		cb_gestionar.visible																		= true
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	end if
end if
end event

type cb_limpiar from commandbutton within w_asigna_modif_reclamos
integer x = 1207
integer y = 1828
integer width = 347
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long		ll_tot_reg1,ll_tot_reg2,ll_nulo
String		ls_nulo
datetime	ldt_nulo

Setnull(ll_nulo);Setnull(ldt_nulo);Setnull(ls_nulo)
tab_1.tabpage_1.dw_asig_sol_origen.dataobject 										= 'dw_asigna_modif_reclamo_origen'
tab_1.tabpage_1.dw_asig_sol_origen.settransobject(sqlca)
tab_1.tabpage_2.dw_asig_sol_modif.dataobject 										= 'dw_asigna_modif_reclamo_origen_modif'
tab_1.tabpage_2.dw_asig_sol_modif.settransobject(sqlca)

tab_1.tabpage_2.dw_asig_sol_modif.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(il_cod_parque)=0 then
	idw_detalle.insertrow(0)
end if
tab_1.tabpage_2.dw_asig_sol_modif.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.reset()
idw_detalle2.insertrow(0)
tab_1.tabpage_2.dw_asig_sol_modif.getchild('sepultura',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.reset()
idw_detalle3.insertrow(0)
tab_1.tabpage_2.dw_asig_sol_modif.getchild('serie',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.reset()
idw_detalle4.insertrow(0)
ll_tot_reg1																						= tab_1.tabpage_1.dw_asig_sol_origen.retrieve(il_num_reclamo,il_cod_gestion,idt_fec_gestion)
ll_tot_reg2																						= tab_1.tabpage_2.dw_asig_sol_modif.retrieve(il_num_reclamo,il_cod_gestion,idt_fec_gestion)
if ll_tot_reg2>0 then
	tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect							= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect						= 1	
	tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect		= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect		= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect				= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect			= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect						= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect							= 1
	tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect						= 1	
	tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect					= 1
	cb_grabar.visible																			= false
	cb_gestionar.visible																		= true
	tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,"c_marca",0)
	if tab_1.selectedtab=1 then
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'codigo_gestion',ll_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'fecha_gestion',ldt_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'glosa_gestion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,'observacion',ls_nulo)
		tab_1.tabpage_1.dw_asig_sol_nuevo.setitem(1,"codigo_notificacion",5)
	end if
	tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
else
	messagebox("Advertencia","No Registra Datos")
end if




end event

type cb_cerrar from commandbutton within w_asigna_modif_reclamos
integer x = 2478
integer y = 1828
integer width = 347
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asigna_modif_reclamos)
end event

type cb_gestionar from commandbutton within w_asigna_modif_reclamos
integer x = 23
integer y = 1828
integer width = 416
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar Gestión"
end type

event clicked;string 	ls_cod_solicitud,ls_user_crea,ls_observ,ls_glosa_gestion,ls_user_asig,ls_depto_asig,ls_nivel,ls_pasa,ls_string,ls_obs,ls_reasigna,ls_glosa,ls_usuario_asig,ls_nuvel
long		ll_rut_contac,ll_cod_gestion,ll_cod_parque,ll_cod_gestion_ant,ll_fila,ll_graba,ll_res,ll_res_email,ll_num_reclamo,ll_tot_reg,ll_indi,ll_nro_reclamo,ll_nro_reclamo_ini,&
			ll_numero_reclamo,ll_rut_contacto, ll_cod_solicitud,ll_cod_notificacion,ll_cod_gestion2
datetime	ldt_fec_crea,ldt_fec_gestion,ldt_fec_compro,ldt_fec_gestion_ant,ldt_fec_ini,ldt_fec_fin,ldt_fecha_comp,ldt_nulo,ldt_fecha_crea,ldt_fecha_gestion,ldt_fecha_compromiso,&
			ldt_fecha_gestion_graba,ldt_fecha_gestion2

Setnull(ldt_nulo)
tab_1.tabpage_1.dw_asig_sol_origen.accepttext()
tab_1.tabpage_1.dw_asig_sol_nuevo.accepttext()
if is_email = 'N' then
	ls_pasa														= 'N'
	ll_num_reclamo											= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'reclamo_solicitud_numero_reclamo')
	ll_cod_gestion_ant											= tab_1.tabpage_1.dw_asig_sol_origen.getitemnumber(1,'ult_estado_gestion')
	ldt_fec_gestion_ant										= tab_1.tabpage_1.dw_asig_sol_origen.getitemdatetime(1,'ult_fecha_gestion')
	ls_cod_solicitud												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'codigo_solicitud')
	ldt_fec_crea													= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_crea')
	ll_rut_contac												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'rut_contacto')
	ls_user_crea												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_crea')
	ll_cod_gestion												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'codigo_gestion')
	ldt_fec_gestion												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_gestion')
	ls_observ													= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'observacion')
	ls_glosa_gestion											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'glosa_gestion')
	ll_cod_parque												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemnumber(1,'cod_parque')
	ls_user_asig													= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'usuario_asig')
	ls_depto_asig												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'depto_asig')
	ls_nivel														= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'nivel')
	ldt_fec_compro												= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemdatetime(1,'fecha_compromiso')
	
	if not isnull(ll_num_reclamo) and ll_num_reclamo>0 and not isnull(ls_cod_solicitud) and ls_cod_solicitud<>'' and not isnull(ldt_fec_crea) and not isnull(ll_rut_contac) and ll_rut_contac>0 and not isnull(ls_user_crea) and ls_user_crea<>'' and &
	  not isnull(ll_cod_gestion) and ll_cod_gestion>0 and not isnull(ldt_fec_gestion) and not isnull(ls_observ) and ls_observ<>'' and not isnull(ls_glosa_gestion) and ls_glosa_gestion<>'' and &
	  not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_user_asig) and ls_user_asig<>'' and not isnull(ls_depto_asig) and ls_depto_asig<>'' and not isnull(ls_nivel) and ls_nivel<>'' then
		ls_pasa													= 'S'
		if ll_cod_gestion = 6 and ls_pasa= 'S' then
			if not isnull(ldt_fec_compro) then
				ls_pasa											= 'S'
			else
				ls_pasa											= 'N'
			end if
		end if
	else
		ls_pasa													= 'N'
	end if
	if ls_pasa='S' then
		if ll_cod_gestion=11 then
			ls_reasigna											= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'reasignacion')
			if isnull(ls_reasigna) or ls_reasigna=''  then
				messagebox("Advertencia","Debe Seleccionar Re-Asignar Gestión Si/No")
				tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('reasignacion')
			end if
		else
		ll_res														= messagebox("Grabar", 'Desea Grabar Asignación Solicitud Requerimiento', Exclamation!, YesNo!, 2)
			if ll_res=1 then
				if tab_1.tabpage_1.dw_asig_sol_nuevo.update() = 1 then
					commit using sqlca;
//					if ll_cod_gestion_ant=0 and ll_cod_gestion=2 then
//						SELECT sysdate   INTO :ldt_fec_gestion  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
//						ls_obs									= 'SE RECEPCIONA SOLICITUD REQUERIMIENTO N° '+string(ll_num_reclamo)+', USUARIO: '+gs_user+' CON FECHA '+string(gdt_fec_sistema,'dd/mm/yyyy')
//						INSERT INTO 		"RECLAMO_SOLICITUD_DETALLE"  
//											( "NUMERO_RECLAMO",		"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA", 	"CODIGO_GESTION",	"FECHA_GESTION", 	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO", 	"COD_PARQUE", 	"USUARIO_ASIG", 	"DEPTO_ASIG", 	"NIVEL",	"FECHA_COMPROMISO", 	"CODIGO_SOLUCION", 	"CODIGO_NOTIFICACION" )  
//						VALUES 			( :ll_num_reclamo,   			:ls_cod_solicitud,   		:ldt_fec_crea, 		:gs_user, 				1, 							:ldt_fec_gestion,   		:ls_obs,   			:ls_glosa_gestion,   	:ll_rut_contac,   		:ll_cod_parque,   	:gs_user,   			:gs_depto,   		'2',   		null,   							null,   						5 )  
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
//					elseif ll_cod_gestion=11 then
					if ll_cod_gestion=11 then
						ls_reasigna		= tab_1.tabpage_1.dw_asig_sol_nuevo.getitemstring(1,'reasignacion')
						if ls_reasigna='S' then
							SELECT sysdate   INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
							ldt_fecha_gestion_graba					= gdt_fec_sistema				
							ls_obs										= 'SE RE-ASIGNA SOLICITUD REQUERIMIENTO N° '+string(ll_num_reclamo)+', USUARIO: '+gs_user+' CON FECHA '+string(gdt_fec_sistema,'dd/mm/yyyy')
							SELECT	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO",	"RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLICITUD",	"RECLAMO_SOLICITUD_DETALLE"."FECHA_CREA", 	"RECLAMO_SOLICITUD_DETALLE"."USUARIO_CREA", 	"RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION",	"RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION",	"RECLAMO_SOLICITUD_DETALLE"."OBSERVACION",	"RECLAMO_SOLICITUD_DETALLE"."GLOSA_GESTION",	"RECLAMO_SOLICITUD_DETALLE"."RUT_CONTACTO",	"RECLAMO_SOLICITUD_DETALLE"."COD_PARQUE", 	"RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG",	"RECLAMO_SOLICITUD_DETALLE"."DEPTO_ASIG",		"RECLAMO_SOLICITUD_DETALLE"."NIVEL",		"RECLAMO_SOLICITUD_DETALLE"."FECHA_COMPROMISO",		"RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLUCION",	"RECLAMO_SOLICITUD_DETALLE"."CODIGO_NOTIFICACION",	"RECLAMO_SOLICITUD_DETALLE"."REASIGNACION" 
							INTO 		:ll_numero_reclamo,													:ls_cod_solicitud, 														:ldt_fecha_crea,												:ls_user_crea,														:ll_cod_gestion2,													:ldt_fecha_gestion2, 										:ls_obs,   														:ls_glosa,   															:ll_rut_contacto,   													:ll_cod_parque,   												:ls_usuario_asig,   											:ls_depto_asig,   												:ls_nuvel,   												:ldt_fecha_compromiso,   												:ll_cod_solicitud,   														:ll_cod_notificacion,   														:ls_reasigna 
							FROM 	"RECLAMO_SOLICITUD_DETALLE"  
							WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_num_reclamo ) AND  
									  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 2 ) AND  
									  ( "RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION" = ( 	SELECT	max("RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION")
																													FROM 	"RECLAMO_SOLICITUD_DETALLE" 
																													WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_num_reclamo ) AND 
																																( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 2 )  ) ) 
							USING		sqlca;
							if sqlca.sqlcode=0 then
								INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
												( "NUMERO_RECLAMO", 	"CODIGO_SOLICITUD", 	"FECHA_CREA",	"USUARIO_CREA", 	"CODIGO_GESTION", 	"FECHA_GESTION",			"OBSERVACION",	"GLOSA_GESTION", 	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",		"NIVEL",		"FECHA_COMPROMISO",	"CODIGO_SOLUCION",	"CODIGO_NOTIFICACION",	"REASIGNACION" )
								VALUES 		( :ll_num_reclamo,		:ls_cod_solicitud, 			:ldt_fecha_crea,	:gs_user,				:ll_cod_gestion2,		:ldt_fecha_gestion_graba, 	:ls_obs,   			:ls_glosa,   				:ll_rut_contacto,   		:ll_cod_parque, 	:ls_usuario_asig,	:ls_depto_asig,		:ls_nuvel,   	:ldt_fecha_compromiso, :ll_cod_solicitud, 			:ll_cod_notificacion,			:ls_reasigna  )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
						end if
					end if
					ll_graba											= wf_graba_gestion(ls_user_crea,ll_cod_gestion,ldt_fec_gestion,ls_glosa_gestion,ls_user_asig,ls_depto_asig,ls_nivel,il_num_reclamo)
					if ll_graba>=1 then
						messagebox("Grabar","Grabación Exitosa")
						if ll_cod_gestion=2 or ll_cod_gestion=3 or ll_cod_gestion=5 or ll_cod_gestion=8 or ll_cod_gestion=11 then
							cb_email.triggerevent(clicked!)
						elseif ll_cod_gestion=7 then		
							cb_envia_email_cliente.triggerevent(clicked!)
						elseif ll_cod_gestion=6 or ll_cod_gestion=12 then
							ll_res_email								= messagebox("Advertencia","Desea Enviar Email Cliente",Exclamation!, YesNo!, 2)
							if ll_res_email=1 then
								cb_1.triggerevent(clicked!)
	//							cb_envia_email_cliente.triggerevent(clicked!)
							end if
						end if
						if isvalid(w_administrar_reclamos) then
							ldt_fec_ini								= datetime(date(w_administrar_reclamos.em_inicio.text),time('00:00:00'))
							ldt_fec_fin								= datetime(date(w_administrar_reclamos.em_termino.text),time('23:59:59'))
							ll_fila										= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getrow()
							ll_nro_reclamo_ini						= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_fila,'numero_reclamo')
							f_nivel_codigo(ll_cod_parque,ldt_fec_ini,ldt_fec_fin)
							ll_tot_reg								= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.rowcount()
							if ll_fila>0 then
								for ll_indi=1 to ll_tot_reg
									ll_nro_reclamo				= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_indi,'numero_reclamo')
									ldt_fecha_comp			= f_calcular_dias_reclamo( ll_nro_reclamo )
									if isnull(ldt_fecha_comp) or ldt_fecha_comp = datetime(date('01/01/1901'),time('00:00:00')) then
										w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_nulo)
									else
										w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_fecha_comp)
									end if
								next
								w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.accepttext()
								ll_fila								= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.Find('numero_reclamo = '+string(ll_nro_reclamo_ini), 1,ll_tot_reg)
								w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.scrolltorow(ll_fila)
								w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.setfocus()
							end if
						end if
						w_administrar_reclamos.pb_ok.triggerevent(clicked!)
						close(w_asigna_modif_reclamos)
					end if
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error Grabar Detalle Asignación Solicitud Requerimiento SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	else
		if isnull(ll_num_reclamo) or ll_num_reclamo=0 then
			messagebox("Advertencia","Debe Ingresar Número Requerimiento")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('numero_reclamo')
		elseif isnull(ls_cod_solicitud) or ls_cod_solicitud='' then
			messagebox("Advertencia"," Debe Ingresar Código Solicitud")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('codigo_solicitud')
		elseif isnull(ldt_fec_crea) then
			messagebox("Advertencia","Debe Ingresar Fecha Creación Solicitud")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('fecha_crea')
		elseif isnull(ll_rut_contac) or ll_rut_contac=0 then
			messagebox("Advertencia","Debe Ingresar Rut Contacto")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('rut_contacto')	
		elseif isnull(ls_user_crea) or ls_user_crea='' then
			messagebox("Advertencia","Debe Ingresar Usuario Creador de Solicitud")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('usuario_crea')
		elseif isnull(ll_cod_gestion) or ll_cod_gestion=0 then
			messagebox("Advertencia","Debe Ingresar Código de Gestión")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('codigo_gestion')
		elseif isnull(ldt_fec_gestion) then
			messagebox("Advertencia","Debe Ingresar Fecha de Gestión")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('fecha_gestion')
		elseif isnull(ls_observ) or ls_observ='' then
			messagebox("Advertencia","Debe Ingresar Observación")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('observacion')
		elseif isnull(ls_glosa_gestion) or ls_glosa_gestion='' then
			messagebox("Advertencia","Debe Ingresar Glosa Gestión")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('glosa_gestion')
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Debe Ingresar Código Parque")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('cod_parque')
		elseif isnull(ls_user_asig) or ls_user_asig='' then
			messagebox("Advertencia","Debe Ingresar Usuario Asignado")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('usuario_asig')
		elseif isnull(ls_depto_asig) or ls_depto_asig='' then
			messagebox("Advertencia","Debe Ingresar Departamento Asignado")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('depto_asig')
		elseif isnull(ls_nivel) or ls_nivel='' then
			messagebox("Advertencia","Debe Ingresar Nivel Usuario Asignado")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('nivel')
		elseif isnull(ldt_fec_compro) then
			messagebox("Advertencia","Debe Ingresar Fecha Compromiso")
			tab_1.tabpage_1.dw_asig_sol_nuevo.setfocus()
			tab_1.tabpage_1.dw_asig_sol_nuevo.setcolumn('fecha_compromiso')	
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_asigna_modif_reclamos
integer x = 18
integer y = 1828
integer width = 521
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar Modificación"
end type

event clicked;string	ls_ult_glosa,ls_observ,ls_base,ls_serie,ls_estado_reg,ls_nombre,ls_a_pater,ls_a_mater,ls_email,ls_fono_part,ls_fono_comer,&
		ls_celular,ls_area,ls_sector,ls_sepult,ls_glosa_gestion,ls_descrip,ls_usuario_asig,ls_depto_asig,ls_nivel,ls_cod_solic
long	ll_res,ll_numero,ll_rut,ll_parque,ll_cod_gest,ll_rut_contacto,ll_tot_reg1,ll_num_reclamo
datetime	ldt_fec_crea,ldt_fec_gest

tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE	"TASA"."LOOK" = 1
USING	sqlca ;

ll_num_reclamo																						= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'numero_reclamo')
ls_base																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'base')
ls_serie																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'serie')
ll_numero																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'numero')
ls_estado_reg																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'cod_estado_reg')
ls_nombre																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'nombre_contacto')
ls_a_pater																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_paterno_contacto')
ls_a_mater																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'a_materno_contacto')
ll_rut																										= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'rut_contacto')
ls_email																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'email')
ls_fono_part																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'fono_particular')
ls_fono_comer																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'fono_comercial')
ls_celular																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'celular')
ls_area																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'area')
ls_sector																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'sector')
ls_sepult																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'sepultura')
ll_parque																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'cod_parque')
ls_cod_solic																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'codigo_solicitud')
ldt_fec_crea																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemdatetime(1,'fecha_crea')
ll_cod_gest																								= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'ult_estado_gestion')
ldt_fec_gest																								=  tab_1.tabpage_2.dw_asig_sol_modif.getitemdatetime(1,'ult_fecha_gestion')
ll_rut_contacto																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemnumber(1,'rut_contacto')

ls_usuario_asig																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'usuario_asignado')
ls_depto_asig																							= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'depto_asig')
ls_nivel																									= tab_1.tabpage_2.dw_asig_sol_modif.getitemstring(1,'nivel')
ls_observ																								= f_modifica_reg(ls_base,ls_serie,ll_numero,ls_estado_reg,ls_nombre,ls_a_pater,ls_a_mater,ll_rut	,ls_email,ls_fono_part,ls_fono_comer	,ls_celular,ls_area,ls_sector,ls_sepult,ll_parque,ls_cod_solic,ldt_fec_crea,ll_cod_gest,ldt_fec_gest,ll_rut_contacto)
if not isnull(ls_observ) and ls_observ<>'' then
	ll_res																									= MessageBox("Grabar", 'Esta Seguro de Grabar Modificaciones del Registro', Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,"usuario_modif",gs_user)  
		tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,"fecha_modif",gdt_fec_sistema)
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
		
		ll_cod_gest																						= 98
		ldt_fec_gest																						= gdt_fec_sistema
		
		SELECT	"RECLAMO_ESTADO"."DESCRIPCION" 
		INTO		:ls_ult_glosa
		FROM		"RECLAMO_ESTADO"  
		WHERE 	( "RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gest )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_ult_glosa) and ls_ult_glosa<>'' then
				ls_ult_glosa																					= ls_ult_glosa
			else
				ls_ult_glosa																					= ''
			end if
		else
			ls_ult_glosa																						= ''
		end if
		SELECT	"RECLAMO_CODIGO_TIPO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_cod_solic
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip																					= ls_descrip
			else
				ls_descrip																					= ''
			end if
		else
			ls_descrip																						= ''
		end if
		ls_glosa_gestion																					= ls_ult_glosa+' '+ls_descrip
		ls_observ																							= ls_glosa_gestion+ls_observ
		INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
						( "NUMERO_RECLAMO",	"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",	"CODIGO_GESTION",	"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",	"DEPTO_ASIG",	"NIVEL"  )  
		VALUES		( :ll_num_reclamo,		:ls_cod_solic,				:ldt_fec_crea,		:gs_user,			:ll_cod_gest,			:gdt_fec_sistema,		:ls_observ,			:ls_glosa_gestion,		:ll_rut,					:ll_parque,			:ls_usuario_asig,	:ls_depto_asig,	:ls_nivel)
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			if tab_1.tabpage_2.dw_asig_sol_modif.update() = 1 then
				commit using sqlca;
				messagebox("Grabar","Grabación Exitosa")
				cb_limpiar.triggerevent(clicked!)
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Modificación Requerimiento SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error Grabar Requerimiento Detalle SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	ll_res									= MessageBox("Advertencia", 'Los Datos de la Solicitud No Fueron Modificados~r~n'+&
													'               ¿Desea Modificar Registros?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect									= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect								= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect								= 0	
		tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect					= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect					= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect				= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect				= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect						= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect								= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect					= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect					= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect								= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect									= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect								= 0
		tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect							= 0
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
		cb_grabar.visible																					= true
		cb_gestionar.visible																				= false
		tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,"c_marca",1)
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	elseif ll_res=2 then
		tab_1.tabpage_2.dw_asig_sol_modif.object.base.protect									= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.serie.protect								= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.numero.protect								= 1	
		tab_1.tabpage_2.dw_asig_sol_modif.object.cod_estado_reg.protect					= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.nombre_contacto.protect					= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_paterno_contacto.protect				= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.a_materno_contacto.protect				= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.rut_contacto.protect						= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.email.protect								= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_particular.protect					= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.fono_comercial.protect					= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.celular.protect								= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.area.protect									= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.sector.protect								= 1
		tab_1.tabpage_2.dw_asig_sol_modif.object.sepultura.protect							= 1
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
		cb_grabar.visible																					= false
		cb_gestionar.visible																				= true
		tab_1.tabpage_2.dw_asig_sol_modif.setitem(1,"c_marca",0)
		tab_1.tabpage_2.dw_asig_sol_modif.accepttext()
	end if
end if
end event

