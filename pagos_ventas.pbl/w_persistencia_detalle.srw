forward
global type w_persistencia_detalle from window
end type
type cb_exportar from commandbutton within w_persistencia_detalle
end type
type cb_respaldo from commandbutton within w_persistencia_detalle
end type
type st_cuenta from statictext within w_persistencia_detalle
end type
type hpb_1 from hprogressbar within w_persistencia_detalle
end type
type st_porc from statictext within w_persistencia_detalle
end type
type em_cargo from editmask within w_persistencia_detalle
end type
type em_codigo from editmask within w_persistencia_detalle
end type
type em_fecha_cierre from editmask within w_persistencia_detalle
end type
type em_fin from editmask within w_persistencia_detalle
end type
type em_ini from editmask within w_persistencia_detalle
end type
type cb_proceso from commandbutton within w_persistencia_detalle
end type
type cb_grabar from commandbutton within w_persistencia_detalle
end type
type cb_asocia_contrato from commandbutton within w_persistencia_detalle
end type
type cb_cta_cte from commandbutton within w_persistencia_detalle
end type
type cb_ordenar from commandbutton within w_persistencia_detalle
end type
type cb_filtrar from commandbutton within w_persistencia_detalle
end type
type cb_imprimir from commandbutton within w_persistencia_detalle
end type
type cb_cerrar from commandbutton within w_persistencia_detalle
end type
type st_fondo from statictext within w_persistencia_detalle
end type
type dw_detalle from datawindow within w_persistencia_detalle
end type
end forward

global type w_persistencia_detalle from window
integer width = 4741
integer height = 2160
boolean titlebar = true
string title = "Detalle Ventas Evaluadas "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_calcular ( )
cb_exportar cb_exportar
cb_respaldo cb_respaldo
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
em_cargo em_cargo
em_codigo em_codigo
em_fecha_cierre em_fecha_cierre
em_fin em_fin
em_ini em_ini
cb_proceso cb_proceso
cb_grabar cb_grabar
cb_asocia_contrato cb_asocia_contrato
cb_cta_cte cb_cta_cte
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
st_fondo st_fondo
dw_detalle dw_detalle
end type
global w_persistencia_detalle w_persistencia_detalle

type variables
long		il_row
end variables

on w_persistencia_detalle.create
this.cb_exportar=create cb_exportar
this.cb_respaldo=create cb_respaldo
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.em_cargo=create em_cargo
this.em_codigo=create em_codigo
this.em_fecha_cierre=create em_fecha_cierre
this.em_fin=create em_fin
this.em_ini=create em_ini
this.cb_proceso=create cb_proceso
this.cb_grabar=create cb_grabar
this.cb_asocia_contrato=create cb_asocia_contrato
this.cb_cta_cte=create cb_cta_cte
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.st_fondo=create st_fondo
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_exportar,&
this.cb_respaldo,&
this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.em_cargo,&
this.em_codigo,&
this.em_fecha_cierre,&
this.em_fin,&
this.em_ini,&
this.cb_proceso,&
this.cb_grabar,&
this.cb_asocia_contrato,&
this.cb_cta_cte,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.st_fondo,&
this.dw_detalle}
end on

on w_persistencia_detalle.destroy
destroy(this.cb_exportar)
destroy(this.cb_respaldo)
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.em_cargo)
destroy(this.em_codigo)
destroy(this.em_fecha_cierre)
destroy(this.em_fin)
destroy(this.em_ini)
destroy(this.cb_proceso)
destroy(this.cb_grabar)
destroy(this.cb_asocia_contrato)
destroy(this.cb_cta_cte)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.st_fondo)
destroy(this.dw_detalle)
end on

event open;string		ls_codigo,ls_cargo,ls_clasif
long		ll_tot_reg,ll_licen,ll_indi,ll_tot_lista
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_clas,ldt_fec_ingre,ldt_fec_antig

gf_centrar(w_persistencia_detalle)
if gs_depto = 'I' then
	cb_grabar.visible									= true
else
	cb_grabar.visible									= false
end if	

ls_codigo													= substr(1,1,Message.StringParm)
ldt_fec_clas												= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ls_cargo													= substr(1,3,Message.StringParm)

SELECT	to_date(add_months( to_date(:ldt_fec_clas), -6 )) INTO :ldt_fec_ini FROM dual;
//SELECT	to_date(add_months( to_date(:ldt_fec_clas), -2 )) INTO :ldt_fec_fin FROM dual;
ldt_fec_fin												= ldt_fec_clas	

dw_detalle.dataobject								= 'dw_vista_5_7'
dw_detalle.settransobject(sqlca)
if ldt_fec_clas < datetime(date(string('28/02/2011'))) then
	messagebox("Advertencia","No Registra Detalle")
else
	ll_tot_reg											= dw_detalle.retrieve(ldt_fec_ini,ldt_fec_fin,ldt_fec_clas,ls_cargo)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Detalle Clasificación")
	else
		if ls_cargo = 'A' then
			dw_detalle.setfilter( "cod_age ='"+ls_codigo+"'" )
			dw_detalle.filter()
		elseif ls_cargo = 'S' then
			dw_detalle.setfilter( "cod_sup ='"+ls_codigo+"'" )
			dw_detalle.filter()
		elseif ls_cargo = 'J' then
			dw_detalle.setfilter( "cod_jef ='"+ls_codigo+"'" )
			dw_detalle.filter()
		end if	
		dw_detalle.accepttext()
		ll_tot_lista										= dw_detalle.rowcount()
		
		if ls_cargo= 'A' then
			SELECT		"AGENTES"."FECHA_INI"
			INTO			:ldt_fec_ingre
			FROM 		"AGENTES"  
			WHERE 		"AGENTES"."COD_AGE" = :ls_codigo
			USING		sqlca;
		elseif  ls_cargo= 'S' then
			SELECT		"SUPERVISOR"."FECHA_ING"
			INTO			:ldt_fec_ingre
			FROM 		"SUPERVISOR"  
			WHERE 		"SUPERVISOR"."COD_SUP" = :ls_codigo
			USING		sqlca;
		elseif  ls_cargo= 'J' then
			SELECT		"JEFE_VENTAS"."FECHA_ING"
			INTO			:ldt_fec_ingre
			FROM 		"JEFE_VENTAS"  
			WHERE 		"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo
			USING		sqlca;
		end if
		
		ls_clasif											= 	dw_detalle.getitemstring(1,'clasif')	
		
		if ldt_fec_clas<= datetime(date(string('31/01/2017'))) then
			ll_licen										= f_licencia_medica(ls_codigo,ldt_fec_ini,ldt_fec_fin)
			if ll_licen>90 then
				if ls_clasif='D' then
					ls_clasif								= 'C'
				else
					ls_clasif								= ls_clasif
				end if
			else
				ls_clasif									= ls_clasif
			end if
			
			SELECT	to_date(add_months( to_date(to_date(:ldt_fec_clas)), -6 )) INTO:ldt_fec_antig FROM dual;
			if ldt_fec_antig < ldt_fec_ingre then
				ls_clasif                        				= 'C'
			else
				ls_clasif                                      = ls_clasif
			end if
		end if
		
		dw_detalle.object.usuario.text				= gs_user
		for ll_indi=1 to ll_tot_lista
			dw_detalle.setitem(ll_indi,"fecha_ing",ldt_fec_ingre)
			dw_detalle.setitem(ll_indi,'clasifica',ls_clasif)
			dw_detalle.setitem(ll_indi,'licen_medica',ll_licen)
			dw_detalle.AcceptText()
		next
	end if
