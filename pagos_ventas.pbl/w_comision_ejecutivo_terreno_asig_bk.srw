forward
global type w_comision_ejecutivo_terreno_asig_bk from window
end type
type cb_exportar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_actualiza from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_ordenar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type hpb_1 from hprogressbar within w_comision_ejecutivo_terreno_asig_bk
end type
type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno_asig_bk
end type
type em_ctto from editmask within w_comision_ejecutivo_terreno_asig_bk
end type
type pb_buscar from picturebutton within w_comision_ejecutivo_terreno_asig_bk
end type
type st_promesa from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_pagos from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type dw_por_ctto from datawindow within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_limpiar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type usuario_t from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type st_usuario from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_grabar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_imprimir from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno_asig_bk
end type
type p_termino from picture within w_comision_ejecutivo_terreno_asig_bk
end type
type st_desde from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type em_termino from editmask within w_comision_ejecutivo_terreno_asig_bk
end type
type em_inicio from editmask within w_comision_ejecutivo_terreno_asig_bk
end type
type st_hasta from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
end type
type gb_periodo from groupbox within w_comision_ejecutivo_terreno_asig_bk
end type
type st_porc from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type st_fondo from statictext within w_comision_ejecutivo_terreno_asig_bk
end type
type dw_comision from datawindow within w_comision_ejecutivo_terreno_asig_bk
end type
type gb_1 from groupbox within w_comision_ejecutivo_terreno_asig_bk
end type
end forward

global type w_comision_ejecutivo_terreno_asig_bk from window
integer width = 3771
integer height = 2184
boolean titlebar = true
string title = "Comisiones Ventas Asignadas Ejecutivo Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_actualiza cb_actualiza
cb_ordenar cb_ordenar
hpb_1 hpb_1
dw_ejecutivo dw_ejecutivo
em_ctto em_ctto
pb_buscar pb_buscar
st_promesa st_promesa
cb_pagos cb_pagos
dw_por_ctto dw_por_ctto
cb_limpiar cb_limpiar
cb_resumen_comi cb_resumen_comi
usuario_t usuario_t
st_usuario st_usuario
cb_grabar cb_grabar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
p_termino p_termino
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
cb_cerrar cb_cerrar
gb_periodo gb_periodo
st_porc st_porc
st_fondo st_fondo
dw_comision dw_comision
gb_1 gb_1
end type
global w_comision_ejecutivo_terreno_asig_bk w_comision_ejecutivo_terreno_asig_bk

type variables
long il_row
end variables

forward prototypes
public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero)
public subroutine wf_actualizar (string fecha_cierre)
end prototypes

public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero);Long		ll_ctas_pag,ll_monto,ll_val_cta_div,ll_tot_reg,ll_indi,ll_new,ll_plazo,&
			ll_cta_pag_ctto,ll_rut_at
String	ls_cod_at,ls_nombre_at,ls_sin_reg,ls_moneda
Double	ldb_porce_1,ldb_porce_2,ldb_porce_3,ldb_porce_4,ldb_porce_5,ldb_porce_6,ldb_porce_7,&
			ldb_porce_8,ldb_porce_9,ldb_porce_10,ldb_porce_11,ldb_porce_12, ldb_precio
			
ll_tot_reg	= dw_por_ctto.rowcount()
if ll_tot_reg=0 then
	ls_sin_reg	= 'S'
else
	ls_sin_reg	= 'N'
