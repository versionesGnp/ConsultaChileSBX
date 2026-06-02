forward
global type w_detalle_titulo_de_dominio from window
end type
type cb_filtrar from commandbutton within w_detalle_titulo_de_dominio
end type
type cb_exportar from commandbutton within w_detalle_titulo_de_dominio
end type
type cb_ordenar from commandbutton within w_detalle_titulo_de_dominio
end type
type cb_print from commandbutton within w_detalle_titulo_de_dominio
end type
type cb_cerrar from commandbutton within w_detalle_titulo_de_dominio
end type
type dw_detalle from datawindow within w_detalle_titulo_de_dominio
end type
end forward

global type w_detalle_titulo_de_dominio from window
integer width = 3310
integer height = 1384
boolean titlebar = true
string title = "Detalle Titulo de Dominio"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_print cb_print
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_titulo_de_dominio w_detalle_titulo_de_dominio

type variables
long	il_row
end variables

forward prototypes
public subroutine wf_cargar_lista_benef ()
end prototypes

public subroutine wf_cargar_lista_benef ();Long		ll_rut_titular,ll_rut_benef,ll_est_opera,ll_est_infor,ll_new,ll_corr,ll_count,ll_parque_capacidad
Double	ll_numero
datetime	ldt_fecha_titulo,ldt_fecha
string		ls_base, ls_serie,ls_estado_titulo,ls_dv_titular,ls_nombre,ls_a_paterno,ls_a_materno,ls_direccion_p,ls_poblacion,ls_sector, &
			ls_comuna,ls_ciudad,ls_fono_p,ls_parque_sepultura,ls_parque_sector,ls_parque_area,&
			ls_parque_n_reduccion,ls_tipo_sepult,ls_nombre_benef,ls_a_paterno_benef, &
			ls_a_materno_benef,ls_estado_reg,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
SetPointer(HourGlass!)
connect using Trans_1;
dw_detalle.reset()
DECLARE x1 CURSOR FOR  
SELECT	"CADENA"."CODIGO",   
			"CADENA"."SERIE",   
			"CADENA"."NUMERO",   
			"CADENA"."ESTADO_TITULO",   
			"CADENA"."FECHA_TITULO",   
			"OFERTA_V"."FECHA",   
			"CLIENTE"."RUT",   
			"CLIENTE"."DV",   
			"CLIENTE"."NOMBRE",   
			"CLIENTE"."A_PATERNO",   
			"CLIENTE"."A_MATERNO",   
			"CLIENTE"."TIPO_VIA",   
			"CLIENTE"."DIRECCION_P",   
			"CLIENTE"."NUMERO_PARTICULAR",   
			"CLIENTE"."DEPTO_PARTICULAR",   
			"CLIENTE"."BLOCK_PARTICULAR",   
			"CLIENTE"."POBLACION",   
			"CLIENTE"."SECTOR",   
			"CLIENTE"."COMUNA",   
			"CLIENTE"."CIUDAD",   
			"CLIENTE"."FONO_P",   
			"PAGO_OFERTA"."SEPULTURA",   
			"PAGO_OFERTA"."SECTOR",   
			"PAGO_OFERTA"."AREA",   
			"PAGO_OFERTA"."CAPACIDAD",   
			"PAGO_OFERTA"."N_REDUCCION",   
			"OFERTA_V"."TIPO_SEPULT",   
			"SOL_ESTATUS"."ESTADO_REG",   
			"SOL_TIT_DOMINIO"."ESTATUS_OPERACIONES",   
			"SOL_TIT_DOMINIO"."ESTATUS_INFORMATICA",
			"SOL_TIT_DOMINIO"."CORRELATIVO"
FROM 		"CADENA",   
			"CLIENTE",   
			"OFERTA_V",   
			"PAGO_OFERTA",   
			"SOL_ESTATUS",   
			"SOL_TIT_DOMINIO"  
WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
		 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
		 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
		 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
		 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
		 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
		 ( "PAGO_OFERTA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
		 ( "PAGO_OFERTA"."NRO_OFERTA" = "SOL_ESTATUS"."NUMERO" ) and  
		 ( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
		 ( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
		 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
		 ( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
		 ( "SOL_ESTATUS"."ESTADO_REG" = 'A') and
		 (("CADENA"."CODIGO" = 'O' ) )   
ORDER BY "CLIENTE"."RUT", "CADENA"."NUMERO" ASC
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_base,:ls_serie,:ll_numero,:ls_estado_titulo,:ldt_fecha_titulo,:ldt_fecha,:ll_rut_titular,:ls_dv_titular,:ls_nombre,:ls_a_paterno,:ls_a_materno,:ls_tipo_via,:ls_direccion_p,:ls_nro_part,:ls_depto_part,:ls_block_part,:ls_poblacion,:ls_sector,:ls_comuna,:ls_ciudad,:ls_fono_p,:ls_parque_sepultura,:ls_parque_sector,:ls_parque_area,:ll_parque_capacidad,:ls_parque_n_reduccion,:ls_tipo_sepult,:ls_estado_reg,:ll_est_opera,:ll_est_infor,:ll_corr;	
	if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) and not isnull(ls_estado_titulo) and not isnull(ls_nombre) and not isnull(ls_a_paterno) then
		ll_new	= dw_detalle.insertrow(0)
		dw_detalle.scrolltorow(ll_new)
		dw_detalle.setitem(ll_new,'base',ls_base)
		dw_detalle.setitem(ll_new,'serie',ls_serie)
		dw_detalle.setitem(ll_new,'numero',ll_numero)
		dw_detalle.setitem(ll_new,'estado_titulo',ls_estado_titulo)
		dw_detalle.setitem(ll_new,'fecha_titulo',ldt_fecha_titulo)
		dw_detalle.setitem(ll_new,'fecha',ldt_fecha)
		dw_detalle.setitem(ll_new,'rut_titular',ll_rut_titular)
		dw_detalle.setitem(ll_new,'dv_titular',ls_dv_titular)
		dw_detalle.setitem(ll_new,'nombre_titular',ls_nombre)
		dw_detalle.setitem(ll_new,'ap_pat_titular',ls_a_paterno)
		dw_detalle.setitem(ll_new,'ap_mat_titular',ls_a_materno)
		dw_detalle.setitem(ll_new,'tipo_via',ls_tipo_via)
		dw_detalle.setitem(ll_new,'direccion',ls_direccion_p)
		dw_detalle.setitem(ll_new,'numero_particular',ls_nro_part)
		dw_detalle.setitem(ll_new,'depto_particular',ls_depto_part)
		dw_detalle.setitem(ll_new,'block_particular',ls_block_part)
		dw_detalle.setitem(ll_new,'poblacion',ls_poblacion)
		dw_detalle.setitem(ll_new,'sector',ls_sector)
		dw_detalle.setitem(ll_new,'comuna',ls_comuna)
		dw_detalle.setitem(ll_new,'ciudad',ls_ciudad)
		dw_detalle.setitem(ll_new,'fono_particular',ls_fono_p)
		dw_detalle.setitem(ll_new,'parque_sepultura',ls_parque_sepultura)
		dw_detalle.setitem(ll_new,'parque_sector',ls_parque_sector)
		dw_detalle.setitem(ll_new,'parque_area',ls_parque_area)
		dw_detalle.setitem(ll_new,'parque_capacidad',ll_parque_capacidad)
		dw_detalle.setitem(ll_new,'parque_nro_reduccion',ls_parque_n_reduccion)
		dw_detalle.setitem(ll_new,'tipo_sepultura',ls_tipo_sepult)
		dw_detalle.setitem(ll_new,'sol_correlativo',ll_corr)
		dw_detalle.setitem(ll_new,'sol_estado',ls_estado_reg)
		dw_detalle.setitem(ll_new,'sol_estatus_opera',ll_est_opera)
		dw_detalle.setitem(ll_new,'sol_estatus_infor',ll_est_infor)
		ll_count	= 0
		DECLARE x2 CURSOR FOR  
		SELECT	"CO_PROP"."RUT",   
					"CO_PROP"."NOMBRE",   
					"CO_PROP"."A_PATERNO",   
					"CO_PROP"."A_MATERNO"
		FROM 		"CO_PROP"   
		WHERE  ( "CO_PROP"."SERIE" = :ls_serie) and  
				 ( "CO_PROP"."NRO_OFERTA" = :ll_numero ) 
		USING		trans_1 ;
		open x2;
		DO WHILE trans_1.sqlcode=0
			fetch x2 into :ll_rut_benef,:ls_nombre_benef,:ls_a_paterno_benef,:ls_a_materno_benef;	
			if not isnull(ll_rut_benef) and not isnull(ls_nombre_benef) and not isnull(ls_a_paterno_benef) then
				ll_count ++
				if ll_count>1 then
					ll_new	= dw_detalle.insertrow(0)
					dw_detalle.scrolltorow(ll_new)
					dw_detalle.setitem(ll_new,'base',ls_base)
					dw_detalle.setitem(ll_new,'serie',ls_serie)
					dw_detalle.setitem(ll_new,'numero',ll_numero)
					dw_detalle.setitem(ll_new,'estado_titulo',ls_estado_titulo)
					dw_detalle.setitem(ll_new,'fecha_titulo',ldt_fecha_titulo)
					dw_detalle.setitem(ll_new,'fecha',ldt_fecha)
					dw_detalle.setitem(ll_new,'rut_titular',ll_rut_titular)
					dw_detalle.setitem(ll_new,'dv_titular',ls_dv_titular)
					dw_detalle.setitem(ll_new,'nombre_titular',ls_nombre)
					dw_detalle.setitem(ll_new,'ap_pat_titular',ls_a_paterno)
					dw_detalle.setitem(ll_new,'ap_mat_titular',ls_a_materno)
					dw_detalle.setitem(ll_new,'tipo_via',ls_tipo_via)
					dw_detalle.setitem(ll_new,'direccion',ls_direccion_p)
					dw_detalle.setitem(ll_new,'numero_particular',ls_nro_part)
					dw_detalle.setitem(ll_new,'depto_particular',ls_depto_part)
					dw_detalle.setitem(ll_new,'block_particular',ls_block_part)
					dw_detalle.setitem(ll_new,'poblacion',ls_poblacion)
					dw_detalle.setitem(ll_new,'sector',ls_sector)
					dw_detalle.setitem(ll_new,'comuna',ls_comuna)
					dw_detalle.setitem(ll_new,'ciudad',ls_ciudad)
					dw_detalle.setitem(ll_new,'fono_particular',ls_fono_p)
					dw_detalle.setitem(ll_new,'parque_sepultura',ls_parque_sepultura)
					dw_detalle.setitem(ll_new,'parque_sector',ls_parque_sector)
					dw_detalle.setitem(ll_new,'parque_area',ls_parque_area)
					dw_detalle.setitem(ll_new,'parque_capacidad',ll_parque_capacidad)
					dw_detalle.setitem(ll_new,'parque_nro_reduccion',ls_parque_n_reduccion)
					dw_detalle.setitem(ll_new,'tipo_sepultura',ls_tipo_sepult)
					dw_detalle.setitem(ll_new,'sol_correlativo',ll_corr)
					dw_detalle.setitem(ll_new,'sol_estado',ls_estado_reg)
					dw_detalle.setitem(ll_new,'sol_estatus_opera',ll_est_opera)
					dw_detalle.setitem(ll_new,'sol_estatus_infor',ll_est_infor)
				end if
				dw_detalle.setitem(ll_new,'rut_beneficiario',ll_rut_benef)
				dw_detalle.setitem(ll_new,'nombre_beneficiario',ls_nombre_benef)
				dw_detalle.setitem(ll_new,'ap_pat_beneficiario',ls_a_paterno_benef)
				dw_detalle.setitem(ll_new,'ap_mat_beneficiario',ls_a_materno_benef)
			end if
			Setnull(ll_rut_benef);Setnull(ls_nombre_benef);Setnull(ls_a_paterno_benef);Setnull(ls_a_materno_benef)
		LOOP
		close x2;
	end if
	Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero);Setnull(ls_estado_titulo);Setnull(ldt_fecha_titulo);Setnull(ldt_fecha)
	Setnull(ll_rut_titular);Setnull(ls_dv_titular);Setnull(ls_nombre);Setnull(ls_a_paterno)
	Setnull(ls_a_materno);Setnull(ls_direccion_p);Setnull(ls_poblacion);Setnull(ls_sector)
	Setnull(ls_comuna);Setnull(ls_ciudad);Setnull(ls_fono_p);Setnull(ls_parque_sepultura)
	Setnull(ls_parque_sector);Setnull(ls_parque_area);Setnull(ll_parque_capacidad);Setnull(ls_parque_n_reduccion)
	Setnull(ls_tipo_sepult);Setnull(ls_estado_reg);Setnull(ll_est_opera);Setnull(ll_est_infor);Setnull(ll_corr)
LOOP
close x1;
ls_tipo_sepult	='1' //Tierra para Contrato IsaCruz
setnull(ls_parque_n_reduccion)
DECLARE x3 CURSOR FOR  
SELECT	"CADENA"."CODIGO",   
			"CADENA"."SERIE",   
			"CADENA"."NUMERO",   
			"CADENA"."ESTADO_TITULO",   
			"CADENA"."FECHA_TITULO",   
			"CONTRATO"."FECHA",   
			"CLIENTE"."RUT",   
			"CLIENTE"."DV",   
			"CLIENTE"."NOMBRE",   
			"CLIENTE"."A_PATERNO",   
			"CLIENTE"."A_MATERNO",   
			"CLIENTE"."TIPO_VIA",   
			"CLIENTE"."DIRECCION_P",   
			"CLIENTE"."NUMERO_PARTICULAR",   
			"CLIENTE"."DEPTO_PARTICULAR",   
			"CLIENTE"."BLOCK_PARTICULAR",      
			"CLIENTE"."POBLACION",   
			"CLIENTE"."SECTOR",   
			"CLIENTE"."COMUNA",   
			"CLIENTE"."CIUDAD",   
			"CLIENTE"."FONO_P",   
			"CONTRATO"."SEPULTURA",   
			"CONTRATO"."SECTOR",   
			"CONTRATO"."ZONA",   
			"CONTRATO"."CAPACIDAD",   
			"SOL_ESTATUS"."CORRELATIVO",   
			"SOL_ESTATUS"."ESTADO_REG",   
			"SOL_TIT_DOMINIO"."ESTATUS_OPERACIONES",   
			"SOL_TIT_DOMINIO"."ESTATUS_INFORMATICA"  
FROM 		"CADENA",   
			"CLIENTE",   
			"CONTRATO",   
			"SOL_ESTATUS",   
			"SOL_TIT_DOMINIO"  
WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
		 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
		 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
		 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
		 ( "CONTRATO"."SERIE_C" = "SOL_ESTATUS"."SERIE" ) and  
		 ( "CONTRATO"."NRO_CONTRATO" = "SOL_ESTATUS"."NUMERO" ) and  
		 ( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
		 ( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
		 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
		 (("CADENA"."CODIGO" = 'C' ) AND  
		 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
ORDER BY "CLIENTE"."RUT", "CADENA"."NUMERO" ASC
USING		sqlca;
open x3;
DO WHILE sqlca.sqlcode=0
	fetch x3 into :ls_base,:ls_serie,:ll_numero,:ls_estado_titulo,:ldt_fecha_titulo,:ldt_fecha,:ll_rut_titular,:ls_dv_titular,:ls_nombre,:ls_a_paterno,:ls_a_materno,:ls_tipo_via,:ls_direccion_p,:ls_nro_part,:ls_depto_part,:ls_block_part,:ls_poblacion,:ls_sector,:ls_comuna,:ls_ciudad,:ls_fono_p,:ls_parque_sepultura,:ls_parque_sector,:ls_parque_area,:ll_parque_capacidad,:ll_corr,:ls_estado_reg,:ll_est_opera,:ll_est_infor;
	if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) and not isnull(ls_estado_titulo) and not isnull(ls_nombre) and not isnull(ls_a_paterno) then
		ll_new	= dw_detalle.insertrow(0)
		dw_detalle.scrolltorow(ll_new)
		dw_detalle.setitem(ll_new,'base',ls_base)
		dw_detalle.setitem(ll_new,'serie',ls_serie)
		dw_detalle.setitem(ll_new,'numero',ll_numero)
		dw_detalle.setitem(ll_new,'estado_titulo',ls_estado_titulo)
		dw_detalle.setitem(ll_new,'fecha_titulo',ldt_fecha_titulo)
		dw_detalle.setitem(ll_new,'fecha',ldt_fecha)
		dw_detalle.setitem(ll_new,'rut_titular',ll_rut_titular)
		dw_detalle.setitem(ll_new,'dv_titular',ls_dv_titular)
		dw_detalle.setitem(ll_new,'nombre_titular',ls_nombre)
		dw_detalle.setitem(ll_new,'ap_pat_titular',ls_a_paterno)
		dw_detalle.setitem(ll_new,'ap_mat_titular',ls_a_materno)
		dw_detalle.setitem(ll_new,'tipo_via',ls_tipo_via)
		dw_detalle.setitem(ll_new,'direccion',ls_direccion_p)
		dw_detalle.setitem(ll_new,'numero_particular',ls_nro_part)
		dw_detalle.setitem(ll_new,'depto_particular',ls_depto_part)
		dw_detalle.setitem(ll_new,'block_particular',ls_block_part)
		dw_detalle.setitem(ll_new,'poblacion',ls_poblacion)
		dw_detalle.setitem(ll_new,'sector',ls_sector)
		dw_detalle.setitem(ll_new,'comuna',ls_comuna)
		dw_detalle.setitem(ll_new,'ciudad',ls_ciudad)
		dw_detalle.setitem(ll_new,'fono_particular',ls_fono_p)
		dw_detalle.setitem(ll_new,'parque_sepultura',ls_parque_sepultura)
		dw_detalle.setitem(ll_new,'parque_sector',ls_parque_sector)
		dw_detalle.setitem(ll_new,'parque_area',ls_parque_area)
		dw_detalle.setitem(ll_new,'parque_capacidad',ll_parque_capacidad)
		dw_detalle.setitem(ll_new,'parque_nro_reduccion',ls_parque_n_reduccion)
		dw_detalle.setitem(ll_new,'tipo_sepultura',ls_tipo_sepult)
		dw_detalle.setitem(ll_new,'sol_correlativo',ll_corr)
		dw_detalle.setitem(ll_new,'sol_estado',ls_estado_reg)
		dw_detalle.setitem(ll_new,'sol_estatus_opera',ll_est_opera)
		dw_detalle.setitem(ll_new,'sol_estatus_infor',ll_est_infor)
		ll_count	= 0
		DECLARE x4 CURSOR FOR  
		SELECT	"COPROP_ISACRUZ"."RUT",   
					"COPROP_ISACRUZ"."NOMBRES",   
					"COPROP_ISACRUZ"."APATERNO",   
					"COPROP_ISACRUZ"."AMATERNO"  
		FROM 		"COPROP_ISACRUZ"  
		WHERE  ( "COPROP_ISACRUZ"."SERIE" = :ls_serie ) AND  
				 ( "COPROP_ISACRUZ"."NUMERO" = :ll_numero )   
		USING		trans_1 ;
		open x4;
		DO WHILE trans_1.sqlcode=0
			fetch x4 into :ll_rut_benef,:ls_nombre_benef,:ls_a_paterno_benef,:ls_a_materno_benef;	
			if not isnull(ll_rut_benef) and not isnull(ls_nombre_benef) and not isnull(ls_a_paterno_benef) then
				ll_count ++
				if ll_count>1 then
					ll_new	= dw_detalle.insertrow(0)
					dw_detalle.scrolltorow(ll_new)
					dw_detalle.setitem(ll_new,'base',ls_base)
					dw_detalle.setitem(ll_new,'serie',ls_serie)
					dw_detalle.setitem(ll_new,'numero',ll_numero)
					dw_detalle.setitem(ll_new,'estado_titulo',ls_estado_titulo)
					dw_detalle.setitem(ll_new,'fecha_titulo',ldt_fecha_titulo)
					dw_detalle.setitem(ll_new,'fecha',ldt_fecha)
					dw_detalle.setitem(ll_new,'rut_titular',ll_rut_titular)
					dw_detalle.setitem(ll_new,'dv_titular',ls_dv_titular)
					dw_detalle.setitem(ll_new,'nombre_titular',ls_nombre)
					dw_detalle.setitem(ll_new,'ap_pat_titular',ls_a_paterno)
					dw_detalle.setitem(ll_new,'ap_mat_titular',ls_a_materno)
					dw_detalle.setitem(ll_new,'tipo_via',ls_tipo_via)
					dw_detalle.setitem(ll_new,'direccion',ls_direccion_p)
					dw_detalle.setitem(ll_new,'numero_particular',ls_nro_part)
					dw_detalle.setitem(ll_new,'depto_particular',ls_depto_part)
					dw_detalle.setitem(ll_new,'block_particular',ls_block_part)
					dw_detalle.setitem(ll_new,'poblacion',ls_poblacion)
					dw_detalle.setitem(ll_new,'sector',ls_sector)
					dw_detalle.setitem(ll_new,'comuna',ls_comuna)
					dw_detalle.setitem(ll_new,'ciudad',ls_ciudad)
					dw_detalle.setitem(ll_new,'fono_particular',ls_fono_p)
					dw_detalle.setitem(ll_new,'parque_sepultura',ls_parque_sepultura)
					dw_detalle.setitem(ll_new,'parque_sector',ls_parque_sector)
					dw_detalle.setitem(ll_new,'parque_area',ls_parque_area)
					dw_detalle.setitem(ll_new,'parque_capacidad',ll_parque_capacidad)
					dw_detalle.setitem(ll_new,'parque_nro_reduccion',ls_parque_n_reduccion)
					dw_detalle.setitem(ll_new,'tipo_sepultura',ls_tipo_sepult)
					dw_detalle.setitem(ll_new,'sol_correlativo',ll_corr)
					dw_detalle.setitem(ll_new,'sol_estado',ls_estado_reg)
					dw_detalle.setitem(ll_new,'sol_estatus_opera',ll_est_opera)
					dw_detalle.setitem(ll_new,'sol_estatus_infor',ll_est_infor)
				end if
				dw_detalle.setitem(ll_new,'rut_beneficiario',ll_rut_benef)
				dw_detalle.setitem(ll_new,'nombre_beneficiario',ls_nombre_benef)
				dw_detalle.setitem(ll_new,'ap_pat_beneficiario',ls_a_paterno_benef)
				dw_detalle.setitem(ll_new,'ap_mat_beneficiario',ls_a_materno_benef)
			end if
			Setnull(ll_rut_benef);Setnull(ls_nombre_benef);Setnull(ls_a_paterno_benef);Setnull(ls_a_materno_benef)
		LOOP
		close x4;
	end if
	Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero);Setnull(ls_estado_titulo);Setnull(ldt_fecha_titulo);Setnull(ldt_fecha)
	Setnull(ll_rut_titular);Setnull(ls_dv_titular);Setnull(ls_nombre);Setnull(ls_a_paterno)
	Setnull(ls_a_materno);Setnull(ls_direccion_p);Setnull(ls_poblacion);Setnull(ls_sector)
	Setnull(ls_comuna);Setnull(ls_ciudad);Setnull(ls_fono_p);Setnull(ls_parque_sepultura)
	Setnull(ls_parque_sector);Setnull(ls_parque_area);Setnull(ll_parque_capacidad)
	Setnull(ls_estado_reg);Setnull(ll_est_opera);Setnull(ll_est_infor);Setnull(ll_corr)
LOOP
close x3;
dw_detalle.accepttext()
disconnect using Trans_1;
dw_detalle.SORT()
SetPointer(Arrow!)
dw_detalle.scrolltorow(1)
end subroutine

on w_detalle_titulo_de_dominio.create
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_filtrar,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_print,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_titulo_de_dominio.destroy
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;gf_centrar(w_detalle_titulo_de_dominio)
dw_detalle.settransobject(sqlca)

wf_cargar_lista_benef() 


end event

type cb_filtrar from commandbutton within w_detalle_titulo_de_dominio
integer x = 942
integer y = 1116
integer width = 283
integer height = 100
integer taborder = 50
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

type cb_exportar from commandbutton within w_detalle_titulo_de_dominio
integer x = 658
integer y = 1116
integer width = 283
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_detalle_titulo_de_dominio
integer x = 375
integer y = 1116
integer width = 283
integer height = 100
integer taborder = 30
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

type cb_print from commandbutton within w_detalle_titulo_de_dominio
integer x = 37
integer y = 1116
integer width = 302
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_Print( dw_detalle )
end if
end event

type cb_cerrar from commandbutton within w_detalle_titulo_de_dominio
integer x = 2958
integer y = 1116
integer width = 302
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_titulo_de_dominio)
end event

type dw_detalle from datawindow within w_detalle_titulo_de_dominio
integer x = 37
integer y = 36
integer width = 3223
integer height = 1048
integer taborder = 10
string dataobject = "dwe_lista_titulo_de_dominio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

