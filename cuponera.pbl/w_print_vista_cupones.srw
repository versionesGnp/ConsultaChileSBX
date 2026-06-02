forward
global type w_print_vista_cupones from window
end type
type cb_filtrar from commandbutton within w_print_vista_cupones
end type
type cb_cancelar from commandbutton within w_print_vista_cupones
end type
type cb_imprimir from commandbutton within w_print_vista_cupones
end type
type dw_cuponeras from datawindow within w_print_vista_cupones
end type
end forward

global type w_print_vista_cupones from window
integer width = 3931
integer height = 2240
boolean titlebar = true
string title = "Vista Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_cancelar cb_cancelar
cb_imprimir cb_imprimir
dw_cuponeras dw_cuponeras
end type
global w_print_vista_cupones w_print_vista_cupones

on w_print_vista_cupones.create
this.cb_filtrar=create cb_filtrar
this.cb_cancelar=create cb_cancelar
this.cb_imprimir=create cb_imprimir
this.dw_cuponeras=create dw_cuponeras
this.Control[]={this.cb_filtrar,&
this.cb_cancelar,&
this.cb_imprimir,&
this.dw_cuponeras}
end on

on w_print_vista_cupones.destroy
destroy(this.cb_filtrar)
destroy(this.cb_cancelar)
destroy(this.cb_imprimir)
destroy(this.dw_cuponeras)
end on

event open;LONG   	il_job,i,j,ll_tot_reg,ll_fila,ll_indi,ll_estado,ll_min_cup,ll_cupon_termino,&
			ll_buscar_cup_termino,ll_max_cup,ll_cod_parque,ll_rut_aux,ll_max_nro,ll_cup_max,&
			ll_cup_final,ll_rut,ll_num_cuponera,&
			ll_pasa,ll_cant_cupones
string 	codigo,serie,ls_string,ls_base,ls_serie,ls_print_mant,ls_dv,ls_base_aux
Double	ll_valor_cta_mant,ll_numero,numero,numero_pro,ll_cup_ini,ll_cup_fin
datetime	ldt_fec_venc,ldt_fecha_venc_min,ldt_fecha_venc_max,ldt_fecha_ini_mes,ldt_fecha_fin_mes
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Long		ll_mes,ll_year,ll_mes_sgte,ll_tot_porc_aux,ll_cant_mant,ll_cant_cred,ll_tot_porc=0
String	ls_fec_inicial,ls_fec_final

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
UPDATE	"CUPONERAS_DETALLE"  
SET 		"IP_PRINT" = null,   
			"USUARIO_PRINT" = null  
WHERE  ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
		 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