end if
if ls_sin_reg='S' then
	SELECT	"AT_GESTION"."USUARIO_ASIGNADO",	"ENCARGADOS"."NOMBRE",	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."CTA_PAG_S",	"ENCARGADOS"."RUT",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."PRECIO"
	INTO 		:ls_cod_at,								:ls_nombre_at,				:ll_plazo,							:ll_cta_pag_ctto,			:ll_rut_at,				:ls_moneda,					:ldb_precio
	FROM 		"AT_GESTION",	"OFERTA_V",	"PAGO_OFERTA",	"ENCARGADOS"  
	WHERE  ( "AT_GESTION"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			 ( "AT_GESTION"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "AT_GESTION"."USUARIO_ASIGNADO" = "ENCARGADOS"."CODIGO_USUARIO" ) and  
			 (("AT_GESTION"."BASE" = 'O' ) AND  
			 ( "AT_GESTION"."SERIE" = :as_serie ) AND  
			 ( "AT_GESTION"."NUMERO" = :al_numero ) )   ;
			 
	SELECT	"COMISION_ATENCION_TERRENO"."UNO",	"COMISION_ATENCION_TERRENO"."DOS",	"COMISION_ATENCION_TERRENO"."TRES",	"COMISION_ATENCION_TERRENO"."CUATRO",	"COMISION_ATENCION_TERRENO"."CINCO",	"COMISION_ATENCION_TERRENO"."SEIS",	"COMISION_ATENCION_TERRENO"."SIETE",	"COMISION_ATENCION_TERRENO"."OCHO",	"COMISION_ATENCION_TERRENO"."NUEVE",	"COMISION_ATENCION_TERRENO"."DIES",	"COMISION_ATENCION_TERRENO"."ONCE",	"COMISION_ATENCION_TERRENO"."DOCE"
	INTO 		:ldb_porce_1,								:ldb_porce_2,								:ldb_porce_3,								:ldb_porce_4,									:ldb_porce_5,									:ldb_porce_6,								:ldb_porce_7, 									:ldb_porce_8,   							:ldb_porce_9,   								:ldb_porce_10,								:ldb_porce_11,   							:ldb_porce_12  
	FROM 		"COMISION_ATENCION_TERRENO"  
	WHERE  ( :ll_plazo >= "COMISION_ATENCION_TERRENO"."CRED_MIN" ) AND  
			 ( :ll_plazo <= "COMISION_ATENCION_TERRENO"."CRED_MAX" )   ;

end if
DECLARE x2 CURSOR FOR  
SELECT DISTINCT "INGRESO"."CUOTAS_PAG", "INGRESO"."MONTO"
    FROM "INGRESO",   
         "CADENA",   
         "AT_GESTION",   
         "OFERTA_V",   
         "PAGO_OFERTA",   
         "ENCARGADOS",   
         "COMISION_ATENCION_TERRENO"  
   WHERE ( "INGRESO"."BASE" = "CADENA"."CODIGO" ) and  
         ( "INGRESO"."SERIE" = "CADENA"."SERIE" ) and  
         ( "INGRESO"."CONTRATO" = "CADENA"."NUMERO" ) and  
         ( "CADENA"."CODIGO" = "AT_GESTION"."BASE" ) and  
         ( "CADENA"."SERIE" = "AT_GESTION"."SERIE" ) and  
         ( "CADENA"."NUMERO" = "AT_GESTION"."NUMERO" ) and  
         ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
         ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
         ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
         ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
         ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
         ( "AT_GESTION"."USUARIO_ASIGNADO" = "ENCARGADOS"."CODIGO_USUARIO" ) and  
         (("CADENA"."CODIGO" = 'O') AND  
         ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C')) AND  
         ( "INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0') AND  
         ( "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'E') AND  
         ( "INGRESO"."FECHA_PAGO" >= :adt_fecha_ini AND  
           "INGRESO"."FECHA_PAGO" <= :adt_fecha_fin) AND  
         ( "PAGO_OFERTA"."NRO_CUOTAS" >= "COMISION_ATENCION_TERRENO"."CRED_MIN" AND  
           "PAGO_OFERTA"."NRO_CUOTAS" <= "COMISION_ATENCION_TERRENO"."CRED_MAX") AND  
         ( "PAGO_OFERTA"."NRO_CUOTAS" >= 24 AND  
           "INGRESO"."SERIE" = :as_serie AND  
           "INGRESO"."CONTRATO" = :al_numero AND  
           "INGRESO"."CUOTAS_PAG" > 1 )      
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ll_ctas_pag, :ll_monto;
		if ll_ctas_pag > 1 and not isnull(ll_ctas_pag) and not isnull(ll_monto) and &
			ll_ctas_pag>0 and ll_monto>0 then
			ll_val_cta_div	= ll_monto / ll_ctas_pag
			for ll_indi=1 to ll_ctas_pag 
				if ll_tot_reg < 12 then
					ll_new	= dw_por_ctto.insertrow(0)
					dw_por_ctto.setitem(ll_new,'oferta_v_serie',as_serie)
					dw_por_ctto.setitem(ll_new,'oferta_v_nro_oferta',al_numero)
					dw_por_ctto.setitem(ll_new,'ingreso_monto',ll_val_cta_div)
					dw_por_ctto.setitem(ll_new,'ingreso_cuotas_pag',1)
					if ls_sin_reg='S' then
						dw_por_ctto.setitem(ll_new,'at_gestion_usuario_asignado',ls_cod_at)
						dw_por_ctto.setitem(ll_new,'encargados_nombre',ls_nombre_at)
						dw_por_ctto.setitem(ll_new,'encargados_rut',ll_rut_at)
						dw_por_ctto.setitem(ll_new,'oferta_v_cta_pag_s',ll_cta_pag_ctto)
						dw_por_ctto.setitem(ll_new,'pago_oferta_nro_cuotas',ll_plazo)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_uno', ldb_porce_1)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_dos', ldb_porce_2)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_tres', ldb_porce_3)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_cuatro', ldb_porce_4)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_cinco', ldb_porce_5)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_seis', ldb_porce_6)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_siete', ldb_porce_7)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_ocho', ldb_porce_8)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_nueve', ldb_porce_9)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_dies',ldb_porce_10)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_once',ldb_porce_11)
						dw_por_ctto.setitem(ll_new,'comision_atencion_terreno_doce',ldb_porce_12)
						dw_por_ctto.setitem(ll_new,'pago_oferta_moneda',ls_moneda)
						dw_por_ctto.setitem(ll_new,'pago_oferta_precio',ldb_precio)
					end if
					ll_tot_reg ++
				end if
			next
		end if
		Setnull(ll_ctas_pag);Setnull(ll_monto)
	LOOP
end if
close x2;
end subroutine

public subroutine wf_actualizar (string fecha_cierre);//string	cod,serie,ls_est_comi_at
//long 		rut,total_pago,monto,COUNT,contrato,mes
//double 	uf,porc
//datetime fecha1
//integer 	i,AGE
//datastore ds_res_comi
//
//fecha1 						= datetime(date(fecha_cierre),time('00:00:00'))
//ds_res_comi 				= create datastore
//ds_res_comi.dataobject	='dw_rescata_valores_res_comi_at'
//ds_res_comi.settransobject(sqlca)
//ds_res_comi.retrieve(fecha1)
//COUNT 						= ds_res_comi.rowcount()
//if COUNT > 0 then
//	for i = 1 to COUNT
//		cod 		    		= ds_res_comi.getitemstring(i,'cod_age_sup')
//		serie 	    		= ds_res_comi.getitemstring(i,'serie')
//		contrato     		= ds_res_comi.getitemnumber(i,'contrato')
//		uf 		    		= ds_res_comi.getitemnumber(i,'valor_uf')
//		porc 		   		= ds_res_comi.getitemnumber(i,'porc_ing_caja')
//		monto 	   		= ds_res_comi.getitemnumber(i,'mont_age_sup')
//		fecha1 	    		= ds_res_comi.getitemdatetime(i,'fecha')
//		mes			 		= long(ds_res_comi.getitemstring(i,'mes'))
//		if mes < 12 then
//			ls_est_comi_at	= 'S'
//		elseif mes >= 12 then
//			ls_est_comi_at	= 'P'
//		end if
//		if isnull(porc) then porc=0
//		if isnull(monto) then monto=0
//		UPDATE  OFERTA_V  
//		SET  	  ESTADO_COMI_AT  = :ls_est_comi_at
//		WHERE   SERIE = :serie  AND  
//				  NRO_OFERTA = :contrato  ;
//		If sqlca.sqlcode < 0 Then
//			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_actualiza()")
//			ROLLBACK;
//			return -1
//		ELSE
//			COMMIT;
//		end if	
//	next
//end if	
//return 1
end subroutine

on w_comision_ejecutivo_terreno_asig_bk.create
this.cb_exportar=create cb_exportar
this.cb_actualiza=create cb_actualiza
this.cb_ordenar=create cb_ordenar
this.hpb_1=create hpb_1
this.dw_ejecutivo=create dw_ejecutivo
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.st_promesa=create st_promesa
this.cb_pagos=create cb_pagos
this.dw_por_ctto=create dw_por_ctto
this.cb_limpiar=create cb_limpiar
this.cb_resumen_comi=create cb_resumen_comi
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.dw_comision=create dw_comision
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_actualiza,&
this.cb_ordenar,&
this.hpb_1,&
this.dw_ejecutivo,&
this.em_ctto,&
this.pb_buscar,&
this.st_promesa,&
this.cb_pagos,&
this.dw_por_ctto,&
this.cb_limpiar,&
this.cb_resumen_comi,&
this.usuario_t,&
this.st_usuario,&
this.cb_grabar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.p_termino,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.cb_cerrar,&
this.gb_periodo,&
this.st_porc,&
this.st_fondo,&
this.dw_comision,&
this.gb_1}
end on

