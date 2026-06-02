forward
global type w_calculo_u_fecha from window
end type
type st_salir from statictext within w_calculo_u_fecha
end type
type pb_salir from picturebutton within w_calculo_u_fecha
end type
type tab_1 from tab within w_calculo_u_fecha
end type
type tabpage_1 from userobject within tab_1
end type
type st_porc from statictext within tabpage_1
end type
type hpb_1 from hprogressbar within tabpage_1
end type
type dw_lista from datawindow within tabpage_1
end type
type pb_aceptar from picturebutton within tabpage_1
end type
type p_4 from picture within tabpage_1
end type
type em_fec_fin from editmask within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type p_3 from picture within tabpage_1
end type
type em_fec_ini from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type st_fondo from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_porc st_porc
hpb_1 hpb_1
dw_lista dw_lista
pb_aceptar pb_aceptar
p_4 p_4
em_fec_fin em_fec_fin
st_4 st_4
p_3 p_3
em_fec_ini em_fec_ini
st_2 st_2
st_1 st_1
st_fondo st_fondo
end type
type tab_1 from tab within w_calculo_u_fecha
tabpage_1 tabpage_1
end type
end forward

global type w_calculo_u_fecha from window
integer width = 2971
integer height = 1844
boolean titlebar = true
string title = "Premios Semanales"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_salir st_salir
pb_salir pb_salir
tab_1 tab_1
end type
global w_calculo_u_fecha w_calculo_u_fecha

type variables
Long	il_monto
end variables

forward prototypes
public subroutine wf_grabar ()
public subroutine wf_insertar_contrato_premio (string as_serie, long al_numero, string as_forma, string as_uso, date ad_fecha_cierre, long al_tope, long al_porcentaje, long al_codigo_premio, long al_cod_parque)
public subroutine wf_insertar_registro (string as_base, string as_serie, long al_numero, string as_forma_pago, string as_uso, date ad_fecha_cierre, long al_monto, long al_porcentaje, long al_codigo_premio, long al_cod_parque)
public function double wf_porce_ni (long al_folio, double adb_precio, double adb_uf, string as_moneda, string as_uso, string as_base, string as_serie, long al_numero, long al_monto)
end prototypes