gf_centrar(w_print_vista_cupones)
if isvalid(w_cuenta_corriente_oferta) or isvalid(w_cuenta_corriente_aumento_capacidad) or &
	isvalid(w_cuenta_corriente_contrato_isa) or isvalid(w_cuenta_corriente_derecho) or &
	isvalid(w_cuenta_corriente_liberador) or isvalid(w_cuenta_corriente_pagare) or &
	isvalid(w_cuenta_corriente_repactar_cta_mant) or isvalid(w_cuenta_corriente_funeraria) then
	
	ls_base			= gs_base
	ls_serie			= gs_serie
	ll_numero		= gi_numero
	if ls_base='O' or ls_base='U' then
		ll_cod_parque	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='A' then
		ll_cod_parque	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='C' then
		ll_cod_parque	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='D' then
		ll_cod_parque	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='L' then
		ll_cod_parque	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='F' or ls_base='G' or ls_base='V' then
		ll_cod_parque	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='P' then
		ll_cod_parque	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
	elseif ls_base='R' then
		ll_cod_parque	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cadena_cod_parque')
	end if

	SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
	INTO   	:ll_cant_mant,                              						:ll_cant_cred
	FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
	WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
			( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
			(("CADENA"."CODIGO" = :ls_base ) AND  
			( "CADENA"."SERIE" = :ls_serie ) AND  
			( "CADENA"."NUMERO" = :ll_numero ) )   ;
			
	SELECT	"CUPONERAS"."NRO_CUPONERA",	"CUPONERAS"."CUPON_INICIAL",	"CUPONERAS"."CUPON_FINAL"  
	INTO 		:ll_num_cuponera,					:ll_cup_ini,						:ll_cup_fin
	FROM 	"CUPONERAS"  
	WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
			   ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
			   ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
			   ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   ;
	
	SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
	INTO 		:ldt_fecha_venc_min  
	FROM 		"CUPONERAS_DETALLE"  
	WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
			 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
			 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
			 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
			 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
			 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ls_base='O' or ls_base='C' or ls_base='U' then
			SELECT	"CADENA"."RUT"  
			INTO 		:ll_rut_aux  
			FROM 	"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
					 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					 (("CADENA"."CODIGO" = 'L' ) AND  
					 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
					 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
						"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
						"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_print_mant			= 'N'
				ll_cant_cupones		= gi_cant_cup
				if ll_cant_cred > 1 then
					ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
				end if
				DECLARE x41 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
				execute x41;
				FETCH x41 into :ldt_fecha_venc_max ;
			else
				ls_print_mant	= 'S'
				ll_cant_cupones	= gi_cant_cup - 2
				if ll_cant_cred > 1 then
					ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
				end if
				DECLARE x42 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
				execute x42;
				FETCH x42 into :ldt_fecha_venc_max ;
			end if
		else
			ll_cant_cupones	= gi_cant_cup
			if ll_cant_cred > 1 then
				ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
			end if
			DECLARE x43 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
			execute x43;
			FETCH x43 into :ldt_fecha_venc_max ;
		end if
		SELECT	"CUPONERAS_DETALLE"."NRO_CUPON",
		         "CUPONERAS_DETALLE"."NRO_CUPONERA"
		INTO 		:ll_buscar_cup_termino,
					:ll_num_cuponera
		FROM 	"CUPONERAS_DETALLE"  
		WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
				 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
				 (  "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) and
				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
		USING		sqlca;
		if sqlca.sqlcode <> 0 then
			SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
			INTO 		:ldt_fecha_venc_max  
			FROM 	"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 (  "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) and
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
			USING	sqlca;
		end if
		UPDATE	"CUPONERAS_DETALLE"  
		SET 		"IP_PRINT" = :gs_tcp_ip,   
					"USUARIO_PRINT" = :gs_user  
		WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND
				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND
				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
				 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
				 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
				 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			if ls_print_mant = 'S' then
				UPDATE	"CUPONERAS_DETALLE"  
				SET 		"IP_PRINT" = :gs_tcp_ip,   
							"USUARIO_PRINT" = :gs_user  
				WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
						 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
						 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
						 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
						 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
		else
			rollback;
		end if
		dw_cuponeras.DATAOBJECT = "dw_imprimir_cuponera_ctacte"
		dw_cuponeras.SetTransObject(SQLCA)
		if dw_cuponeras.Retrieve(ll_cod_parque,gs_user,gs_tcp_ip)=0 then
			messagebox("Advertencia","No Registra Datos")
			close(w_print_vista_cupones)
		else
			dw_cuponeras.object.datawindow.Print.Preview	= true
		end if
	end if

elseif isvalid(w_administrar_cuponera) then
	if gs_depto='I' then
		cb_filtrar.visible	= true
	else
		cb_filtrar.visible	= false
	end if
	w_administrar_cuponera.dw_parque.accepttext()
	ll_cod_parque	= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
	if gs_cuponera_aviso = '0' then//Cuponera ==> 0
		CHOOSE CASE w_administrar_cuponera.tab_1.SelectedTab
			CASE 1
				w_administrar_cuponera.tab_1.tabpage_1.dw_lista.accepttext()
				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.rowcount()
				ll_fila							= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.Find("estado = 0", 1, ll_tot_reg)
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'estado')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'base')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero')
						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
						INTO   	:ll_cant_mant,                              						:ll_cant_cred
						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   ;
						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'nro_cuponera')
						ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_inicial')
						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_final')
						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_fecha_venc_min  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_base='O' or ls_base='C' or ls_base='U' then
								SELECT	"CADENA"."RUT"  
								INTO 		:ll_rut_aux  
								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = 'L' ) AND  
										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_print_mant	= 'N'
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x1 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x1;
									FETCH x1 into :ldt_fecha_venc_max ;
								else
									ls_print_mant	= 'S'
									ll_cant_cupones	= gi_cant_cup - 3
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x2 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x2;
									FETCH x2 into :ldt_fecha_venc_max ;
								end if
							else
								ll_cant_cupones	= gi_cant_cup
								if ll_cant_cred > 1 then
									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
								end if
								DECLARE x3 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
								execute x3;
								FETCH x3 into :ldt_fecha_venc_max ;
							end if
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_buscar_cup_termino
							FROM 	"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fecha_venc_max  
								FROM 	"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
							end if
							UPDATE	"CUPONERAS_DETALLE"  
							SET 		"IP_PRINT" = :gs_tcp_ip,   
										"USUARIO_PRINT" = :gs_user  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								if ls_print_mant = 'S' then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"IP_PRINT" = :gs_tcp_ip,   
												"USUARIO_PRINT" = :gs_user  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								rollback;
							end if
						end if
					end if
				next
				
			CASE 3
				w_administrar_cuponera.tab_1.tabpage_3.dw_genera.accepttext()
				ll_tot_reg	= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.rowcount()
				ll_fila		= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.Find("genera = 0", 1, ll_tot_reg)
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'genera')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_codigo')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cadena_numero')
						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
						INTO   	:ll_cant_mant,                              						:ll_cant_cred
						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   ;
						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
						ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_final')
						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_fecha_venc_min  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_base='O' or ls_base='C' or ls_base='U' then
								SELECT	"CADENA"."RUT"  
								INTO 		:ll_rut_aux  
								FROM 	"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = 'L' ) AND  
										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_print_mant	= 'N'
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x11 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x11;
									FETCH x11 into :ldt_fecha_venc_max ;
								else
									ls_print_mant	= 'S'
									ll_cant_cupones	= gi_cant_cup - 3
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x12 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x12;
									FETCH x12 into :ldt_fecha_venc_max ;
								end if
							else
								ll_cant_cupones	= gi_cant_cup
								if ll_cant_cred > 1 then
									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
								end if
								DECLARE x13 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
								execute x13;
								FETCH x13 into :ldt_fecha_venc_max ;
							end if
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_buscar_cup_termino
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fecha_venc_max  
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
							end if
							UPDATE	"CUPONERAS_DETALLE"  
							SET 		"IP_PRINT" = :gs_tcp_ip,   
										"USUARIO_PRINT" = :gs_user  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								if ls_print_mant = 'S' then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"IP_PRINT" = :gs_tcp_ip,   
												"USUARIO_PRINT" = :gs_user  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								rollback;
							end if
						end if
					end if
				next
				
			CASE 4
				w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.accepttext()
				ll_tot_reg	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.rowcount()
				ll_fila		= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.Find("genera = 0", 1, ll_tot_reg)
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'genera')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_codigo')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cadena_numero')
						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
						INTO   	:ll_cant_mant,                              						:ll_cant_cred
						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   ;
						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
						ll_cup_ini			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_final')
						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_fecha_venc_min  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_base='O' or ls_base='C' or ls_base='U' then
								SELECT	"CADENA"."RUT"  
								INTO 		:ll_rut_aux  
								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = 'L' ) AND  
										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_print_mant	= 'N'
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x21 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x21;
									FETCH x21 into :ldt_fecha_venc_max ;
								else
									ls_print_mant	= 'S'
									ll_cant_cupones	= gi_cant_cup - 3
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x22 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x22;
									FETCH x22 into :ldt_fecha_venc_max ;
								end if
							else
								ll_cant_cupones	= gi_cant_cup
								if ll_cant_cred > 1 then
									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
								end if
								DECLARE x23 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
								execute x23;
								FETCH x23 into :ldt_fecha_venc_max ;
							end if
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_buscar_cup_termino
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fecha_venc_max  
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
							end if
							UPDATE	"CUPONERAS_DETALLE"  
							SET 		"IP_PRINT" = :gs_tcp_ip,   
										"USUARIO_PRINT" = :gs_user  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								if ls_print_mant = 'S' then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"IP_PRINT" = :gs_tcp_ip,   
												"USUARIO_PRINT" = :gs_user  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								rollback;
							end if
						end if
					end if
				next
				
			CASE 6
				w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.accepttext()
				ll_tot_reg	= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.rowcount()
				ll_fila		= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.Find("estado = 0", 1, ll_tot_reg)
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'estado')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'base')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'numero')
						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
						INTO   	:ll_cant_mant,                              						:ll_cant_cred
						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   ;
								
						SELECT	"CUPONERAS"."NRO_CUPONERA",	"CUPONERAS"."CUPON_INICIAL",	"CUPONERAS"."CUPON_FINAL"  
						INTO 		:ll_num_cuponera,					:ll_cup_ini,						:ll_cup_fin
						FROM 		"CUPONERAS"  
						WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   ;

						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_fecha_venc_min  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_base='O' or ls_base='C' or ls_base='U' then
								SELECT	"CADENA"."RUT"  
								INTO 		:ll_rut_aux  
								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 (("CADENA"."CODIGO" = 'L' ) AND  
										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_print_mant	= 'N'
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x31 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x31;
									FETCH x31 into :ldt_fecha_venc_max ;
								else
									ls_print_mant	= 'S'
									ll_cant_cupones	= gi_cant_cup - 3
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x32 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x32;
									FETCH x32 into :ldt_fecha_venc_max ;
								end if
							else
								ll_cant_cupones	= gi_cant_cup
								if ll_cant_cred > 1 then
									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
								end if
								DECLARE x33 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
								execute x33;
								FETCH x33 into :ldt_fecha_venc_max ;
							end if
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_buscar_cup_termino
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fecha_venc_max  
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
							end if
							UPDATE	"CUPONERAS_DETALLE"  
							SET 		"IP_PRINT" = :gs_tcp_ip,   
										"USUARIO_PRINT" = :gs_user  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								if ls_print_mant = 'S' then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"IP_PRINT" = :gs_tcp_ip,   
												"USUARIO_PRINT" = :gs_user  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								rollback;
							end if
						end if
					end if
				next
		END CHOOSE
		dw_cuponeras.DATAOBJECT = "dw_imprimir_cuponera"
		dw_cuponeras.SetTransObject(SQLCA)
		if dw_cuponeras.Retrieve(ll_cod_parque,gs_user,gs_tcp_ip)=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			dw_cuponeras.object.datawindow.Print.Preview	= true
		end if
	elseif gs_cuponera_aviso = '1' THEN//Aviso Mantencion ==> 1
		ll_pasa				= 0
		dw_cuponeras.dataobject = "dw_print_cupon_aviso_mantencion"
		dw_cuponeras.SetTransObject(SQLCA)
		ll_mes							= month(today())
		ll_year							= year(today())
		ll_mes_sgte						= ll_mes + 1
		if ll_mes_sgte>12 then
			ll_year ++
			ll_mes_sgte					= 1
		end if
		ls_fec_inicial					= '01/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		if ll_mes_sgte=1 or ll_mes_sgte=3 or ll_mes_sgte=5 or ll_mes_sgte=7 or ll_mes_sgte=8 or &
			ll_mes_sgte=10 or ll_mes_sgte=12 then
			ls_fec_final				= '31/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		elseif ll_mes_sgte=2 then
			if (ll_year/4) = int(ll_year/4) then
				ls_fec_final			= '29/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
			else
				ls_fec_final			= '28/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
			end if
		elseif ll_mes_sgte=4 or ll_mes_sgte=6 or ll_mes_sgte=9 or ll_mes_sgte=11 then
			ls_fec_final				= '30/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		end if
		ldt_fecha_ini_mes				= datetime(date(ls_fec_inicial),lt_ini)
		ldt_fecha_fin_mes				= datetime(date(ls_fec_final),lt_fin)
		ll_cod_parque					= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
		if dw_cuponeras.retrieve(ldt_fecha_ini_mes,ldt_fecha_fin_mes,ll_cod_parque)=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			dw_cuponeras.object.datawindow.Print.Preview	= true
		end if
	end if
else
	close(w_print_vista_cupones)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_filtrar from commandbutton within w_print_vista_cupones
integer x = 613
integer y = 1992
integer width = 306
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_cuponeras.SETfilter(NULO)
dw_cuponeras.filter()

end event

type cb_cancelar from commandbutton within w_print_vista_cupones
integer x = 3534
integer y = 1992
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_print_vista_cupones)
end event

