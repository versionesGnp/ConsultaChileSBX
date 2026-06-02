forward
global type w_listado_contratos_por_todas_las_tablas from window
end type
type cb_ben_seg_fun from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_10 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_9 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_8 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type dw_print from datawindow within w_listado_contratos_por_todas_las_tablas
end type
type cb_imprimir from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type dw_2 from datawindow within w_listado_contratos_por_todas_las_tablas
end type
type dw_1 from datawindow within w_listado_contratos_por_todas_las_tablas
end type
type cb_7 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_6 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_3 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_2 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_1 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_mensajes from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_fallecidos from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_datos_repacta from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_beneficiarios from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_datos_clientes from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_datos_contrato from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_cerrar from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
type gb_1 from groupbox within w_listado_contratos_por_todas_las_tablas
end type
type dw_listado_rut from datawindow within w_listado_contratos_por_todas_las_tablas
end type
type cb_5 from commandbutton within w_listado_contratos_por_todas_las_tablas
end type
end forward

global type w_listado_contratos_por_todas_las_tablas from window
integer x = 462
integer y = 412
integer width = 3095
integer height = 1652
boolean titlebar = true
string title = "Resultado Consulta por Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 77571519
cb_ben_seg_fun cb_ben_seg_fun
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_print dw_print
cb_imprimir cb_imprimir
dw_2 dw_2
dw_1 dw_1
cb_7 cb_7
cb_6 cb_6
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_mensajes cb_mensajes
cb_fallecidos cb_fallecidos
cb_datos_repacta cb_datos_repacta
cb_beneficiarios cb_beneficiarios
cb_datos_clientes cb_datos_clientes
cb_datos_contrato cb_datos_contrato
cb_cerrar cb_cerrar
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
gb_1 gb_1
dw_listado_rut dw_listado_rut
cb_5 cb_5
end type
global w_listado_contratos_por_todas_las_tablas w_listado_contratos_por_todas_las_tablas

type variables
String		is_base,is_serie
Long		il_rut,il_cod_parque,il_row3
Double	il_numero
end variables

forward prototypes
public subroutine wf_cargar_datawindow (datawindow adw_muestra)
public subroutine wf_insertar_registro (string as_codigo, string as_serie, double al_numero, string as_estado, long al_rut, string as_dv, string as_nombre, string as_a_pat, string as_a_mat, long al_cod_parque)
end prototypes

public subroutine wf_cargar_datawindow (datawindow adw_muestra);string	ls_string, ls_codigo, ls_serie, ls_estado, ls_nombre, ls_a_pat,ls_anexo_dacion,&
			ls_a_mat, ls_dv, ls_serie_pag, ls_anexo_lib, ls_serie_aux, ls_liberador,ls_base_dac,&
			ls_serie_dac,ls_anexo_aumento,ls_base
Long		ll_rut,  ll_cod_parque,ll_fila
Double	ll_numero,ll_numero_dac,ll_numero_aux,ll_nro_pag

setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
setnull(ll_numero);setnull(ll_rut)
CHOOSE CASE is_base
	CASE 'O', 'U','M' //Base 'O' PROMESA
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// buscar ctto anexo dacion
		
		SELECT	"OFERTA_V"."ANEXO_DACION"  
		INTO 		:ls_anexo_dacion  
		FROM 		"CADENA",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_anexo_dacion) then
				ls_base_dac		= mid(ls_anexo_dacion,1,1)
				ls_serie_dac	= mid(ls_anexo_dacion,2,1)
				ll_numero_dac	= Double(mid(ls_anexo_dacion,3))
				if ls_base_dac='O' or ls_base_dac='U' then
					DECLARE x_dacion_o CURSOR FOR
					SELECT 	"CADENA"."CODIGO",   
								"CADENA"."COD_PARQUE",
								"OFERTA_V"."SERIE",   
								"OFERTA_V"."NRO_OFERTA",   
								"CADENA"."ESTADO"   
					FROM 		"OFERTA_V",   
								"PAGO_OFERTA",   
								"CADENA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
							 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
							 ( "CADENA"."CODIGO" = :ls_base_dac ) and 
							 ( "CADENA"."SERIE" = :ls_serie_dac ) and
							 ( "CADENA"."NUMERO" = :ll_numero_dac )
					Using 	sqlca;
					open x_dacion_o;
					do While sqlca.sqlcode = 0 
						fetch x_dacion_o into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
						if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
							SELECT 	"CADENA"."RUT"
							INTO 		:ll_rut
							FROM 		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
										( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
										( "CADENA"."NUMERO" = :ll_numero )   
							Using		Trans_1;
							if Trans_1.sqlcode = 0 then
								if ll_rut > 0 then
									SELECT 	"CLIENTE"."DV",   
												"CLIENTE"."NOMBRE",   
												"CLIENTE"."A_PATERNO",   
												"CLIENTE"."A_MATERNO"  
									INTO 		:ls_dv,   
												:ls_nombre,   
												:ls_a_pat,   
												:ls_a_mat  
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :ll_rut   
									Using		Trans_2;
									if Trans_2.sqlcode = 0 then
										wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
									end if
								end if
							end if
						end if
						setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
						setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
						setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
					loop
					close x_dacion_o;
					
				elseif ls_base_dac='C' then
					DECLARE x_dacion_c CURSOR FOR
					SELECT	"CADENA"."CODIGO",   
         					"CADENA"."COD_PARQUE",   
								"CONTRATO"."SERIE_C",   
								"CONTRATO"."NRO_CONTRATO",   
								"CADENA"."ESTADO"  
    				FROM 		"CADENA",   
         					"CONTRATO"  
   				WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							 (("CADENA"."CODIGO" = :ls_base_dac ) AND  
							 ( "CADENA"."SERIE" = :ls_serie_dac ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero_dac ) )  
					Using 	sqlca;
					open x_dacion_c;
					do While sqlca.sqlcode = 0 
						fetch x_dacion_c into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
						if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
							SELECT 	"CADENA"."RUT"
							INTO 		:ll_rut
							FROM 		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = 'C' ) AND  
										( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
										( "CADENA"."NUMERO" = :ll_numero )   
							Using		Trans_1;
							if Trans_1.sqlcode = 0 then
								if ll_rut > 0 then
									SELECT 	"CLIENTE"."DV",   
												"CLIENTE"."NOMBRE",   
												"CLIENTE"."A_PATERNO",   
												"CLIENTE"."A_MATERNO"  
									INTO 		:ls_dv,   
												:ls_nombre,   
												:ls_a_pat,   
												:ls_a_mat  
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :ll_rut   
									Using		Trans_2;
									if Trans_2.sqlcode = 0 then
										wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
									end if
								end if
							end if
						end if
						setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
						setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
						setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
					loop
					close x_dacion_c;
				end if
			end if
		end if
		// buscar Promesa de Anexo Dacion
		ls_string	= is_base+is_serie+trim(string(il_numero))
		DECLARE x_dacion CURSOR FOR
   		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"OFERTA_V"."SERIE",   
					"OFERTA_V"."NRO_OFERTA",   
					"CADENA"."ESTADO"   
    		FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
   		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = :is_base ) and 
				 (("OFERTA_V"."ANEXO_DACION" = trim(:ls_string) ) ) 
		Using 	sqlca;
		open x_dacion;
		do While sqlca.sqlcode = 0 
			fetch x_dacion into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x_dacion;

		// buscar liberador de una promesa //OK
		DECLARE x11 CURSOR FOR  
  		SELECT	DISTINCT "CADENA"."CODIGO", 
		  			"CADENA"."COD_PARQUE",
					"ANEXO_LIBERADOR"."SERIE_M",   
					"ANEXO_LIBERADOR"."NRO_LIBERADOR"   
    		FROM 		"ANEXO_LIBERADOR",   
					"CADENA",   
					"OFERTA_V",   
					"PAGO_LIBERADOR"  
   		WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "ANEXO_LIBERADOR"."SERIE" = "CADENA"."SERIE" ) and  
					( "ANEXO_LIBERADOR"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					( "PAGO_LIBERADOR"."SERIE_M" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
					( "PAGO_LIBERADOR"."NRO_LIBERADOR" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
					( "PAGO_LIBERADOR"."FOLIO" = "ANEXO_LIBERADOR"."ULT_FOLIO" ) and  
					( ( "CADENA"."CODIGO" = :is_base ) AND  
					( "ANEXO_LIBERADOR"."SERIE" = :is_serie ) AND  
					( "ANEXO_LIBERADOR"."NRO_OFERTA" = :il_numero ) )   
		Using 	sqlca;
		open x11;
		do While sqlca.sqlcode = 0 
			fetch x11 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ls_estado
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'L' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('L',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x11;
		//cargar Anexos para Multiproducto F/G
		if is_base='M' then
			// buscar Promesa de Multiproducto
			ls_string	= is_base+is_serie+trim(string(il_numero))
			DECLARE x_prom_mp CURSOR FOR
			SELECT DISTINCT 	"CADENA"."CODIGO",   
						"CADENA"."COD_PARQUE",
						"OFERTA_V"."SERIE",   
						"OFERTA_V"."NRO_OFERTA",   
						"CADENA"."ESTADO"   
			FROM 		"OFERTA_V",   
						"PAGO_OFERTA",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			//		 ( "OFERTA_V"."BASE" = 'O' ) and  
					 ( "CADENA"."CODIGO" = 'O' ) and 
					 (("OFERTA_V"."ANEXO_PROMESA" = trim(:ls_string) ) ) 
			Using 	sqlca;
			open x_prom_mp;
			do While sqlca.sqlcode = 0 
				fetch x_prom_mp into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
				if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
					SELECT 	"CADENA"."RUT"
					INTO 		:ll_rut
					FROM 		"CADENA"  
					WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
								( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					Using		Trans_1;
					if Trans_1.sqlcode = 0 then
						if ll_rut > 0 then
							SELECT 	"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
							INTO 		:ls_dv,   
										:ls_nombre,   
										:ls_a_pat,   
										:ls_a_mat  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut   
							Using		Trans_2;
							if Trans_2.sqlcode = 0 then
								wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							end if
						end if
					end if
				end if
				setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
				setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
				setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
			loop
			close x_prom_mp;
			
			// buscar Crematorio de Multiproducto
			ls_string	= is_base+is_serie+trim(string(il_numero))
			DECLARE x_crem_mp CURSOR FOR
			SELECT DISTINCT 	"CADENA"."CODIGO",   
						"CADENA"."COD_PARQUE",
						"OFERTA_V"."SERIE",   
						"OFERTA_V"."NRO_OFERTA",   
						"CADENA"."ESTADO"   
			FROM 		"OFERTA_V",   
						"PAGO_OFERTA",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			//		 ( "OFERTA_V"."BASE" = 'O' ) and  
					 ( "CADENA"."CODIGO" = 'G' ) and 
					 (("OFERTA_V"."ANEXO_CREMATORIO" = trim(:ls_string) ) ) 
			Using 	sqlca;
			open x_crem_mp;
			do While sqlca.sqlcode = 0 
				fetch x_crem_mp into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
				if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
					SELECT 	"CADENA"."RUT"
					INTO 		:ll_rut
					FROM 		"CADENA"  
					WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
								( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					Using		Trans_1;
					if Trans_1.sqlcode = 0 then
						if ll_rut > 0 then
							SELECT 	"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
							INTO 		:ls_dv,   
										:ls_nombre,   
										:ls_a_pat,   
										:ls_a_mat  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut   
							Using		Trans_2;
							if Trans_2.sqlcode = 0 then
								wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							end if
						end if
					end if
				end if
				setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
				setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
				setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
			loop
			close x_crem_mp;
			
			// buscar Funeraria de Multiproducto
			ls_string	= is_base+is_serie+trim(string(il_numero))
			DECLARE x_fune_mp CURSOR FOR
			SELECT DISTINCT 	"CADENA"."CODIGO",   
						"CADENA"."COD_PARQUE",
						"OFERTA_V"."SERIE",   
						"OFERTA_V"."NRO_OFERTA",   
						"CADENA"."ESTADO"   
			FROM 		"OFERTA_V",   
						"PAGO_OFERTA",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			//		 ( "OFERTA_V"."BASE" = 'O' ) and  
					 ( "CADENA"."CODIGO" = 'F' ) and 
					 (("OFERTA_V"."ANEXO_FUNERARIA" = trim(:ls_string) ) ) 
			Using 	sqlca;
			open x_fune_mp;
			do While sqlca.sqlcode = 0 
				fetch x_fune_mp into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
				if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
					SELECT 	"CADENA"."RUT"
					INTO 		:ll_rut
					FROM 		"CADENA"  
					WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
								( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					Using		Trans_1;
					if Trans_1.sqlcode = 0 then
						if ll_rut > 0 then
							SELECT 	"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
							INTO 		:ls_dv,   
										:ls_nombre,   
										:ls_a_pat,   
										:ls_a_mat  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut   
							Using		Trans_2;
							if Trans_2.sqlcode = 0 then
								wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							end if
						end if
					end if
				end if
				setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
				setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
				setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
			loop
			close x_fune_mp;
		end if
		// buscar derecho de una oferta  //OK
		DECLARE x2 CURSOR FOR  
  		SELECT	"CADENA"."CODIGO",   
				   "CADENA"."COD_PARQUE",
					"DERECHO"."SERIE_P",   
					"DERECHO"."NRO_PAGARE" 
    	FROM 		"CADENA",   
					"DERECHO",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
   	WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "CADENA"."SERIE" = "DERECHO"."SERIE" ) and  
					( "CADENA"."NUMERO" = "DERECHO"."NRO_OFERTA" ) and  
					( ( "CADENA"."CODIGO" = :is_base ) AND  
					( "DERECHO"."SERIE" = :is_serie ) AND  
					( "DERECHO"."NRO_OFERTA" = :il_numero ) )   
		Using 	sqlca;
		open x2;
		do While sqlca.sqlcode = 0 
			fetch x2 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT",
							"CADENA"."ESTADO"
				INTO 		:ll_rut,
							:ls_estado
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'D' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('D',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x2;
		// buscar pagare de una oferta //OK
 		DECLARE x3 CURSOR FOR  
  		SELECT 	"CADENA"."CODIGO",   
				   "CADENA"."COD_PARQUE",
					"PAGARE"."SERIE_P",   
					"PAGARE"."NRO_PAGARE",   
					"CADENA"."ESTADO"  
    	FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA",   
					"PAGARE"  
   	WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					( "PAGARE"."SERIE" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					(("CADENA"."CODIGO" = :is_base ) AND  
					( "PAGARE"."SERIE" = :is_serie ) AND  
					( "PAGARE"."NRO_OFERTA" = :il_numero ) ) 
		Using 	sqlca;
		open x3;
		do While sqlca.sqlcode = 0 
			fetch x3 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"  
				INTO 		:ll_rut  
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'P' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('P',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x3;
		//BUSCAR CONTRATO ISA DE UNA OFERTA //OK
		DECLARE x31 CURSOR FOR  
  		SELECT 	"CADENA"."CODIGO",   
				   "CADENA"."COD_PARQUE",
					"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO",   
					"CADENA"."ESTADO"   
    	FROM 		"CADENA",   
					"CONTRATO",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
   	WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "CONTRATO"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "CONTRATO"."NRO_PAGARE" ) and  
					(("CADENA"."CODIGO" = :is_base ) AND  
					( "OFERTA_V"."SERIE" = :is_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :il_numero ) )   
		Using		sqlca ; 
		open x31;
		do While sqlca.sqlcode = 0 
			fetch x31 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				if ll_rut > 0 then
					SELECT 	"CADENA"."RUT",
								"CADENA"."ESTADO"
					INTO 		:ll_rut 
					FROM 		"CADENA"  
					WHERE 	( "CADENA"."CODIGO" = 'C' ) AND  
								( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					Using		Trans_1;
					if Trans_1.sqlcode = 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x31;
		// buscar Reprogramaciones de una promesa //OK
		DECLARE x32 CURSOR FOR  
		SELECT	"REPACTA_MANTENCION"."BASE",   
         		"REPACTA_MANTENCION"."SERIE",   
         		"REPACTA_MANTENCION"."NUMERO"
    	FROM 		"REPACTA_MANTENCION"  
   	WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
         	 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
         	 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero ) AND  
         	 ( "REPACTA_MANTENCION"."ESTADO_PAGO" = 'V' )  
		Using 	sqlca;
		open x32;
		do While sqlca.sqlcode = 0 
			fetch x32 into :ls_codigo,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."COD_PARQUE",
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ll_cod_parque,
							:ls_estado
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'R' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('R',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x32;
		
		// buscar Promesa de Aumento Capacidad
		SELECT	"OFERTA_V"."ANEXO_AUMENTO"  
		INTO 		:ls_anexo_aumento  
		FROM 		"CADENA",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_anexo_aumento) then
				ls_base_dac		= mid(ls_anexo_aumento,1,1)
				ls_serie_dac	= mid(ls_anexo_aumento,2,1)
				ll_numero_dac	= Double(mid(ls_anexo_aumento,3))
				if ls_base_dac='A' then
					DECLARE x_aumento_o CURSOR FOR
					SELECT 	"CADENA"."CODIGO",   
								"CADENA"."COD_PARQUE",
								"ANEXO_AUMENTO"."SERIE_M",   
								"ANEXO_AUMENTO"."NRO_AUMENTO",   
								"CADENA"."ESTADO"   
					FROM 		"ANEXO_AUMENTO",   
								"PAGO_AUMENTO",   
								"CADENA"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
							 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "CADENA"."CODIGO" = :ls_base_dac ) and 
							 ( "CADENA"."SERIE" = :ls_serie_dac ) and
							 ( "CADENA"."NUMERO" = :ll_numero_dac )
					Using 	sqlca;
					open x_aumento_o;
					do While sqlca.sqlcode = 0 
						fetch x_aumento_o into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
						if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
							SELECT 	"CADENA"."RUT"
							INTO 		:ll_rut
							FROM 		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = 'A' ) AND  
										( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
										( "CADENA"."NUMERO" = :ll_numero )   
							Using		Trans_1;
							if Trans_1.sqlcode = 0 then
								if ll_rut > 0 then
									SELECT 	"CLIENTE"."DV",   
												"CLIENTE"."NOMBRE",   
												"CLIENTE"."A_PATERNO",   
												"CLIENTE"."A_MATERNO"  
									INTO 		:ls_dv,   
												:ls_nombre,   
												:ls_a_pat,   
												:ls_a_mat  
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :ll_rut   
									Using		Trans_2;
									if Trans_2.sqlcode = 0 then
										wf_insertar_registro('A',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
									end if
								end if
							end if
						end if
						setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
						setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
						setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
					loop
					close x_aumento_o;
				end if
			end if
		end if
		
		// buscar Repactacion Credito de Promesa
		if is_serie='R' then
			SELECT	"OFERTA_V"."ANEXO_DACION"  
			INTO 		:ls_anexo_aumento  
			FROM 		"CADENA",   
						"OFERTA_V",   
						"PAGO_OFERTA"  
			WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :is_base ) AND  
					 ( "CADENA"."SERIE" = :is_serie ) AND  
					 ( "CADENA"."NUMERO" = :il_numero ))   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_anexo_aumento) then
					ls_base_dac		= mid(ls_anexo_aumento,1,1)
					ls_serie_dac	= mid(ls_anexo_aumento,2,1)
					ll_numero_dac	= Double(mid(ls_anexo_aumento,3))
					SELECT	"REPACTA_CREDITO"."BASE",   
								"CADENA"."COD_PARQUE",
								"REPACTA_CREDITO"."SERIE",   
								"REPACTA_CREDITO"."NUMERO"   
					//			"CADENA"."ESTADO"
					INTO		:ls_base,
								:ll_cod_parque,
								:ls_serie,
								:ll_numero
					//			:ls_estado
					FROM 		"REPACTA_CREDITO",   
								"CADENA"  
					WHERE  ( "REPACTA_CREDITO"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "REPACTA_CREDITO"."NUMERO" = "CADENA"."NUMERO" ) and  
							 ( "REPACTA_CREDITO"."BASE" = "CADENA"."CODIGO" ) and  
							 (("REPACTA_CREDITO"."BASE_ORIGINAL" = :ls_base_dac ) AND  
							 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :ls_serie_dac ) AND  
							 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :ll_numero_dac ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then							
						SELECT 	"CADENA"."RUT",
									"CADENA"."ESTADO"
						INTO 		:ll_rut,
									:ls_estado
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :ls_base_dac ) AND  
								 ( "CADENA"."SERIE" = :ls_serie_dac ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero_dac )   
						USING		Trans_1;
						if Trans_1.sqlcode = 0 then
							if ll_rut > 0 then
								SELECT 	"CLIENTE"."DV",   
											"CLIENTE"."NOMBRE",   
											"CLIENTE"."A_PATERNO",   
											"CLIENTE"."A_MATERNO"  
								INTO 		:ls_dv,   
											:ls_nombre,   
											:ls_a_pat,   
											:ls_a_mat  
								FROM 		"CLIENTE"  
								WHERE 	"CLIENTE"."RUT" = :ll_rut   
								Using		Trans_2;
								if Trans_2.sqlcode = 0 then
									ll_fila	= dw_listado_rut.Find("base ='"+ls_base_dac+"' and serie='"+ls_serie_dac+"' and numero = "+string(ll_numero_dac), 1, dw_listado_rut.RowCount())
									if ll_fila=0 then
										wf_insertar_registro(ls_base_dac,ls_serie_dac,ll_numero_dac,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
									end if
								end if
							end if
						end if
					end if
					setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
					setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
					setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
				end if
			end if
		end if
		
	CASE 'A' //Base 'A' AUMENTO CAPACIDAD
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// BUSCAR OFERTA DE UN AUMENTO //OK
		ls_string	= 'A'+is_serie+trim(string(il_numero))
		DECLARE x44 CURSOR FOR
   	SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"OFERTA_V"."SERIE",   
					"OFERTA_V"."NRO_OFERTA",   
					"CADENA"."ESTADO"   
    	FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
   	WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = :is_base ) and 
				 (("OFERTA_V"."ANEXO_AUMENTO" = trim(:ls_string) ) ) 
		Using 	sqlca;
		open x44;
		do While sqlca.sqlcode = 0 
			fetch x44 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x44;
		// buscar contrato de un liberador //OK
		ls_string	= 'A'+is_serie+trim(string(il_numero))
 		DECLARE x55 CURSOR FOR  
  		SELECT 	"CADENA"."CODIGO",   
  					"CADENA"."COD_PARQUE",
					"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO",   
					"CADENA"."ESTADO",   
					"CONTRATO"."SERIE",   
					"CONTRATO"."NRO_PAGARE"  
    	FROM 		"CONTRATO",   
         		"CADENA"  
   	WHERE 	( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
					( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
					(("CONTRATO"."ANEXO_AUMENTO" = :ls_string ) AND  
					( "CADENA"."CODIGO" = 'C' ) ) 
		Using 	sqlca;
		open x55;
		do While sqlca.sqlcode = 0 
			fetch x55 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado,:ls_serie_pag,:ll_nro_pag;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"  
				INTO 		:ll_rut  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = 'C' ) AND  
						 ( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							setnull(ls_estado);setnull(ll_rut);setnull(ll_cod_parque)
							setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
							SELECT	"CADENA"."ESTADO",   
										"CADENA"."COD_PARQUE",
										"PAGARE"."RUT",   
										"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
    						INTO 		:ls_estado,   
							 			:ll_cod_parque,
										:ll_rut,   
										:ls_dv,   
										:ls_nombre,   
										:ls_a_pat,   
										:ls_a_mat  
    						FROM 		"PAGARE",   
										"CADENA",   
										"CLIENTE"  
   						WHERE 	( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
										( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
										( "PAGARE"."RUT" = "CLIENTE"."RUT" ) and  
										( ( "CADENA"."CODIGO" = 'P' ) AND  
										( "PAGARE"."SERIE_P" = :ls_serie_pag ) AND  
										( "PAGARE"."NRO_PAGARE" = :ll_nro_pag ) )   
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								wf_insertar_registro('P',ls_serie_pag,ll_nro_pag,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							end if
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x55;

	CASE 'L' //Base 'L' LIBERADOR
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// BUSCAR OFERTA DE UN LIBERADOR //OK
		ls_string	= 'L'+is_serie+trim(string(il_numero))
		DECLARE x4 CURSOR FOR  
   	SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"OFERTA_V"."SERIE",   
					"OFERTA_V"."NRO_OFERTA",   
					"CADENA"."ESTADO"   
    	FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
   	WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = :is_base ) and 
				 (("OFERTA_V"."ANEXO_LIB" = trim(:ls_string) ) ) 
		Using 	sqlca;
		open x4;
		do While sqlca.sqlcode = 0 
			fetch x4 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x4;
		// buscar contrato de un liberador //OK
		ls_string	= 'L'+is_serie+trim(string(il_numero))
 		DECLARE x5 CURSOR FOR  
  		SELECT 	"CADENA"."CODIGO",   
  					"CADENA"."COD_PARQUE",
					"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO",   
					"CADENA"."ESTADO",   
					"CONTRATO"."SERIE",   
					"CONTRATO"."NRO_PAGARE"  
    	FROM 		"CONTRATO",   
         		"CADENA"  
   	WHERE 	( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
					( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
					(("CONTRATO"."ANEXO_LIB" = :ls_string ) AND  
					( "CADENA"."CODIGO" = 'C' ) ) 
		Using 	sqlca;
		open x5;
		do While sqlca.sqlcode = 0 
			fetch x5 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado,:ls_serie_pag,:ll_nro_pag;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"  
				INTO 		:ll_rut  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = 'C' ) AND  
						 ( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							setnull(ls_estado);setnull(ll_rut);setnull(ll_cod_parque)
							setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
							SELECT	"CADENA"."ESTADO",   
										"CADENA"."COD_PARQUE",
										"PAGARE"."RUT",   
										"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
    						INTO 		:ls_estado,   
							 			:ll_cod_parque,
										:ll_rut,   
										:ls_dv,   
										:ls_nombre,   
										:ls_a_pat,   
										:ls_a_mat  
    						FROM 		"PAGARE",   
										"CADENA",   
										"CLIENTE"  
   						WHERE 	( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
										( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
										( "PAGARE"."RUT" = "CLIENTE"."RUT" ) and  
										( ( "CADENA"."CODIGO" = 'P' ) AND  
										( "PAGARE"."SERIE_P" = :ls_serie_pag ) AND  
										( "PAGARE"."NRO_PAGARE" = :ll_nro_pag ) )   
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								wf_insertar_registro('P',ls_serie_pag,ll_nro_pag,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							end if
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x5;

	CASE 'D' //Base 'D' DERECHO
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// Buscar Ofertas de un Derecho  //OK
		DECLARE x6 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"OFERTA_V"."SERIE",   
					"OFERTA_V"."NRO_OFERTA"   
		FROM 		"DERECHO",   
					"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
		WHERE 	( "DERECHO"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "DERECHO"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "DERECHO"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "DERECHO"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( ( "DERECHO"."SERIE_P" = :is_serie ) AND  
					( "DERECHO"."NRO_PAGARE" = :il_numero ) AND  
					( "CADENA"."CODIGO" = 'D' )  )   
		Using 	sqlca;
		open x6;
		do While sqlca.sqlcode = 0 
			fetch x6 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT",  
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x6;
		// Buscar Contrato Isa de un Derecho //OK
 		DECLARE x7 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO"  
		FROM 		"CONTRATO",   
					"DERECHO",   
					"CADENA"  
		WHERE  ( "DERECHO"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "DERECHO"."NRO_OFERTA" = "CONTRATO"."NRO_CONTRATO" ) and  
				 ( "DERECHO"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "DERECHO"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
				 (("DERECHO"."BASE" = 'C' ) AND  
				 ( "DERECHO"."SERIE_P" = trim(:is_serie) ) AND  
				 ( "DERECHO"."NRO_PAGARE" = :il_numero ) )  
		Using 	sqlca;
		open x7;
		do While sqlca.sqlcode = 0
			fetch x7 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."ESTADO" 
				INTO 		:ll_rut,
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'C' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x7;			
		// Buscar Pagare de un Derecho //OK
		DECLARE X71 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"PAGARE"."SERIE_P",   
					"PAGARE"."NRO_PAGARE"  
		FROM 		"DERECHO",   
					"PAGARE",   
					"CADENA"  
		WHERE 	( "DERECHO"."SERIE" = "PAGARE"."SERIE" ) and  
					( "DERECHO"."NRO_OFERTA" = "PAGARE"."NRO_OFERTA" ) and  
					( "DERECHO"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "DERECHO"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( ( "DERECHO"."SERIE_P" = trim(:is_serie) ) AND  
					( "DERECHO"."NRO_PAGARE" = :il_numero ) AND  
					( "CADENA"."CODIGO" = 'D' ) )   
		USING		sqlca ;
		open x71;
		do While sqlca.sqlcode = 0
			fetch x71 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT",  
							"CADENA"."ESTADO" 
				INTO 		:ll_rut, 
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'P' ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1; 
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('P',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x71;					

	CASE 'P' //Base 'P' PAGARE
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// Buscar Contrato Isa de un Pagaré //OK
		DECLARE 	cur_8 CURSOR FOR  
		SELECT	"CONTRATO"."SERIE_C",   
					"CADENA"."COD_PARQUE",
					"CONTRATO"."NRO_CONTRATO",   
					"CONTRATO"."ANEXO_LIB"  
		FROM 		"CADENA",   
					"CONTRATO",   
					"PAGARE"  
		WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				 ( "PAGARE"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "PAGARE"."NRO_OFERTA" = "CONTRATO"."NRO_CONTRATO" ) and  
				 (("CADENA"."CODIGO" = 'P' ) AND  
				 ( "PAGARE"."SERIE_P" = trim(:is_serie) ) AND  
				 ( "PAGARE"."NRO_PAGARE" = :il_numero ) )   
		Using		sqlca;
		open cur_8;
		do While sqlca.sqlcode = 0 
			FETCH cur_8 INTO :ls_serie,:ll_cod_parque, :ll_numero, :ls_anexo_lib;
			if not isnull(ls_serie) and ll_numero > 0 then
				ls_codigo	= 'C'
				SELECT 	"CADENA"."RUT", 
							"CADENA"."ESTADO"
				INTO 		:ll_rut, 
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'C' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('C',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
							if not isnull(ls_anexo_lib) or ls_anexo_lib <> '' then
								ls_serie_aux	= mid(ls_anexo_lib,2,1)
								ll_numero_aux	= Double(mid(ls_anexo_lib,3))
								setnull(ll_rut);setnull(ls_estado);setnull(ls_dv);setnull(ls_nombre)
								setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_estado);setnull(ll_cod_parque)
								SELECT	"ANEXO_LIBERADOR"."RUT",   
											"CADENA"."COD_PARQUE",
											"CADENA"."ESTADO", 
											"CLIENTE"."DV",   
											"CLIENTE"."NOMBRE",   
											"CLIENTE"."A_PATERNO",   
											"CLIENTE"."A_MATERNO"  
								INTO 		:ll_rut,   
											:ll_cod_parque,
											:ls_estado, 
											:ls_dv,   
											:ls_nombre,   
											:ls_a_pat,   
											:ls_a_mat  
								FROM 		"ANEXO_LIBERADOR",   
											"CADENA",   
											"PAGO_LIBERADOR",   
											"CLIENTE"  
								WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											( "ANEXO_LIBERADOR"."SERIE" = "CADENA"."SERIE" ) and  
											( "ANEXO_LIBERADOR"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
											( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											( "ANEXO_LIBERADOR"."RUT" = "CLIENTE"."RUT" ) and  
											( ( "ANEXO_LIBERADOR"."BASE" = 'L' ) AND  
											( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie_aux ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero_aux ) )   
								Using		Trans_1;
								if Trans_1.sqlcode = 0 then
									wf_insertar_registro('L',ls_serie_aux,ll_numero_aux,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
								end if
							end if
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close cur_8;
		// Buscar Oferta de un Pagaré //OK
		DECLARE x9 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"PAGARE"."SERIE",   
					"PAGARE"."NRO_OFERTA"  
		 FROM 	"PAGARE",   
					"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
		WHERE 	( "PAGARE"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "PAGARE"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
					( ( "PAGARE"."SERIE_P" = :is_serie ) AND  
					( "PAGARE"."NRO_PAGARE" = :il_numero ) AND  
					( "CADENA"."CODIGO" = 'P' ) ) 
		Using 	sqlca;
		open x9;
		do While sqlca.sqlcode = 0 
			fetch x9 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."ESTADO" 
				INTO 		:ll_rut,  
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x9;
		
	CASE 'C' //Base 'C' CONTRATO ISA
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		
		// buscar Contrato Isa de Anexo Dacion
		ls_string	= 'C'+is_serie+trim(string(il_numero))
		DECLARE x_dacion_isa CURSOR FOR
   	SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"OFERTA_V"."SERIE",   
					"OFERTA_V"."NRO_OFERTA",   
					"CADENA"."ESTADO"   
    	FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
   	WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = :is_base ) and 
				 (("OFERTA_V"."ANEXO_DACION" = trim(:ls_string) ) ) 
		Using 	sqlca;
		open x_dacion_isa;
		do While sqlca.sqlcode = 0 
			fetch x_dacion_isa into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_codigo ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x_dacion_isa;
		
		// Buscar pagaré de un Contrato Isa //OK
		DECLARE x10 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"PAGARE"."SERIE_P",   
					"PAGARE"."NRO_PAGARE"  
		 FROM 	"CONTRATO",   
					"PAGARE",   
					"CADENA"  
		WHERE 	( "CONTRATO"."SERIE_C" = "PAGARE"."SERIE" ) and  
					( "CONTRATO"."NRO_CONTRATO" = "PAGARE"."NRO_OFERTA" ) and  
					( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
					( "CONTRATO"."NRO_CONTRATO" = :il_numero ) AND  
					( "CADENA"."CODIGO" = 'C' ) )  
		Using 	sqlca;
		open x10;
		do While sqlca.sqlcode = 0 
			fetch x10 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT",  
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'P' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('P',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x10;
		// Buscar Oferta de un Contrato Isa // NO SE PUEDE
		// Buscar Derecho de un Contrato Isa //OK
		DECLARE x12 CURSOR FOR  
		SELECT 	"CADENA"."CODIGO",   
					"CADENA"."COD_PARQUE",
					"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO"  
		FROM 		"DERECHO",   
					"CONTRATO",   
					"CADENA"  
		WHERE 	( "DERECHO"."SERIE_P" = "CONTRATO"."SERIE_C" ) and  
					( "DERECHO"."NRO_PAGARE" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CADENA"."SERIE" = "DERECHO"."SERIE" ) and  
					( "CADENA"."NUMERO" = "DERECHO"."NRO_OFERTA" ) and  
					( ( "DERECHO"."SERIE" = trim(:is_serie) ) AND  
					( "DERECHO"."NRO_OFERTA" = :il_numero ) AND  
					( "CADENA"."CODIGO" = 'C' ) ) 
		Using 	sqlca;
		open x12;
		do While sqlca.sqlcode = 0 
			fetch x12 into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT",  
							"CADENA"."ESTADO"
				INTO 		:ll_rut,   
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'D' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('D',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x12;
		// Buscar Liberador de un Contrato //OK
		DECLARE x13 CURSOR FOR  
  		SELECT 	"CONTRATO"."ANEXO_LIB",  
				   "CADENA"."COD_PARQUE"
    	FROM 		"CONTRATO",   
         		"CADENA"  
   	WHERE 	( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
					( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
					( ( "CADENA"."CODIGO" = 'C' ) AND  
					( "CONTRATO"."SERIE_C" = :is_serie ) AND  
					( "CONTRATO"."NRO_CONTRATO" = :il_numero ) )   
		Using		sqlca;
		open x13;
		do While sqlca.sqlcode = 0 
			fetch x13 into :ls_liberador, :ll_cod_parque;
			if not isnull(ls_liberador)  then
				ls_serie_aux	= mid(ls_liberador,2,1)
				ll_numero_aux	= long(mid(ls_liberador,3))
				SELECT 	"CADENA"."RUT",  
							"CADENA"."ESTADO"
				INTO 		:ll_rut,   
							:ls_estado 
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'L' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie_aux) ) AND  
							( "CADENA"."NUMERO" = :ll_numero_aux )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('L',ls_serie_aux,ll_numero_aux,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ls_liberador);setnull(ls_serie_aux)
			setnull(ll_numero_aux);setnull(ll_cod_parque)
		loop
		close x13;
		//Buscar Reprogramacion de Contrato ISA
		DECLARE x14 CURSOR FOR  
		SELECT	"REPACTA_MANTENCION"."BASE",   
         		"REPACTA_MANTENCION"."SERIE",   
         		"REPACTA_MANTENCION"."NUMERO"
    	FROM 		"REPACTA_MANTENCION"  
   	WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = 'C' ) AND  
         	 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
         	 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero ) AND  
         	 ( "REPACTA_MANTENCION"."ESTADO_PAGO" = 'V' )  
		Using 	sqlca;
		open x14;
		do While sqlca.sqlcode = 0 
			fetch x14 into :ls_codigo,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."COD_PARQUE",
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ll_cod_parque,
							:ls_estado
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = 'R' ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro('R',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x14;
		
		// buscar Contrato Isa de Aumento Capacidad
		SELECT	"CONTRATO"."ANEXO_AUMENTO"  
		INTO 		:ls_anexo_aumento  
		FROM 		"CADENA",   
					"CONTRATO"   
		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 (("CADENA"."CODIGO" = 'C' ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_anexo_aumento) then
				ls_base_dac		= mid(ls_anexo_aumento,1,1)
				ls_serie_dac	= mid(ls_anexo_aumento,2,1)
				ll_numero_dac	= Double(mid(ls_anexo_aumento,3))
				if ls_base_dac='A' then
					DECLARE x_aumento_c CURSOR FOR
					SELECT 	"CADENA"."CODIGO",   
								"CADENA"."COD_PARQUE",
								"ANEXO_AUMENTO"."SERIE_M",   
								"ANEXO_AUMENTO"."NRO_AUMENTO",   
								"CADENA"."ESTADO"   
					FROM 		"ANEXO_AUMENTO",   
								"PAGO_AUMENTO",   
								"CADENA"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
							 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "CADENA"."CODIGO" = :ls_base_dac ) and 
							 ( "CADENA"."SERIE" = :ls_serie_dac ) and
							 ( "CADENA"."NUMERO" = :ll_numero_dac )
					Using 	sqlca;
					open x_aumento_c;
					do While sqlca.sqlcode = 0 
						fetch x_aumento_c into :ls_codigo,:ll_cod_parque,:ls_serie,:ll_numero,:ls_estado;
						if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
							SELECT 	"CADENA"."RUT"
							INTO 		:ll_rut
							FROM 		"CADENA"  
							WHERE 	( "CADENA"."CODIGO" = 'A' ) AND  
										( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
										( "CADENA"."NUMERO" = :ll_numero )   
							Using		Trans_1;
							if Trans_1.sqlcode = 0 then
								if ll_rut > 0 then
									SELECT 	"CLIENTE"."DV",   
												"CLIENTE"."NOMBRE",   
												"CLIENTE"."A_PATERNO",   
												"CLIENTE"."A_MATERNO"  
									INTO 		:ls_dv,   
												:ls_nombre,   
												:ls_a_pat,   
												:ls_a_mat  
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :ll_rut   
									Using		Trans_2;
									if Trans_2.sqlcode = 0 then
										wf_insertar_registro('A',ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
									end if
								end if
							end if
						end if
						setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
						setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
						setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
					loop
					close x_aumento_c;
				end if
			end if
		end if
		
	CASE 'R' //Base 'R' Reprogramación Cta. Mant.
		wf_insertar_registro(is_base,is_serie,il_numero,gs_estado,il_rut,gs_dv,gs_nombres,gs_apellido_paterno,gs_apellido_materno,il_cod_parque)
		// buscar Promesa o Ctto.ISA de una Reprogramaciones //OK
		DECLARE x15 CURSOR FOR  
		SELECT	"REPACTA_MANTENCION"."BASE_ORIGINAL",   
         		"REPACTA_MANTENCION"."SERIE_ORIGINAL",   
         		"REPACTA_MANTENCION"."NUMERO_ORIGINAL"
    	FROM 		"REPACTA_MANTENCION"  
   	WHERE  ( "REPACTA_MANTENCION"."BASE" = 'R' ) AND  
         	 ( "REPACTA_MANTENCION"."SERIE" = :is_serie ) AND  
         	 ( "REPACTA_MANTENCION"."NUMERO" = :il_numero ) AND  
         	 ( "REPACTA_MANTENCION"."ESTADO_PAGO" = 'V' )  
		Using 	sqlca;
		open x15;
		do While sqlca.sqlcode = 0 
			fetch x15 into :ls_codigo,:ls_serie,:ll_numero;
			if not isnull(ls_codigo) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT 	"CADENA"."RUT", 
							"CADENA"."COD_PARQUE",
							"CADENA"."ESTADO"
				INTO 		:ll_rut,  
							:ll_cod_parque,
							:ls_estado
				FROM 		"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = trim(:ls_codigo) ) AND  
							( "CADENA"."SERIE" = trim(:ls_serie) ) AND  
							( "CADENA"."NUMERO" = :ll_numero ) AND
							( "CADENA"."ESTADO" = 'V')
				Using		Trans_1;
				if Trans_1.sqlcode = 0 then
					if ll_rut > 0 then
						SELECT 	"CLIENTE"."DV",   
									"CLIENTE"."NOMBRE",   
									"CLIENTE"."A_PATERNO",   
									"CLIENTE"."A_MATERNO"  
						INTO 		:ls_dv,   
									:ls_nombre,   
									:ls_a_pat,   
									:ls_a_mat  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						Using		Trans_2;
						if Trans_2.sqlcode = 0 then
							wf_insertar_registro(ls_codigo,ls_serie,ll_numero,ls_estado,ll_rut,ls_dv,ls_nombre,ls_a_pat,ls_a_mat,ll_cod_parque)
						end if
					end if
				end if
			end if
			setnull(ls_string);setnull(ls_codigo);setnull(ls_serie);setnull(ls_estado)
			setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat);setnull(ls_dv)
			setnull(ll_numero);setnull(ll_rut);setnull(ll_cod_parque)
		loop
		close x15;

END CHOOSE
end subroutine

public subroutine wf_insertar_registro (string as_codigo, string as_serie, double al_numero, string as_estado, long al_rut, string as_dv, string as_nombre, string as_a_pat, string as_a_mat, long al_cod_parque);long	ll_new
if not isnull(trim(as_codigo)) and trim(as_codigo) <> '' and not isnull(trim(as_serie)) and &
	trim(as_serie) <> '' and not isnull(al_numero) and al_numero > 0 then
	ll_new	= dw_listado_rut.insertrow(0)
	dw_listado_rut.setitem(ll_new,'base',as_codigo)
	dw_listado_rut.setitem(ll_new,'serie',as_serie)
	dw_listado_rut.setitem(ll_new,'numero',al_numero)
	dw_listado_rut.setitem(ll_new,'estado',as_estado)
	dw_listado_rut.setitem(ll_new,'rut',al_rut)
	dw_listado_rut.setitem(ll_new,'dv',as_dv)
	dw_listado_rut.setitem(ll_new,'nombre',as_nombre)
	dw_listado_rut.setitem(ll_new,'a_pat',as_a_pat)
	dw_listado_rut.setitem(ll_new,'a_mat',as_a_mat)
	dw_listado_rut.setitem(ll_new,'cod_parque',al_cod_parque)
end if
end subroutine

on w_listado_contratos_por_todas_las_tablas.create
this.cb_ben_seg_fun=create cb_ben_seg_fun
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_print=create dw_print
this.cb_imprimir=create cb_imprimir
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_mensajes=create cb_mensajes
this.cb_fallecidos=create cb_fallecidos
this.cb_datos_repacta=create cb_datos_repacta
this.cb_beneficiarios=create cb_beneficiarios
this.cb_datos_clientes=create cb_datos_clientes
this.cb_datos_contrato=create cb_datos_contrato
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.gb_1=create gb_1
this.dw_listado_rut=create dw_listado_rut
this.cb_5=create cb_5
this.Control[]={this.cb_ben_seg_fun,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.dw_print,&
this.cb_imprimir,&
this.dw_2,&
this.dw_1,&
this.cb_7,&
this.cb_6,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_mensajes,&
this.cb_fallecidos,&
this.cb_datos_repacta,&
this.cb_beneficiarios,&
this.cb_datos_clientes,&
this.cb_datos_contrato,&
this.cb_cerrar,&
this.cb_ver_cuenta_corriente,&
this.gb_1,&
this.dw_listado_rut,&
this.cb_5}
end on

on w_listado_contratos_por_todas_las_tablas.destroy
destroy(this.cb_ben_seg_fun)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_print)
destroy(this.cb_imprimir)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_mensajes)
destroy(this.cb_fallecidos)
destroy(this.cb_datos_repacta)
destroy(this.cb_beneficiarios)
destroy(this.cb_datos_clientes)
destroy(this.cb_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.gb_1)
destroy(this.dw_listado_rut)
destroy(this.cb_5)
end on

event open;long il_cant_datos
SetPointer(HourGlass!)
Connect using Trans_1;
connect using Trans_2;
il_row3							= 0
gf_centrar(w_listado_contratos_por_todas_las_tablas)
is_base							= gs_base
is_serie							= gs_serie
il_numero						= gi_numero
il_rut								= gi_rut
il_cod_parque					= gl_cod_parque_cta
dw_listado_rut.DataObject 	= 'dw_external_contratos_todas_las_tablas'
dw_listado_rut.SetTransObject(SQLCA)
wf_cargar_datawindow(dw_listado_rut)
gs_ventana						= 'w_listado_contratos_por_todas_las_tablas'
f_valida_objeto()
il_cant_datos 					= dw_listado_rut.rowcount()
IF il_cant_datos = 0 THEN
	MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_listado_contratos_por_todas_las_tablas)
END IF
SetPointer(Arrow!)
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_ben_seg_fun from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1975
integer y = 1404
integer width = 498
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Benef.Seg.Funerario"
end type

event clicked;String		ls_string
if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	ls_string									= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if not isnull(gs_base) and gi_numero>0 then
		if isvalid(w_ingresar_benef_seguro_funeraria2) then close(w_ingresar_benef_seguro_funeraria2)
		openwithparm(w_ingresar_benef_seguro_funeraria2,ls_string)
	end if
end if
end event

type cb_10 from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1641
integer y = 1404
integer width = 329
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. General"
end type

event clicked;string		ls_dv,ls_base,ls_serie,ls_ctto
long 		ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row3>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row3, 'cliente_rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row3, 'cliente_dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row3, 'cadena_cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row3, "cadena_codigo")
		ls_serie 			= dw_listado_rut.GetItemString(il_row3, "cadena_serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row3, "cadena_numero")
	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos/promesa/general?numero="+string(li_numero)+'&parque='+string(ll_parque) )	//	QA
//				ret = iinet_base.HyperlinkToURL("http://10.0.22.72:8090/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )	PRODUCCION
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_9 from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1303
integer y = 1404
integer width = 334
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. Contrato"
end type

event clicked;string		ls_dv,ls_base,ls_serie,ls_ctto
long 		ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

//setnull(ll_tipo_dctto)
if il_row3>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row3, 'rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row3, 'dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row3, 'cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row3, "base")
		ls_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row3, "numero")
		//ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
//	http://10.0.22.56:8090/api/documentos?base=A&serie=A&numero=1&parque=1
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	



//string	ls_dv,ls_base,ls_serie,ls_ctto
//long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
//double	li_numero
//
//if il_row2>0 then 
//	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
//	if ll_res=1 then
//		ll_rut				= dw_listado.GetItemNumber(il_row2, 'cliente_rut')
//		ls_dv				= dw_listado.GetItemstring(il_row2, 'cliente_dv')
//		ll_parque			= dw_listado.GetItemNumber(il_row2, 'cadena_cod_parque')
//		ls_base 			= dw_listado.GetItemString(il_row2, "cadena_codigo")
//		ls_serie 			= dw_listado.GetItemString(il_row2, "cadena_serie")
//		li_numero 		= dw_listado.GetItemNumber(il_row2, "cadena_numero")
//	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
//		ls_ctto			= ls_serie+string(li_numero)
//		
//		ll_res1	= messagebox("Pregunta","¿Desea Consultar Documentos Digitalizados?",Exclamation!,YesNo!,2) 
//		if ll_res1	= 1 then
//			Inet  iinet_base
//			ret = GetContextService("Internet", iinet_base)
//			if ret = -1 then
//				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
//				return
//			end if
//			if ll_parque > 0 then
////	http://10.0.22.56:8090/api/documentos?base=A&serie=A&numero=1&parque=1
//				ret = iinet_base.HyperlinkToURL("http://10.0.22.56:8090/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )
//			end if
//			if ret = -1 then
//				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
//				return
//			end if
//		end if
//	end if
//end if	
end event

type cb_8 from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 864
integer y = 1404
integer width = 434
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Doc. Digitalizados"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

//setnull(ll_tipo_dctto)
if il_row3>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row3, 'rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row3, 'dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row3, 'cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row3, "base")
		ls_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row3, "numero")
		//ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Documentos Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/documentos/getcontratos.php?rut="+string(ll_rut)+'-'+ls_dv+'&parque='+string(ll_parque)+'&ctto='+ls_ctto)
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Digitalizada',stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type dw_print from datawindow within w_listado_contratos_por_todas_las_tablas
boolean visible = false
integer x = 1733
integer y = 1744
integer width = 133
integer height = 112
string dataobject = "dw_external_contratos_todas_tablas_print"
boolean livescroll = true
end type

type cb_imprimir from commandbutton within w_listado_contratos_por_todas_las_tablas
boolean visible = false
integer x = 2747
integer y = 1732
integer width = 242
integer height = 96
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_fila, ll_indi, ll_rut, ll_new
string		ls_base, ls_serie, ls_estado, ls_dv, ls_nombre, ls_a_pat, ls_a_mat
Double	ll_num
ll_fila	= dw_listado_rut.rowcount()
dw_print.reset()
if ll_fila > 0 then
	for ll_indi = 1 to ll_fila
		ls_base		= dw_listado_rut.getitemstring(ll_indi,'base')
		ls_serie		= dw_listado_rut.getitemstring(ll_indi,'serie')
		ls_estado	= dw_listado_rut.getitemstring(ll_indi,'estado')
		ls_dv			= dw_listado_rut.getitemstring(ll_indi,'dv')
		ls_nombre	= dw_listado_rut.getitemstring(ll_indi,'nombre')
		ls_a_pat		= dw_listado_rut.getitemstring(ll_indi,'a_pat')
		ls_a_mat		= dw_listado_rut.getitemstring(ll_indi,'a_mat')
		ll_rut		= dw_listado_rut.getitemnumber(ll_indi,'rut')
		ll_num	= dw_listado_rut.getitemnumber(ll_indi,'numero')
		ll_new	= dw_print.insertrow(0)
		dw_print.setitem(ll_new,'base',ls_base)
		dw_print.setitem(ll_new,'serie',ls_serie)
		dw_print.setitem(ll_new,'estado',ls_estado)
		dw_print.setitem(ll_new,'dv',ls_dv)
		dw_print.setitem(ll_new,'nombre',ls_nombre)
		dw_print.setitem(ll_new,'a_pat',ls_a_pat)
		dw_print.setitem(ll_new,'a_mat',ls_a_mat)
		dw_print.setitem(ll_new,'rut',ll_rut)
		dw_print.setitem(ll_new,'numero',ll_num)
	next
	dw_print.object.t_titulo.text		= gs_conexion
	
	CHOOSE CASE gs_base
		CASE 'O' //Base 'O' PROMESA
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS A LA PROMESA Nº '+STRING(gi_numero,"###,###,###,##0")
		CASE 'U' //Base 'U' COLUMBARIO
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS A COLUMBARIO Nº '+STRING(gi_numero,"###,###,###,##0")
		CASE 'L' //Base 'L' LIBERADOR
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS AL LIBERADOR Nº '+STRING(gi_numero,"###,###,###,##0")
		CASE 'D' //Base 'D' DERECHO
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS AL DERECHO Nº '+STRING(gi_numero,"###,###,###,##0")
		CASE 'P' //Base 'P' PAGARE
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS AL PAGARE Nº '+STRING(gi_numero,"###,###,###,##0")
		CASE 'C' //Base 'C' CONTRATO ISA
			dw_print.object.t_titulo_1.text	= 'LISTADO CONTRATOS ASOCIADIOS AL CONTRATO Nº '+STRING(gi_numero,"###,###,###,##0")
	END CHOOSE
	dw_print.print()
end if

end event

type dw_2 from datawindow within w_listado_contratos_por_todas_las_tablas
boolean visible = false
integer x = 1582
integer y = 1744
integer width = 133
integer height = 112
string dataobject = "d_listado_cuenta_cte_ch"
boolean livescroll = true
end type

type dw_1 from datawindow within w_listado_contratos_por_todas_las_tablas
event clicked pbm_dwnlbuttonclk
boolean visible = false
integer x = 923
integer y = 188
integer width = 1349
integer height = 844
integer taborder = 20
boolean titlebar = true
string title = "Información de Documentos"
string dataobject = "dw_estado_de_ch"
boolean controlmenu = true
boolean livescroll = true
end type

event clicked;visible = false
reset()
end event

type cb_7 from commandbutton within w_listado_contratos_por_todas_las_tablas
event clicked pbm_bnclicked
integer x = 398
integer y = 1404
integer width = 462
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuotas &Mantención"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
		open(w_boletas_cuotas)
	end if
end if
end event

type cb_6 from commandbutton within w_listado_contratos_por_todas_las_tablas
event clicked pbm_bnclicked
integer x = 32
integer y = 1404
integer width = 361
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuo&tas Crédito"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_3 from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 2821
integer y = 1404
integer width = 192
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
dw_1.visible = false
setnull (nulo)
dw_listado_rut.SETfilter(NULO)
dw_listado_rut.filter()
dw_print.filter()
end event

type cb_2 from commandbutton within w_listado_contratos_por_todas_las_tablas
boolean visible = false
integer x = 2505
integer y = 1732
integer width = 242
integer height = 96
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_1.visible	= false
dw_paso			= dw_listado_rut
if dw_listado_rut.rowcount() > 0 then f_DWToExcel( dw_paso )
//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//dw_1.visible = false
//TipoArchivo = excel!
//Archivo = 'salida.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_rut.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_1 from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 2624
integer y = 1404
integer width = 192
integer height = 96
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_listado_rut.rowcount()>0 then
	dw_1.visible = false
	setnull (nulo)
	dw_listado_rut.SETSORT(NULO)
	dw_listado_rut.SORT()
	dw_print.sort()
end if
end event

type cb_mensajes from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 2053
integer y = 1240
integer width = 270
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Mensajes"
end type

event clicked;Long ll_count
if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if gi_rut>0 then 
			if isvalid(w_aviso_mensajes) then close(w_aviso_mensajes)
			SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
			INTO 		:ll_count  
			FROM 		"MENSAJES"  
			WHERE  ( "MENSAJES"."RUT" = :gi_rut ) and
					 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
					 ( "MENSAJES"."SW_MENSAJE" = 'R' ) and
					 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
			USING		sqlca;
			if ll_count>0 then
				OpenWithParm(w_aviso_mensajes, "R")
			else
				SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
				INTO 		:ll_count  
				FROM 		"MENSAJES"  
				WHERE  ( "MENSAJES"."BASE" = :gs_base ) and
						 ( "MENSAJES"."SERIE" = :gs_serie ) and
						 ( "MENSAJES"."NUMERO" = :gi_numero ) and
						 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
						 ( "MENSAJES"."SW_MENSAJE" = 'C' ) and
						 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
				USING		sqlca;
				if ll_count>0 then
					OpenWithParm(w_aviso_mensajes, "C")
				end if
			end if
		end if
	end if
end if
end event

type cb_fallecidos from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1774
integer y = 1240
integer width = 274
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_datos_repacta from commandbutton within w_listado_contratos_por_todas_las_tablas
event clicked pbm_bnclicked
integer x = 695
integer y = 1240
integer width = 375
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Repactaciones"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_repacta) then close(w_listado_repacta)
				Open(w_listado_repacta)
			CASE "L" // Anexo Liberador
		//		Open(w_datos_contrato_liberador)
			CASE "A"
				if isvalid(w_listado_repacta_aumento_capacidad) then close(w_listado_repacta_aumento_capacidad)
				Open(w_listado_repacta_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

type cb_beneficiarios from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1413
integer y = 1240
integer width = 357
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Beneficiarios"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
				Open(w_listado_beneficiarios)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
				Open(w_listado_beneficiarios2)
		END CHOOSE
	end if
end if
end event

type cb_datos_clientes from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 1074
integer y = 1240
integer width = 334
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Datos Cliente"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_datos_cliente) then close(w_datos_cliente)
		Open(w_datos_cliente)
	end if
end if
end event

type cb_datos_contrato from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 457
integer y = 1240
integer width = 233
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&ontrato"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
				Open(w_datos_contrato_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
				Open(w_datos_contrato_liberador)
			CASE "P" // Pagaré
				if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
				Open(w_datos_contrato_pagare)
			CASE "C" // Contrato ISA
				if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
				Open(w_datos_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
				Open(w_datos_contrato_derecho)
			CASE "R" // Reprogramar Cta Mant.
				if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
				Open(w_datos_contrato_reprogramacion_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
				open(w_datos_contrato_aumento_capacidad)

		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 2683
integer y = 1240
integer width = 357
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//if isvalid(w_consultar_contato) then
//	IF gi_tipo_busqueda = 4 THEN
//		w_consultar_x_fallecido.em_rut.text = ""
//		w_consultar_x_fallecido.sle_nombres.text = ""
//		w_consultar_x_fallecido.sle_apaterno.text = ""
//		w_consultar_x_fallecido.sle_amaterno.text = ""
//		w_consultar_x_fallecido.sle_sector.text = ""
//		w_consultar_x_fallecido.sle_sepultura.text = ""
//	ELSE
//		IF gi_tipo_busqueda = 5 OR gi_tipo_busqueda = 6 THEN
//			w_consultar_x_sector.sle_sector.text = ""
//			w_consultar_x_sector.sle_sepultura.text = ""
//		ELSE
//			w_consultar_contato.sle_rut.text = ""
//			w_consultar_contato.sle_numero_contrato.text = ""
//			w_consultar_contato.sle_serie.text = ""
//		END IF
//	END IF
//end if
rutx = 0
IF ISVALID(w_consultar_contato) THEN 
   w_consultar_contato.sle_numero.text = ""
END IF
Close(w_listado_contratos_por_todas_las_tablas)
end event

type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_por_todas_las_tablas
integer x = 32
integer y = 1240
integer width = 421
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Reprogramar Cta.Mant.
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type gb_1 from groupbox within w_listado_contratos_por_todas_las_tablas
integer x = 2592
integer y = 1344
integer width = 448
integer height = 184
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Utilitarios"
end type

type dw_listado_rut from datawindow within w_listado_contratos_por_todas_las_tablas
integer x = 32
integer y = 32
integer width = 3008
integer height = 1172
integer taborder = 10
boolean titlebar = true
string title = "Consulta por Contrato"
string dataobject = "dw_external_contratos_todas_las_tablas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string ls_res,ls_opera
IF row > 0 THEN
	il_row3									= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row3, TRUE)
	gs_base 									= This.GetItemString(il_row3, "base")
	gs_serie 									= This.GetItemString(il_row3, "serie")
	gi_numero 								= This.GetItemNumber(il_row3, "numero")
	gi_rut 									= This.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta					= this.GetItemNumber(il_row3, "cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
//	if gs_base='O' then
//		cb_beneficiarios.enabled		= true
//	elseif gs_base='C' then
//		if gs_digita='1' or gs_depto='I' then 
			cb_beneficiarios.enabled	= true
//		else
//			cb_beneficiarios.enabled	= false
//		end if
//	else
//		cb_beneficiarios.enabled		= false
//	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled	= TRUE
	cb_datos_repacta.enabled 			= TRUE
//	cb_mensajes.enabled = TRUE
//	OPEN(w_ver_cheques)
//	for i = 1 to w_ver_cheques.dw_d_listado_cuenta_cte_ch.rowcount()
//		ls_res = w_ver_cheques.dw_d_listado_cuenta_cte_ch.getitemstring(i,'documentos_estado_ch')
//		if ls_res = 'P' then
//			protesto ++
//		elseif
//	next
	dw_2.settransobject (sqlca)
	if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
		for i = 1 to dw_2.rowcount()
			if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				protesto ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
				prorrogado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
				cancelado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				reemplazado ++
			end if
		next
		if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
			dw_1.visible = true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	gs_ventana					= 'w_listado_contratos_por_todas_las_tablas'
	f_valida_objeto()
	cb_fallecidos.enabled			= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 		= f_mensajes(gi_rut) = 1
END IF
end event

event doubleclicked;if gs_base='A' or gs_base='L' then
	cb_9.enabled						= true
else
	cb_9.enabled						= false
end if
IF row >0 AND This.DataObject = 'd_cont_resultado_busqueda_x_fallecido' THEN
	
	gi_llave_f = This.GetItemNumber(row, "fallecidos_llave")
	if isvalid(w_datos_fallecimiento) then close(w_datos_fallecimiento)
	Open(w_datos_fallecimiento)
	
END IF
end event

event rowfocuschanged;integer protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string ls_res,ls_opera
IF this.getrow() > 0 THEN
	il_row3									= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row3, TRUE)
	gs_base 									= This.GetItemString(il_row3, "base")
	gs_serie 									= This.GetItemString(il_row3, "serie")
	gi_numero 								= This.GetItemNumber(il_row3, "numero")
	gi_rut 									= This.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta					= this.GetItemNumber(il_row3, "cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' or gs_base='M' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
//	if gs_base='O' then
//		cb_beneficiarios.enabled		= true
//	elseif gs_base='C' then
//		if gs_digita='1' or gs_depto='I' then 
			cb_beneficiarios.enabled	= true
//		else
//			cb_beneficiarios.enabled	= false
//		end if
//	else
//		cb_beneficiarios.enabled		= false
//	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled	= TRUE
	cb_datos_repacta.enabled 			= TRUE
//	cb_mensajes.enabled = TRUE
//	OPEN(w_ver_cheques)
//	for i = 1 to w_ver_cheques.dw_d_listado_cuenta_cte_ch.rowcount()
//		ls_res = w_ver_cheques.dw_d_listado_cuenta_cte_ch.getitemstring(i,'documentos_estado_ch')
//		if ls_res = 'P' then
//			protesto ++
//		elseif
//	next
	dw_2.settransobject (sqlca)
	if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
		for i = 1 to dw_2.rowcount()
			if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				protesto ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
				prorrogado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
				cancelado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				reemplazado ++
			end if
		next
		if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
			dw_1.visible = true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	gs_ventana					= 'w_listado_contratos_por_todas_las_tablas'
	f_valida_objeto()
	cb_fallecidos.enabled	= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 		= f_mensajes(gi_rut) = 1
END IF
end event

type cb_5 from commandbutton within w_listado_contratos_por_todas_las_tablas
event clicked pbm_bnclicked
integer x = 2327
integer y = 1240
integer width = 261
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Dctos"
end type

event clicked;if il_row3>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row3, "base")
	gs_serie 			= dw_listado_rut.GetItemString(il_row3, "serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row3, "numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row3, "rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row3, "cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_VER_CHEQUES) then close(w_VER_CHEQUES)
		Open(w_VER_CHEQUES)
	end if
end if
end event

