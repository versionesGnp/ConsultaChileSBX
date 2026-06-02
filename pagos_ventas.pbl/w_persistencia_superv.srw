forward
global type w_persistencia_superv from window
end type
type cb_mora_consul from commandbutton within w_persistencia_superv
end type
type dw_vista_5_7 from datawindow within w_persistencia_superv
end type
type cb_proceso_9_12 from commandbutton within w_persistencia_superv
end type
type cb_proceso_bkp from commandbutton within w_persistencia_superv
end type
type cb_exportar from commandbutton within w_persistencia_superv
end type
type cb_mora_grupo from commandbutton within w_persistencia_superv
end type
type st_cuenta from statictext within w_persistencia_superv
end type
type hpb_1 from hprogressbar within w_persistencia_superv
end type
type st_porc from statictext within w_persistencia_superv
end type
type em_termino from editmask within w_persistencia_superv
end type
type cb_proceso from commandbutton within w_persistencia_superv
end type
type dw_superv_venta from datawindow within w_persistencia_superv
end type
type dw_fecha_clasif from datawindow within w_persistencia_superv
end type
type dw_jefe_venta from datawindow within w_persistencia_superv
end type
type cb_limpiar from commandbutton within w_persistencia_superv
end type
type cb_imprimir from commandbutton within w_persistencia_superv
end type
type pb_aceptar from picturebutton within w_persistencia_superv
end type
type cb_cerrar from commandbutton within w_persistencia_superv
end type
type cb_detalle from commandbutton within w_persistencia_superv
end type
type cb_detalle_sup from commandbutton within w_persistencia_superv
end type
type st_fondo from statictext within w_persistencia_superv
end type
type dw_clasificacion from datawindow within w_persistencia_superv
end type
end forward

global type w_persistencia_superv from window
integer width = 3991
integer height = 2176
boolean titlebar = true
string title = "Clasificación Supervisor de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_open ( )
cb_mora_consul cb_mora_consul
dw_vista_5_7 dw_vista_5_7
cb_proceso_9_12 cb_proceso_9_12
cb_proceso_bkp cb_proceso_bkp
cb_exportar cb_exportar
cb_mora_grupo cb_mora_grupo
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
em_termino em_termino
cb_proceso cb_proceso
dw_superv_venta dw_superv_venta
dw_fecha_clasif dw_fecha_clasif
dw_jefe_venta dw_jefe_venta
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_detalle cb_detalle
cb_detalle_sup cb_detalle_sup
st_fondo st_fondo
dw_clasificacion dw_clasificacion
end type
global w_persistencia_superv w_persistencia_superv

type variables
long il_row


end variables

forward prototypes
public subroutine wf_open ()
public function string wf_clasif (string as_cargo, string as_codigo, datetime adt_fecha)
end prototypes

public subroutine wf_open ();long		ll_mes,ll_ano,ll_dia
datetime	ldt_fec_proc,ldt_ult_fec_proc,ldt_fec_gen

if gl_proceso >= 4 then
	//gdt_fec_sistema							= datetime(date(string('02/07/2013')))
	ll_dia											= day(date(gdt_fec_sistema))
	ll_mes										= month(date(gdt_fec_sistema))
	ll_ano											= year(date(gdt_fec_sistema))
	if ll_mes = 1 then
		ll_mes			 						= ll_mes + 11
		ll_ano				 						= ll_ano - 1
	else
		ll_mes			 						= ll_mes - 1
		ll_ano				 						= ll_ano
	end if
	ldt_fec_proc									= f_fecha_fin(ll_mes,ll_ano)
	SELECT	max("CLASIFICA_HIST"."FECHA_CLASIFICA")  
   	INTO		:ldt_ult_fec_proc 
	FROM		"CLASIFICA_HIST"
	USING	sqlca;
	if ldt_fec_proc>ldt_ult_fec_proc then
		if ll_dia>=2 then
			cb_proceso.visible					= true
			cb_mora_consul.visible			= true
			em_termino.visible				= true
			em_termino.text					= string(ldt_fec_proc,'dd/mm/yyyy')
			messagebox("Advertencia","Debe Generar Proceso Clasificaciones (Persistencia), Período "+string(ldt_fec_proc,'dd/mm/yyyy'))
		end if
	end if
	dw_fecha_clasif.dataobject				= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_jefe_venta.dataobject				= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.visible					= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'

elseif gl_proceso = 3 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_jefe_venta.dataobject					= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.getchild('jefe_venta',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_jefe_venta.insertrow(0)
	dw_jefe_venta.setitem(1,'jefe_venta',	gs_user)
	dw_jefe_venta.accepttext()
	dw_jefe_venta.Object.jefe_venta.Protect=1
	dw_jefe_venta.enabled						= false
	dw_superv_venta.visible						= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'
	

elseif gl_proceso = 2 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_agte'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.dataobject					= 'dwe_superv_depto'
	dw_superv_venta.settransobject(sqlca)
	dw_superv_venta.getchild('cod_sup',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_superv_venta.insertrow(0)
	dw_superv_venta.setitem(1,'cod_sup',gs_user)
	dw_superv_venta.accepttext()
	dw_superv_venta.Object.cod_sup.Protect=1
	dw_superv_venta.enabled						= false
	dw_jefe_venta.visible						= false
	cb_detalle_sup.visible						= true
	cb_detalle.text								= '&Detalle Ventas Agente'
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_persistencia_superv)
end if
end subroutine

public function string wf_clasif (string as_cargo, string as_codigo, datetime adt_fecha);string	ls_clasif

//wf_clasif(as_cargo,as_codigo.adt_fecha)
if as_cargo='A' then
	SELECT	"TIPO_CLASIFICA"  
	INTO		:ls_clasif  
	FROM		"CLASIFICA_HIST"  
	WHERE 	( "CLASIFICA_HIST"."COD_AGE" = :as_codigo ) AND  
				( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fecha )
	USING	sqlca;
elseif as_cargo='S' then
	SELECT	"TIPO_CLASIFICA_SUP"  
	INTO		:ls_clasif  
	FROM		"CLASIFICA_HIST_SUP"  
	WHERE 	( "CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo ) AND  
				( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fecha )
	USING	sqlca;
elseif as_cargo='J' then
	SELECT	"TIPO_CLASIFICA_JEF"  
	INTO		:ls_clasif  
	FROM		"CLASIFICA_HIST_JEF"  
	WHERE 	( "CLASIFICA_HIST_JEF"."COD_JEF" = :as_codigo ) AND  
				( "CLASIFICA_HIST_JEF"."FECHA_CLASIFICA_JEF" = :adt_fecha )
	USING	sqlca;	
	
end if
if isnull(ls_clasif) then ls_clasif=''
return ls_clasif
end function

on w_persistencia_superv.create
this.cb_mora_consul=create cb_mora_consul
this.dw_vista_5_7=create dw_vista_5_7
this.cb_proceso_9_12=create cb_proceso_9_12
this.cb_proceso_bkp=create cb_proceso_bkp
this.cb_exportar=create cb_exportar
this.cb_mora_grupo=create cb_mora_grupo
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.em_termino=create em_termino
this.cb_proceso=create cb_proceso
this.dw_superv_venta=create dw_superv_venta
this.dw_fecha_clasif=create dw_fecha_clasif
this.dw_jefe_venta=create dw_jefe_venta
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_detalle=create cb_detalle
this.cb_detalle_sup=create cb_detalle_sup
this.st_fondo=create st_fondo
this.dw_clasificacion=create dw_clasificacion
this.Control[]={this.cb_mora_consul,&
this.dw_vista_5_7,&
this.cb_proceso_9_12,&
this.cb_proceso_bkp,&
this.cb_exportar,&
this.cb_mora_grupo,&
this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.em_termino,&
this.cb_proceso,&
this.dw_superv_venta,&
this.dw_fecha_clasif,&
this.dw_jefe_venta,&
this.cb_limpiar,&
this.cb_imprimir,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_detalle,&
this.cb_detalle_sup,&
this.st_fondo,&
this.dw_clasificacion}
end on

on w_persistencia_superv.destroy
destroy(this.cb_mora_consul)
destroy(this.dw_vista_5_7)
destroy(this.cb_proceso_9_12)
destroy(this.cb_proceso_bkp)
destroy(this.cb_exportar)
destroy(this.cb_mora_grupo)
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.em_termino)
destroy(this.cb_proceso)
destroy(this.dw_superv_venta)
destroy(this.dw_fecha_clasif)
destroy(this.dw_jefe_venta)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_detalle)
destroy(this.cb_detalle_sup)
destroy(this.st_fondo)
destroy(this.dw_clasificacion)
end on

event open;string		ls_pag_vta
long		ll_mes,ll_ano,ll_dia
datetime	ldt_fec_proc,ldt_ult_fec_proc,ldt_fec_gen

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_persistencia_superv)

dw_vista_5_7.dataobject						= 'dw_vista_5_7'
dw_vista_5_7.settransobject(sqlca)

if gl_proceso >= 4 then
	cb_mora_grupo.visible					= true
	//gdt_fec_sistema							= datetime(date(string('03/10/2017')))
	ll_dia											= day(date(gdt_fec_sistema))
	ll_mes										= month(date(gdt_fec_sistema))
	ll_ano											= year(date(gdt_fec_sistema))
	if ll_mes = 1 then
		ll_mes			 						= ll_mes + 11
		ll_ano				 						= ll_ano - 1
	else
		ll_mes			 						= ll_mes - 1
		ll_ano				 						= ll_ano
	end if
	ldt_fec_proc									= f_fecha_fin(ll_mes,ll_ano)
	SELECT	max("CLASIFICA_HIST"."FECHA_CLASIFICA")  
   	INTO		:ldt_ult_fec_proc 
	FROM		"CLASIFICA_HIST"
	USING	sqlca;
	//ldt_ult_fec_proc							= datetime(date(string('30/04/2014')),time('00:00:00'))
	if ldt_fec_proc>ldt_ult_fec_proc then
		if ll_dia>=2 then
			cb_proceso.visible					= true
			cb_mora_consul.visible			= true
			em_termino.visible				= true
			em_termino.text					= string(ldt_fec_proc,'dd/mm/yyyy')
			messagebox("Advertencia","Debe Generar Proceso Clasificaciones (Persistencia), Período "+string(ldt_fec_proc,'dd/mm/yyyy'))
		end if
	end if
	dw_fecha_clasif.dataobject				= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_jefe_venta.dataobject				= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.visible					= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'