public subroutine wf_grabar ();//			ls_premio_dos    = dw_lista_semanal.getitemstring(ll_new,'premio_dos')
//			ls_premio_tres   = dw_lista_semanal.getitemstring(ll_new,'premio_tres')
//			ls_premio_cuatro = dw_lista_semanal.getitemstring(ll_new,'premio_cuatro')
//			ls_premio_cinco  = dw_lista_semanal.getitemstring(ll_new,'premio_cinco')
//			ls_premio_seis   = dw_lista_semanal.getitemstring(ll_new,'premio_seis')
//			ls_premio_siete   = dw_lista_semanal.getitemstring(ll_new,'premio_siete')
//			ls_premio_ocho   = dw_lista_semanal.getitemstring(ll_new,'premio_ocho')
//			ll_sum_dos       = dw_lista_semanal.getitemnumber(ll_new,'sum_dos')
//			ll_sum_tres      = dw_lista_semanal.getitemnumber(ll_new,'sum_tres')
//			ll_sum_cuatro    = dw_lista_semanal.getitemnumber(ll_new,'sum_cuatro')
//			ll_sum_cinco     = dw_lista_semanal.getitemnumber(ll_new,'sum_cinco')
//			ll_sum_seis      = dw_lista_semanal.getitemnumber(ll_new,'sum_seis')
//			ll_sum_siete     = dw_lista_semanal.getitemnumber(ll_new,'sum_siete')
//			ll_sum_ocho      = dw_lista_semanal.getitemnumber(ll_new,'sum_ocho')
//			if ll_cod_parque=1 or ll_cod_parque=102 then //SANTIAGO
//				if ls_uso = 'NF' then
////					if premio_dos = 'X' then// >=10% Y < 15% NF
////						SELECT	"PREMIOS_POR_CAJA"."REPARTIR",	"PREMIOS_POR_CAJA"."TOPE",	"PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,								:tope,							:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 2 and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;				
////						forma = '2';porcentaje = 10;codigo_premio = 2
////						if sum_dos > 0 and ((tope * sum_dos ) > repartir) then tope = repartir/sum_dos//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_tres = 'X' then// >= 15% Y < 99% NF
////						SELECT	"PREMIOS_POR_CAJA"."REPARTIR",	"PREMIOS_POR_CAJA"."TOPE",	"PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,								:tope,							:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 3 and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;				
////						forma = '2';porcentaje = 15;codigo_premio = 3
////						if sum_tres > 0 and ((tope * sum_tres ) > repartir) then tope = repartir/sum_tres//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_cuatro = 'X' then// Contado s/d NF
////						SELECT	"PREMIOS_POR_CAJA"."REPARTIR",	"PREMIOS_POR_CAJA"."TOPE",	"PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,								:tope,							:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 4 and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '1';porcentaje = 100;codigo_premio = 4
////						if sum_cuatro > 0 and ((tope * sum_cuatro ) > repartir) then tope = repartir/sum_cuatro//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_cinco = 'X' then// Contado c/d NF
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR",	"PREMIOS_POR_CAJA"."TOPE",	"PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,								:tope,							:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 5  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '3';porcentaje = 100;codigo_premio = 5
////						if sum_cinco > 0 and ((tope * sum_cinco ) > repartir) then tope = repartir/sum_cinco//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
//				else
////					if premio_seis = 'X' then// 15% NI
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 6  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 15;codigo_premio = 6
////						if sum_seis > 0 and ((tope * sum_seis ) > repartir) then tope = repartir/sum_seis//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_siete = 'X' then// Contado s/d NI
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 7   and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque ;
////						forma = '1';porcentaje = 100;codigo_premio = 7
////						if sum_siete > 0 and ((tope * sum_siete ) > repartir) then tope = repartir/sum_siete//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_ocho = 'X' then// Contado c/d NI
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 8   and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque ;
////						forma = '3';porcentaje = 100;codigo_premio = 8
////						if sum_ocho > 0 and ((tope * sum_ocho ) > repartir) then tope = repartir/sum_ocho//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
//				end if
//			elseif ll_cod_parque=11 then //SERENA
////				premio_nueve  = dw_1.getitemstring(i,'premio_nueve')
////				premio_dies   = dw_1.getitemstring(i,'premio_dies')
////				sum_nueve     = dw_1.getitemnumber(i,'sum_nueve')
////				sum_dies      = dw_1.getitemnumber(i,'sum_dies')
//				if ls_uso = 'NF' then
////					if premio_dos  = 'X' then// 10% - 15% NF
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 2  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 10;codigo_premio = 2
////						if sum_dos > 0 and ((tope * sum_dos ) > repartir) then tope = repartir/sum_dos//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_tres = 'X' then// 15% - 95% NF
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 3  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 15;codigo_premio = 3
////						if sum_tres > 0 and ((tope * sum_tres ) > repartir) then tope = repartir/sum_tres//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_cuatro = 'X' then//Contado s/d NF
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 4  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 4
////						if sum_cuatro > 0 and ((tope * sum_cuatro ) > repartir) then tope = repartir/sum_cuatro//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_cinco = 'X' then//Contado c/d NF
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 5  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 5
////						if sum_cinco > 0 and ((tope * sum_cinco ) > repartir) then tope = repartir/sum_cinco//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
//				else
////					if premio_seis = 'X' then// 15% - 17.99% NI
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 6  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 6
////						if sum_seis > 0 and ((tope * sum_seis ) > repartir) then tope = repartir/sum_seis//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_siete = 'X' then// 18% - 19.99% NI
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 7   and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque ;
////						forma = '2';porcentaje = 5;codigo_premio = 7
////						if sum_siete > 0 and ((tope * sum_siete ) > repartir) then tope = repartir/sum_siete//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_ocho = 'X' then// 20% NI
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 8  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 8
////						if sum_ocho > 0 and ((tope * sum_ocho ) > repartir) then tope = repartir/sum_ocho//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_nueve = 'X' then//Contado s/d NI
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 9  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 9
////						if sum_nueve > 0 and ((tope * sum_nueve ) > repartir) then tope = repartir/sum_nueve//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if
////					if premio_dies = 'X' then//Contado c/d NI
////						tope = 0
////						SELECT 	"PREMIOS_POR_CAJA"."REPARTIR","PREMIOS_POR_CAJA"."TOPE","PREMIOS_POR_CAJA"."REDUCE_D"  
////						INTO 		:repartir,:tope,:reduce  
////						FROM 		"PREMIOS_POR_CAJA"  
////						WHERE 	"PREMIOS_POR_CAJA"."CODIGO" = 10  and "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque  ;
////						forma = '2';porcentaje = 5;codigo_premio = 10
////						if sum_dies > 0 and ((tope * sum_dies ) > repartir) then tope = repartir/sum_dies//***************************
////						if clas_age = 'D' or vsp > 1 then tope = tope * reduce
////						wf_inserta_promesa_premio(serie,nro_oferta,forma,uso,fecha_cierre,tope,porcentaje,codigo_premio,ll_cod_parque)
////					end if	
//				end if
//			end if		
end subroutine