on w_comision_ejecutivo_terreno_asig_bk.destroy
destroy(this.cb_exportar)
destroy(this.cb_actualiza)
destroy(this.cb_ordenar)
destroy(this.hpb_1)
destroy(this.dw_ejecutivo)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.st_promesa)
destroy(this.cb_pagos)
destroy(this.dw_por_ctto)
destroy(this.cb_limpiar)
destroy(this.cb_resumen_comi)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.dw_comision)
destroy(this.gb_1)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

event open;string	ls_fecha_comi,ls_fecha_comi_nue,ls_cod_contable
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_nue,ll_ano_comi_nue
datetime	ldt_fecha_comi,ldt_fecha_comi_nue,ldt_fecha_res_comi

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_comision_ejecutivo_terreno_asig)
dw_por_ctto.settransobject(sqlca)
dw_comision.settransobject(sqlca)
st_usuario.text						= string(gs_user)
ls_cod_contable						= '069'
ldt_fecha_comi							= gdt_fec_sistema  

if not isnull(ldt_fecha_comi) then
	ll_mes_comi						= month(date(ldt_fecha_comi))
	ll_ano_comi						= year(date(ldt_fecha_comi))
	ls_fecha_comi					= '15/'+ string(ll_mes_comi,'00')+ '/' +string(ll_ano_comi,'0000')
	em_termino.text				= string(ls_fecha_comi)
	ldt_fecha_comi					= datetime(date(em_termino.text),time('00:00:00'))
	
	if ll_mes_comi = 1 then
		ll_mes_comi_nue 			= ll_mes_comi + 11
		ll_ano_comi_nue 			= ll_ano_comi - 1
		ls_fecha_comi_nue			= '16/'+ string(ll_mes_comi_nue,'00')+ '/' +string(ll_ano_comi_nue,'0000')
		em_inicio.text				= string(ls_fecha_comi_nue)
		ldt_fecha_comi_nue		= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_nue = ll_mes_comi - 1
		ll_ano_comi_nue = ll_ano_comi
		ls_fecha_comi_nue			= '16/'+ string(ll_mes_comi_nue,'00')+ '/' +string(ll_ano_comi_nue,'0000')
		em_inicio.text				= string(ls_fecha_comi_nue)
		ldt_fecha_comi_nue		= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if

if gl_proceso = 4 then
	cb_resumen_comi.visible			= true
	cb_grabar.visible					= false
	cb_actualiza.visible				= false
	cb_exportar.visible				= false
elseif gl_proceso = 5 then
	cb_resumen_comi.visible			= true
	cb_grabar.visible					= true
	cb_actualiza.visible				= true
	cb_ordenar.visible				= true
	cb_exportar.visible				= true
	//w_comision_ejecutivo_terreno_asig.height		= 2296
elseif gl_proceso = 0 then
	dw_comision.dataobject			= 'dw_comision_asignada_pagada_ind'
	dw_comision.settransobject(sqlca)
	dw_ejecutivo.dataobject			= 'dwe_ejecutivo'
	dw_ejecutivo.settransobject(sqlca)
	dw_ejecutivo.getchild('ejecutivo',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.setitem(1,'ejecutivo',	gs_user)
	dw_ejecutivo.accepttext()
	dw_ejecutivo.Object.ejecutivo.Protect=1
	dw_ejecutivo.visible				= true
	cb_imprimir.enabled				= true
	cb_resumen_comi.visible			= false
	cb_grabar.visible					= false
	cb_actualiza.visible				= false
	cb_exportar.visible				= false
else
	messagebox("Advertencia"," Usuario No Autorizado")
	close(w_comision_ejecutivo_terreno_asig)
end if
end event

type cb_exportar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 1079
integer y = 2120
integer width = 329
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_comision
if dw_comision.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_actualiza from commandbutton within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 398
integer y = 2120
integer width = 329
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;string	ls_serie,ls_cod_ejecutivo,ls_estado_comi
long		ll_contrato
datetime	ldt_fecha_term

ldt_fecha_term		= datetime(date(em_termino.text),time('00:00:00'))

DECLARE x1 CURSOR FOR 		
SELECT	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."CODIGO_COM"
FROM		"RES_COMI"  
WHERE		( "RES_COMI"."FECHA" = :ldt_fecha_term ) AND  
			( "RES_COMI"."CODIGO_COM" = 'P' OR "RES_COMI"."CODIGO_COM" = 'S' ) AND
			( "RES_COMI"."COD_AGE_SUP" LIKE 'ET%' ) AND
			(	"RES_COMI"."COD_CONTABLE" = '007' OR  "RES_COMI"."COD_CONTABLE" = '069' OR "RES_COMI"."COD_CONTABLE" = '071' OR "RES_COMI"."COD_CONTABLE" = '073')
USING		sqlca ;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 INTO		:ls_serie,	:ll_contrato,	:ls_cod_ejecutivo,	:ls_estado_comi;
		if not isnull(ls_cod_ejecutivo) then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_COMI_AT" = :ls_estado_comi  
			WHERE		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :ll_contrato )
			USING		Trans_1 ;
			if Trans_1.sqlcode = 0 then
				commit using Trans_1;
			else
				rollback using Trans_1;
			end if
		end if
		setnull(ls_cod_ejecutivo)
	LOOP
end if
close x1;
end event

type cb_ordenar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 1646
integer y = 1940
integer width = 251
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_comision.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_comision.SETSORT(NULO)
	dw_comision.SORT()
end if
end event

type hpb_1 from hprogressbar within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 1088
integer y = 1060
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 2226
integer y = 92
integer width = 1499
integer height = 100
integer taborder = 20
string title = "none"
string dataobject = "dwe_ejecutivo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_comision.reset()

end event

type em_ctto from editmask within w_comision_ejecutivo_terreno_asig_bk
integer x = 2967
integer y = 1936
integer width = 343
integer height = 88
integer taborder = 90
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