elseif gl_proceso = 3 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_jefe_venta.dataobject					= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.getchild('jefe_venta',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_jefe_venta.insertrow(0)
	dw_jefe_venta.setitem(1,'jefe_venta',	gs_user)
	dw_jefe_venta.accepttext()
	dw_jefe_venta.Object.jefe_venta.Protect=1
	dw_jefe_venta.enabled						= false
	dw_superv_venta.visible						= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'
	

elseif gl_proceso = 2 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_agte'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.dataobject					= 'dwe_superv_depto'
	dw_superv_venta.settransobject(sqlca)
	dw_superv_venta.getchild('cod_sup',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_superv_venta.insertrow(0)
	dw_superv_venta.setitem(1,'cod_sup',gs_user)
	dw_superv_venta.accepttext()
	dw_superv_venta.Object.cod_sup.Protect=1
	dw_superv_venta.enabled						= false
	dw_jefe_venta.visible						= false
	cb_detalle_sup.visible						= true
	cb_detalle.text								= '&Detalle Ventas Agente'
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_persistencia_superv)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_mora_consul from commandbutton within w_persistencia_superv
integer x = 2222
integer y = 1916
integer width = 453
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mora Consulta"
end type

event clicked;datetime	ldt_fec_cierre
long		ll_existe_fact,ll_res


ldt_fec_cierre	= datetime(date(em_termino.text),time('00:00:00'))

SELECT	count("FACTURA_OFERTA"."BASE")  
INTO		:ll_existe_fact  
FROM		"FACTURA_OFERTA"  
WHERE	("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S') AND  
			"FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fec_cierre
USING	sqlca;
if isnull(ll_existe_fact) then ll_existe_fact=0
if ll_existe_fact=0 then
	messagebox("Advertencia","No Existe Proceso Facturación con Fecha :"+string(ldt_fec_cierre,'dd/mm/yyyy'))
else
	ll_res					= MessageBox("Advertencia", 'Desea Generar Proceso Mora Consulta, Período '+string(ldt_fec_cierre,'dd/mm/yyyy'), Exclamation!, YesNo!, 2)
	if ll_res=1 then
		DECLARE mora_consul PROCEDURE FOR SP_MORA_CONSULTA(:ldt_fec_cierre);
		EXECUTE mora_consul;
		messagebox("Grabar","Proceso Creación Mora Consulta Creado con Fecha :"+string(ldt_fec_cierre,'dd/mm/yyyy')+ " Grabado con Exito")	
		cb_mora_consul.visible			= false
	end if
end if

end event

type dw_vista_5_7 from datawindow within w_persistencia_superv
integer x = 4005
integer y = 180
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_vista_5_7"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_proceso_9_12 from commandbutton within w_persistencia_superv
boolean visible = false
integer x = 3063
integer y = 2104
integer width = 480
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Proceso"
end type

event clicked;string		ls_codigo,ls_cargo,ls_base,ls_serie,ls_estado,ls_base_consul,ls_serie_consul,ls_repacta,ls_clasif,ls_clasif_lic,ls_pag_vta
long		ll_plazo,ll_cta_pag,ll_mora_actual,ll_cod_parque,ll_rut,ll_sum_pag_post,ll_repac,&
			ll_correl,ll_ctas_pag_1,ll_dias_mora,ll_vtas_fuera,ll_mora_01,ll_dia_venc,ll_mes_venc,ll_ano_venc,ll_dia_01,&
			ll_mes_01,ll_ano_01,ll_resta_ano,ll_resta_mes,ll_cuota_venc,ll_tot_venta,ll_tot_mora,ll_sun_tot_venta,ll_sum_tot_mora,&
			ll_antiguedad,ll_tot_reg,ll_cta_sup,ll_cta_age,ll_res,ll_count=0,ll_malos=0,ll_licen
datetime	ldt_fec_clas,ldt_fec_ini,ldt_fec_fin,ldt_fec_fact,ldt_fec_prim,ldt_fec_res,ldt_fec_ing,ldt_fec_est,ldt_fec_ult_pag,&
			ldt_fec_repac,ldt_fec_prim_nue,ldt_fec_venc
double	ldb_porce_mora,ldb_porce_persist,ldb_tot_porc,ldb_tot_porc_aux,ldb_numero,ldb_numero_consul

ldt_fec_clas												= datetime(date(em_termino.text),time('00:00:00'))
SELECT	to_date(add_months( to_date(:ldt_fec_clas), -3 )) INTO:ldt_fec_fin FROM dual;
SELECT	to_date(add_months( to_date(:ldt_fec_clas), -11 )) INTO :ldt_fec_ini FROM dual;
ll_res														= MessageBox("Advertencia", 'Desea Generar Proceso Clasificaciones (Persistencia), Período '+string(ldt_fec_clas,'dd/mm/yyyy'), Exclamation!, YesNo!, 2)

if gs_conexion = "Parque La Foresta" then
	ls_pag_vta											= 'N'
else
	ls_pag_vta											= 'S'
end if

if ll_res=1 then
	SELECT		COUNT("SUPERVISOR"."COD_SUP")
	INTO			:ll_cta_sup
	FROM 		"SUPERVISOR"  
	WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
					"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
					("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_cta_sup>0 then
			ll_cta_sup									= ll_cta_sup
		else
			ll_cta_sup									= 0
		end if
	else
		ll_cta_sup										= 0
	end if
	SELECT		count("AGENTES"."COD_AGE")
	INTO			:ll_cta_age
	FROM 		"AGENTES"  
	WHERE 		"AGENTES"."ESTADO" = 'A' AND
					"AGENTES"."PAGOS_VENTA" = 'S' AND
					("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_cta_age>0 then
			ll_cta_age									= ll_cta_age
		else
			ll_cta_age									= 0
		end if
	else
		ll_cta_age										= 0
	end if
	ll_tot_reg											= ll_cta_sup + ll_cta_age
	if ll_tot_reg>0 then
		SetPointer(HourGlass!)
		st_fondo.visible									= true
		st_cuenta.visible								= true
		hpb_1.visible 									= true
		st_porc.visible 									= true
		ldb_tot_porc										= 0
		ldb_tot_porc_aux								= 0			
		hpb_1.Position									= ldb_tot_porc	
		DECLARE x1 CURSOR FOR
		SELECT		"COD_SUP",	"CARGO",	"FECHA_ING"  
		FROM 		"SUPERVISOR"  
		WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
						//"SUPERVISOR"."COD_SUP" = '2998' and
						"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
						("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
		UNION
		SELECT		"COD_AGE",	"CARGO",	"FECHA_INI"  
		FROM 		"AGENTES"  
		WHERE 		"AGENTES"."ESTADO" = 'A' AND
						//"AGENTES"."COD_AGE" = '2998' AND
						"AGENTES"."PAGOS_VENTA" = 'S' AND
						("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_codigo,	:ls_cargo,	:ldt_fec_ing;
				if not isnull(ls_codigo) and ls_codigo <> '' and not isnull(ls_cargo) and ls_cargo <> '' then
					ll_sum_tot_mora						= 0
					ll_sun_tot_venta						= 0
					ldb_porce_persist						= 0
					if ls_cargo = 'A' then
						DECLARE x2 CURSOR FOR	
						SELECT	"BASE","SERIE","NUMERO","FECHA_CIERRE","FECHA_PRIM","NRO_CUOTAS","CTAS_PAG_S","MORA_CRED","ESTADO","COD_PARQUE",	"FECHA_RES","RUT","CAD_BASE","CAD_SERIE","CAD_CONTRATO"
						FROM		"VISTA_PERSISTENCIA"  
						WHERE	( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fec_ini ) AND  
									( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fec_fin ) AND
									( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
									( "VISTA_PERSISTENCIA"."COD_AGE" = :ls_codigo )
						USING	Trans_1;			
					elseif ls_cargo = 'S' then
						DECLARE x3 CURSOR FOR
						SELECT	"BASE","SERIE","NUMERO","FECHA_CIERRE","FECHA_PRIM","NRO_CUOTAS","CTAS_PAG_S","MORA_CRED","ESTADO","COD_PARQUE",	"FECHA_RES","RUT","CAD_BASE","CAD_SERIE","CAD_CONTRATO"
						FROM		"VISTA_PERSISTENCIA"  
						WHERE	( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fec_ini ) AND  
									( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fec_fin ) AND
									( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
									( "VISTA_PERSISTENCIA"."COD_SUP" = :ls_codigo )
						USING	Trans_1;			
					end if
					if ls_cargo = 'A' then
						open x2;
					elseif ls_cargo = 'S' then 
						open x3;
					end if
					if Trans_1.sqlcode=0 then
						DO WHILE Trans_1.sqlcode=0
							if ls_cargo = 'A' then
								fetch x2 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_fact,	:ldt_fec_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fec_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ldb_numero_consul;	
							elseif ls_cargo = 'S' then 
								fetch x3 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_fact,	:ldt_fec_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fec_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ldb_numero_consul;	
							end if
							if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 then
								if ls_estado= 'P' then
									if ldt_fec_clas < ldt_fec_res then
										SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE") 
										INTO		:ldt_fec_est 
										FROM 	"FACTURA_OFERTA"  
										WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul ) AND  
													( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
													( "FACTURA_OFERTA"."NUMERO" = :ldb_numero_consul ) AND  
													( "FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fec_clas ) AND  
													( "FACTURA_OFERTA"."ESTADO" = 'S' )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ldt_fec_est) then
												ldt_fec_est								= ldt_fec_est
											end if
										end if
										SELECT	"FACTURA_OFERTA"."ESTADO_CADENA"  
										INTO		:ls_estado  
										FROM 	"FACTURA_OFERTA"  
										WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul) AND  
													( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
													( "FACTURA_OFERTA"."NUMERO" = :ldb_numero_consul ) AND  
													( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fec_est ) AND  
													( "FACTURA_OFERTA"."ESTADO" = 'S' )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ls_estado) and ls_estado <> '' then
												ls_estado								= ls_estado
											else
												ls_estado								= ls_estado
											end if
										else
											ls_estado									= ls_estado
										end if
									else
										SELECT	"CADENA"."ESTADO"  
										INTO 		:ls_estado  
										FROM		"CADENA"  
										WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
													( "CADENA"."SERIE" = :ls_serie_consul ) AND  
													( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
													( "CADENA"."COD_PARQUE" = :ll_cod_parque )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ls_estado) and ls_estado <> '' then
												ls_estado								= ls_estado
											else
												ls_estado								= ls_estado
											end if
										else
											ls_estado									= ls_estado
										end if
									end if
								else
									SELECT	"CADENA"."ESTADO"  
									INTO 		:ls_estado  
									FROM		"CADENA"  
									WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
												( "CADENA"."SERIE" = :ls_serie_consul ) AND  
												( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
												( "CADENA"."COD_PARQUE" = :ll_cod_parque )
									USING	Trans_2;
									if Trans_2.sqlcode = 0 then
										if not isnull(ls_estado) and ls_estado <> '' then
											ls_estado									= ls_estado
										else
											ls_estado									= ls_estado
										end if
									else
										ls_estado										= ls_estado
									end if
								end if
								SELECT	sum("INGRESO"."CUOTAS_PAG")  
								INTO		:ll_sum_pag_post  
								FROM		"CADENA",	"INGRESO"  
								WHERE	( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
											( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
											( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
											( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
											( "CADENA"."SERIE" = :ls_serie_consul ) AND  
											( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
											( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
											( "INGRESO"."TIPO_MOV" = 'E' ) and
											( "INGRESO"."FECHA_PAGO" > :ldt_fec_clas ) and
											( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
								USING	Trans_2;
								if Trans_2.sqlcode = 0 then
									if not isnull(ll_sum_pag_post) and ll_sum_pag_post>0 then
										ll_sum_pag_post								= ll_sum_pag_post
									else
										ll_sum_pag_post								= 0
									end if
								else
									ll_sum_pag_post									= 0
								end if
								SELECT	max("INGRESO"."FECHA_PAGO")  
								INTO		:ldt_fec_ult_pag  
								FROM		"CADENA",	"INGRESO"  
								WHERE	( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
											( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
											( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
											( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
											( "CADENA"."SERIE" = :ls_serie_consul ) AND  
											( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
											( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
											( "INGRESO"."TIPO_MOV" = 'E' ) and
											( "INGRESO"."FECHA_PAGO" > :ldt_fec_clas ) and
											( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
								USING	Trans_2;
													
			/*REPACTA*/	SELECT	MAX("SOL_REPACTA_CVTA"."CORRELATIVO")
								INTO		:ll_repac  
								FROM 	"SOL_REPACTA_CVTA"
								WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
											"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
											"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul 
								USING	Trans_2;
								if Trans_2.sqlcode=0 then
									if not isnull(ll_repac) and ll_repac>0 then
										SELECT	MAX("SOL_REPACTA_CVTA"."CORRELATIVO")
										INTO		:ll_correl  
										FROM 	"SOL_REPACTA_CVTA"
										WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
													"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
													"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
													"SOL_REPACTA_CVTA"."FECHA_SOLICITUD" >= :ldt_fec_ini AND
													"SOL_REPACTA_CVTA"."FECHA_SOLICITUD" <= :ldt_fec_clas
										USING	Trans_4;
										if Trans_4.sqlcode=0 then
											if not isnull(ll_correl) and ll_correl>0 then
												SELECT	"FECHA_SOLICITUD", 	"FECREP_1_VCTO"
												INTO		:ldt_fec_repac,		:ldt_fec_prim
												FROM 	"SOL_REPACTA_CVTA"
												WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
															"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
															"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
															"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correl
												USING	Trans_4;
												if Trans_4.sqlcode = 0 then
													if not isnull(ldt_fec_repac) and not isnull(ldt_fec_prim) then
														ls_repacta						= 'Repactado'
														ldt_fec_prim						= ldt_fec_prim
													end if
												end if
											else
												SELECT	"FECHA_SOLICITUD", 	"FECVTA_1_VCTO",	"FECREP_1_VCTO"
												INTO		:ldt_fec_repac,		:ldt_fec_prim,	:ldt_fec_prim_nue 
												FROM 	"SOL_REPACTA_CVTA"
												WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
															"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
															"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
															"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_repac
												USING	Trans_4;
												if Trans_4.sqlcode = 0 then
													if not isnull(ldt_fec_repac) and not isnull(ldt_fec_prim) then
														if ldt_fec_repac>ldt_fec_clas then
															ls_repacta					= ''
															ldt_fec_prim					= ldt_fec_prim
														elseif ldt_fec_repac<ldt_fec_clas then
															ls_repacta					= ''
															ldt_fec_prim					= ldt_fec_prim_nue
														end if
													end if
												end if
											end if
										end if
									else
										ldt_fec_prim										= ldt_fec_prim
										ls_repacta										= ''
									end if
								end if
								ll_ctas_pag_1											= ll_cta_pag - ll_sum_pag_post
								SELECT	to_date(add_months( to_date(:ldt_fec_prim), :ll_ctas_pag_1 )) INTO :ldt_fec_venc FROM dual;
								ll_dias_mora											= DaysAfter(date(ldt_fec_venc), date(ldt_fec_clas))
								
								SELECT	count("VENTAS_FUERA_PROCESOS"."BASE")  
									INTO		:ll_vtas_fuera  
									FROM		"VENTAS_FUERA_PROCESOS"  
									WHERE	"VENTAS_FUERA_PROCESOS"."BASE" = :ls_base AND  
											"VENTAS_FUERA_PROCESOS"."SERIE" = :ls_serie AND  
											"VENTAS_FUERA_PROCESOS"."NUMERO" = :ldb_numero AND  
											"VENTAS_FUERA_PROCESOS"."ESTADO" = 'V'
								USING	Trans_2;
								if Trans_2.sqlcode=0 then
									if not isnull(ll_vtas_fuera) and ll_vtas_fuera>0 then
										ll_vtas_fuera									= ll_vtas_fuera
									else
										ll_vtas_fuera									= 0
									end if
								else
									ll_vtas_fuera										= 0
								end if
								if ll_dias_mora <= 5 or ls_estado='S' or ll_vtas_fuera>0 then
									ll_mora_01											= 0
								else
									ll_dia_venc											= day(date(ldt_fec_prim))
									ll_mes_venc											= month(date(ldt_fec_prim))
									ll_ano_venc											= year(date(ldt_fec_prim))
									ll_dia_01												= day(date(ldt_fec_clas))
									ll_mes_01											= month(date(ldt_fec_clas))
									ll_ano_01											= year(date(ldt_fec_clas))
									ll_resta_ano											= ll_ano_01 - ll_ano_venc
									ll_resta_ano											= ll_resta_ano * 12
									ll_resta_mes										= ll_mes_01 - ll_mes_venc
									ll_cuota_venc										= ll_resta_ano + ll_resta_mes 
									if ll_dia_01 > ll_dia_venc then 
										ll_cuota_venc  	                             		= ll_cuota_venc + 1 
									end if 
									if ll_cuota_venc < 0 then 
										ll_cuota_venc                          			= 0 
									end if												
									if ll_cuota_venc > ll_plazo then 
										ll_cuota_venc                              			= ll_plazo 
									end if 
									ll_mora_01											= ll_cuota_venc - ll_ctas_pag_1 
									if ll_mora_01 <= 0 then 
										ll_mora_01										= 0 
									end if
								end if
								ll_tot_venta												= 0
								ll_tot_mora												= 0
								if ldt_fec_clas <= datetime(date(string('31/08/2011'))) then
									if ls_estado <> 'P' then 
										ll_tot_venta										= 1
										if ll_mora_01 >= 2 then
											ll_tot_mora									= 1
										else
											ll_tot_mora									= 0
										end if
									else
										ll_tot_venta										= 0
									end if
								else
									if ls_estado <> 'P' and ls_estado <> 'N' then 
										ll_tot_venta										= 1
										if ll_mora_01 >= 2 then
											ll_tot_mora									= 1
										else
											ll_tot_mora									= 0
										end if
									else
										ll_tot_venta										= 0
									end if
								end if
								ll_sun_tot_venta										= ll_sun_tot_venta + ll_tot_venta
								ll_sum_tot_mora										= ll_sum_tot_mora + ll_tot_mora
								if ll_sun_tot_venta > 0 then
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								else
									ldb_porce_mora									= 0
								end if
								if ll_sum_tot_mora > 0 then
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								else
									ldb_porce_mora									= 0
								end if
								if ll_sun_tot_venta = 0 and ll_sum_tot_mora = 0 then
									ldb_porce_mora									= 0
								else
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								end if
								ldb_porce_persist										= 100 - ldb_porce_mora
							end if
							setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
						LOOP
					end if
					ll_antiguedad 														= DaysAfter(date(ldt_fec_ing), date(ldt_fec_clas))
					if ll_antiguedad > 180 then
						if ldb_porce_persist < 55 then
							ls_clasif                                   						= 'D'
						elseif ldb_porce_persist >= 55 and ldb_porce_persist < 65 then
							ls_clasif 														= 'C'
						elseif ldb_porce_persist >= 65 and ldb_porce_persist < 75 then
							ls_clasif														= 'B'
						elseif ldb_porce_persist >= 75 then
							ls_clasif														= 'A'
						end if
					else
						ls_clasif                                   							= 'C'
					end if
					
					ll_licen																= f_licencia_medica(ls_codigo,ldt_fec_ini,ldt_fec_fin)
					if ll_licen>90 then
						if ls_clasif='A' or ls_clasif='B' then
							ls_clasif														= ls_clasif
						elseif ls_clasif='C' or ls_clasif='D' then
							ls_clasif														= 'C'
						end if
					end if
						
					if ls_cargo = 'A' then
						INSERT INTO "CLASIFICA_HIST"  
									( "COD_AGE",	"FECHA_CLASIFICA",	"TIPO_CLASIFICA",	"MORA_CLASIFICA",	"CONTRATOS_CLASIFICA",	"PORCE_CLASIFICA",	"VSP" )  
						VALUES	( :ls_codigo,		:ldt_fec_clas,			:ls_clasif,				:ll_sum_tot_mora,		:ll_sun_tot_venta,				:ldb_porce_persist,		0 )
						USING	Trans_2;
						if Trans_2.sqlcode = 0 then
							commit using Trans_2;
								UPDATE	"AGENTES"  
     							SET 		"CLASIFICACION" = :ls_clasif  
   								WHERE	"AGENTES"."COD_AGE" = :ls_codigo
								USING	Trans_4;
								if Trans_4.sqlcode = 0 then
									commit using Trans_4;
									ll_count++
								else
									rollback using Trans_4;
								end if
						else
							rollback using Trans_2;
							ll_malos++
							messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+Trans_2.sqlerrtext)
							messagebox("Error Grabar",'Agente '+ls_codigo)
						end if
					elseif ls_cargo = 'S' then
						INSERT INTO "CLASIFICA_HIST_SUP"  
									( "COD_SUP",	"FECHA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"CONTRATOS_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP" )  
						VALUES	( :ls_codigo,		:ldt_fec_clas,			:ls_clasif,				:ll_sum_tot_mora,		:ll_sun_tot_venta,				:ldb_porce_persist,		0 )
						USING	Trans_2;
						if Trans_2.sqlcode = 0 then
							commit using Trans_2;
								UPDATE	"SUPERVISOR"  
     							SET 		"CLASIFICA" = :ls_clasif  
   								WHERE	"SUPERVISOR"."COD_SUP" = :ls_codigo
								USING	Trans_4;
								if Trans_4.sqlcode = 0 then
									commit using Trans_4;
									ll_count++
								else
									rollback using Trans_4;
								end if
						else
							rollback using Trans_2;
							ll_malos++
							messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+Trans_2.sqlerrtext)
							messagebox("Error Grabar",'Supervisor '+ls_codigo)
						end if
					end if
					if ls_cargo = 'A' then
						close x2;
					elseif ls_cargo = 'S' then
						close x3;
					end if
				end if
				setnull(ls_codigo);setnull(ls_cargo);setnull(ls_clasif);setnull(ll_sum_tot_mora);setnull(ll_sun_tot_venta);setnull(ldb_porce_persist)
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text											= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux									= ldb_tot_porc
				end if 
				ldb_tot_porc												= (ll_count / ll_tot_reg) * 100
				hpb_1.Position 											= ldb_tot_porc
				st_cuenta.text 											= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_count,'###,###,###')+' ( '+string((ll_count*100)/ll_tot_reg,'#0.00')+'% )'
			LOOP
		end if
		close x1;
		st_fondo.visible													= false
		st_cuenta.visible												= false
		hpb_1.visible 													= false
		st_porc.visible 													= false
		SetPointer(Arrow!)
		messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_count,'###,###,##0')+' Registros Grabados con Exito~r~n'+&
								'y '+string(ll_malos,'###,###,##0')+' Registros con Problemas.',information!)
		cb_limpiar.triggerevent(clicked!)
		cb_proceso.visible												= false
		cb_mora_consul.visible										= false
		em_termino.visible											= false
	end if
end if
end event

type cb_proceso_bkp from commandbutton within w_persistencia_superv
integer x = 4078
integer y = 1504
integer width = 480
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Proceso"
end type

event clicked;string		ls_codigo,ls_cargo,ls_base,ls_serie,ls_estado,ls_base_consul,ls_serie_consul,ls_repacta,ls_clasif,ls_clasif_lic,ls_pag_vta
long		ll_plazo,ll_cta_pag,ll_mora_actual,ll_cod_parque,ll_rut,ll_sum_pag_post,ll_repac,&
			ll_correl,ll_ctas_pag_1,ll_dias_mora,ll_vtas_fuera,ll_mora_01,ll_dia_venc,ll_mes_venc,ll_ano_venc,ll_dia_01,&
			ll_mes_01,ll_ano_01,ll_resta_ano,ll_resta_mes,ll_cuota_venc,ll_tot_venta,ll_tot_mora,ll_sun_tot_venta,ll_sum_tot_mora,&
			ll_antiguedad,ll_tot_reg,ll_cta_sup,ll_cta_age,ll_res,ll_count=0,ll_malos=0,ll_licen
datetime	ldt_fec_clas,ldt_fec_ini,ldt_fec_fin,ldt_fec_fact,ldt_fec_prim,ldt_fec_res,ldt_fec_ing,ldt_fec_est,ldt_fec_ult_pag,&
			ldt_fec_repac,ldt_fec_prim_nue,ldt_fec_venc
double	ldb_porce_mora,ldb_porce_persist,ldb_tot_porc,ldb_tot_porc_aux,ldb_numero,ldb_numero_consul

ldt_fec_clas												= datetime(date(em_termino.text),time('00:00:00'))
SELECT	to_date(add_months( to_date(:ldt_fec_clas), -3 )) INTO:ldt_fec_fin FROM dual;
SELECT	to_date(add_months( to_date(:ldt_fec_clas), -11 )) INTO :ldt_fec_ini FROM dual;
ll_res														= MessageBox("Advertencia", 'Desea Generar Proceso Clasificaciones (Persistencia), Período '+string(ldt_fec_clas,'dd/mm/yyyy'), Exclamation!, YesNo!, 2)

if gs_conexion = "Parque La Foresta" then
	ls_pag_vta											= 'N'
else
	ls_pag_vta											= 'S'
end if

if ll_res=1 then
	SELECT		COUNT("SUPERVISOR"."COD_SUP")
	INTO			:ll_cta_sup
	FROM 		"SUPERVISOR"  
	WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
					"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
					("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_cta_sup>0 then
			ll_cta_sup									= ll_cta_sup
		else
			ll_cta_sup									= 0
		end if
	else
		ll_cta_sup										= 0
	end if
	SELECT		count("AGENTES"."COD_AGE")
	INTO			:ll_cta_age
	FROM 		"AGENTES"  
	WHERE 		"AGENTES"."ESTADO" = 'A' AND
					"AGENTES"."PAGOS_VENTA" = 'S' AND
					("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_cta_age>0 then
			ll_cta_age									= ll_cta_age
		else
			ll_cta_age									= 0
		end if
	else
		ll_cta_age										= 0
	end if
	ll_tot_reg											= ll_cta_sup + ll_cta_age
	if ll_tot_reg>0 then
		SetPointer(HourGlass!)
		st_fondo.visible									= true
		st_cuenta.visible								= true
		hpb_1.visible 									= true
		st_porc.visible 									= true
		ldb_tot_porc										= 0
		ldb_tot_porc_aux								= 0			
		hpb_1.Position									= ldb_tot_porc	
		DECLARE x1 CURSOR FOR
		SELECT		"COD_SUP",	"CARGO",	"FECHA_ING"  
		FROM 		"SUPERVISOR"  
		WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
						//"SUPERVISOR"."COD_SUP" = '2998' and
						"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
						("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
		UNION
		SELECT		"COD_AGE",	"CARGO",	"FECHA_INI"  
		FROM 		"AGENTES"  
		WHERE 		"AGENTES"."ESTADO" = 'A' AND
						//"AGENTES"."COD_AGE" = '2998' AND
						"AGENTES"."PAGOS_VENTA" = 'S' AND
						("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_codigo,	:ls_cargo,	:ldt_fec_ing;
				if not isnull(ls_codigo) and ls_codigo <> '' and not isnull(ls_cargo) and ls_cargo <> '' then
					ll_sum_tot_mora						= 0
					ll_sun_tot_venta						= 0
					ldb_porce_persist						= 0
					if ls_cargo = 'A' then
						DECLARE x2 CURSOR FOR	
						SELECT	"BASE","SERIE","NUMERO","FECHA_CIERRE","FECHA_PRIM","NRO_CUOTAS","CTAS_PAG_S","MORA_CRED","ESTADO","COD_PARQUE",	"FECHA_RES","RUT","CAD_BASE","CAD_SERIE","CAD_CONTRATO"
						FROM		"VISTA_PERSISTENCIA"  
						WHERE	( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fec_ini ) AND  
									( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fec_fin ) AND
									( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
									( "VISTA_PERSISTENCIA"."COD_AGE" = :ls_codigo )
						USING	Trans_1;			
					elseif ls_cargo = 'S' then
						DECLARE x3 CURSOR FOR
						SELECT	"BASE","SERIE","NUMERO","FECHA_CIERRE","FECHA_PRIM","NRO_CUOTAS","CTAS_PAG_S","MORA_CRED","ESTADO","COD_PARQUE",	"FECHA_RES","RUT","CAD_BASE","CAD_SERIE","CAD_CONTRATO"
						FROM		"VISTA_PERSISTENCIA"  
						WHERE	( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fec_ini ) AND  
									( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fec_fin ) AND
									( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
									( "VISTA_PERSISTENCIA"."COD_SUP" = :ls_codigo )
						USING	Trans_1;			
					end if
					if ls_cargo = 'A' then
						open x2;
					elseif ls_cargo = 'S' then 
						open x3;
					end if
					if Trans_1.sqlcode=0 then
						DO WHILE Trans_1.sqlcode=0
							if ls_cargo = 'A' then
								fetch x2 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_fact,	:ldt_fec_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fec_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ldb_numero_consul;	
							elseif ls_cargo = 'S' then 
								fetch x3 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_fact,	:ldt_fec_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fec_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ldb_numero_consul;	
							end if
							if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 then
								if ls_estado= 'P' then
									if ldt_fec_clas < ldt_fec_res then
										SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE") 
										INTO		:ldt_fec_est 
										FROM 	"FACTURA_OFERTA"  
										WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul ) AND  
													( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
													( "FACTURA_OFERTA"."NUMERO" = :ldb_numero_consul ) AND  
													( "FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fec_clas ) AND  
													( "FACTURA_OFERTA"."ESTADO" = 'S' )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ldt_fec_est) then
												ldt_fec_est								= ldt_fec_est
											end if
										end if
										SELECT	"FACTURA_OFERTA"."ESTADO_CADENA"  
										INTO		:ls_estado  
										FROM 	"FACTURA_OFERTA"  
										WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul) AND  
													( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
													( "FACTURA_OFERTA"."NUMERO" = :ldb_numero_consul ) AND  
													( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fec_est ) AND  
													( "FACTURA_OFERTA"."ESTADO" = 'S' )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ls_estado) and ls_estado <> '' then
												ls_estado								= ls_estado
											else
												ls_estado								= ls_estado
											end if
										else
											ls_estado									= ls_estado
										end if
									else
										SELECT	"CADENA"."ESTADO"  
										INTO 		:ls_estado  
										FROM		"CADENA"  
										WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
													( "CADENA"."SERIE" = :ls_serie_consul ) AND  
													( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
													( "CADENA"."COD_PARQUE" = :ll_cod_parque )
										USING	Trans_2;
										if Trans_2.sqlcode = 0 then
											if not isnull(ls_estado) and ls_estado <> '' then
												ls_estado								= ls_estado
											else
												ls_estado								= ls_estado
											end if
										else
											ls_estado									= ls_estado
										end if
									end if
								else
									SELECT	"CADENA"."ESTADO"  
									INTO 		:ls_estado  
									FROM		"CADENA"  
									WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
												( "CADENA"."SERIE" = :ls_serie_consul ) AND  
												( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
												( "CADENA"."COD_PARQUE" = :ll_cod_parque )
									USING	Trans_2;
									if Trans_2.sqlcode = 0 then
										if not isnull(ls_estado) and ls_estado <> '' then
											ls_estado									= ls_estado
										else
											ls_estado									= ls_estado
										end if
									else
										ls_estado										= ls_estado
									end if
								end if
								SELECT	sum("INGRESO"."CUOTAS_PAG")  
								INTO		:ll_sum_pag_post  
								FROM		"CADENA",	"INGRESO"  
								WHERE	( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
											( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
											( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
											( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
											( "CADENA"."SERIE" = :ls_serie_consul ) AND  
											( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
											( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
											( "INGRESO"."TIPO_MOV" = 'E' ) and
											( "INGRESO"."FECHA_PAGO" > :ldt_fec_clas ) and
											( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
								USING	Trans_2;
								if Trans_2.sqlcode = 0 then
									if not isnull(ll_sum_pag_post) and ll_sum_pag_post>0 then
										ll_sum_pag_post								= ll_sum_pag_post
									else
										ll_sum_pag_post								= 0
									end if
								else
									ll_sum_pag_post									= 0
								end if
								SELECT	max("INGRESO"."FECHA_PAGO")  
								INTO		:ldt_fec_ult_pag  
								FROM		"CADENA",	"INGRESO"  
								WHERE	( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
											( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
											( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
											( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
											( "CADENA"."SERIE" = :ls_serie_consul ) AND  
											( "CADENA"."NUMERO" = :ldb_numero_consul ) AND  
											( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
											( "INGRESO"."TIPO_MOV" = 'E' ) and
											( "INGRESO"."FECHA_PAGO" > :ldt_fec_clas ) and
											( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
								USING	Trans_2;
													
			/*REPACTA*/	SELECT	MAX("SOL_REPACTA_CVTA"."CORRELATIVO")
								INTO		:ll_repac  
								FROM 	"SOL_REPACTA_CVTA"
								WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
											"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
											"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul 
								USING	Trans_2;
								if Trans_2.sqlcode=0 then
									if not isnull(ll_repac) and ll_repac>0 then
										SELECT	MAX("SOL_REPACTA_CVTA"."CORRELATIVO")
										INTO		:ll_correl  
										FROM 	"SOL_REPACTA_CVTA"
										WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
													"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
													"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
													"SOL_REPACTA_CVTA"."FECHA_SOLICITUD" >= :ldt_fec_ini AND
													"SOL_REPACTA_CVTA"."FECHA_SOLICITUD" <= :ldt_fec_clas
										USING	Trans_4;
										if Trans_4.sqlcode=0 then
											if not isnull(ll_correl) and ll_correl>0 then
												SELECT	"FECHA_SOLICITUD", 	"FECREP_1_VCTO"
												INTO		:ldt_fec_repac,		:ldt_fec_prim
												FROM 	"SOL_REPACTA_CVTA"
												WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
															"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
															"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
															"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correl
												USING	Trans_4;
												if Trans_4.sqlcode = 0 then
													if not isnull(ldt_fec_repac) and not isnull(ldt_fec_prim) then
														ls_repacta						= 'Repactado'
														ldt_fec_prim						= ldt_fec_prim
													end if
												end if
											else
												SELECT	"FECHA_SOLICITUD", 	"FECVTA_1_VCTO",	"FECREP_1_VCTO"
												INTO		:ldt_fec_repac,		:ldt_fec_prim,	:ldt_fec_prim_nue 
												FROM 	"SOL_REPACTA_CVTA"
												WHERE	"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
															"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
															"SOL_REPACTA_CVTA"."NUMERO" = :ldb_numero_consul AND
															"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_repac
												USING	Trans_4;
												if Trans_4.sqlcode = 0 then
													if not isnull(ldt_fec_repac) and not isnull(ldt_fec_prim) then
														if ldt_fec_repac>ldt_fec_clas then
															ls_repacta					= ''
															ldt_fec_prim					= ldt_fec_prim
														elseif ldt_fec_repac<ldt_fec_clas then
															ls_repacta					= ''
															ldt_fec_prim					= ldt_fec_prim_nue
														end if
													end if
												end if
											end if
										end if
									else
										ldt_fec_prim										= ldt_fec_prim
										ls_repacta										= ''
									end if
								end if
								ll_ctas_pag_1											= ll_cta_pag - ll_sum_pag_post
								SELECT	to_date(add_months( to_date(:ldt_fec_prim), :ll_ctas_pag_1 )) INTO :ldt_fec_venc FROM dual;
								ll_dias_mora											= DaysAfter(date(ldt_fec_venc), date(ldt_fec_clas))
								
								SELECT	count("VENTAS_FUERA_PROCESOS"."BASE")  
									INTO		:ll_vtas_fuera  
									FROM		"VENTAS_FUERA_PROCESOS"  
									WHERE	"VENTAS_FUERA_PROCESOS"."BASE" = :ls_base AND  
											"VENTAS_FUERA_PROCESOS"."SERIE" = :ls_serie AND  
											"VENTAS_FUERA_PROCESOS"."NUMERO" = :ldb_numero AND  
											"VENTAS_FUERA_PROCESOS"."ESTADO" = 'V'
								USING	Trans_2;
								if Trans_2.sqlcode=0 then
									if not isnull(ll_vtas_fuera) and ll_vtas_fuera>0 then
										ll_vtas_fuera									= ll_vtas_fuera
									else
										ll_vtas_fuera									= 0
									end if
								else
									ll_vtas_fuera										= 0
								end if
								if ll_dias_mora <= 5 or ls_estado='S' or ll_vtas_fuera>0 then
									ll_mora_01											= 0
								else
									ll_dia_venc											= day(date(ldt_fec_prim))
									ll_mes_venc											= month(date(ldt_fec_prim))
									ll_ano_venc											= year(date(ldt_fec_prim))
									ll_dia_01												= day(date(ldt_fec_clas))
									ll_mes_01											= month(date(ldt_fec_clas))
									ll_ano_01											= year(date(ldt_fec_clas))
									ll_resta_ano											= ll_ano_01 - ll_ano_venc
									ll_resta_ano											= ll_resta_ano * 12
									ll_resta_mes										= ll_mes_01 - ll_mes_venc
									ll_cuota_venc										= ll_resta_ano + ll_resta_mes 
									if ll_dia_01 > ll_dia_venc then 
										ll_cuota_venc  	                             		= ll_cuota_venc + 1 
									end if 
									if ll_cuota_venc < 0 then 
										ll_cuota_venc                          			= 0 
									end if												
									if ll_cuota_venc > ll_plazo then 
										ll_cuota_venc                              			= ll_plazo 
									end if 
									ll_mora_01											= ll_cuota_venc - ll_ctas_pag_1 
									if ll_mora_01 <= 0 then 
										ll_mora_01										= 0 
									end if
								end if
								ll_tot_venta												= 0
								ll_tot_mora												= 0
								if ldt_fec_clas <= datetime(date(string('31/08/2011'))) then
									if ls_estado <> 'P' then 
										ll_tot_venta										= 1
										if ll_mora_01 >= 2 then
											ll_tot_mora									= 1
										else
											ll_tot_mora									= 0
										end if
									else
										ll_tot_venta										= 0
									end if
								else
									if ls_estado <> 'P' and ls_estado <> 'N' then 
										ll_tot_venta										= 1
										if ll_mora_01 >= 2 then
											ll_tot_mora									= 1
										else
											ll_tot_mora									= 0
										end if
									else
										ll_tot_venta										= 0
									end if
								end if
								ll_sun_tot_venta										= ll_sun_tot_venta + ll_tot_venta
								ll_sum_tot_mora										= ll_sum_tot_mora + ll_tot_mora
								if ll_sun_tot_venta > 0 then
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								else
									ldb_porce_mora									= 0
								end if
								if ll_sum_tot_mora > 0 then
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								else
									ldb_porce_mora									= 0
								end if
								if ll_sun_tot_venta = 0 and ll_sum_tot_mora = 0 then
									ldb_porce_mora									= 0
								else
									ldb_porce_mora									= ll_sum_tot_mora / ll_sun_tot_venta * 100
								end if
								ldb_porce_persist										= 100 - ldb_porce_mora
							end if
							setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
						LOOP
					end if
					ll_antiguedad 														= DaysAfter(date(ldt_fec_ing), date(ldt_fec_clas))
					if ll_antiguedad > 180 then
						if ldb_porce_persist < 55 then
							ls_clasif                                   						= 'D'
						elseif ldb_porce_persist >= 55 and ldb_porce_persist < 65 then
							ls_clasif 														= 'C'
						elseif ldb_porce_persist >= 65 and ldb_porce_persist < 75 then
							ls_clasif														= 'B'
						elseif ldb_porce_persist >= 75 then
							ls_clasif														= 'A'
						end if
					else
						ls_clasif                                   							= 'C'
					end if
					
					ll_licen																= f_licencia_medica(ls_codigo,ldt_fec_ini,ldt_fec_fin)
					if ll_licen>90 then
						if ls_clasif='A' or ls_clasif='B' then
							ls_clasif														= ls_clasif
						elseif ls_clasif='C' or ls_clasif='D' then
							ls_clasif														= 'C'
						end if
					end if
						
					if ls_cargo = 'A' then
						INSERT INTO "CLASIFICA_HIST"  
									( "COD_AGE",	"FECHA_CLASIFICA",	"TIPO_CLASIFICA",	"MORA_CLASIFICA",	"CONTRATOS_CLASIFICA",	"PORCE_CLASIFICA",	"VSP" )  
						VALUES	( :ls_codigo,		:ldt_fec_clas,			:ls_clasif,				:ll_sum_tot_mora,		:ll_sun_tot_venta,				:ldb_porce_persist,		0 )
						USING	Trans_2;
						if Trans_2.sqlcode = 0 then
							commit using Trans_2;
								UPDATE	"AGENTES"  
     							SET 		"CLASIFICACION" = :ls_clasif  
   								WHERE	"AGENTES"."COD_AGE" = :ls_codigo
								USING	Trans_4;
								if Trans_4.sqlcode = 0 then
									commit using Trans_4;
									ll_count++
								else
									rollback using Trans_4;
								end if
						else
							rollback using Trans_2;
							ll_malos++
							messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+Trans_2.sqlerrtext)
							messagebox("Error Grabar",'Agente '+ls_codigo)
						end if
					elseif ls_cargo = 'S' then
						INSERT INTO "CLASIFICA_HIST_SUP"  
									( "COD_SUP",	"FECHA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"CONTRATOS_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP" )  
						VALUES	( :ls_codigo,		:ldt_fec_clas,			:ls_clasif,				:ll_sum_tot_mora,		:ll_sun_tot_venta,				:ldb_porce_persist,		0 )
						USING	Trans_2;
						if Trans_2.sqlcode = 0 then
							commit using Trans_2;
								UPDATE	"SUPERVISOR"  
     							SET 		"CLASIFICA" = :ls_clasif  
   								WHERE	"SUPERVISOR"."COD_SUP" = :ls_codigo
								USING	Trans_4;
								if Trans_4.sqlcode = 0 then
									commit using Trans_4;
									ll_count++
								else
									rollback using Trans_4;
								end if
						else
							rollback using Trans_2;
							ll_malos++
							messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+Trans_2.sqlerrtext)
							messagebox("Error Grabar",'Supervisor '+ls_codigo)
						end if
					end if
					if ls_cargo = 'A' then
						close x2;
					elseif ls_cargo = 'S' then
						close x3;
					end if
				end if
				setnull(ls_codigo);setnull(ls_cargo);setnull(ls_clasif);setnull(ll_sum_tot_mora);setnull(ll_sun_tot_venta);setnull(ldb_porce_persist)
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text											= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux									= ldb_tot_porc
				end if 
				ldb_tot_porc												= (ll_count / ll_tot_reg) * 100
				hpb_1.Position 											= ldb_tot_porc
				st_cuenta.text 											= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_count,'###,###,###')+' ( '+string((ll_count*100)/ll_tot_reg,'#0.00')+'% )'
			LOOP
		end if
		close x1;
		st_fondo.visible													= false
		st_cuenta.visible												= false
		hpb_1.visible 													= false
		st_porc.visible 													= false
		SetPointer(Arrow!)
		messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_count,'###,###,##0')+' Registros Grabados con Exito~r~n'+&
								'y '+string(ll_malos,'###,###,##0')+' Registros con Problemas.',information!)
		cb_limpiar.triggerevent(clicked!)
		cb_proceso.visible												= false
		cb_mora_consul.visible										= false
		em_termino.visible											= false
	end if
end if
end event

type cb_exportar from commandbutton within w_persistencia_superv
integer x = 1925
integer y = 1912
integer width = 238
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_clasificacion
if dw_clasificacion.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_mora_grupo from commandbutton within w_persistencia_superv
boolean visible = false
integer x = 3534
integer y = 52
integer width = 402
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mora Grupo"
end type

event clicked;long		ll_tot_reg
datetime	ldt_fecha

dw_fecha_clasif.accepttext()
ldt_fecha										= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
if isnull(ldt_fecha) then
	messagebox("Advertencia","Debe Seleccionar Fecha Proceso")
	dw_fecha_clasif.setfocus()
else
	UPDATE	"MORA_9_12_FECHA"  
	SET 		"FECHA" = :ldt_fecha
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit using sqlca;
		dw_clasificacion.dataobject				= 'dw_clasifica_mora_equipo'
		dw_clasificacion.settransobject(sqlca)
		ll_tot_reg							= dw_clasificacion.retrieve()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		end if
	else
		rollback using sqlca;
	end if
end if
	
end event

type st_cuenta from statictext within w_persistencia_superv
boolean visible = false
integer x = 1381
integer y = 984
integer width = 1371
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_persistencia_superv
boolean visible = false
integer x = 1381
integer y = 912
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_persistencia_superv
boolean visible = false
integer x = 1957
integer y = 840
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type em_termino from editmask within w_persistencia_superv
boolean visible = false
integer x = 2738
integer y = 1916
integer width = 361
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type cb_proceso from commandbutton within w_persistencia_superv
boolean visible = false
integer x = 3118
integer y = 1916
integer width = 480
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Proceso"
end type

event clicked;string		ls_pag_vta,ls_codigo,ls_cargo,ls_clasif
long		ll_res,ll_cta_jef,ll_cta_sup,ll_cta_age,ll_tot_reg,ll_tot_lista,ll_licen,ll_graba=0,ll_malos=0,ll_existe_fact
datetime	ldt_fec_clas,ldt_fec_ini,ldt_fec_fin,ldt_fec_ing,ldt_fec_antig
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_mora,ldb_deveng,ldb_porc_mora
		
ldt_fec_clas													= datetime(date(em_termino.text),time('00:00:00'))
//ldt_fec_clas												=datetime(date('31/12/2016'),time('00:00:00'))

SELECT	count("FACTURA_OFERTA"."BASE")  
INTO		:ll_existe_fact  
FROM		"FACTURA_OFERTA"  
WHERE	("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S') AND  
			"FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fec_clas
USING	sqlca;
if isnull(ll_existe_fact) then ll_existe_fact=0
if ll_existe_fact=0 then
	messagebox("Advertencia","No Existe Proceso Facturación con Fecha :"+string(ldt_fec_clas,'dd/mm/yyyy'))
else
	if gs_conexion = "Parque La Foresta" then
		ls_pag_vta											= 'N'
	else
		ls_pag_vta											= 'S'
	end if	
	
	ldt_fec_fin												= ldt_fec_clas
	//SELECT	to_date(add_months( to_date(:ldt_fec_clas), -2 )) INTO :ldt_fec_fin FROM dual;
	SELECT	to_date(add_months( to_date(:ldt_fec_clas), -6 )) INTO :ldt_fec_ini FROM dual;
	
	ll_res														= MessageBox("Advertencia", 'Desea Generar Proceso Clasificaciones (Persistencia), Período '+string(ldt_fec_clas,'dd/mm/yyyy'), Exclamation!, YesNo!, 2)
	if ll_res=1 then
		ll_tot_reg											= dw_vista_5_7.retrieve(ldt_fec_ini,ldt_fec_fin,ldt_fec_clas,'N')
		
		SELECT		count("JEFE_VENTAS")
		INTO			:ll_cta_jef
		FROM 		"JEFE_VENTAS"  
		WHERE 		"JEFE_VENTAS"."ESTADO" = 'A' AND
						"JEFE_VENTAS"."PAGOS_VENTA" = 'S' AND
						("JEFE_VENTAS"."DEPTO" = 'B' OR "JEFE_VENTAS"."DEPTO" = 'X')
		USING		sqlca;
		if isnull(ll_cta_jef) then ll_cta_jef=0
		
		SELECT		COUNT("SUPERVISOR"."COD_SUP")
		INTO			:ll_cta_sup
		FROM 		"SUPERVISOR"  
		WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
						"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
						("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
		USING		sqlca;
		if isnull(ll_cta_sup) then ll_cta_sup=0
		
		SELECT		count("AGENTES"."COD_AGE")
		INTO			:ll_cta_age
		FROM 		"AGENTES"  
		WHERE 		"AGENTES"."ESTADO" = 'A' AND
						"AGENTES"."PAGOS_VENTA" = 'S' AND
						("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
		USING		sqlca;
		if isnull(ll_cta_age) then ll_cta_age=0
		
		ll_tot_reg											= ll_cta_jef + ll_cta_sup + ll_cta_age
		if ll_tot_reg>0 then
			SetPointer(HourGlass!)
			st_fondo.visible									= true
			st_cuenta.visible								= true
			hpb_1.visible 									= true
			st_porc.visible 									= true
			hpb_1.Position									= ldb_tot_porc	
			DECLARE x1 CURSOR FOR
			SELECT		"COD_AGE",	"CARGO",	"FECHA_INI"  
			FROM 		"AGENTES"  
			WHERE 		"AGENTES"."ESTADO" = 'A' AND
//							"AGENTES"."COD_AGE" = '3378' AND
							"AGENTES"."PAGOS_VENTA" = 'S' AND
							("AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X')
			
			UNION
			SELECT		"COD_SUP",	"CARGO",	"FECHA_ING"  
			FROM 		"SUPERVISOR"  
			WHERE 		"SUPERVISOR"."ESTADO" = 'A' AND
//							"SUPERVISOR"."COD_SUP" = '0200' and
							"SUPERVISOR"."PAGOS_VENTA" = :ls_pag_vta AND
							("SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X')
			UNION
			SELECT		"JEFE_VENTAS",	"CARGO",	"FECHA_ING"  
			FROM 		"JEFE_VENTAS"  
			WHERE 		"JEFE_VENTAS"."ESTADO" = 'A' AND
//							"JEFE_VENTAS"."JEFE_VENTAS" = '2998' and
							"JEFE_VENTAS"."PAGOS_VENTA" = 'S' AND
							("JEFE_VENTAS"."DEPTO" = 'B' OR "JEFE_VENTAS"."DEPTO" = 'X')
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_cargo,	:ldt_fec_ing;
					if not isnull(ls_codigo) and ls_codigo <> '' and not isnull(ls_cargo) and ls_cargo <> '' then
						if ls_cargo = 'A' then
							dw_vista_5_7.setfilter( "cod_age ='"+ls_codigo+"'" )
							dw_vista_5_7.filter()
						elseif ls_cargo = 'S' then
							dw_vista_5_7.setfilter( "cod_sup ='"+ls_codigo+"'" )
							dw_vista_5_7.filter()
						elseif ls_cargo = 'J' then
							dw_vista_5_7.setfilter( "cod_jef ='"+ls_codigo+"'" )
							dw_vista_5_7.filter()
						end if	
						dw_vista_5_7.accepttext()
						ll_tot_lista							= dw_vista_5_7.rowcount()
						ldb_mora							= round(dw_vista_5_7.getitemnumber(1,'sum_mora_total_uf'),2)
						ldb_deveng							= round(dw_vista_5_7.getitemnumber(1,'sum_devengado_uf'),2)
						if ldb_deveng=0 then
							ldb_porc_mora					= 0
						else
							ldb_porc_mora					= round( ldb_mora / ldb_deveng * 100,2) 
						end if
						ls_clasif								= f_clasif_cargo( ldb_porc_mora,ldt_fec_clas )
						
						ll_licen								= f_licencia_medica(ls_codigo,ldt_fec_ini,ldt_fec_fin)
						
						if ldt_fec_clas<= datetime(date(string('31/01/2017'))) then
							if ll_licen>90 then
								if ls_clasif='D' then
									ls_clasif						= 'C'
								else
									ls_clasif						= ls_clasif
								end if
							else
								ls_clasif							= ls_clasif
							end if
				
							SELECT	to_date(add_months( to_date(to_date(:ldt_fec_clas)), -6 )) INTO:ldt_fec_antig FROM dual;
							if ldt_fec_antig < ldt_fec_ing then
								ls_clasif                        		= 'C'
							else
								ls_clasif                           	= ls_clasif
							end if
						end if
						
						if ls_cargo='A' then	
							INSERT INTO "CLASIFICA_HIST"  
										( "COD_AGE",	"FECHA_CLASIFICA",	"TIPO_CLASIFICA",	"MORA_CLASIFICA",	"CONTRATOS_CLASIFICA",	"PORCE_CLASIFICA",	"VSP" )  
							VALUES	( :ls_codigo,		:ldt_fec_clas,			:ls_clasif,				:ldb_mora,				:ldb_deveng,					:ldb_porc_mora,		0 )
							USING	Trans_1;
						elseif ls_cargo='S' then
							INSERT INTO "CLASIFICA_HIST_SUP"  
										( "COD_SUP",	"FECHA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"CONTRATOS_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP" )  
							VALUES	( :ls_codigo,		:ldt_fec_clas,					:ls_clasif,					:ldb_mora,						:ldb_deveng,							:ldb_porc_mora,				0 )
							USING	Trans_1;
						elseif ls_cargo='J' then
							INSERT INTO "CLASIFICA_HIST_JEF"  
										( "COD_JEF",	"FECHA_CLASIFICA_JEF",	"TIPO_CLASIFICA_JEF",	"MORA_CLASIFICA_JEF",	"CONTRATOS_CLASIFICA_JEF",	"PORCE_CLASIFICA_JEF",	"VSP" )  
							VALUES	( :ls_codigo,		:ldt_fec_clas,					:ls_clasif,					:ldb_mora,						:ldb_deveng,							:ldb_porc_mora,				0 )
							USING	Trans_1;
						end if
						if Trans_1.sqlcode = 0 then
							commit using Trans_1;
							if ls_cargo='A' then
								UPDATE	"AGENTES"  
								SET 		"CLASIFICACION" = :ls_clasif  
								WHERE	"AGENTES"."COD_AGE" = :ls_codigo
								USING	Trans_2;
							elseif ls_cargo='S' then
								UPDATE	"SUPERVISOR"  
								SET 		"CLASIFICA" = :ls_clasif  
								WHERE	"SUPERVISOR"."COD_SUP" = :ls_codigo
								USING	Trans_2;	
							elseif ls_cargo='J' then
								UPDATE	"JEFE_VENTAS"  
								SET 		"CLASIFICA" = :ls_clasif  
								WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo
								USING	Trans_2;	
							end if
							if Trans_2.sqlcode = 0 then
								commit using Trans_2;
								ll_graba++				
							else
								rollback using Trans_2;
								ll_malos++
							end if
						end if
					end if
					setnull(ls_codigo);setnull(ls_cargo);setnull(ls_clasif);setnull(ldb_mora);setnull(ldb_deveng);setnull(ldb_mora)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text											= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux									= ldb_tot_porc
					end if 
					ldb_tot_porc												= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 											= ldb_tot_porc
					st_cuenta.text 											= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_graba,'###,###,###')+' ( '+string((ll_graba*100)/ll_tot_reg,'#0.00')+'% )'
				LOOP
			end if
			close x1;
			st_fondo.visible													= false
			st_cuenta.visible												= false
			hpb_1.visible 													= false
			st_porc.visible 													= false
			SetPointer(Arrow!)
			messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_graba,'###,###,##0')+' Registros Grabados con Exito~r~n'+&
									'y '+string(ll_malos,'###,###,##0')+' Registros con Problemas.',information!)
			cb_limpiar.triggerevent(clicked!)
			cb_proceso.visible												= false
			cb_mora_consul.visible										= false
			em_termino.visible											= false
		end if
	end if
end if
end event

type dw_superv_venta from datawindow within w_persistencia_superv
integer x = 1065
integer y = 52
integer width = 1646
integer height = 104
integer taborder = 40
string title = "none"
string dataobject = "dwe_superv_depto"
boolean border = false
boolean livescroll = true
end type

type dw_fecha_clasif from datawindow within w_persistencia_superv
integer x = 69
integer y = 56
integer width = 951
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_cierre_clasif"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_clasificacion.reset()
end event

type dw_jefe_venta from datawindow within w_persistencia_superv
integer x = 1065
integer y = 52
integer width = 1646
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_jefe_depto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_clasificacion.reset()
end event

type cb_limpiar from commandbutton within w_persistencia_superv
integer x = 1655
integer y = 1912
integer width = 265
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long 		ll_dia,ll_mes,ll_ano
datetime	ldt_fec_proc,ldt_ult_fec_proc
if gl_proceso >= 4 then
	//gdt_fec_sistema							= datetime(date(string('02/07/2013')))
	ll_dia											= day(date(gdt_fec_sistema))
	ll_mes										= month(date(gdt_fec_sistema))
	ll_ano											= year(date(gdt_fec_sistema))
	if ll_mes = 1 then
		ll_mes			 						= ll_mes + 11
		ll_ano				 						= ll_ano - 1
	else
		ll_mes			 						= ll_mes - 1
		ll_ano				 						= ll_ano
	end if
	ldt_fec_proc									= f_fecha_fin(ll_mes,ll_ano)
	SELECT	max("CLASIFICA_HIST"."FECHA_CLASIFICA")  
   	INTO		:ldt_ult_fec_proc 
	FROM		"CLASIFICA_HIST"
	USING	sqlca;
	if ldt_fec_proc>ldt_ult_fec_proc then
		if ll_dia>=2 then
			cb_proceso.visible					= true
			cb_mora_consul.visible			= true
			em_termino.visible				= true
			em_termino.text					= string(ldt_fec_proc,'dd/mm/yyyy')
			messagebox("Advertencia","Debe Generar Proceso Clasificaciones (Persistencia), Período "+string(ldt_fec_proc,'dd/mm/yyyy'))
		end if
	end if
	dw_fecha_clasif.dataobject				= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_jefe_venta.dataobject				= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.visible					= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'

elseif gl_proceso = 3 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_superv'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_jefe_venta.dataobject					= 'dwe_jefe_depto'
	dw_jefe_venta.settransobject(sqlca)
	dw_jefe_venta.getchild('jefe_venta',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_jefe_venta.insertrow(0)
	dw_jefe_venta.setitem(1,'jefe_venta',	gs_user)
	dw_jefe_venta.accepttext()
	dw_jefe_venta.Object.jefe_venta.Protect=1
	dw_jefe_venta.enabled						= false
	dw_superv_venta.visible						= false
	cb_detalle_sup.visible						= false
	cb_detalle.text								= '&Detalle Ventas Supervisor'
elseif gl_proceso = 2 then
	dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
	dw_fecha_clasif.settransobject(sqlca)
	dw_fecha_clasif.insertrow(0)
	dw_clasificacion.dataobject				= 'dw_persistencia_agte'
	dw_clasificacion.settransobject(sqlca)
	dw_clasificacion.object.usuario.text	= gs_user
	dw_superv_venta.dataobject					= 'dwe_superv_depto'
	dw_superv_venta.settransobject(sqlca)
	dw_superv_venta.getchild('cod_sup',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_superv_venta.insertrow(0)
	dw_superv_venta.setitem(1,'cod_sup',gs_user)
	dw_superv_venta.accepttext()
	dw_superv_venta.Object.cod_sup.Protect=1
	dw_superv_venta.enabled						= false
	dw_jefe_venta.visible						= false
	cb_detalle_sup.visible						= true
	cb_detalle.text								= '&Detalle Ventas Agente'
end if

end event

type cb_imprimir from commandbutton within w_persistencia_superv
integer x = 1390
integer y = 1912
integer width = 265
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_clasificacion.rowcount() > 0 then f_Print( dw_clasificacion )
end event

type pb_aceptar from picturebutton within w_persistencia_superv
integer x = 2720
integer y = 40
integer width = 128
integer height = 104
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_cod_jefe,ls_cod_sup,ls_clasif,ls_nombre,ls_a_paterno,ls_a_materno,ls_nombre_compl,ll_vsp,ls_pag_vta,ls_cargo,&
			ls_clas_12,ls_clas_11,ls_clas_10,ls_clas_9,ls_clas_8,ls_clas_7,ls_clas_6,ls_clas_5,ls_clas_4,ls_clas_3,ls_clas_2,ls_clas_1,ls_cod_agte,ls_clas_12_sup
long		ll_cod_parque,ll_new,ll_vsp_sup,ll_parque
datetime	ldt_fecha_12,ldt_fecha_11,ldt_fecha_10,ldt_fecha_9,ldt_fecha_8,ldt_fecha_7,ldt_fecha_6,ldt_fecha_5,ldt_fecha_4,ldt_fecha_3,ldt_fecha_2,ldt_fecha_1,&
			ldt_fecha_ini
double	ldb_porc,ldb_porc_sup,ldb_ctto,ldb_mora,ldb_ctto_sup,ldb_mora_sup

dw_clasificacion.reset()
dw_fecha_clasif.accepttext()


if gl_proceso>=3 then
	dw_clasificacion.dataobject								= 'dw_persistencia_superv'
else
	dw_clasificacion.dataobject								= 'dw_persistencia_agte'
end if
dw_clasificacion.settransobject(sqlca)


ldt_fecha_12													= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
if isnull(ldt_fecha_12) then
	messagebox("Advertencia","Debe Ingresar Fecha Fecha Clasificación")
else
	SELECT to_date(add_months( to_date(:ldt_fecha_12), -1 )) INTO :ldt_fecha_11 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_11), -1 )) INTO :ldt_fecha_10 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_10), -1 )) INTO :ldt_fecha_9 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_9), -1 )) INTO :ldt_fecha_8 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_8), -1 )) INTO :ldt_fecha_7 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_7), -1 )) INTO :ldt_fecha_6 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_6), -1 )) INTO :ldt_fecha_5 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_5), -1 )) INTO :ldt_fecha_4 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_4), -1 )) INTO :ldt_fecha_3 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_3), -1 )) INTO :ldt_fecha_2 FROM dual;
	SELECT to_date(add_months( to_date(:ldt_fecha_2), -1 )) INTO :ldt_fecha_1 FROM dual;
	
	dw_clasificacion.object.mes12_t.text					= string(ldt_fecha_12,'dd/mm/yyyy')
	dw_clasificacion.object.mes11_t.text					= string(ldt_fecha_11,'dd/mm/yy')
	dw_clasificacion.object.mes10_t.text					= string(ldt_fecha_10,'dd/mm/yy')
	dw_clasificacion.object.mes9_t.text					= string(ldt_fecha_9,'dd/mm/yy')
	dw_clasificacion.object.mes8_t.text					= string(ldt_fecha_8,'dd/mm/yy')
	dw_clasificacion.object.mes7_t.text					= string(ldt_fecha_7,'dd/mm/yy')
	dw_clasificacion.object.mes6_t.text					= string(ldt_fecha_6,'dd/mm/yy')
	dw_clasificacion.object.mes5_t.text					= string(ldt_fecha_5,'dd/mm/yy')
	dw_clasificacion.object.mes4_t.text					= string(ldt_fecha_4,'dd/mm/yy')
	dw_clasificacion.object.mes3_t.text					= string(ldt_fecha_3,'dd/mm/yy')
	dw_clasificacion.object.mes2_t.text					= string(ldt_fecha_2,'dd/mm/yy')
	dw_clasificacion.object.mes1_t.text					= string(ldt_fecha_1,'dd/mm/yy')
	
	if gl_proceso >= 4  or gl_proceso = 3 then
		ls_cod_jefe												= dw_jefe_venta.getitemstring(1,'jefe_venta')
		dw_jefe_venta.accepttext()
		if not isnull(ls_cod_jefe) and ls_cod_jefe <>'' then
			SELECT	"COD_PARQUE"  
			INTO 		:ll_cod_parque  
			FROM		"JEFE_VENTAS"  
			WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe
			USING	sqlca;
			if isnull(ll_cod_parque) then ll_cod_parque=1
			
			DECLARE x1 CURSOR FOR
			SELECT		"JEFE_VENTAS",	"FECHA_ING",	"NOMBRE",	"A_PATERNO",	"A_MATERNO", "CARGO", "COD_PARQUE"  
			FROM			"JEFE_VENTAS"  
			WHERE		"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe AND  
							"JEFE_VENTAS"."ESTADO" = 'A' AND
							"JEFE_VENTAS"."FECHA_ING" > to_date('01/01/1997','dd/mm/yyyy')  AND 
							("JEFE_VENTAS"."DEPTO" = 'B' or "JEFE_VENTAS"."DEPTO" = 'X') AND
							"JEFE_VENTAS"."PAGOS_VENTA" =  ( CASE WHEN  "COD_PARQUE" = 11 AND "CARGO" = 'S' THEN 'N' ELSE 'S' END )
			UNION
			SELECT		"COD_SUP",	"FECHA_ING",	"NOMBRE",	"A_PATERNO",	"A_MATERNO", "CARGO", "COD_PARQUE"    
			FROM			"SUPERVISOR"  
			WHERE		"SUPERVISOR"."COD_JEFE" = :ls_cod_jefe AND  
							"SUPERVISOR"."ESTADO" = 'A' AND
							"SUPERVISOR"."FECHA_ING" > to_date('01/01/1997','dd/mm/yyyy')  AND 
							("SUPERVISOR"."DEPTO" = 'R' or "SUPERVISOR"."DEPTO" = 'X') AND
							"SUPERVISOR"."PAGOS_VENTA" =  ( CASE WHEN  "COD_PARQUE" = 11 AND "CARGO" = 'S' THEN 'N' ELSE 'S' END )
			ORDER BY 	2 ASC
			USING		Trans_1;
			open x1;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
					fetch x1 into :ls_cod_sup, :ldt_fecha_ini, :ls_nombre,	:ls_a_paterno,	:ls_a_materno, :ls_cargo, :ll_parque;
						if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
							ls_nombre_compl									= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
							ll_new												= dw_clasificacion.insertrow(0)
							dw_clasificacion.scrolltorow(ll_new)
							dw_clasificacion.setitem(ll_new,'cod_parque', ll_cod_parque)
							dw_clasificacion.setitem(ll_new,'cod_jefe', ls_cod_jefe)
							dw_clasificacion.setitem(ll_new,'codigo', ls_cod_sup)
							dw_clasificacion.setitem(ll_new,'fecha_ini', ldt_fecha_ini)
							dw_clasificacion.setitem(ll_new,'nombre', ls_nombre_compl)
							dw_clasificacion.setitem(ll_new,'cargo', ls_cargo)
							
							ls_clas_11											= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_11)
							ls_clas_10											= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_10)
							ls_clas_9												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_9)
							ls_clas_8												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_8)
							ls_clas_7												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_7)
							ls_clas_6												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_6)
							ls_clas_5												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_5)
							ls_clas_4												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_4)
							ls_clas_3												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_3)
							ls_clas_2												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_2)
							ls_clas_1												= wf_clasif(ls_cargo,ls_cod_sup,ldt_fecha_1)
							
							dw_clasificacion.setitem(ll_new,'mes11', ls_clas_11)
							dw_clasificacion.setitem(ll_new,'mes10', ls_clas_10)
							dw_clasificacion.setitem(ll_new,'mes9', ls_clas_9)
							dw_clasificacion.setitem(ll_new,'mes8', ls_clas_8)
							dw_clasificacion.setitem(ll_new,'mes7', ls_clas_7)
							dw_clasificacion.setitem(ll_new,'mes6', ls_clas_6)
							dw_clasificacion.setitem(ll_new,'mes5', ls_clas_5)
							dw_clasificacion.setitem(ll_new,'mes4', ls_clas_4)
							dw_clasificacion.setitem(ll_new,'mes3', ls_clas_3)
							dw_clasificacion.setitem(ll_new,'mes2', ls_clas_2)
							dw_clasificacion.setitem(ll_new,'mes1', ls_clas_1)
							
							if ls_cargo='S' then
								SELECT	"CONTRATOS_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP",	"TIPO_CLASIFICA_SUP"  
								INTO		:ldb_ctto,								:ldb_mora,						:ls_clas_12,					:ldb_porc,						:ll_vsp,	:ls_clasif  
								FROM		"CLASIFICA_HIST_SUP"  
								WHERE 	( "CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup ) AND  
											( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_12 )
								USING	sqlca;
							elseif ls_cargo='J' then
								SELECT	"CONTRATOS_CLASIFICA_JEF",	"MORA_CLASIFICA_JEF",		"TIPO_CLASIFICA_JEF",	"PORCE_CLASIFICA_JEF",	"VSP",	"TIPO_CLASIFICA_JEF"  
								INTO		:ldb_ctto,								:ldb_mora,						:ls_clas_12,					:ldb_porc,						:ll_vsp,	:ls_clasif  
								FROM		"CLASIFICA_HIST_JEF"  
								WHERE 	( "CLASIFICA_HIST_JEF"."COD_JEF" = :ls_cod_sup ) AND  
											( "CLASIFICA_HIST_JEF"."FECHA_CLASIFICA_JEF" = :ldt_fecha_12 )
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_clasificacion.object.titulo_2_t.text		= "Total Ventas :  "+string(ldb_ctto,'###,###,##0.00')+"  -   Ventas en Mora : "+string(ldb_mora,'###,###,##0.00')+"  -   Porcentaje : "+string(ldb_porc,'###,###,##0.00')+" %"+"  -   Clasificación : "+(ls_clas_12)
								end if
							end if
							if isnull(ldb_ctto) then ldb_ctto=0
							if isnull(ldb_mora) then ldb_mora=0
							if isnull(ls_clas_12) then ls_clas_12=''
							if isnull(ldb_porc) then ldb_porc=0
							if isnull(ll_vsp) then ll_vsp=''
							if isnull(ls_clasif) then ls_clasif=''
							dw_clasificacion.setitem(ll_new,'cant_pro',ldb_ctto)
							dw_clasificacion.setitem(ll_new,'mora',ldb_mora)
							dw_clasificacion.setitem(ll_new,'mes12',ls_clas_12)
							dw_clasificacion.setitem(ll_new,'porc',ldb_porc)
							dw_clasificacion.setitem(ll_new,'vsp',ll_vsp)
							dw_clasificacion.setitem(ll_new,'clas_act',ls_clasif)
						end if
						Setnull(ls_cod_sup)
					LOOP
				end if
			close x1;
		else
			if isnull(ls_cod_jefe) or ls_cod_jefe='' then
				messagebox("Advertencia","Debe Seleccionar Jefe de Ventas")
				dw_jefe_venta.setfocus()
			end if
		end if
	elseif gl_proceso = 2 then
		ls_cod_sup																	= dw_superv_venta.getitemstring(1,'cod_sup')
		dw_superv_venta.accepttext()
		if not isnull(ls_cod_sup) and ls_cod_sup <>'' then
			SELECT	"COD_PARQUE",  	"COD_JEFE" 
			INTO		:ll_cod_parque,	:ls_cod_jefe  
			FROM		"SUPERVISOR"  
			WHERE	"SUPERVISOR"."COD_SUP" = :ls_cod_sup
			USING	sqlca;
			
			DECLARE x2 CURSOR FOR
			SELECT		"COD_AGE",	"FECHA_INI",	"NOMBRE",	"A_PATERNO",	"A_MATERNO", "CARGO"
			FROM			"AGENTES"  
			WHERE		"AGENTES"."COD_SUP" = :ls_cod_sup AND
							"AGENTES"."ESTADO" = 'A' AND
							"AGENTES"."PAGOS_VENTA" = 'S' 
			ORDER BY 	"AGENTES"."FECHA_INI" ASC
			USING		Trans_1;
			open x2;
			if Trans_1.sqlcode=0 then
				DO WHILE Trans_1.sqlcode=0
				fetch x2 into :ls_cod_agte, :ldt_fecha_ini, :ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_cargo;
					if not isnull(ls_cod_agte) and ls_cod_agte<>'' then
						ls_nombre_compl										= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
						ll_new													= dw_clasificacion.insertrow(0)
						dw_clasificacion.scrolltorow(ll_new)
						dw_clasificacion.setitem(ll_new,'cod_parque',ll_cod_parque)
						dw_clasificacion.setitem(ll_new,'jefe_vtas',ls_cod_jefe)
						dw_clasificacion.setitem(ll_new,'cod_jefe',ls_cod_sup)
						dw_clasificacion.setitem(ll_new,'codigo',ls_cod_agte)
						dw_clasificacion.setitem(ll_new,'fecha_ini',ldt_fecha_ini)
						dw_clasificacion.setitem(ll_new,'nombre',ls_nombre_compl)
						dw_clasificacion.setitem(ll_new,'cargo',ls_cargo)
						
						ls_clas_11												= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_11)
						ls_clas_10												= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_10)
						ls_clas_9													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_9)
						ls_clas_8													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_8)
						ls_clas_7													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_7)
						ls_clas_6													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_6)
						ls_clas_5													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_5)
						ls_clas_4													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_4)
						ls_clas_3													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_3)
						ls_clas_2													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_2)
						ls_clas_1													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_1)
						
						dw_clasificacion.setitem(ll_new,'mes11', ls_clas_11)
						dw_clasificacion.setitem(ll_new,'mes10', ls_clas_10)
						dw_clasificacion.setitem(ll_new,'mes9', ls_clas_9)
						dw_clasificacion.setitem(ll_new,'mes8', ls_clas_8)
						dw_clasificacion.setitem(ll_new,'mes7', ls_clas_7)
						dw_clasificacion.setitem(ll_new,'mes6', ls_clas_6)
						dw_clasificacion.setitem(ll_new,'mes5', ls_clas_5)
						dw_clasificacion.setitem(ll_new,'mes4', ls_clas_4)
						dw_clasificacion.setitem(ll_new,'mes3', ls_clas_3)
						dw_clasificacion.setitem(ll_new,'mes2', ls_clas_2)
						dw_clasificacion.setitem(ll_new,'mes1', ls_clas_1)
						
						SELECT	"CONTRATOS_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP"  
						INTO		:ldb_ctto_sup,			:ldb_mora_sup,				:ls_clas_12_sup,			:ldb_porc_sup,				:ll_vsp_sup  
						FROM		"CLASIFICA_HIST_SUP"  
						WHERE 	( "CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup ) AND  
									( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_12 )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							dw_clasificacion.object.titulo_2_t.text		= "Total Ventas :  "+string(ldb_ctto_sup,'###,###,##0.00')+"  -   Ventas en Mora : "+string(ldb_mora_sup,'###,###,##0.00')+"  -   Porcentaje : "+string(ldb_porc_sup,'###,###,##0.00')+" %"+"  -   Clasificación : "+(ls_clas_12_sup)
							dw_clasificacion.setitem(ll_new,'producc_jefe',ldb_ctto_sup)
						end if
						SELECT	"CONTRATOS_CLASIFICA",	"MORA_CLASIFICA",	"TIPO_CLASIFICA",	"PORCE_CLASIFICA",	"VSP",	"TIPO_CLASIFICA"  
						INTO		:ldb_ctto,				:ldb_mora,			:ls_clas_12,		:ldb_porc,				:ll_vsp,	:ls_clasif  
						FROM		"CLASIFICA_HIST"  
						WHERE 	( "CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte ) AND  
									( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :ldt_fecha_12 )
						USING	sqlca;
						if isnull(ldb_ctto) then ldb_ctto=0
						if isnull(ldb_mora) then ldb_mora=0
						if isnull(ls_clas_12) then ls_clas_12=''
						if isnull(ldb_porc) then ldb_porc=0
						if isnull(ll_vsp) then ll_vsp=''
						if isnull(ls_clasif) then ls_clasif=''
						dw_clasificacion.setitem(ll_new,'cant_pro',ldb_ctto)
						dw_clasificacion.setitem(ll_new,'mora',ldb_mora)
						dw_clasificacion.setitem(ll_new,'mes12',ls_clas_12)
						dw_clasificacion.setitem(ll_new,'porc',ldb_porc)
						dw_clasificacion.setitem(ll_new,'vsp',ll_vsp)
						dw_clasificacion.setitem(ll_new,'clas_act',ls_clasif)
					end if
					Setnull(ls_cod_agte)
				LOOP
			end if
			close x2;
		else
			if isnull(ls_cod_sup) or ls_cod_sup='' then
				messagebox("Advertencia","Debe Seleccionar Jefe de Ventas")
				dw_superv_venta.setfocus()
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_persistencia_superv
integer x = 3675
integer y = 1912
integer width = 265
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_persistencia_superv)
end event

type cb_detalle from commandbutton within w_persistencia_superv
integer x = 50
integer y = 1912
integer width = 617
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;string			ls_codigo,ls_string,ls_cargo
double		ll_promesa
datetime		ldt_fec_clas

dw_fecha_clasif.AcceptText()
dw_clasificacion.AcceptText()

if dw_clasificacion.rowcount() > 0 then
	ldt_fec_clas							= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
	ls_codigo								= dw_clasificacion.getitemstring(il_row,'codigo')
	ls_cargo								= dw_clasificacion.getitemstring(il_row,'cargo')
		
	ls_string									= ls_codigo+'~t'+string(ldt_fec_clas,'dd/mm/yyyy')+'~t'+ls_cargo
	if isvalid(w_persistencia_detalle) then close(w_persistencia_detalle)
	OpenWithParm(w_persistencia_detalle, ls_string)
end if
end event

type cb_detalle_sup from commandbutton within w_persistencia_superv
integer x = 667
integer y = 1912
integer width = 617
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas Supervisor"
end type

event clicked;string		ls_codigo,ls_string,ls_cargo
long		ll_promesa
datetime	ldt_fecha_cierre

dw_fecha_clasif.AcceptText()
dw_clasificacion.AcceptText()
if (dw_clasificacion.dataobject = 'dw_persistencia_superv' or dw_clasificacion.dataobject = 'dw_persistencia_agte') and dw_clasificacion.rowcount() > 0 then
	ldt_fecha_cierre							= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
	ls_codigo										= dw_clasificacion.getitemstring(il_row,'cod_jefe')
	//ll_promesa									= dw_clasificacion.getitemnumber(il_row,'producc_jefe')
	if gl_proceso=2 then
		ls_cargo									= 'S'
	else
		ls_cargo									= dw_clasificacion.getitemstring(il_row,'cargo')
	end if
	ls_string										= ls_codigo+'~t'+string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_cargo
	if isvalid(w_persistencia_detalle) then close(w_persistencia_detalle)
		OpenWithParm(w_persistencia_detalle, ls_string)
end if
end event

type st_fondo from statictext within w_persistencia_superv
boolean visible = false
integer x = 1349
integer y = 816
integer width = 1431
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_clasificacion from datawindow within w_persistencia_superv
integer x = 50
integer y = 160
integer width = 3890
integer height = 1724
integer taborder = 40
string title = "none"
string dataobject = "dw_persistencia_superv"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;string	ls_cod_sup,ls_string,ls_cargo
datetime	ldt_fecha

dw_jefe_venta.accepttext()
dw_fecha_clasif.accepttext()

if dw_clasificacion.dataobject='dw_persistencia_superv' and dw_clasificacion.rowcount() > 0 then
	ls_cod_sup		= dw_clasificacion.getitemstring(il_row,'codigo')
	ldt_fecha			= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
	ls_cargo			= dw_clasificacion.getitemstring(il_row,'cargo')
end if
if not isnull(ldt_fecha) and not isnull(ls_cod_sup) and ls_cod_sup<>'' then
	if ls_cargo='J' then
		cb_detalle_sup.triggerevent(clicked!)
	else
		ls_string			= string(ldt_fecha,'dd/mm/yyyy')+'~t'+ls_cod_sup
		if isvalid(w_persistencia_agte) then close(w_persistencia_agte)
		OpenWithParm (w_persistencia_agte,ls_string)
	end if
end if
end event