public subroutine wf_insertar_contrato_premio (string as_serie, long al_numero, string as_forma, string as_uso, date ad_fecha_cierre, long al_tope, long al_porcentaje, long al_codigo_premio, long al_cod_parque);//INSERT INTO	"PROMESA_PREMIO"  
//		 	(  "BASE",	"SERIE",		"NUMERO"   ,"FORMA",		"USO",	"FECHA"      ,		"MONTO",		"PORCENTAJE",		"COD_PREMIO",			"PARQUE"   )  
//VALUES 	(  'O'   ,	:as_serie ,:al_numero,	:as_forma ,	:as_uso ,:ad_fecha_cierre,	:al_tope,	:al_porcentaje ,	:al_codigo_premio,	:al_cod_parque )  
//USING		sqlca;
//if sqlca.sqlcode = 0 then
//	commit;
//	UPDATE	"OFERTA_V"  
//	SET 		"ESTADO_PREMIO" = 'S',   
//				"CIERRE_VENTA_SEMANAL" = :ad_fecha_cierre  
//	WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
//			 ( "OFERTA_V"."NRO_OFERTA" = :al_numero )   
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//		commit;
//	else
//		MessageBox("SQL error OFERTA_V", SQLCA.SQLErrText,information!)
//		rollback;
//	end if
//else
//	rollback;
//end if
end subroutine

public subroutine wf_insertar_registro (string as_base, string as_serie, long al_numero, string as_forma_pago, string as_uso, date ad_fecha_cierre, long al_monto, long al_porcentaje, long al_codigo_premio, long al_cod_parque);//INSERT INTO "PROMESA_PREMIO"  
//		 ( "BASE",	"SERIE",		"NUMERO",	"FORMA",				"USO",	"FECHA",				"MONTO",		"PORCENTAJE",		"COD_PREMIO",			"PARQUE"   )  
//VALUES ( :as_base,:as_serie ,	:al_numero,	:as_forma_pago,	:as_uso,	:ad_fecha_cierre,	:al_monto,	:al_porcentaje,	:al_codigo_premio,	:al_cod_parque )  
//USING		sqlca;
//if sqlca.sqlcode = 0 then
//	commit;
//else
//	rollback;
//end if
end subroutine

public function double wf_porce_ni (long al_folio, double adb_precio, double adb_uf, string as_moneda, string as_uso, string as_base, string as_serie, long al_numero, long al_monto);DATETIME FECHA_VENC
date     FECHA_PAGO
LONG     DIAS,MONTO1,MONTO2,count1,count2
DOUBLE   PORCENTAJE
integer  suma_dia,a
string   dia

setnull(MONTO1);setnull(MONTO2);setnull(al_monto)
FECHA_PAGO		= date(w_premios_semanales.tab_1.tabpage_3.em_fec_sem_fin.text)