event modified;if long(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 3314
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_numero,ll_tot_reg,ll_fila
string	ls_string

ll_numero						= long(em_ctto.text)
ll_tot_reg						= dw_comision.rowcount()
st_promesa.text = 'Buscar Nº Promesa'
if dw_comision.dataobject='dw_comision_asignada_pagada' and dw_comision.rowcount() > 0 then
	ls_string				= "oferta_v_nro_oferta = "+string(ll_numero)
elseif dw_comision.dataobject='dw_comision_asignada_pagada_ind' and dw_comision.rowcount() > 0 then
	ls_string				= "oferta_v_nro_oferta = "+string(ll_numero)
elseif dw_comision.dataobject='dwe_lista_comi_ag_at' and dw_comision.rowcount() > 0 then
	ls_string				= "numero = "+string(ll_numero)
end if
if ll_numero>0 and ll_tot_reg>0 then
	ll_fila 					= dw_comision.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_comision.scrolltorow(ll_fila)
		dw_comision.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_comision.scrolltorow(1)
	end if
end if
end event

type st_promesa from statictext within w_comision_ejecutivo_terreno_asig_bk
integer x = 2501
integer y = 1952
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_pagos from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 859
integer y = 1940
integer width = 357
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pagos &Ventas"
end type

event clicked;string	ls_base,ls_serie,ls_string
long	ldb_numero

dw_comision.accepttext()
if dw_comision.dataobject='dw_comision_asignada_pagada' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
elseif dw_comision.dataobject='dw_comision_asignada_pagada_ind' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
elseif dw_comision.dataobject='dwe_lista_comi_ag_at' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'base')
	ls_serie				= dw_comision.getitemstring(il_row,'serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'numero')
end if
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
	ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
	if isvalid(w_rescomi_terreno) then close(w_rescomi_terreno)
	OpenWithParm (w_rescomi_terreno,ls_string)
end if
end event

type dw_por_ctto from datawindow within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 1545
integer y = 2128
integer width = 215
integer height = 88
integer taborder = 50
string title = "none"
string dataobject = "dw_comision_atencion_terreno_por_ctto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 2158
integer y = 1940
integer width = 251
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_comision.reset()

end event

type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 50
integer y = 1940
integer width = 425
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen Comis."
end type

event clicked;string	ls_string,ls_tipo_comi
long		ll_cta
datetime	ldt_fecha_comi

ldt_fecha_comi				= datetime(date(em_termino.text),time('00:00:00'))
ls_tipo_comi				= 'A'
SELECT	count("RES_COMI"."FECHA")  
INTO		:ll_cta  
FROM		"RES_COMI"  
WHERE		( "RES_COMI"."FECHA" = :ldt_fecha_comi ) AND  
			( "RES_COMI"."COD_CONTABLE" = '007' or "RES_COMI"."COD_CONTABLE" = '069' or "RES_COMI"."COD_CONTABLE" = '071' or "RES_COMI"."COD_CONTABLE" = '077')
USING		sqlca;
if not isnull(ll_cta) and ll_cta>0 then
	ls_string				= string(ldt_fecha_comi,'dd/mm/yyyy')+'~t'+ls_tipo_comi
	OpenWithParm(w_comision_resumen_at, ls_string)
else
	messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_comi,"dd/mm/yyyy"))
end if
end event

type usuario_t from statictext within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 3045
integer y = 24
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 3419
integer y = 24
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 480
integer y = 1940
integer width = 288
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string 	ls_cod_age_sup,ls_moneda,ls_haber,ls_estado_age,ls_cod_com,ls_serie,ls_cod_ejecutivo,ls_estado_comi,ls_cod_contab,&
			ls_cod_cont_069,ls_cod_cont_071,ls_cod_cont_076,ls_mes,ls_base
long 		ll_rut,ll_monto,contrato,total,ll_dia_comi,ll_mes_comi,ll_ano_comi,ll_mes_res_comi,ll_ano_res_comi,ll_malos,ll_cont,&
			ll_contrato,ll_cod_parque,ll_cta_pag_s,ll_indi,ll_tot_reg
datetime ldt_fecha,ldt_fecha_term,ldt_fecha_uf,ldt_fecha_res_comi
double 	ldb_porc_ing_caja, ldb_porc_venta,uf,ldb_precio,ldb_valor_uf

ldt_fecha_term		= datetime(date(em_termino.text),time('00:00:00'))
ll_dia_comi			= day(date(ldt_fecha_term))
ll_mes_comi			= month(date(ldt_fecha_term))
ll_ano_comi			= year(date(ldt_fecha_term))
ls_cod_cont_069	= '069'
ls_cod_cont_071	= '071'
ls_cod_cont_076	= '076'
ls_haber      		= 'H'
ls_estado_age 		= 'A'