type cb_imprimir from commandbutton within w_print_vista_cupones
integer x = 46
integer y = 1992
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;String	ls_base,ls_serie,ls_base_valid,ls_serie_valid,ls_tipo_msg
Long		ll_cant,ll_rut,ll_max_corr,ll_indi,ll_tot_reg,ll_mora_cred,ll_mora_mant,ll_count,ll_count2
Datetime	ldt_max_venc_cred_print,ldt_fecha_hoy
Time		lt_time
Double	ll_numero,ll_numero_valid

SetPointer(HourGlass!)
if dw_cuponeras.rowcount() > 0 then
	ls_base_valid		= dw_cuponeras.getitemstring(1,'cuponeras_detalle_base')
	ls_serie_valid		= dw_cuponeras.getitemstring(1,'cuponeras_detalle_serie')
	ll_numero_valid	= dw_cuponeras.getitemnumber(1,'cuponeras_detalle_numero')
	
	SELECT 	count("SOL_ESTATUS"."NUMERO")
	INTO 		:ll_count  
	FROM 	"SOL_ESTATUS"  
	WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
				( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
				( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
				("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR  
				"SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
				"SOL_ESTATUS"."ESTADO_REG" = 'A'
	USING sqlca;
	if ll_count > 0 then ls_tipo_msg = 'P'
	
	SELECT 	count("CONVENIO"."NUMERO")
	INTO 		:ll_count2 
	FROM 	"CONVENIO"  
	WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
				( "CONVENIO"."NUMERO" = :ll_numero_valid )   ;
	if ll_count2 > 0 then ls_tipo_msg = 'C'
	
	if ll_count = 0 and ll_count2 = 0 then
		lt_time			= time('00:00:00')
		ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_time)
		f_Print( dw_cuponeras )
		if gs_cuponera_aviso = '0' then
			DECLARE x1 CURSOR FOR  
			SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
			FROM 					"CUPONERAS_DETALLE"  
			WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
								 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
			ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
			USING					sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode = 0
					fetch x1 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
					if ll_numero > 0 then
						SELECT	"CUPONERAS"."CANT_PRINT"  
						INTO 		:ll_cant  
						FROM 		"CUPONERAS"  
						WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :ll_numero )   
						USING		Trans_1;
						if isnull(ll_cant) then ll_cant=0
						ll_cant ++
						SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_max_venc_cred_print  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
								 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
						USING		Trans_1;
						if Trans_1.sqlcode<>0 then
							setnull(ldt_max_venc_cred_print)
						end if
						UPDATE	"CUPONERAS"  
						SET 		"CANT_PRINT" = :ll_cant,
									"ULT_FECHA_VENC_CRED_PRINT" = :ldt_max_venc_cred_print
						WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :ll_numero )   
						USING		Trans_2;
						if Trans_2.sqlcode=0 then
							commit using Trans_2;
						else
							rollback using Trans_2;
						end if
						INSERT INTO "CARTA_LOG"  
									( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  "COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
						VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	0,			6,					0,						0,					'',					:gs_user )  
						USING		Trans_4;
						if Trans_4.sqlcode = 0 then
							commit using Trans_4;
						else
							rollback using Trans_4;
						end if
					end if
				LOOP
			end if
			close x1;
		else
			ll_tot_reg		= dw_cuponeras.rowcount()
			for ll_indi=1 to ll_tot_reg
				ls_base		= dw_cuponeras.getitemstring(ll_indi,'cuponeras_detalle_base')
				ls_serie		= dw_cuponeras.getitemstring(ll_indi,'cuponeras_detalle_serie')
				ll_numero	= dw_cuponeras.getitemnumber(ll_indi,'cuponeras_detalle_numero')
				ll_rut		= dw_cuponeras.getitemnumber(ll_indi,'cuponeras_detalle_rut')
				SELECT	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT"  
				INTO 		:ll_mora_cred,					:ll_mora_mant  
				FROM 		"CADENA_MORA"  
				WHERE  ( "CADENA_MORA"."BASE" = :ls_base ) AND  
						 ( "CADENA_MORA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA_MORA"."NUMERO" = :ll_numero )   ;
				if isnull(ll_mora_cred) then ll_mora_cred=0
				if isnull(ll_mora_mant) then ll_mora_mant=0
				INSERT INTO "CARTA_LOG"  
							( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  		"COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	:ll_mora_cred,	4,					0,						:ll_mora_mant,	'0',					:gs_user )  
				USING		Trans_4;
				if Trans_4.sqlcode = 0 then
					commit using Trans_4;
				else
					rollback using Trans_4;
				end if
			next
		end if
	else
		if ls_tipo_msg = 'P' then
			messagebox('Advertencia','Contrato Tiene Solicitud PAC/PAT Activa')
		elseif 	ls_tipo_msg = 'C' then
			messagebox('Advertencia','Contrato Tiene Convenio Activo')
		end if	
	end if	
end if
SetPointer(Arrow!)
Close(w_print_vista_cupones)


//String	ls_base,ls_serie
//Long		ll_cant,ll_rut,ll_max_corr,ll_indi,ll_tot_reg,ll_mora_cred,ll_mora_mant
//Datetime	ldt_max_venc_cred_print,ldt_fecha_hoy
//Time		lt_time
//Double	ll_numero
//
//SetPointer(HourGlass!)
//if dw_cuponeras.rowcount() > 0 then
//	lt_time			= time('00:00:00')
//	ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_time)
//	f_Print( dw_cuponeras )
//	if gs_cuponera_aviso = '0' then
//		DECLARE x1 CURSOR FOR  
//		SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
//		FROM 					"CUPONERAS_DETALLE"  
//		WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
//							 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
//		ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
//		USING					sqlca;
//		open x1;
//		if sqlca.sqlcode=0 then
//			DO WHILE sqlca.sqlcode = 0
//				fetch x1 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
//				if ll_numero > 0 then
//					SELECT	"CUPONERAS"."CANT_PRINT"  
//					INTO 		:ll_cant  
//					FROM 		"CUPONERAS"  
//					WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//					USING		Trans_1;
//					if isnull(ll_cant) then ll_cant=0
//					ll_cant ++
//					SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//					INTO 		:ldt_max_venc_cred_print  
//					FROM 		"CUPONERAS_DETALLE"  
//					WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//							 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
//							 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user ) AND  
//							 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
//					USING		Trans_1;
//					if Trans_1.sqlcode<>0 then
//						setnull(ldt_max_venc_cred_print)
//					end if
//					UPDATE	"CUPONERAS"  
//					SET 		"CANT_PRINT" = :ll_cant,
//								"ULT_FECHA_VENC_CRED_PRINT" = :ldt_max_venc_cred_print
//					WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//					USING		Trans_2;
//					if Trans_2.sqlcode=0 then
//						commit using Trans_2;
//					else
//						rollback using Trans_2;
//					end if
//					INSERT INTO "CARTA_LOG"  
//								( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  "COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
//					VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	0,			6,					0,						0,					'',					:gs_user )  
//					USING		Trans_4;
//					if Trans_4.sqlcode = 0 then
//						commit using Trans_4;
//					else
//						rollback using Trans_4;
//					end if
//				end if
//			LOOP
//		end if
//		close x1;
//	else
//		ll_tot_reg		= dw_cuponeras.rowcount()
//		for ll_indi=1 to ll_tot_reg
//			ls_base		= dw_cuponeras.getitemstring(ll_indi,'cuponeras_detalle_base')
//			ls_serie		= dw_cuponeras.getitemstring(ll_indi,'cuponeras_detalle_serie')
//			ll_numero	= dw_cuponeras.getitemnumber(ll_indi,'cuponeras_detalle_numero')
//			ll_rut		= dw_cuponeras.getitemnumber(ll_indi,'cuponeras_detalle_rut')
//			SELECT	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT"  
//			INTO 		:ll_mora_cred,					:ll_mora_mant  
//			FROM 		"CADENA_MORA"  
//			WHERE  ( "CADENA_MORA"."BASE" = :ls_base ) AND  
//					 ( "CADENA_MORA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA_MORA"."NUMERO" = :ll_numero )   ;
//			if isnull(ll_mora_cred) then ll_mora_cred=0
//			if isnull(ll_mora_mant) then ll_mora_mant=0
//			INSERT INTO "CARTA_LOG"  
//						( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  		"COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
//			VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	:ll_mora_cred,	4,					0,						:ll_mora_mant,	'0',					:gs_user )  
//			USING		Trans_4;
//			if Trans_4.sqlcode = 0 then
//				commit using Trans_4;
//			else
//				rollback using Trans_4;
//			end if
//		next
//	end if
//end if
//SetPointer(Arrow!)
//Close(w_print_vista_cupones)
end event

type dw_cuponeras from datawindow within w_print_vista_cupones
integer x = 46
integer y = 36
integer width = 3835
integer height = 1920
integer taborder = 10
string dataobject = "dw_print_cupon_aviso_mantencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