if as_uso = 'NI' then
	SELECT 	(T1.MONTO_1 + T2.MONTO_2) as monto_efectiv_pag 
	INTO 		:MONTO1
	FROM (
	SELECT  sum("INGRESO"."MONTO") AS MONTO_1
	FROM        "INGRESO"  
	WHERE      ( "INGRESO"."SERIE"    = :as_serie ) and 
				  ( "INGRESO"."CONTRATO" = :al_numero) and 
				  ( "INGRESO"."FOLIO"    = :al_folio ) and 
				  ( "INGRESO"."TIPO_COB" = 'CS' OR  "INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0')  and 
				  ("INGRESO"."TIPO_MOV" ='A' or "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'Q' or "INGRESO"."TIPO_MOV" = 'K' ) GROUP BY "INGRESO"."FOLIO" ) T1  ,
	( 
	SELECT   decode(count(1),0,0,sum("DOCUMENTOS"."MONTO"))  * -1  AS MONTO_2
	FROM     "DOCUMENTOS"  
	WHERE   ("DOCUMENTOS"."FOLIO"     = :al_folio ) and 
			  ("DOCUMENTOS"."TIPO_COB"  = 'CS' OR "DOCUMENTOS"."TIPO_COB"  = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'CC' OR "DOCUMENTOS"."TIPO_COB"  = 'CI' OR "DOCUMENTOS"."TIPO_COB"  = 'C0') and 
			  ("DOCUMENTOS"."ESTADO_CH" <> 'C' ) ) T2;
			  
	SELECT SUM("DOCUMENTOS"."MONTO") AS MONTO2  into :MONTO2
	 FROM      "DOCUMENTOS","INGRESO"  
		WHERE ( "DOCUMENTOS"."FOLIO"         = "INGRESO"."FOLIO" ) and  
				( "DOCUMENTOS"."TIPO_COB"      = "INGRESO"."TIPO_COB" ) and  
				( "DOCUMENTOS"."FECHA_PAGO"    = "INGRESO"."FECHA_PAGO" ) and  
				( "DOCUMENTOS"."FECHA_VENC"   <= :FECHA_PAGO ) AND  
				( "DOCUMENTOS"."ESTADO_CH"     = 'C' ) AND  
				( "INGRESO"."SERIE"            = :as_serie ) AND  
				( "INGRESO"."CONTRATO"         = :al_numero ) AND  
				( "DOCUMENTOS"."FOLIO"        <> :al_folio ) AND  
				( "INGRESO"."TIPO_COB"         = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0') AND  
				( "INGRESO"."TIPO_MOV"         = 'A'  OR "INGRESO"."TIPO_MOV" = 'E');    

	if isnull(MONTO1) then MONTO1 = 0
	if isnull(MONTO2) then MONTO2 = 0
	al_monto		= MONTO1 + MONTO2
else
	SELECT (T1.MONTO_1 + T2.MONTO_2) as monto_efectiv_pag INTO :MONTO1
	FROM (
	SELECT  sum("INGRESO"."MONTO") AS MONTO_1
	FROM        "INGRESO"  
	WHERE      ( "INGRESO"."SERIE"    = :as_serie ) and 
				  ( "INGRESO"."CONTRATO" = :al_numero) and 
				  ( "INGRESO"."FOLIO"    = :al_folio ) and 
				  ( "INGRESO"."TIPO_COB" = 'CS' OR  "INGRESO"."TIPO_COB" = 'CI' OR  "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0' )  and 
				  ("INGRESO"."TIPO_MOV" ='A' or "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'Q' or "INGRESO"."TIPO_MOV" = 'K' ) GROUP BY "INGRESO"."FOLIO" ) T1  ,
	( 
	SELECT   decode(count(1),0,0,sum("DOCUMENTOS"."MONTO"))  * -1  AS MONTO_2
	FROM     "DOCUMENTOS"  
	WHERE   ("DOCUMENTOS"."FOLIO"     = :al_folio ) and 
			  ("DOCUMENTOS"."TIPO_COB"  = 'CS' OR "DOCUMENTOS"."TIPO_COB"  = 'CU'  OR "DOCUMENTOS"."TIPO_COB" = 'CC' OR "DOCUMENTOS"."TIPO_COB"  = 'CI' OR "DOCUMENTOS"."TIPO_COB"  = 'C0') and 
			  ("DOCUMENTOS"."ESTADO_CH" <> 'C' ) ) T2;
			  
	SELECT SUM("DOCUMENTOS"."MONTO") AS MONTO2  into :MONTO2
	 FROM      "DOCUMENTOS","INGRESO"  
		WHERE ( "DOCUMENTOS"."FOLIO"         = "INGRESO"."FOLIO" ) and  
				( "DOCUMENTOS"."TIPO_COB"      = "INGRESO"."TIPO_COB" ) and  
				( "DOCUMENTOS"."FECHA_PAGO"    = "INGRESO"."FECHA_PAGO" ) and  
				( "DOCUMENTOS"."FECHA_VENC"   <= :FECHA_PAGO ) AND  
				( "DOCUMENTOS"."ESTADO_CH"     = 'C' ) AND  
				( "INGRESO"."SERIE"            = :as_serie ) AND  
				( "INGRESO"."CONTRATO"         = :al_numero ) AND  
				( "DOCUMENTOS"."FOLIO"        <> :al_folio ) AND  
				( "INGRESO"."TIPO_COB"         = 'CI' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC' OR "INGRESO"."TIPO_COB" = 'C0') AND  
				( "INGRESO"."TIPO_MOV"         = 'A'  OR "INGRESO"."TIPO_MOV" = 'E');    
				

	if isnull(MONTO1) then MONTO1 = 0
	if isnull(MONTO2) then MONTO2 = 0
	al_monto		= MONTO1 + MONTO2
end if
IF as_moneda = '2' THEN
	PORCENTAJE	= ( ( al_monto / adb_uf ) * 100 ) / adb_precio
ELSE
	PORCENTAJE	= ( al_monto * 100 ) / adb_precio
END IF
il_monto			= al_monto
RETURN PORCENTAJE
end function

on w_calculo_u_fecha.create
this.st_salir=create st_salir
this.pb_salir=create pb_salir
this.tab_1=create tab_1
this.Control[]={this.st_salir,&
this.pb_salir,&
this.tab_1}
end on

on w_calculo_u_fecha.destroy
destroy(this.st_salir)
destroy(this.pb_salir)
destroy(this.tab_1)
end on

event open;Datetime	ld_fec_ini,ld_fec_fin
Date		ld_fec_prox

gf_centrar(w_premios_semanales)
st_salir.visible								= false
tab_1.tabpage_1.dw_lista.settransobject(sqlca)
tab_1.tabpage_1.em_fec_ini.text			= string(RelativeDate(today(), -150),"dd/mm/yyyy")
tab_1.tabpage_1.em_fec_fin.text			= string(today(),"dd/mm/yyyy")

SELECT	"CIERRE_VENTA_SEMANALES"."FECHA_INICIAL",
			"CIERRE_VENTA_SEMANALES"."FECHA_FINAL"
INTO 		:ld_fec_ini,
			:ld_fec_fin
FROM 		"CIERRE_VENTA_SEMANALES"  
WHERE  ( "CIERRE_VENTA_SEMANALES"."FECHA_FINAL" = (	SELECT MAX("CIERRE_VENTA_SEMANALES"."FECHA_FINAL") 
																		FROM 		  "CIERRE_VENTA_SEMANALES" 
																		WHERE      "CIERRE_VENTA_SEMANALES"."COD_CONTABLE" = '045' ) ) AND  
		 ( "CIERRE_VENTA_SEMANALES"."COD_CONTABLE" = '045' )   ;
this.title										= 'Ultimo Proceso Premios Semanales del:  '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
ld_fec_prox										= RelativeDate(date(ld_fec_fin), 1)
ld_fec_prox										= RelativeDate(date(ld_fec_fin), 7)

end event

event mousemove;st_salir.visible									= false
end event

type st_salir from statictext within w_calculo_u_fecha
event ue_mnousemove pbm_mousemove
boolean visible = false
integer x = 2752
integer y = 1500
integer width = 155
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Salir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mnousemove;st_salir.visible							= false
end event

type pb_salir from picturebutton within w_calculo_u_fecha
event ue_mousemove pbm_mousemove
integer x = 2743
integer y = 1568
integer width = 174
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_salir.visible							= true
end event

event clicked;close(w_calculo_u_fecha)
end event

type tab_1 from tab within w_calculo_u_fecha
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 40
integer width = 2880
integer height = 1484
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

event ue_mousemove;st_salir.visible									= false
end event

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 108
integer width = 2843
integer height = 1360
long backcolor = 67108864
string text = "  U_Fecha"
long tabtextcolor = 33554432
string picturename = "u_fecha.bmp"
long picturemaskcolor = 536870912
st_porc st_porc
hpb_1 hpb_1
dw_lista dw_lista
pb_aceptar pb_aceptar
p_4 p_4
em_fec_fin em_fec_fin
st_4 st_4
p_3 p_3
em_fec_ini em_fec_ini
st_2 st_2
st_1 st_1
st_fondo st_fondo
end type

on tabpage_1.create
this.st_porc=create st_porc
this.hpb_1=create hpb_1
this.dw_lista=create dw_lista
this.pb_aceptar=create pb_aceptar
this.p_4=create p_4
this.em_fec_fin=create em_fec_fin
this.st_4=create st_4
this.p_3=create p_3
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.st_1=create st_1
this.st_fondo=create st_fondo
this.Control[]={this.st_porc,&
this.hpb_1,&
this.dw_lista,&
this.pb_aceptar,&
this.p_4,&
this.em_fec_fin,&
this.st_4,&
this.p_3,&
this.em_fec_ini,&
this.st_2,&
this.st_1,&
this.st_fondo}
end on

on tabpage_1.destroy
destroy(this.st_porc)
destroy(this.hpb_1)
destroy(this.dw_lista)
destroy(this.pb_aceptar)
destroy(this.p_4)
destroy(this.em_fec_fin)
destroy(this.st_4)
destroy(this.p_3)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_fondo)
end on

type st_porc from statictext within tabpage_1
integer x = 1056
integer y = 1036
integer width = 599
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within tabpage_1
integer x = 370
integer y = 1140
integer width = 1970
integer height = 76
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type dw_lista from datawindow within tabpage_1
boolean visible = false
integer x = 142
integer y = 364
integer width = 411
integer height = 432
integer taborder = 90
string title = "none"
string dataobject = "dw_resultado_ingreso_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within tabpage_1
integer x = 2034
integer y = 728
integer width = 169
integer height = 148
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Datetime	ld_fecha_ini,ld_fecha_fin,ldt_fecha_ingre,ldt_fecha,ldt_fec_pago,ldt_fec_servipag
Long		ll_tot_reg,ll_indi,ll_numero,ll_folio,ll_tot_porc,ll_tot_porc_aux
String	ls_serie,ls_base,ls_t_cob,ls_t_mov
Date		ld_fecha_pago_1

SetPointer(HourGlass!)
ld_fecha_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fecha_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_fec_ini.setfocus()
else
	ll_tot_reg					= dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin)
	if ll_tot_reg>0 then
		st_fondo.visible		= true
		hpb_1.visible 			= true
		st_porc.visible 		= true
		ll_tot_porc				= 0
		ll_tot_porc_aux		= 0			
		hpb_1.Position			= ll_tot_porc
		for ll_indi=1 to ll_tot_reg
			ls_serie				= dw_lista.getitemstring(ll_indi,'ingreso_serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'ingreso_contrato')
			ls_base				= dw_lista.getitemstring(ll_indi,'ingreso_base')
			ls_t_cob				= dw_lista.getitemstring(ll_indi,'ingreso_tipo_cob')
			ls_t_mov				= dw_lista.getitemstring(ll_indi,'ingreso_tipo_mov')		
			ldt_fecha_ingre   = dw_lista.getitemdatetime(ll_indi,'oferta_v_fecha_ingreso')
			ldt_fecha         = f_busca_inicio(ls_serie,ll_numero,ls_base,ls_t_cob,ls_t_mov)
			if ldt_fecha >= ld_fecha_ini and ldt_fecha <= ld_fecha_fin then
				SELECT	"INGRESO"."FOLIO",	"INGRESO"."FECHA_PAGO",	"INGRESO"."SERVIPAG"  
				INTO		:ll_folio,				:ldt_fec_pago,				:ldt_fec_servipag
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero ) AND  
						 ( "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' )   
				ORDER BY "INGRESO"."FECHA_PAGO" ASC,	"INGRESO"."TIPO_MOV" ASC   
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					if ldt_fec_servipag <= ldt_fecha_ingre then
						ld_fecha_pago_1  = date(ldt_fecha_ingre)
					elseif ldt_fec_servipag > ldt_fecha_ingre then
						ld_fecha_pago_1  = date(ldt_fec_servipag)
					end if
					if ls_base = 'L' then
//						UPDATE	"ANEXO_LIBERADOR"  
//						SET 		"U_FOLIO" = :ll_folio,   
//									"U_FECHA" = :ld_fecha_pago_1  
//						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
//								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ) 
//						USING		sqlca;
//						if sqlca.sqlcode <> 0 then
//							ROLLBACK;
//						else
//							COMMIT;		
//						end if
					elseif ls_base = 'O' then
//						UPDATE	"OFERTA_V"  
//						SET 		"U_FOLIO" = :ll_folio,   
//									"U_FECHA" = :ld_fecha_pago_1  
//						WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
//								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) 
//						USING		sqlca;
//						if sqlca.sqlcode <> 0 then
//							ROLLBACK;
//						else
//							COMMIT;		
//						end if
					elseif ls_base = 'A' then
		//					UPDATE	"ANEXO_AUMENTO"  
		//					SET 		"U_FOLIO" = :ll_folio,   
		//					    		"U_FECHA_SEM" = :ld_fecha_pago_1 
		//					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
		//							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero ) 	
	//						USING		sqlca;
		//					if sqlca.sqlcode <> 0 then
		//						ROLLBACK;
		//					else
		//						COMMIT;		
		//					end if
					end if
				end if
			end if
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text		= string(ll_tot_porc)+" %"
				ll_tot_porc_aux	= ll_tot_porc
			end if
			ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 		= ll_tot_porc
			dw_lista.accepttext()
		next
		st_fondo.visible			= false
		hpb_1.visible 				= false
		st_porc.visible 			= false
	end if
end if 
SetPointer(Arrow!)
end event

type p_4 from picture within tabpage_1
integer x = 1614
integer y = 744
integer width = 91
integer height = 116
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha

if trim(em_fec_fin.text)='00/00/0000' or trim(em_fec_fin.text)='' or &
	isnull(trim(em_fec_fin.text)) then	
	
	em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if trim(em_fec_fin.text)<>'00/00/0000' and not isnull(trim(em_fec_fin.text)) and &
	trim(em_fec_fin.text)<>'' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_fec_fin.text 		= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin.text 		= Message.StringParm
tab_1.tabpage_1.em_fec_ini.text	= string(RelativeDate(date(em_fec_fin.text), -150),"dd/mm/yyyy")


end event

type em_fec_fin from editmask within tabpage_1
integer x = 960
integer y = 744
integer width = 640
integer height = 120
integer taborder = 80
integer textsize = -16
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
end type

event modified;dw_lista.reset()
end event

type st_4 from statictext within tabpage_1
integer x = 411
integer y = 616
integer width = 1856
integer height = 120
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fecha final del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_3 from picture within tabpage_1
integer x = 1614
integer y = 332
integer width = 91
integer height = 116
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text	= string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	ls_fecha 			= em_fec_ini.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_fec_ini.text 		= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text 	= Message.StringParm
end event

type em_fec_ini from editmask within tabpage_1
integer x = 960
integer y = 332
integer width = 640
integer height = 120
integer taborder = 70
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within tabpage_1
integer x = 411
integer y = 204
integer width = 1856
integer height = 120
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fecha inicio del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 37
integer y = 48
integer width = 2734
integer height = 136
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman TUR"
boolean underline = true
long backcolor = 80269524
string text = "Actualización de Contratos - Fecha Primer Pago ( U_FECHA )"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from groupbox within tabpage_1
integer x = 325
integer y = 984
integer width = 2071
integer height = 276
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