if dw_comision.rowcount() > 0 then
	setpointer(HourGlass!)
	if ll_dia_comi <> 15 then
		messagebox("Advertencia","No Puede Ejecutar el Proceso de Comisiones con Fecha :"+string(ldt_fecha_term,"dd/mm/yyyy"))
	else
		SELECT	"FECHA_UF",	"VALOR_UF"  
		INTO		:ldt_fecha_uf,	:ldb_valor_uf  
		FROM		"TAB_UF"  
		WHERE		 "TAB_UF"."FECHA_UF" = :ldt_fecha_term
		USING		sqlca;
		if sqlca.sqlcode=100 then
			if isnull(ldt_fecha_uf) and isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
				messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_term,"dd/mm/yyyy"))
			end if
		else
			SELECT	MAX("FECHA")  
			INTO 		:ldt_fecha_res_comi	   
			FROM		"RES_COMI"  
			WHERE 	( "RES_COMI"."COD_CONTABLE" = '007' OR "RES_COMI"."COD_CONTABLE" = '069' OR "RES_COMI"."COD_CONTABLE" = '071' OR "RES_COMI"."COD_CONTABLE" = '076')
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_mes_res_comi	= month(date(ldt_fecha_res_comi))
				ll_ano_res_comi	= year(date(ldt_fecha_res_comi))
				if ll_mes_comi = ll_mes_res_comi and ll_ano_comi = ll_ano_res_comi then
					messagebox("Advertencia","Proceso Comisiones del :"+string(ldt_fecha_term,"dd/mm/yyyy")+" Ya fue Grabado")
				else
					if dw_comision.rowcount() > 0 then
						if messagebox(gs_app_name,'¿ Desea Grabar los Datos ?',Question!,YesNo! ) = 1 then
							ldt_fecha        = datetime(date(em_termino.text),time('00:00:00'))
							SELECT "TAB_UF"."VALOR_UF" 
							INTO 	:uf 
							FROM "TAB_UF" 
							WHERE "FECHA_UF" = :ldt_fecha ;
							ll_tot_reg					= dw_comision.rowcount()		
							for ll_indi = 1 to ll_tot_reg
								ls_cod_age_sup			= dw_comision.getitemstring(ll_indi,'cod_ag_at')
								ll_rut					= dw_comision.getitemnumber(ll_indi,'rut_ag_at')
								ll_monto					= dw_comision.getitemnumber(ll_indi,'ing_monto_caja')
								ll_cta_pag_s			= dw_comision.getitemnumber(ll_indi,'cta_pag_promesa')
								ll_contrato				= dw_comision.getitemnumber(ll_indi,'numero')
								ls_serie					= dw_comision.getitemstring(ll_indi,'serie')
								ls_base					= dw_comision.getitemstring(ll_indi,'base')
								ldb_porc_venta			= dw_comision.getitemnumber(ll_indi,'c_sum_porce_dev')
								ldb_precio				= dw_comision.getitemnumber(ll_indi,'precio')
								ll_total_pago			= dw_comision.getitemnumber(ll_indi,'c_total_pagar')
								ls_moneda				= dw_comision.getitemstring(ll_indi,'moneda')
								ll_cod_parque			= dw_comision.getitemnumber(ll_indi,'cod_parque')
								
								SELECT DISTINCT	"COD_PARQUE"  
								INTO 		:ll_cod_parque  
								FROM 		"CADENA"  
								WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_contrato )
								USING		sqlca;
								if sqlca.sqlcode = 0 then
									if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
										if ll_cod_parque = 102 then
											ls_cod_contab 		= ls_cod_cont_071
										elseif ll_cod_parque = 103 then
											ls_cod_contab 		= ls_cod_cont_076
										else
											ls_cod_contab 		= ls_cod_cont_069
										end if
									end if
								end if
								
								if ls_moneda = '2' then
									ldb_porc_ing_caja = round((( ll_monto / ldb_valor_uf ) * 100) / ldb_precio,4)
								else
									ldb_porc_ing_caja = ( ll_monto * 100) / ldb_precio
								end if
								if ll_cta_pag_s >= 12 then
									ls_cod_com 			= 'P'
									ls_mes				= string(12)
								else
									ls_cod_com 			= 'S'
									ls_mes				= string(ll_cta_pag_s)
								end if
								f_graba_res_comi(ls_cod_age_sup,ll_rut,ll_monto,ls_cod_contab,ls_mes,ldt_fecha,ll_contrato,ls_serie,ldb_porc_ing_caja,ldb_porc_venta,ldb_precio,ll_total_pago,ldb_valor_uf,ls_haber,ls_moneda,ls_cod_com,ls_estado_age,ls_base,ll_cod_parque,0,0)
							next
						end if
						dw_comision.reset()
					else
						messagebox(gs_app_name,'No existen datos para ser guardados.',information!)
					end if
				end if
			end if
		end if
	end if
	//cb_actualiza.triggerevent(clicked!)
	setpointer(Arrow!)
end if
end event

type cb_imprimir from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 1902
integer y = 1940
integer width = 251
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_comision.rowcount() > 0 then f_Print( dw_comision )
end event

type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 1221
integer y = 1940
integer width = 421
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;string	ls_base,ls_serie
long		ll_cd_estado_promesa,ll_numero