end if
		
end event

event close;disconnect using Trans_4;
end event

type cb_exportar from commandbutton within w_persistencia_detalle
integer x = 2624
integer y = 1920
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_respaldo from commandbutton within w_persistencia_detalle
boolean visible = false
integer x = 1307
integer y = 2092
integer width = 343
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RESPALDO"
end type

event clicked;string	ls_codigo,ls_base,ls_serie,ls_estado,ls_fecha,ls_cardo,ls_base_consul,ls_serie_consul,ls_clasif,ls_cod_age_sup
long		ll_new,ll_cta_pag,ll_plazo,ll_cod_parque,ll_sum_pag_post,ll_ctas_pag_1,ll_dias_mora,&
			ll_mora_01,ll_dia_venc,ll_mes_venc,ll_ano_venc,ll_dia_01,ll_mes_01,ll_ano_01,ll_resta_ano,ll_resta_mes,ll_cuota_venc,&
			ll_cta_mora,ll_mora_actual,ll_rut,ll_numero_consul,ll_tot_venta,ll_sun_tot_venta,ll_tot_mora,ll_sum_tot_mora,&
			ll_antiguedad,ll_cta_prom,ll_cta_contr,ll_tot_reg
datetime	ldt_fecha_cierre,ldt_fecha_01,ldt_fecha_02,ldt_fecha_03,ldt_fecha_04,ldt_fecha_05,ldt_fecha_06,ldt_fecha_07,&
			ldt_fecha_08,ldt_fecha_09,ldt_fecha_10,ldt_fecha_11,ldt_fecha_12,ldt_fecha_prim,ldt_fecha_fact,ldt_fecha_venc,&
			ldt_fecha_res,ldt_fecha_ult_pago,ldt_fecha_ing,ldt_fecha_est
date		ld_fecha
double	ldb_numero,ldb_porce_mora,ldb_porce_persist,ldb_tot_porc,ldb_tot_porc_aux

connect using Trans_1;
gf_centrar(w_persistencia_detalle)
em_ini.text																				= string(gdt_fec_sistema)
dw_detalle.Reset()
SetPointer(HourGlass!)
ls_codigo																				= string(em_codigo.text)
ldt_fecha_cierre																		= datetime(date(em_fecha_cierre.text),time('00:00:00'))
ls_cardo																					= string(em_cargo.text)
dw_detalle.object.usuario.text													= gs_user
if ldt_fecha_cierre < datetime(date(string('28/02/2011'))) then
	messagebox("Advertencia","No Registra Detalle")