dw_comision.accepttext()
if il_row>0 then
	if dw_comision.dataobject='dw_comision_asignada_pagada' and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut				= dw_comision.getitemnumber(il_row,'cadena_rut')
	elseif dw_comision.dataobject='dw_comision_asignada_pagada_ind' and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut				= dw_comision.getitemnumber(il_row,'cadena_rut')
	elseif dw_comision.dataobject='dwe_lista_comi_ag_at' and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'base')
		gs_serie				= dw_comision.getitemstring(il_row,'serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'numero')
		gi_rut				= dw_comision.getitemnumber(il_row,'rut')
	end if
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

type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 1243
integer y = 64
integer width = 137
integer height = 116
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Datetime	ldt_fecha_ini, ldt_fecha_fin,ldt_fecha_res_comi,ldt_fecha_uf
String	ls_base,ls_serie,ls_cod_at,ls_nombre_at,ls_moneda,ls_ejecutivo
Long		ll_numero,ll_cta_pagada,ll_tot_reg,ll_indi,ll_item,ll_new,ll_monto_caja,ll_rut_at,&
			ll_cta_pag_ctto,ll_plazo,ll_cod_parque,ll_tot_lista,ll_rut
Double	ldb_porce_1,ldb_porce_2,ldb_porce_3,ldb_porce_4,ldb_porce_5,ldb_porce_6,ldb_porce_7,&
			ldb_porce_8,ldb_porce_9,ldb_porce_10,ldb_porce_11,ldb_porce_12,ldb_precio,ldb_valor_uf,&
			ldb_tot_porc,ldb_tot_porc_aux

SetPointer(HourGlass!)
dw_comision.reset()
ldt_fecha_ini										= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin										= datetime(date(em_termino.text),time('00:00:00'))

SELECT	"FECHA_UF",		"VALOR_UF"  
INTO		:ldt_fecha_uf,	:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_fin
USING		sqlca;
if sqlca.sqlcode=100 then
	if isnull(ldt_fecha_uf) and isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
	end if
else
	SELECT DISTINCT "FECHA"  
	INTO 		:ldt_fecha_res_comi	   
	FROM		"RES_COMI"  
	WHERE 	( "RES_COMI"."COD_CONTABLE" = '007' OR "RES_COMI"."COD_CONTABLE" = '069'OR "RES_COMI"."COD_CONTABLE" = '071' OR "RES_COMI"."COD_CONTABLE" = '073') AND  
				( "RES_COMI"."FECHA" = :ldt_fecha_fin )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_res_comi) then
			if gl_proceso >= 4 then
				dw_comision.dataobject						= 'dw_comision_asignada_pagada'
				cb_grabar.enabled								= false
				cb_imprimir.enabled							= true
				dw_comision.settransobject(sqlca)
				ll_tot_reg										= dw_comision.retrieve(ldt_fecha_fin)
				dw_comision.object.usuario.text			= gs_user
				if ll_tot_reg = 0 then
					messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
				end if
			elseif gl_proceso = 0 then
				ls_ejecutivo									= dw_ejecutivo.getitemstring(1,'ejecutivo')
				if not isnull(ls_ejecutivo) and ls_ejecutivo <>'' then
					dw_comision.dataobject					= 'dw_comision_asignada_pagada_ind'
					cb_grabar.enabled							= false
					cb_imprimir.enabled						= true
					dw_comision.settransobject(sqlca)
					ll_tot_reg									= dw_comision.retrieve(ldt_fecha_fin,ls_ejecutivo)
					dw_comision.object.usuario.text		= gs_user
					if ll_tot_reg = 0 then
						messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
					end if
				else
					if isnull(ls_ejecutivo) or ls_ejecutivo='' then
						messagebox("Advertencia", "Debe Ingresar Ejecutivo Terreno")
						dw_ejecutivo.setfocus()
					end if
				end if
			end if
		end if
	else
		SetPointer(HourGlass!)
		if gl_proceso >= 4 then
			dw_comision.dataobject							= 'dwe_lista_comi_ag_at'
			dw_comision.object.usuario.text				= gs_user
			cb_grabar.enabled									= true
			cb_imprimir.enabled								= false
			dw_comision.settransobject(sqlca)
			st_fondo.visible				= true
			hpb_1.visible 					= true
			st_porc.visible 				= true
			ldb_tot_porc					= 0
			ldb_tot_porc_aux				= 0			
			hpb_1.Position					= ldb_tot_porc
			
			SELECT DISTINCT COUNT("AT_GESTION"."BASE")
			INTO		:ll_tot_lista	
			FROM 		"INGRESO",	"OFERTA_V",	"AT_GESTION",	"CADENA",	"PAGO_OFERTA"  
			WHERE  ( "OFERTA_V"."SERIE" = "AT_GESTION"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "AT_GESTION"."NUMERO" ) and  
					 ( "INGRESO"."BASE" = "AT_GESTION"."BASE" ) and  
					 ( "INGRESO"."SERIE" = "AT_GESTION"."SERIE" ) and  
					 ( "INGRESO"."CONTRATO" = "AT_GESTION"."NUMERO" ) and  
					 ( "AT_GESTION"."BASE" = "CADENA"."CODIGO" ) and  
					 ( "AT_GESTION"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "AT_GESTION"."NUMERO" = "CADENA"."NUMERO" ) and  
					 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 (("INGRESO"."FECHA_PAGO" >= :ldt_fecha_ini ) AND  
					 ( "INGRESO"."FECHA_PAGO" <= :ldt_fecha_fin ) AND
					 ( "OFERTA_V"."ESTADO_COMI_AT" = 'N' OR "OFERTA_V"."ESTADO_COMI_AT" = 'S') AND  
					 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
					 ( "INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0') AND  
					 ( "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'E') AND  
						"PAGO_OFERTA"."NRO_CUOTAS" >= 24 )   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				if not isnull(ll_tot_lista) then
				end if
			end if
			DECLARE x1 CURSOR FOR  
			SELECT DISTINCT "AT_GESTION"."BASE",	"AT_GESTION"."SERIE",	"AT_GESTION"."NUMERO",	"CADENA"."RUT"
			FROM 		"INGRESO",	"OFERTA_V",	"AT_GESTION",	"CADENA",	"PAGO_OFERTA"  
			WHERE  ( "OFERTA_V"."SERIE" = "AT_GESTION"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "AT_GESTION"."NUMERO" ) and  
					 ( "INGRESO"."BASE" = "AT_GESTION"."BASE" ) and  
					 ( "INGRESO"."SERIE" = "AT_GESTION"."SERIE" ) and  
					 ( "INGRESO"."CONTRATO" = "AT_GESTION"."NUMERO" ) and  
					 ( "AT_GESTION"."BASE" = "CADENA"."CODIGO" ) and  
					 ( "AT_GESTION"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "AT_GESTION"."NUMERO" = "CADENA"."NUMERO" ) and  
					 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 (("INGRESO"."FECHA_PAGO" >= :ldt_fecha_ini ) AND  
					 ( "INGRESO"."FECHA_PAGO" <= :ldt_fecha_fin ) AND  
					// ( "OFERTA_V"."NRO_OFERTA" = 127263 ) AND 				//prueb
					 ( "OFERTA_V"."ESTADO_COMI_AT" = 'N' OR "OFERTA_V"."ESTADO_COMI_AT" = 'S') AND  
					 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
					 ( "INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0') AND  
					 ( "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'E') AND  
						"PAGO_OFERTA"."NRO_CUOTAS" >= 24 )   
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ls_base, :ls_serie, :ll_numero,	:ll_rut;
					if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 and ll_rut>0 then
						ll_cta_pagada 		= f_return_cta_pag_at( ls_serie , ll_numero )
						dw_por_ctto.SETfilter('')
						dw_por_ctto.filter()
						dw_por_ctto.reset()
						if dw_por_ctto.retrieve(ldt_fecha_ini,ldt_fecha_fin,ls_serie,ll_numero,ll_cta_pagada)>0 then
							wf_cargar_resto(ldt_fecha_ini,ldt_fecha_fin,ls_serie,ll_numero)
							dw_por_ctto.SETfilter('c_item <= 12')
							dw_por_ctto.filter()
							ll_tot_reg					= dw_por_ctto.rowcount()
							if ll_tot_reg>0 then
								ll_monto_caja			= dw_por_ctto.getitemnumber(1,'c_sum_total')
								ls_cod_at				= dw_por_ctto.getitemstring(1,'at_gestion_usuario_asignado')
								ls_nombre_at			= dw_por_ctto.getitemstring(1,'encargados_nombre')
								ll_rut_at				= dw_por_ctto.getitemnumber(1,'encargados_rut')
								ll_cta_pag_ctto		= dw_por_ctto.getitemnumber(1,'oferta_v_cta_pag_s')
								ll_plazo					= dw_por_ctto.getitemnumber(1,'pago_oferta_nro_cuotas')
								ldb_porce_1				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_uno')
								ldb_porce_2				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_dos')
								ldb_porce_3				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_tres')
								ldb_porce_4				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_cuatro')
								ldb_porce_5				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_cinco')
								ldb_porce_6				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_seis')
								ldb_porce_7				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_siete')
								ldb_porce_8				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_ocho')
								ldb_porce_9				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_nueve')
								ldb_porce_10			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_dies')
								ldb_porce_11			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_once')
								ldb_porce_12			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_doce')
								ls_moneda				= dw_por_ctto.getitemstring(1,'pago_oferta_moneda')
								ldb_precio				= dw_por_ctto.getitemnumber(1,'pago_oferta_precio')
								ll_cod_parque			= dw_por_ctto.getitemnumber(1,'cadena_cod_parque')
								ll_new					= dw_comision.insertrow(0)
								dw_comision.scrolltorow(ll_new)
								dw_comision.setitem(ll_new,'fecha_inicial', ldt_fecha_ini)
								dw_comision.setitem(ll_new,'fecha_final', ldt_fecha_fin)
								dw_comision.setitem(ll_new,'porce_1', ldb_porce_1)
								dw_comision.setitem(ll_new,'porce_2', ldb_porce_2)
								dw_comision.setitem(ll_new,'porce_3', ldb_porce_3)
								dw_comision.setitem(ll_new,'porce_4', ldb_porce_4)
								dw_comision.setitem(ll_new,'porce_5', ldb_porce_5)
								dw_comision.setitem(ll_new,'porce_6', ldb_porce_6)
								dw_comision.setitem(ll_new,'porce_7', ldb_porce_7)
								dw_comision.setitem(ll_new,'porce_8', ldb_porce_8)
								dw_comision.setitem(ll_new,'porce_9', ldb_porce_9)
								dw_comision.setitem(ll_new,'porce_10',ldb_porce_10)
								dw_comision.setitem(ll_new,'porce_11',ldb_porce_11)
								dw_comision.setitem(ll_new,'porce_12',ldb_porce_12)
								dw_comision.setitem(ll_new,'cta_1',0)
								dw_comision.setitem(ll_new,'cta_2',0)
								dw_comision.setitem(ll_new,'cta_3',0)
								dw_comision.setitem(ll_new,'cta_4',0)
								dw_comision.setitem(ll_new,'cta_5',0)
								dw_comision.setitem(ll_new,'cta_6',0)
								dw_comision.setitem(ll_new,'cta_7',0)
								dw_comision.setitem(ll_new,'cta_8',0)
								dw_comision.setitem(ll_new,'cta_9',0)
								dw_comision.setitem(ll_new,'cta_10',0)
								dw_comision.setitem(ll_new,'cta_11',0)
								dw_comision.setitem(ll_new,'cta_12',0)
								dw_comision.setitem(ll_new,'nombre_ag_at',ls_nombre_at)
								dw_comision.setitem(ll_new,'cod_ag_at',ls_cod_at)
								dw_comision.setitem(ll_new,'base',ls_base)
								dw_comision.setitem(ll_new,'serie',ls_serie)
								dw_comision.setitem(ll_new,'numero',ll_numero)
								dw_comision.setitem(ll_new,'ing_monto_caja',ll_monto_caja)
								dw_comision.setitem(ll_new,'rut_ag_at',ll_rut_at)
								dw_comision.setitem(ll_new,'plazo',ll_plazo)
								dw_comision.setitem(ll_new,'cta_pag_caja',ll_tot_reg)
								dw_comision.setitem(ll_new,'cta_pag_promesa',ll_cta_pag_ctto)
								dw_comision.setitem(ll_new,'moneda',ls_moneda)
								dw_comision.setitem(ll_new,'precio',ldb_precio)
								dw_comision.setitem(ll_new,'cod_parque',ll_cod_parque)
								dw_comision.setitem(ll_new,'rut',ll_rut)
								for ll_indi=1 to ll_tot_reg
									ll_item				= dw_por_ctto.getitemnumber(ll_indi,'c_item')
									if ll_item=1 then
										dw_comision.setitem(ll_new,'cta_1',1)
									elseif ll_item=2 then
										dw_comision.setitem(ll_new,'cta_2',1)
									elseif ll_item=3 then
										dw_comision.setitem(ll_new,'cta_3',1)
									elseif ll_item=4 then
										dw_comision.setitem(ll_new,'cta_4',1)
									elseif ll_item=5 then
										dw_comision.setitem(ll_new,'cta_5',1)
									elseif ll_item=6 then
										dw_comision.setitem(ll_new,'cta_6',1)
									elseif ll_item=7 then
										dw_comision.setitem(ll_new,'cta_7',1)
									elseif ll_item=8 then
										dw_comision.setitem(ll_new,'cta_8',1)
									elseif ll_item=9 then
										dw_comision.setitem(ll_new,'cta_9',1)
									elseif ll_item=10 then
										dw_comision.setitem(ll_new,'cta_10',1)
									elseif ll_item=11 then
										dw_comision.setitem(ll_new,'cta_11',1)
									elseif ll_item=12 then
										dw_comision.setitem(ll_new,'cta_12',1)
									end if
								next
							end if
						else
							wf_cargar_resto(ldt_fecha_ini,ldt_fecha_fin,ls_serie,ll_numero)
							dw_por_ctto.SETfilter('c_item <= 12')
							dw_por_ctto.filter()
							ll_tot_reg					= dw_por_ctto.rowcount()
							if ll_tot_reg>0 then
								ll_monto_caja			= dw_por_ctto.getitemnumber(1,'c_sum_total')
								ls_cod_at				= dw_por_ctto.getitemstring(1,'at_gestion_usuario_asignado')
								ls_nombre_at			= dw_por_ctto.getitemstring(1,'encargados_nombre')
								ll_rut_at				= dw_por_ctto.getitemnumber(1,'encargados_rut')
								ll_cta_pag_ctto		= dw_por_ctto.getitemnumber(1,'oferta_v_cta_pag_s')
								ll_plazo					= dw_por_ctto.getitemnumber(1,'pago_oferta_nro_cuotas')
								ldb_porce_1				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_uno')
								ldb_porce_2				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_dos')
								ldb_porce_3				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_tres')
								ldb_porce_4				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_cuatro')
								ldb_porce_5				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_cinco')
								ldb_porce_6				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_seis')
								ldb_porce_7				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_siete')
								ldb_porce_8				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_ocho')
								ldb_porce_9				= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_nueve')
								ldb_porce_10			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_dies')
								ldb_porce_11			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_once')
								ldb_porce_12			= dw_por_ctto.getitemnumber(1,'comision_atencion_terreno_doce')
								ls_moneda				= dw_por_ctto.getitemstring(1,'pago_oferta_moneda')
								ldb_precio				= dw_por_ctto.getitemnumber(1,'pago_oferta_precio')
								ll_cod_parque			= dw_por_ctto.getitemnumber(1,'cadena_cod_parque')
								ll_new					= dw_comision.insertrow(0)
								dw_comision.scrolltorow(ll_new)
								dw_comision.setitem(ll_new,'fecha_inicial', ldt_fecha_ini)
								dw_comision.setitem(ll_new,'fecha_final', ldt_fecha_fin)
								dw_comision.setitem(ll_new,'porce_1', ldb_porce_1)
								dw_comision.setitem(ll_new,'porce_2', ldb_porce_2)
								dw_comision.setitem(ll_new,'porce_3', ldb_porce_3)
								dw_comision.setitem(ll_new,'porce_4', ldb_porce_4)
								dw_comision.setitem(ll_new,'porce_5', ldb_porce_5)
								dw_comision.setitem(ll_new,'porce_6', ldb_porce_6)
								dw_comision.setitem(ll_new,'porce_7', ldb_porce_7)
								dw_comision.setitem(ll_new,'porce_8', ldb_porce_8)
								dw_comision.setitem(ll_new,'porce_9', ldb_porce_9)
								dw_comision.setitem(ll_new,'porce_10',ldb_porce_10)
								dw_comision.setitem(ll_new,'porce_11',ldb_porce_11)
								dw_comision.setitem(ll_new,'porce_12',ldb_porce_12)
								dw_comision.setitem(ll_new,'cta_1',0)
								dw_comision.setitem(ll_new,'cta_2',0)
								dw_comision.setitem(ll_new,'cta_3',0)
								dw_comision.setitem(ll_new,'cta_4',0)
								dw_comision.setitem(ll_new,'cta_5',0)
								dw_comision.setitem(ll_new,'cta_6',0)
								dw_comision.setitem(ll_new,'cta_7',0)
								dw_comision.setitem(ll_new,'cta_8',0)
								dw_comision.setitem(ll_new,'cta_9',0)
								dw_comision.setitem(ll_new,'cta_10',0)
								dw_comision.setitem(ll_new,'cta_11',0)
								dw_comision.setitem(ll_new,'cta_12',0)
								dw_comision.setitem(ll_new,'nombre_ag_at',ls_nombre_at)
								dw_comision.setitem(ll_new,'cod_ag_at',ls_cod_at)
								dw_comision.setitem(ll_new,'base',ls_base)
								dw_comision.setitem(ll_new,'serie',ls_serie)
								dw_comision.setitem(ll_new,'numero',ll_numero)
								dw_comision.setitem(ll_new,'ing_monto_caja',ll_monto_caja)
								dw_comision.setitem(ll_new,'rut_ag_at',ll_rut_at)
								dw_comision.setitem(ll_new,'plazo',ll_plazo)
								dw_comision.setitem(ll_new,'cta_pag_caja',ll_tot_reg)
								dw_comision.setitem(ll_new,'cta_pag_promesa',ll_cta_pag_ctto)
								dw_comision.setitem(ll_new,'moneda',ls_moneda)
								dw_comision.setitem(ll_new,'precio',ldb_precio)
								dw_comision.setitem(ll_new,'cod_parque',ll_cod_parque)
								dw_comision.setitem(ll_new,'rut',ll_rut)
								for ll_indi=1 to ll_tot_reg
									ll_item				= dw_por_ctto.getitemnumber(ll_indi,'c_item')
									if ll_item=1 then
										dw_comision.setitem(ll_new,'cta_1',1)
									elseif ll_item=2 then
										dw_comision.setitem(ll_new,'cta_2',1)
									elseif ll_item=3 then
										dw_comision.setitem(ll_new,'cta_3',1)
									elseif ll_item=4 then
										dw_comision.setitem(ll_new,'cta_4',1)
									elseif ll_item=5 then
										dw_comision.setitem(ll_new,'cta_5',1)
									elseif ll_item=6 then
										dw_comision.setitem(ll_new,'cta_6',1)
									elseif ll_item=7 then
										dw_comision.setitem(ll_new,'cta_7',1)
									elseif ll_item=8 then
										dw_comision.setitem(ll_new,'cta_8',1)
									elseif ll_item=9 then
										dw_comision.setitem(ll_new,'cta_9',1)
									elseif ll_item=10 then
										dw_comision.setitem(ll_new,'cta_10',1)
									elseif ll_item=11 then
										dw_comision.setitem(ll_new,'cta_11',1)
									elseif ll_item=12 then
										dw_comision.setitem(ll_new,'cta_12',1)
									end if
								next
							end if
						end if
					end if
					Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text		= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux	= ldb_tot_porc
					end if
					ldb_tot_porc			= (ll_new / ll_tot_lista) * 100
					hpb_1.Position 		= ldb_tot_porc
					dw_comision.accepttext()
				LOOP
			end if
			close x1;
			st_fondo.visible			= false
			hpb_1.visible 				= false
			st_porc.visible 			= false
			dw_comision.SORT()
			SetPointer(Arrow!)
		else
			messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
		end if
	end if
end if
end event

type p_termino from picture within w_comision_ejecutivo_terreno_asig_bk
integer x = 1111
integer y = 76
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,ls_fecha_comi_ini
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ini,ll_ano_comi_ini
datetime	ldt_fecha_comi,ldt_fecha_comi_ini

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_comision.reset()


ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano_comi					= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	
	if ll_mes_comi = 1 then
		ll_mes_comi_ini 		= ll_mes_comi + 11
		ll_ano_comi_ini 		= ll_ano_comi - 1
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ini 		= ll_mes_comi - 1
		ll_ano_comi_ini 		= ll_ano_comi
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if
end event

type st_desde from statictext within w_comision_ejecutivo_terreno_asig_bk
integer x = 73
integer y = 92
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_comision_ejecutivo_terreno_asig_bk
integer x = 786
integer y = 80
integer width = 320
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
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;string	ls_fecha_comi_ini
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ini,ll_ano_comi_ini
datetime	ldt_fecha_comi,ldt_fecha_comi_ini

dw_comision.reset()

ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano_comi					= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	
	if ll_mes_comi = 1 then
		ll_mes_comi_ini 		= ll_mes_comi + 11
		ll_ano_comi_ini 		= ll_ano_comi - 1
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ini 		= ll_mes_comi - 1
		ll_ano_comi_ini 		= ll_ano_comi
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if

end event

type em_inicio from editmask within w_comision_ejecutivo_terreno_asig_bk
integer x = 265
integer y = 80
integer width = 320
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_comision_ejecutivo_terreno_asig_bk
integer x = 617
integer y = 88
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno_asig_bk
integer x = 3433
integer y = 1940
integer width = 283
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_ejecutivo_terreno_asig)
end event

type gb_periodo from groupbox within w_comision_ejecutivo_terreno_asig_bk
integer x = 41
integer y = 12
integer width = 1179
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

type st_porc from statictext within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 1664
integer y = 988
integer width = 233
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_comision_ejecutivo_terreno_asig_bk
boolean visible = false
integer x = 1056
integer y = 944
integer width = 1440
integer height = 204
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

type dw_comision from datawindow within w_comision_ejecutivo_terreno_asig_bk
integer x = 50
integer y = 204
integer width = 3662
integer height = 1688
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_asignada_pagada_ind"
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

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_comision_ejecutivo_terreno_asig_bk
integer x = 832
integer y = 1888
integer width = 1605
integer height = 164
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