else
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
	INTO	:ldt_fecha_01  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_01) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
	INTO	:ldt_fecha_02  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_01
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_02) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_03  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_02
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_03) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_04  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_03
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_04) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_05  
	FROM	"CLASIFICA_HIST" 
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_04
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_05) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_06  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_05
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_06) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_07  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_06
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_07) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_08  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_07
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_08) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_09  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_08
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_09) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_10  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_09
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_10) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_11  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_10
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_11) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_12  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_11
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_12) then
		end if
	end if
	
	st_fondo.visible																		= true
	st_cuenta.visible																		= true
	hpb_1.visible 																			= true
	st_porc.visible 																		= true
	ldb_tot_porc																			= 0
	ldb_tot_porc_aux																		= 0			
	hpb_1.Position																			= ldb_tot_porc
	if ls_cardo = 'A' then
		SELECT	COUNT("FACTURA_OFERTA"."BASE")
		INTO		:ll_cta_prom
		FROM		"FACTURA_OFERTA",	"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"CADENA_MORA",	"AGENTES"
		WHERE 	( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
					( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
					( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and 
					( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) and
					( ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
					( "FACTURA_OFERTA"."SERIE" <> 'R' ) AND  
					( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "OFERTA_V"."COD_AGE" = :ls_codigo ) )   
		USING		sqlca;
		if isnull(ll_cta_prom) then ll_cta_prom=0
		SELECT	COUNT("FACTURA_CONTRATO_STGO"."BASE")
		INTO		:ll_cta_contr
		FROM		"FACTURA_CONTRATO_STGO",	"CADENA",	"CONTRATO",	"PAGARE",	"CADENA_MORA",	"AGENTES"  
		WHERE		( "CONTRATO"."SERIE" = "PAGARE"."SERIE_P" ) and  
					( "CONTRATO"."NRO_PAGARE" = "PAGARE"."NRO_PAGARE" ) and  
					( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "FACTURA_CONTRATO_STGO"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "FACTURA_CONTRATO_STGO"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and 
					( "CONTRATO"."AGENTE" = "AGENTES"."COD_AGE" ) and 
					( ( "FACTURA_CONTRATO_STGO"."BASE" = 'C' ) AND  
					( "FACTURA_CONTRATO_STGO"."ESTADO" = 'N' ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "CONTRATO"."AGENTE" = :ls_codigo ) AND  
					( "CADENA"."CODIGO" = 'P' ) )
		USING		sqlca;
		if isnull(ll_cta_contr) then ll_cta_contr=0
		ll_tot_reg				= ll_cta_prom + ll_cta_contr
	elseif ls_cardo = 'S' then   
		SELECT	COUNT("FACTURA_OFERTA"."BASE")
		INTO		:ll_cta_prom
		FROM		"FACTURA_OFERTA",	"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"CADENA_MORA",	"SUPERVISOR"  
		WHERE		( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
					( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
					( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "PAGO_OFERTA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA_MORA"."NUMERO" ) and  
					( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and
					( ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
					( "FACTURA_OFERTA"."SERIE" <> 'R' ) AND
					( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND
					( "FACTURA_OFERTA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "OFERTA_V"."COD_SUP" = :ls_codigo ) )   
		USING		sqlca;
		if isnull(ll_cta_prom) then ll_cta_prom=0
		
		SELECT	COUNT("FACTURA_CONTRATO_STGO"."BASE")
		INTO		:ll_cta_contr
		FROM		"FACTURA_CONTRATO_STGO",	"CADENA",	"CONTRATO",	"PAGARE",	"CADENA_MORA",	"AGENTES",	"SUPERVISOR" 
		WHERE		( "FACTURA_CONTRATO_STGO"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "FACTURA_CONTRATO_STGO"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CONTRATO"."SERIE" = "PAGARE"."SERIE_P" ) and  
					( "CONTRATO"."NRO_PAGARE" = "PAGARE"."NRO_PAGARE" ) and  
					( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CONTRATO"."AGENTE" = "AGENTES"."COD_AGE" ) and 
					( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and 
					( ( "FACTURA_CONTRATO_STGO"."BASE" = 'C' ) AND 
					( "FACTURA_CONTRATO_STGO"."ESTADO" = 'N' ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "FACTURA_CONTRATO_STGO"."COD_SUP" = :ls_codigo ) AND  
					( "CADENA"."CODIGO" = 'P' ) )
		USING		sqlca;
		if isnull(ll_cta_contr) then ll_cta_contr=0
		ll_tot_reg				= ll_cta_prom + ll_cta_contr
	end if

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if ls_cardo = 'A' then
		DECLARE x1 CURSOR FOR	
		SELECT	"FACTURA_OFERTA"."BASE",	"FACTURA_OFERTA"."SERIE",	"FACTURA_OFERTA"."NUMERO",	"FACTURA_OFERTA"."FECHA_CIERRE",	"OFERTA_V"."COD_AGE",	"PAGO_OFERTA"."FECHA_PRIM",	"PAGO_OFERTA"."NRO_CUOTAS",	"CADENA_MORA"."CTAS_PAG_S",	"CADENA_MORA"."MORA_CRED",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA"."FECHA_RES",	"CADENA"."RUT",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"AGENTES"."FECHA_INI"	
		FROM		"FACTURA_OFERTA",	"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"CADENA_MORA",	"AGENTES"
		WHERE 	( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
					( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
					( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and 
					( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) and
					( ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
					( "FACTURA_OFERTA"."SERIE" <> 'R' ) AND  
					( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "OFERTA_V"."COD_AGE" = :ls_codigo ) )   
		UNION
		SELECT	"FACTURA_CONTRATO_STGO"."BASE",	"FACTURA_CONTRATO_STGO"."SERIE",	"FACTURA_CONTRATO_STGO"."NUMERO",	"FACTURA_CONTRATO_STGO"."FECHA_CIERRE",	"CONTRATO"."AGENTE",	"PAGARE"."FECHA_PRIM",	"PAGARE"."PLAZO",	"CADENA_MORA"."CTAS_PAG_S",	"CADENA_MORA"."MORA_CRED",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA"."FECHA_RES",	"CADENA"."RUT",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"AGENTES"."FECHA_INI"  
		FROM		"FACTURA_CONTRATO_STGO",	"CADENA",	"CONTRATO",	"PAGARE",	"CADENA_MORA",	"AGENTES"  
		WHERE		( "CONTRATO"."SERIE" = "PAGARE"."SERIE_P" ) and  
					( "CONTRATO"."NRO_PAGARE" = "PAGARE"."NRO_PAGARE" ) and  
					( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "FACTURA_CONTRATO_STGO"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "FACTURA_CONTRATO_STGO"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and 
					( "CONTRATO"."AGENTE" = "AGENTES"."COD_AGE" ) and 
					( ( "FACTURA_CONTRATO_STGO"."BASE" = 'C' ) AND  
					( "FACTURA_CONTRATO_STGO"."ESTADO" = 'N' ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "CONTRATO"."AGENTE" = :ls_codigo ) AND  
					( "CADENA"."CODIGO" = 'P' ) )
		USING		sqlca;			
	elseif ls_cardo = 'S' then   
		DECLARE x2 CURSOR FOR	
		SELECT	"FACTURA_OFERTA"."BASE",	"FACTURA_OFERTA"."SERIE",	"FACTURA_OFERTA"."NUMERO",	"FACTURA_OFERTA"."FECHA_CIERRE",	"OFERTA_V"."COD_SUP",	"PAGO_OFERTA"."FECHA_PRIM",	"PAGO_OFERTA"."NRO_CUOTAS",	"CADENA_MORA"."CTAS_PAG_S",	"CADENA_MORA"."MORA_CRED",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA"."FECHA_RES",	"CADENA"."RUT",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"SUPERVISOR"."FECHA_ING"
		FROM		"FACTURA_OFERTA",	"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"CADENA_MORA",	"SUPERVISOR"  
		WHERE		( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
					( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
					( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "PAGO_OFERTA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA_MORA"."NUMERO" ) and  
					( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and
					( ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
					( "FACTURA_OFERTA"."SERIE" <> 'R' ) AND
					( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND
					( "FACTURA_OFERTA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "OFERTA_V"."COD_SUP" = :ls_codigo ) )   
		UNION   
		SELECT	"FACTURA_CONTRATO_STGO"."BASE",	"FACTURA_CONTRATO_STGO"."SERIE",	"FACTURA_CONTRATO_STGO"."NUMERO",	"FACTURA_CONTRATO_STGO"."FECHA_CIERRE",	"FACTURA_CONTRATO_STGO"."COD_SUP",	"PAGARE"."FECHA_PRIM",	"PAGARE"."PLAZO",	"CADENA_MORA"."CTAS_PAG_S",	"CADENA_MORA"."MORA_CRED",	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA"."FECHA_RES",	"CADENA"."RUT",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"SUPERVISOR"."FECHA_ING"
		FROM		"FACTURA_CONTRATO_STGO",	"CADENA",	"CONTRATO",	"PAGARE",	"CADENA_MORA",	"AGENTES",	"SUPERVISOR" 
		WHERE		( "FACTURA_CONTRATO_STGO"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "FACTURA_CONTRATO_STGO"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CONTRATO"."SERIE" = "PAGARE"."SERIE_P" ) and  
					( "CONTRATO"."NRO_PAGARE" = "PAGARE"."NRO_PAGARE" ) and  
					( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CONTRATO"."AGENTE" = "AGENTES"."COD_AGE" ) and 
					( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and 
					( ( "FACTURA_CONTRATO_STGO"."BASE" = 'C' ) AND 
					( "FACTURA_CONTRATO_STGO"."ESTADO" = 'N' ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
					( "FACTURA_CONTRATO_STGO"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND  
					( "FACTURA_CONTRATO_STGO"."COD_SUP" = :ls_codigo ) AND  
					( "CADENA"."CODIGO" = 'P' ) )
		USING		sqlca;
	end if
	if ls_cardo = 'A' then
		open x1;
	elseif ls_cardo = 'S' then 
		open x2;
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ls_cardo = 'A' then
				fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_fact,	:ls_codigo,	:ldt_fecha_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fecha_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ll_numero_consul,	:ldt_fecha_ing;	
			elseif ls_cardo = 'S' then 
				fetch x2 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_fact,	:ls_codigo,	:ldt_fecha_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fecha_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ll_numero_consul,	:ldt_fecha_ing;	
			end if
				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 then
					if ls_estado= 'P' then
						if ldt_fecha_01 < ldt_fecha_res then
							SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE") 
							INTO		:ldt_fecha_est 
							FROM 		"FACTURA_OFERTA"  
							WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul ) AND  
										( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
										( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
										( "FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_01 ) AND  
										( "FACTURA_OFERTA"."ESTADO" = 'S' )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ldt_fecha_est) then
									ldt_fecha_est										= ldt_fecha_est
								end if
							end if
							SELECT	"FACTURA_OFERTA"."ESTADO_CADENA"  
							INTO		:ls_estado  
							FROM 		"FACTURA_OFERTA"  
							WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul) AND  
										( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
										( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
										( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fecha_est ) AND  
										( "FACTURA_OFERTA"."ESTADO" = 'S' )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ls_estado) and ls_estado <> '' then
									ls_estado											= ls_estado
								else
									ls_estado											= ls_estado
								end if
							else
								ls_estado												= ls_estado
							end if
						else
							SELECT	"CADENA"."ESTADO"  
							INTO 		:ls_estado  
							FROM		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
										( "CADENA"."SERIE" = :ls_serie_consul ) AND  
										( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ls_estado) and ls_estado <> '' then
									ls_estado											= ls_estado
								else
									ls_estado											= ls_estado
								end if
							else
								ls_estado												= ls_estado
							end if
						end if
					else
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado  
						FROM		"CADENA"  
						WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
									( "CADENA"."SERIE" = :ls_serie_consul ) AND  
									( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
									( "CADENA"."COD_PARQUE" = :ll_cod_parque )
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							if not isnull(ls_estado) and ls_estado <> '' then
								ls_estado												= ls_estado
							else
								ls_estado												= ls_estado
							end if
						else
							ls_estado													= ls_estado
						end if
					end if
					SELECT	sum("INGRESO"."CUOTAS_PAG")  
					INTO		:ll_sum_pag_post  
					FROM		"CADENA",	"INGRESO"  
					WHERE		( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
								( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
								( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
								( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
								( "CADENA"."SERIE" = :ls_serie_consul ) AND  
								( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
								( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "INGRESO"."TIPO_MOV" = 'E' ) and
								( "INGRESO"."FECHA_PAGO" > :ldt_fecha_01 ) and
								( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ll_sum_pag_post) and ll_sum_pag_post>0 then
							ll_sum_pag_post											= ll_sum_pag_post
						else
							ll_sum_pag_post											= 0
						end if
					else
						ll_sum_pag_post												= 0
					end if
					SELECT	max("INGRESO"."FECHA_PAGO")  
					INTO		:ldt_fecha_ult_pago  
					FROM		"CADENA",	"INGRESO"  
					WHERE		( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
								( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
								( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
								( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
								( "CADENA"."SERIE" = :ls_serie_consul ) AND  
								( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
								( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "INGRESO"."TIPO_MOV" = 'E' ) and
								( "INGRESO"."FECHA_PAGO" > :ldt_fecha_01 ) and
								( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ldt_fecha_ult_pago) then
						end if
					end if
					ll_ctas_pag_1														= ll_cta_pag - ll_sum_pag_post
					select	to_char(add_months( to_date(:ldt_fecha_prim), :ll_ctas_pag_1 ),'dd/mm/yyyy')  
					INTO		:ls_fecha
					from 		dual;
					ldt_fecha_venc	= datetime(date(string(ls_fecha)),time('00:00:00'))
					ll_dias_mora														= DaysAfter(date(ldt_fecha_venc), date(ldt_fecha_01)) 
					if ll_dias_mora <= 5 then
						ll_mora_01														= 0
					else
					
						ll_dia_venc														= day(date(ldt_fecha_prim))
						ll_mes_venc														= month(date(ldt_fecha_prim))
						ll_ano_venc														= year(date(ldt_fecha_prim))
						ll_dia_01														= day(date(ldt_fecha_01))
						ll_mes_01														= month(date(ldt_fecha_01))
						ll_ano_01														= year(date(ldt_fecha_01))
						ll_resta_ano													= ll_ano_01 - ll_ano_venc
						ll_resta_ano													= ll_resta_ano * 12
						ll_resta_mes													= ll_mes_01 - ll_mes_venc
						ll_cuota_venc													= ll_resta_ano + ll_resta_mes 
						if ll_dia_01 > ll_dia_venc then 
							ll_cuota_venc  	                             	= ll_cuota_venc + 1 
						end if 
						if ll_cuota_venc < 0 then 
							ll_cuota_venc                          			= 0 
						end if												
						if ll_cuota_venc > ll_plazo then 
							ll_cuota_venc                              		= ll_plazo 
						end if 
						ll_mora_01														= ll_cuota_venc - ll_ctas_pag_1 
						if ll_mora_01 <= 0 then 
							ll_mora_01													= 0 
						end if
					end if
					ll_tot_venta														= 0
					ll_tot_mora															= 0
					if ls_estado <> 'P' then
						ll_tot_venta													= 1
						if ll_mora_01 >= 2 then
							ll_tot_mora													= 1
						else
							ll_tot_mora													= 0
						end if
					else
						ll_tot_venta													= 0
					end if
					ll_new																= dw_detalle.insertrow(0)
					dw_detalle.scrolltorow(ll_new)
					dw_detalle.setitem(ll_new,"base",ls_base)   
					dw_detalle.setitem(ll_new,"serie",ls_serie)   
					dw_detalle.setitem(ll_new,"numero",ldb_numero)   
					dw_detalle.setitem(ll_new,"fecha_fact",ldt_fecha_fact)
					dw_detalle.setitem(ll_new,"codigo",ls_codigo)
					dw_detalle.setitem(ll_new,"fecha_prim",ldt_fecha_prim)
					dw_detalle.setitem(ll_new,"plazo",ll_plazo)
					dw_detalle.setitem(ll_new,"ctas_pag_s",ll_cta_pag)
					dw_detalle.setitem(ll_new,"mora_actual",ll_mora_actual)
					dw_detalle.setitem(ll_new,"estado_contrato",ls_estado)
					dw_detalle.setitem(ll_new,"cod_parque",ll_cod_parque)
					dw_detalle.setitem(ll_new,"fecha_res",ldt_fecha_res)
					dw_detalle.setitem(ll_new,"rut",ll_rut)
					dw_detalle.setitem(ll_new,"base_consul",ls_base_consul)
					dw_detalle.setitem(ll_new,"serie_consul",ls_serie_consul)
					dw_detalle.setitem(ll_new,"numero_consul",ll_numero_consul)
					dw_detalle.setitem(ll_new,"fecha_cierre",ldt_fecha_01)	
					dw_detalle.setitem(ll_new,"fecha_ini",ldt_fecha_12)	
					dw_detalle.setitem(ll_new,"fecha_fin",ldt_fecha_04)
					dw_detalle.setitem(ll_new,"fecha_venc",ldt_fecha_venc)
					dw_detalle.setitem(ll_new,"fecha_ult_pago",ldt_fecha_ult_pago)
					dw_detalle.setitem(ll_new,"cargo",ls_cardo)
					dw_detalle.setitem(ll_new,'pago_post',ll_sum_pag_post)
					dw_detalle.setitem(ll_new,'ctas_pag_1',ll_ctas_pag_1)
					dw_detalle.setitem(ll_new,'mora_01',ll_mora_01)
					dw_detalle.setitem(ll_new,'cta_ventas',ll_tot_venta)
					dw_detalle.setitem(ll_new,'cta_mora',ll_tot_mora)
					dw_detalle.accepttext()
					ll_sun_tot_venta															= ll_sun_tot_venta + ll_tot_venta
					ll_sum_tot_mora															= ll_sum_tot_mora + ll_tot_mora
					if ll_sun_tot_venta > 0 then
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					else
						ldb_porce_mora															= 0
					end if
					if ll_sum_tot_mora > 0 then
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					else
						ldb_porce_mora															= 0
					end if
					if ll_sun_tot_venta = 0 and ll_sum_tot_mora = 0 then
						ldb_porce_mora															= 0
					else
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					end if
					ldb_porce_persist															= 100 - ldb_porce_mora
					dw_detalle.setitem(ll_new,'total_ventas',ll_sun_tot_venta)
					dw_detalle.setitem(ll_new,'total_mora',ll_sum_tot_mora)
					dw_detalle.setitem(ll_new,'porce_mora',ldb_porce_mora)
					dw_detalle.setitem(ll_new,'porce_persist',ldb_porce_persist)
					ll_antiguedad 																= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_01))
					if ll_antiguedad > 180 then
						if ldb_porce_persist < 55 then
							ls_clasif                                             = 'D'
						elseif ldb_porce_persist >= 55 and ldb_porce_persist < 65 then
							ls_clasif 															= 'C'
						elseif ldb_porce_persist >= 65 and ldb_porce_persist < 75 then
							ls_clasif															= 'B'
						elseif ldb_porce_persist >= 75 then
							ls_clasif															= 'A'
						end if
					else
						ls_clasif                                             	= 'C'
					end if
					dw_detalle.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
					dw_detalle.setitem(ll_new,'clasifica',ls_clasif)
					dw_detalle.AcceptText()
				end if
				setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text																= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux															= ldb_tot_porc
				end if
				ldb_tot_porc																	= (ll_new / ll_tot_reg) * 100
				hpb_1.Position 																= ldb_tot_porc
				st_cuenta.text 																= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_new,'###,###,###')+' ( '+string((ll_new*100)/ll_tot_reg,'#0.##')+'% )'
				dw_detalle.accepttext()
		LOOP
	else
		messagebox("Advertencia","No registra Datos")
	end if
	if ls_cardo = 'A' then
		close x1;
	elseif ls_cardo = 'S' then
		close x2;
	end if
end if
SetPointer(Arrow!)
st_fondo.visible																				= false
st_cuenta.visible																				= false
hpb_1.visible 																					= false
st_porc.visible 																				= false
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
em_fin.text																						= string(gdt_fec_sistema)
end event

type st_cuenta from statictext within w_persistencia_detalle
boolean visible = false
integer x = 1806
integer y = 984
integer width = 1371
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
string text = "none"
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_persistencia_detalle
boolean visible = false
integer x = 1806
integer y = 912
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_persistencia_detalle
boolean visible = false
integer x = 2382
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

type em_cargo from editmask within w_persistencia_detalle
boolean visible = false
integer x = 3703
integer y = 1944
integer width = 128
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string displaydata = ""
end type

event getfocus;cb_proceso.triggerevent(clicked!)
end event

type em_codigo from editmask within w_persistencia_detalle
boolean visible = false
integer x = 3145
integer y = 1944
integer width = 215
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string displaydata = ""
end type

type em_fecha_cierre from editmask within w_persistencia_detalle
boolean visible = false
integer x = 3369
integer y = 1944
integer width = 325
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_fin from editmask within w_persistencia_detalle
integer x = 553
integer y = 2192
integer width = 507
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "mm/dd/yyyy hh:mm:ss"
string displaydata = ""
end type

type em_ini from editmask within w_persistencia_detalle
integer x = 32
integer y = 2192
integer width = 507
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "mm/dd/yyyy hh:mm:ss"
string displaydata = ""
end type

type cb_proceso from commandbutton within w_persistencia_detalle
boolean visible = false
integer x = 645
integer y = 2068
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "proceso"
end type

event clicked;
string	ls_codigo,ls_base,ls_serie,ls_estado,ls_fecha,ls_cardo,ls_base_consul,ls_serie_consul,ls_clasif,ls_cod_age_sup,&
			ls_repacta
long		ll_new,ll_cta_pag,ll_plazo,ll_cod_parque,ll_sum_pag_post,ll_ctas_pag_1,ll_dias_mora,&
			ll_mora_01,ll_dia_venc,ll_mes_venc,ll_ano_venc,ll_dia_01,ll_mes_01,ll_ano_01,ll_resta_ano,ll_resta_mes,ll_cuota_venc,&
			ll_cta_mora,ll_mora_actual,ll_rut,ll_numero_consul,ll_tot_venta,ll_sun_tot_venta,ll_tot_mora,ll_sum_tot_mora,&
			ll_antiguedad,ll_cta_contr,ll_tot_reg,ll_repacta
datetime	ldt_fecha_cierre,ldt_fecha_01,ldt_fecha_02,ldt_fecha_03,ldt_fecha_04,ldt_fecha_05,ldt_fecha_06,ldt_fecha_07,&
			ldt_fecha_08,ldt_fecha_09,ldt_fecha_10,ldt_fecha_11,ldt_fecha_12,ldt_fecha_prim,ldt_fecha_fact,ldt_fecha_venc,&
			ldt_fecha_res,ldt_fecha_ult_pago,ldt_fecha_ing,ldt_fecha_est,ldt_fec_repac
date		ld_fecha
double	ldb_numero,ldb_porce_mora,ldb_porce_persist,ldb_tot_porc,ldb_tot_porc_aux

connect using Trans_1;
gf_centrar(w_persistencia_detalle)
em_ini.text																				= string(gdt_fec_sistema)
dw_detalle.Reset()
SetPointer(HourGlass!)
ls_codigo																				= string(em_codigo.text)
ldt_fecha_cierre																		= datetime(date(em_fecha_cierre.text),time('00:00:00'))
ls_cardo																					= string(em_cargo.text)
dw_detalle.object.usuario.text													= gs_user
if ldt_fecha_cierre < datetime(date(string('28/02/2011'))) then
	messagebox("Advertencia","No Registra Detalle")
else
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
	INTO	:ldt_fecha_01  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_01) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
	INTO	:ldt_fecha_02  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_01
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_02) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_03  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_02
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_03) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_04  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_03
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_04) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA") 
	INTO	:ldt_fecha_05  
	FROM	"CLASIFICA_HIST" 
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_04
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_05) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_06  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_05
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_06) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_07  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_06
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_07) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_08  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_07
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_08) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_09  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_08
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_09) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_10  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_09
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_10) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_11  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_10
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_11) then
		end if
	end if
	SELECT DISTINCT MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")
	INTO	:ldt_fecha_12  
	FROM	"CLASIFICA_HIST"  
	WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" < :ldt_fecha_11
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_12) then
		end if
	end if
	st_fondo.visible																		= true
	st_cuenta.visible																		= true
	hpb_1.visible 																			= true
	st_porc.visible 																		= true
	ldb_tot_porc																			= 0
	ldb_tot_porc_aux																		= 0			
	hpb_1.Position																			= ldb_tot_porc
	
	if ls_cardo = 'A' then
		SELECT	COUNT("BASE")
		INTO		:ll_cta_contr
    	FROM		"VISTA_PERSISTENCIA"  
   	WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
         		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND
					( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
					( "VISTA_PERSISTENCIA"."COD_AGE" = :ls_codigo )
		USING		sqlca;
	elseif ls_cardo = 'S' then
		SELECT	COUNT("BASE")
		INTO		:ll_cta_contr
    	FROM		"VISTA_PERSISTENCIA"  
   	WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
         		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND
					( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
					( "VISTA_PERSISTENCIA"."COD_SUP" = :ls_codigo )
		USING		sqlca;			
	end if
	if isnull(ll_cta_contr) then ll_cta_contr=0
		ll_tot_reg																			= ll_cta_contr
	if ls_cardo = 'A' then
		DECLARE x1 CURSOR FOR	
		SELECT	"BASE",		"SERIE",		"NUMERO",	"FECHA_CIERRE",	"FECHA_PRIM",		"NRO_CUOTAS",	"CTAS_PAG_S",	"MORA_CRED",		"ESTADO",	"COD_PARQUE",		"FECHA_RES",		"RUT",	"CAD_BASE",			"CAD_SERIE",		"CAD_CONTRATO",		"COD_AGE",	"FECHA_INI"
    	FROM		"VISTA_PERSISTENCIA"  
   	WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
         		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND
					( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
					( "VISTA_PERSISTENCIA"."COD_AGE" = :ls_codigo )
		USING		sqlca;			
	elseif ls_cardo = 'S' then
		DECLARE x2 CURSOR FOR
		SELECT	"BASE",		"SERIE",		"NUMERO",	"FECHA_CIERRE",	"FECHA_PRIM",		"NRO_CUOTAS",	"CTAS_PAG_S",	"MORA_CRED",		"ESTADO",	"COD_PARQUE",		"FECHA_RES",		"RUT",	"CAD_BASE",			"CAD_SERIE",		"CAD_CONTRATO",		"COD_SUP",	"FECHA_ING"  
    	FROM		"VISTA_PERSISTENCIA"  
   	WHERE		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" >= :ldt_fecha_12 ) AND  
         		( "VISTA_PERSISTENCIA"."FECHA_CIERRE" <= :ldt_fecha_04 ) AND
					( "VISTA_PERSISTENCIA"."SERIE" <> 'R' ) AND 
					( "VISTA_PERSISTENCIA"."COD_SUP" = :ls_codigo )
		USING		sqlca;			
	end if
	if ls_cardo = 'A' then
		open x1;
	elseif ls_cardo = 'S' then 
		open x2;
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ls_cardo = 'A' then
				fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_fact,	:ldt_fecha_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fecha_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ll_numero_consul,	:ls_codigo,	:ldt_fecha_ing;	
			elseif ls_cardo = 'S' then 
				fetch x2 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_fact,	:ldt_fecha_prim,	:ll_plazo,	:ll_cta_pag,	:ll_mora_actual,	:ls_estado,	:ll_cod_parque,	:ldt_fecha_res,	:ll_rut,	:ls_base_consul,	:ls_serie_consul,	:ll_numero_consul,	:ls_codigo,	:ldt_fecha_ing;	
			end if
				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 then
					if ls_estado= 'P' then
						if ldt_fecha_01 < ldt_fecha_res then
							SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE") 
							INTO		:ldt_fecha_est 
							FROM 		"FACTURA_OFERTA"  
							WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul ) AND  
										( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
										( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
										( "FACTURA_OFERTA"."FECHA_CIERRE" < :ldt_fecha_01 ) AND  
										( "FACTURA_OFERTA"."ESTADO" = 'S' )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ldt_fecha_est) then
									ldt_fecha_est										= ldt_fecha_est
								end if
							end if
							SELECT	"FACTURA_OFERTA"."ESTADO_CADENA"  
							INTO		:ls_estado  
							FROM 		"FACTURA_OFERTA"  
							WHERE 	( "FACTURA_OFERTA"."BASE" = :ls_base_consul) AND  
										( "FACTURA_OFERTA"."SERIE" = :ls_serie_consul ) AND  
										( "FACTURA_OFERTA"."NUMERO" = :ll_numero_consul ) AND  
										( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fecha_est ) AND  
										( "FACTURA_OFERTA"."ESTADO" = 'S' )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ls_estado) and ls_estado <> '' then
									ls_estado											= ls_estado
								else
									ls_estado											= ls_estado
								end if
							else
								ls_estado												= ls_estado
							end if
						else
							SELECT	"CADENA"."ESTADO"  
							INTO 		:ls_estado  
							FROM		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
										( "CADENA"."SERIE" = :ls_serie_consul ) AND  
										( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque )
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ls_estado) and ls_estado <> '' then
									ls_estado											= ls_estado
								else
									ls_estado											= ls_estado
								end if
							else
								ls_estado												= ls_estado
							end if
						end if
					else
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado  
						FROM		"CADENA"  
						WHERE 	( "CADENA"."CODIGO" = :ls_base_consul ) AND  
									( "CADENA"."SERIE" = :ls_serie_consul ) AND  
									( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
									( "CADENA"."COD_PARQUE" = :ll_cod_parque )
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							if not isnull(ls_estado) and ls_estado <> '' then
								ls_estado												= ls_estado
							else
								ls_estado												= ls_estado
							end if
						else
							ls_estado													= ls_estado
						end if
					end if
					SELECT	sum("INGRESO"."CUOTAS_PAG")  
					INTO		:ll_sum_pag_post  
					FROM		"CADENA",	"INGRESO"  
					WHERE		( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
								( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
								( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
								( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
								( "CADENA"."SERIE" = :ls_serie_consul ) AND  
								( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
								( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "INGRESO"."TIPO_MOV" = 'E' ) and
								( "INGRESO"."FECHA_PAGO" > :ldt_fecha_01 ) and
								( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ll_sum_pag_post) and ll_sum_pag_post>0 then
							ll_sum_pag_post											= ll_sum_pag_post
						else
							ll_sum_pag_post											= 0
						end if
					else
						ll_sum_pag_post												= 0
					end if
					SELECT	max("INGRESO"."FECHA_PAGO")  
					INTO		:ldt_fecha_ult_pago  
					FROM		"CADENA",	"INGRESO"  
					WHERE		( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
								( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
								( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
								( ( "CADENA"."CODIGO" = :ls_base_consul ) AND  
								( "CADENA"."SERIE" = :ls_serie_consul ) AND  
								( "CADENA"."NUMERO" = :ll_numero_consul ) AND  
								( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "INGRESO"."TIPO_MOV" = 'E' ) and
								( "INGRESO"."FECHA_PAGO" > :ldt_fecha_01 ) and
								( "INGRESO"."FECHA_PAGO" <= :gdt_fec_sistema ))
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ldt_fecha_ult_pago) then
						end if
					end if
					
/*REPACTA*/		SELECT	MAX("SOL_REPACTA_CVTA"."FECVTA_1_VCTO")
					INTO		:ldt_fec_repac  
					FROM 		"SOL_REPACTA_CVTA"
					WHERE		"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
								"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
								"SOL_REPACTA_CVTA"."NUMERO" = :ll_numero_consul AND
								"SOL_REPACTA_CVTA"."FECHA_INFOR" >= :ldt_fecha_01
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						if not isnull(ldt_fec_repac) then
							ls_repacta													= 'Repactado'
							SELECT	"SOL_REPACTA_CVTA"."FECVTA_1_VCTO"
							INTO		:ldt_fecha_prim  
							FROM 		"SOL_REPACTA_CVTA"
							WHERE		"SOL_REPACTA_CVTA"."BASE" = :ls_base_consul AND   
										"SOL_REPACTA_CVTA"."SERIE" = :ls_serie_consul AND   
										"SOL_REPACTA_CVTA"."NUMERO" = :ll_numero_consul AND
										"SOL_REPACTA_CVTA"."FECVTA_1_VCTO" = :ldt_fec_repac
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								if not isnull(ldt_fecha_prim) then
									ldt_fecha_prim										= ldt_fecha_prim
								end if
							end if
						else
							ls_repacta													= ''
						end if
					else
						ls_repacta														= ''
					end if
					
					ll_ctas_pag_1														= ll_cta_pag - ll_sum_pag_post
					select	to_char(add_months( to_date(:ldt_fecha_prim), :ll_ctas_pag_1 ),'dd/mm/yyyy')  
					INTO		:ls_fecha
					from 		dual;
					ldt_fecha_venc	= datetime(date(string(ls_fecha)),time('00:00:00'))
					ll_dias_mora														= DaysAfter(date(ldt_fecha_venc), date(ldt_fecha_01)) 
					if ll_dias_mora <= 5 then
						ll_mora_01														= 0
					else
					
						ll_dia_venc														= day(date(ldt_fecha_prim))
						ll_mes_venc														= month(date(ldt_fecha_prim))
						ll_ano_venc														= year(date(ldt_fecha_prim))
						ll_dia_01														= day(date(ldt_fecha_01))
						ll_mes_01														= month(date(ldt_fecha_01))
						ll_ano_01														= year(date(ldt_fecha_01))
						ll_resta_ano													= ll_ano_01 - ll_ano_venc
						ll_resta_ano													= ll_resta_ano * 12
						ll_resta_mes													= ll_mes_01 - ll_mes_venc
						ll_cuota_venc													= ll_resta_ano + ll_resta_mes 
						if ll_dia_01 > ll_dia_venc then 
							ll_cuota_venc  	                             	= ll_cuota_venc + 1 
						end if 
						if ll_cuota_venc < 0 then 
							ll_cuota_venc                          			= 0 
						end if												
						if ll_cuota_venc > ll_plazo then 
							ll_cuota_venc                              		= ll_plazo 
						end if 
						ll_mora_01														= ll_cuota_venc - ll_ctas_pag_1 
						if ll_mora_01 <= 0 then 
							ll_mora_01													= 0 
						end if
					end if
					ll_tot_venta														= 0
					ll_tot_mora															= 0
					if ls_estado <> 'P' then
						ll_tot_venta													= 1
						if ll_mora_01 >= 2 then
							ll_tot_mora													= 1
						else
							ll_tot_mora													= 0
						end if
					else
						ll_tot_venta													= 0
					end if
					
					ll_new																= dw_detalle.insertrow(0)
					dw_detalle.scrolltorow(ll_new)
					dw_detalle.setitem(ll_new,"base",ls_base)   
					dw_detalle.setitem(ll_new,"serie",ls_serie)   
					dw_detalle.setitem(ll_new,"numero",ldb_numero)   
					dw_detalle.setitem(ll_new,"fecha_fact",ldt_fecha_fact)
					dw_detalle.setitem(ll_new,"codigo",ls_codigo)
					dw_detalle.setitem(ll_new,"fecha_prim",ldt_fecha_prim)
					dw_detalle.setitem(ll_new,"plazo",ll_plazo)
					dw_detalle.setitem(ll_new,"ctas_pag_s",ll_cta_pag)
					dw_detalle.setitem(ll_new,"mora_actual",ll_mora_actual)
					dw_detalle.setitem(ll_new,"estado_contrato",ls_estado)
					dw_detalle.setitem(ll_new,"cod_parque",ll_cod_parque)
					dw_detalle.setitem(ll_new,"fecha_res",ldt_fecha_res)
					dw_detalle.setitem(ll_new,"rut",ll_rut)
					dw_detalle.setitem(ll_new,"base_consul",ls_base_consul)
					dw_detalle.setitem(ll_new,"serie_consul",ls_serie_consul)
					dw_detalle.setitem(ll_new,"numero_consul",ll_numero_consul)
					dw_detalle.setitem(ll_new,"fecha_cierre",ldt_fecha_01)	
					dw_detalle.setitem(ll_new,"fecha_ini",ldt_fecha_12)	
					dw_detalle.setitem(ll_new,"fecha_fin",ldt_fecha_04)
					dw_detalle.setitem(ll_new,"fecha_venc",ldt_fecha_venc)
					dw_detalle.setitem(ll_new,"fecha_ult_pago",ldt_fecha_ult_pago)
					dw_detalle.setitem(ll_new,"cargo",ls_cardo)
					dw_detalle.setitem(ll_new,'pago_post',ll_sum_pag_post)
					dw_detalle.setitem(ll_new,'ctas_pag_1',ll_ctas_pag_1)
					dw_detalle.setitem(ll_new,'mora_01',ll_mora_01)
					dw_detalle.setitem(ll_new,'cta_ventas',ll_tot_venta)
					dw_detalle.setitem(ll_new,'cta_mora',ll_tot_mora)
					dw_detalle.setitem(ll_new,'repacta',ls_repacta)
					dw_detalle.accepttext()
					ll_sun_tot_venta															= ll_sun_tot_venta + ll_tot_venta
					ll_sum_tot_mora															= ll_sum_tot_mora + ll_tot_mora
					if ll_sun_tot_venta > 0 then
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					else
						ldb_porce_mora															= 0
					end if
					if ll_sum_tot_mora > 0 then
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					else
						ldb_porce_mora															= 0
					end if
					if ll_sun_tot_venta = 0 and ll_sum_tot_mora = 0 then
						ldb_porce_mora															= 0
					else
						ldb_porce_mora															= ll_sum_tot_mora / ll_sun_tot_venta * 100
					end if
					ldb_porce_persist															= 100 - ldb_porce_mora
					dw_detalle.setitem(ll_new,'total_ventas',ll_sun_tot_venta)
					dw_detalle.setitem(ll_new,'total_mora',ll_sum_tot_mora)
					dw_detalle.setitem(ll_new,'porce_mora',ldb_porce_mora)
					dw_detalle.setitem(ll_new,'porce_persist',ldb_porce_persist)
					ll_antiguedad 																= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_01))
					if ll_antiguedad > 180 then
						if ldb_porce_persist < 55 then
							ls_clasif                                             = 'D'
						elseif ldb_porce_persist >= 55 and ldb_porce_persist < 65 then
							ls_clasif 															= 'C'
						elseif ldb_porce_persist >= 65 and ldb_porce_persist < 75 then
							ls_clasif															= 'B'
						elseif ldb_porce_persist >= 75 then
							ls_clasif															= 'A'
						end if
					else
						ls_clasif                                             	= 'C'
					end if
					dw_detalle.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
					dw_detalle.setitem(ll_new,'clasifica',ls_clasif)
					dw_detalle.AcceptText()
				end if
				setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text																= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux															= ldb_tot_porc
				end if
				ldb_tot_porc																	= (ll_new / ll_tot_reg) * 100
				hpb_1.Position 																= ldb_tot_porc
				st_cuenta.text 																= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_new,'###,###,###')+' ( '+string((ll_new*100)/ll_tot_reg,'#0.##')+'% )'
				dw_detalle.accepttext()
		LOOP
	else
		messagebox("Advertencia","No registra Datos")
	end if
	if ls_cardo = 'A' then
		close x1;
	elseif ls_cardo = 'S' then
		close x2;
	end if
end if
SetPointer(Arrow!)
st_fondo.visible																				= false
st_cuenta.visible																				= false
hpb_1.visible 																					= false
st_porc.visible 																				= false
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
em_fin.text																						= string(gdt_fec_sistema)
end event

type cb_grabar from commandbutton within w_persistencia_detalle
boolean visible = false
integer x = 1175
integer y = 1920
integer width = 315
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;//string	ls_cargo,ls_codigo,ls_clasif
//long		ll_tot_venta,ll_tot_mora,ll_resp,ll_tot_reg
//datetime	ldt_fecha_clas
//double	ldb_porce_persist
//
//dw_detalle.AcceptText()
//if dw_detalle.rowcount() > 0 then
//	ll_tot_reg						= dw_detalle.rowcount()
//	ls_cargo							= dw_detalle.getitemstring(1,'cargo')
//	ls_codigo							= dw_detalle.getitemstring(1,'codigo')
//	ldt_fecha_clas					= dw_detalle.getitemdatetime(1,'fecha_cierre')
//	ll_tot_venta						= dw_detalle.getitemnumber(ll_tot_reg,'total_ventas')
//	ll_tot_mora						= dw_detalle.getitemnumber(ll_tot_reg,'total_mora')
//	ldb_porce_persist				= Round(dw_detalle.getitemnumber(ll_tot_reg,'porce_persist'), 2)
//	ls_clasif							= dw_detalle.getitemstring(ll_tot_reg,'clasifica')
//end if
//ll_resp 								= MessageBox("Modificar","¿Desea modificar Datos del Código " +ls_codigo, Exclamation!, YesNo!, 2)
//if ll_resp = 1 then
//	if ls_cargo = 'A' then
//		UPDATE	"CLASIFICA_HIST"  
//		SET 		"CONTRATOS_CLASIFICA" = :ll_tot_venta,   
//					"MORA_CLASIFICA" = :ll_tot_mora,   
//					"PORCE_CLASIFICA" = :ldb_porce_persist,   
//					"TIPO_CLASIFICA" = :ls_clasif  
//		WHERE	( "CLASIFICA_HIST"."COD_AGE" = :ls_codigo ) AND  
//					( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :ldt_fecha_clas )
//		USING		Trans_2;
//		if Trans_2.sqlcode=0 then
//			commit using Trans_2;
//		else
//			rollback using Trans_2;
//			messagebox("Error Grabar","Error al Grabar SQL: "+Trans_2.sqlerrtext)
//		end if
//		
//		UPDATE	"AGENTES"  
//     	SET		"CLASIFICACION" = :ls_clasif  
//		WHERE	"AGENTES"."COD_AGE" = :ls_codigo   
//      	using		Trans_2;
//		if Trans_2.sqlcode = 0 then
//			commit using Trans_2;
//		else
//			rollback using Trans_2;
//		end if
//		messagebox('Grabar', 'Proceso de Grabación Exitoso Agentes')
//	elseif ls_cargo = 'S' then
//		UPDATE	"CLASIFICA_HIST_SUP"  
//		SET 		"CONTRATOS_CLASIFICA_SUP" = :ll_tot_venta,   
//					"MORA_CLASIFICA_SUP" = :ll_tot_mora,   
//					"PORCE_CLASIFICA_SUP" = :ldb_porce_persist,   
//					"TIPO_CLASIFICA_SUP" = :ls_clasif  
//		WHERE	( "CLASIFICA_HIST_SUP"."COD_SUP" = :ls_codigo ) AND  
//					( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_clas )
//		USING	Trans_2;
//		if Trans_2.sqlcode=0 then
//			commit using Trans_2;
//		else
//			rollback using Trans_2;
//			messagebox("Error Grabar","Error al Grabar SQL: "+Trans_2.sqlerrtext)
//		end if
//		
//		UPDATE	"SUPERVISOR"  
//		SET		"CLASIFICA" = :ls_clasif  
//		WHERE	"SUPERVISOR"."COD_SUP" = :ls_codigo   
//		using		Trans_2;
//		if Trans_2.sqlcode = 0 then
//			commit using Trans_2;
//		else
//			rollback using Trans_2;
//		end if
//		messagebox('Grabar', 'Proceso de Grabación Exitoso Supervisor')
//	end if
//else
//	messagebox("Advertencia","Proceso Cancelado")
//end if
end event

type cb_asocia_contrato from commandbutton within w_persistencia_detalle
integer x = 466
integer y = 1920
integer width = 379
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Rut"
end type

event clicked;if dw_detalle.getrow() > 0 then 
	gi_rut = dw_detalle.getitemnumber(dw_detalle.getrow(),'rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_cta_cte from commandbutton within w_persistencia_detalle
integer x = 37
integer y = 1920
integer width = 425
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	gs_base						= dw_detalle.getitemstring(il_row,'base')
	gs_serie						= dw_detalle.getitemstring(il_row,'serie')
	gi_numero					= dw_detalle.getitemnumber(il_row,'numero')
	gi_rut							= dw_detalle.getitemnumber(il_row,'rut')
	
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
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
	END CHOOSE
end if
end event

type cb_ordenar from commandbutton within w_persistencia_detalle
integer x = 2149
integer y = 1920
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_filtrar from commandbutton within w_persistencia_detalle
boolean visible = false
integer x = 329
integer y = 2092
integer width = 238
integer height = 80
integer taborder = 30
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_imprimir from commandbutton within w_persistencia_detalle
integer x = 2386
integer y = 1920
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then dw_detalle.print()
end event

type cb_cerrar from commandbutton within w_persistencia_detalle
integer x = 4375
integer y = 1920
integer width = 311
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_persistencia_detalle)
end event

type st_fondo from statictext within w_persistencia_detalle
boolean visible = false
integer x = 1774
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

type dw_detalle from datawindow within w_persistencia_detalle
integer x = 37
integer y = 32
integer width = 4649
integer height = 1860
integer taborder = 10
string dataobject = "dw_vista_5_7"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

